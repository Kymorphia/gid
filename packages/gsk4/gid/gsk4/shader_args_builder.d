/// Module for [ShaderArgsBuilder] class
module gid.gsk4.shader_args_builder;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.bytes;
import gid.gobject2.boxed;
import gid.graphene1.vec2;
import gid.graphene1.vec3;
import gid.graphene1.vec4;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.glshader;
import gid.gsk4.types;

/**
    Builds the uniforms data for a [gid.gsk4.glshader.GLShader].
*/
class ShaderArgsBuilder : gid.gobject2.boxed.BoxedWrap!(gsk_shader_args_builder_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ShaderArgsBuilder self() nothrow
  {
    return this;
  }

  /**
      Allocates a builder that can be used to construct a new uniform data
      chunk.
  
      Params:
        shader = a [gid.gsk4.glshader.GLShader]
        initialValues = optional [gid.glib2.bytes.Bytes] with initial values
      Returns: The newly allocated builder, free with
            [gid.gsk4.shader_args_builder.ShaderArgsBuilder.unref]
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  this(gid.gsk4.glshader.GLShader shader, gid.glib2.bytes.Bytes initialValues = null) nothrow
  {
    GskShaderArgsBuilder* _cretval;
    _cretval = gsk_shader_args_builder_new(shader ? cast(GskGLShader*)shader._cPtr(No.Dup) : null, initialValues ? cast(GBytes*)initialValues._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of bool type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setBool(int idx, bool value) nothrow
  {
    gsk_shader_args_builder_set_bool(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of float type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  */
  void setFloat(int idx, float value) nothrow
  {
    gsk_shader_args_builder_set_float(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of int type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setInt(int idx, int value) nothrow
  {
    gsk_shader_args_builder_set_int(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of uint type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setUint(int idx, uint value) nothrow
  {
    gsk_shader_args_builder_set_uint(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec2 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setVec2(int idx, gid.graphene1.vec2.Vec2 value) nothrow
  {
    gsk_shader_args_builder_set_vec2(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec2_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec3 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setVec3(int idx, gid.graphene1.vec3.Vec3 value) nothrow
  {
    gsk_shader_args_builder_set_vec3(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec3_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec4 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  void setVec4(int idx, gid.graphene1.vec4.Vec4 value) nothrow
  {
    gsk_shader_args_builder_set_vec4(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec4_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Creates a new [gid.glib2.bytes.Bytes] args from the current state of the
      given builder.
      
      Any uniforms of the shader that have not been explicitly set on
      the builder are zero-initialized.
      
      The given [gid.gsk4.shader_args_builder.ShaderArgsBuilder] is reset once this function returns;
      you cannot call this function multiple times on the same builder instance.
      
      This function is intended primarily for bindings. C code should use
      [gid.gsk4.shader_args_builder.ShaderArgsBuilder.freeToArgs].
      Returns: the newly allocated buffer with
          all the args added to builder
  
      Deprecated: GTK's new Vulkan-focused rendering
          does not support this feature. Use [GtkGLArea](../gtk4/class.GLArea.html)
          for OpenGL rendering.
  */
  gid.glib2.bytes.Bytes toArgs() nothrow
  {
    GBytes* _cretval;
    _cretval = gsk_shader_args_builder_to_args(cast(GskShaderArgsBuilder*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
