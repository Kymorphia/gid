/// C types for gmodule2 library
module gmodule.c.types;

public import gid.basictypes;
public import glib.c.types;

/**
    Errors returned by [gmodule.module_.Module.openFull].
*/
enum GModuleError
{
  /**
      there was an error loading or opening a module file
  */
  Failed = 0,

  /**
      a module returned an error from its `g_module_check_init()` function
  */
  CheckFailed = 1,
}

/**
    Flags passed to [gmodule.module_.Module.open].
    Note that these flags are not supported on all platforms.
*/
enum GModuleFlags : uint
{
  /**
      specifies that symbols are only resolved when
          needed. The default action is to bind all symbols when the module
          is loaded.
  */
  Lazy = 1,

  /**
      specifies that symbols in the module should
          not be added to the global name space. The default action on most
          platforms is to place symbols in the module in the global name space,
          which may cause conflicts with existing symbols.
  */
  Local = 2,

  /**
      mask for all flags.
  */
  Mask = 3,
}

/**
    The #GModule struct is an opaque data structure to represent a
    [dynamically-loaded module](modules.html#dynamic-loading-of-modules).
    It should only be accessed via the following functions.
    
    To ensure correct lock ordering, these functions must not be called from
    global constructors (for example, those using GCC’s
    `__attribute__((constructor))` attribute).
*/
struct ModuleC;

alias extern(C) const(char)* function(ModuleC* module_) GModuleCheckInit;

alias extern(C) void function(ModuleC* module_) GModuleUnload;

