/// Module for [GLAPI] flags namespace
module gid.gstgl1.glapi;

import gid.core.utils;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLAPI] flags
struct GLAPI
{
  alias Enum = gid.gstgl1.types.GLAPI; ///

  /** */
  static gid.gstgl1.types.GLAPI fromString(string apiS) nothrow
  {
    GstGLAPI _cretval;
    const(char)* _apiS = apiS.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_gl_api_from_string(_apiS);
    gid.gstgl1.types.GLAPI _retval = cast(gid.gstgl1.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gid.gstgl1.types.GLAPI api) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_api_to_string(api);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
