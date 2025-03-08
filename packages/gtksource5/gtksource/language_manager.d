module gtksource.language_manager;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.language;
import gtksource.types;

/**
    Provides access to `class@Language`s.
  
  [gtksource.language_manager.LanguageManager] is an object which processes language description
  files and creates and stores `class@Language` objects, and provides API to
  access them.
  
  Use [gtksource.language_manager.LanguageManager.getDefault] to retrieve the default
  instance of [gtksource.language_manager.LanguageManager], and
  [gtksource.language_manager.LanguageManager.guessLanguage] to get a `class@Language` for
  given file name and content type.
*/
class LanguageManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_language_manager_get_type != &gidSymbolNotFound ? gtk_source_language_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new language manager.
    
    If you do not need more than one language manager or a private language manager
    instance then use [gtksource.language_manager.LanguageManager.getDefault] instead.
    Returns:     a new #GtkSourceLanguageManager.
  */
  this()
  {
    GtkSourceLanguageManager* _cretval;
    _cretval = gtk_source_language_manager_new();
    this(_cretval, Yes.take);
  }

  /**
      Returns the default #GtkSourceLanguageManager instance.
    Returns:     a #GtkSourceLanguageManager.
      Return value is owned by GtkSourceView library and must not be unref'ed.
  */
  static gtksource.language_manager.LanguageManager getDefault()
  {
    GtkSourceLanguageManager* _cretval;
    _cretval = gtk_source_language_manager_get_default();
    auto _retval = ObjectG.getDObject!(gtksource.language_manager.LanguageManager)(cast(GtkSourceLanguageManager*)_cretval, No.take);
    return _retval;
  }

  /**
      Appends path to the list of directories where the manager looks for
    language files.
    
    See [gtksource.language_manager.LanguageManager.setSearchPath] for details.
    Params:
      path =       a directory or a filename.
  */
  void appendSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.alloc);
    gtk_source_language_manager_append_search_path(cast(GtkSourceLanguageManager*)cPtr, _path);
  }

  /**
      Gets the `classLanguage` identified by the given id in the language
    manager.
    Params:
      id =       a language id.
    Returns:     a #GtkSourceLanguage, or null
      if there is no language identified by the given id. Return value is
      owned by lm and should not be freed.
  */
  gtksource.language.Language getLanguage(string id)
  {
    GtkSourceLanguage* _cretval;
    const(char)* _id = id.toCString(No.alloc);
    _cretval = gtk_source_language_manager_get_language(cast(GtkSourceLanguageManager*)cPtr, _id);
    auto _retval = ObjectG.getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the ids of the available languages.
    Returns:     a null-terminated array of strings containing the ids of the available
      languages or null if no language is available.
      The array is sorted alphabetically according to the language name.
      The array is owned by lm and must not be modified.
  */
  string[] getLanguageIds()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_language_manager_get_language_ids(cast(GtkSourceLanguageManager*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.free);
    }
    return _retval;
  }

  /**
      Gets the list directories where lm looks for language files.
    Returns:     null-terminated array
      containing a list of language files directories.
      The array is owned by lm and must not be modified.
  */
  string[] getSearchPath()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_language_manager_get_search_path(cast(GtkSourceLanguageManager*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.free);
    }
    return _retval;
  }

  /**
      Picks a `classLanguage` for given file name and content type,
    according to the information in lang files.
    
    Either filename or content_type may be null. This function can be used as follows:
    
    ```c
    GtkSourceLanguage *lang;
    GtkSourceLanguageManager *manager;
    lm = gtk_source_language_manager_get_default ();
    lang = gtk_source_language_manager_guess_language (manager, filename, NULL);
    gtk_source_buffer_set_language (buffer, lang);
    ```
    
    or
    
    ```c
    GtkSourceLanguage *lang = NULL;
    GtkSourceLanguageManager *manager;
    gboolean result_uncertain;
    gchar *content_type;
    
    content_type = g_content_type_guess (filename, NULL, 0, &result_uncertain);
    if (result_uncertain)
      {
        g_free (content_type);
        content_type = NULL;
      }
    
    manager = gtk_source_language_manager_get_default ();
    lang = gtk_source_language_manager_guess_language (manager, filename, content_type);
    gtk_source_buffer_set_language (buffer, lang);
    
    g_free (content_type);
    ```
    
    etc. Use [gtksource.language.Language.getMimeTypes] and [gtksource.language.Language.getGlobs]
    if you need full control over file -> language mapping.
    Params:
      filename =       a filename in Glib filename encoding, or null.
      contentType =       a content type (as in GIO API), or null.
    Returns:     a #GtkSourceLanguage, or null if there
      is no suitable language for given filename and/or content_type. Return
      value is owned by lm and should not be freed.
  */
  gtksource.language.Language guessLanguage(string filename = null, string contentType = null)
  {
    GtkSourceLanguage* _cretval;
    const(char)* _filename = filename.toCString(No.alloc);
    const(char)* _contentType = contentType.toCString(No.alloc);
    _cretval = gtk_source_language_manager_guess_language(cast(GtkSourceLanguageManager*)cPtr, _filename, _contentType);
    auto _retval = ObjectG.getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.take);
    return _retval;
  }

  /**
      Prepends path to the list of directories where the manager looks
    for language files.
    
    See [gtksource.language_manager.LanguageManager.setSearchPath] for details.
    Params:
      path =       a directory or a filename.
  */
  void prependSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.alloc);
    gtk_source_language_manager_prepend_search_path(cast(GtkSourceLanguageManager*)cPtr, _path);
  }

  /**
      Sets the list of directories where the lm looks for
    language files.
    
    If dirs is null, the search path is reset to default.
    
    At the moment this function can be called only before the
    language files are loaded for the first time. In practice
    to set a custom search path for a [gtksource.language_manager.LanguageManager],
    you have to call this function right after creating it.
    
    Since GtkSourceView 5.4 this function will allow you to provide
    paths in the form of "resource:///" URIs to embedded [gio.resource.Resource]s.
    They must contain the path of a directory within the [gio.resource.Resource].
    Params:
      dirs =       a null-terminated array of
          strings or null.
  */
  void setSearchPath(string[] dirs = null)
  {
    char*[] _tmpdirs;
    foreach (s; dirs)
      _tmpdirs ~= s.toCString(No.alloc);
    _tmpdirs ~= null;
    const(char*)* _dirs = _tmpdirs.ptr;
    gtk_source_language_manager_set_search_path(cast(GtkSourceLanguageManager*)cPtr, _dirs);
  }
}
