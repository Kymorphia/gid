/// Module for [GLTextureBuilder] class
module gdk.gltexture_builder;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.glcontext;
import gdk.texture;
import gdk.types;
import gid.gid;
import glib.types;
import gobject.object;

/**
    [gdk.gltexture_builder.GLTextureBuilder] is a builder used to construct [gdk.texture.Texture] objects from
    GL textures.
    
    The operation is quite simple: Create a texture builder, set all the necessary
    properties - keep in mind that the properties [gdk.gltexture_builder.GLTextureBuilder.context],
    [gdk.gltexture_builder.GLTextureBuilder.id], [gdk.gltexture_builder.GLTextureBuilder.width], and
    [gdk.gltexture_builder.GLTextureBuilder.height] are mandatory - and then call
    [gdk.gltexture_builder.GLTextureBuilder.build] to create the new texture.
    
    [gdk.gltexture_builder.GLTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
*/
class GLTextureBuilder : gobject.object.ObjectWrap
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
    return cast(void function())gdk_gl_texture_builder_get_type != &gidSymbolNotFound ? gdk_gl_texture_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLTextureBuilder self()
  {
    return this;
  }

  /**
      Get `context` property.
      Returns: The context owning the texture.
  */
  @property gdk.glcontext.GLContext context()
  {
    return getContext();
  }

  /**
      Set `context` property.
      Params:
        propval = The context owning the texture.
  */
  @property void context(gdk.glcontext.GLContext propval)
  {
    return setContext(propval);
  }

  /**
      Get `format` property.
      Returns: The format when downloading the texture.
  */
  @property gdk.types.MemoryFormat format()
  {
    return getFormat();
  }

  /**
      Set `format` property.
      Params:
        propval = The format when downloading the texture.
  */
  @property void format(gdk.types.MemoryFormat propval)
  {
    return setFormat(propval);
  }

  /**
      Get `hasMipmap` property.
      Returns: If the texture has a mipmap.
  */
  @property bool hasMipmap()
  {
    return getHasMipmap();
  }

  /**
      Set `hasMipmap` property.
      Params:
        propval = If the texture has a mipmap.
  */
  @property void hasMipmap(bool propval)
  {
    return setHasMipmap(propval);
  }

  /**
      Get `height` property.
      Returns: The height of the texture.
  */
  @property int height()
  {
    return getHeight();
  }

  /**
      Set `height` property.
      Params:
        propval = The height of the texture.
  */
  @property void height(int propval)
  {
    return setHeight(propval);
  }

  /**
      Get `id` property.
      Returns: The texture ID to use.
  */
  @property uint id()
  {
    return getId();
  }

  /**
      Set `id` property.
      Params:
        propval = The texture ID to use.
  */
  @property void id(uint propval)
  {
    return setId(propval);
  }

  /**
      Get `sync` property.
      Returns: An optional `GLSync` object.
      
      If this is set, GTK will wait on it before using the texture.
  */
  @property void* sync()
  {
    return getSync();
  }

  /**
      Set `sync` property.
      Params:
        propval = An optional `GLSync` object.
        
        If this is set, GTK will wait on it before using the texture.
  */
  @property void sync(void* propval)
  {
    return setSync(propval);
  }

  /**
      Get `updateRegion` property.
      Returns: The update region for `property@Gdk.GLTextureBuilder:update-texture`.
  */
  @property cairo.region.Region updateRegion()
  {
    return getUpdateRegion();
  }

  /**
      Set `updateRegion` property.
      Params:
        propval = The update region for `property@Gdk.GLTextureBuilder:update-texture`.
  */
  @property void updateRegion(cairo.region.Region propval)
  {
    return setUpdateRegion(propval);
  }

  /**
      Get `updateTexture` property.
      Returns: The texture `property@Gdk.GLTextureBuilder:update-region` is an update for.
  */
  @property gdk.texture.Texture updateTexture()
  {
    return getUpdateTexture();
  }

  /**
      Set `updateTexture` property.
      Params:
        propval = The texture `property@Gdk.GLTextureBuilder:update-region` is an update for.
  */
  @property void updateTexture(gdk.texture.Texture propval)
  {
    return setUpdateTexture(propval);
  }

  /**
      Get `width` property.
      Returns: The width of the texture.
  */
  @property int width()
  {
    return getWidth();
  }

  /**
      Set `width` property.
      Params:
        propval = The width of the texture.
  */
  @property void width(int propval)
  {
    return setWidth(propval);
  }

  /**
      Creates a new texture builder.
      Returns: the new `GdkTextureBuilder`
  */
  this()
  {
    GdkGLTextureBuilder* _cretval;
    _cretval = gdk_gl_texture_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Builds a new [gdk.texture.Texture] with the values set up in the builder.
      
      The `destroy` function gets called when the returned texture gets released;
      either when the texture is finalized or by an explicit call to
      [gdk.gltexture.GLTexture.release]. It should release all GL resources associated
      with the texture, such as the [gdk.gltexture_builder.GLTextureBuilder.id] and the
      [gdk.gltexture_builder.GLTextureBuilder.sync].
      
      Note that it is a programming error to call this function if any mandatory
      property has not been set.
      
      It is possible to call this function multiple times to create multiple textures,
      possibly with changing properties in between.
  
      Params:
        destroy = destroy function to be called when the texture is
            released
        data = user data to pass to the destroy function
      Returns: a newly built [gdk.texture.Texture]
  */
  gdk.texture.Texture build(glib.types.DestroyNotify destroy = null, void* data = null)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    GdkTexture* _cretval;
    _cretval = gdk_gl_texture_builder_build(cast(GdkGLTextureBuilder*)this._cPtr, _destroyCB, data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the context previously set via [gdk.gltexture_builder.GLTextureBuilder.setContext] or
      null if none was set.
      Returns: The context
  */
  gdk.glcontext.GLContext getContext()
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_texture_builder_get_context(cast(GdkGLTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the format previously set via [gdk.gltexture_builder.GLTextureBuilder.setFormat].
      Returns: The format
  */
  gdk.types.MemoryFormat getFormat()
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_gl_texture_builder_get_format(cast(GdkGLTextureBuilder*)this._cPtr);
    gdk.types.MemoryFormat _retval = cast(gdk.types.MemoryFormat)_cretval;
    return _retval;
  }

  /**
      Gets whether the texture has a mipmap.
      Returns: Whether the texture has a mipmap
  */
  bool getHasMipmap()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_texture_builder_get_has_mipmap(cast(GdkGLTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the height previously set via [gdk.gltexture_builder.GLTextureBuilder.setHeight] or
      0 if the height wasn't set.
      Returns: The height
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_gl_texture_builder_get_height(cast(GdkGLTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the texture id previously set via [gdk.gltexture_builder.GLTextureBuilder.setId] or
      0 if the id wasn't set.
      Returns: The id
  */
  uint getId()
  {
    uint _retval;
    _retval = gdk_gl_texture_builder_get_id(cast(GdkGLTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `GLsync` previously set via [gdk.gltexture_builder.GLTextureBuilder.setSync].
      Returns: the `GLSync`
  */
  void* getSync()
  {
    auto _retval = gdk_gl_texture_builder_get_sync(cast(GdkGLTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the region previously set via [gdk.gltexture_builder.GLTextureBuilder.setUpdateRegion] or
      null if none was set.
      Returns: The region
  */
  cairo.region.Region getUpdateRegion()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_gl_texture_builder_get_update_region(cast(GdkGLTextureBuilder*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the texture previously set via [gdk.gltexture_builder.GLTextureBuilder.setUpdateTexture] or
      null if none was set.
      Returns: The texture
  */
  gdk.texture.Texture getUpdateTexture()
  {
    GdkTexture* _cretval;
    _cretval = gdk_gl_texture_builder_get_update_texture(cast(GdkGLTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the width previously set via [gdk.gltexture_builder.GLTextureBuilder.setWidth] or
      0 if the width wasn't set.
      Returns: The width
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_gl_texture_builder_get_width(cast(GdkGLTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the context to be used for the texture. This is the context that owns
      the texture.
      
      The context must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        context = The context the texture beongs to or null to unset
  */
  void setContext(gdk.glcontext.GLContext context = null)
  {
    gdk_gl_texture_builder_set_context(cast(GdkGLTextureBuilder*)this._cPtr, context ? cast(GdkGLContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Sets the format of the texture. The default is [gdk.types.MemoryFormat.R8g8b8a8Premultiplied].
      
      The format is the preferred format the texture data should be downloaded to. The
      format must be supported by the GL version of [gdk.gltexture_builder.GLTextureBuilder.context].
      
      GDK's texture download code assumes that the format corresponds to the storage
      parameters of the GL texture in an obvious way. For example, a format of
      [gdk.types.MemoryFormat.R16g16b16a16Premultiplied] is expected to be stored as `GL_RGBA16`
      texture, and [gdk.types.MemoryFormat.G8a8] is expected to be stored as `GL_RG8` texture.
      
      Setting the right format is particularly useful when using high bit depth textures
      to preserve the bit depth, to set the correct value for unpremultiplied textures
      and to make sure opaque textures are treated as such.
      
      Non-RGBA textures need to have swizzling parameters set up properly to be usable
      in GSK's shaders.
  
      Params:
        format = The texture's format
  */
  void setFormat(gdk.types.MemoryFormat format)
  {
    gdk_gl_texture_builder_set_format(cast(GdkGLTextureBuilder*)this._cPtr, format);
  }

  /**
      Sets whether the texture has a mipmap. This allows the renderer and other users of the
      generated texture to use a higher quality downscaling.
      
      Typically, the `glGenerateMipmap` function is used to generate a mimap.
  
      Params:
        hasMipmap = Whether the texture has a mipmap
  */
  void setHasMipmap(bool hasMipmap)
  {
    gdk_gl_texture_builder_set_has_mipmap(cast(GdkGLTextureBuilder*)this._cPtr, hasMipmap);
  }

  /**
      Sets the height of the texture.
      
      The height must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        height = The texture's height or 0 to unset
  */
  void setHeight(int height)
  {
    gdk_gl_texture_builder_set_height(cast(GdkGLTextureBuilder*)this._cPtr, height);
  }

  /**
      Sets the texture id of the texture. The texture id must remain unmodified
      until the texture was finalized. See [gdk.gltexture_builder.GLTextureBuilder.build]
      for a longer discussion.
      
      The id must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        id = The texture id to be used for creating the texture
  */
  void setId(uint id)
  {
    gdk_gl_texture_builder_set_id(cast(GdkGLTextureBuilder*)this._cPtr, id);
  }

  /**
      Sets the GLSync object to use for the texture.
      
      GTK will wait on this object before using the created [gdk.texture.Texture].
      
      The `destroy` function that is passed to [gdk.gltexture_builder.GLTextureBuilder.build]
      is responsible for freeing the sync object when it is no longer needed.
      The texture builder does not destroy it and it is the callers
      responsibility to make sure it doesn't leak.
  
      Params:
        sync = the GLSync object
  */
  void setSync(void* sync = null)
  {
    gdk_gl_texture_builder_set_sync(cast(GdkGLTextureBuilder*)this._cPtr, sync);
  }

  /**
      Sets the region to be updated by this texture. Together with
      `propertyGdk.GLTextureBuilder:update-texture` this describes an
      update of a previous texture.
      
      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties,
      so that GTK can avoid rerendering parts that did not change.
      
      An example would be a screen recording where only the mouse pointer moves.
  
      Params:
        region = the region to update
  */
  void setUpdateRegion(cairo.region.Region region = null)
  {
    gdk_gl_texture_builder_set_update_region(cast(GdkGLTextureBuilder*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Sets the texture to be updated by this texture. See
      [gdk.gltexture_builder.GLTextureBuilder.setUpdateRegion] for an explanation.
  
      Params:
        texture = the texture to update
  */
  void setUpdateTexture(gdk.texture.Texture texture = null)
  {
    gdk_gl_texture_builder_set_update_texture(cast(GdkGLTextureBuilder*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
  }

  /**
      Sets the width of the texture.
      
      The width must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        width = The texture's width or 0 to unset
  */
  void setWidth(int width)
  {
    gdk_gl_texture_builder_set_width(cast(GdkGLTextureBuilder*)this._cPtr, width);
  }
}
