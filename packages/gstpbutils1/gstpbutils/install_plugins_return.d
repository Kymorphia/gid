/// Module for [InstallPluginsReturn] enum namespace
module gstpbutils.install_plugins_return;

import gid.gid;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.types;

/// Namespace for [InstallPluginsReturn] enum
struct InstallPluginsReturn
{
  alias Enum = gstpbutils.types.InstallPluginsReturn; ///

  /**
      Convenience function to return the descriptive string associated
      with a status code.  This function returns English strings and
      should not be used for user messages. It is here only to assist
      in debugging.
  
      Params:
        ret = the return status code
      Returns: a descriptive string for the status code in ret
  */
  static string getName(gstpbutils.types.InstallPluginsReturn ret) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_install_plugins_return_get_name(ret);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
