# DiG - D in GObject

This is a design only; nothing here is implemented yet.

The following document is a proposal for implementing functionality in giD to create GObject derived classes which can be integrated natively in C.
Examples of this include: creating new GtkWidget classes using the snapshot framework, GStreamer elements, and GIO streams.
Such widgets could be instantiated in builder UI files and integrate into GObject and Gtk for use in D applications.

Additional design proposals also describe extending giD to create GIR bindings to D libraries.
This would provide the ability to create D libraries which have GIR C APIs which can be used from any other language with GObject binding support.
This functionality would be provide convenient mixins and attributes (UDAs) for exposing D classes and interfaces to the GObject type system.
The gidgen utility will then be able to export the resulting GIR XML API descriptions for the D library.

## 1. Current state

giD can *consume* GObject types from D. It cannot yet register a new GType for a D class or fill a class/interface vtable.

**Wrapping and identity.** `gobject.object.ObjectWrap` (`packages/glib2/gobject/object.d`) is the root of every GObject proxy. A C instance is bound to its unique D proxy with `g_object_set_qdata` (`gidObjectQuark`) and a toggle ref (`g_object_add_toggle_ref` / `_cObjToggleNotify`) so the D object stays alive while C holds a strong ref, without a ref cycle. `_getDObject!T` returns the existing proxy, or constructs one if needed.

**Class maps.** On first wrap, `createClassMaps` walks loaded `ModuleInfo` and records:

- `gtypeNameClasses`: GType *name* → D `TypeInfo_Class`, from `_gTypeName` (avoids calling `get_type()`, which can have side effects such as `gst_init()`).
- `gtypeClasses`: GType → D class, for types that override `_gType` but not `_gTypeName`.
- `ifaceProxyClasses`: D interface → `IfaceProxy` subclass, used when the concrete GType has no D class.

A D subclass that does not override `_gType` / `_gTypeName` is skipped (`"D subclass without its own GType"`). Function-pointer comparison of those two properties is already used (`(&obj._gType).funcptr !is (&baseObj._gType).funcptr`).

**Construction.** Generated classes expose `this(void* ptr, Flag!"Take" take)` and `_getGType` / `_gType` / `_gTypeName` (`gir/structure.d`). `ObjectWrap.this(GType)` / `createGObject` instantiate an *already registered* C type. The C APIs `g_type_register_static_simple` and `g_type_add_interface_static` are bound, but nothing in giD calls them for a user D class. Interface *consumption* uses a D `interface` plus a mixin of C wrappers (e.g. `gio.list_model.ListModel` / `list_model_mixin.d`) and `IfaceProxy` for unknown implementors.

**gidgen and virtual methods.** `FuncType.VirtualMethod` and `"virtual-method"` exist in `gir/func.d`, and `fixup()` would mark such funcs `Active.Ignored`. In practice they never reach that path: `gir/repo.d` (`case "virtual-method"`) does `goto noRecurse` and never builds a `Func`. The comment there treats vfuncs as a C implementation detail. Class/interface *structs* are still generated (`GtkWidgetClass`, `GListModelInterface`, `GdkContentProviderClass`, …) with `extern(C)` function-pointer fields, because those come from the GIR record, not from `virtual-method` nodes.

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

  override gtk.types.SizeRequestMode vfuncGetRequestMode()
  {
    return gtk.types.SizeRequestMode.ConstantSize;
  }

  override void vfuncMeasure(gtk.types.Orientation orientation, int forSize,
      out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    minimum = natural = (orientation == gtk.types.Orientation.Horizontal) ? 80 : 40;
    minimumBaseline = naturalBaseline = -1;
  }

  override void vfuncSizeAllocate(int width, int height, int baseline)
  {
    super.vfuncSizeAllocate(width, height, baseline);
  }

  override void vfuncSnapshot(gtk.snapshot.Snapshot snapshot)
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
class StringList : gobject.object.ObjectWrap, gio.list_model.ListModel
{
  mixin GObjectSubclass;     // registers GType and adds GListModel
  mixin ListModelT!();       // existing public wrappers (getNItems, itemsChanged, …)
  string[] items;

  override gobject.types.GType vfuncGetItemType() { return ObjectWrap._getGType; }
  override uint vfuncGetNItems() { return cast(uint)items.length; }
  override gobject.object.ObjectWrap vfuncGetItem(uint position)
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
class Foo : gobject.object.ObjectWrap
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
       parent="GObject.Object">
  <property name="value" .../>
  <glib:signal name="changed">...</glib:signal>
  <virtual-method name="do_thing" invoker="do_thing">...</virtual-method>
  <method name="do_thing" c:identifier="mylib_foo_do_thing">...</method>
</class>
<record name="FooClass" glib:is-gtype-struct-for="Foo">
  <field name="parent_class"><type name="GObject.ObjectClass"/></field>
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
