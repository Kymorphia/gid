# Exporting a D library for C, Python and other languages (DiG)

DiG lets a D library define GObject types that any GObject language can use. You write ordinary D classes, mark
what to export, and build three things from the same sources:

- the shared library (`libmylib.so`),
- a C header (`mylib.h`) for C and C++ programs,
- a GIR file (`Mylib-1.0.gir`), compiled to a typelib for Python (PyGObject), GJS, Vala and gidgen itself.

## 1. Declare the namespace

Every exported type belongs to a namespace, declared once per module. The namespace prefixes the type names
(`MylibCounter`) and the C functions (`mylib_counter_new`). Give it a version so other libraries and the GIR
tools can refer to it:

```d
module mylib.counter;

import gid.gobject2.object;

mixin GObjectNamespace!("Mylib", "1.0");
```

## 2. Export classes

Add `mixin GObjectExport;` to a class derived from a giD class (`ObjectWrap` for a plain GObject, or any binding
class such as `gid.gtk4.widget.Widget`), and mark the members to export:

```d
class Counter : ObjectWrap
{
  mixin GObjectExport;

  @gProperty int step = 1;                                   // GObject property "step"

  @gSignal void overflow(int value) {}                       // GObject signal "overflow"

  @gVirtual protected int vfuncNext(int value)               // Virtual method "next", overridable from C/Python,
  {                                                          // called from C with mylib_counter_next()
    return value + step;
  }

  @gMethod int addTwice(int x) { return x * 2; }             // mylib_counter_add_twice(self, x)

  @gMethod @gThrows void load(string path) { ... }           // mylib_counter_load(self, path, &error): a D
                                                             // exception becomes a GError
  @gMethod @gConstructor static Counter withStep(int s)      // mylib_counter_new_with_step(s)
  {
    auto c = new Counter;
    c.step = s;
    return c;
  }
}
```

A class with a public default constructor also gets `mylib_counter_new()`. Other useful attributes:
`@gNullable` (the value can be NULL/None), `@gTransfer(GidOwnership.None)` (return an object without a new
reference) and `@gNoExport` (leave a member out). D interfaces are exported with `mixin GInterfaceExport;` and
their `@gVirtual` methods.

### Exporting without attributes

Instead of marking every member, pass export flags to the class (or to `GObjectNamespace` as the default of the
module):

```d
mixin GObjectNamespace!("Mylib", "1.0", GidExport.Methods | GidExport.Properties);

class Auto : ObjectWrap
{
  mixin GObjectExport;                  // or GObjectExport!(GidExport.All), or mixin GObjectExportAll;

  int add(int x) { return x + 1; }      // mylib_auto_add(self, x)
  @property int level() { ... }         // GObject property "level"
  @property void level(int v) { ... }
  @gNoExport void internalOnly() {}     // left out
}
```

`Methods` exports public methods, `Functions` public static methods, `Properties` D `@property` accessors,
`Throws` gives members that aren't `nothrow` a `GError **error` parameter, and `All` is all of them. Members with
types DiG can't export are reported at compile time (`GidSkip.Warn`, the default), or ignored (`GidSkip.Silent`),
or rejected (`GidSkip.Error`).

## 3. Add the GIR program

Mix in `GObjectGirMain` under `version (GidGir)`, listing the modules that declare exported types:

```d
// mylib/package.d
module mylib;
public import mylib.counter;

version (GidGir) mixin GObjectGirMain!(GirInfo("Mylib", null, "libmylib.so"), mylib.counter);
```

`null` takes the version from `GObjectNamespace`. Then add a `gir` configuration to `dub.json`:

```json
{
  "name": "mylib",
  "targetType": "dynamicLibrary",
  "dependencies": { "gid:glib2": "*" },
  "dflags-ldc": ["-link-defaultlib-shared"],
  "dflags-dmd": ["-defaultlib=libphobos2.so"],
  "configurations": [
    { "name": "library" },
    { "name": "gir", "targetType": "executable", "targetName": "mylib-gir", "versions": ["GidGir"] }
  ]
}
```

