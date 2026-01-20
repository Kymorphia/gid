/// Module for [WebEditor] class
module webkitwebprocessextension.web_editor;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;
import webkitwebprocessextension.web_page;

/**
    Access to editing capabilities of a #WebKitWebPage.
    
    The WebKitWebEditor provides access to various editing capabilities of
    a #WebKitWebPage such as a possibility to react to the current selection in
    #WebKitWebPage.
*/
class WebEditor : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_editor_get_type != &gidSymbolNotFound ? webkit_web_editor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebEditor self()
  {
    return this;
  }

  /**
      Gets the #WebKitWebPage that is associated with the #WebKitWebEditor.
      Returns: the associated #WebKitWebPage
  */
  webkitwebprocessextension.web_page.WebPage getPage()
  {
    WebKitWebPage* _cretval;
    _cretval = webkit_web_editor_get_page(cast(WebKitWebEditor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.web_page.WebPage)(cast(WebKitWebPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `SelectionChanged` signal.
  
      This signal is emitted for every selection change inside a #WebKitWebPage
        as well as for every caret position change as the caret is a collapsed
        selection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkitwebprocessextension.web_editor.WebEditor webEditor))
  
          `webEditor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.web_editor.WebEditor)))
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
    return connectSignalClosure("selection-changed", closure, after);
  }
}
