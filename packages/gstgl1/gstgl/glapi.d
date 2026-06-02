/// Module for [GLAPI] flags namespace
module gstgl.glapi;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLAPI] flags
struct GLAPI
{
  alias Enum = gstgl.types.GLAPI; ///

  /** */
  static gstgl.types.GLAPI fromString(string apiS) nothrow
  {
    GstGLAPI _cretval;
    const(char)* _apiS = apiS.toCString(No.Alloc);
    _cretval = gst_gl_api_from_string(_apiS);
    gstgl.types.GLAPI _retval = cast(gstgl.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  static string toString_(gstgl.types.GLAPI api) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_api_to_string(api);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