## 4. Build

```sh
dub build                                   # libmylib.so
dub run -c gir                              # Mylib-1.0.gir and mylib.h
g-ir-compiler Mylib-1.0.gir -o Mylib-1.0.typelib
```

Options of the gir program: `--gir FILE` and `--header FILE` write other files (`-` for the standard output),
`--no-header` skips the header, `--shared-library NAME` changes the library name stored in the GIR.

The header is named after the namespace in snake case (`mylib.h`, `my_lib.h` for `MyLib`). To choose another
name, give it as the first entry of `GirInfo.cIncludes`; the GIR refers to the header with `<c:include>` either way.

## 5. Use it from C

The header has the usual GObject declarations:

- type macros: `MYLIB_TYPE_COUNTER`, `MYLIB_COUNTER(obj)`, `MYLIB_IS_COUNTER(obj)`, `MYLIB_COUNTER_CLASS(klass)`,
  `MYLIB_IS_COUNTER_CLASS(klass)`, `MYLIB_COUNTER_GET_CLASS(obj)`, and `MYLIB_SHAPE_GET_IFACE(obj)` for interfaces,
- the instance struct (`MylibCounter`, its parent only, the D state isn't visible), the class struct
  (`MylibCounterClass`, with a slot per `@gVirtual` method) and interface structs (`MylibShapeInterface`),
- `mylib_counter_get_type()`, the constructors, methods, functions and virtual method invokers.

```c
#include <mylib.h>

int main (void)
{
  MylibCounter *c = mylib_counter_new_with_step (5);
  GError *error = NULL;

  g_print ("%d\n", mylib_counter_next (c, 1));             /* 6 */
  mylib_counter_load (c, "/nonexistent", &error);
  if (error)
    g_clear_error (&error);
  g_object_unref (c);
  return 0;
}
```

```sh
gcc app.c -o app $(pkg-config --cflags --libs gobject-2.0) -I. -L. -lmylib
```

C code can subclass exported classes and override their virtual methods through the class struct, and implement
exported interfaces, as with any GObject library. The D runtime starts when the library is loaded; no D `main` is
needed.

## 6. Use it from Python

```python
import gi
gi.require_version("Mylib", "1.0")
from gi.repository import Mylib

c = Mylib.Counter.new_with_step(5)
print(c.next(1), c.props.step)
c.connect("overflow", lambda obj, value: print("overflow", value))

class Faster(Mylib.Counter):
    def do_next(self, value):                    # Overrides the D virtual method
        return value + 10
```

```sh
GI_TYPELIB_PATH=. LD_LIBRARY_PATH=. python3 app.py
```

## 7. Several D libraries

A library can use the exported types of another D library: import its D module as usual. Its GIR then includes
the other namespace (`<include name="Widgets" version="1.0"/>`) and its header includes the other header
(`widgets.h`). Compile the GIR with `g-ir-compiler --includedir=DIR` where `DIR` has the other GIR.

**Shared D runtime.** Every D library and D program loaded into one process must link the shared D runtime, as in
the `dub.json` above (`-link-defaultlib-shared` for LDC, `-defaultlib=libphobos2.so` for DMD). Otherwise loading
a second D binary (Python importing two D libraries, or a D program using a D library) aborts with "Only one D
shared object allowed for static runtime". A single D library used from C or Python works with either runtime.

## 8. Limits

Exported APIs can use basic types, strings, string arrays, `GLib.Variant`, binding classes, interfaces, enums and
flags, and the exported types of the same or other D libraries. Not yet: interface properties and signals,
D-defined enums, flags and boxed types in the GIR (D enums appear as integers), other array types, and doc
comments in the GIR and the header. See [DiG-design-notes.md](DiG-design-notes.md) for how it works.
