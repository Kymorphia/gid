/// Module for [CharsetConverter] class
module gid.gio2.charset_converter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.converter;
import gid.gio2.converter_mixin;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.charset_converter.CharsetConverter] is an implementation of [gid.gio2.converter.Converter] based on
    [gid.glib2.types.void*].
*/
class CharsetConverter : gid.gobject2.object.ObjectWrap, gid.gio2.converter.Converter, gid.gio2.initable.Initable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_charset_converter_get_type != &gidSymbolNotFound ? g_charset_converter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GCharsetConverter";
  }

  /** Returns `this`, for use in `with` statements. */
  override CharsetConverter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.charset_converter.CharsetConverter]
      Returns: New builder object
  */
  static CharsetConverterGidBuilder builder() nothrow
  {
    return new CharsetConverterGidBuilder;
  }

  /**
      Get `fromCharset` property.
      Returns: The character encoding to convert from.
  */
  @property string fromCharset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("from-charset");
  }

  /**
      Get `toCharset` property.
      Returns: The character encoding to convert to.
  */
  @property string toCharset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("to-charset");
  }

  /**
      Get `useFallback` property.
      Returns: Use fallback (of form `\<hexval>`) for invalid bytes.
  */
  @property bool useFallback() nothrow
  {
    return getUseFallback();
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Use fallback (of form `\<hexval>`) for invalid bytes.
  */
  @property void useFallback(bool propval) nothrow
  {
    setUseFallback(propval);
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
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GCharsetConverter* _cretval;
      const(char)* _toCharset = toCharset.toCString!(No.Malloc, No.Nullable);
      const(char)* _fromCharset = fromCharset.toCString!(No.Malloc, No.Nullable);
      GError *_err;
      _cretval = g_charset_converter_new(_toCharset, _fromCharset, &_err);
      if (_err)
        throw new ErrorWrap(_err, Yes.Take);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the number of fallbacks that converter has applied so far.
      Returns: the number of fallbacks that converter has applied
  */
  uint getNumFallbacks() nothrow
  {
    uint _retval;
    _retval = g_charset_converter_get_num_fallbacks(cast(GCharsetConverter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GCharsetConverter:use-fallback property.
      Returns: true if fallbacks are used by converter
  */
  bool getUseFallback() nothrow
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
  void setUseFallback(bool useFallback) nothrow
  {
    g_charset_converter_set_use_fallback(cast(GCharsetConverter*)this._cPtr, useFallback);
  }
}

/// Fluent builder implementation template for [gid.gio2.charset_converter.CharsetConverter]
class CharsetConverterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.converter.ConverterGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin ConverterGidBuilderT!();
  mixin InitableGidBuilderT!();

  /**
      Set `fromCharset` property.
      Params:
        propval = The character encoding to convert from.
      Returns: Builder instance for fluent chaining
  */
  T fromCharset(string propval) nothrow
  {
    return setProperty("from-charset", propval);
  }

  /**
      Set `toCharset` property.
      Params:
        propval = The character encoding to convert to.
      Returns: Builder instance for fluent chaining
  */
  T toCharset(string propval) nothrow
  {
    return setProperty("to-charset", propval);
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Use fallback (of form `\<hexval>`) for invalid bytes.
      Returns: Builder instance for fluent chaining
  */
  T useFallback(bool propval) nothrow
  {
    return setProperty("use-fallback", propval);
  }
}

/// Fluent builder for [gid.gio2.charset_converter.CharsetConverter]
final class CharsetConverterGidBuilder : CharsetConverterGidBuilderImpl!CharsetConverterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CharsetConverter build() nothrow
  {
    return new CharsetConverter(cast(void*)createGObject(CharsetConverter._getGType), Yes.Take);
  }
}
