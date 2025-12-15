/// Module for [CharsetConverter] class
module gio.charset_converter;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.charset_converter.CharsetConverter] is an implementation of [gio.converter.Converter] based on
    [glib.types.void*].
*/
class CharsetConverter : gobject.object.ObjectWrap, gio.converter.Converter, gio.initable.Initable
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
    return cast(void function())g_charset_converter_get_type != &gidSymbolNotFound ? g_charset_converter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CharsetConverter self()
  {
    return this;
  }

  /**
      Get `useFallback` property.
      Returns: Use fallback (of form `\<hexval>`) for invalid bytes.
  */
  @property bool useFallback()
  {
    return getUseFallback();
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Use fallback (of form `\<hexval>`) for invalid bytes.
  */
  @property void useFallback(bool propval)
  {
    return setUseFallback(propval);
  }

  mixin ConverterT!();
  mixin InitableT!();

  /**
      Creates a new #GCharsetConverter.
  
      Params:
        toCharset = destination charset
        fromCharset = source charset
      Returns: a new #GCharsetConverter or null on error.
      Throws: [ErrorWrap]
  */
  this(string toCharset, string fromCharset)
  {
    GCharsetConverter* _cretval;
    const(char)* _toCharset = toCharset.toCString(No.Alloc);
    const(char)* _fromCharset = fromCharset.toCString(No.Alloc);
    GError *_err;
    _cretval = g_charset_converter_new(_toCharset, _fromCharset, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the number of fallbacks that converter has applied so far.
      Returns: the number of fallbacks that converter has applied
  */
  uint getNumFallbacks()
  {
    uint _retval;
    _retval = g_charset_converter_get_num_fallbacks(cast(GCharsetConverter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GCharsetConverter:use-fallback property.
      Returns: true if fallbacks are used by converter
  */
  bool getUseFallback()
  {
    bool _retval;
    _retval = cast(bool)g_charset_converter_get_use_fallback(cast(GCharsetConverter*)this._cPtr);
    return _retval;
  }

  /**
      Sets the #GCharsetConverter:use-fallback property.
  
      Params:
        useFallback = true to use fallbacks
  */
  void setUseFallback(bool useFallback)
  {
    g_charset_converter_set_use_fallback(cast(GCharsetConverter*)this._cPtr, useFallback);
  }
}
