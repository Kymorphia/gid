/// Module for [DmabufTextureBuilder] class
module gdk.dmabuf_texture_builder;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.texture;
import gdk.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;

/**
    [gdk.dmabuf_texture_builder.DmabufTextureBuilder] is a builder used to construct [gdk.texture.Texture]
    objects from DMA buffers.
    
    DMA buffers are commonly called **_dma-bufs_**.
    
    DMA buffers are a feature of the Linux kernel to enable efficient buffer and
    memory sharing between hardware such as codecs, GPUs, displays, cameras and the
    kernel drivers controlling them. For example, a decoder may want its output to
    be directly shared with the display server for rendering without a copy.
    
    Any device driver which participates in DMA buffer sharing, can do so as either
    the exporter or importer of buffers (or both).
    
    The memory that is shared via DMA buffers is usually stored in non-system memory
    (maybe in device's local memory or something else not directly accessible by the
    CPU), and accessing this memory from the CPU may have higher-than-usual overhead.
    
    In particular for graphics data, it is not uncommon that data consists of multiple
    separate blocks of memory, for example one block for each of the red, green and
    blue channels. These blocks are called **_planes_**. DMA buffers can have up to
    four planes. Even if the memory is a single block, the data can be organized in
    multiple planes, by specifying offsets from the beginning of the data.
    
    DMA buffers are exposed to user-space as file descriptors allowing to pass them
    between processes. If a DMA buffer has multiple planes, there is one file
    descriptor per plane.
    
    The format of the data (for graphics data, essentially its colorspace) is described
    by a 32-bit integer. These format identifiers are defined in the header file `drm_fourcc.h`
    and commonly referred to as **_fourcc_** values, since they are identified by 4 ASCII
    characters. Additionally, each DMA buffer has a **_modifier_**, which is a 64-bit integer
    that describes driver-specific details of the memory layout, such as tiling or compression.
    
    For historical reasons, some producers of dma-bufs don't provide an explicit modifier, but
    instead return `DMA_FORMAT_MOD_INVALID` to indicate that their modifier is **_implicit_**.
    GTK tries to accommodate this situation by accepting `DMA_FORMAT_MOD_INVALID` as modifier.
    
    The operation of [gdk.dmabuf_texture_builder.DmabufTextureBuilder] is quite simple: Create a texture builder,
    set all the necessary properties, and then call [gdk.dmabuf_texture_builder.DmabufTextureBuilder.build]
    to create the new texture.
    
    The required properties for a dma-buf texture are
    
     $(LIST
        * The width and height in pixels
       
        * The `fourcc` code and `modifier` which identify the format and memory layout of the dma-buf
       
        * The file descriptor, offset and stride for each of the planes
     )
       
    [gdk.dmabuf_texture_builder.DmabufTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
    
    For further information, see
    
    $(LIST
      * The Linux kernel [documentation](https://docs.kernel.org/driver-api/dma-buf.html)
      
      * The header file [drm_fourcc.h](https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/drm_fourcc.h)
    )
*/
class DmabufTextureBuilder : gobject.object.ObjectWrap
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
    return cast(void function())gdk_dmabuf_texture_builder_get_type != &gidSymbolNotFound ? gdk_dmabuf_texture_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DmabufTextureBuilder self()
  {
    return this;
  }

  /**
      Get `display` property.
      Returns: The display that this texture will be used on.
  */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /**
      Set `display` property.
      Params:
        propval = The display that this texture will be used on.
  */
  @property void display(gdk.display.Display propval)
  {
    return setDisplay(propval);
  }

  /**
      Get `fourcc` property.
      Returns: The format of the texture, as a fourcc value.
  */
  @property uint fourcc()
  {
    return getFourcc();
  }

  /**
      Set `fourcc` property.
      Params:
        propval = The format of the texture, as a fourcc value.
  */
  @property void fourcc(uint propval)
  {
    return setFourcc(propval);
  }

  /**
      Get `height` property.
      Returns: The height of the texture.
  */
  @property uint height()
  {
    return getHeight();
  }

  /**
      Set `height` property.
      Params:
        propval = The height of the texture.
  */
  @property void height(uint propval)
  {
    return setHeight(propval);
  }

  /**
      Get `modifier` property.
      Returns: The modifier.
  */
  @property ulong modifier()
  {
    return getModifier();
  }

  /**
      Set `modifier` property.
      Params:
        propval = The modifier.
  */
  @property void modifier(ulong propval)
  {
    return setModifier(propval);
  }

  /**
      Get `nPlanes` property.
      Returns: The number of planes of the texture.
        
        Note that you can set properties for other planes,
        but they will be ignored when constructing the texture.
  */
  @property uint nPlanes()
  {
    return getNPlanes();
  }

  /**
      Set `nPlanes` property.
      Params:
        propval = The number of planes of the texture.
          
          Note that you can set properties for other planes,
          but they will be ignored when constructing the texture.
  */
  @property void nPlanes(uint propval)
  {
    return setNPlanes(propval);
  }

  /**
      Get `premultiplied` property.
      Returns: Whether the alpha channel is premultiplied into the others.
        
        Only relevant if the format has alpha.
  */
  @property bool premultiplied()
  {
    return getPremultiplied();
  }

  /**
      Set `premultiplied` property.
      Params:
        propval = Whether the alpha channel is premultiplied into the others.
          
          Only relevant if the format has alpha.
  */
  @property void premultiplied(bool propval)
  {
    return setPremultiplied(propval);
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
      Returns: The texture `property@Gdk.DmabufTextureBuilder:update-region` is an update for.
  */
  @property gdk.texture.Texture updateTexture()
  {
    return getUpdateTexture();
  }

  /**
      Set `updateTexture` property.
      Params:
        propval = The texture `property@Gdk.DmabufTextureBuilder:update-region` is an update for.
  */
  @property void updateTexture(gdk.texture.Texture propval)
  {
    return setUpdateTexture(propval);
  }

  /**
      Get `width` property.
      Returns: The width of the texture.
  */
  @property uint width()
  {
    return getWidth();
  }

  /**
      Set `width` property.
      Params:
        propval = The width of the texture.
  */
  @property void width(uint propval)
  {
    return setWidth(propval);
  }

  /**
      Creates a new texture builder.
      Returns: the new `GdkTextureBuilder`
  */
  this()
  {
    GdkDmabufTextureBuilder* _cretval;
    _cretval = gdk_dmabuf_texture_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Builds a new [gdk.texture.Texture] with the values set up in the builder.
      
      It is a programming error to call this function if any mandatory
      property has not been set.
      
      If the dmabuf is not supported by GTK, null will be returned and error will be set.
      
      The `destroy` function gets called when the returned texture gets released.
      
      It is possible to call this function multiple times to create multiple textures,
      possibly with changing properties in between.
      
      It is the responsibility of the caller to keep the file descriptors for the planes
      open until the created texture is no longer used, and close them afterwards (possibly
      using the destroy notify).
      
      Not all formats defined in the `drm_fourcc.h` header are supported. You can use
      [gdk.display.Display.getDmabufFormats] to get a list of supported formats.
  
      Params:
        destroy = destroy function to be called when the texture is
            released
        data = user data to pass to the destroy function
      Returns: a newly built [gdk.texture.Texture] or `NULL`
          if the format is not supported
      Throws: [ErrorWrap]
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
    GError *_err;
    _cretval = gdk_dmabuf_texture_builder_build(cast(GdkDmabufTextureBuilder*)this._cPtr, _destroyCB, data, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the display that this texture builder is
      associated with.
      Returns: the display
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_dmabuf_texture_builder_get_display(cast(GdkDmabufTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the file descriptor for a plane.
  
      Params:
        plane = the plane to get the fd for
      Returns: the file descriptor
  */
  int getFd(uint plane)
  {
    int _retval;
    _retval = gdk_dmabuf_texture_builder_get_fd(cast(GdkDmabufTextureBuilder*)this._cPtr, plane);
    return _retval;
  }

  /**
      Gets the format previously set via [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setFourcc]
      or 0 if the format wasn't set.
      
      The format is specified as a fourcc code.
      Returns: The format
  */
  uint getFourcc()
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_fourcc(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the height previously set via [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setHeight] or
      0 if the height wasn't set.
      Returns: The height
  */
  uint getHeight()
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_height(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the modifier value.
      Returns: the modifier
  */
  ulong getModifier()
  {
    ulong _retval;
    _retval = gdk_dmabuf_texture_builder_get_modifier(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of planes.
      Returns: The number of planes
  */
  uint getNPlanes()
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_n_planes(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset value for a plane.
  
      Params:
        plane = the plane to get the offset for
      Returns: the offset
  */
  uint getOffset(uint plane)
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_offset(cast(GdkDmabufTextureBuilder*)this._cPtr, plane);
    return _retval;
  }

  /**
      Whether the data is premultiplied.
      Returns: whether the data is premultiplied
  */
  bool getPremultiplied()
  {
    bool _retval;
    _retval = cast(bool)gdk_dmabuf_texture_builder_get_premultiplied(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stride value for a plane.
  
      Params:
        plane = the plane to get the stride for
      Returns: the stride
  */
  uint getStride(uint plane)
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_stride(cast(GdkDmabufTextureBuilder*)this._cPtr, plane);
    return _retval;
  }

  /**
      Gets the region previously set via [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setUpdateRegion] or
      null if none was set.
      Returns: The region
  */
  cairo.region.Region getUpdateRegion()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_dmabuf_texture_builder_get_update_region(cast(GdkDmabufTextureBuilder*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the texture previously set via [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setUpdateTexture] or
      null if none was set.
      Returns: The texture
  */
  gdk.texture.Texture getUpdateTexture()
  {
    GdkTexture* _cretval;
    _cretval = gdk_dmabuf_texture_builder_get_update_texture(cast(GdkDmabufTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the width previously set via [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setWidth] or
      0 if the width wasn't set.
      Returns: The width
  */
  uint getWidth()
  {
    uint _retval;
    _retval = gdk_dmabuf_texture_builder_get_width(cast(GdkDmabufTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the display that this texture builder is
      associated with.
      
      The display is used to determine the supported
      dma-buf formats.
  
      Params:
        display = the display
  */
  void setDisplay(gdk.display.Display display)
  {
    gdk_dmabuf_texture_builder_set_display(cast(GdkDmabufTextureBuilder*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the file descriptor for a plane.
  
      Params:
        plane = the plane to set the fd for
        fd = the file descriptor
  */
  void setFd(uint plane, int fd)
  {
    gdk_dmabuf_texture_builder_set_fd(cast(GdkDmabufTextureBuilder*)this._cPtr, plane, fd);
  }

  /**
      Sets the format of the texture.
      
      The format is specified as a fourcc code.
      
      The format must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        fourcc = the texture's format or 0 to unset
  */
  void setFourcc(uint fourcc)
  {
    gdk_dmabuf_texture_builder_set_fourcc(cast(GdkDmabufTextureBuilder*)this._cPtr, fourcc);
  }

  /**
      Sets the height of the texture.
      
      The height must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        height = the texture's height or 0 to unset
  */
  void setHeight(uint height)
  {
    gdk_dmabuf_texture_builder_set_height(cast(GdkDmabufTextureBuilder*)this._cPtr, height);
  }

  /**
      Sets the modifier.
  
      Params:
        modifier = the modifier value
  */
  void setModifier(ulong modifier)
  {
    gdk_dmabuf_texture_builder_set_modifier(cast(GdkDmabufTextureBuilder*)this._cPtr, modifier);
  }

  /**
      Sets the number of planes of the texture.
  
      Params:
        nPlanes = the number of planes
  */
  void setNPlanes(uint nPlanes)
  {
    gdk_dmabuf_texture_builder_set_n_planes(cast(GdkDmabufTextureBuilder*)this._cPtr, nPlanes);
  }

  /**
      Sets the offset for a plane.
  
      Params:
        plane = the plane to set the offset for
        offset = the offset value
  */
  void setOffset(uint plane, uint offset)
  {
    gdk_dmabuf_texture_builder_set_offset(cast(GdkDmabufTextureBuilder*)this._cPtr, plane, offset);
  }

  /**
      Sets whether the data is premultiplied.
      
      Unless otherwise specified, all formats including alpha channels are assumed
      to be premultiplied.
  
      Params:
        premultiplied = whether the data is premultiplied
  */
  void setPremultiplied(bool premultiplied)
  {
    gdk_dmabuf_texture_builder_set_premultiplied(cast(GdkDmabufTextureBuilder*)this._cPtr, premultiplied);
  }

  /**
      Sets the stride for a plane.
      
      The stride must be set for all planes before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        plane = the plane to set the stride for
        stride = the stride value
  */
  void setStride(uint plane, uint stride)
  {
    gdk_dmabuf_texture_builder_set_stride(cast(GdkDmabufTextureBuilder*)this._cPtr, plane, stride);
  }

  /**
      Sets the region to be updated by this texture. Together with
      `propertyGdk.DmabufTextureBuilder:update-texture` this describes an
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
    gdk_dmabuf_texture_builder_set_update_region(cast(GdkDmabufTextureBuilder*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Sets the texture to be updated by this texture. See
      [gdk.dmabuf_texture_builder.DmabufTextureBuilder.setUpdateRegion] for an explanation.
  
      Params:
        texture = the texture to update
  */
  void setUpdateTexture(gdk.texture.Texture texture = null)
  {
    gdk_dmabuf_texture_builder_set_update_texture(cast(GdkDmabufTextureBuilder*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
  }

  /**
      Sets the width of the texture.
      
      The width must be set before calling [gdk.gltexture_builder.GLTextureBuilder.build].
  
      Params:
        width = The texture's width or 0 to unset
  */
  void setWidth(uint width)
  {
    gdk_dmabuf_texture_builder_set_width(cast(GdkDmabufTextureBuilder*)this._cPtr, width);
  }
}
