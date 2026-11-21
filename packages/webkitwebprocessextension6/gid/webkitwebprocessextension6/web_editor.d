/// Module for [WebEditor] class
module gid.webkitwebprocessextension6.web_editor;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.types;
import gid.webkitwebprocessextension6.web_page;

/**
    Access to editing capabilities of a #WebKitWebPage.
    
    The WebKitWebEditor provides access to various editing capabilities of
    a #WebKitWebPage such as a possibility to react to the current selection in
    #WebKitWebPage.
*/
class WebEditor : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_web_editor_get_type != &gidSymbolNotFound ? webkit_web_editor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebEditor";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebEditor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkitwebprocessextension6.web_editor.WebEditor]
      Returns: New builder object
  */
  static WebEditorGidBuilder builder() nothrow
  {
    return new WebEditorGidBuilder;
  }

  /**
      Gets the #WebKitWebPage that is associated with the #WebKitWebEditor.
      Returns: the associated #WebKitWebPage
  */
  gid.webkitwebprocessextension6.web_page.WebPage getPage() nothrow
  {
    WebKitWebPage* _cretval;
    _cretval = webkit_web_editor_get_page(cast(WebKitWebEditor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkitwebprocessextension6.web_page.WebPage)(cast(WebKitWebPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `SelectionChanged` signal.
  
      This signal is emitted for every selection change inside a #WebKitWebPage
        as well as for every caret position change as the caret is a collapsed
        selection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkitwebprocessextension6.web_editor.WebEditor webEditor)`
  
          `webEditor` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkitwebprocessextension6.web_editor.WebEditor)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_editor.WebEditor.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkitwebprocessextension6.web_editor.WebEditor]
class WebEditorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkitwebprocessextension6.web_editor.WebEditor]
final class WebEditorGidBuilder : WebEditorGidBuilderImpl!WebEditorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebEditor build() nothrow
  {
    return new WebEditor(cast(void*)createGObject(WebEditor._getGType), Yes.Take);
  }
}
