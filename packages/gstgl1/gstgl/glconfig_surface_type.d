/// Module for [GLConfigSurfaceType] flags namespace
module gstgl.glconfig_surface_type;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLConfigSurfaceType] flags
struct GLConfigSurfaceType
{
  alias Enum = gstgl.types.GLConfigSurfaceType; ///

  /** */
  static string toString_(gstgl.types.GLConfigSurfaceType surfaceType) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_config_surface_type_to_string(surfaceType);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
