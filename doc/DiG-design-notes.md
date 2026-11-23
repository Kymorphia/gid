# DiG - D in GObject

This started as a design only. Phases 1 and 2 are implemented, see sections 7 and 8 for what is implemented and where the implementation deviates from this design.

The following document is a proposal for implementing functionality in giD to create GObject derived classes which can be integrated natively in C.
Examples of this include: creating new GtkWidget classes using the snapshot framework, GStreamer elements, and GIO streams.
Such widgets could be instantiated in builder UI files and integrate into GObject and Gtk for use in D applications.

Additional design proposals also describe extending giD to create GIR bindings to D libraries.
This would provide the ability to create D libraries which have GIR C APIs which can be used from any other language with GObject binding support.
This functionality would be provide convenient mixins and attributes (UDAs) for exposing D classes and interfaces to the GObject type system.
The gidgen utility will then be able to export the resulting GIR XML API descriptions for the D library.

## 1. Current state

giD can *consume* GObject types from D. It cannot yet register a new GType for a D class or fill a class/interface vtable.

**Wrapping and identity.** `gid.gobject2.object.ObjectWrap` (`packages/glib2/gid/gobject2/object.d`) is the root of every GObject proxy. A C instance is bound to its unique D proxy with `g_object_set_qdata` (`gidObjectQuark`) and a toggle ref (`g_object_add_toggle_ref` / `_cObjToggleNotify`) so the D object stays alive while C holds a strong ref, without a ref cycle. `_getDObject!T` returns the existing proxy, or constructs one if needed.

**Class maps.** On first wrap, `createClassMaps` walks loaded `ModuleInfo` and records:

- `gtypeNameClasses`: GType *name* → D `TypeInfo_Class`, from `_gTypeName` (avoids calling `get_type()`, which can have side effects such as `gst_init()`).
- `gtypeClasses`: GType → D class, for types that override `_gType` but not `_gTypeName`.
- `ifaceProxyClasses`: D interface → `IfaceProxy` subclass, used when the concrete GType has no D class.

A D subclass that does not override `_gType` / `_gTypeName` is skipped (`"D subclass without its own GType"`). Function-pointer comparison of those two properties is already used (`(&obj._gType).funcptr !is (&baseObj._gType).funcptr`).

**Construction.** Generated classes expose `this(void* ptr, Flag!"Take" take)` and `_getGType` / `_gType` / `_gTypeName` (`gir/structure.d`). `ObjectWrap.this(GType)` / `createGObject` instantiate an *already registered* C type. The C APIs `g_type_register_static_simple` and `g_type_add_interface_static` are bound, but nothing in giD calls them for a user D class. Interface *consumption* uses a D `interface` plus a mixin of C wrappers (e.g. `gid.gio2.list_model.ListModel` / `list_model_mixin.d`) and `IfaceProxy` for unknown implementors.

**gidgen and virtual methods.** `FuncType.VirtualMethod` and `"virtual-method"` exist in `gir/func.d`, and `fixup()` would mark such funcs `Active.Ignored`. In practice they never reach that path: `gir/repo.d` (`case "virtual-method"`) does `goto noRecurse` and never builds a `Func`. The comment there treats vfuncs as a C implementation detail. Class/interface *structs* are still generated (`GtkWidgetClass`, `GListModelInterface`, `GdkContentProviderClass`, …) with `extern(C)` function-pointer fields, because those come from the GIR record, not from `virtual-method` nodes.

**Class map probe objects.** `createClassMaps` (run lazily the first time a D wrapper class must be looked up) creates an object of every `ObjectWrap` subclass without running its constructor, to read its virtual functions. These probe objects are now freed with `GC.free` (no finalization). Before, the GC finalized them later and ran D destructors of objects that were never constructed. With phase 2 this became visible: a D export class with a destructor that counts live objects went negative in the GTK test.

**Tests.** `gidgen/test/gidgen-test/feat_object.d` has a compute vfunc unittest that only calls the C default (`FeatObject.compute`). The comment already says “D overrides are not supported yet.” The feat GIR (`GidgenFeat-1.0.gir`) declares `compute`, `get_id`, and `get_level` as `<virtual-method>` with matching invokers.

## 2. Naming

A public method (the invoker) and the vfunc often share a GIR name, but they must be distinct in the binding language: the public method should keep calling the C invoker (which may do work around the vfunc), and chain-up must call the *parent vtable*, not the public method (that path re-enters the override and recurses).

### Recommendation

**Use `vfunc` + TitleCase:** `vfuncGetValue`, `vfuncSnapshot`, `vfuncGetNItems`.

Generate a virtual method of that name on the defining class or interface (and therefore on subclasses). Leave the public invoker as it is today (`getValue`, `measure`, `getNItems`), still calling C. Chain-up is `super.vfuncSnapshot(snapshot)`. If two inherited interfaces ever expose the same vfunc name, disambiguate with a qualified form such as `vfuncListModelGetItem` (same problem PyGObject solved with a namespaced `do_` name). That should be rare enough to handle as a defs escape rather than the default.

Do not reserve names by emitting stub vfunc methods before they are hooked up; an override that compiles but is never installed would be worse than a missing symbol. The prefix itself is the reservation: do not generate any other API under `vfunc*`.

## 3. Mechanism

**Type registration.** Lazily register one GType per *user* D class, on first construction or first use of `_getGType`, via `g_type_register_static_simple`. Parent is the bound base type (`gtk_widget_get_type()`, …). Reuse the parent’s class and instance sizes; D fields live on the D object, not in a C instance struct. Implement interfaces with `g_type_add_interface_static`. Override `_gType` and `_gTypeName` on the D class so the existing class maps wrap C-created instances as the concrete D type. A mixin (working name `GObjectSubclass`) is the least invasive hook; a `GObjectSubclass!(Widget)` base template is an alternative but changes how users write the class header.

**Detecting overrides.** Prefer compile-time detection over a required UDA, so a plain `override void vfuncSnapshot(...)` is enough:

- `__traits(isOverrideFunction, MyWidget.vfuncSnapshot)`, or
- the same function-pointer comparison `ObjectWrap` already uses for `_gType`.

The mixin does this for every inherited vfunc and builds a table of slots to install. An optional `@vfunc` UDA (or a fully qualified name) can resolve the rare ambiguous interface case later. Missing required interface vfuncs should be a compile-time or registration-time error, not a NULL vtable crash (`g_list_model_get_item` does not NULL-check).

