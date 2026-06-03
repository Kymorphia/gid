/// Module for [GLConfigCaveat] enum namespace
module gstgl.glconfig_caveat;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLConfigCaveat] enum
struct GLConfigCaveat
{
  alias Enum = gstgl.types.GLConfigCaveat; ///

  /** */
  static string toString_(gstgl.types.GLConfigCaveat caveat) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_config_caveat_to_string(caveat);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
