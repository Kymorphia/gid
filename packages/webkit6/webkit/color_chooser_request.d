/// Module for [ColorChooserRequest] class
module webkit.color_chooser_request;

import gdk.rectangle;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A request to open a color chooser.
    
    Whenever the user interacts with an <input type='color' />
    HTML element, WebKit will need to show a dialog to choose a color. For that
    to happen in a general way, instead of just opening a #GtkColorChooser
    (which might be not desirable in some cases, which could prefer to use their
    own color chooser dialog), WebKit will fire the
    #WebKitWebView::run-color-chooser signal with a #WebKitColorChooserRequest
    object, which will allow the client application to specify the color to be
    selected, to inspect the details of the request (e.g. to get initial color)
    and to cancel the request, in case nothing was selected.
    
    In case the client application does not wish to handle this signal,
    WebKit will provide a default handler which will asynchronously run
    a regular #GtkColorChooserDialog for the user to interact with.
*/
class ColorChooserRequest : gobject.object.ObjectWrap
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
    return cast(void function())webkit_color_chooser_request_get_type != &gidSymbolNotFound ? webkit_color_chooser_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorChooserRequest self()
  {
    return this;
  }

  /**
      Get `rgba` property.
      Returns: The #GdkRGBA color of the request
  */
  @property gdk.rgba.RGBA rgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("rgba");
  }

  /**
      Set `rgba` property.
      Params:
        propval = The #GdkRGBA color of the request
  */
  @property void rgba(gdk.rgba.RGBA propval)
  {
    return setRgba(propval);
  }

  /**
      Cancels request and the input element changes to use the initial color.
      
      Cancels request and the input element changes to use the initial color
      it has before the request started.
      The signal #WebKitColorChooserRequest::finished
      is emitted to notify that the request has finished.
  */
  void cancel()
  {
    webkit_color_chooser_request_cancel(cast(WebKitColorChooserRequest*)this._cPtr);
  }

  /**
      Finishes request and the input element keeps the current value of
      #WebKitColorChooserRequest:rgba.
      
      Finishes request and the input element keeps the current value of
      #WebKitColorChooserRequest:rgba.
      The signal #WebKitColorChooserRequest::finished
      is emitted to notify that the request has finished.
  */
  void finish()
  {
    webkit_color_chooser_request_finish(cast(WebKitColorChooserRequest*)this._cPtr);
  }

  /**
      Gets the bounding box of the color input element.
  
      Params:
        rect = a #GdkRectangle to fill in with the element area
  */
  void getElementRectangle(out gdk.rectangle.Rectangle rect)
  {
    webkit_color_chooser_request_get_element_rectangle(cast(WebKitColorChooserRequest*)this._cPtr, cast(GdkRectangle*)&rect);
  }

  /**
      Gets the current #GdkRGBA color of request
  
      Params:
        rgba = a #GdkRGBA to fill in with the current color.
  */
  void getRgba(out gdk.rgba.RGBA rgba)
  {
    webkit_color_chooser_request_get_rgba(cast(WebKitColorChooserRequest*)this._cPtr, cast(GdkRGBA*)&rgba);
  }

  /**
      Sets the current #GdkRGBA color of request
  
      Params:
        rgba = a pointer #GdkRGBA
  */
  void setRgba(gdk.rgba.RGBA rgba)
  {
    webkit_color_chooser_request_set_rgba(cast(WebKitColorChooserRequest*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }

  /**
      Connect to `Finished` signal.
  
      Emitted when the request finishes. This signal can be emitted because the
        user completed the request calling [webkit.color_chooser_request.ColorChooserRequest.finish],
        or cancelled it with [webkit.color_chooser_request.ColorChooserRequest.cancel] or because the
        color input element is removed from the DOM.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.color_chooser_request.ColorChooserRequest colorChooserRequest))
  
          `colorChooserRequest` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.color_chooser_request.ColorChooserRequest)))
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
    return connectSignalClosure("finished", closure, after);
  }
}
