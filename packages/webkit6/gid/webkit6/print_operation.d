/// Module for [PrintOperation] class
module gid.webkit6.print_operation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.page_setup;
import gid.gtk4.print_settings;
import gid.gtk4.window;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.web_view;

/**
    Controls a print operation.
    
    A #WebKitPrintOperation controls a print operation in WebKit. With
    a similar API to #GtkPrintOperation, it lets you set the print
    settings with [gid.webkit6.print_operation.PrintOperation.setPrintSettings] or
    display the print dialog with [gid.webkit6.print_operation.PrintOperation.runDialog].
*/
class PrintOperation : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_print_operation_get_type != &gidSymbolNotFound ? webkit_print_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitPrintOperation";
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintOperation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.print_operation.PrintOperation]
      Returns: New builder object
  */
  static PrintOperationGidBuilder builder() nothrow
  {
    return new PrintOperationGidBuilder;
  }

  /**
      Get `pageSetup` property.
      Returns: The initial #GtkPageSetup for the print operation.
  */
  @property gid.gtk4.page_setup.PageSetup pageSetup() nothrow
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The initial #GtkPageSetup for the print operation.
  */
  @property void pageSetup(gid.gtk4.page_setup.PageSetup propval) nothrow
  {
    setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The initial #GtkPrintSettings for the print operation.
  */
  @property gid.gtk4.print_settings.PrintSettings printSettings() nothrow
  {
    return getPrintSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The initial #GtkPrintSettings for the print operation.
  */
  @property void printSettings(gid.gtk4.print_settings.PrintSettings propval) nothrow
  {
    setPrintSettings(propval);
  }

  /**
      Get `webView` property.
      Returns: The #WebKitWebView that will be printed.
  */
  @property gid.webkit6.web_view.WebView webView() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.webkit6.web_view.WebView)("web-view");
  }

  /**
      Create a new #WebKitPrintOperation to print web_view contents.
  
      Params:
        webView = a #WebKitWebView
      Returns: a new #WebKitPrintOperation.
  */
  this(gid.webkit6.web_view.WebView webView) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      WebKitPrintOperation* _cretval;
      _cretval = webkit_print_operation_new(webView ? cast(WebKitWebView*)webView._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Return the current page setup of print_operation.
      
      It returns null until
      either [gid.webkit6.print_operation.PrintOperation.setPageSetup] or [gid.webkit6.print_operation.PrintOperation.runDialog]
      have been called.
      Returns: the current #GtkPageSetup of print_operation.
  */
  gid.gtk4.page_setup.PageSetup getPageSetup() nothrow
  {
    GtkPageSetup* _cretval;
    _cretval = webkit_print_operation_get_page_setup(cast(WebKitPrintOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Return the current print settings of print_operation.
      
      It returns null until
      either [gid.webkit6.print_operation.PrintOperation.setPrintSettings] or [gid.webkit6.print_operation.PrintOperation.runDialog]
      have been called.
      Returns: the current #GtkPrintSettings of print_operation.
  */
  gid.gtk4.print_settings.PrintSettings getPrintSettings() nothrow
  {
    GtkPrintSettings* _cretval;
    _cretval = webkit_print_operation_get_print_settings(cast(WebKitPrintOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Start a print operation using current print settings and page setup.
      
      Start a print operation using current print settings and page setup
      without showing the print dialog. If either print settings or page setup
      are not set with [gid.webkit6.print_operation.PrintOperation.setPrintSettings] and
      [gid.webkit6.print_operation.PrintOperation.setPageSetup], the default options will be used
      and the print job will be sent to the default printer.
      The #WebKitPrintOperation::finished signal is emitted when the printing
      operation finishes. If an error occurs while printing the signal
      #WebKitPrintOperation::failed is emitted before #WebKitPrintOperation::finished.
      
      If the app is running in a sandbox, this function only works if printing to
      a file that is in a location accessible to the sandbox, usually acquired
      through the File Chooser portal. This function will not work for physical
      printers when running in a sandbox.
  */
  void print() nothrow
  {
    webkit_print_operation_print(cast(WebKitPrintOperation*)this._cPtr);
  }

  /**
      Run the print dialog and start printing.
      
      Run the print dialog and start printing using the options selected by
      the user. This method returns when the print dialog is closed.
      If the print dialog is cancelled [gid.webkit6.types.PrintOperationResponse.Cancel]
      is returned. If the user clicks on the print button, [gid.webkit6.types.PrintOperationResponse.Print]
      is returned and the print operation starts. In this case, the #WebKitPrintOperation::finished
      signal is emitted when the operation finishes. If an error occurs while printing, the signal
      #WebKitPrintOperation::failed is emitted before #WebKitPrintOperation::finished.
      If the print dialog is not cancelled current print settings and page setup of print_operation
      are updated with options selected by the user when Print button is pressed in print dialog.
      You can get the updated print settings and page setup by calling
      [gid.webkit6.print_operation.PrintOperation.getPrintSettings] and [gid.webkit6.print_operation.PrintOperation.getPageSetup]
      after this method.
  
      Params:
        parent = transient parent of the print dialog
      Returns: the #WebKitPrintOperationResponse of the print dialog
  */
  gid.webkit6.types.PrintOperationResponse runDialog(gid.gtk4.window.Window parent = null) nothrow
  {
    WebKitPrintOperationResponse _cretval;
    _cretval = webkit_print_operation_run_dialog(cast(WebKitPrintOperation*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    gid.webkit6.types.PrintOperationResponse _retval = cast(gid.webkit6.types.PrintOperationResponse)_cretval;
    return _retval;
  }

  /**
      Set the current page setup of print_operation.
      
      Current page setup is used for the
      initial values of the print dialog when [gid.webkit6.print_operation.PrintOperation.runDialog] is called.
  
      Params:
        pageSetup = a #GtkPageSetup to set
  */
  void setPageSetup(gid.gtk4.page_setup.PageSetup pageSetup) nothrow
  {
    webkit_print_operation_set_page_setup(cast(WebKitPrintOperation*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Set the current print settings of print_operation.
      
      Set the current print settings of print_operation. Current print settings are used for
      the initial values of the print dialog when [gid.webkit6.print_operation.PrintOperation.runDialog] is called.
  
      Params:
        printSettings = a #GtkPrintSettings to set
  */
  void setPrintSettings(gid.gtk4.print_settings.PrintSettings printSettings) nothrow
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
  
          `void callback(gid.glib2.error.ErrorWrap error, gid.webkit6.print_operation.PrintOperation printOperation)`
  
          `error` the #GError that was triggered (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.glib2.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.print_operation.PrintOperation)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.print_operation.PrintOperation.failed");
      }
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
  
          `void callback(gid.webkit6.print_operation.PrintOperation printOperation)`
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.print_operation.PrintOperation)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.print_operation.PrintOperation.finished");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.print_operation.PrintOperation]
class PrintOperationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `pageSetup` property.
      Params:
        propval = The initial #GtkPageSetup for the print operation.
      Returns: Builder instance for fluent chaining
  */
  T pageSetup(gid.gtk4.page_setup.PageSetup propval) nothrow
  {
    return setProperty("page-setup", propval);
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The initial #GtkPrintSettings for the print operation.
      Returns: Builder instance for fluent chaining
  */
  T printSettings(gid.gtk4.print_settings.PrintSettings propval) nothrow
  {
    return setProperty("print-settings", propval);
  }

  /**
      Set `webView` property.
      Params:
        propval = The #WebKitWebView that will be printed.
      Returns: Builder instance for fluent chaining
  */
  T webView(gid.webkit6.web_view.WebView propval) nothrow
  {
    return setProperty("web-view", propval);
  }
}

/// Fluent builder for [gid.webkit6.print_operation.PrintOperation]
final class PrintOperationGidBuilder : PrintOperationGidBuilderImpl!PrintOperationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PrintOperation build() nothrow
  {
    return new PrintOperation(cast(void*)createGObject(PrintOperation._getGType), Yes.Take);
  }
}