**class_init / interface_init.** Only fill vtable entries that the D class actually overrides; leave the rest to the C default. Generated `extern(C)` trampolines recover the D object with `_getDObject` (or qdata), marshal arguments with the same code as `deleg_writer.d` (borrowed args, in-place boxed, out/inout, ownership), and call the D method. If the vfunc throws (`GError**`), catch D exceptions and convert them to a `GError` (inverse of the method wrappers). Trampolines must be `nothrow` at the C boundary.

**Chain-up.** The generated default body of `Widget.vfuncSnapshot` (etc.) calls the *parent class* vtable entry (`g_type_class_peek_parent` / the defining class’s parent), never the public invoker and never the current class’s slot (that is the trampoline). Then `super.vfuncSnapshot(s)` does the right thing for both one- and two-level D subclasses.

**instance_init (the hard part).** GtkBuilder, `g_object_new`, and list-model item construction allocate the C instance first, before any D `this()`. `instance_init` (and/or `constructed`) must create the D object with `_d_newclass` (or a dedicated hook) and `_setGObject`, without running a second D constructor that would call `g_object_new` again. The D constructor path is the inverse: register the type, `g_object_new`, then bind; `instance_init` should see qdata already set and no-op. Floating refs on `InitiallyUnowned` / `GtkWidget` are already sunk in `_setGObject`. This object-identity dance is the main runtime risk; toggle refs and GC roots must stay consistent with the existing destructor.

**Later work, not required for the first cut:** D-defined vfuncs, properties, and signals, and GIR/typelib export (section 5). GTK widget templates, CSS names, `bind_template_child`, actions / `install_action`.

## 4. Proposed D API

```d
class ColorBlock : Widget
{
  mixin GObjectSubclass; // lazy GType, class_init, override detection

  this()
  {
    super(); // or: register and g_object_new of ColorBlock's GType
  }

  override gid.gtk4.types.SizeRequestMode vfuncGetRequestMode()
  {
    return gid.gtk4.types.SizeRequestMode.ConstantSize;
  }

  override void vfuncMeasure(gid.gtk4.types.Orientation orientation, int forSize,
      out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    minimum = natural = (orientation == gid.gtk4.types.Orientation.Horizontal) ? 80 : 40;
    minimumBaseline = naturalBaseline = -1;
  }

  override void vfuncSizeAllocate(int width, int height, int baseline)
  {
    super.vfuncSizeAllocate(width, height, baseline);
  }

  override void vfuncSnapshot(gid.gtk4.snapshot.Snapshot snapshot)
  {
    // draw, then optionally chain up
    super.vfuncSnapshot(snapshot);
  }
}

// Public invokers are unchanged and still go through C:
auto w = new ColorBlock;
w.measure(/* ... */);       // gtk_widget_measure → vfunc trampoline → vfuncMeasure
```

```d
class StringList : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
{
  mixin GObjectSubclass;     // registers GType and adds GListModel
  mixin ListModelT!();       // existing public wrappers (getNItems, itemsChanged, …)
  string[] items;

  override gid.gobject2.types.GType vfuncGetItemType() { return ObjectWrap._getGType; }
  override uint vfuncGetNItems() { return cast(uint)items.length; }
  override gid.gobject2.object.ObjectWrap vfuncGetItem(uint position)
  {
    return position < items.length ? /* wrap string or a GObject item */ null : null;
  }
}
```

`FeatObject` can grow a D subclass that overrides `vfuncCompute` and is asserted from `feat_object.d`, next to the existing C-default test.

## 5. Defining new vfuncs in D (exporting GObject types via GIR)

Overriding existing vfuncs (sections 3–4) is enough for custom GTK widgets and `GListModel` implementors. Exporting a *new* GObject type that other languages can subclass needs the same vtable machinery plus a stable C ABI, exported invokers, and GIR/typelib. This is a later milestone; the UDAs and invoker/impl naming should be reserved now.

**Declaring the API.** A D class (or interface) marks members with UDAs. Compile-time introspection of those attributes drives registration, trampolines, and later GIR:

```d
class Foo : gid.gobject2.object.ObjectWrap
{
  mixin GObjectExport!("Mylib", "Foo"); // GType, class struct, get_type, invokers

  @gProperty("value") int value;

  @gSignal void changed(int value);

  @gMethod @gVirtual void doThing(int x)
  {
    // default implementation; D subclasses override vfuncDoThing
  }
}
```

`@gVirtual` defines a new vfunc (and, with `@gMethod`, a public invoker). `@gMethod` alone is a non-virtual method. `@gSignal` and `@gProperty` declare signals and properties. The implementation method uses the same `vfunc` + TitleCase rule as overrides (`vfuncDoThing`); the public method keeps the short name (`doThing`).

**Class struct and instance layout.** A type that *adds* vfuncs cannot reuse the parent class size. The generated class struct is the parent class struct, then one `extern(C)` function pointer per new vfunc, then reserved padding for ABI growth:

```d
struct MylibFooClass
{
  GObjectClass parentClass;
  extern(C) void function(MylibFoo* self, int x, GError** err) doThing;
  void*[8] padding;
}
```

`GTypeInfo.class_size` is `MylibFooClass.sizeof`. Instance fields that must be visible to C go in a private struct installed in `class_init` (`G_ADD_PRIVATE` / `g_type_class_adjust_private_offset` style) so the public instance struct stays `parent + padding` and can grow without breaking subclasses. Pure D state can still live on the D object.

**class_init and dispatch.** `class_init` writes each new slot to a trampoline that calls the D default implementation (`vfuncDoThing`). A subclass in any language overrides by replacing that slot in its own `class_init`. Dispatch must always go through the vtable, *including calls from D*. Otherwise a Python or C override is skipped when D code calls `foo.doThing(x)`.

That means two D entry points, the same split as for consumed types:

1. Public method `doThing` — an invoker. It does not use D virtual dispatch. It calls the exported C invoker (or inlines the same load-and-call).
2. Implementation method `vfuncDoThing` — the default body, overridable in D with `override`.

```d
// Exported invoker (also the typelib entry point)
extern(C) void mylib_foo_do_thing(MylibFoo* self, int x, GError** err)
{
  auto klass = /* MYLIB_FOO_GET_CLASS(self) */;
  klass.doThing(self, x, err);
}

void doThing(int x)  // D public method: through the slot, so C/Python overrides win
{
  GError* err;
  mylib_foo_do_thing(cast(MylibFoo*)_cPtr, x, &err);
  if (err) throw new ErrorWrap(err, Yes.Take);
}

void vfuncDoThing(int x)  // default impl; D subclasses override this
{
  // ...
}
```

The trampoline installed in `class_init` recovers the D object and calls `vfuncDoThing`. `super.vfuncDoThing(x)` chains to the parent class slot.

