/// Module for [IOModuleScope] class
module gid.gio2.iomodule_scope;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;

/**
    Represents a scope for loading IO modules. A scope can be used for blocking
    duplicate modules, or blocking a module you don't want to load.
    
    The scope can be used with [gid.gio2.global.ioModulesLoadAllInDirectoryWithScope]
    or [gid.gio2.global.ioModulesScanAllInDirectoryWithScope].
*/
class IOModuleScope : OpaqueWrap!(GIOModuleScope*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Block modules with the given basename from being loaded when
      this scope is used with [gid.gio2.global.ioModulesScanAllInDirectoryWithScope]
      or [gid.gio2.global.ioModulesLoadAllInDirectoryWithScope].
  
      Params:
        basename = the basename to block
  */
  void block(string basename) nothrow
  {
    const(char)* _basename = basename.toCString!(No.Malloc, No.Nullable);
    g_io_module_scope_block(cast(GIOModuleScope*)this._cPtr, _basename);
  }
}
