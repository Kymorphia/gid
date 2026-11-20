/// Module for [Image] class
module webkit.image;

public import gid.basictypes;
import gid.gid;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/** */
class Image : gobject.object.ObjectWrap, gio.icon.Icon, gio.loadable_icon.LoadableIcon
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
    return cast(void function())webkit_image_get_type != &gidSymbolNotFound ? webkit_image_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitImage";
  }

  /** Returns `this`, for use in `with` statements. */
  override Image self() nothrow
  {
    return this;
  }

  /**
      Get builder for [webkit.image.Image]
      Returns: New builder object
  */
  static ImageGidBuilder builder() nothrow
  {
    return new ImageGidBuilder;
  }

  /**
      Get `height` property.
      Returns: The image height in pixels.
  */
  @property int height() nothrow
  {
    return getHeight();
  }

  /**
      Get `stride` property.
      Returns: The image stride, in bytes. This value indicates the amount of
        memory occupied by each row of pixels in the image. Note that
        the stride may be larger than the image width multiplied by the
        amount of bytes used to represent each pixel.
  */
  @property uint stride() nothrow
  {
    return getStride();
  }

  /**
      Get `width` property.
      Returns: The image width in pixels.
  */
  @property int width() nothrow
  {
    return getWidth();
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Get the image pixel data as an array of bytes.
      
      The pixel format for the returned byte buffer is 32-bit per pixel
      with 8-bit premultiplied alpha, in the preferred byte order for
      the architecture.
      Returns: a #GBytes
  */
  glib.bytes.Bytes asBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = webkit_image_as_bytes(cast(WebKitImage*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the image height in pixels.
      Returns: the image height
  */
  int getHeight() nothrow
  {
    int _retval;
    _retval = webkit_image_get_height(cast(WebKitImage*)this._cPtr);
    return _retval;
  }

  /**
      Get the image stride.
      Returns: the image stride
  */
  uint getStride() nothrow
  {
    uint _retval;
    _retval = webkit_image_get_stride(cast(WebKitImage*)this._cPtr);
    return _retval;
  }

  /**
      Get the image width in pixels.
      Returns: the image width
  */
  int getWidth() nothrow
  {
    int _retval;
    _retval = webkit_image_get_width(cast(WebKitImage*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [webkit.image.Image]
class ImageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.icon.IconGidBuilderImpl!T, gio.loadable_icon.LoadableIconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();
  mixin LoadableIconGidBuilderT!();

  /**
      Set `height` property.
      Params:
        propval = The image height in pixels.
      Returns: Builder instance for fluent chaining
  */
  T height(int propval) nothrow
  {
    return setProperty("height", propval);
  }

  /**
      Set `stride` property.
      Params:
        propval = The image stride, in bytes. This value indicates the amount of
          memory occupied by each row of pixels in the image. Note that
          the stride may be larger than the image width multiplied by the
          amount of bytes used to represent each pixel.
      Returns: Builder instance for fluent chaining
  */
  T stride(uint propval) nothrow
  {
    return setProperty("stride", propval);
  }

  /**
      Set `width` property.
      Params:
        propval = The image width in pixels.
      Returns: Builder instance for fluent chaining
  */
  T width(int propval) nothrow
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [webkit.image.Image]
final class ImageGidBuilder : ImageGidBuilderImpl!ImageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Image build() nothrow
  {
    return new Image(cast(void*)createGObject(Image._getGType), Yes.Take);
  }
}