**GIR and typelib.** The exported API uses the usual GIR shape, then `g-ir-compiler` for the typelib:

```xml
<class name="Foo" c:symbol-prefix="foo"
       glib:type-name="MylibFoo" glib:get-type="mylib_foo_get_type"
       parent="gid.gobject2.object">
  <property name="value" .../>
  <glib:signal name="changed">...</glib:signal>
  <virtual-method name="do_thing" invoker="do_thing">...</virtual-method>
  <method name="do_thing" c:identifier="mylib_foo_do_thing">...</method>
</class>
<record name="FooClass" glib:is-gtype-struct-for="Foo">
  <field name="parent_class"><type name="gid.gobject2.objectClass"/></field>
  <field name="do_thing"><callback name="do_thing">...</callback></field>
</record>
```

GIR can be written from the UDAs by compile-time introspection, or by filling gidgen’s existing GIR model (`Structure`, `Func`, `Property`, …) and adding a writer — preferable so export and consume stay in sync.

**Practical requirements.** The library is a shared object with an exported `mylib_foo_get_type`. The D runtime must be initialized from a library constructor (`.init` / `pragma(crt_constructor)`), not only `main`. Every exported entry (invokers, `get_type`, trampolines) catches D exceptions and, where the API throws, converts them to `GError`. Calls may arrive on threads the D runtime does not know; those entry points need `thread_attachThis` (or equivalent) before touching D objects. `g_object_new` from Python, C, or GtkBuilder hits the same `instance_init` problem as override support: the C instance exists first, and a D proxy must be bound without a second `g_object_new`.

**Interfaces.** The same pattern applies: an iface struct (`MylibIfaceInterface` with `GTypeInterface` + new slots + padding), `interface_init` installing trampolines, exported invokers that load the iface vtable, `@gVirtual` methods on a D `interface`, and GIR `<interface>` plus a `glib:is-gtype-struct-for` record.

## 6. Phased plan

Proposed giD milestone versions are in parenthesis.

| Phase | Work | Rough effort |
| --- | --- | --- |
| **0. Reserve (1.0)** | Freeze the `vfunc` + TitleCase rule (this note). Do not emit non-working stubs, and do not generate any other `vfunc*` API. Reserve UDA names `@gVirtual`, `@gMethod`, `@gSignal`, `@gProperty` (and the `GObjectExport` mixin name) so export can be added without renaming. Invoker vs impl stays `doThing` / `vfuncDoThing` for both consumed and D-defined vfuncs. | A day of docs / policy; finals only if agreed |
| **1. Overrides of existing vfuncs (1.1)** | Parse `virtual-method` in `repo.d`. Generate `vfunc*` methods, trampolines, chain-up, and `GObjectSubclass` registration. Interface `interface_init` (`GListModel` and friends) and required-vfunc checks. Prove with `FeatObject.vfuncCompute` and a GTK4 `Widget` (`vfuncSnapshot` / `vfuncMeasure` / `vfuncGetRequestMode` / `vfuncSizeAllocate`) under xvfb. Reuse callback matrix cases; GError ↔ D exceptions; GStreamer / GIO stream `*_fn` as extra proving grounds. Zero new generator warnings, package builds green. C-first `instance_init` for D subclasses of *existing* types (GtkBuilder / `g_object_new`) is part of this phase — it is also a prerequisite for export. | ~2–4 weeks (the original class / interface / marshalling cut) |
| **2. D-defined GTypes constructible from C (1.2)** | User D classes register a real GType with exported `*_get_type`, so Python/C can `g_object_new` them. Library constructor for D runtime init, `thread_attachThis` at exported entries, and a solid `instance_init` path when construction starts in another language. No new vfuncs required yet: a D `Widget` or `ObjectWrap` subclass with only inherited slots is enough to prove identity and lifetime. | Separate milestone |
| **3. New vfuncs, signals, and properties (2.0)** | `@gVirtual` / `@gMethod` / `@gSignal` / `@gProperty`. Custom class / iface structs (parent + new slots + padding), `class_size`, private instance data, exported invokers that dispatch through the slot, and default-impl trampolines. Public D methods also go through the slot so foreign overrides are honored. | Separate milestone, builds on 1–2 |
| **4. GIR + typelib output (2.0)** | Emit `<class glib:get-type>`, `<record glib:is-gtype-struct-for>` with callback fields, `<virtual-method invoker=…>`, and `<method c:identifier=…>` (plus signals and properties). Prefer writing through gidgen’s GIR model. Compile typelib with `g-ir-compiler` and verify a PyGObject / GJS subclass of a D type. | Separate milestone, builds on 3 |

GTK templates, CSS names, `bind_template_child`, and actions remain after these four.

**Risks (overrides, phase 1).** (1) C-first construction vs D constructors (double `g_object_new`, missed `constructed`, leaked toggle refs). (2) Installing a trampoline for a slot the D class did not mean to override — or failing to install a required interface slot. (3) `super.vfuncX` accidentally calling the trampoline (infinite recursion). (4) Exceptions escaping into C. (5) Same vfunc name on two interfaces. (6) Class-map and `_gTypeName` interactions with lazily registered D types.

**Risks (export, phases 2–4).** (7) ABI: class struct padding, private-data offsets, and typelib vs shared-library skew. (8) D runtime not initialized, or a foreign thread not attached, when another language first calls `*_get_type` or an invoker. (9) D public methods using D virtual dispatch and silently ignoring C/Python overrides. (10) GIR written by a second, divergent model instead of gidgen’s.

## 7. Implementation notes (phase 1)

Status of phase 1 and deviations from the design above.

**vfunc methods and trampolines.** Implemented as designed: `vfunc*` methods call the C implementation of the nearest class which is not a D subclass type (`ObjectWrap._vfuncClass`), and each GObject class has an `_installVfuncs(T)(void* klass)` template that installs a trampoline for every `vfunc*` method `T` overrides (detected with `__traits(parent, __traits(getOverloads, T, "vfuncX", true)[0])`, which ignores visibility so protected overrides in other modules can be inspected; a function-pointer comparison is not needed). Overriding a vfunc which has no trampoline is a `static assert` in the installer, which fires when the `GObjectSubclass` mixin of the class is compiled. Interface vfuncs are described below.

