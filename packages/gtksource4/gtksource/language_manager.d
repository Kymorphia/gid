/// Module for [LanguageManager] class
module gtksource.language_manager;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.language;
import gtksource.types;

/** */
class LanguageManager : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_language_manager_get_type != &gidSymbolNotFound ? gtk_source_language_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LanguageManager self()
  {
    return this;
  }

  /**
      Creates a new language manager. If you do not need more than one language
      manager or a private language manager instance then use
      [gtksource.language_manager.LanguageManager.getDefault] instead.
      Returns: a new #GtkSourceLanguageManager.
  */
  this()
  {
    GtkSourceLanguageManager* _cretval;
    _cretval = gtk_source_language_manager_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the default #GtkSourceLanguageManager instance.
      Returns: a #GtkSourceLanguageManager.
        Return value is owned by GtkSourceView library and must not be unref'ed.
  */
  static gtksource.language_manager.LanguageManager getDefault()
  {
    GtkSourceLanguageManager* _cretval;
    _cretval = gtk_source_language_manager_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.language_manager.LanguageManager)(cast(GtkSourceLanguageManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkSourceLanguage identified by the given id in the language
      manager.
  
      Params:
        id = a language id.
      Returns: a #GtkSourceLanguage, or null
        if there is no language identified by the given id. Return value is
        owned by lm and should not be freed.
  */
  gtksource.language.Language getLanguage(string id)
  {
    GtkSourceLanguage* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gtk_source_language_manager_get_language(cast(GtkSourceLanguageManager*)this._cPtr, _id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the ids of the available languages.
      Returns: a null-terminated array of strings containing the ids of the available
        languages or null if no language is available.
        The array is sorted alphabetically according to the language name.
        The array is owned by lm and must not be modified.
  */
  string[] getLanguageIds()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_language_manager_get_language_ids(cast(GtkSourceLanguageManager*)this._cPtr);
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

  /**
      Gets the list directories where lm looks for language files.
      Returns: null-terminated array
        containg a list of language files directories.
        The array is owned by lm and must not be modified.
  */
  string[] getSearchPath()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_language_manager_get_search_path(cast(GtkSourceLanguageManager*)this._cPtr);
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

  /**
      Picks a #GtkSourceLanguage for given file name and content type,
      according to the information in lang files. Either filename or
      content_type may be null. This function can be used as follows:
      
      <informalexample><programlisting>
        GtkSourceLanguage *lang;
        lang = gtk_source_language_manager_guess_language (filename, NULL);
        gtk_source_buffer_set_language (buffer, lang);
      </programlisting></informalexample>
      
      or
      
      <informalexample><programlisting>
        GtkSourceLanguage *lang = NULL;
        gboolean result_uncertain;
        gchar *content_type;
      
        content_type = g_content_type_guess (filename, NULL, 0, &result_uncertain);
        if (result_uncertain)
          {
            g_free (content_type);
            content_type = NULL;
          }
      
        lang = gtk_source_language_manager_guess_language (manager, filename, content_type);
        gtk_source_buffer_set_language (buffer, lang);
      
        g_free (content_type);
      </programlisting></informalexample>
      
      etc. Use [gtksource.language.Language.getMimeTypes] and [gtksource.language.Language.getGlobs]
      if you need full control over file -> language mapping.
  
      Params:
        filename = a filename in Glib filename encoding, or null.
        contentType = a content type (as in GIO API), or null.
      Returns: a #GtkSourceLanguage, or null if there
        is no suitable language for given filename and/or content_type. Return
        value is owned by lm and should not be freed.
  */
  gtksource.language.Language guessLanguage(string filename = null, string contentType = null)
  {
    GtkSourceLanguage* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_source_language_manager_guess_language(cast(GtkSourceLanguageManager*)this._cPtr, _filename, _contentType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the list of directories where the lm looks for
      language files.
      If dirs is null, the search path is reset to default.
      
      <note>
        <para>
          At the moment this function can be called only before the
          language files are loaded for the first time. In practice
          to set a custom search path for a #GtkSourceLanguageManager,
          you have to call this function right after creating it.
        </para>
      </note>
  
      Params:
        dirs = a null-terminated array of strings or null.
  */
  void setSearchPath(string[] dirs = null)
  {
    char*[] _tmpdirs;
    foreach (s; dirs)
      _tmpdirs ~= s.toCString(No.Alloc);
    _tmpdirs ~= null;
    char** _dirs = _tmpdirs.ptr;

    gtk_source_language_manager_set_search_path(cast(GtkSourceLanguageManager*)this._cPtr, _dirs);
  }
}
