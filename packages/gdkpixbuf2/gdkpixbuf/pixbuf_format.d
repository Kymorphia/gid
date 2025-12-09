/// Module for [PixbufFormat] class
module gdkpixbuf.pixbuf_format;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_module_pattern;
import gdkpixbuf.types;
import gid.gid;
import gobject.boxed;

/**
    A [gdkpixbuf.pixbuf_format.PixbufFormat] contains information about the image format accepted
    by a module.
    
    Only modules should access the fields directly, applications should
    use the `gdk_pixbuf_format_*` family of functions.
*/
class PixbufFormat : gobject.boxed.Boxed
{

  /**
      Create a `pixbuf_format.PixbufFormat` boxed type.
      Params:
        name = the name of the image format
        domain = the message domain for the `description`
        description = a description of the image format
        flags = a combination of [gdkpixbuf.types.PixbufFormatFlags]
        disabled = a boolean determining whether the loader is disabled`
        license = a string containing license information, typically set to
            shorthands like "GPL", "LGPL", etc.
  */
  this(string name = string.init, string domain = string.init, string description = string.init, uint flags = uint.init, bool disabled = bool.init, string license = string.init)
  {
    super(gMalloc(GdkPixbufFormat.sizeof), Yes.Take);
    this.name = name;
    this.domain = domain;
    this.description = description;
    this.flags = flags;
    this.disabled = disabled;
    this.license = license;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_format_get_type != &gidSymbolNotFound ? gdk_pixbuf_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufFormat self()
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: the name of the image format
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the image format
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GdkPixbufFormat*)this._cPtr).name);
  }

  /**
      Get `signature` field.
      Returns: the signature of the module
  */
  @property gdkpixbuf.pixbuf_module_pattern.PixbufModulePattern signature()
  {
    return new gdkpixbuf.pixbuf_module_pattern.PixbufModulePattern(cast(GdkPixbufModulePattern*)(cast(GdkPixbufFormat*)this._cPtr).signature, No.Take);
  }

  /**
      Get `domain` field.
      Returns: the message domain for the `description`
  */
  @property string domain()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).domain);
  }

  /**
      Set `domain` field.
      Params:
        propval = the message domain for the `description`
  */
  @property void domain(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).domain);
    dToC(propval, cast(void*)&(cast(GdkPixbufFormat*)this._cPtr).domain);
  }

  /**
      Get `description` field.
      Returns: a description of the image format
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = a description of the image format
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GdkPixbufFormat*)this._cPtr).description);
  }

  /**
      Get `flags` field.
      Returns: a combination of [gdkpixbuf.types.PixbufFormatFlags]
  */
  @property uint flags()
  {
    return (cast(GdkPixbufFormat*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = a combination of [gdkpixbuf.types.PixbufFormatFlags]
  */
  @property void flags(uint propval)
  {
    (cast(GdkPixbufFormat*)this._cPtr).flags = propval;
  }

  /**
      Get `disabled` field.
      Returns: a boolean determining whether the loader is disabled`
  */
  @property bool disabled()
  {
    return (cast(GdkPixbufFormat*)this._cPtr).disabled;
  }

  /**
      Set `disabled` field.
      Params:
        propval = a boolean determining whether the loader is disabled`
  */
  @property void disabled(bool propval)
  {
    (cast(GdkPixbufFormat*)this._cPtr).disabled = propval;
  }

  /**
      Get `license` field.
      Returns: a string containing license information, typically set to
        shorthands like "GPL", "LGPL", etc.
  */
  @property string license()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).license);
  }

  /**
      Set `license` field.
      Params:
        propval = a string containing license information, typically set to
          shorthands like "GPL", "LGPL", etc.
  */
  @property void license(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufFormat*)this._cPtr).license);
    dToC(propval, cast(void*)&(cast(GdkPixbufFormat*)this._cPtr).license);
  }

  /**
      Creates a copy of `format`.
      Returns: the newly allocated copy of a [gdkpixbuf.pixbuf_format.PixbufFormat]. Use
          [gdkpixbuf.pixbuf_format.PixbufFormat.free] to free the resources when done
  */
  gdkpixbuf.pixbuf_format.PixbufFormat copy()
  {
    GdkPixbufFormat* _cretval;
    _cretval = gdk_pixbuf_format_copy(cast(const(GdkPixbufFormat)*)this._cPtr);
    auto _retval = _cretval ? new gdkpixbuf.pixbuf_format.PixbufFormat(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a description of the format.
      Returns: a description of the format.
  */
  string getDescription()
  {
    char* _cretval;
    _cretval = gdk_pixbuf_format_get_description(cast(GdkPixbufFormat*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the filename extensions typically used for files in the
      given format.
      Returns: an array of
          filename extensions
  */
  string[] getExtensions()
  {
    char** _cretval;
    _cretval = gdk_pixbuf_format_get_extensions(cast(GdkPixbufFormat*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns information about the license of the image loader for the format.
      
      The returned string should be a shorthand for a well known license, e.g.
      "LGPL", "GPL", "QPL", "GPL/QPL", or "other" to indicate some other license.
      Returns: a string describing the license of the pixbuf format
  */
  string getLicense()
  {
    char* _cretval;
    _cretval = gdk_pixbuf_format_get_license(cast(GdkPixbufFormat*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the mime types supported by the format.
      Returns: an array of mime types
  */
  string[] getMimeTypes()
  {
    char** _cretval;
    _cretval = gdk_pixbuf_format_get_mime_types(cast(GdkPixbufFormat*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the name of the format.
      Returns: the name of the format.
  */
  string getName()
  {
    char* _cretval;
    _cretval = gdk_pixbuf_format_get_name(cast(GdkPixbufFormat*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether this image format is disabled.
      
      See [gdkpixbuf.pixbuf_format.PixbufFormat.setDisabled].
      Returns: whether this image format is disabled.
  */
  bool isDisabled()
  {
    bool _retval;
    _retval = gdk_pixbuf_format_is_disabled(cast(GdkPixbufFormat*)this._cPtr);
    return _retval;
  }

  /**
      Returns `TRUE` if the save option specified by option_key is supported when
      saving a pixbuf using the module implementing format.
      
      See [gdkpixbuf.pixbuf.Pixbuf.save] for more information about option keys.
  
      Params:
        optionKey = the name of an option
      Returns: `TRUE` if the specified option is supported
  */
  bool isSaveOptionSupported(string optionKey)
  {
    bool _retval;
    const(char)* _optionKey = optionKey.toCString(No.Alloc);
    _retval = gdk_pixbuf_format_is_save_option_supported(cast(GdkPixbufFormat*)this._cPtr, _optionKey);
    return _retval;
  }

  /**
      Returns whether this image format is scalable.
      
      If a file is in a scalable format, it is preferable to load it at
      the desired size, rather than loading it at the default size and
      scaling the resulting pixbuf to the desired size.
      Returns: whether this image format is scalable.
  */
  bool isScalable()
  {
    bool _retval;
    _retval = gdk_pixbuf_format_is_scalable(cast(GdkPixbufFormat*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether pixbufs can be saved in the given format.
      Returns: whether pixbufs can be saved in the given format.
  */
  bool isWritable()
  {
    bool _retval;
    _retval = gdk_pixbuf_format_is_writable(cast(GdkPixbufFormat*)this._cPtr);
    return _retval;
  }

  /**
      Disables or enables an image format.
      
      If a format is disabled, GdkPixbuf won't use the image loader for
      this format to load images.
      
      Applications can use this to avoid using image loaders with an
      inappropriate license, see [gdkpixbuf.pixbuf_format.PixbufFormat.getLicense].
  
      Params:
        disabled = `TRUE` to disable the format format
  */
  void setDisabled(bool disabled)
  {
    gdk_pixbuf_format_set_disabled(cast(GdkPixbufFormat*)this._cPtr, disabled);
  }
}
