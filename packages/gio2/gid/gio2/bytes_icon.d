/// Module for [BytesIcon] class
module gid.gio2.bytes_icon;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.bytes_icon.BytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.
*/
class BytesIcon : gid.gobject2.object.ObjectWrap, gid.gio2.icon.Icon, gid.gio2.loadable_icon.LoadableIcon
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
    return cast(void function())g_bytes_icon_get_type != &gidSymbolNotFound ? g_bytes_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GBytesIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override BytesIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.bytes_icon.BytesIcon]
      Returns: New builder object
  */
  static BytesIconGidBuilder builder() nothrow
  {
    return new BytesIconGidBuilder;
  }

  /**
      Get `bytes` property.
      Returns: The bytes containing the icon.
  */
  @property gid.glib2.bytes.Bytes bytes() nothrow
  {
    return getBytes();
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new icon for a bytes.
      
      This cannot fail, but loading and interpreting the bytes may fail later on
      (for example, if [gid.gio2.loadable_icon.LoadableIcon.load] is called) if the image is invalid.
  
      Params:
        bytes = a #GBytes.
      Returns: a #GIcon for the given
          bytes.
  */
  this(gid.glib2.bytes.Bytes bytes) nothrow
  {
    GIcon* _cretval;
    _cretval = g_bytes_icon_new(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GBytes associated with the given icon.
      Returns: a #GBytes.
  */
  gid.glib2.bytes.Bytes getBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = g_bytes_icon_get_bytes(cast(GBytesIcon*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.bytes_icon.BytesIcon]
class BytesIconGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T, gid.gio2.loadable_icon.LoadableIconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();
  mixin LoadableIconGidBuilderT!();

  /**
      Set `bytes` property.
      Params:
        propval = The bytes containing the icon.
      Returns: Builder instance for fluent chaining
  */
  T bytes(gid.glib2.bytes.Bytes propval) nothrow
  {
    return setProperty("bytes", propval);
  }
}

/// Fluent builder for [gid.gio2.bytes_icon.BytesIcon]
final class BytesIconGidBuilder : BytesIconGidBuilderImpl!BytesIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BytesIcon build() nothrow
  {
    return new BytesIcon(cast(void*)createGObject(BytesIcon._getGType), Yes.Take);
  }
}
