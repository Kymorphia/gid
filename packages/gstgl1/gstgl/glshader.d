/// Module for [GLShader] class
module gstgl.glshader;

import gid.gid;
import glib.error;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_shader_get_type != &gidSymbolNotFound ? gst_gl_shader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLShader self()
  {
    return this;
  }

  /** */
  @property bool linked()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("linked");
  }

  /**
      Note: must be called in the GL thread
  
      Params:
        context = a #GstGLContext
      Returns: a new empty shader
  */
  this(gstgl.glcontext.GLContext context)
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
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glshader.GLShader)(cast(GstGLShader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static string stringFragmentExternalOesGetDefault(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    char* _cretval;
    _cretval = gst_gl_shader_string_fragment_external_oes_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  static string stringFragmentGetDefault(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    char* _cretval;
    _cretval = gst_gl_shader_string_fragment_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
  static string stringGetHighestPrecision(gstgl.glcontext.GLContext context, gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    const(char)* _cretval;
    _cretval = gst_gl_shader_string_get_highest_precision(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, version_, profile);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  bool attach(gstgl.glslstage.GLSLStage stage)
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
  bool attachUnlocked(gstgl.glslstage.GLSLStage stage)
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
  void bindAttributeLocation(uint index, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_bind_attribute_location(cast(GstGLShader*)this._cPtr, index, _name);
  }

  /**
      Bind attribute name to the specified location index using
      `glBindFragDataLocation()`.
  
      Params:
        index = attribute index to set
        name = name of the attribute
  */
  void bindFragDataLocation(uint index, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
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
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Detaches stage from shader.  stage must have been successfully attached
      to shader with [gstgl.glshader.GLShader.attach] or [gstgl.glshader.GLShader.attachUnlocked].
      
      Note: must be called in the GL thread
  
      Params:
        stage = a #GstGLSLStage to attach
  */
  void detach(gstgl.glslstage.GLSLStage stage)
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
  void detachUnlocked(gstgl.glslstage.GLSLStage stage)
  {
    gst_gl_shader_detach_unlocked(cast(GstGLShader*)this._cPtr, stage ? cast(GstGLSLStage*)stage._cPtr(No.Dup) : null);
  }

  /** */
  int getAttributeLocation(string name)
  {
    int _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gst_gl_shader_get_attribute_location(cast(GstGLShader*)this._cPtr, _name);
    return _retval;
  }

  /** */
  int getProgramHandle()
  {
    int _retval;
    _retval = gst_gl_shader_get_program_handle(cast(GstGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Note: must be called in the GL thread
      Returns: whether shader has been successfully linked
  */
  bool isLinked()
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
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Releases the shader and stages.
      
      Note: must be called in the GL thread
  */
  void release()
  {
    gst_gl_shader_release(cast(GstGLShader*)this._cPtr);
  }

  /**
      Releases the shader and stages.
      
      Note: must be called in the GL thread
  */
  void releaseUnlocked()
  {
    gst_gl_shader_release_unlocked(cast(GstGLShader*)this._cPtr);
  }

  /**
      Perform `glUniform1f()` for name on shader
  
      Params:
        name = name of the uniform
        value = value to set
  */
  void setUniform1f(string name, float value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_1f(cast(GstGLShader*)this._cPtr, _name, value);
  }

  /**
      Perform `glUniform1fv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform1fv(string name, float[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(float)*)value.ptr;
    gst_gl_shader_set_uniform_1fv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform1i()` for name on shader
  
      Params:
        name = name of the uniform
        value = value to set
  */
  void setUniform1i(string name, int value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_1i(cast(GstGLShader*)this._cPtr, _name, value);
  }

  /**
      Perform `glUniform1iv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform1iv(string name, int[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(int)*)value.ptr;
    gst_gl_shader_set_uniform_1iv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform2f()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
  */
  void setUniform2f(string name, float v0, float v1)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_2f(cast(GstGLShader*)this._cPtr, _name, v0, v1);
  }

  /**
      Perform `glUniform2fv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform2fv(string name, float[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(float)*)value.ptr;
    gst_gl_shader_set_uniform_2fv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform2i()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
  */
  void setUniform2i(string name, int v0, int v1)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_2i(cast(GstGLShader*)this._cPtr, _name, v0, v1);
  }

  /**
      Perform `glUniform2iv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform2iv(string name, int[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(int)*)value.ptr;
    gst_gl_shader_set_uniform_2iv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform3f()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
  */
  void setUniform3f(string name, float v0, float v1, float v2)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_3f(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2);
  }

  /**
      Perform `glUniform3fv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform3fv(string name, float[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(float)*)value.ptr;
    gst_gl_shader_set_uniform_3fv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Perform `glUniform3i()` for name on shader
  
      Params:
        name = name of the uniform
        v0 = first value to set
        v1 = second value to set
        v2 = third value to set
  */
  void setUniform3i(string name, int v0, int v1, int v2)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_3i(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2);
  }

  /**
      Perform `glUniform3iv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform3iv(string name, int[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(int)*)value.ptr;
    gst_gl_shader_set_uniform_3iv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
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
  void setUniform4f(string name, float v0, float v1, float v2, float v3)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_4f(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2, v3);
  }

  /**
      Perform `glUniform4fv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform4fv(string name, float[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(float)*)value.ptr;
    gst_gl_shader_set_uniform_4fv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
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
  void setUniform4i(string name, int v0, int v1, int v2, int v3)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_gl_shader_set_uniform_4i(cast(GstGLShader*)this._cPtr, _name, v0, v1, v2, v3);
  }

  /**
      Perform `glUniform4iv()` for name on shader
  
      Params:
        name = name of the uniform
        value = values to set
  */
  void setUniform4iv(string name, int[] value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    uint _count;
    if (value)
      _count = cast(uint)value.length;

    auto _value = cast(const(int)*)value.ptr;
    gst_gl_shader_set_uniform_4iv(cast(GstGLShader*)this._cPtr, _name, _count, _value);
  }

  /**
      Mark's shader as being used for the next GL draw command.
      
      Note: must be called in the GL thread and shader must have been linked.
  */
  void use()
  {
    gst_gl_shader_use(cast(GstGLShader*)this._cPtr);
  }
}
