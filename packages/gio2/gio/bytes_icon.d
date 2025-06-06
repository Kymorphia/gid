/// Module for [BytesIcon] class
module gio.bytes_icon;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gio.types;
import glib.bytes;
import gobject.object;

/**
    [gio.bytes_icon.BytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.
*/
class BytesIcon : gobject.object.ObjectWrap, gio.icon.Icon, gio.loadable_icon.LoadableIcon
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
    return cast(void function())g_bytes_icon_get_type != &gidSymbolNotFound ? g_bytes_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BytesIcon self()
  {
    return this;
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new icon for a bytes.
      
      This cannot fail, but loading and interpreting the bytes may fail later on
      (for example, if [gio.loadable_icon.LoadableIcon.load] is called) if the image is invalid.
  
      Params:
        bytes = a #GBytes.
      Returns: a #GIcon for the given
          bytes.
  */
  this(glib.bytes.Bytes bytes)
  {
    GIcon* _cretval;
    _cretval = g_bytes_icon_new(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GBytes associated with the given icon.
      Returns: a #GBytes.
  */
  glib.bytes.Bytes getBytes()
  {
    GBytes* _cretval;
    _cretval = g_bytes_icon_get_bytes(cast(GBytesIcon*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