**`GObjectSubclass` mixin (`mixin GObjectSubclass;` or `mixin GObjectSubclass!"TypeName";`).** Adds a static `_getGType` which registers the GType on first use with `g_type_register_static_simple` (double checked with an atomic load and `synchronized`), and overrides `_gType`, `_gTypeName` and a new `ObjectWrap._dSubclassGType` (0 for classes without the mixin). The parent GType is `_getGType` of the D base class, so it is the bound C type or the GType of a D base class which also uses the mixin; every D class using the mixin gets its own GType, a D subclass without the mixin uses the GType of its base. Class and instance sizes are those of the parent (`g_type_query`). class_init calls `T._installVfuncs!T`. The GType is flagged with `gidSubclassQuark` qdata, which deviates slightly: the qdata stores the D `TypeInfo_Class`, which `_getDObject` uses to create the right D class for an unbound instance, and D subclass classes are left out of the class maps (`createClassMaps`), so they never need `_gTypeName` (and registration) for class map lookups.

**Type names.** The default name is `D` + the fully qualified D class name with every character which is not valid in a GType name replaced by `_` (`app.MyWidget` → `Dapp_MyWidget`). This mapping is not injective (`a_b.c` and `a.b_c`), and the name can clash with a C type or another D class. The type name must be unique: if it is already registered, registration fails (a critical is logged once, `_getGType` stays 0, and constructing the class does not create an instance). Pass `typeName` to the mixin to choose a different name (the stable name to use in GtkBuilder files).

**Construction from D (deviation: no `_d_newclass` dance in the constructor path).** Generated constructors create the C type (`gtk_button_new`), which is the core problem. Rather than bypassing them with a separate D construction path, gidgen makes them D subclass aware:

- The primary constructor of a GObject class (`this()` calling `gtk_button_new()` etc.) starts with `if (auto _dType = _dSubclassGType) this(_newDSubclassGObject(_dType), Yes.Take); else { …existing code… }`. Classes without the mixin take the existing path (one virtual call).
- GObject classes without a primary constructor callable without arguments (`Widget`, `ObjectWrap`, abstract types) get a `protected this()` doing the same, so `super()` (or the implicit base constructor call) works in D subclasses. For D subclasses without the mixin it creates an instance of `_gType` (like `ObjectWrap.this(GType)`).
- `_newDSubclassGObject` sets a thread local "D object under construction" and calls `g_object_new_with_properties`. The `instance_init` of the D subclass GType binds that D object (`_bindGObject`: qdata, toggle ref, GC root) before any later initialization, so virtual methods called during `g_object_new` (`vfuncConstructed`, …) reach the D object, before the body of its D constructor runs. Afterwards the creation reference is dropped (floating references are sunk first), leaving only the toggle reference, as for any other D created object. `ObjectWrap.this(void*, Flag!"Take")` ignores the pointer when it is the already bound instance.

Tradeoff: every generated primary constructor gets a few more lines and all GObject classes without one get a protected constructor, but D subclass construction reuses the normal constructor chain, no generated `new` function is called for a D subclass, and plain D subclasses (without the mixin) behave as before. **Limitation:** arguments of base class constructors are not mapped to construct properties; passing any (`super("label")`) logs a critical and they are ignored. Set the properties after `super()` instead. Mapping arguments to construct properties is future work.

**Instances created from C (`g_object_new`, GtkBuilder).** Implemented in phase 1 as planned: `instance_init` of the nearest D subclass type of the instance creates the D object. If the class has a public default constructor it is run (with a thread local "adopt this instance" marker, so `_newDSubclassGObject` binds the instance instead of creating a new one); otherwise the D object is created without running a constructor (`_d_newclass`, as when wrapping). The instance keeps the C caller's (possibly floating) reference and gets the toggle reference, so lifetime is the same as for wrapped C objects. Caveats: the D constructor runs inside `instance_init`, before construct properties are set and before more derived (non D) instance_inits; instance_inits of ancestor types run before the D object exists, so vfuncs they call reach the C implementation. Threads not known to the D runtime are attached in `instance_init` since phase 2 (section 8).

**dispose and finalize.** `gid.gobject2.object.dispose` and `finalize` are ignored (`defs/gobject2.d`), so there are no `vfuncDispose` / `vfuncFinalize` methods to override. The D destructor clears the qdata and removes the toggle reference before the final unref, so dispose on destruction and finalize always run without a D object (a D override would silently not be called), and the only time dispose would reach a bound D object is `g_object_run_dispose()` (e.g. `gtk_window_destroy`). Use the D destructor or signals for cleanup. Supporting them needs a lifetime design where the C object owns the D object (phase 2 or later).

**Interface vfuncs (`interface_init`).** Interface `vfunc*` methods are generated only in the interface mixin template (`ListModelT`, `BuildableT`, …), not in the D `interface`: D interface members can't be protected, and an interface declaration would force every implementer to define them publicly. They are `protected`, marked with the `@GidIfaceVfunc` UDA, and chain up through `g_type_interface_peek(_vfuncClass, Iface._getGType)`. `_vfuncClass` skips every D subclass GType, so this is the interface structure of the nearest C class: chaining up from any number of D levels never reaches a trampoline, and it is NULL (a no-op returning the default value) when no C ancestor implements the interface. The mixin also has `_ifaceVfuncsOverridden_<iface>(T)` and `_installIfaceVfuncs_<iface>(T)`, plus a private `_installIfaceVfunc_<iface>` holding the trampolines. The names carry the interface as a suffix because same-named declarations from different mixins are ambiguous. Trampolines cast the D object to `typeof(this)` (the class the mixin is mixed into) and call its vfunc method virtually. Overrides are detected by the UDA: a vfunc method resolved through `T` (with `getOverloads`) that lacks `@GidIfaceVfunc` is an override or implementation. A `__traits(parent)` comparison does not work here: an implementation declared in the same class as the mixin hides the mixin's declaration, even from inside the mixin. Unsupported interface vfuncs follow the class vfunc policy (info count plus reason, `static assert` when overridden).

- **Case A** (a C ancestor implements the interface, e.g. `MyBox : Box` overriding `Buildable.vfuncAddChild`): the user writes `override protected …` and can use `super.vfuncX()`.
- **Case B** (the D class newly implements it, e.g. `class StrList : ObjectWrap, ListModel { mixin ListModelT!(); mixin GObjectSubclass; protected uint vfuncGetNItems() … }`): implementations are declared without `override` and hide the mixin's defaults. There is nothing to chain up to; the mixin default is a no-op. A D subclass of such a class overrides normally with `super`.
- **Registration:** `_registerDSubclass!T` calls `g_type_add_interface_static` for each GObject interface in `InterfacesTuple!T`, prerequisites first and each once, when `T` overrides one of its vfuncs or the parent GType does not implement it. This happens right after `g_type_register_static_simple`, before the class is initialized. In Case A, GObject copies the parent's interface structure before `interface_init`, so slots that are not overridden keep the C implementations (verified in tests). In Case B, slots that are not implemented stay NULL (or hold the interface defaults).
- **Name collisions:** an interface vfunc method name that collides with a class vfunc method or another interface's vfunc in some implementing class (or with a prerequisite's vfunc) is qualified with the interface name, everywhere, since a mixin is shared: `atk.Action.vfuncActionGetName`, `atk.Component.vfuncComponentGetLayer`, `gio.Seekable.vfuncSeekableSeek` (19 methods, logged at info level).
- **Limitations:** required interface vfuncs are not checked. A Case B class that does not implement a required slot (e.g. `ListModel.get_item`) leaves it NULL, which C callers may not check. Interface mixins must be imported without a selective import list (as for the existing mixins), so their public imports reach the class. String returns with transfer none are not supported in trampolines (`Buildable.get_id`, many ATK getters). Interface vfuncs of D-defined interfaces are phase 3.

