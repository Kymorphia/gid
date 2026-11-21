/// Module for [GLConfigCaveat] enum namespace
module gid.gstgl1.glconfig_caveat;

import gid.core.gid;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLConfigCaveat] enum
struct GLConfigCaveat
{
  alias Enum = gid.gstgl1.types.GLConfigCaveat; ///

  /** */
  static string toString_(gid.gstgl1.types.GLConfigCaveat caveat) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_config_caveat_to_string(caveat);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
