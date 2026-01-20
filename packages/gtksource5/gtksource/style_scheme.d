/// Module for [StyleScheme] class
module gtksource.style_scheme;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style;
import gtksource.types;

/**
    Controls the appearance of `class@View`.
    
    #GtkSourceStyleScheme contains all the text styles to be used in
    `class@View` and `class@Buffer`. For instance, it contains text styles
    for syntax highlighting, it may contain foreground and background color for
    non-highlighted text, color for the line numbers, current line highlighting,
    bracket matching, etc.
    
    Style schemes are stored in XML files. The format of a scheme file is
    documented in the [style scheme reference](./style-reference.html).
    
    The two style schemes with IDs "classic" and "tango" follow more closely the
    GTK theme (for example for the background color).
*/
class StyleScheme : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_scheme_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleScheme self()
  {
    return this;
  }

  /**
      Get `description` property.
      Returns: Style scheme description, a translatable string to present to the user.
  */
  @property string description()
  {
    return getDescription();
  }

  /**
      Get `filename` property.
      Returns: Style scheme filename or null.
  */
  @property string filename()
  {
    return getFilename();
  }

  /**
      Get `name` property.
      Returns: Style scheme name, a translatable string to present to the user.
  */
  @property string name()
  {
    return getName();
  }

  /** */
  string[] getAuthors()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_style_scheme_get_authors(cast(GtkSourceStyleScheme*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_description(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_filename(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_id(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a metadata property from the style scheme.
  
      Params:
        name = metadata property name.
      Returns: value of property name stored in
          the metadata of scheme or null if scheme does not contain the
          specified metadata property.
  */
  string getMetadata(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_style_scheme_get_metadata(cast(GtkSourceStyleScheme*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_name(cast(GtkSourceStyleScheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gtksource.style.Style getStyle(string styleId)
  {
    GtkSourceStyle* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
    _cretval = gtk_source_style_scheme_get_style(cast(GtkSourceStyleScheme*)this._cPtr, _styleId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }
}
