/// Module for [Language] class
module gtksource.language;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Represents a syntax highlighted language.
    
    A [gtksource.language.Language] represents a programming or markup language, affecting
    syntax highlighting and [context classes](./class.Buffer.html#context-classes).
    
    Use `class@LanguageManager` to obtain a [gtksource.language.Language] instance, and
    [gtksource.buffer.Buffer.setLanguage] to apply it to a `class@Buffer`.
*/
class Language : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_language_get_type != &gidSymbolNotFound ? gtk_source_language_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Language self()
  {
    return this;
  }

  /** */
  @property bool hidden()
  {
    return getHidden();
  }

  /** */
  @property string id()
  {
    return getId();
  }

  /** */
  @property string name()
  {
    return getName();
  }

  /** */
  @property string section()
  {
    return getSection();
  }

  /**
      Returns the globs associated to this language.
      
      This is just an utility wrapper around [gtksource.language.Language.getMetadata] to
      retrieve the "globs" metadata property and split it into an array.
      Returns: a newly-allocated null terminated array containing the globs or null
        if no globs are found.
        The returned array must be freed with [glib.global.strfreev].
  */
  string[] getGlobs()
  {
    char** _cretval;
    _cretval = gtk_source_language_get_globs(cast(GtkSourceLanguage*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns whether the language should be hidden from the user.
      Returns: true if the language should be hidden, false otherwise.
  */
  bool getHidden()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_language_get_hidden(cast(GtkSourceLanguage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the ID of the language.
      
      The ID is not locale-dependent.The returned string is owned by language
      and should not be freed or modified.
      Returns: the ID of language.
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_id(cast(GtkSourceLanguage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getMetadata(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_language_get_metadata(cast(GtkSourceLanguage*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the mime types associated to this language.
      
      This is just an utility wrapper around [gtksource.language.Language.getMetadata] to
      retrieve the "mimetypes" metadata property and split it into an
      array.
      Returns: a newly-allocated null terminated array containing the mime types
        or null if no mime types are found.
        The returned array must be freed with [glib.global.strfreev].
  */
  string[] getMimeTypes()
  {
    char** _cretval;
    _cretval = gtk_source_language_get_mime_types(cast(GtkSourceLanguage*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the localized name of the language.
      
      The returned string is owned by language and should not be freed
      or modified.
      Returns: the name of language.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_name(cast(GtkSourceLanguage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the localized section of the language.
      
      Each language belong to a section (ex. HTML belongs to the
      Markup section).
      The returned string is owned by language and should not be freed
      or modified.
      Returns: the section of language.
  */
  string getSection()
  {
    const(char)* _cretval;
    _cretval = gtk_source_language_get_section(cast(GtkSourceLanguage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the ID of the style to use if the specified style_id
      is not present in the current style scheme.
  
      Params:
        styleId = a style ID.
      Returns: the ID of the style to use if the
        specified style_id is not present in the current style scheme or null
        if the style has no fallback defined.
        The returned string is owned by the language and must not be modified.
  */
  string getStyleFallback(string styleId)
  {
    const(char)* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
    _cretval = gtk_source_language_get_style_fallback(cast(GtkSourceLanguage*)this._cPtr, _styleId);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the ids of the styles defined by this language.
      Returns: a newly-allocated null terminated array containing ids of the
        styles defined by this language or null if no style is defined.
        The returned array must be freed with [glib.global.strfreev].
  */
  string[] getStyleIds()
  {
    char** _cretval;
    _cretval = gtk_source_language_get_style_ids(cast(GtkSourceLanguage*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the name of the style with ID style_id defined by this language.
  
      Params:
        styleId = a style ID.
      Returns: the name of the style with ID style_id
        defined by this language or null if the style has no name or there is no
        style with ID style_id defined by this language.
        The returned string is owned by the language and must not be modified.
  */
  string getStyleName(string styleId)
  {
    const(char)* _cretval;
    const(char)* _styleId = styleId.toCString(No.Alloc);
    _cretval = gtk_source_language_get_style_name(cast(GtkSourceLanguage*)this._cPtr, _styleId);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
