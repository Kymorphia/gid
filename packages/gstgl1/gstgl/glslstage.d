module gstgl.glslstage;

import gid.gid;
import glib.error;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLSLStage holds and represents a single OpenGL shader stage.
*/
class GLSLStage : gst.object.ObjectGst
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_glsl_stage_get_type != &gidSymbolNotFound ? gst_glsl_stage_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(gstgl.glcontext.GLContext context, uint type)
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new(context ? cast(GstGLContext*)context.cPtr(No.dup) : null, type);
    this(_cretval, No.take);
  }

  /** */
  static gstgl.glslstage.GLSLStage newDefaultFragment(gstgl.glcontext.GLContext context)
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new_default_fragment(context ? cast(GstGLContext*)context.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gstgl.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.take);
    return _retval;
  }

  /** */
  static gstgl.glslstage.GLSLStage newDefaultVertex(gstgl.glcontext.GLContext context)
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new_default_vertex(context ? cast(GstGLContext*)context.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gstgl.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.take);
    return _retval;
  }

  /** */
  static gstgl.glslstage.GLSLStage newWithString(gstgl.glcontext.GLContext context, uint type, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile, string str)
  {
    GstGLSLStage* _cretval;
    const(char)* _str = str.toCString(No.alloc);
    _cretval = gst_glsl_stage_new_with_string(context ? cast(GstGLContext*)context.cPtr(No.dup) : null, type, version_, profile, _str);
    auto _retval = ObjectG.getDObject!(gstgl.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.take);
    return _retval;
  }

  /** */
  static gstgl.glslstage.GLSLStage newWithStrings(gstgl.glcontext.GLContext context, uint type, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile, string[] str)
  {
    GstGLSLStage* _cretval;
    int _nStrings;
    if (str)
      _nStrings = cast(int)str.length;

    char*[] _tmpstr;
    foreach (s; str)
      _tmpstr ~= s.toCString(No.alloc);
    const(char*)* _str = _tmpstr.ptr;
    _cretval = gst_glsl_stage_new_with_strings(context ? cast(GstGLContext*)context.cPtr(No.dup) : null, type, version_, profile, _nStrings, _str);
    auto _retval = ObjectG.getDObject!(gstgl.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.take);
    return _retval;
  }

  /** */
  bool compile()
  {
    bool _retval;
    GError *_err;
    _retval = gst_glsl_stage_compile(cast(GstGLSLStage*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  uint getHandle()
  {
    uint _retval;
    _retval = gst_glsl_stage_get_handle(cast(GstGLSLStage*)cPtr);
    return _retval;
  }

  /** */
  gstgl.types.GLSLProfile getProfile()
  {
    GstGLSLProfile _cretval;
    _cretval = gst_glsl_stage_get_profile(cast(GstGLSLStage*)cPtr);
    gstgl.types.GLSLProfile _retval = cast(gstgl.types.GLSLProfile)_cretval;
    return _retval;
  }

  /** */
  uint getShaderType()
  {
    uint _retval;
    _retval = gst_glsl_stage_get_shader_type(cast(GstGLSLStage*)cPtr);
    return _retval;
  }

  /** */
  gstgl.types.GLSLVersion getVersion()
  {
    GstGLSLVersion _cretval;
    _cretval = gst_glsl_stage_get_version(cast(GstGLSLStage*)cPtr);
    gstgl.types.GLSLVersion _retval = cast(gstgl.types.GLSLVersion)_cretval;
    return _retval;
  }

  /**
      Replaces the current shader string with str.
    Params:
      version_ =       a #GstGLSLVersion
      profile =       a #GstGLSLProfile
      str =       a GLSL shader string
    Returns: 
  */
  bool setStrings(gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile, string[] str)
  {
    bool _retval;
    int _nStrings;
    if (str)
      _nStrings = cast(int)str.length;

    char*[] _tmpstr;
    foreach (s; str)
      _tmpstr ~= s.toCString(No.alloc);
    const(char*)* _str = _tmpstr.ptr;
    _retval = gst_glsl_stage_set_strings(cast(GstGLSLStage*)cPtr, version_, profile, _nStrings, _str);
    return _retval;
  }
}