## 8. Implementation notes (phase 2)

Phase 2 makes D subclass GTypes usable from C and other languages: a D shared library exports `*_get_type` functions, initializes the D runtime itself and accepts calls from threads created by C. No new vfuncs, signals or properties are defined in D yet (phase 3), and no GIR is written.

**`GObjectExport(string ns, string name, string cSymbol = null)`** (`defs/gobject2-object.d`). It includes `GObjectSubclass!(ns ~ name, true)`, so a class uses one or the other, not both. Everything from phase 1 applies (registration, class and interface vfunc installers, `instance_init` binding). It adds:

- An exported C function, `pragma(mangle, sym) export extern(C) static GType _gidExportGetType() nothrow`, which calls `gidInitRuntime()` and `gidAttachThread()`, then returns `_getGType()`. Registration stays lazy and thread safe on the first call. The default symbol follows the GObject type macro convention: namespace and name converted from CamelCase to lower snake case, plus `_get_type`. So `("Mylib", "FooBar")` gives `mylib_foo_bar_get_type` and `("Gtk", "HTTPServer")` gives `gtk_http_server_get_type` (`ObjectWrap._exportGetTypeSymbol`). Names where the heuristic doesn't match the wanted C API (e.g. `DBus`) pass `cSymbol`. GtkBuilder guesses the same names (`DigWidget` gives `dig_widget_get_type`), so `<object class="DigWidget">` works before the type is registered, as long as the library is loaded globally (linked or `RTLD_GLOBAL`).
- A `pragma(crt_constructor)` static function that calls `gidInitRuntime()` when the library is loaded. This works on static member functions of mixin templates in classes, and module constructors of the library still run (they are run by `rt_init`).

**Namespace declaration (`GObjectNamespace(string ns, string symbolPrefix = null)`).** This mixin goes at module scope, either in the module of the exported classes or in a module they import, e.g. the library's `package.d`, including through public imports. It declares the public enums `_gidNamespace` and `_gidSymbolPrefix`; the prefix defaults to the snake case of the namespace. They are public because private module symbols aren't visible through imports. The namespace is checked at compile time: it must start with an ASCII letter, followed by letters and digits.

`GObjectExport(string ns = null, string name = null, string cSymbol = null)` takes its defaults from there:
- ns defaults to the declared namespace, found by normal lookup from the class (the mixin template body resolves names in the instantiation scope). With neither given, a static assert suggests `mixin GObjectNamespace!("Mylib");` or passing ns.
- name defaults to the D class name.
- The get_type symbol is `cSymbol` if given. Otherwise it uses the declared symbol prefix (`prefix ~ "_" ~ snake(name) ~ "_get_type"`) when the namespace is the declared one, whether defaulted or passed explicitly with the same value. An explicit, different namespace keeps the phase 2 symbol `_exportGetTypeSymbol(ns, name)`, so the explicit form behaves as before. The exception is an explicit namespace equal to a declaration whose prefix differs from the snake case of the namespace: then the prefix is used.

So `mixin GObjectNamespace!("Mylib");` plus `mixin GObjectExport;` gives `MylibFoo` / `mylib_foo_get_type`, and `GObjectNamespace!("MyLib", "mylib")` gives `mylib_foo_get_type` instead of `my_lib_foo_get_type`. Two visible declarations are ambiguous, which is a compile error. Phase 4 (GIR export) will use the same declaration for the C symbols of exported methods and for the GIR `namespace`, `c:identifier-prefixes` and `c:symbol-prefixes`.

**Name collisions.** If the GType name is already registered (by another library, or by two D classes with the same name), registration fails for both `GObjectSubclass` and `GObjectExport`: a "Gid" critical names the GType and the D class (`fullyQualifiedName`) and suggests passing a different `typeName` (or `GObjectExport` name or ns) or renaming the class. `_getGType` stays 0 and the critical is not repeated. Two exported get_type functions with the same symbol name are a link or `dlsym` problem, as in C.

**D runtime initialization** (`gid.gid.gidInitRuntime`). It is idempotent and thread safe (an atomic flag plus a mutex), and calls `Runtime.initialize()` once. `rt_init` is reference counted: in a D program that loads a D library (or links it), `rt_init` only increments the count. The runtime is never terminated by gid (no `rt_term`) for these reasons:

- D objects may be referenced by C until the process exits.
- GTypes are registered statically, so their class and instance functions point into the library forever. GObject can't unregister static types, so a library exporting types must never be `dlclose`d.
- In a D program, the extra count means druntime does not run `rt_term` when main returns, which is harmless.

`gidInitRuntime` is called only by the export entry points. `gidAttachThread` does not initialize the runtime, so a plain D program never gets the extra count. With LDC 1.43 a `dynamicLibrary` links the shared druntime and phobos (`libdruntime-ldc-shared.so`), so several D libraries in one process share one runtime and GC. Exported symbols need `export` (the default visibility is fine on Linux, and `export` is required for Windows DLLs).

**Foreign threads** (`gid.gid.gidAttachThread`). Every C to D entry point calls it first:

- generated vfunc trampolines (class and interface), delegate callback trampolines and signal `_cmarshal` functions (gidgen `DelegWriter.generate`, `SignalWriter`);
- hand written C callbacks in `defs`: `DClosure._cmarshal`, the destroy notifies `thawDelegate`/`ptrThawDestroyNotify`, and the gdk content (de)serializer, gio/gtk compare and sort, gtk3 menu detacher and gst pad getrange callbacks;
- `classInit`, `ifaceInit` and `_dSubclassInstanceInit` of D subclass GTypes;
- `_cObjToggleNotify`;
- exported get_type functions.

