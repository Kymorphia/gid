/// Module for [PrintDialog] class
module gtk.print_dialog;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.output_stream;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_settings;
import gtk.print_setup;
import gtk.types;
import gtk.window;

/**
    A [gtk.print_dialog.PrintDialog] object collects the arguments that
    are needed to present a print dialog to the user, such
    as a title for the dialog and whether it should be modal.
    
    The dialog is shown with the [gtk.print_dialog.PrintDialog.setup] function.
    The actual printing can be done with [gtk.print_dialog.PrintDialog.print] or
    [gtk.print_dialog.PrintDialog.printFile]. These APIs follows the GIO async pattern,
    and the results can be obtained by calling the corresponding finish methods.
*/
class PrintDialog : gobject.object.ObjectWrap
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
    return cast(void function())gtk_print_dialog_get_type != &gidSymbolNotFound ? gtk_print_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintDialog self()
  {
    return this;
  }

  /**
      Get `acceptLabel` property.
      Returns: A label that may be shown on the accept button of a print dialog
      that is presented by [gtk.print_dialog.PrintDialog.setup].
  */
  @property string acceptLabel()
  {
    return getAcceptLabel();
  }

  /**
      Set `acceptLabel` property.
      Params:
        propval = A label that may be shown on the accept button of a print dialog
        that is presented by [gtk.print_dialog.PrintDialog.setup].
  */
  @property void acceptLabel(string propval)
  {
    return setAcceptLabel(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the print dialog is modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the print dialog is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `pageSetup` property.
      Returns: The page setup to use.
  */
  @property gtk.page_setup.PageSetup pageSetup()
  {
    return getPageSetup();
  }

  /**
      Set `pageSetup` property.
      Params:
        propval = The page setup to use.
  */
  @property void pageSetup(gtk.page_setup.PageSetup propval)
  {
    return setPageSetup(propval);
  }

  /**
      Get `printSettings` property.
      Returns: The print settings to use.
  */
  @property gtk.print_settings.PrintSettings printSettings()
  {
    return getPrintSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The print settings to use.
  */
  @property void printSettings(gtk.print_settings.PrintSettings propval)
  {
    return setPrintSettings(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the print dialog that is
      presented by [gtk.print_dialog.PrintDialog.setup].
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the print dialog that is
        presented by [gtk.print_dialog.PrintDialog.setup].
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new [gtk.print_dialog.PrintDialog] object.
      Returns: the new [gtk.print_dialog.PrintDialog]
  */
  this()
  {
    GtkPrintDialog* _cretval;
    _cretval = gtk_print_dialog_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the label that will be shown on the
      accept button of the print dialog.
      Returns: the accept label
  */
  string getAcceptLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_print_dialog_get_accept_label(cast(GtkPrintDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the print dialog blocks
      interaction with the parent window while
      it is presented.
      Returns: whether the print dialog is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_dialog_get_modal(cast(GtkPrintDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the page setup.
      Returns: the page setup
  */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_dialog_get_page_setup(cast(GtkPrintDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the print settings for the print dialog.
      Returns: the settings
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_dialog_get_print_settings(cast(GtkPrintDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
      print dialog.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_print_dialog_get_title(cast(GtkPrintDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function prints content from a stream.
      
      If you pass `NULL` as setup, then this method will present a print dialog.
      Otherwise, it will attempt to print directly, without user interaction.
      
      The callback will be called when the printing is done. It should call
      [gtk.print_dialog.PrintDialog.printFinish] to obtain the results.
  
      Params:
        parent = the parent [gtk.window.Window]
        setup = the [gtk.print_setup.PrintSetup] to use
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void print(gtk.window.Window parent = null, gtk.print_setup.PrintSetup setup = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_print(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, setup ? cast(GtkPrintSetup*)setup._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      This function prints a file.
      
      If you pass `NULL` as setup, then this method will present a print dialog.
      Otherwise, it will attempt to print directly, without user interaction.
      
      The callback will be called when the printing is done. It should call
      [gtk.print_dialog.PrintDialog.printFileFinish] to obtain the results.
  
      Params:
        parent = the parent [gtk.window.Window]
        setup = the [gtk.print_setup.PrintSetup] to use
        file = the [gio.file.File] to print
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void printFile(gtk.window.Window parent, gtk.print_setup.PrintSetup setup, gio.file.File file, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_print_file(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, setup ? cast(GtkPrintSetup*)setup._cPtr(No.Dup) : null, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.print_dialog.PrintDialog.printFile] call and
      returns the results.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: Whether the call was successful
      Throws: [ErrorWrap]
  */
  bool printFileFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_print_dialog_print_file_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Finishes the [gtk.print_dialog.PrintDialog.print] call and
      returns the results.
      
      If the call was successful, the content to be printed should be
      written to the returned output stream. Otherwise, `NULL` is returned.
      
      The overall results of the print operation will be returned in the
      [gio.output_stream.OutputStream.close] call, so if you are interested in the
      results, you need to explicitly close the output stream (it will be
      closed automatically if you just unref it). Be aware that the close
      call may not be instant as it operation will for the printer to finish
      printing.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: a [gio.output_stream.OutputStream]
      Throws: [ErrorWrap]
  */
  gio.output_stream.OutputStream printFinish(gio.async_result.AsyncResult result)
  {
    GOutputStream* _cretval;
    GError *_err;
    _cretval = gtk_print_dialog_print_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.output_stream.OutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the label that will be shown on the
      accept button of the print dialog shown for
      [gtk.print_dialog.PrintDialog.setup].
  
      Params:
        acceptLabel = the new accept label
  */
  void setAcceptLabel(string acceptLabel)
  {
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    gtk_print_dialog_set_accept_label(cast(GtkPrintDialog*)this._cPtr, _acceptLabel);
  }

  /**
      Sets whether the print dialog blocks
      interaction with the parent window while
      it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal)
  {
    gtk_print_dialog_set_modal(cast(GtkPrintDialog*)this._cPtr, modal);
  }

  /**
      Set the page setup for the print dialog.
  
      Params:
        pageSetup = the new page setup
  */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup)
  {
    gtk_print_dialog_set_page_setup(cast(GtkPrintDialog*)this._cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets the print settings for the print dialog.
  
      Params:
        printSettings = the new print settings
  */
  void setPrintSettings(gtk.print_settings.PrintSettings printSettings)
  {
    gtk_print_dialog_set_print_settings(cast(GtkPrintDialog*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }

  /**
      Sets the title that will be shown on the print dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_print_dialog_set_title(cast(GtkPrintDialog*)this._cPtr, _title);
  }

  /**
      This function presents a print dialog to let the user select a printer,
      and set up print settings and page setup.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.print_dialog.PrintDialog.setupFinish]
      to obtain the results in the form of a [gtk.print_setup.PrintSetup],
      that can then be passed to [gtk.print_dialog.PrintDialog.print]
      or [gtk.print_dialog.PrintDialog.printFile].
      
      One possible use for this method is to have the user select a printer,
      then show a page setup UI in the application (e.g. to arrange images
      on a page), then call [gtk.print_dialog.PrintDialog.print] on self
      to do the printing without further user interaction.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void setup(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_print_dialog_setup(cast(GtkPrintDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.print_dialog.PrintDialog.setup] call.
      
      If the call was successful, it returns a [gtk.print_setup.PrintSetup]
      which contains the print settings and page setup information that
      will be used to print.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: The [gtk.print_setup.PrintSetup] object that resulted from the call,
          or `NULL` if the call was not successful
      Throws: [ErrorWrap]
  */
  gtk.print_setup.PrintSetup setupFinish(gio.async_result.AsyncResult result)
  {
    GtkPrintSetup* _cretval;
    GError *_err;
    _cretval = gtk_print_dialog_setup_finish(cast(GtkPrintDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gtk.print_setup.PrintSetup(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
