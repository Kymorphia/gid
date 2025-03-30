# GObject Instrospection D Package Repository

This is the GObject Introspection D Language Package Repository for the **giD** project (pronounced *giddy*).
The intention of this project is to create high quality D language (AKA Dlang) bindings for libraries with
[GObject Introspection](https://gi.readthedocs.io/en/latest/) APIs.

The D language bindings hosted in this repository were generated with [gidgen](https://github.com/Kymorphia/gidgen/).
This utility takes XML GObject Introspection Repository (GIR) files and generates D binding packages which can be used with [dub](https://dub.pm/).

This package repository currently contains bindings for the following libraries:
Gtk4, Gtk3, GStreamer, Adw, Panel, Vte terminal library, GtkSource code viewer widget, Apache Arrow, GtkSource, libsoup, Rsvg, and more.
Additional useful libraries with GObject Introspection interfaces will be added based on interest.
Potentially any of those listed in the Python [PyGObject API Reference](https://lazka.github.io/pgi-docs/) for example.


## Quickstart

For a quickstart guide to developing Gtk4 GUI applications, please consult the [giD Gtk4 Examples](https://github.com/Kymorphia/gid-gtk4-examples/).

Dejan Lekic has several example projects for giD libraries in his [gid-examples](https://codeberg.org/dejan/gid-examples/) project.

The remainder of this document provides an overview of the giD bindings.


## Versions and API Stability

Currently the giD API should be considered to be unstable.  This is the reason for the current versions being **0.9.x**.
The API may break on each 0.9.x release and therefore any applications depending on giD libraries should specify the exact version `==0.9.0` for example.
Once v1.0.0 is released, an increment in the micro version will be backwards compatible, and minor version increments may break backwards compatibility.


## API Reference Documentation

Documentation is now being generated with [adrdox](https://github.com/adamdruppe/adrdox) and can be found at [https://www.kymorphia.com/gid/](https://www.kymorphia.com/gid/).

**NOTE:** Currently only the newest versions of the following libraries are generated: gtk4, gdk4, vte3, and gtksource5.
This is due to existing limitations with adrdox with multiple versions of libraries using the same module path.

The C API reference docs can also be used with some added understanding of the D binding differences.
And finally the D binding source code itself can be used as a reference.


### C API Library Reference

See the [doc/C_API_Library_Reference.md](doc/C_API_Library_Reference.md) file for the comprehensive list.

## Dub Packages

Each library has its own binding dub sub-package, within the `gid` package, each with a single source directory (package name).
One notable exception is that the **glib** package contains glib, gobject, and the gid directory top-level module paths.
This was done to resolve interdependencies between these modules.

Sub-packages are named using the lowercase name of their GIR `namespace` followed by the major version number.
For example, the Gtk library uses `Gtk` as the GIR namespace and the version is `4`.
This results in the full dub package name `gid:gtk4` with the toplevel package directory namespace `gtk`.

**NOTE:** giD supports multiple versions of some packages, such as for Gtk.
The same top-level module directory is used for both, which while less verbose, means that only one version can be used in an application.


## Module Names

Each library consists of several modules. Each object and wrapped structure type gets its own D module with the name of the type in **snake_case**.
Underscores are inserted in the snake case name only when transitioning from a lowercase letter to an uppercase letter.
For example: the **GLArea** class will be written to a module named **gtk.glarea**, because there are no transitions from lowercase to uppercase.
Another example would be the class **SpinButton** which would be written to a module named **gtk.spin_button**.

Interfaces result in 3 modules being written which is described further in the [Interfaces](#interfaces) section.

Additionally there are the following built-in modules for each package:

 * **namespace.c.functions** - Contains all the C function pointers which are dynamically loaded at runtime.
   These pointers have the same name as the C API functions, for example `g_object_ref`, and can be called like any other C function.
 * **namespace.c.types** - Contains all C API types, including: enum aliases, flags, structs, unions, and function callback types.
 * **namespace.global** - Contains package global D functions which aren't associated with a class or structure instance.
 * **namespace.types** - Contains D types for the package, including: aliases, enums, flags, structs, delegates, and constants.
   Many D types are simply aliases to the underlying C types with a different D symbol name.


## Symbol Renaming

Here are some general rules about symbol renaming:

 * Symbols which are **CamelCase** are generally retained as is, this includes: object types, interfaces,
   structure/union types, enum/flag types, and module namespace names.
 * Many other symbols that use **snake_case** in the GIR API definition, including: functions, method names, and argument names
   are renamed to **camelCase**.  `get_value()` for example becomes `getValue()`.
 * Enum and flag values use **SNAKE_CASE** which is converted to **TitleCase**.
   For example, GTK_ALIGN_BASELINE_FILL becomes Align.BaselineFill.
 * Other standalone constants (not enums or flags) generally use **SNAKE_CASE** and are used as is,
   after removing the module prefix. `GTK_INPUT_ERROR` for example becomes just `INPUT_ERROR`.
 * Any reserved words have an underscore appended to them.
   For example a function argument named `version` is a reserved D word and would therefore become `version_`. This also applies to module names,
   for example **Gtk.Switch** is written to the module **gtk.switch_**.
 * Signal names are in **kebab-case** in GIR API definitions and are converted to signal **connectKebabCase** method templates.


### Specific Symbol Renames

| GLib C Type      | D Type            |
|------------------|-------------------|
| AtkObject        | ObjectAtk         |
| AtkValue         | ValueAtk          |
| GObject          | ObjectG           |
| GVariant         | VariantG          |

These renames were done to avoid conflicts with built in D types.


## Output and Input/Output Arguments

The D language `out` attribute is used for method and function arguments which are outputs and
the `ref` attribute is used for those which are input and output.


## Basic Types

The following table is a map of how GLib basic scalar types are changed from C to D:

| D Type           | GLib C Types                                                     |
|------------------|------------------------------------------------------------------|
| bool             | gboolean                                                         |
| byte             | gint8, int8_t                                                    |
| char             | gchar                                                            |
| const(void)*     | gconstpointer                                                    |
| dchar            | gunichar                                                         |
| double           | gdouble                                                          |
| float            | gfloat                                                           |
| int              | gatomicrefcount, gint, gint32, grefcount, int32, int32_t, pid_t  |
| long             | gint64, glong, goffset, time_t                                   |
| ptrdiff_t        | gintptr, gssize                                                  |
| short            | gint16, gshort, int16_t                                          |
| size_t           | gsize, guintptr                                                  |
| string           | filename, utf8                                                   |
| ubyte            | guchar, guint8, uint8_t                                          |
| uint             | guint, guint32, uid_t, uint32_t, unsigned                        |
| ulong            | guint64, gulong                                                  |
| ushort           | guint16, gunichar2, gushort, uint16_t                            |
| void             | FILE, none, passwd, tm                                           |
| void*            | gpointer, va_list                                                |

**NOTE:** The **glong**, **gulong**, and **unsigned long** types use versioned aliases depending on the platform.
On Windows these values correspond to the 32 bit D types **int** and **uint** even on 64 bit systems.
On other platforms these values are the 64 bit D types **long** and **ulong**.


## Strings

C zero-terminated strings are converted between native D strings and should contain utf-8 encoded text.
Functions and methods which don't contain utf-8 text will usually be `byte[]` or `ubyte[]` arrays.


## Enumerations and Flags

Enumeration and flags use D `enum` types. Enumerations default to using `int` as a base type.
Flags default to using `uint` and can be logically OR'd together.


## Arrays and Containers

All arrays and GLib container types are converted between D dynamic arrays.
This includes: GArray, GByteArray, GPtrArray, GList, and GSList.


## Hash Tables

GHashTable arguments and return values are converted between D associative arrays.


## Objects

C `GObject` types are wrapped as `ObjectG` classes.
This rename was done instead of `Object` so as not to conflict with D's native Object type.


### Built-in Object Methods

```D
void setProperty(T)(string propertyName, T val)
```
A template for setting an ObjectG property from a D static type value. Currently the D type must match the expected property type.
For example an `int` cannot be used where a `uint` is expected. Most GIR APIs have set methods for each property which are preferable.

```D
T getProperty(T)(string propertyName) const
```
A template for getting an ObjectG property as a D static type value. Currently the D type must match the expected property type.
For example an `int` cannot be used where a `uint` is expected.  Most GIR APIs have get methods for each property which are preferable.

```D
static T getDObject(T)(void* cptr, bool owned = false)
```
This static template is used for looking up a D wrapper object for a given C GObject instance pointer.
If one exists already it is returned, otherwise a new D object is created wrapping the C GObject.
The `owned` argument is used in this case to determine whether a GObject reference is owned or not.

```D
void* cPtr(bool addRef = false)
```
For accessing the C GObject instance. The `addRef` argument is used for adding a GObject reference if `true` (defaults to `false`).

```D
@property GType gType()
```
For getting the GLib GType for the underlying C GObject. There is also a static method `getType` which can be used without an instance.


### Signals

GObject signals are connected using method templates with names of the form **connectSignalName**,
where **SignalName** is the TitleCase form of the GObject signal-name.
The first argument to the template will be a signal "detail" string for signals which use details
(GObject **notify** for example, for specifying the property name).
The next template argument is the callable to call, which can be a delegate or function, more on that below.
The last argument `after` is optional and can be set to `Yes.After`,
to execute the signal callback after other callbacks (defaults to No).

The callback callable can have a varying number of arguments which conform to the signal arguments,
from no arguments up to all of the signal arguments including the object instance which is the last argument.
This added convenience allows for only those arguments to be specified, so long as they are in sequence.

The other useful feature that signal connection method templates provide is the ability to use a derived class for object parameters.
This avoids having to cast an argument of the expected object type to the desired type.
For example, a ApplicationWindow argument could be used in place of a Window argument expected by the CloseRequest signal of Window.

Here is an example of what the [command-line](https://www.kymorphia.com/gid/gio.application.Application.connectCommandLine.html)
signal of [Gio.Application](https://www.kymorphia.com/gid/gio.application.Application.html) looks like:

```D
ulong connectCommandLine(T)(T callback, Flag!"After" after = No.After)
if (isCallable!T &&
  is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application_command_line.ApplicationCommandLine)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.application.Application)))
  && Parameters!T.length < 3
)
```

The return value from the connect template is a signal handle,
which can be passed to functions in GObject.Global such as: [signalHandlerBlock](https://www.kymorphia.com/gid/gobject.global.signalHandlerBlock.html),
[signalHandlerDisconnect](https://www.kymorphia.com/gid/gobject.global.signalHandlerDisconnect.html), etc.


## Interfaces

Interfaces result in an interface D module and two additional modules `interface_mixin` and `interface_iface_proxy` which are primarily used internally.
Where **interface** is the interface type name in **snake_case**.
For example, the Gio.File interface would have **file**, **file_mixin**, and **file_iface_proxy** modules.
The first one defines the interface and static methods,
the second defines a mixin template that contains method implementations which is mixed into objects implementing the interface,
and the third defines an interface proxy wrapper object that is used when a C GObject with an unknown type is cast as the interface.


## Boxed Types

GBoxed types are wrapped with an object derived from the abstract [gobject.boxed.Boxed](https://www.kymorphia.com/gid/gobject.boxed.Boxed.html) object.


### Built-in Boxed Methods

```D
@property GType gType()
```
Gets the GLib C GType of a boxed type. The static `getType` method can also be used without an instance.

```D
void* copy_()
```
Usually only used internally. Creates a copy of the underlying C boxed type, which should be freed with `boxedFree` if ownership isn't taken by C code.
The `boxedCopy` static method can also be used to copy an arbitrary C boxed value (without a D object instance).

```D
static void boxedFree(T)(void* cBoxed)
```
Usually only used internally. A static method used to free a C boxed type value.

 ```D
 this(void* boxPtr, bool owned)
 ```
Usually only used internally.  or wrapping a C boxed pointer `boxPtr`.
The `owned` argument indicates if the ownership of the boxed type should be taken, it is copied otherwise.

```D
this(Boxed boxed)
```
Usually only used internally. For creating a copy of a D Boxed object. The underlying C boxed value is copied.


## Simple Structures and Unions

Simple `struct` and `union` types which have no methods or data members requiring memory management are not wrapped with a D Object
and are just created as aliases to the underlying C data type.


## Reference Types

Some non-trivial GIR structure types are not GObject or boxed types but have ref and unref methods.
These are wrapped in D objects, but may lack the ability to copy the underlying C object if no methods are provided to do so.
These types can also inherit from others.

One notable example is [gtk.expression.Expression](https://www.kymorphia.com/gid/gtk.expression.Expression.html)
which is an abstract type that several others like
[gtk.property_expression.ProperyExpression](https://www.kymorphia.com/gid/gtk.property_expression.PropertyExpression.html) are derived from.
The only useful built-in method is `cPtr` which behaves similar to other uses in the giD API,
with a `Flag!Dup` argument for adding a reference (defaults to No.Dup).


## Wrapped Structures With Fields

Structures or unions which are not simple types and have accessible fields are wrapped by a D object with accessor properties,
which perform data conversion and memory management as needed.
The field names are converted from **snake_case** to D `@property` names with **camelCase**.


## Opaque Structures

Opaque structures which have methods are also wrapped in order to provide convenient access to them from D.


## Value

The [gobject.value.Value](https://www.kymorphia.com/gid/gobject.value.Value.html)
wildcard type is wrapped as a boxed type with some additional templates and methods for converting between D types.


### Built-in Value Methods

```D
static Value create(T)(T val)
```
This static template provides a convenient way to create a new Value from a static typed D value.

```D
void init_(T)()
```
Method template to initialize a Value to a D static type.
The `initVal` template is also available for use directly on a GValue.

```D
T get(T)()
```
Method template to get a Value. The static D type must match that of the Value.
The `getVal` template is also available for getting the value directly from a GValue without a Value instance.

```D
void set(T)(T val)
```
Method template to set a Value. The static D type must match that of the Value.
The `setVal` template is also available for setting a GValue directly without a Value instance.


## VariantG

The [glib.variant.VariantG](https://www.kymorphia.com/gid/glib.variant.VariantG.html)
type provides a way to store structured data of varying types and is very similar to the functionality offered by D
[std.variant](https://dlang.org/phobos/std_variant.html)
and the giD binding uses the name `VariantG` in order to not conflict with it.


### Built-in VariantG Methods

```D
static VariantG create(T)(T val)
```
For creating a VariantG from a single statically typed D value.

```D
static VariantG create(T...)(T vals)
```
For creating a VariantG from multiple statically typed D values, the result is a VariantG tuple.

```D
T get(T)()
```
Get a single value from a VariantG as a static D type. The type must match the VariantG value type.

```D
auto get(T...)()
```
Get multiple values from a VariantG as static D types. The types must match the VariantG value types.

```D
override bool opEquals(Object other)
```
Equivalency operator overload to be able to compare VariantG objects.

```D
override int opCmp(Object other)
```
Comparison operator overload to be able to compare and sort VariantG objects.

```D
override string toString()
```
For rendering a VariantG as a string.

```D
this(void* ptr, bool ownedRef = false)
```
Usually only used internally. For wrapping a GVariant into a VariantG object.
`ownedRef` can be set to true to take ownership of the GVariant instance (defaults to false).

```D
void* cPtr(bool addRef = false)
```
Usually only used internally. For getting the GVariant C instance from a VariantG object.
`addRef` can be set to true to add a reference (defaults to false).


## VariantType

[glib.variant_type.VariantType](https://www.kymorphia.com/gid/glib.variant_type.VariantType.html)
describes the type of data assigned to a GVariant. It is a boxed type and thus inherits the methods for Boxed.


### Built-in VariantType Methods

Additional built-in methods not part of the GIR API or Boxed are described below.

```D
static VariantType create(T...)()
```
A static method to create a new VariantType from one or more D types. Multiple D types will result in a tuple VariantType.


```D
static string getStr(T...)()
```
A static method to get a [GVariant Format String](https://docs.gtk.org/glib/gvariant-format-strings.html) from one or more D types.
Multiple D types will result in a GVariant tuple.


## Callbacks

C callback functions are translated to D delegates.
The use of delegates makes `void* data` values, which are typically passed to C callbacks for user defined data, unnecessary.
This is because any variables can be accessed within the context where the delegate was declared.
Additionally destroy callbacks for data are also unnecessary and are managed automatically by the giD bindings.


## Troubleshooting

giD object construction, destruction, and references can be logged, when built with debugging enabled (`--debug debug` dub option),
by setting the `GID_OBJECT_DEBUG` environment variable to 1:

```sh
export GID_OBJECT_DEBUG=1
```

It can also be useful to add a periodic garbage collection cycle, when troubleshooting memory leaks.
The following can be added to your application to run GC.collect once a second for example:

```D
import glib.global : timeoutAddSeconds;
import glib.types : PRIORITY_DEFAULT, SOURCE_CONTINUE;
import core.memory : GC;
import std.stdio : writeln;

timeoutAddSeconds(PRIORITY_DEFAULT, 1, () {
  writeln("GC.collect");
  GC.collect;
  return SOURCE_CONTINUE;
});
```


### Memory Leaks

Currently there are a number of potential memory issues when using giD.
Many of these involve GObject C and D reference cycles.
The D garbage collector (GC) is able to properly collect reference cycles when they involve GC managed memory only.
However, when C and D memory management is involved, interdependencies can cause data from both to become unrecoverable.


#### Object Reference Details

* C GObject structures are wrapped with D wrapper objects.
* Wrapper objects maintain a GObject toggle reference using `g_object_add_toggle_ref` which holds a strong reference on the C GObject,
  and a "weak" callback based reference from the C GObject to the D wrapper. This ensures one is not freed until the other is no longer used.
* The toggle reference callback is called when the reference count of the GObject transitions from 1 to 2 or 2 to 1,
  indicating there are now additional C references or now there is only the toggle reference, respectively.
* When there are references to the GObject other than the D wrapper toggle reference (refCount > 1),
  the D object is added as a GC "root" to ensure it is not collected even if there are no D pointers to it in GC scanned memory.
* When the toggle reference is the only reference (refCount == 1), then the D object is removed as a root from the GC,
  allowing it to be collected when there are no more D memory pointers to it.
* When the D object destructor is called it removes the toggle reference which will cause the C object to be freed.
* Signal and function callback delegates usually also contain D wrapper object pointers.
* A reference cycle stalemate occurs when there are C GObject references
  where those references are being held by other GObjects or D toggle references.
* Gtk Widgets use a parent/child tree architecture where parents add GObject references to their children.
* The general way to free all widgets is to remove the toplevel parent (usually a Window or a derived type),
  which causes it's immediate children to be unreferenced, which in turn are freed, etc.
* Problems arise when there are still other references to objects, often from a callback delegate or other Widget.


#### Example Leak Scenarios

**Problem**

Gtk4 changed the way in which Window (and derived objects like ApplicationWindow) are handled compared to Gtk3.
When Window objects are displayed they are referenced by a global window list. When they are closed, this reference is removed,
which if it was the last reference would cause the recursive destruction of all of its children.
However, signal or other delegate callbacks which are connected to a child object and reference an ancestor object in the delegate context,
results in reference cycles. Gtk3 would call g_object_run_despose() on the window in response to a delete event when closed.

**Solution**

One solution to this is to connect to the `CloseRequest` signal of the Window and call
[runDispose](https://www.kymorphia.com/gid/gobject.object.ObjectG.runDispose.html) on the Window.
Here is an [example](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/app_tree.d#L145) of this.
This causes the tree of C GObjects to remove references to each-other, allowing for D to clean up the wrapper objects.
Even though there still may be reference cycles, they will only be found in D memory which is properly handled.


**Problem**

A callback delegate has a reference to a parent Widget that results in a reference cycle. Can be either a delegate passed to a method or a signal callback.
One example is when using a `DrawingArea` and using `setDrawFunc` to assign a drawing callback delegate that has a pointer to the parent widget.

**Solution**

A potential workaround is to unset the callback delegate when the widget is going to be destroyed, by connecting to the `unrealize` signal for example.
Here is a [demonstration](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/flow_box.d#L85)
of a solution for this issue. By clearing the drawing function the reference cycle is broken.


**Problem**

D object has member pointers to child widgets and the D object is used in the context of signals or other delegate callbacks.

**Solution**

A potential solution for this is to connect to a signal that can be used as an indication of the object being destroyed,
such as `CloseRequst` for Window objects or `Unrealize`, and then clearing the member pointers.
Here is an [example](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/text_view.d#L52) of this.


#### Gtk4 Notebook Tab Widget Leaks

It appears that the widgets added as Notebook tab "labels" leak.
It is suspected that this might be a Gtk [bug](https://gitlab.gnome.org/GNOME/gtk/-/issues/5930) which also affects C.
