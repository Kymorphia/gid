/// Global functions for gstglegl1 library
module gstglegl.global;

import gid.gid;
import gst.memory;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;


/** */
string eglGetErrorString(int err)
{
  const(char)* _cretval;
  _cretval = gst_egl_get_error_string(err);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/** */
bool isGlMemoryEgl(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_memory_egl(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}
