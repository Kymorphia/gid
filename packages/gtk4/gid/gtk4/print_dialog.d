/// Module for [PrintDialog] class
module gid.gtk4.print_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.page_setup;
import gid.gtk4.print_settings;
import gid.gtk4.print_setup;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Asynchronous API to present a print dialog to the user.
    
    [gid.gtk4.print_dialog.PrintDialog] collects the arguments that are needed to present
     the dialog, such as a title for the dialog and whether it should
     be modal.
    
    The dialog is shown with the [gid.gtk4.print_dialog.PrintDialog.setup] function.
    
    The actual printing can be done with [gid.gtk4.print_dialog.PrintDialog.print] or
    [gid.gtk4.print_dialog.PrintDialog.printFile]. These APIs follows the GIO async pattern,
    and the results can be obtained by calling the corresponding finish methods.
*/
@gidGir("PrintDialog", "PrintDialogClass")
class PrintDialog : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_print_dialog_get_type != &gidSymbolNotFound ? gtk_print_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPrintDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.print_dialog.PrintDialog]
      Returns: New builder object
  */
  static PrintDialogGidBuilder builder() nothrow
  {
    return new PrintDialogGidBuilder;
  }

  /**
      Get `acceptLabel` property.
      Returns: A label that may be shown on the accept button of a print dialog
        that is presented by [gid.gtk4.print_dialog.PrintDialog.setup].
  */
  @property string acceptLabel() nothrow
  {
    return getAcceptLabel();
  }

  /**
      Set `acceptLabel` property.
      Params:
        propval = A label that may be shown on the accept button of a print dialog
          that is presented by [gid.gtk4.print_dialog.PrintDialog.setup].
  */
  @property void acceptLabel(string propval) nothrow
  {
    setAcceptLabel(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the print dialog is modal.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the print dialog is modal.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `pageSetup` property.
      Returns: The page setup to use.
  */
  @property gid.gtk4.page_setup.PageSetup pageSetup() nothrow
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The page setup to use.
  */
  @property void pageSetup(gid.gtk4.page_setup.PageSetup propval) nothrow
  {
    setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The print settings to use.
  */
  @property gid.gtk4.print_settings.PrintSettings printSettings() nothrow
  {
    return getPrintSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The print settings to use.
  */
  @property void printSettings(gid.gtk4.print_settings.PrintSettings propval) nothrow
  {
    setPrintSettings(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the print dialog that is
        presented by [gid.gtk4.print_dialog.PrintDialog.setup].
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the print dialog that is
          presented by [gid.gtk4.print_dialog.PrintDialog.setup].
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [gid.gtk4.print_dialog.PrintDialog] object.
      Returns: the new [gid.gtk4.print_dialog.PrintDialog]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkPrintDialog* _cretval;
      _cretval = gtk_print_dialog_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the label that will be shown on the
      accept button of the print dialog.
      Returns: the accept label
  */
  string getAcceptLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_print_dialog_get_accept_label(cast(GtkPrintDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the print dialog blocks
      interaction with the parent window while
      it is presented.
      Returns: whether the print dialog is modal
  */
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_print_dialog_get_modal(cast(GtkPrintDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the page setup.
      Returns: the page setup
  */
  gid.gtk4.page_setup.PageSetup getPageSetup() nothrow
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_dialog_get_page_setup(cast(GtkPrintDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the print settings for the print dialog.
      Returns: the settings
  */
  gid.gtk4.print_settings.PrintSettings getPrintSettings() nothrow
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_dialog_get_print_settings(cast(GtkPrintDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
      print dialog.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_print_dialog_get_title(cast(GtkPrintDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      This function prints content from a stream.
      
      If you pass `NULL` as setup, then this method will present a print dialog.
      Otherwise, it will attempt to print directly, without user interaction.
      
      The callback will be called when the printing is done.
  
      Params:
        parent = the parent [gid.gtk4.window.Window]
        setup = the [gid.gtk4.print_setup.PrintSetup] to use
        cancellable = a [gid.gio2.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void print(gid.gtk4.window.Window parent = null, gid.gtk4.print_setup.PrintSetup setup = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_print(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, setup ? cast(GtkPrintSetup*)setup._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      This function prints a file.
      
      If you pass `NULL` as setup, then this method will present a print dialog.
      Otherwise, it will attempt to print directly, without user interaction.
  
      Params:
        parent = the parent [gid.gtk4.window.Window]
        setup = the [gid.gtk4.print_setup.PrintSetup] to use
        file = the [gid.gio2.file.File] to print
        cancellable = a [gid.gio2.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void printFile(gid.gtk4.window.Window parent, gid.gtk4.print_setup.PrintSetup setup, gid.gio2.file.File file, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_print_file(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, setup ? cast(GtkPrintSetup*)setup._cPtr(No.Dup) : null, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.print_dialog.PrintDialog.printFile] call and
      returns the results.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: Whether the call was successful
      Throws: [ErrorWrap]
  */
  bool printFileFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_print_dialog_print_file_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Finishes the [gid.gtk4.print_dialog.PrintDialog.print] call and
      returns the results.
      
      If the call was successful, the content to be printed should be
      written to the returned output stream. Otherwise, `NULL` is returned.
      
      The overall results of the print operation will be returned in the
      [gid.gio2.output_stream.OutputStream.close] call, so if you are interested in the
      results, you need to explicitly close the output stream (it will be
      closed automatically if you just unref it). Be aware that the close
      call may not be instant as it operation will for the printer to finish
      printing.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: a [gid.gio2.output_stream.OutputStream]
      Throws: [ErrorWrap]
  */
  gid.gio2.output_stream.OutputStream printFinish(gid.gio2.async_result.AsyncResult result)
  {
    GOutputStream* _cretval;
    GError *_err;
    _cretval = gtk_print_dialog_print_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.output_stream.OutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the label that will be shown on the
      accept button of the print dialog shown for
      [gid.gtk4.print_dialog.PrintDialog.setup].
  
      Params:
        acceptLabel = the new accept label
  */
  void setAcceptLabel(string acceptLabel) nothrow
  {
    const(char)* _acceptLabel = acceptLabel.toCString!(No.Malloc, No.Nullable);
    gtk_print_dialog_set_accept_label(cast(GtkPrintDialog*)this._cPtr, _acceptLabel);
  }

  /**
      Sets whether the print dialog blocks
      interaction with the parent window while
      it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal) nothrow
  {
    gtk_print_dialog_set_modal(cast(GtkPrintDialog*)this._cPtr, modal);
  }

  /**
      Set the page setup for the print dialog.
  
      Params:
        pageSetup = the new page setup
  */
  void setPageSetup(gid.gtk4.page_setup.PageSetup pageSetup) nothrow
  {
    gtk_print_dialog_set_page_setup(cast(GtkPrintDialog*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets the print settings for the print dialog.
  
      Params:
        printSettings = the new print settings
  */
  void setPrintSettings(gid.gtk4.print_settings.PrintSettings printSettings) nothrow
  {
    gtk_print_dialog_set_print_settings(cast(GtkPrintDialog*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }

  /**
      Sets the title that will be shown on the print dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_print_dialog_set_title(cast(GtkPrintDialog*)this._cPtr, _title);
  }

  /**
      This function presents a print dialog to let the user select a printer,
      and set up print settings and page setup.
      
      The callback will be called when the dialog is dismissed.
      The obtained [gid.gtk4.print_setup.PrintSetup] can then be passed
      to [gid.gtk4.print_dialog.PrintDialog.print] or [gid.gtk4.print_dialog.PrintDialog.printFile].
      
      One possible use for this method is to have the user select a printer,
      then show a page setup UI in the application (e.g. to arrange images
      on a page), then call [gid.gtk4.print_dialog.PrintDialog.print] on self
      to do the printing without further user interaction.
  
      Params:
        parent = the parent [gid.gtk4.window.Window]
        cancellable = a [gid.gio2.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void setup(gid.gtk4.window.Window parent = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_setup(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.print_dialog.PrintDialog.setup] call.
      
      If the call was successful, it returns a [gid.gtk4.print_setup.PrintSetup]
      which contains the print settings and page setup information that
      will be used to print.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: the resulting `[gid.gtk4.print_setup.PrintSetup]`
      Throws: [ErrorWrap]
  */
  gid.gtk4.print_setup.PrintSetup setupFinish(gid.gio2.async_result.AsyncResult result)
  {
    GtkPrintSetup* _cretval;
    GError *_err;
    _cretval = gtk_print_dialog_setup_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gtk4.print_setup.PrintSetup(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.print_dialog.PrintDialog]
class PrintDialogGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `acceptLabel` property.
      Params:
        propval = A label that may be shown on the accept button of a print dialog
          that is presented by [gid.gtk4.print_dialog.PrintDialog.setup].
      Returns: Builder instance for fluent chaining
  */
  T acceptLabel(string propval) nothrow
  {
    return setProperty("accept-label", propval);
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the print dialog is modal.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The page setup to use.
      Returns: Builder instance for fluent chaining
  */
  T pageSetup(gid.gtk4.page_setup.PageSetup propval) nothrow
  {
    return setProperty("page-setup", propval);
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The print settings to use.
      Returns: Builder instance for fluent chaining
  */
  T printSettings(gid.gtk4.print_settings.PrintSettings propval) nothrow
  {
    return setProperty("print-settings", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the print dialog that is
          presented by [gid.gtk4.print_dialog.PrintDialog.setup].
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.gtk4.print_dialog.PrintDialog]
final class PrintDialogGidBuilder : PrintDialogGidBuilderImpl!PrintDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PrintDialog build() nothrow
  {
    return new PrintDialog(cast(void*)createGObject(PrintDialog._getGType), Yes.Take);
  }
}
