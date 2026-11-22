/// C functions for gmodule2 library
module gid.gmodule2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gmodule2.c.types;
static import gid.gmodule2.c._gidlib_GModule;
public import gid.glib2.c.types;

private immutable LIBS = ["gmodule-2.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gmodule2.c._gidlib_GModule.gidLibLinked;

// Module
private alias c_g_module_closeFn = extern(C) gboolean function(ModuleC* module_) nothrow;
__gshared c_g_module_closeFn c_g_module_close; ///
private alias c_g_module_make_residentFn = extern(C) void function(ModuleC* module_) nothrow;
__gshared c_g_module_make_residentFn c_g_module_make_resident; ///
private alias c_g_module_nameFn = extern(C) const(char)* function(ModuleC* module_) nothrow;
__gshared c_g_module_nameFn c_g_module_name; ///
private alias c_g_module_symbolFn = extern(C) gboolean function(ModuleC* module_, const(char)* symbolName, void** symbol) nothrow;
__gshared c_g_module_symbolFn c_g_module_symbol; ///
private alias c_g_module_build_pathFn = extern(C) char* function(const(char)* directory, const(char)* moduleName) nothrow;
__gshared c_g_module_build_pathFn c_g_module_build_path; ///
private alias c_g_module_errorFn = extern(C) const(char)* function() nothrow;
__gshared c_g_module_errorFn c_g_module_error; ///
private alias c_g_module_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_module_error_quarkFn c_g_module_error_quark; ///
private alias c_g_module_openFn = extern(C) ModuleC* function(const(char)* fileName, GModuleFlags flags) nothrow;
__gshared c_g_module_openFn c_g_module_open; ///
private alias c_g_module_open_fullFn = extern(C) ModuleC* function(const(char)* fileName, GModuleFlags flags, GError** _err) nothrow;
__gshared c_g_module_open_fullFn c_g_module_open_full; ///
private alias c_g_module_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_g_module_supportedFn c_g_module_supported; ///

// Module

/** */
alias g_module_close = c_g_module_close;

/** */
alias g_module_make_resident = c_g_module_make_resident;

/** */
alias g_module_name = c_g_module_name;

/** */
alias g_module_symbol = c_g_module_symbol;

/** */
alias g_module_build_path = c_g_module_build_path;

/** */
alias g_module_error = c_g_module_error;

/** */
alias g_module_error_quark = c_g_module_error_quark;

/** */
alias g_module_open = c_g_module_open;

/** */
alias g_module_open_full = c_g_module_open_full;

/** */
alias g_module_supported = c_g_module_supported;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gmodule2", "GModule");

  // Module
  gidLink(cast(void**)&g_module_close, "g_module_close", libs);
  gidLink(cast(void**)&g_module_make_resident, "g_module_make_resident", libs);
  gidLink(cast(void**)&g_module_name, "g_module_name", libs);
  gidLink(cast(void**)&g_module_symbol, "g_module_symbol", libs);
  gidLink(cast(void**)&g_module_build_path, "g_module_build_path", libs);
  gidLink(cast(void**)&g_module_error, "g_module_error", libs);
  gidLink(cast(void**)&g_module_error_quark, "g_module_error_quark", libs);
  gidLink(cast(void**)&g_module_open, "g_module_open", libs);
  gidLink(cast(void**)&g_module_open_full, "g_module_open_full", libs);
  gidLink(cast(void**)&g_module_supported, "g_module_supported", libs);
}
