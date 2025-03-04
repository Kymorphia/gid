module gtksource.snippet_manager;

import gid.gid;
import gio.list_model;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.snippet;
import gtksource.types;

/**
 * Provides access to class@Snippet.
 * `GtkSourceSnippetManager` is an object which processes snippet description
 * files and creates class@Snippet objects.
 * Use [gtksource.snippet_manager.SnippetManager.getDefault] to retrieve the default
 * instance of `GtkSourceSnippetManager`.
 * Use [gtksource.snippet_manager.SnippetManager.getSnippet] to retrieve snippets for
 * a given snippets.
 */
class SnippetManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_snippet_manager_get_type != &gidSymbolNotFound ? gtk_source_snippet_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns the default #GtkSourceSnippetManager instance.
   * Returns: a #GtkSourceSnippetManager which
   *   is owned by GtkSourceView library and must not be unref'd.
   */
  static gtksource.snippet_manager.SnippetManager getDefault()
  {
    GtkSourceSnippetManager* _cretval;
    _cretval = gtk_source_snippet_manager_get_default();
    auto _retval = ObjectG.getDObject!(gtksource.snippet_manager.SnippetManager)(cast(GtkSourceSnippetManager*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the list directories where self looks for snippet files.
   * Returns: %NULL-terminated array
   *   containing a list of snippet files directories.
   *   The array is owned by lm and must not be modified.
   */
  string[] getSearchPath()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_snippet_manager_get_search_path(cast(GtkSourceSnippetManager*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
   * Queries the known snippets for the first matching group, language_id,
   * and/or trigger.
   * If group or language_id are %NULL, they will be ignored.
   * Params:
   *   group = a group name or %NULL
   *   languageId = a #GtkSourceLanguage:id or %NULL
   *   trigger = the trigger for the snippet
   * Returns: a #GtkSourceSnippet or %NULL if no
   *   matching snippet was found.
   */
  gtksource.snippet.Snippet getSnippet(string group, string languageId, string trigger)
  {
    GtkSourceSnippet* _cretval;
    const(char)* _group = group.toCString(No.Alloc);
    const(char)* _languageId = languageId.toCString(No.Alloc);
    const(char)* _trigger = trigger.toCString(No.Alloc);
    _cretval = gtk_source_snippet_manager_get_snippet(cast(GtkSourceSnippetManager*)cPtr, _group, _languageId, _trigger);
    auto _retval = ObjectG.getDObject!(gtksource.snippet.Snippet)(cast(GtkSourceSnippet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets a [gio.list_model.ListModel] of all snippets.
   * This can be used to get an unfiltered list of all of the snippets
   * known to the snippet manager.
   * Returns: a [gio.list_model.ListModel] of [gtksource.snippet.Snippet]
   */
  gio.list_model.ListModel listAll()
  {
    GListModel* _cretval;
    _cretval = gtk_source_snippet_manager_list_all(cast(GtkSourceSnippetManager*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * List all the known groups within the snippet manager.
   * The result should be freed with [glib.global.gfree], and the individual strings are
   * owned by self and should never be freed by the caller.
   * Returns: An array of strings which should be freed with [glib.global.gfree].
   */
  string[] listGroups()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_snippet_manager_list_groups(cast(GtkSourceSnippetManager*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
   * Queries the known snippets for those matching group, language_id, and/or
   * trigger_prefix.
   * If any of these are %NULL, they will be ignored when filtering the available snippets.
   * The [gio.list_model.ListModel] only contains information about the available snippets until
   * [gio.list_model.ListModel.getItem] is called for a specific snippet. This helps reduce
   * the number of [gobject.object.ObjectG]'s that are created at runtime to those needed by
   * the calling application.
   * Params:
   *   group = a group name or %NULL
   *   languageId = a #GtkSourceLanguage:id or %NULL
   *   triggerPrefix = a prefix for a trigger to activate
   * Returns: a #GListModel of #GtkSourceSnippet.
   */
  gio.list_model.ListModel listMatching(string group = null, string languageId = null, string triggerPrefix = null)
  {
    GListModel* _cretval;
    const(char)* _group = group.toCString(No.Alloc);
    const(char)* _languageId = languageId.toCString(No.Alloc);
    const(char)* _triggerPrefix = triggerPrefix.toCString(No.Alloc);
    _cretval = gtk_source_snippet_manager_list_matching(cast(GtkSourceSnippetManager*)cPtr, _group, _languageId, _triggerPrefix);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the list of directories in which the `GtkSourceSnippetManager` looks for
   * snippet files.
   * If dirs is %NULL, the search path is reset to default.
   * At the moment this function can be called only before the
   * snippet files are loaded for the first time. In practice
   * to set a custom search path for a `GtkSourceSnippetManager`,
   * you have to call this function right after creating it.
   * Params:
   *   dirs = a %NULL-terminated array of
   *     strings or %NULL.
   */
  void setSearchPath(string[] dirs = null)
  {
    char*[] _tmpdirs;
    foreach (s; dirs)
      _tmpdirs ~= s.toCString(No.Alloc);
    _tmpdirs ~= null;
    const(char*)* _dirs = _tmpdirs.ptr;
    gtk_source_snippet_manager_set_search_path(cast(GtkSourceSnippetManager*)cPtr, _dirs);
  }
}
