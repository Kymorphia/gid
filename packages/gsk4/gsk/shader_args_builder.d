/// Module for [ShaderArgsBuilder] class
module gsk.shader_args_builder;

import gid.gid;
import glib.bytes;
import gobject.boxed;
import graphene.vec2;
import graphene.vec3;
import graphene.vec4;
import gsk.c.functions;
import gsk.c.types;
import gsk.glshader;
import gsk.types;

/**
    An object to build the uniforms data for a [gsk.glshader.GLShader].
*/
class ShaderArgsBuilder : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_shader_args_builder_get_type != &gidSymbolNotFound ? gsk_shader_args_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShaderArgsBuilder self()
  {
    return this;
  }

  /**
      Allocates a builder that can be used to construct a new uniform data
      chunk.
  
      Params:
        shader = a [gsk.glshader.GLShader]
        initialValues = optional [glib.bytes.Bytes] with initial values
      Returns: The newly allocated builder, free with
            [gsk.shader_args_builder.ShaderArgsBuilder.unref]
  */
  this(gsk.glshader.GLShader shader, glib.bytes.Bytes initialValues = null)
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
  */
  void setBool(int idx, bool value)
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
  void setFloat(int idx, float value)
  {
    gsk_shader_args_builder_set_float(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of int type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  */
  void setInt(int idx, int value)
  {
    gsk_shader_args_builder_set_int(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of uint type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform to
  */
  void setUint(int idx, uint value)
  {
    gsk_shader_args_builder_set_uint(cast(GskShaderArgsBuilder*)this._cPtr, idx, value);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec2 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  */
  void setVec2(int idx, graphene.vec2.Vec2 value)
  {
    gsk_shader_args_builder_set_vec2(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec2_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec3 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  */
  void setVec3(int idx, graphene.vec3.Vec3 value)
  {
    gsk_shader_args_builder_set_vec3(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec3_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the value of the uniform idx.
      
      The uniform must be of vec4 type.
  
      Params:
        idx = index of the uniform
        value = value to set the uniform too
  */
  void setVec4(int idx, graphene.vec4.Vec4 value)
  {
    gsk_shader_args_builder_set_vec4(cast(GskShaderArgsBuilder*)this._cPtr, idx, value ? cast(const(graphene_vec4_t)*)value._cPtr(No.Dup) : null);
  }

  /**
      Creates a new [glib.bytes.Bytes] args from the current state of the
      given builder.
      
      Any uniforms of the shader that have not been explicitly set on
      the builder are zero-initialized.
      
      The given [gsk.shader_args_builder.ShaderArgsBuilder] is reset once this function returns;
      you cannot call this function multiple times on the same builder instance.
      
      This function is intended primarily for bindings. C code should use
      [gsk.shader_args_builder.ShaderArgsBuilder.freeToArgs].
      Returns: the newly allocated buffer with
          all the args added to builder
  */
  glib.bytes.Bytes toArgs()
  {
    GBytes* _cretval;
    _cretval = gsk_shader_args_builder_to_args(cast(GskShaderArgsBuilder*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
