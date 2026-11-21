/// Module for [GLConfigSurfaceType] flags namespace
module gid.gstgl1.glconfig_surface_type;

import gid.core.gid;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLConfigSurfaceType] flags
struct GLConfigSurfaceType
{
  alias Enum = gid.gstgl1.types.GLConfigSurfaceType; ///

  /** */
  static string toString_(gid.gstgl1.types.GLConfigSurfaceType surfaceType) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_config_surface_type_to_string(surfaceType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
