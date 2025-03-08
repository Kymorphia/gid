module gio.iomodule_scope;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Represents a scope for loading IO modules. A scope can be used for blocking
  duplicate modules, or blocking a module you don't want to load.
  
  The scope can be used with [gio.global.ioModulesLoadAllInDirectoryWithScope]
  or [gio.global.ioModulesScanAllInDirectoryWithScope].
*/
class IOModuleScope
{
  GIOModuleScope* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.IOModuleScope");

    cInstancePtr = cast(GIOModuleScope*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Block modules with the given basename from being loaded when
    this scope is used with [gio.global.ioModulesScanAllInDirectoryWithScope]
    or [gio.global.ioModulesLoadAllInDirectoryWithScope].
    Params:
      basename =       the basename to block
  */
  void block(string basename)
  {
    const(char)* _basename = basename.toCString(No.alloc);
    g_io_module_scope_block(cast(GIOModuleScope*)cPtr, _basename);
  }
}