The fast path is `Thread.getThis !is null` (a TLS read and a compare). The slow path calls `thread_attachThis()` and sets a value for a pthread key whose destructor calls `thread_detachThis()` when the thread exits. The detach matters: a thread attached with `thread_attachThis` that exits without detaching makes the next `GC.collect` hang in stop-the-world (verified with LDC 1.43: a C program creating a pthread that calls into a D library, then collecting, hangs). Threads stay attached until they exit, because attaching per call would cost too much on hot vfunc paths. On Windows, druntime detaches threads of D DLLs on `DLL_THREAD_DETACH`, so the key is POSIX only. Not covered: free functions registered through `defs` free/copy callbacks (e.g. boxed `freeCb`, which only call C), and D code reached from C by other means than gid entry points (user `extern(C)` functions must call `gidAttachThread()` themselves).

**instance_init identity and lifetime.** These are unchanged from phase 1 and now tested from pure C:

- `g_object_new` from C creates the D object in `instance_init`, running the public default constructor if there is one, so a constructor runs for C-created instances.
- `vfuncConstructed` reaches the bound D object.
- The C caller keeps its reference, which is floating for `GInitiallyUnowned`/`GtkWidget` types and sunk by C as usual. The D object holds the toggle reference, so `ref_count` is 2 after `g_object_new`.
- When C drops its last reference, the toggle notify releases the D object to the GC. The GC finalizes it (D destructor), the deferred final unref runs on the main context, then GObject finalize runs and weak references are notified.
- `_getDObject` on the instance always returns the same D object (wrapper identity).

**Tests.**

- `gidgen/test/gidgen-test/feat_export.d` (D unittests) covers:
  - symbol names;
  - the exported functions called through `extern(C)` declarations;
  - exact names, `g_type_from_name` and inheritance;
  - collisions (critical once, still 0 on retry);
  - C-created instances with class and interface vfunc overrides, and wrapper identity;
  - `g_object_new` on a raw pthread (attached by `instance_init`, D constructor on an attached thread), with `GC.collect` after the thread exits;
  - `gidAttachThread` on a raw pthread;
  - a signal emitted from a raw pthread to a D handler.
