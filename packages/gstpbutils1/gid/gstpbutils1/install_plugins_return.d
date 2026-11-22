/// Module for [InstallPluginsReturn] enum namespace
module gid.gstpbutils1.install_plugins_return;

import gid.core.utils;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.types;

/// Namespace for [InstallPluginsReturn] enum
struct InstallPluginsReturn
{
  alias Enum = gid.gstpbutils1.types.InstallPluginsReturn; ///

  /**
      Convenience function to return the descriptive string associated
      with a status code.  This function returns English strings and
      should not be used for user messages. It is here only to assist
      in debugging.
  
      Params:
        ret = the return status code
      Returns: a descriptive string for the status code in ret
  */
  static string getName(gid.gstpbutils1.types.InstallPluginsReturn ret) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_install_plugins_return_get_name(ret);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
