/// Module for [FindController] class
module gid.webkit6.find_controller;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.web_view;

/**
    Controls text search in a #WebKitWebView.
    
    A #WebKitFindController is used to search text in a #WebKitWebView. You
    can get a #WebKitWebView<!-- -->'s #WebKitFindController with
    [gid.webkit6.web_view.WebView.getFindController], and later use it to search
    for text using [gid.webkit6.find_controller.FindController.search], or get the
    number of matches using [gid.webkit6.find_controller.FindController.countMatches]. The
    operations are asynchronous and trigger signals when ready, such as
    #WebKitFindController::found-text,
    #WebKitFindController::failed-to-find-text or
    #WebKitFindController::counted-matches<!-- -->.
*/
class FindController : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_find_controller_get_type != &gidSymbolNotFound ? webkit_find_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitFindController";
  }

  /** Returns `this`, for use in `with` statements. */
  override FindController self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.find_controller.FindController]
      Returns: New builder object
  */
  static FindControllerGidBuilder builder() nothrow
  {
    return new FindControllerGidBuilder;
  }

  /**
      Get `maxMatchCount` property.
      Returns: The maximum number of matches to report for a given search.
  */
  @property uint maxMatchCount() nothrow
  {
    return getMaxMatchCount();
  }

  /**
      Get `options` property.
      Returns: The options to be used in the search operation.
  */
  @property gid.webkit6.types.FindOptions options() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.webkit6.types.FindOptions)("options");
  }

  /**
      Get `text` property.
      Returns: The current search text for this #WebKitFindController.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Get `webView` property.
      Returns: The #WebKitWebView this controller is associated to.
  */
  @property gid.webkit6.web_view.WebView webView() nothrow
  {
    return getWebView();
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
  void countMatches(string searchText, uint findOptions, uint maxMatchCount) nothrow
  {
    const(char)* _searchText = searchText.toCString!(No.Malloc, No.Nullable);
    webkit_find_controller_count_matches(cast(WebKitFindController*)this._cPtr, _searchText, findOptions, maxMatchCount);
  }

  /**
      Gets the maximum number of matches to report.
      
      Gets the maximum number of matches to report during a text
      lookup. This number is passed as the last argument of
      [gid.webkit6.find_controller.FindController.search] or
      [gid.webkit6.find_controller.FindController.countMatches].
      Returns: the maximum number of matches to report.
  */
  uint getMaxMatchCount() nothrow
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
  uint getOptions() nothrow
  {
    uint _retval;
    _retval = webkit_find_controller_get_options(cast(WebKitFindController*)this._cPtr);
    return _retval;
  }

  /**
      Gets the text that find_controller is searching for.
      
      Gets the text that find_controller is currently searching
      for. This text is passed to either
      [gid.webkit6.find_controller.FindController.search] or
      [gid.webkit6.find_controller.FindController.countMatches].
      Returns: the text to look for in the #WebKitWebView.
  */
  string getSearchText() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_find_controller_get_search_text(cast(WebKitFindController*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitWebView this find controller is associated to.
      
      Do
      not dereference the returned instance as it belongs to the
      #WebKitFindController.
      Returns: the #WebKitWebView.
  */
  gid.webkit6.web_view.WebView getWebView() nothrow
  {
    WebKitWebView* _cretval;
    _cretval = webkit_find_controller_get_web_view(cast(WebKitFindController*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.web_view.WebView)(cast(WebKitWebView*)_cretval, No.Take);
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
      with the same find options use [gid.webkit6.find_controller.FindController.searchNext]
      and/or [gid.webkit6.find_controller.FindController.searchPrevious]. The
      #WebKitFindController will use the same text and options for the
      following searches unless they are modified by another call to this
      method.
      
      Note that if the number of matches is higher than max_match_count
      then #WebKitFindController::found-text will report `G_MAXUINT` matches
      instead of the actual number.
      
      Callers should call [gid.webkit6.find_controller.FindController.searchFinish] to
      finish the current search operation.
  
      Params:
        searchText = the text to look for
        findOptions = a bitmask with the #WebKitFindOptions used in the search
        maxMatchCount = the maximum number of matches allowed in the search
  */
  void search(string searchText, uint findOptions, uint maxMatchCount) nothrow
  {
    const(char)* _searchText = searchText.toCString!(No.Malloc, No.Nullable);
    webkit_find_controller_search(cast(WebKitFindController*)this._cPtr, _searchText, findOptions, maxMatchCount);
  }

  /**
      Finishes a find operation.
      
      Finishes a find operation started by
      [gid.webkit6.find_controller.FindController.search]. It will basically unhighlight
      every text match found.
      
      This method will be typically called when the search UI is
      closed/hidden by the client application.
  */
  void searchFinish() nothrow
  {
    webkit_find_controller_search_finish(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Looks for the next occurrence of the search text.
      
      Calling this method before [gid.webkit6.find_controller.FindController.search] or
      [gid.webkit6.find_controller.FindController.countMatches] is a programming error.
  */
  void searchNext() nothrow
  {
    webkit_find_controller_search_next(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Looks for the previous occurrence of the search text.
      
      Calling this method before [gid.webkit6.find_controller.FindController.search] or
      [gid.webkit6.find_controller.FindController.countMatches] is a programming error.
  */
  void searchPrevious() nothrow
  {
    webkit_find_controller_search_previous(cast(WebKitFindController*)this._cPtr);
  }

  /**
      Connect to `CountedMatches` signal.
  
      This signal is emitted when the #WebKitFindController has
        counted the number of matches for a given text after a call
        to [gid.webkit6.find_controller.FindController.countMatches].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint matchCount, gid.webkit6.find_controller.FindController findController)`
  
          `matchCount` the number of matches of the search text (optional)
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCountedMatches(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.find_controller.FindController)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.find_controller.FindController.countedMatches");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("counted-matches", closure, after);
  }

  /**
      Connect to `FailedToFindText` signal.
  
      This signal is emitted when a search operation does not find
        any result for the given text. It will be issued if the text
        is not found asynchronously after a call to
        [gid.webkit6.find_controller.FindController.search], [gid.webkit6.find_controller.FindController.searchNext]
        or [gid.webkit6.find_controller.FindController.searchPrevious].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.find_controller.FindController findController)`
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFailedToFindText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.find_controller.FindController)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.find_controller.FindController.failedToFindText");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed-to-find-text", closure, after);
  }

  /**
      Connect to `FoundText` signal.
  
      This signal is emitted when a given text is found in the web
        page text. It will be issued if the text is found
        asynchronously after a call to [gid.webkit6.find_controller.FindController.search],
        [gid.webkit6.find_controller.FindController.searchNext] or
        [gid.webkit6.find_controller.FindController.searchPrevious].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint matchCount, gid.webkit6.find_controller.FindController findController)`
  
          `matchCount` the number of matches found of the search text (optional)
  
          `findController` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFoundText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.find_controller.FindController)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.find_controller.FindController.foundText");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("found-text", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.find_controller.FindController]
class FindControllerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `webView` property.
      Params:
        propval = The #WebKitWebView this controller is associated to.
      Returns: Builder instance for fluent chaining
  */
  T webView(gid.webkit6.web_view.WebView propval) nothrow
  {
    return setProperty("web-view", propval);
  }
}

/// Fluent builder for [gid.webkit6.find_controller.FindController]
final class FindControllerGidBuilder : FindControllerGidBuilderImpl!FindControllerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FindController build() nothrow
  {
    return new FindController(cast(void*)createGObject(FindController._getGType), Yes.Take);
  }
}