- `gidgen/test/export-test/` is a D `dynamicLibrary` exporting `GidgenExportObj` (a subclass of `GidgenFeatObject` overriding class and interface vfuncs, including a throwing one converted to `GError`), `GidgenExportChild` (inheriting them) and `GidgenExportFloating` (`GInitiallyUnowned`, custom symbol). `export_test.c` is a pure C program with no D main, built twice: linked against the library, and with `dlopen` + `dlsym` (checking that the types aren't registered before the get_type call, then found by `g_type_from_name`). It checks:
  - vfuncs, the D `constructed` override, the reference count, floating ref sinking;
  - unref, then GC, then destructor, then finalize (weak ref notified, live D object count back to the start);
  - 4 pthreads each creating 20 objects and exiting before the GC (`alarm` catches a hang).
  - It runs as part of `make run-test` (`make run-test-export`).
- A GTK smoke test (outside the repos, `patches/dig-export-gtk-*`) exports a `GtkWidget` subclass `DigWidget` from a D library. A C GTK program creates it with GtkBuilder (found by guessed symbol), sinks it into a window, measures it and checks finalization after destroy and GC (under xvfb).

**Deviations from the design.**

- `GObjectExport` doesn't generate a class struct or invokers yet: those only make sense with D-defined vfuncs (phase 3).
- The library constructor initializes the runtime, but nothing terminates it.
- Thread attachment is for the lifetime of the thread, not per call.

**`objectMixin` deprecated.** D classes derived from `ObjectWrap` don't need the wrap constructor (`this(void* cObj, Flag!"Take" take)`) that `objectMixin` declared. Their objects are bound to the C instance (qdata and toggle reference) when constructed with `super()`, so `_getDObject` (`Value.get!T`, `ListModel.getItem`, signal parameters) finds the existing D object. If `_getDObject!T` has to create a wrapper for T and T has no wrap constructor, it now logs a critical error and returns null, instead of failing to compile. `ObjectWrap.this(GType)` still works, but called from a `GObjectSubclass` class with a GType that is not (derived from) the class's own GType, it logs a critical error, since the instance then doesn't have the D class's GType and its vfunc overrides aren't used. D subclasses of a `GObjectSubclass` class need their own `mixin GObjectSubclass` to get their own GType.

## 9. Implementation notes (phase 3)

Phase 3 lets a D class declare **new** GObject properties, signals, and virtual methods, so they are visible to C and other languages (and to GIR in phase 4). `@gProperty`, `@gSignal`, `@gVirtual`, and `@gMethod` are the reserved UDAs. Public docs stay short and do not mention internals or phases.

**Module layout.** The public names (`GObjectSubclass`, `GObjectExport`, `GObjectNamespace`, `@gProperty`, `@gSignal`, `gSignalAccumulator`, `@gVirtual`, and the reserved `@gMethod`) live in `gid.gobject2.dig`, `gid.gobject2.dig_property`, `gid.gobject2.dig_signal`, `gid.gobject2.dig_vfunc`, and `gid.gobject2.dig_iface` (`GObjectInterface`) (`defs/gobject2-dig.d` and the `gobject2-dig_*.d` files). `gid.gobject2.object` re-exports them, so `import gid.gobject2.object : GObjectSubclass, gProperty, gSignal;` still works. `ObjectWrap` (wrapping, construction, `_getDObject`, get/set property, signal connect) stays in `gid.gobject2.object`.

### User-facing API (planned)

**Properties (`@gProperty`).** Implemented in step 1. Mark a field or a getter/setter on a `GObjectSubclass` / `GObjectExport` class. The GObject name is the D name in kebab-case (`myValue` → `my-value`), or an explicit name. A field initializer is the default. Flags default to readable/writable from the member; pass `ParamFlags` for construct or construct-only. Supported types: `bool`, integers (`byte`/`ubyte`/`short`/`int`/`uint`/`long`/`ulong`), `float`/`double`, `string`, gid-wrapped boxed and `ObjectWrap` types, and enums/flags that have `_getGType` or `@(gProperty.create(typeName: "GTypeName"))` (needed when giD has no enum `_getGType` binding).

Notify is on-change by default: properties are installed with `G_PARAM_EXPLICIT_NOTIFY`, and `set_property` compares the old and new values and emits `notify` only when they differ. GObject itself notifies on every `g_object_set` unless `EXPLICIT_NOTIFY` is set; well-behaved C types use that flag and compare so handlers do not loop. DiG does the same by default. `@gNotifyAlways` (or `@(gProperty.create(notifyAlways: true))`) leaves `EXPLICIT_NOTIFY` unset so GObject notifies on every set. `ParamFlags.ExplicitNotify` means DiG does no automatic notify; the user calls `notify()`.

```d
class Foo : ObjectWrap
{
  mixin GObjectExport; // or GObjectSubclass

  @gProperty int count = 1;
  @gProperty("full-name") string name;
}
```

**Signals (`@gSignal`).** Implemented in step 2. Mark a public method of a `GObjectSubclass` / `GObjectExport` class: its parameters and return type are the signal signature and its body is the default (class) handler, empty if there is none. The mixin adds `emitFoo(...)` and `connectFoo(callback, after)` for a method `foo`, in the style of the generated bindings (a callback takes the arguments, optionally followed by the instance, and trailing parameters can be left out). C and other languages use `g_signal_connect()` and `g_signal_emit_by_name()`. The name is the D name in kebab-case or an explicit name, flags default to `RunLast`. Phase 4 emits `<glib:signal>`.

```d
class Foo : ObjectWrap
{
  mixin GObjectSubclass;

  @gSignal void changed(int count, string reason) {}
  @gSignal("value-set") void valueSet() {}
  @gSignal(SignalFlags.Detailed | SignalFlags.RunFirst) void tagged(string text) {}
  @gSignal bool handleThing(int what) { return false; }
}

foo.connectChanged((int count, string reason, Foo self) { ... });
foo.emitChanged(3, "because");
```

**New virtual methods (`@gVirtual`, step 3).** Mark a method to add a new slot on a class struct larger than the parent (`class_size` = parent + new function pointers + padding). `class_init` installs a trampoline to the D default (`vfuncDoThing`). D subclasses `override vfuncDoThing`; C and other languages override the slot. The public method (`doThing`, also `@gMethod` when exported) invokes through the slot so a foreign override is used. `super.vfuncDoThing` chains up. Phase 4 emits the class struct, `<virtual-method>`, and the invoker.

**`@gMethod`.** A non-virtual exported method (step 3 or with GIR). Together with `@gVirtual` it is the public invoker.

**`GObjectExport` / `GObjectNamespace`.** Property, signal, and method C names use the declared namespace and symbol prefix (phase 4 GIR `namespace`, `c:identifier-prefixes`, `c:symbol-prefixes`). Until then, properties are already usable from C by their kebab-case names (`g_object_get` / `set`, GtkBuilder). Entry points call `gidAttachThread()`.

**Interfaces defined in D (step 4, if feasible).** A D `interface` with `@gVirtual` methods registers a GType interface, an iface struct with new slots, and `interface_init` trampolines, so C and D classes can implement it.

### Steps

| Step | Work |
| --- | --- |
| **1. Properties** | `@gProperty`, install in `class_init`, get/set dispatch, notify, construct flags, type coverage, tests including C/GtkBuilder |
| **2. Signals** | `@gSignal`, emit and connect, flags, detail, accumulators, tests from D and C (done) |
| **3. New virtual methods** | `@gVirtual`, extended class struct, invokers, trampolines, chain-up, D and C overrides (done; `@gMethod` stays reserved) |
| **4. Interfaces in D** | D-defined GObject interfaces with new vfuncs (done; interface properties and signals, `@gMethod`, and exported C invokers are deferred to GIR export) |

### Step 1 behaviour

Properties are installed in the D class's `class_init` (`g_object_class_install_property`). `get_property` / `set_property` of the class dispatch to the D field or getter/setter and chain up to the parent class for other property IDs. Setting a D field directly does not notify.

**Notify modes.** GObject notifies on every `g_object_set` unless the property has `G_PARAM_EXPLICIT_NOTIFY` (as the GObject docs state; the on-change behaviour people often remember comes from well-behaved C types that set that flag and compare values). DiG installs `EXPLICIT_NOTIFY` by default and notifies only when the value changes (objects by identity, strings and numeric types including floats by `==`, boxed by `==` when D supports it otherwise by pointer). Write-only properties would always notify, but GObject ignores `g_object_notify_by_pspec` unless the property is readable, so a setter-only property does not emit `notify`. `@gNotifyAlways` / `notifyAlways: true` opts into GObject's every-set notify. `ParamFlags.ExplicitNotify` is user-handled: no automatic notify, call `notify()`.

**Construct properties.** `ParamFlags.Construct` is applied during `g_object_new` (the default is used if the caller does not pass a value). `ConstructOnly` can only be set at construction. Timing:

- Objects created from D (`super()` / `g_object_new` inside `_newDSubclassGObject`): the D object is bound in `instance_init`, then construct properties are set, then the D constructor body runs.
- Objects created from C or GtkBuilder: the public default constructor runs in `instance_init`, **then** construct properties are set (they overwrite values assigned in the constructor).

Read and write work from D (`getProperty` / `setProperty`), from C (`g_object_get` / `g_object_set` / `g_object_new`), and from GtkBuilder using the kebab-case name.

### Step 2 behaviour

**Declaration.** `@gSignal` goes on a public method, so that a signal has a type-checked signature without extra boilerplate and the body gives the class handler for free. D has no prototype-only members (a delegate field would cost space per instance), so a signal that needs no default handler has an empty body. The attribute is `@gSignal`, `@gSignal("name")`, `@gSignal(SignalFlags)`, `@gSignal(gSignalAccumulator)` or `@(gSignal.create(name:, flags:, accumulate:, accumulator:, typeNames:))`. An `override` of the method in a D subclass is not a new signal; it changes the default handler (the class handler dispatches virtually to the D method, so `super.foo()` chains up). The GObject mixins enumerate `__traits(derivedMembers)` of the class, so each class in a hierarchy needs its own mixin, as for properties.

**Registration.** `class_init` calls `g_signal_newv` for each `@gSignal` method declared on the class. The class closure is a closure with a marshal function that looks up the D object of the instance and calls the method, so default handlers run for emissions from C as well. Flags are used as given; if none of `RunFirst`, `RunLast` and `RunCleanup` is set, `RunLast` is added. Parameter and return GTypes: the property type set (`bool`, integers (`short` and `ushort` as int and uint, `long`/`ulong` as 64 bit), `float`, `double`, `string`, `Variant`, `ObjectWrap` and interfaces, boxed, and enums/flags that have `_getGType` or a name in `typeNames`, one entry per argument and one for the return type).

**Generated members.** `emitFoo(args)` fills the `GValue`s and calls `g_signal_emitv`, returning the signal's return value. `connectFoo(callback, after)` mirrors the generated bindings (a `_cmarshal` that reads the values with `getVal`, `DClosure`, `connectSignalClosure`), and static asserts give a readable message for a callback of the wrong signature. For `Detailed` signals the detail goes first: `emitFoo(detail, args)` and `connectFoo(detail, callback, after)`; the forms without detail are also available. An exception thrown by a handler or default handler is reported to the callback exception handler and the emission continues.

**Return values.** `gSignalAccumulator.Auto` is `TrueHandled` (`g_signal_accumulator_true_handled`) for `bool` signals, otherwise the value of the last handler is the result. `Last`, `TrueHandled` and `FirstWins` (`g_signal_accumulator_first_wins`) can be chosen, or a custom accumulator is named: `@(gSignal.create(accumulator: "sum"))` calls `static bool sum(ref R total, R handlerReturn)` of the class (true continues). As in C, a `RunLast` default handler that returns a value runs after the connected handlers and its value is the result of a plain "last wins" signal, so such a signal usually uses an accumulator or `Yes.After` handlers.

**Limits.** Custom accumulators must be static methods of the declaring class. `string[]` and `ParamSpec` arguments, `G_SIGNAL_TYPE_STATIC_SCOPE`, and per-argument GType names other than through `typeNames` are not supported. A `@gSignal` method in a class that doesn't mix in `GObjectSubclass` or `GObjectExport` is not a signal. The class handler can still be overridden from C with `g_signal_override_class_handler()` like any GObject signal.

### Step 3 behaviour

**Declaration.** `@gVirtual` goes on a method named `vfunc` + TitleCase, such as `@gVirtual protected int vfuncAdd(int a, int b)`. The body is the default implementation. The mixin adds a public final invoker with the short name (`add`) and a hidden shim (`_gidVfuncImpl_add`) that the class struct trampoline calls. The shim calls `vfuncAdd` with D virtual dispatch, so a D subclass changes the behaviour with `override protected int vfuncAdd(...)` and `super.vfuncAdd(...)` chains up with no extra machinery. The implementation can have any visibility. `@gMethod` is not needed: the invoker is always generated, and the attribute stays reserved for GIR export (step 4).

**Class struct layout.** The class struct of a D type that declares `n` virtual methods is the class struct of its parent (the `g_type_query` class size) rounded up to pointer alignment, followed by `n` function pointers in order of declaration. A type with no `@gVirtual` methods adds nothing, so the layout is unchanged for existing code. The slot type is `R (*)(Instance*, args...)`: `bool` is `gboolean` (`int`), enums use their base type, `string` is `const char*` (not owned by the callee), and objects are `GObject*` (not owned by the callee). GObject copies the parent class struct for the new type, so a subclass keeps the slots (and the trampolines) of its parent. Slot offsets are fixed by the declaration order, so adding a vfunc in the middle of a class changes the ABI of its subclasses, like adding a field in the middle of a C class struct. Appending is safe for subclasses only after they are recompiled (there is no padding).

**Registration.** `_registerDSubclass` asks `_dVfuncClassSize` for the class size and records the offset of the first slot in a per-class variable. `class_init` then writes the address of a trampoline per slot (`_installDVfuncs`), after the C-declared `_installVfuncs`, properties, and signals.

**Dispatch.** The invoker `add(...)` reads the slot of the class of the *instance* (`G_TYPE_INSTANCE_GET_CLASS`), converts the arguments to the C types, and calls it, so an override written in C, Python, or another D library is used from D as well. The default slot is the trampoline, which finds the D object bound to the C instance (`_vfuncDObject`), converts the arguments, calls the shim, and converts the result. Exceptions are reported to the callback exception handler and the caller gets 0 (`init` for non numeric types). An unset slot gives the same value. A C override can chain up by calling the slot of `g_type_class_peek_parent`, which reaches the D implementation of the parent type.

**Limits.** Parameters are `bool`, integers, `float`, `double`, enums, `string`, and `ObjectWrap` classes (no `ref`/`out`/`lazy`, arrays, structs, or delegates). The return type is `void`, `bool`, an integer, `float`, `double`, or an enum; `string` and object returns need an ownership choice and are not supported yet. No `GError**` or out parameters. Overloads are not supported (the first `@gVirtual` overload is used). Virtual methods on interfaces are step 4.

**C subclasses of D types.** A type that C code registers as a subclass of a D type (not flagged as a D subclass type) may override both new and C-declared vfuncs, and chain up to the D type. The class used by `super.vfuncX()` in D for a C-declared vfunc (`_vfuncClassOf`) is that of the nearest ancestor which is not a D subclass type, searching from the nearest D subclass type of the instance rather than from the instance's own type. Starting from the instance's own type would pick the class of the C type, whose override calls the D type, which would call it again.

### Step 4 behaviour

**Declaration.** A D `interface` with `mixin GObjectInterface!"TypeName"` (the name defaults to `D` + the fully qualified D name) is a GObject interface type, registered on first use of `I._getGType()` (also when a class implementing it is registered). Its methods are abstract `@gVirtual` methods named `vfunc` + TitleCase. The mixin adds a public final invoker with the short name to the interface (`area()` for `vfuncArea`), so it is available on any object typed as the interface. `@gSignal` in an interface is rejected at compile time.

**Implementing in D.** A D class lists the interface as a base and implements the `vfunc` methods, with `mixin GObjectSubclass` (or `GObjectExport`) as for any D type. `_addDSubclassIface` recognizes D-defined interfaces (`_gidDInterfaceOf`) and adds them with an `interface_init` that writes one trampoline per method. The trampoline casts the bound D object to the interface and calls the method (D virtual dispatch), so a D subclass overrides with a normal `override`, and the interface is only added to the first D type in a hierarchy which implements it.

**Interface struct layout.** `GTypeInterface` (rounded up to pointer alignment) followed by one function pointer per method of the interface, in order of declaration, with the same C types as `@gVirtual` class methods. Methods of a base interface are in the struct of the base interface, not repeated.

**Prerequisites.** `GObject`, plus every base interface (`interface Named : Shape`), which must be D-defined interfaces too (compile error otherwise).

**Dispatch and foreign implementations.** The invoker gets the interface struct with `g_type_interface_peek` on the class of the instance and calls the slot, so an implementation in C or another language is used. A C subclass of a D class can implement the interface again and chain up with `g_type_interface_peek_parent`. A GObject that implements the interface without a D class is wrapped as the interface with `_DIfaceProxy!I` (a D-only proxy class in `gid.gobject2.dig_iface`), whose `vfunc` methods also call the slots. An unset slot, or an object which does not implement the interface, gives 0.

**Limits.** Same types as `@gVirtual` class methods. No default implementations (D interfaces have no bodies for virtual methods), no interface properties or signals, no C interfaces as bases of a D-defined interface, and no exported C invoker symbols (C code calls the slots). These are left for GIR export.
