/// Module for [FindController] class
module webkit.find_controller;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.web_view;

/**
    Controls text search in a #WebKitWebView.
    
    A #WebKitFindController is used to search text in a #WebKitWebView. You
    can get a #WebKitWebView<!-- -->'s #WebKitFindController with
    [webkit.web_view.WebView.getFindController], and later use it to search
    for text using [webkit.find_controller.FindController.search], or get the
    number of matches using [webkit.find_controller.FindController.countMatches]. The
    operations are asynchronous and trigger signals when ready, such as
    #WebKitFindController::found-text,
    #WebKitFindController::failed-to-find-text or
    #WebKitFindController::counted-matches<!-- -->.
*/
class FindController : gobject.object.ObjectWrap
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
    return cast(void function())webkit_find_controller_get_type != &gidSymbolNotFound ? webkit_find_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FindController self()
  {
    return this;
  }

  /**
      Get `maxMatchCount` property.
      Returns: The maximum number of matches to report for a given search.
  */
  @property uint maxMatchCount()
  {
    return getMaxMatchCount();
  }

  /**
      Get `options` property.
      Returns: The options to be used in the search operation.
  */
  @property webkit.types.FindOptions options()
  {
    return gobject.object.ObjectWrap.getProperty!(webkit.types.FindOptions)("options");
  }

  /**
      Get `text` property.
      Returns: The current search text for this #WebKitFindController.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Counts the number of matches for search_text.
      
      Counts the number of matches for search_text found in the
      #WebKitWebView with the provided find_options. The number of
      matches will be provided by the
      #WebKitFindController::counted-matches signal.
  
      Params:
        searchText = the text to look for
        findOptions = a bitmask with the #WebKitFindOptions used in the search
        maxMatchCount = the maximum number of matches allowed in the search
  */
  void countMatches(string searchText, uint findOptions, uint maxMatchCount)
  {
    const(char)* _searchText = searchText.toCString(No.Alloc);
    webkit_find_controller_count_matches(cast(WebKitFindController*)this._cPtr, _searchText, findOptions, maxMatchCount);
  }

  /**
      Gets the maximum number of matches to report.
      
      Gets the maximum number of matches to report during a text
      lookup. This number is passed as the last argument of
      [webkit.find_controller.FindController.search] or
      [webkit.find_controller.FindController.countMatches].
      Returns: the maximum number of matches to report.
  */
  uint getMaxMatchCount()
  {
    uint _retval;
    _retval = webkit_find_controller_get_max_match_count(cast(WebKitFindController*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitFindOptions for the current search.
      
      Gets a bitmask containing the #WebKitFindOptions associated with
      the current search.
      Returns: a bitmask containing the #WebKitFindOptions associated
        with the current search.
  */
  uint getOptions()
  {
    uint _retval;
    _retval = webkit_find_controller_get_options(cast(WebKitFindController*)this._cPtr);
    return _retval;
  }

  /**
      Gets the text that find_controller is searching for.
      
      Gets the text that find_controller is currently searching
      for. This text is passed to either
      [webkit.find_controller.FindController.search] or
      [webkit.find_controller.FindController.countMatches].
      Returns: the text to look for in the #WebKitWebView.
  */
  string getSearchText()
  {
    const(char)* _cretval;
    _cretval = webkit_find_controller_get_search_text(cast(WebKitFindController*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitWebView this find controller is associated to.
      
      Do
      not dereference the returned instance as it belongs to the
      #WebKitFindController.
      Returns: the #WebKitWebView.
  */
  webkit.web_view.WebView getWebView()
  {
    WebKitWebView* _cretval;
    _cretval = webkit_find_controller_get_web_view(cast(WebKitFindController*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_view.WebView)(cast(WebKitWebView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Looks for search_text associated with find_controller.
      
      Looks for search_text in the #WebKitWebView associated with
      find_controller since the beginning of the document highlighting
      up to max_match_count matches. The outcome of the search will be
      asynchronously provided by the #WebKitFindController::found-text
      and #WebKitFindController::failed-to-find-text signals.
      
      To look for the next or previous occurrences of the same text
      with the same find options use [webkit.find_controller.FindController.searchNext]
      and/or [webkit.find_controller.FindController.searchPrevious]. The
      #WebKitFindController will use the same text and options for the
      following searches unless they are modified by another call to this
      method.
      
      Note that if the number of matches is higher than max_match_count
      then #WebKitFindController::found-text will report `G_MAXUINT` matches
      instead of the actual number.
      
      Callers should call [webkit.find_controller.FindController.searchFinish] to
      finish the current search operation.
  
      Params:
        searchText = the text to look for
        findOptions = a bitmask with the #WebKitFindOptions used in the search
        maxMatchCount = the maximum number of matches allowed in the search
  */
  void search(string searchText, uint findOptions, uint maxMatchCount)
  {
    const(char)* _searchText = searchText.toCString(No.Alloc);
    webkit_find_controller_search(cast(WebKitFindController*)this._cPtr, _searchText, findOptions, maxMatchCount);
  }

  /**
      Finishes a find operation.
      
      Finishes a find operation started by
      [webkit.find_controller.FindController.search]. It will basically unhighlight
      every text match found.
      
      This method will be typically called when the search UI is
      closed/hidden by the client application.
  */
  void searchFinish()
  {
    webkit_find_controller_search_finish(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Looks for the next occurrence of the search text.
      
      Calling this method before [webkit.find_controller.FindController.search] or
      [webkit.find_controller.FindController.countMatches] is a programming error.
  */
  void searchNext()
  {
    webkit_find_controller_search_next(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Looks for the previous occurrence of the search text.
      
      Calling this method before [webkit.find_controller.FindController.search] or
      [webkit.find_controller.FindController.countMatches] is a programming error.
  */
  void searchPrevious()
  {
    webkit_find_controller_search_previous(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Connect to `CountedMatches` signal.
  
      This signal is emitted when the #WebKitFindController has
        counted the number of matches for a given text after a call
        to [webkit.find_controller.FindController.countMatches].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint matchCount, webkit.find_controller.FindController findController))
  
          `matchCount` the number of matches of the search text (optional)
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCountedMatches(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.find_controller.FindController)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("counted-matches", closure, after);
  }

  /**
      Connect to `FailedToFindText` signal.
  
      This signal is emitted when a search operation does not find
        any result for the given text. It will be issued if the text
        is not found asynchronously after a call to
        [webkit.find_controller.FindController.search], [webkit.find_controller.FindController.searchNext]
        or [webkit.find_controller.FindController.searchPrevious].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.find_controller.FindController findController))
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFailedToFindText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.find_controller.FindController)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed-to-find-text", closure, after);
  }

  /**
      Connect to `FoundText` signal.
  
      This signal is emitted when a given text is found in the web
        page text. It will be issued if the text is found
        asynchronously after a call to [webkit.find_controller.FindController.search],
        [webkit.find_controller.FindController.searchNext] or
        [webkit.find_controller.FindController.searchPrevious].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint matchCount, webkit.find_controller.FindController findController))
  
          `matchCount` the number of matches found of the search text (optional)
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFoundText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.find_controller.FindController)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("found-text", closure, after);
  }
}
