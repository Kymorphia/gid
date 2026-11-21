/// Module for [GLSLStage] class
module gid.gstgl1.glslstage;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLSLStage holds and represents a single OpenGL shader stage.
*/
class GLSLStage : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_glsl_stage_get_type != &gidSymbolNotFound ? gst_glsl_stage_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLSLStage";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLSLStage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glslstage.GLSLStage]
      Returns: New builder object
  */
  static GLSLStageGidBuilder builder() nothrow
  {
    return new GLSLStageGidBuilder;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context, uint type) nothrow
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, type);
    this(_cretval, No.Take);
  }

  /** */
  static gid.gstgl1.glslstage.GLSLStage newDefaultFragment(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new_default_fragment(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.Take);
    return _retval;
  }

  /** */
  static gid.gstgl1.glslstage.GLSLStage newDefaultVertex(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstGLSLStage* _cretval;
    _cretval = gst_glsl_stage_new_default_vertex(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.Take);
    return _retval;
  }

  /** */
  static gid.gstgl1.glslstage.GLSLStage newWithString(gid.gstgl1.glcontext.GLContext context, uint type, gid.gstgl1.types.GLSLVersion version_, gid.gstgl1.types.GLSLProfile profile, string str) nothrow
  {
    GstGLSLStage* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_glsl_stage_new_with_string(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, type, version_, profile, _str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.Take);
    return _retval;
  }

  /** */
  static gid.gstgl1.glslstage.GLSLStage newWithStrings(gid.gstgl1.glcontext.GLContext context, uint type, gid.gstgl1.types.GLSLVersion version_, gid.gstgl1.types.GLSLProfile profile, string[] str) nothrow
  {
    GstGLSLStage* _cretval;
    int _nStrings;
    if (str)
      _nStrings = cast(int)str.length;

    auto _str_arr = new char*[](str.length);
    auto _str = cast(char**)_str_arr.ptr;
    foreach (i, s; str) _str[i] = s.toCString!(No.Malloc);
    _cretval = gst_glsl_stage_new_with_strings(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, type, version_, profile, _nStrings, _str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glslstage.GLSLStage)(cast(GstGLSLStage*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool compile()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_glsl_stage_compile(cast(GstGLSLStage*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  uint getHandle() nothrow
  {
    uint _retval;
    _retval = gst_glsl_stage_get_handle(cast(GstGLSLStage*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstgl1.types.GLSLProfile getProfile() nothrow
  {
    GstGLSLProfile _cretval;
    _cretval = gst_glsl_stage_get_profile(cast(GstGLSLStage*)this._cPtr);
    gid.gstgl1.types.GLSLProfile _retval = cast(gid.gstgl1.types.GLSLProfile)_cretval;
    return _retval;
  }

  /** */
  uint getShaderType() nothrow
  {
    uint _retval;
    _retval = gst_glsl_stage_get_shader_type(cast(GstGLSLStage*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstgl1.types.GLSLVersion getVersion() nothrow
  {
    GstGLSLVersion _cretval;
    _cretval = gst_glsl_stage_get_version(cast(GstGLSLStage*)this._cPtr);
    gid.gstgl1.types.GLSLVersion _retval = cast(gid.gstgl1.types.GLSLVersion)_cretval;
    return _retval;
  }

  /**
      Replaces the current shader string with str.
  
      Params:
        version_ = a #GstGLSLVersion
        profile = a #GstGLSLProfile
        str = a GLSL shader string
      Returns: 
  */
  bool setStrings(gid.gstgl1.types.GLSLVersion version_, gid.gstgl1.types.GLSLProfile profile, string[] str) nothrow
  {
    bool _retval;
    int _nStrings;
    if (str)
      _nStrings = cast(int)str.length;

    auto _str_arr = new char*[](str.length);
    auto _str = cast(char**)_str_arr.ptr;
    foreach (i, s; str) _str[i] = s.toCString!(No.Malloc);
    _retval = cast(bool)gst_glsl_stage_set_strings(cast(GstGLSLStage*)this._cPtr, version_, profile, _nStrings, _str);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glslstage.GLSLStage]
class GLSLStageGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glslstage.GLSLStage]
final class GLSLStageGidBuilder : GLSLStageGidBuilderImpl!GLSLStageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLSLStage build() nothrow
  {
    return new GLSLStage(cast(void*)createGObject(GLSLStage._getGType), Yes.Take);
  }
}
