/// Module for [MemoryTextureBuilder] class
module gdk.memory_texture_builder;

public import gid.basictypes;
import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.color_state;
import gdk.texture;
import gdk.types;
import gid.gid;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;

/**
    Constructs [gdk.texture.Texture] objects from system memory provided
    via [glib.bytes.Bytes].
    
    The operation is quite simple: Create a texture builder, set all the necessary
    properties - keep in mind that the properties [gdk.memory_texture_builder.MemoryTextureBuilder.bytes],
    [gdk.memory_texture_builder.MemoryTextureBuilder.stride], [gdk.memory_texture_builder.MemoryTextureBuilder.width],
    and [gdk.memory_texture_builder.MemoryTextureBuilder.height] are mandatory - and then call
    [gdk.memory_texture_builder.MemoryTextureBuilder.build] to create the new texture.
    
    [gdk.memory_texture_builder.MemoryTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
*/
class MemoryTextureBuilder : gobject.object.ObjectWrap
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
    return cast(void function())gdk_memory_texture_builder_get_type != &gidSymbolNotFound ? gdk_memory_texture_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryTextureBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gdk.memory_texture_builder.MemoryTextureBuilder]
      Returns: New builder object
  */
  static MemoryTextureBuilderGidBuilder builder() nothrow
  {
    return new MemoryTextureBuilderGidBuilder;
  }

  /**
      Get `bytes` property.
      Returns: The bytes holding the data.
  */
  @property glib.bytes.Bytes bytes() nothrow
  {
    return getBytes();
  }

  /**
      Set `bytes` property.
      Params:
        propval = The bytes holding the data.
  */
  @property void bytes(glib.bytes.Bytes propval) nothrow
  {
    setBytes(propval);
  }

  /**
      Get `colorState` property.
      Returns: The colorstate describing the data.
  */
  @property gdk.color_state.ColorState colorState() nothrow
  {
    return getColorState();
  }

  /**
      Set `colorState` property.
      Params:
        propval = The colorstate describing the data.
  */
  @property void colorState(gdk.color_state.ColorState propval) nothrow
  {
    setColorState(propval);
  }

  /**
      Get `format` property.
      Returns: The format of the data.
  */
  @property gdk.types.MemoryFormat format() nothrow
  {
    return getFormat();
  }

  /**
      Set `format` property.
      Params:
        propval = The format of the data.
  */
  @property void format(gdk.types.MemoryFormat propval) nothrow
  {
    setFormat(propval);
  }

  /**
      Get `height` property.
      Returns: The height of the texture.
  */
  @property int height() nothrow
  {
    return getHeight();
  }

  /**
      Set `height` property.
      Params:
        propval = The height of the texture.
  */
  @property void height(int propval) nothrow
  {
    setHeight(propval);
  }

  /**
      Get `stride` property.
      Returns: The rowstride of the texture.
        
        The rowstride is the number of bytes between the first pixel
        in a row of image data, and the first pixel in the next row.
  */
  @property ulong stride() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("stride");
  }

  /**
      Set `stride` property.
      Params:
        propval = The rowstride of the texture.
          
          The rowstride is the number of bytes between the first pixel
          in a row of image data, and the first pixel in the next row.
  */
  @property void stride(ulong propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("stride", propval);
  }

  /**
      Get `updateRegion` property.
      Returns: The update region for [gdk.memory_texture_builder.MemoryTextureBuilder.updateTexture].
  */
  @property cairo.region.Region updateRegion() nothrow
  {
    return getUpdateRegion();
  }

  /**
      Set `updateRegion` property.
      Params:
        propval = The update region for [gdk.memory_texture_builder.MemoryTextureBuilder.updateTexture].
  */
  @property void updateRegion(cairo.region.Region propval) nothrow
  {
    setUpdateRegion(propval);
  }

  /**
      Get `updateTexture` property.
      Returns: The texture [gdk.memory_texture_builder.MemoryTextureBuilder.updateRegion] is an update for.
  */
  @property gdk.texture.Texture updateTexture() nothrow
  {
    return getUpdateTexture();
  }

  /**
      Set `updateTexture` property.
      Params:
        propval = The texture [gdk.memory_texture_builder.MemoryTextureBuilder.updateRegion] is an update for.
  */
  @property void updateTexture(gdk.texture.Texture propval) nothrow
  {
    setUpdateTexture(propval);
  }

  /**
      Get `width` property.
      Returns: The width of the texture.
  */
  @property int width() nothrow
  {
    return getWidth();
  }

  /**
      Set `width` property.
      Params:
        propval = The width of the texture.
  */
  @property void width(int propval) nothrow
  {
    setWidth(propval);
  }

  /**
      Creates a new texture builder.
      Returns: the new `GdkTextureBuilder`
  */
  this() nothrow
  {
    GdkMemoryTextureBuilder* _cretval;
    _cretval = gdk_memory_texture_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Builds a new [gdk.texture.Texture] with the values set up in the builder.
      
      Note that it is a programming error to call this function if any mandatory
      property has not been set.
      
      It is possible to call this function multiple times to create multiple textures,
      possibly with changing properties in between.
      Returns: a newly built [gdk.texture.Texture]
  */
  gdk.texture.Texture build() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gdk_memory_texture_builder_build(cast(GdkMemoryTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the bytes previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setBytes]
      or null if none was set.
      Returns: The bytes
  */
  glib.bytes.Bytes getBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = gdk_memory_texture_builder_get_bytes(cast(GdkMemoryTextureBuilder*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the colorstate previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setColorState].
      Returns: The colorstate
  */
  gdk.color_state.ColorState getColorState() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_memory_texture_builder_get_color_state(cast(GdkMemoryTextureBuilder*)this._cPtr);
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the format previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setFormat].
      Returns: The format
  */
  gdk.types.MemoryFormat getFormat() nothrow
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_memory_texture_builder_get_format(cast(GdkMemoryTextureBuilder*)this._cPtr);
    gdk.types.MemoryFormat _retval = cast(gdk.types.MemoryFormat)_cretval;
    return _retval;
  }

  /**
      Gets the height previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setHeight]
      or 0 if the height wasn't set.
      Returns: The height
  */
  int getHeight() nothrow
  {
    int _retval;
    _retval = gdk_memory_texture_builder_get_height(cast(GdkMemoryTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setOffset].
  
      Params:
        plane = a plane
      Returns: The offset associated to a plane
  */
  size_t getOffset(uint plane) nothrow
  {
    size_t _retval;
    _retval = gdk_memory_texture_builder_get_offset(cast(GdkMemoryTextureBuilder*)this._cPtr, plane);
    return _retval;
  }

  /**
      Gets the stride previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setStride].
      Returns: the stride
  */
  size_t getStride() nothrow
  {
    size_t _retval;
    _retval = gdk_memory_texture_builder_get_stride(cast(GdkMemoryTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stride previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setStrideForPlane].
  
      Params:
        plane = a plane
      Returns: The stride associated to a plane
  */
  size_t getStrideForPlane(uint plane) nothrow
  {
    size_t _retval;
    _retval = gdk_memory_texture_builder_get_stride_for_plane(cast(GdkMemoryTextureBuilder*)this._cPtr, plane);
    return _retval;
  }

  /**
      Gets the region previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setUpdateRegion]
      or null if none was set.
      Returns: The update region
  */
  cairo.region.Region getUpdateRegion() nothrow
  {
    cairo_region_t* _cretval;
    _cretval = gdk_memory_texture_builder_get_update_region(cast(GdkMemoryTextureBuilder*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the texture previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setUpdateTexture]
      or null if none was set.
      Returns: The update texture
  */
  gdk.texture.Texture getUpdateTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gdk_memory_texture_builder_get_update_texture(cast(GdkMemoryTextureBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the width previously set via [gdk.memory_texture_builder.MemoryTextureBuilder.setWidth]
      or 0 if the width wasn't set.
      Returns: The width
  */
  int getWidth() nothrow
  {
    int _retval;
    _retval = gdk_memory_texture_builder_get_width(cast(GdkMemoryTextureBuilder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the data to be shown but the texture.
      
      The bytes must be set before calling [gdk.memory_texture_builder.MemoryTextureBuilder.build].
  
      Params:
        bytes = The bytes the texture shows or null to unset
  */
  void setBytes(glib.bytes.Bytes bytes = null) nothrow
  {
    gdk_memory_texture_builder_set_bytes(cast(GdkMemoryTextureBuilder*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
  }

  /**
      Sets the colorstate describing the data.
      
      By default, the sRGB colorstate is used. If you don't know
      what colorstates are, this is probably the right thing.
  
      Params:
        colorState = The colorstate describing the data
  */
  void setColorState(gdk.color_state.ColorState colorState) nothrow
  {
    gdk_memory_texture_builder_set_color_state(cast(GdkMemoryTextureBuilder*)this._cPtr, colorState ? cast(GdkColorState*)colorState._cPtr(No.Dup) : null);
  }

  /**
      Sets the format of the bytes.
      
      The default is [gdk.types.MemoryFormat.R8g8b8a8Premultiplied].
  
      Params:
        format = The texture's format
  */
  void setFormat(gdk.types.MemoryFormat format) nothrow
  {
    gdk_memory_texture_builder_set_format(cast(GdkMemoryTextureBuilder*)this._cPtr, format);
  }

  /**
      Sets the height of the texture.
      
      The height must be set before calling [gdk.memory_texture_builder.MemoryTextureBuilder.build]
      and conform to size requirements of the provided format.
  
      Params:
        height = The texture's height or 0 to unset
  */
  void setHeight(int height) nothrow
  {
    gdk_memory_texture_builder_set_height(cast(GdkMemoryTextureBuilder*)this._cPtr, height);
  }

  /**
      Sets the offset of the texture for plane.
  
      Params:
        plane = a plane
        offset = the texture's offset for plane
  */
  void setOffset(uint plane, size_t offset) nothrow
  {
    gdk_memory_texture_builder_set_offset(cast(GdkMemoryTextureBuilder*)this._cPtr, plane, offset);
  }

  /**
      Sets the rowstride of the bytes used.
      
      The rowstride must be set before calling [gdk.memory_texture_builder.MemoryTextureBuilder.build].
  
      Params:
        stride = the stride or 0 to unset
  */
  void setStride(size_t stride) nothrow
  {
    gdk_memory_texture_builder_set_stride(cast(GdkMemoryTextureBuilder*)this._cPtr, stride);
  }

  /**
      Sets the stride of the texture for plane.
  
      Params:
        plane = a plane
        stride = the texture's stride for plane
  */
  void setStrideForPlane(uint plane, size_t stride) nothrow
  {
    gdk_memory_texture_builder_set_stride_for_plane(cast(GdkMemoryTextureBuilder*)this._cPtr, plane, stride);
  }

  /**
      Sets the region to be updated by this texture.
      
      Together with [gdk.memory_texture_builder.MemoryTextureBuilder.updateTexture],
      this describes an update of a previous texture.
      
      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties,
      so that GTK can avoid rerendering parts that did not change.
      
      An example would be a screen recording where only the mouse pointer moves.
  
      Params:
        region = the region to update
  */
  void setUpdateRegion(cairo.region.Region region = null) nothrow
  {
    gdk_memory_texture_builder_set_update_region(cast(GdkMemoryTextureBuilder*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Sets the texture to be updated by this texture.
      
      See [gdk.memory_texture_builder.MemoryTextureBuilder.setUpdateRegion] for an explanation.
  
      Params:
        texture = the texture to update
  */
  void setUpdateTexture(gdk.texture.Texture texture = null) nothrow
  {
    gdk_memory_texture_builder_set_update_texture(cast(GdkMemoryTextureBuilder*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
  }

  /**
      Sets the width of the texture.
      
      The width must be set before calling [gdk.memory_texture_builder.MemoryTextureBuilder.build]
      and conform to size requirements of the provided format.
  
      Params:
        width = The texture's width or 0 to unset
  */
  void setWidth(int width) nothrow
  {
    gdk_memory_texture_builder_set_width(cast(GdkMemoryTextureBuilder*)this._cPtr, width);
  }
}

/// Fluent builder implementation template for [gdk.memory_texture_builder.MemoryTextureBuilder]
class MemoryTextureBuilderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `bytes` property.
      Params:
        propval = The bytes holding the data.
      Returns: Builder instance for fluent chaining
  */
  T bytes(glib.bytes.Bytes propval) nothrow
  {
    return setProperty("bytes", propval);
  }

  /**
      Set `colorState` property.
      Params:
        propval = The colorstate describing the data.
      Returns: Builder instance for fluent chaining
  */
  T colorState(gdk.color_state.ColorState propval) nothrow
  {
    return setProperty("color-state", propval);
  }

  /**
      Set `format` property.
      Params:
        propval = The format of the data.
      Returns: Builder instance for fluent chaining
  */
  T format(gdk.types.MemoryFormat propval) nothrow
  {
    return setProperty("format", propval);
  }

  /**
      Set `height` property.
      Params:
        propval = The height of the texture.
      Returns: Builder instance for fluent chaining
  */
  T height(int propval) nothrow
  {
    return setProperty("height", propval);
  }

  /**
      Set `stride` property.
      Params:
        propval = The rowstride of the texture.
          
          The rowstride is the number of bytes between the first pixel
          in a row of image data, and the first pixel in the next row.
      Returns: Builder instance for fluent chaining
  */
  T stride(ulong propval) nothrow
  {
    return setProperty("stride", propval);
  }

  /**
      Set `updateRegion` property.
      Params:
        propval = The update region for [gdk.memory_texture_builder.MemoryTextureBuilder.updateTexture].
      Returns: Builder instance for fluent chaining
  */
  T updateRegion(cairo.region.Region propval) nothrow
  {
    return setProperty("update-region", propval);
  }

  /**
      Set `updateTexture` property.
      Params:
        propval = The texture [gdk.memory_texture_builder.MemoryTextureBuilder.updateRegion] is an update for.
      Returns: Builder instance for fluent chaining
  */
  T updateTexture(gdk.texture.Texture propval) nothrow
  {
    return setProperty("update-texture", propval);
  }

  /**
      Set `width` property.
      Params:
        propval = The width of the texture.
      Returns: Builder instance for fluent chaining
  */
  T width(int propval) nothrow
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [gdk.memory_texture_builder.MemoryTextureBuilder]
final class MemoryTextureBuilderGidBuilder : MemoryTextureBuilderGidBuilderImpl!MemoryTextureBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryTextureBuilder build() nothrow
  {
    return new MemoryTextureBuilder(cast(void*)createGObject(MemoryTextureBuilder._getGType), Yes.Take);
  }
}
