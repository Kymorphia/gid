/// Module for [SearchSettings] class
module gtksource.search_settings;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class SearchSettings : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_search_settings_get_type != &gidSymbolNotFound ? gtk_source_search_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchSettings self()
  {
    return this;
  }

  /**
      Get `atWordBoundaries` property.
      Returns: If true, a search match must start and end a word. The match can
      span multiple words.
  */
  @property bool atWordBoundaries()
  {
    return getAtWordBoundaries();
  }

  /**
      Set `atWordBoundaries` property.
      Params:
        propval = If true, a search match must start and end a word. The match can
        span multiple words.
  */
  @property void atWordBoundaries(bool propval)
  {
    return setAtWordBoundaries(propval);
  }

  /**
      Get `caseSensitive` property.
      Returns: Whether the search is case sensitive.
  */
  @property bool caseSensitive()
  {
    return getCaseSensitive();
  }

  /**
      Set `caseSensitive` property.
      Params:
        propval = Whether the search is case sensitive.
  */
  @property void caseSensitive(bool propval)
  {
    return setCaseSensitive(propval);
  }

  /**
      Get `regexEnabled` property.
      Returns: Search by regular expressions with
      #GtkSourceSearchSettings:search-text as the pattern.
  */
  @property bool regexEnabled()
  {
    return getRegexEnabled();
  }

  /**
      Set `regexEnabled` property.
      Params:
        propval = Search by regular expressions with
        #GtkSourceSearchSettings:search-text as the pattern.
  */
  @property void regexEnabled(bool propval)
  {
    return setRegexEnabled(propval);
  }

  /**
      Get `searchText` property.
      Returns: A search string, or null if the search is disabled. If the regular
      expression search is enabled, #GtkSourceSearchSettings:search-text is
      the pattern.
  */
  @property string searchText()
  {
    return getSearchText();
  }

  /**
      Set `searchText` property.
      Params:
        propval = A search string, or null if the search is disabled. If the regular
        expression search is enabled, #GtkSourceSearchSettings:search-text is
        the pattern.
  */
  @property void searchText(string propval)
  {
    return setSearchText(propval);
  }

  /**
      Get `wrapAround` property.
      Returns: For a forward search, continue at the beginning of the buffer if no
      search occurrence is found. For a backward search, continue at the
      end of the buffer.
  */
  @property bool wrapAround()
  {
    return getWrapAround();
  }

  /**
      Set `wrapAround` property.
      Params:
        propval = For a forward search, continue at the beginning of the buffer if no
        search occurrence is found. For a backward search, continue at the
        end of the buffer.
  */
  @property void wrapAround(bool propval)
  {
    return setWrapAround(propval);
  }

  /**
      Creates a new search settings object.
      Returns: a new search settings object.
  */
  this()
  {
    GtkSourceSearchSettings* _cretval;
    _cretval = gtk_source_search_settings_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool getAtWordBoundaries()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_search_settings_get_at_word_boundaries(cast(GtkSourceSearchSettings*)this._cPtr);
    return _retval;
  }

  /** */
  bool getCaseSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_search_settings_get_case_sensitive(cast(GtkSourceSearchSettings*)this._cPtr);
    return _retval;
  }

  /** */
  bool getRegexEnabled()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_search_settings_get_regex_enabled(cast(GtkSourceSearchSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the text to search. The return value must not be freed.
      
      You may be interested to call [gtksource.global.utilsEscapeSearchText] after
      this function.
      Returns: the text to search, or null if the search is disabled.
  */
  string getSearchText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_search_settings_get_search_text(cast(GtkSourceSearchSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool getWrapAround()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_search_settings_get_wrap_around(cast(GtkSourceSearchSettings*)this._cPtr);
    return _retval;
  }

  /**
      Change whether the search is done at word boundaries. If at_word_boundaries
      is true, a search match must start and end a word. The match can span
      multiple words. See also [gtk.text_iter.TextIter.startsWord] and
      [gtk.text_iter.TextIter.endsWord].
  
      Params:
        atWordBoundaries = the setting.
  */
  void setAtWordBoundaries(bool atWordBoundaries)
  {
    gtk_source_search_settings_set_at_word_boundaries(cast(GtkSourceSearchSettings*)this._cPtr, atWordBoundaries);
  }

  /**
      Enables or disables the case sensitivity for the search.
  
      Params:
        caseSensitive = the setting.
  */
  void setCaseSensitive(bool caseSensitive)
  {
    gtk_source_search_settings_set_case_sensitive(cast(GtkSourceSearchSettings*)this._cPtr, caseSensitive);
  }

  /**
      Enables or disables whether to search by regular expressions.
      If enabled, the #GtkSourceSearchSettings:search-text property contains the
      pattern of the regular expression.
      
      #GtkSourceSearchContext uses #GRegex when regex search is enabled. See the
      [Regular expression syntax](https://developer.gnome.org/glib/stable/glib-regex-syntax.html)
      page in the GLib reference manual.
  
      Params:
        regexEnabled = the setting.
  */
  void setRegexEnabled(bool regexEnabled)
  {
    gtk_source_search_settings_set_regex_enabled(cast(GtkSourceSearchSettings*)this._cPtr, regexEnabled);
  }

  /**
      Sets the text to search. If search_text is null or is empty, the search
      will be disabled. A copy of search_text will be made, so you can safely free
      search_text after a call to this function.
      
      You may be interested to call [gtksource.global.utilsUnescapeSearchText] before
      this function.
  
      Params:
        searchText = the nul-terminated text to search, or null to disable the search.
  */
  void setSearchText(string searchText = null)
  {
    const(char)* _searchText = searchText.toCString(No.Alloc);
    gtk_source_search_settings_set_search_text(cast(GtkSourceSearchSettings*)this._cPtr, _searchText);
  }

  /**
      Enables or disables the wrap around search. If wrap_around is true, the
      forward search continues at the beginning of the buffer if no search
      occurrences are found. Similarly, the backward search continues to search at
      the end of the buffer.
  
      Params:
        wrapAround = the setting.
  */
  void setWrapAround(bool wrapAround)
  {
    gtk_source_search_settings_set_wrap_around(cast(GtkSourceSearchSettings*)this._cPtr, wrapAround);
  }
}
