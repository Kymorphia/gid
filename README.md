# GObject Instrospection D Package Repository

<img src="https://raw.githubusercontent.com/Kymorphia/gid/refs/heads/main/gid-logo.svg" alt="giD Logo" align="right">

This is the GObject Introspection D Language Package Repository for the **giD** project (pronounced *giddy*).
The intention of this project is to create high quality [D language](https://dlang.org/) (AKA Dlang) bindings for libraries with
[GObject Introspection](https://gi.readthedocs.io/en/latest/) APIs.

The D language bindings hosted in this repository were generated with [gidgen](https://github.com/Kymorphia/gidgen/).
This utility takes XML GObject Introspection Repository (GIR) files and generates D binding packages which can be used with [dub](https://dub.pm/).

This package repository currently contains bindings for the following libraries:

 * [Gtk4](https://gtk.org/) - Popular cross-platform graphics toolkit
 * Gtk3 - Previous version of Gtk
 * [GStreamer](https://gstreamer.freedesktop.org/) - Powerful multimedia streaming library
 * [WebKit](https://webkit.org/) - Web browser engine
 * [Adw](https://gnome.pages.gitlab.gnome.org/libadwaita/doc/main/) - Building blocks for modern Gnome applications
 * [Panel](https://github.com/GNOME/libpanel) - Dock/panel library for Gtk4 and Adw (for use with IDEs and other applications benefiting from dynamic interfaces)
 * [Vte](https://github.com/GNOME/vte) - Virtual terminal widget library for Gtk (supports versions for Gtk3 and Gtk4)
 * [GtkSource](https://gitlab.gnome.org/GNOME/gtksourceview/) - Source code viewer widget for Gtk (supports versions for Gtk3 and Gtk4)
 * [libsoup](https://github.com/GNOME/libsoup) - An HTTP client/server library
 * [Rsvg](https://github.com/GNOME/librsvg) - SVG graphics rendering library
 * [json-glib](https://github.com/GNOME/json-glib) - JSON library
 * And [more](packages)!

The [Apache Arrow](https://arrow.apache.org/) and Parquet bindings (several versions of each) are in the separate
[gid_apache](https://github.com/Kymorphia/gid_apache) repository, which uses the packages of this repository as dependencies.

Additional useful libraries with GObject Introspection interfaces will be added based on interest.
Potentially any of those listed in the Python [PyGObject API Reference](https://lazka.github.io/pgi-docs/) for example.


## Community Discussions

We welcome your comments, questions, and feature requests.

The use of [Github Discussions](https://github.com/Kymorphia/gid/discussions/) is encouraged for topics which others can benefit from.

There is also a [giD Discord Server](https://discord.gg/SxJQkrcBs2) if you are looking to chat about all things giD related.


## giD Applications

The following is a growing list of applications which use giD. Have an application you'd like featured here? Open a pull request on this README and feel free to announce it on the [giD Discord Server](https://discord.gg/SxJQkrcBs2).

* [appimage-installer](https://github.com/Hezkore/appimage-installer) - Desktop application for Linux that installs AppImage files and gives them proper desktop integration
* [Daphne Music Player](https://codeberg.org/Kymorphia/daphne-music) - Music player and library manager (Gt4k, GStreamer)
* [Dejan's Terminal](https://codeberg.org/dejan/dterm) - Minimalistic terminal (Gtk4, Vte3)
* [D IDE](https://codeberg.org/dejan/dide) - Simple integrated development environment (IDE) for D programming (Gtk4, Vte3, Gtksource5)
* [gid-examples](https://codeberg.org/dejan/gid-examples) - Set of tiny D projects to demonstrate giD subpackages (Gtk4, Vte3, GtkSource5, etc)
* [giD Gtk4 Examples](https://github.com/Kymorphia/gid-gtk4-examples/) - giD Gtk4 examples ported from Python
* [Hideout](https://github.com/trikko/hideout) - Minimal and secure desktop application for file encryption and decryption
* [Veb Browser](https://codeberg.org/ddn/veb) - Minimal, yet very usable web browser (Gtk4, libadwaita, and WebKitGTK6)


## Quickstart

For a quickstart guide to developing Gtk4 GUI applications, please consult the [giD Gtk4 Examples](https://github.com/Kymorphia/gid-gtk4-examples/).

Dejan Lekic has several example projects for giD libraries in his [gid-examples](https://codeberg.org/dejan/gid-examples/) project.

**NOTE:** When adding giD package dependencies to a project, depend on the versioned subpackages you need
(`gid:gtk4`, `gid:gst1`, …), not the top-level `gid` package. The top-level package would pull in every binding,
including multiple majors of the same library. See [Project Dependencies](#project-dependencies) for more details.


## Versions and API Stability

Currently the giD API should be considered to be unstable.  This is the reason for the current versions being **0.9.x**.
The API may break on each 0.9.x release and therefore any applications depending on giD libraries should specify the exact version, `==0.9.16` for example.

Once v1.0.0 is released, a micro (patch) increment is backwards compatible. A new major version of a library, which
changes what unversioned imports such as `gid.gtk.widget` point to, is only added in a **minor** version bump of giD.
Users who rely on unversioned shim imports should use a constraint such as `"gid:gtk4": "~>1.0.0"` (`>=1.0.0 <1.1.0`).
In dub, `~>1.0` means `>=1.0.0 <2.0.0` and would include a later 1.x that may change the default major of a library.
To pin a library major regardless of the giD version, use a versioned import (`import gid.gtk4.widget;` or `import gid.gtk3.widget;`).


## API Reference Documentation

Documentation is now being generated with [dejadoc](https://codeberg.org/ddn/dejadoc) and can be found at [https://www.kymorphia.com/gid/](https://www.kymorphia.com/gid/).

The generated top-level [packages README.md](packages) also contains a list of the sub-package library bindings and links to the project's websites, D, and C API documentation.

The C API reference docs can also be used with some added understanding of the D binding differences.
And finally the D binding source code itself can be used as a reference.


## Dub Packages

Each library has its own binding dub sub-package, named with the lowercase GIR `namespace` followed by the major version number.
For example, the Gtk 4 library uses the GIR namespace `Gtk` and version `4.0`, which becomes the dub sub-package `gid:gtk4`.
GTK 3 is a separate sub-package, `gid:gtk3`. Applications depend on these versioned subpackages, not the top-level `gid` package.

The **glib2** package is a notable exception: it also contains the GObject modules and the giD runtime (`gid.core.*`).
This was done to resolve interdependencies between these modules.

GTK 3 and GTK 4 (and other pairs of majors) can be linked together in the same application. Their modules have different names
(`gid.gtk3.widget` and `gid.gtk4.widget`). Only one major of a library can be used per process; GTK aborts if GTK 3 and GTK 4 are both initialized in the same process.

### Optional Library Versions

Libraries are opened when the program starts, and a package whose library can't be found is still linked. Its functions
are not available, and calling one prints a report of the missing libraries and throws an `Error`. This lets a program link several versions of
a library (for example `gid:gparquet22` and `gid:gparquet23`) and choose one at runtime, based on which is installed.
`isLibAvailable` in `gid.core` reports whether the library of a package was found and loaded. It takes any module of the
package, or the package name as a string:

```D
import gid.core : isLibAvailable;
static import gid.gparquet22.file_reader;
static import gid.gparquet23.file_reader;

if (isLibAvailable!(gid.gparquet23.file_reader)) // Is the C library of the gparquet23 package available?
  openWithV23();
else if (isLibAvailable!(gid.gparquet22.file_reader))
  openWithV22();
else
  stderr.writeln("No Parquet library found");

bool haveGtk3 = isLibAvailable("gid.gtk3"); // Package name for runtime use
```

Libraries are opened with `RTLD_GLOBAL` by default, so other code in the process can find their symbols by name
(GtkBuilder looking up `*_get_type` functions, `g_module_open(NULL)`, and plugins).
When two majors of the same library are linked into the program (`gid:gtk3` and `gid:gtk4`, or two versions of a
library such as Parquet), those packages are opened with `RTLD_LOCAL` instead, so their symbols do not collide.
That is what allows GTK 4 to be initialized in a program which also links `gid:gtk3`. GTK 4 would otherwise abort
if it found GTK 2/3 symbols in the global scope. GTK 3 and GTK 4 still can't both be initialized and used in one process.

The `GID_RTLD_LOCAL` and `GID_RTLD_GLOBAL` environment variables override the choice for listed packages, as a
comma-separated list of package namespaces or package names, for example `GID_RTLD_LOCAL=gid.glib2` or
`GID_RTLD_GLOBAL=gtk3,gtk4`. `GID_RTLD_LOCAL` is checked first.

To check an individual C function instead, note that a symbol which could not be resolved is not set to `null`,
it is set to the address of a function that throws an `Error`. To test one, compare to `&gidSymbolNotFound`
from `gid.core.loader`, for example `cast(void function())gparquet_file_reader_get_type !is &gidSymbolNotFound`.
`!is null` is always true and does not indicate availability.

Types with the same GType name in two linked versions (for example `GParquetFileReader` in both) are handled when objects
are returned from C: the D class of the version which actually registered the GType is used.


### Project Dependencies

Projects should depend on the versioned dub subpackages they need, not the top-level `gid` package (which would pull in every binding).
The dependencies of a sub-package do not need to be added, since dub will automatically resolve dependencies recursively.
For example, if a project uses GtkSource and Gtk 4, only `gid:gtksource5` needs to be added to the `dub.json` file.
Since `gid:gtk4` is a dependency of it, it is included automatically, as are its recursive dependencies.
Two majors can be linked in one program, but only one major of a library can be used per process.


### Example dub.json

Example `dub.json file` for a Gtk4 project:

```json
{
  "name": "gid-gtk4-examples",
  "description": "giD Gtk 4 examples",
  "authors": ["Element Green <element@kymorphia.com>"],
  "license": "MIT",
  "dependencies": {
    "gid:gtk4": "==0.9.16"
  }
}
```

**NOTE:** If you are publicly distributing your application, we recommend specifying the exact giD version that your application works with for now.
This is because backwards compatibility may be broken with newer 0.9.x versions.
Once version 1.0.0 is released, users who rely on unversioned shim imports should use a constraint such as
`"gid:gtk4": "~>1.0.0"`, which allows compatible 1.0.x releases (`>=1.0.0 <1.1.0`) without picking up a later minor
version that may add a new default library major. In dub, `~>1.0` means `>=1.0.0 <2.0.0`. See
[Versions and API Stability](#versions-and-api-stability).


## Module Names

Modules are named `gid.<package>.<module>`, where *package* includes the library major version. For example:

```D
import gid.gtk4.widget;
import gid.gtk4.c.types;
import gid.gobject2.object;
import gid.glib2.variant;
```

Each object and wrapped structure type gets its own D module with the name of the type in **snake_case**.
Underscores are inserted in the snake case name only when transitioning from a lowercase letter to an uppercase letter.
For example: the **GLArea** class is in **gid.gtk4.glarea**, because there are no transitions from lowercase to uppercase.
Another example would be the class **SpinButton**, in **gid.gtk4.spin_button**.

The giD runtime modules have no version and live under **gid.core**: `gid.core.utils`, `gid.core.loader`, `gid.core.basictypes`,
`gid.core.wrap`, `gid.core.types`, and `gid.core.global` (plus the low-level `gid.core.c.types` and `gid.core.c.functions`).
They are part of the **glib2** package. `import gid.core;` publicly imports the D-facing runtime modules (not the `c.*` modules).

Interfaces result in 3 modules being written which is described further in the [Interfaces](#interfaces) section.

Additionally there are the following built-in modules for each package:

 * **gid.gtk4.c.functions** - Contains all the C function pointers which are dynamically loaded at runtime.
   These pointers have the same name as the C API functions, for example `g_object_ref`, and can be called like any other C function.
 * **gid.gtk4.c.types** - Contains all C API types, including: enum aliases, flags, structs, unions, and function callback types.
 * **gid.gtk4.global** - Contains package global D functions which aren't associated with a class or structure instance.
 * **gid.gtk4.types** - Contains D types for the package, including: aliases, enums, flags, structs, delegates, and constants.
   Many D types are simply aliases to the underlying C types with a different D symbol name.

### Unversioned Shims

The latest major of a library also provides unversioned shim modules, which simply public-import the versioned ones.
`import gid.gtk.widget;` is the same as `import gid.gtk4.widget;` (the current latest GTK major). These shims are
included in the latest major's package (`gid:gtk4`); `gid:gtk3` has none, so GTK 3 is imported as `gid.gtk3.widget`.
The same pattern applies to other libraries (`gid.glib.variant` is `gid.glib2.variant`, `gid.gobject.object` is `gid.gobject2.object`).
Packages whose versioned name is already unversioned, such as `freetype2` and `libxml2`, have no shims.

A new library major, which changes what an unversioned import points to, is only added in a giD minor version bump.
See [Versions and API Stability](#versions-and-api-stability). To pin a specific major, use the versioned import.

Versioned modules of two majors can be imported and linked in the same application, but only one major of a library can be
used per process. If both define the same type name (for example `Widget`), use a renamed import or `static import`:

```D
import Gtk4 = gid.gtk4.widget;
import Gtk3 = gid.gtk3.widget;
// or
static import gid.gtk4.widget;
static import gid.gtk3.widget;
```


## Symbol Renaming

Here are some general rules about symbol renaming:

 * Symbols which are **CamelCase** are generally retained as is, this includes: object types, interfaces,
   structure/union types, enum/flag types, and module namespace names.
 * Many other symbols that use **snake_case** in the GIR API definition, including: functions, method names, and argument names
   are renamed to **camelCase**.  `get_value()` for example becomes `getValue()`.
 * Object properties use **kebab-case** in GIR APIs and are converted to **camelCase** `@property` methods.
 * Enum and flag values use **SNAKE_CASE** which is converted to **TitleCase**.
   For example, GTK_ALIGN_BASELINE_FILL becomes Align.BaselineFill.
 * Other standalone constants (not enums or flags) generally use **SNAKE_CASE** and are used as is,
   after removing the module prefix. `GTK_INPUT_ERROR` for example becomes just `INPUT_ERROR`.
 * Any reserved words have an underscore appended to them.
   For example a function argument named `version` is a reserved D word and would therefore become `version_`. This also applies to module names,
   for example **Gtk.Switch** is written to the module **gid.gtk4.switch_**.
 * Signal names are in **kebab-case** in GIR API definitions and are converted to signal **connectKebabCase** method templates.


### Specific Symbol Renames

| GIR Class        | D Class           |
|------------------|-------------------|
| Object           | ObjectWrap        |
| Error            | ErrorWrap         |
| Exception        | ExceptionWrap     |
| Monitor          | MonitorWrap       |

These renames were done to avoid conflicts with built in D types and apply to all packages.
For example: GObject.Object is renamed to gid.gobject2.object.ObjectWrap and Atk.Object is gid.atk1.object.ObjectWrap.


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

C `GObject` types are wrapped as [gid.gobject2.object.ObjectWrap](https://www.kymorphia.com/gid/gid.gobject2.object.ObjectWrap.html) classes.
This rename was done instead of `Object` so as not to conflict with D's native Object type.


### Fluent Builder Pattern

In addition to the usual `new Widget` style object construction, giD also supports the popular fluent builder pattern (also called [Fluent interface](https://en.wikipedia.org/wiki/Fluent_interface)).
This allows for properties to be assigned in a chain prior to actual object construction.
While some may find this convenient it also has the additional capability of assigning construct-only properties.
This is currently the only way to set such properties using the giD API, without having to resort to the C API for object construction.

**Fluent builder example**

```D
auto label = Label.builder.label("Some text").xalign(0).build;
```


### Properties

GObject properties are provided as D `@property` getter and setter methods using **camelCase** names converted from the **kebab-case** GIR property names.

**NOTE:** GObject construct-only properties can only be specified using the fluent builder syntax.
This is because such properties cannot be set after the object has been created.

**Construct-only property example**

```D
auto box = Box.builder.orientation(Orientation.Vertical).spacing(4).margin(10).cssName("container").build;
```
The *cssName* property in this case is a construct-only property.

**NOTE:** The Gtk4 Widget has a `margin` convenience property which provides a way to assign the same value to marginTop, marginBottom, marginStart, and marginEnd.
This property exists in Gtk3, but was removed in the Gtk4 C API.  giD provides it for convenience using either the Widget property or builder methods.


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

Here is an example of what the [command-line](https://www.kymorphia.com/gid/gid.gio2.application.Application.connectCommandLine.html)
signal of [Gio.Application](https://www.kymorphia.com/gid/gid.gio2.application.Application.html) looks like:

```D
ulong connectCommandLine(T)(T callback, Flag!"After" after = No.After)
if (isCallable!T &&
  is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application_command_line.ApplicationCommandLine)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.application.Application)))
  && Parameters!T.length < 3
)
```

The return value from the connect template is a signal handle,
which can be passed to functions in GObject.Global such as: [signalHandlerBlock](https://www.kymorphia.com/gid/gid.gobject2.global.signalHandlerBlock.html),
[signalHandlerDisconnect](https://www.kymorphia.com/gid/gid.gobject2.global.signalHandlerDisconnect.html), etc.

**NOTE:** The return value from signal connection templates is of type `gulong` from the `gid.core.basictypes` module.
This type is an alias to `ulong` (64 bit) on Linux and MacOS, but aliases to `uint` (32 bit) on Windows.
To maintain portability, it is recommended that signal handle variables be declared as type `gulong` (or auto assignment), otherwise compile errors will likely occur on Windows.


## Interfaces

Interfaces result in an interface D module and two additional modules `interface_mixin` and `interface_iface_proxy` which are primarily used internally.
Where **interface** is the interface type name in **snake_case**.
For example, the [gid.gio2.file.File](https://www.kymorphia.com/gid/gid.gio2.file.File.html)
interface would have **gid.gio2.file**, **gid.gio2.file_mixin**, and **gid.gio2.file_iface_proxy** modules.
The first one defines the interface and static methods,
the second defines a mixin template that contains method implementations which is mixed into objects implementing the interface,
and the third defines an interface proxy wrapper object that is used when a C GObject with an unknown type is cast as the interface.


## Boxed Types

GBoxed types are wrapped with an object derived from the abstract [gid.gobject2.boxed.Boxed](https://www.kymorphia.com/gid/gid.gobject2.boxed.Boxed.html) object.
Consult the API documentation for more details on methods specific to these types.


## Simple Structures and Unions

Simple `struct` and `union` types which have no methods or data members requiring memory management are not wrapped with a D Object
and are just created as aliases to the underlying C data type.


## Reference Types

Some non-trivial GIR structure types are not GObject or boxed types but have ref and unref methods.
These are wrapped in D objects, but may lack the ability to copy the underlying C object if no methods are provided to do so.
These types can also inherit from others.

One notable example is [gid.gtk4.expression.Expression](https://www.kymorphia.com/gid/gid.gtk4.expression.Expression.html)
which is an abstract type that several others like
[gid.gtk4.property_expression.ProperyExpression](https://www.kymorphia.com/gid/gid.gtk4.property_expression.PropertyExpression.html) are derived from.
The only useful built-in method is `cPtr` which behaves similar to other uses in the giD API,
with a `Flag!Dup` argument for adding a reference (defaults to No.Dup).


## Wrapped Structures With Fields

Structures or unions which are not simple types and have accessible fields are wrapped by a D object with accessor properties,
which perform data conversion and memory management as needed.
The field names are converted from **snake_case** to D `@property` names with **camelCase**.


## Opaque Structures

Opaque structures which have methods are also wrapped in order to provide convenient access to them from D.


## Value

The [gid.gobject2.value.Value](https://www.kymorphia.com/gid/gid.gobject2.value.Value.html)
wildcard type is wrapped as a boxed type with some additional templates and methods for converting between D types.


### Value Methods

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


## GLib Variant

The [gid.glib2.variant.Variant](https://www.kymorphia.com/gid/gid.glib2.variant.Variant.html)
type provides a way to store structured data of varying types and is very similar to the functionality offered by D
[std.variant](https://dlang.org/phobos/std_variant.html).


### GLib Variant Methods

The following are some of the more prominent giD GLib `Variant` methods.
Please consult the API documentation for a more extensive list.

```D
static gid.glib2.variant.Variant create(T)(T val)
```
For creating a Variant from a single statically typed D value.

```D
static gid.glib2.variant.Variant create(T...)(T vals)
```
For creating a Variant from multiple statically typed D values, the result is a Variant tuple.

```D
T get(T)()
```
Get a single value from a Variant as a static D type. The type must match the Variant value type.

```D
auto get(T...)()
```
Get multiple values from a Variant as static D types. The types must match the Variant value types.


## VariantType

[gid.glib2.variant_type.VariantType](https://www.kymorphia.com/gid/gid.glib2.variant_type.VariantType.html)
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
import gid.glib2.global : timeoutAddSeconds;
import gid.glib2.types : PRIORITY_DEFAULT, SOURCE_CONTINUE;
import core.memory : GC;
import std.stdio : writeln;

timeoutAddSeconds(PRIORITY_DEFAULT, 1, () {
  writeln("GC.collect");
  GC.collect;
  return SOURCE_CONTINUE;
});
```


## Memory Leaks

Currently there are a number of potential memory issues when using giD.
Many of these involve GObject C and D reference cycles.
The D garbage collector (GC) is able to properly collect reference cycles when they involve GC managed memory only.
However, when C and D memory management is involved, interdependencies can cause data from both to become unrecoverable.


### Object Reference Details

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


### Gtk4 Window Leaks

Gtk4 changed the way in which Window (and derived objects like ApplicationWindow) are handled compared to Gtk3.
When Window objects are displayed they are referenced by a global window list. When they are closed, this reference is removed,
which if it was the last reference would cause the recursive destruction of all of its children.
However, signal or other delegate callbacks which are connected to a child object and reference an ancestor object in the delegate context,
results in reference cycles. Gtk3 would call g_object_run_despose() on the window in response to a delete event when closed.

One solution to this is to connect to the `CloseRequest` signal of the Window and call
[runDispose](https://www.kymorphia.com/gid/gid.gobject2.object.ObjectWrap.runDispose.html) on the Window.
Here is an [example](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/app_tree.d#L145) of this.
This causes the tree of C GObjects to remove references to each-other, allowing for D to clean up the wrapper objects.
Even though there still may be reference cycles, they will only be found in D memory which is properly handled.


### Callback Delegate Leaks

A callback delegate has a reference to a parent Widget that results in a reference cycle. Can be either a delegate passed to a method or a signal callback.
One example is when using a `DrawingArea` and using `setDrawFunc` to assign a drawing callback delegate that has a pointer to the parent widget.

A potential workaround is to unset the callback delegate when the widget is going to be destroyed, by connecting to the `unrealize` signal for example.
Here is a [demonstration](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/flow_box.d#L85)
of a solution for this issue. By clearing the drawing function the reference cycle is broken.


### Leaks Caused By Object Class Members

D object has member pointers to child widgets and the D object is used in the context of signals or other delegate callbacks.

A potential solution for this is to connect to a signal that can be used as an indication of the object being destroyed,
such as `CloseRequst` for Window objects or `Unrealize`, and then clearing the member pointers.
Here is an [example](https://github.com/Kymorphia/gid-gtk4-examples/blob/c0572c039510659ee321b841b8094d543f6275e4/source/text_view.d#L52) of this.


### Gtk4 Notebook Tab Widget Leaks

It appears that the widgets added as Notebook tab "labels" leak.
It is suspected that this is a Gtk [bug](https://gitlab.gnome.org/GNOME/gtk/-/issues/5930) which also affects C.
