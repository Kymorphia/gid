/// D types for gmodule2 library
module gid.gmodule2.types;

import gid.core.gid;
import gid.gmodule2.c.functions;
import gid.gmodule2.c.types;
import gid.gmodule2.module_;


// Enums

/** */
alias ModuleError = GModuleError;

/** */
alias ModuleFlags = GModuleFlags;

// Callbacks

/**
    Specifies the type of the module function called when it is unloaded.
    If a module contains a function named g_module_unload() it is called
    automatically when the module is unloaded.
    It is passed the #GModule structure.

    Params:
      module_ = the #GModule about to be unloaded
*/
alias ModuleUnload = void delegate(gid.gmodule2.module_.Module module_);

/** */
enum MODULE_IMPL_AR = 7;

/** */
enum MODULE_IMPL_DL = 1;

/** */
enum MODULE_IMPL_NONE = 0;

/** */
enum MODULE_IMPL_WIN32 = 3;
