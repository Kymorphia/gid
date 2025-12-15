/// Module for [SearchContext] class
module gtksource.search_context;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.search_settings;
import gtksource.style;
import gtksource.types;

/**
    Search context.
    
    A [gtksource.search_context.SearchContext] is used for the search and replace in a
    `class@Buffer`. The search settings are represented by a
    `class@SearchSettings` object. There can be a many-to-many relationship
    between buffers and search settings, with the search contexts in-between: a
    search settings object can be shared between several search contexts; and a
    buffer can contain several search contexts at the same time.
    
    The total number of search occurrences can be retrieved with
    [gtksource.search_context.SearchContext.getOccurrencesCount]. To know the position of a
    certain match, use [gtksource.search_context.SearchContext.getOccurrencePosition].
    
    The buffer is scanned asynchronously, so it doesn't block the user interface.
    For each search, the buffer is scanned at most once. After that, navigating
    through the occurrences doesn't require to re-scan the buffer entirely.
    
    To search forward, use [gtksource.search_context.SearchContext.forward] or
    [gtksource.search_context.SearchContext.forwardAsync] for the asynchronous version.
    The backward search is done similarly. To replace a search match, or all
    matches, use [gtksource.search_context.SearchContext.replace] and
    [gtksource.search_context.SearchContext.replaceAll].
    
    The search occurrences are highlighted by default. To disable it, use
    [gtksource.search_context.SearchContext.setHighlight]. You can enable the search
    highlighting for several [gtksource.search_context.SearchContext]s attached to the
    same buffer. Moreover, each of those [gtksource.search_context.SearchContext]s can
    have a different text style associated. Use
    [gtksource.search_context.SearchContext.setMatchStyle] to specify the `class@Style`
    to apply on search matches.
    
    Note that the `property@SearchContext:highlight` and
    `property@SearchContext:match-style` properties are in the
    [gtksource.search_context.SearchContext] class, not `class@SearchSettings`. Appearance
    settings should be tied to one, and only one buffer, as different buffers can
    have different style scheme associated (a `class@SearchSettings` object
    can be bound indirectly to several buffers).
    
    The concept of "current match" doesn't exist yet. A way to highlight
    differently the current match is to select it.
    
    A search occurrence's position doesn't depend on the cursor position or other
    parameters. Take for instance the buffer "aaaa" with the search text "aa".
    The two occurrences are at positions [0:2] and [2:4]. If you begin to search
    at position 1, you will get the occurrence [2:4], not [1:3]. This is a
    prerequisite for regular expression searches. The pattern ".*" matches the
    entire line. If the cursor is at the middle of the line, you don't want the
    rest of the line as the occurrence, you want an entire line. (As a side note,
    regular expression searches can also match multiple lines.)
    
    In the GtkSourceView source code, there is an example of how to use the
    search and replace API: see the tests/test-search.c file. It is a mini
    application for the search and replace, with a basic user interface.
*/
class SearchContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_search_context_get_type != &gidSymbolNotFound ? gtk_source_search_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchContext self()
  {
    return this;
  }

  /**
      Get `highlight` property.
      Returns: Highlight the search occurrences.
  */
  @property bool highlight()
  {
    return getHighlight();
  }

  /**
      Set `highlight` property.
      Params:
        propval = Highlight the search occurrences.
  */
  @property void highlight(bool propval)
  {
    return setHighlight(propval);
  }

  /**
      Get `matchStyle` property.
      Returns: A `class@Style`, or null for theme's scheme default style.
  */
  @property gtksource.style.Style matchStyle()
  {
    return getMatchStyle();
  }

  /**
      Set `matchStyle` property.
      Params:
        propval = A `class@Style`, or null for theme's scheme default style.
  */
  @property void matchStyle(gtksource.style.Style propval)
  {
    return setMatchStyle(propval);
  }

  /**
      Get `occurrencesCount` property.
      Returns: The total number of search occurrences. If the search is disabled,
      the value is 0. If the buffer is not already fully scanned, the value
      is -1.
  */
  @property int occurrencesCount()
  {
    return getOccurrencesCount();
  }

  /**
      Get `regexError` property.
      Returns: If the regex search pattern doesn't follow all the rules, this
      #GError property will be set. If the pattern is valid, the value is
      null.
      
      Free with [glib.error.ErrorWrap.free].
  */
  @property glib.error.ErrorWrap regexError()
  {
    return getRegexError();
  }

  /**
      Creates a new search context, associated with buffer, and customized with
      settings.
      
      If settings is null, a new `classSearchSettings` object will
      be created, that you can retrieve with [gtksource.search_context.SearchContext.getSettings].
  
      Params:
        buffer = a #GtkSourceBuffer.
        settings = a #GtkSourceSearchSettings, or null.
      Returns: a new search context.
  */
  this(gtksource.buffer.Buffer buffer, gtksource.search_settings.SearchSettings settings = null)
  {
    GtkSourceSearchContext* _cretval;
    _cretval = gtk_source_search_context_new(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, settings ? cast(GtkSourceSearchSettings*)settings._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Synchronous backward search.
      
      It is recommended to use the asynchronous functions instead, to not block the user interface.
      However, if you are sure that the buffer is small, this function is more convenient to use.
      
      If the `propertySearchSettings:wrap-around` property is false, this function
      doesn't try to wrap around.
      
      The has_wrapped_around out parameter is set independently of whether a match
      is found. So if this function returns false, has_wrapped_around will have
      the same value as the `propertySearchSettings:wrap-around` property.
  
      Params:
        iter = start of search.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
  */
  bool backward(gtk.text_iter.TextIter iter, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    gboolean _hasWrappedAround;
    _retval = cast(bool)gtk_source_search_context_backward(cast(GtkSourceSearchContext*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, &_matchStart, &_matchEnd, &_hasWrappedAround);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    hasWrappedAround = cast(bool)_hasWrappedAround;
    return _retval;
  }

  /**
      The asynchronous version of [gtksource.search_context.SearchContext.backward].
      
      See the [gio.async_result.AsyncResult] documentation to know how to use this function.
      
      If the operation is cancelled, the callback will only be called if
      cancellable was not null. The method takes
      ownership of cancellable, so you can unref it after calling this function.
  
      Params:
        iter = start of search.
        cancellable = a #GCancellable, or null.
        callback = a #GAsyncReadyCallback to call when the operation is finished.
  */
  void backwardAsync(gtk.text_iter.TextIter iter, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_backward_async(cast(GtkSourceSearchContext*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a backward search started with
      [gtksource.search_context.SearchContext.backwardAsync].
      
      See the documentation of [gtksource.search_context.SearchContext.backward] for more
      details.
  
      Params:
        result = a #GAsyncResult.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
      Throws: [ErrorWrap]
  */
  bool backwardFinish(gio.async_result.AsyncResult result, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    gboolean _hasWrappedAround;
    GError *_err;
    _retval = cast(bool)gtk_source_search_context_backward_finish(cast(GtkSourceSearchContext*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_matchStart, &_matchEnd, &_hasWrappedAround, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    hasWrappedAround = cast(bool)_hasWrappedAround;
    return _retval;
  }

  /**
      Synchronous forward search.
      
      It is recommended to use the asynchronous functions instead, to not block the user interface.
      However, if you are sure that the buffer is small, this function is more convenient to use.
      
      If the `propertySearchSettings:wrap-around` property is false, this function
      doesn't try to wrap around.
      
      The has_wrapped_around out parameter is set independently of whether a match
      is found. So if this function returns false, has_wrapped_around will have
      the same value as the  `propertySearchSettings:wrap-around` property.
  
      Params:
        iter = start of search.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
  */
  bool forward(gtk.text_iter.TextIter iter, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    gboolean _hasWrappedAround;
    _retval = cast(bool)gtk_source_search_context_forward(cast(GtkSourceSearchContext*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, &_matchStart, &_matchEnd, &_hasWrappedAround);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    hasWrappedAround = cast(bool)_hasWrappedAround;
    return _retval;
  }

  /**
      The asynchronous version of [gtksource.search_context.SearchContext.forward].
      
      See the [gio.async_result.AsyncResult] documentation to know how to use this function.
      
      If the operation is cancelled, the callback will only be called if
      cancellable was not null. The method takes
      ownership of cancellable, so you can unref it after calling this function.
  
      Params:
        iter = start of search.
        cancellable = a #GCancellable, or null.
        callback = a #GAsyncReadyCallback to call when the operation is finished.
  */
  void forwardAsync(gtk.text_iter.TextIter iter, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_search_context_forward_async(cast(GtkSourceSearchContext*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a forward search started with [gtksource.search_context.SearchContext.forwardAsync].
      
      See the documentation of [gtksource.search_context.SearchContext.forward] for more
      details.
  
      Params:
        result = a #GAsyncResult.
        matchStart = return location for start of match, or null.
        matchEnd = return location for end of match, or null.
        hasWrappedAround = return location to know whether the
            search has wrapped around, or null.
      Returns: whether a match was found.
      Throws: [ErrorWrap]
  */
  bool forwardFinish(gio.async_result.AsyncResult result, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, out bool hasWrappedAround)
  {
    bool _retval;
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    gboolean _hasWrappedAround;
    GError *_err;
    _retval = cast(bool)gtk_source_search_context_forward_finish(cast(GtkSourceSearchContext*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_matchStart, &_matchEnd, &_hasWrappedAround, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    hasWrappedAround = cast(bool)_hasWrappedAround;
    return _retval;
  }

  /** */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_search_context_get_buffer(cast(GtkSourceSearchContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getHighlight()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_search_context_get_highlight(cast(GtkSourceSearchContext*)this._cPtr);
    return _retval;
  }

  /** */
  gtksource.style.Style getMatchStyle()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_search_context_get_match_style(cast(GtkSourceSearchContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of a search occurrence.
      
      If the buffer is not already fully scanned, the position may be unknown,
      and -1 is returned. If 0 is returned, it means that this part of the buffer
      has already been scanned, and that match_start and match_end don't delimit an occurrence.
  
      Params:
        matchStart = the start of the occurrence.
        matchEnd = the end of the occurrence.
      Returns: the position of the search occurrence. The first occurrence has the
        position 1 (not 0). Returns 0 if match_start and match_end don't delimit
        an occurrence. Returns -1 if the position is not yet known.
  */
  int getOccurrencePosition(gtk.text_iter.TextIter matchStart, gtk.text_iter.TextIter matchEnd)
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrence_position(cast(GtkSourceSearchContext*)this._cPtr, matchStart ? cast(const(GtkTextIter)*)matchStart._cPtr(No.Dup) : null, matchEnd ? cast(const(GtkTextIter)*)matchEnd._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the total number of search occurrences.
      
      If the buffer is not already fully scanned, the total number of occurrences is
      unknown, and -1 is returned.
      Returns: the total number of search occurrences, or -1 if unknown.
  */
  int getOccurrencesCount()
  {
    int _retval;
    _retval = gtk_source_search_context_get_occurrences_count(cast(GtkSourceSearchContext*)this._cPtr);
    return _retval;
  }

  /**
      Regular expression patterns must follow certain rules. If
      `propertySearchSettings:search-text` breaks a rule, the error can be
      retrieved with this function.
      
      The error domain is [glib.types.RegexError].
      
      Free the return value with [glib.error.ErrorWrap.free].
      Returns: the #GError, or null if the
          pattern is valid.
  */
  glib.error.ErrorWrap getRegexError()
  {
    GError* _cretval;
    _cretval = gtk_source_search_context_get_regex_error(cast(GtkSourceSearchContext*)this._cPtr);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gtksource.search_settings.SearchSettings getSettings()
  {
    GtkSourceSearchSettings* _cretval;
    _cretval = gtk_source_search_context_get_settings(cast(GtkSourceSearchContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.search_settings.SearchSettings)(cast(GtkSourceSearchSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Replaces a search match by another text. If match_start and match_end
      doesn't correspond to a search match, false is returned.
      
      match_start and match_end iters are revalidated to point to the replacement
      text boundaries.
      
      For a regular expression replacement, you can check if replace is valid by
      calling [glib.regex.Regex.checkReplacement]. The replace text can contain
      backreferences.
  
      Params:
        matchStart = the start of the match to replace.
        matchEnd = the end of the match to replace.
        replace = the replacement text.
        replaceLength = the length of replace in bytes, or -1.
      Returns: whether the match has been replaced.
      Throws: [ErrorWrap]
  */
  bool replace(gtk.text_iter.TextIter matchStart, gtk.text_iter.TextIter matchEnd, string replace, int replaceLength)
  {
    bool _retval;
    const(char)* _replace = replace.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_source_search_context_replace(cast(GtkSourceSearchContext*)this._cPtr, matchStart ? cast(GtkTextIter*)matchStart._cPtr(No.Dup) : null, matchEnd ? cast(GtkTextIter*)matchEnd._cPtr(No.Dup) : null, _replace, replaceLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Replaces all search matches by another text.
      
      It is a synchronous function, so it can block the user interface.
      
      For a regular expression replacement, you can check if replace is valid by
      calling [glib.regex.Regex.checkReplacement]. The replace text can contain
      backreferences.
  
      Params:
        replace = the replacement text.
        replaceLength = the length of replace in bytes, or -1.
      Returns: the number of replaced matches.
      Throws: [ErrorWrap]
  */
  uint replaceAll(string replace, int replaceLength)
  {
    uint _retval;
    const(char)* _replace = replace.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_source_search_context_replace_all(cast(GtkSourceSearchContext*)this._cPtr, _replace, replaceLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Enables or disables the search occurrences highlighting.
  
      Params:
        highlight = the setting.
  */
  void setHighlight(bool highlight)
  {
    gtk_source_search_context_set_highlight(cast(GtkSourceSearchContext*)this._cPtr, highlight);
  }

  /**
      Set the style to apply on search matches.
      
      If match_style is null, default theme's scheme 'match-style' will be used.
      To enable or disable the search highlighting, use [gtksource.search_context.SearchContext.setHighlight].
  
      Params:
        matchStyle = a #GtkSourceStyle, or null.
  */
  void setMatchStyle(gtksource.style.Style matchStyle = null)
  {
    gtk_source_search_context_set_match_style(cast(GtkSourceSearchContext*)this._cPtr, matchStyle ? cast(GtkSourceStyle*)matchStyle._cPtr(No.Dup) : null);
  }
}
