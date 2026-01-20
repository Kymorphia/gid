/// Module for [StyleSchemeManager] class
module gtksource.style_scheme_manager;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme;
import gtksource.types;

/** */
class StyleSchemeManager : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_scheme_manager_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeManager self()
  {
    return this;
  }

  /**
      Creates a new style manager. If you do not need more than one style
      manager then use [gtksource.style_scheme_manager.StyleSchemeManager.getDefault] instead.
      Returns: a new #GtkSourceStyleSchemeManager.
  */
  this()
  {
    GtkSourceStyleSchemeManager* _cretval;
    _cretval = gtk_source_style_scheme_manager_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the default #GtkSourceStyleSchemeManager instance.
      Returns: a #GtkSourceStyleSchemeManager. Return value
        is owned by GtkSourceView library and must not be unref'ed.
  */
  static gtksource.style_scheme_manager.StyleSchemeManager getDefault()
  {
    GtkSourceStyleSchemeManager* _cretval;
    _cretval = gtk_source_style_scheme_manager_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style_scheme_manager.StyleSchemeManager)(cast(GtkSourceStyleSchemeManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Appends path to the list of directories where the manager looks for
      style scheme files.
      See [gtksource.style_scheme_manager.StyleSchemeManager.setSearchPath] for details.
  
      Params:
        path = a directory or a filename.
  */
  void appendSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_source_style_scheme_manager_append_search_path(cast(GtkSourceStyleSchemeManager*)this._cPtr, _path);
  }

  /**
      Mark any currently cached information about the available style scehems
      as invalid. All the available style schemes will be reloaded next time
      the manager is accessed.
  */
  void forceRescan()
  {
    gtk_source_style_scheme_manager_force_rescan(cast(GtkSourceStyleSchemeManager*)this._cPtr);
  }

  /**
      Looks up style scheme by id.
  
      Params:
        schemeId = style scheme id to find.
      Returns: a #GtkSourceStyleScheme object.
          The returned value is owned by manager and must not be unref'ed.
  */
  gtksource.style_scheme.StyleScheme getScheme(string schemeId)
  {
    GtkSourceStyleScheme* _cretval;
    const(char)* _schemeId = schemeId.toCString(No.Alloc);
    _cretval = gtk_source_style_scheme_manager_get_scheme(cast(GtkSourceStyleSchemeManager*)this._cPtr, _schemeId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the ids of the available style schemes.
      Returns: a null-terminated array of strings containing the ids of the available
        style schemes or null if no style scheme is available.
        The array is sorted alphabetically according to the scheme name.
        The array is owned by the manager and must not be modified.
  */
  string[] getSchemeIds()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_style_scheme_manager_get_scheme_ids(cast(GtkSourceStyleSchemeManager*)this._cPtr);
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
      Returns the current search path for the manager.
      See [gtksource.style_scheme_manager.StyleSchemeManager.setSearchPath] for details.
      Returns: a null-terminated array
        of string containing the search path.
        The array is owned by the manager and must not be modified.
  */
  string[] getSearchPath()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_style_scheme_manager_get_search_path(cast(GtkSourceStyleSchemeManager*)this._cPtr);
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
      Prepends path to the list of directories where the manager looks
      for style scheme files.
      See [gtksource.style_scheme_manager.StyleSchemeManager.setSearchPath] for details.
  
      Params:
        path = a directory or a filename.
  */
  void prependSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_source_style_scheme_manager_prepend_search_path(cast(GtkSourceStyleSchemeManager*)this._cPtr, _path);
  }

  /**
      Sets the list of directories where the manager looks for
      style scheme files.
      If path is null, the search path is reset to default.
  
      Params:
        path = a null-terminated array of strings or null.
  */
  void setSearchPath(string[] path = null)
  {
    char*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    _tmppath ~= null;
    char** _path = _tmppath.ptr;

    gtk_source_style_scheme_manager_set_search_path(cast(GtkSourceStyleSchemeManager*)this._cPtr, _path);
  }
}
