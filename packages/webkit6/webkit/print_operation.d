/// Module for [PrintOperation] class
module webkit.print_operation;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.page_setup;
import gtk.print_settings;
import gtk.window;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.web_view;

/**
    Controls a print operation.
    
    A #WebKitPrintOperation controls a print operation in WebKit. With
    a similar API to #GtkPrintOperation, it lets you set the print
    settings with [webkit.print_operation.PrintOperation.setPrintSettings] or
    display the print dialog with [webkit.print_operation.PrintOperation.runDialog].
*/
class PrintOperation : gobject.object.ObjectWrap
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
    return cast(void function())webkit_print_operation_get_type != &gidSymbolNotFound ? webkit_print_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintOperation self()
  {
    return this;
  }

  /**
      Get `pageSetup` property.
      Returns: The initial #GtkPageSetup for the print operation.
  */
  @property gtk.page_setup.PageSetup pageSetup()
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The initial #GtkPageSetup for the print operation.
  */
  @property void pageSetup(gtk.page_setup.PageSetup propval)
  {
    return setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The initial #GtkPrintSettings for the print operation.
  */
  @property gtk.print_settings.PrintSettings printSettings()
  {
    return getPrintSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The initial #GtkPrintSettings for the print operation.
  */
  @property void printSettings(gtk.print_settings.PrintSettings propval)
  {
    return setPrintSettings(propval);
  }

  /**
      Create a new #WebKitPrintOperation to print web_view contents.
  
      Params:
        webView = a #WebKitWebView
      Returns: a new #WebKitPrintOperation.
  */
  this(webkit.web_view.WebView webView)
  {
    WebKitPrintOperation* _cretval;
    _cretval = webkit_print_operation_new(webView ? cast(WebKitWebView*)webView._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Return the current page setup of print_operation.
      
      It returns null until
      either [webkit.print_operation.PrintOperation.setPageSetup] or [webkit.print_operation.PrintOperation.runDialog]
      have been called.
      Returns: the current #GtkPageSetup of print_operation.
  */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = webkit_print_operation_get_page_setup(cast(WebKitPrintOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Return the current print settings of print_operation.
      
      It returns null until
      either [webkit.print_operation.PrintOperation.setPrintSettings] or [webkit.print_operation.PrintOperation.runDialog]
      have been called.
      Returns: the current #GtkPrintSettings of print_operation.
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = webkit_print_operation_get_print_settings(cast(WebKitPrintOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Start a print operation using current print settings and page setup.
      
      Start a print operation using current print settings and page setup
      without showing the print dialog. If either print settings or page setup
      are not set with [webkit.print_operation.PrintOperation.setPrintSettings] and
      [webkit.print_operation.PrintOperation.setPageSetup], the default options will be used
      and the print job will be sent to the default printer.
      The #WebKitPrintOperation::finished signal is emitted when the printing
      operation finishes. If an error occurs while printing the signal
      #WebKitPrintOperation::failed is emitted before #WebKitPrintOperation::finished.
      
      If the app is running in a sandbox, this function only works if printing to
      a file that is in a location accessible to the sandbox, usually acquired
      through the File Chooser portal. This function will not work for physical
      printers when running in a sandbox.
  */
  void print()
  {
    webkit_print_operation_print(cast(WebKitPrintOperation*)this._cPtr);
  }

  /**
      Run the print dialog and start printing.
      
      Run the print dialog and start printing using the options selected by
      the user. This method returns when the print dialog is closed.
      If the print dialog is cancelled [webkit.types.PrintOperationResponse.Cancel]
      is returned. If the user clicks on the print button, [webkit.types.PrintOperationResponse.Print]
      is returned and the print operation starts. In this case, the #WebKitPrintOperation::finished
      signal is emitted when the operation finishes. If an error occurs while printing, the signal
      #WebKitPrintOperation::failed is emitted before #WebKitPrintOperation::finished.
      If the print dialog is not cancelled current print settings and page setup of print_operation
      are updated with options selected by the user when Print button is pressed in print dialog.
      You can get the updated print settings and page setup by calling
      [webkit.print_operation.PrintOperation.getPrintSettings] and [webkit.print_operation.PrintOperation.getPageSetup]
      after this method.
  
      Params:
        parent = transient parent of the print dialog
      Returns: the #WebKitPrintOperationResponse of the print dialog
  */
  webkit.types.PrintOperationResponse runDialog(gtk.window.Window parent = null)
  {
    WebKitPrintOperationResponse _cretval;
    _cretval = webkit_print_operation_run_dialog(cast(WebKitPrintOperation*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    webkit.types.PrintOperationResponse _retval = cast(webkit.types.PrintOperationResponse)_cretval;
    return _retval;
  }

  /**
      Set the current page setup of print_operation.
      
      Current page setup is used for the
      initial values of the print dialog when [webkit.print_operation.PrintOperation.runDialog] is called.
  
      Params:
        pageSetup = a #GtkPageSetup to set
  */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup)
  {
    webkit_print_operation_set_page_setup(cast(WebKitPrintOperation*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Set the current print settings of print_operation.
      
      Set the current print settings of print_operation. Current print settings are used for
      the initial values of the print dialog when [webkit.print_operation.PrintOperation.runDialog] is called.
  
      Params:
        printSettings = a #GtkPrintSettings to set
  */
  void setPrintSettings(gtk.print_settings.PrintSettings printSettings)
  {
    webkit_print_operation_set_print_settings(cast(WebKitPrintOperation*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Failed` signal.
  
      Emitted when an error occurs while printing. The given error, of the domain
        `WEBKIT_PRINT_ERROR`, contains further details of the failure.
        The #WebKitPrintOperation::finished signal is emitted after this one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.error.ErrorWrap error, webkit.print_operation.PrintOperation printOperation))
  
          `error` the #GError that was triggered (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.print_operation.PrintOperation)))
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
    return connectSignalClosure("failed", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      Emitted when the print operation has finished doing everything
        required for printing.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.print_operation.PrintOperation printOperation))
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.print_operation.PrintOperation)))
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
