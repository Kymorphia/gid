/// Module for [GLShader] class
module gstgl.glshader;

public import gid.basictypes;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.glslstage;
import gstgl.types;

/** */
class GLShader : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_shader_get_type != &gidSymbolNotFound ? gst_gl_shader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLShader";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLShader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstgl.glshader.GLShader]
      Returns: New builder object
  */
  static GLShaderGidBuilder builder() nothrow
  {
    return new GLShaderGidBuilder;
  }

  /** */
  @property bool linked() nothrow
  {
    return isLinked();
  }

  // Set a uniform value array with a count of vectors/matrices of size values (logs a critical if not a multiple)
  private void _setUniformArray(alias cFunc, size_t size, T, A...)(string funcName, string name, T[] value, A matrixArgs) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (value.length % size != 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstgl.glshader.GLShader.%.*s value length %d is not a multiple of %d",
      cast(int)funcName.length, funcName.ptr, cast(int)value.length, cast(int)size);
      return;
    }

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);

    static if (A.length > 0) // Matrix: gint count, gboolean transpose
      cFunc(cast(GstGLShader*)this._cPtr, _name, cast(int)(value.length / size), matrixArgs[0], value.ptr);
    else
      cFunc(cast(GstGLShader*)this._cPtr, _name, cast(uint)(value.length / size), value.ptr);
  }

  /**
  Perform `glUniform2fv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 2 for each vector (the vector count is value.length / 2)
  */
  void setUniform2fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_2fv, 2)("setUniform2fv", name, value);
  }

  /**
  Perform `glUniform3fv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 3 for each vector (the vector count is value.length / 3)
  */
  void setUniform3fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_3fv, 3)("setUniform3fv", name, value);
  }

  /**
  Perform `glUniform4fv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 4 for each vector (the vector count is value.length / 4)
  */
  void setUniform4fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_4fv, 4)("setUniform4fv", name, value);
  }

  /**
  Perform `glUniform2iv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 2 for each vector (the vector count is value.length / 2)
  */
  void setUniform2iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_2iv, 2)("setUniform2iv", name, value);
  }

  /**
  Perform `glUniform3iv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 3 for each vector (the vector count is value.length / 3)
  */
  void setUniform3iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_3iv, 3)("setUniform3iv", name, value);
  }

  /**
  Perform `glUniform4iv()` for name on shader.
  Params:
  name = name of the uniform
  value = values to set, 4 for each vector (the vector count is value.length / 4)
  */
  void setUniform4iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_4iv, 4)("setUniform4iv", name, value);
  }

  /**
  Perform `glUniformMatrix2fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 4 for each 2x2 matrix (the matrix count is value.length / 4)
  */
  void setUniformMatrix2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2fv, 4)("setUniformMatrix2fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix2x3fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 6 for each 2x3 matrix (the matrix count is value.length / 6)
  */
  void setUniformMatrix2x3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2x3fv, 6)("setUniformMatrix2x3fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix2x4fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 8 for each 2x4 matrix (the matrix count is value.length / 8)
  */
  void setUniformMatrix2x4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2x4fv, 8)("setUniformMatrix2x4fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix3fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 9 for each 3x3 matrix (the matrix count is value.length / 9)
  */
  void setUniformMatrix3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3fv, 9)("setUniformMatrix3fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix3x2fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 6 for each 3x2 matrix (the matrix count is value.length / 6)
  */
  void setUniformMatrix3x2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3x2fv, 6)("setUniformMatrix3x2fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix3x4fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 12 for each 3x4 matrix (the matrix count is value.length / 12)
  */
  void setUniformMatrix3x4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3x4fv, 12)("setUniformMatrix3x4fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix4fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 16 for each 4x4 matrix (the matrix count is value.length / 16)
  */
  void setUniformMatrix4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4fv, 16)("setUniformMatrix4fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix4x2fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 8 for each 4x2 matrix (the matrix count is value.length / 8)
  */
  void setUniformMatrix4x2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4x2fv, 8)("setUniformMatrix4x2fv", name, value, transpose);
  }

  /**
  Perform `glUniformMatrix4x3fv()` for name on shader.
  Params:
  name = name of the uniform
  transpose = transpose the matrix
  value = values to set, 12 for each 4x3 matrix (the matrix count is value.length / 12)
  */
  void setUniformMatrix4x3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4x3fv, 12)("setUniformMatrix4x3fv", name, value, transpose);
  }

  /**
      Note: must be called in the GL thread
  
      Params:
        context = a #GstGLContext
      Returns: a new empty shader
  */
  this(gstgl.glcontext.GLContext context) nothrow
  {
    GstGLShader* _cretval;
    _cretval = gst_gl_shader_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Note: must be called in the GL thread
  
      Params:
        context = a #GstGLContext
      Returns: a default shader or null on failure
      Throws: [ErrorWrap]
  */
  static gstgl.glshader.GLShader newDefault(gstgl.glcontext.GLContext context)
  {
    GstGLShader* _cretval;
    GError *_err;
    _cretval = gst_gl_shader_new_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glshader.GLShader)(cast(GstGLShader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static string stringFragmentExternalOesGetDefault(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_shader_string_fragment_external_oes_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  static string stringFragmentGetDefault(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_shader_string_fragment_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Generates a shader string that defines the precision of float types in
      GLSL shaders.  This is particularly needed for fragment shaders in a
      GLSL ES context where there is no default precision specified.
      
      Practically, this will return the string 'precision mediump float'
      or 'precision highp float' depending on if high precision floats are
      determined to be supported.
  
      Params:
        context = a #GstGLContext
        version_ = a #GstGLSLVersion
        profile = a #GstGLSLProfile
      Returns: a shader string defining the precision of float types based on
             context, version and profile
  */
  static string stringGetHighestPrecision(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_gl_shader_string_get_highest_precision(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Attaches stage to shader.  stage must have been successfully compiled
      with [gstgl.glslstage.GLSLStage.compile].
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
      Returns: whether stage could be attached to shader
  */
  bool attach(gstgl.glslstage.GLSLStage stage) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_shader_attach(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Attaches stage to shader.  stage must have been successfully compiled
      with [gstgl.glslstage.GLSLStage.compile].
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
      Returns: whether stage could be attached to shader
  */
  bool attachUnlocked(gstgl.glslstage.GLSLStage stage) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_shader_attach_unlocked(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Bind attribute name to the specified location index using
      `glBindAttributeLocation()`.
  
      Params:
        index = attribute index to set
        name = name of the attribute
  */
  void bindAttributeLocation(uint index, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_bind_attribute_location(cast(GstGLShader*)this._cPtr, index, _name);
  }

  /**
      Bind attribute name to the specified location index using
      `glBindFragDataLocation()`.
  
      Params:
        index = attribute index to set
        name = name of the attribute
  */
  void bindFragDataLocation(uint index, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_bind_frag_data_location(cast(GstGLShader*)this._cPtr, index, _name);
  }

  /**
      Compiles stage and attaches it to shader.
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
      Returns: whether stage could be compiled and attached to shader
      Throws: [ErrorWrap]
  */
  bool compileAttachStage(gstgl.glslstage.GLSLStage stage)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_gl_shader_compile_attach_stage(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Detaches stage from shader.  stage must have been successfully attached
      to shader with [gstgl.glshader.GLShader.attach] or [gstgl.glshader.GLShader.attachUnlocked].
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
  */
  void detach(gstgl.glslstage.GLSLStage stage) nothrow
  {
    gst_gl_shader_detach(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null);
  }

  /**
      Detaches stage from shader.  stage must have been successfully attached
      to shader with [gstgl.glshader.GLShader.attach] or [gstgl.glshader.GLShader.attachUnlocked].
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
  */
  void detachUnlocked(gstgl.glslstage.GLSLStage stage) nothrow
  {
    gst_gl_shader_detach_unlocked(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null);
  }

  /** */
  int getAttributeLocation(string name) nothrow
  {
    int _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = gst_gl_shader_get_attribute_location(cast(GstGLShader*)this._cPtr, _name);
    return _retval;
  }

  /** */
  int getProgramHandle() nothrow
  {
    int _retval;
    _retval = gst_gl_shader_get_program_handle(cast(GstGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Note: must be called in the GL thread
      Returns: whether shader has been successfully linked
  */
  bool isLinked() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_shader_is_linked(cast(GstGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Links the current list of #GstGLSLStage's in shader.
      
      Note: must be called in the GL thread
      Returns: whether shader could be linked together.
      Throws: [ErrorWrap]
  */
  bool link()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_gl_shader_link(cast(GstGLShader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Releases the shader and stages.
      
      Note: must be called in the GL thread
  */
  void release() nothrow
  {
    gst_gl_shader_release(cast(GstGLShader*)this._cPtr);
  }

  /**
      Releases the shader and stages.
      
      Note: must be called in the GL thread
  */
  void releaseUnlocked() nothrow
  {
    gst_gl_shader_release_unlocked(cast(GstGLShader*)this._cPtr);
  }

  /**
      Perform `glUniform1f()` for name on shader
  
      Params:
        name = name of the uniform
        value = value to set
  */
  void setUniform1f(string name, float value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_1f(cast(GstGLShader*)this._cPtr, _name, value);
  }

  /**
      Perform `glUniform1fv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform1fv(string name, float[] value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(float*)value.ptr;
    gst_gl_shader_set_uniform_1fv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform1i()` for name on shader
  
      Params:
        name = name of the uniform
        value = value to set
  */
  void setUniform1i(string name, int value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_1i(cast(GstGLShader*)this._cPtr, _name, value);
  }

  /**
      Perform `glUniform1iv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform1iv(string name, int[] value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(int*)value.ptr;
    gst_gl_shader_set_uniform_1iv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform2f()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
  */
  void setUniform2f(string name, float v0, float v1) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_2f(cast(GstGLShader*)this._cPtr, _name, v0, v1);
  }

  /**
      Perform `glUniform2i()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
  */
  void setUniform2i(string name, int v0, int v1) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_2i(cast(GstGLShader*)this._cPtr, _name, v0, v1);
  }

  /**
      Perform `glUniform3f()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
  */
  void setUniform3f(string name, float v0, float v1, float v2) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_3f(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2);
  }

  /**
      Perform `glUniform3i()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
  */
  void setUniform3i(string name, int v0, int v1, int v2) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_3i(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2);
  }

  /**
      Perform `glUniform4f()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
        v3 = fourth value to set
  */
  void setUniform4f(string name, float v0, float v1, float v2, float v3) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_4f(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2, v3);
  }

  /**
      Perform `glUniform4i()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
        v3 = fourth value to set
  */
  void setUniform4i(string name, int v0, int v1, int v2, int v3) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gst_gl_shader_set_uniform_4i(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2, v3);
  }

  /**
      Mark's shader as being used for the next GL draw command.
      
      Note: must be called in the GL thread and shader must have been linked.
  */
  void use() nothrow
  {
    gst_gl_shader_use(cast(GstGLShader*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gstgl.glshader.GLShader]
class GLShaderGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glshader.GLShader]
final class GLShaderGidBuilder : GLShaderGidBuilderImpl!GLShaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLShader build() nothrow
  {
    return new GLShader(cast(void*)createGObject(GLShader._getGType), Yes.Take);
  }
}
