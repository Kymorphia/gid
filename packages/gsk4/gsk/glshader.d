/// Module for [GLShader] class
module gsk.glshader;

import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;
import graphene.vec2;
import graphene.vec3;
import graphene.vec4;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/**
    A [gsk.glshader.GLShader] is a snippet of GLSL that is meant to run in the
    fragment shader of the rendering pipeline.
    
    A fragment shader gets the coordinates being rendered as input and
    produces the pixel values for that particular pixel. Additionally,
    the shader can declare a set of other input arguments, called
    uniforms (as they are uniform over all the calls to your shader in
    each instance of use). A shader can also receive up to 4
    textures that it can use as input when producing the pixel data.
    
    [gsk.glshader.GLShader] is usually used with [gtk.snapshot.Snapshot.pushGlShader]
    to produce a [gsk.glshader_node.GLShaderNode] in the rendering hierarchy,
    and then its input textures are constructed by rendering the child
    nodes to textures before rendering the shader node itself. (You can
    pass texture nodes as children if you want to directly use a texture
    as input).
    
    The actual shader code is GLSL code that gets combined with
    some other code into the fragment shader. Since the exact
    capabilities of the GPU driver differs between different OpenGL
    drivers and hardware, GTK adds some defines that you can use
    to ensure your GLSL code runs on as many drivers as it can.
    
    If the OpenGL driver is GLES, then the shader language version
    is set to 100, and GSK_GLES will be defined in the shader.
    
    Otherwise, if the OpenGL driver does not support the 3.2 core profile,
    then the shader will run with language version 110 for GL2 and 130 for GL3,
    and GSK_LEGACY will be defined in the shader.
    
    If the OpenGL driver supports the 3.2 code profile, it will be used,
    the shader language version is set to 150, and GSK_GL3 will be defined
    in the shader.
    
    The main function the shader must implement is:
    
    ```glsl
     void mainImage(out vec4 fragColor,
                    in vec2 fragCoord,
                    in vec2 resolution,
                    in vec2 uv)
    ```
    
    Where the input @fragCoord is the coordinate of the pixel we're
    currently rendering, relative to the boundary rectangle that was
    specified in the [gsk.glshader_node.GLShaderNode], and @resolution is the width and
    height of that rectangle. This is in the typical GTK coordinate
    system with the origin in the top left. @uv contains the u and v
    coordinates that can be used to index a texture at the
    corresponding point. These coordinates are in the [0..1]x[0..1]
    region, with 0, 0 being in the lower left corder (which is typical
    for OpenGL).
    
    The output @fragColor should be a RGBA color (with
    premultiplied alpha) that will be used as the output for the
    specified pixel location. Note that this output will be
    automatically clipped to the clip region of the glshader node.
    
    In addition to the function arguments the shader can define
    up to 4 uniforms for textures which must be called u_textureN
    (i.e. u_texture1 to u_texture4) as well as any custom uniforms
    you want of types int, uint, bool, float, vec2, vec3 or vec4.
    
    All textures sources contain premultiplied alpha colors, but if some
    there are outer sources of colors there is a gsk_premultiply() helper
    to compute premultiplication when needed.
    
    Note that GTK parses the uniform declarations, so each uniform has to
    be on a line by itself with no other code, like so:
    
    ```glsl
    uniform float u_time;
    uniform vec3 u_color;
    uniform sampler2D u_texture1;
    uniform sampler2D u_texture2;
    ```
    
    GTK uses the "gsk" namespace in the symbols it uses in the
    shader, so your code should not use any symbols with the prefix gsk
    or GSK. There are some helper functions declared that you can use:
    
    ```glsl
    vec4 GskTexture(sampler2D sampler, vec2 texCoords);
    ```
    
    This samples a texture (e.g. u_texture1) at the specified
    coordinates, and contains some helper ifdefs to ensure that
    it works on all OpenGL versions.
    
    You can compile the shader yourself using [gsk.glshader.GLShader.compile],
    otherwise the GSK renderer will do it when it handling the glshader
    node. If errors occurs, the returned @error will include the glsl
    sources, so you can see what GSK was passing to the compiler. You
    can also set GSK_DEBUG=shaders in the environment to see the sources
    and other relevant information about all shaders that GSK is handling.
    
    # An example shader
    
    ```glsl
    uniform float position;
    uniform sampler2D u_texture1;
    uniform sampler2D u_texture2;
    
    void mainImage(out vec4 fragColor,
                   in vec2 fragCoord,
                   in vec2 resolution,
                   in vec2 uv) {
      vec4 source1 = GskTexture(u_texture1, uv);
      vec4 source2 = GskTexture(u_texture2, uv);
    
      fragColor = position * source1 + (1.0 - position) * source2;
    }
    ```
*/
class GLShader : gobject.object.ObjectWrap
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
    return cast(void function())gsk_gl_shader_get_type != &gidSymbolNotFound ? gsk_gl_shader_get_type() : cast(GType)0;
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

  /**
      Creates a [gsk.glshader.GLShader] that will render pixels using the specified code.
  
      Params:
        sourcecode = GLSL sourcecode for the shader, as a [glib.bytes.Bytes]
      Returns: A new [gsk.glshader.GLShader]
  */
  static gsk.glshader.GLShader newFromBytes(glib.bytes.Bytes sourcecode)
  {
    GskGLShader* _cretval;
    _cretval = gsk_gl_shader_new_from_bytes(sourcecode ? cast(GBytes*)sourcecode._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gsk.glshader.GLShader)(cast(GskGLShader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a [gsk.glshader.GLShader] that will render pixels using the specified code.
  
      Params:
        resourcePath = path to a resource that contains the GLSL sourcecode for
              the shader
      Returns: A new [gsk.glshader.GLShader]
  */
  static gsk.glshader.GLShader newFromResource(string resourcePath)
  {
    GskGLShader* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gsk_gl_shader_new_from_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gsk.glshader.GLShader)(cast(GskGLShader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to compile the shader for the given renderer.
      
      If there is a problem, this function returns false and reports
      an error. You should use this function before relying on the shader
      for rendering and use a fallback with a simpler shader or without
      shaders if it fails.
      
      Note that this will modify the rendering state (for example
      change the current GL context) and requires the renderer to be
      set up. This means that the widget has to be realized. Commonly you
      want to call this from the realize signal of a widget, or during
      widget snapshot.
  
      Params:
        renderer = a [gsk.renderer.Renderer]
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool compile(gsk.renderer.Renderer renderer)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gsk_gl_shader_compile(cast(GskGLShader*)this._cPtr, renderer ? cast(GskRenderer*)renderer._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Looks for a uniform by the name name, and returns the index
      of the uniform, or -1 if it was not found.
  
      Params:
        name = uniform name
      Returns: The index of the uniform, or -1
  */
  int findUniformByName(string name)
  {
    int _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gsk_gl_shader_find_uniform_by_name(cast(GskGLShader*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of bool type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
      Returns: The value
  */
  bool getArgBool(glib.bytes.Bytes args, int idx)
  {
    bool _retval;
    _retval = cast(bool)gsk_gl_shader_get_arg_bool(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx);
    return _retval;
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of float type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
      Returns: The value
  */
  float getArgFloat(glib.bytes.Bytes args, int idx)
  {
    float _retval;
    _retval = gsk_gl_shader_get_arg_float(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx);
    return _retval;
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of int type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
      Returns: The value
  */
  int getArgInt(glib.bytes.Bytes args, int idx)
  {
    int _retval;
    _retval = gsk_gl_shader_get_arg_int(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx);
    return _retval;
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of uint type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
      Returns: The value
  */
  uint getArgUint(glib.bytes.Bytes args, int idx)
  {
    uint _retval;
    _retval = gsk_gl_shader_get_arg_uint(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx);
    return _retval;
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of vec2 type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
        outValue = location to store the uniform value in
  */
  void getArgVec2(glib.bytes.Bytes args, int idx, graphene.vec2.Vec2 outValue)
  {
    gsk_gl_shader_get_arg_vec2(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx, outValue ? cast(graphene_vec2_t*)outValue._cPtr(No.Dup) : null);
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of vec3 type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
        outValue = location to store the uniform value in
  */
  void getArgVec3(glib.bytes.Bytes args, int idx, graphene.vec3.Vec3 outValue)
  {
    gsk_gl_shader_get_arg_vec3(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx, outValue ? cast(graphene_vec3_t*)outValue._cPtr(No.Dup) : null);
  }

  /**
      Gets the value of the uniform idx in the args block.
      
      The uniform must be of vec4 type.
  
      Params:
        args = uniform arguments
        idx = index of the uniform
        outValue = location to store set the uniform value in
  */
  void getArgVec4(glib.bytes.Bytes args, int idx, graphene.vec4.Vec4 outValue)
  {
    gsk_gl_shader_get_arg_vec4(cast(GskGLShader*)this._cPtr, args ? cast(GBytes*)args._cPtr(No.Dup) : null, idx, outValue ? cast(graphene_vec4_t*)outValue._cPtr(No.Dup) : null);
  }

  /**
      Get the size of the data block used to specify arguments for this shader.
      Returns: The size of the data block
  */
  size_t getArgsSize()
  {
    size_t _retval;
    _retval = gsk_gl_shader_get_args_size(cast(GskGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of textures that the shader requires.
      
      This can be used to check that the a passed shader works
      in your usecase. It is determined by looking at the highest
      u_textureN value that the shader defines.
      Returns: The number of texture inputs required by shader
  */
  int getNTextures()
  {
    int _retval;
    _retval = gsk_gl_shader_get_n_textures(cast(GskGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of declared uniforms for this shader.
      Returns: The number of declared uniforms
  */
  int getNUniforms()
  {
    int _retval;
    _retval = gsk_gl_shader_get_n_uniforms(cast(GskGLShader*)this._cPtr);
    return _retval;
  }

  /**
      Gets the resource path for the GLSL sourcecode being used
      to render this shader.
      Returns: The resource path for the shader
  */
  string getResource()
  {
    const(char)* _cretval;
    _cretval = gsk_gl_shader_get_resource(cast(GskGLShader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the GLSL sourcecode being used to render this shader.
      Returns: The source code for the shader
  */
  glib.bytes.Bytes getSource()
  {
    GBytes* _cretval;
    _cretval = gsk_gl_shader_get_source(cast(GskGLShader*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the name of the declared uniform for this shader at index idx.
  
      Params:
        idx = index of the uniform
      Returns: The name of the declared uniform
  */
  string getUniformName(int idx)
  {
    const(char)* _cretval;
    _cretval = gsk_gl_shader_get_uniform_name(cast(GskGLShader*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the offset into the data block where data for this uniforms is stored.
  
      Params:
        idx = index of the uniform
      Returns: The data offset
  */
  int getUniformOffset(int idx)
  {
    int _retval;
    _retval = gsk_gl_shader_get_uniform_offset(cast(GskGLShader*)this._cPtr, idx);
    return _retval;
  }

  /**
      Get the type of the declared uniform for this shader at index idx.
  
      Params:
        idx = index of the uniform
      Returns: The type of the declared uniform
  */
  gsk.types.GLUniformType getUniformType(int idx)
  {
    GskGLUniformType _cretval;
    _cretval = gsk_gl_shader_get_uniform_type(cast(GskGLShader*)this._cPtr, idx);
    gsk.types.GLUniformType _retval = cast(gsk.types.GLUniformType)_cretval;
    return _retval;
  }
}
