/// Module for [Module] class
module gmodule.module_;

import gid.gid;
import glib.error;
import glib.types;
import gmodule.c.functions;
import gmodule.c.types;
import gmodule.types;

/**
    The #GModule struct is an opaque data structure to represent a
    [dynamically-loaded module][glib-Dynamic-Loading-of-Modules].
    It should only be accessed via the following functions.
*/
class Module
{
  ModuleC* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gmodule.module_.Module");

    _cInstancePtr = cast(ModuleC*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Closes a module.
      Returns: true on success
  */
  bool close()
  {
    bool _retval;
    _retval = cast(bool)g_module_close(cast(ModuleC*)this._cPtr);
    return _retval;
  }

  /**
      Ensures that a module will never be unloaded.
      Any future [gmodule.module_.Module.close] calls on the module will be ignored.
  */
  void makeResident()
  {
    g_module_make_resident(cast(ModuleC*)this._cPtr);
  }

  /**
      Returns the filename that the module was opened with.
      
      If module refers to the application itself, "main" is returned.
      Returns: the filename of the module
  */
  string name()
  {
    const(char)* _cretval;
    _cretval = g_module_name(cast(ModuleC*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a symbol pointer from a module, such as one exported
      by `G_MODULE_EXPORT`. Note that a valid symbol can be null.
  
      Params:
        symbolName = the name of the symbol to find
        symbol = returns the pointer to the symbol value
      Returns: true on success
  */
  bool symbol(string symbolName, out void* symbol)
  {
    bool _retval;
    const(char)* _symbolName = symbolName.toCString(No.Alloc);
    _retval = cast(bool)g_module_symbol(cast(ModuleC*)this._cPtr, _symbolName, cast(void**)&symbol);
    return _retval;
  }

  /**
      A portable way to build the filename of a module. The platform-specific
      prefix and suffix are added to the filename, if needed, and the result
      is added to the directory, using the correct separator character.
      
      The directory should specify the directory where the module can be found.
      It can be null or an empty string to indicate that the module is in a
      standard platform-specific directory, though this is not recommended
      since the wrong module may be found.
      
      For example, calling [gmodule.module_.Module.buildPath] on a Linux system with a
      directory of `/lib` and a module_name of "mylibrary" will return
      `/lib/libmylibrary.so`. On a Windows system, using `\Windows` as the
      directory it will return `\Windows\mylibrary.dll`.
  
      Params:
        directory = the directory where the module is. This can be
              null or the empty string to indicate that the standard platform-specific
              directories will be used, though that is not recommended
        moduleName = the name of the module
      Returns: the complete path of the module, including the standard library
            prefix and suffix. This should be freed when no longer needed
  
      Deprecated: Use [gmodule.module_.Module.open] instead with module_name as the
        basename of the file_name argument. See `G_MODULE_SUFFIX` for why.
  */
  static string buildPath(string directory, string moduleName)
  {
    char* _cretval;
    const(char)* _directory = directory.toCString(No.Alloc);
    const(char)* _moduleName = moduleName.toCString(No.Alloc);
    _cretval = g_module_build_path(_directory, _moduleName);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets a string describing the last module error.
      Returns: a string describing the last module error
  */
  static string error()
  {
    const(char)* _cretval;
    _cretval = g_module_error();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_module_error_quark();
    return _retval;
  }

  /**
      Checks if modules are supported on the current platform.
      Returns: true if modules are supported
  */
  static bool supported()
  {
    bool _retval;
    _retval = cast(bool)g_module_supported();
    return _retval;
  }
}

class ModuleException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gmodule.module_.Module.errorQuark, cast(int)code, msg);
  }

  alias Code = ModuleError;
}
