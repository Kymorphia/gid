/// Module for [PrintOperation] class
module gtk.print_operation;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_context;
import gtk.print_operation_preview;
import gtk.print_operation_preview_mixin;
import gtk.print_settings;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    [gtk.print_operation.PrintOperation] is the high-level, portable printing API.
    
    It looks a bit different than other GTK dialogs such as the
    [gtk.file_chooser.FileChooser], since some platforms don’t expose enough
    infrastructure to implement a good print dialog. On such
    platforms, [gtk.print_operation.PrintOperation] uses the native print dialog.
    On platforms which do not provide a native print dialog, GTK
    uses its own, see [gtk.print_unix_dialog.PrintUnixDialog].
    
    The typical way to use the high-level printing API is to create
    a [gtk.print_operation.PrintOperation] object with [gtk.print_operation.PrintOperation.new_]
    when the user selects to print. Then you set some properties on it,
    e.g. the page size, any [gtk.print_settings.PrintSettings] from previous print
    operations, the number of pages, the current page, etc.
    
    Then you start the print operation by calling [gtk.print_operation.PrintOperation.run].
    It will then show a dialog, let the user select a printer and options.
    When the user finished the dialog, various signals will be emitted on
    the [gtk.print_operation.PrintOperation], the main one being
    `signal@Gtk.PrintOperation::draw-page`, which you are supposed to handle
    and render the page on the provided [gtk.print_context.PrintContext] using Cairo.
    
    # The high-level printing API
    
    ```c
    static GtkPrintSettings *settings = NULL;
    
    static void
    do_print (void)
    {
      GtkPrintOperation *print;
      GtkPrintOperationResult res;
    
      print = gtk_print_operation_new ();
    
      if (settings != NULL)
        gtk_print_operation_set_print_settings (print, settings);
    
      g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
      g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
    
      res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                     GTK_WINDOW (main_window), NULL);
    
      if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
        {
          if (settings != NULL)
            g_object_unref (settings);
          settings = g_object_ref (gtk_print_operation_get_print_settings (print));
        }
    
      g_object_unref (print);
    }
    ```
    
    By default [gtk.print_operation.PrintOperation] uses an external application to do
    print preview. To implement a custom print preview, an application
    must connect to the preview signal. The functions
    [gtk.print_operation_preview.PrintOperationPreview.renderPage],
    [gtk.print_operation_preview.PrintOperationPreview.endPreview] and
    [gtk.print_operation_preview.PrintOperationPreview.isSelected]
    are useful when implementing a print preview.
*/
class PrintOperation : gobject.object.ObjectWrap, gtk.print_operation_preview.PrintOperationPreview
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
    return cast(void function())gtk_print_operation_get_type != &gidSymbolNotFound ? gtk_print_operation_get_type() : cast(GType)0;
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
      Get `allowAsync` property.
      Returns: Determines whether the print operation may run asynchronously or not.
      
      Some systems don't support asynchronous printing, but those that do
      will return [gtk.types.PrintOperationResult.InProgress] as the status, and
      emit the [gtk.print_operation.PrintOperation.done] signal when the operation
      is actually done.
      
      The Windows port does not support asynchronous operation at all (this
      is unlikely to change). On other platforms, all actions except for
      [gtk.types.PrintOperationAction.Export] support asynchronous operation.
  */
  @property bool allowAsync()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-async");
  }

  /**
      Set `allowAsync` property.
      Params:
        propval = Determines whether the print operation may run asynchronously or not.
        
        Some systems don't support asynchronous printing, but those that do
        will return [gtk.types.PrintOperationResult.InProgress] as the status, and
        emit the [gtk.print_operation.PrintOperation.done] signal when the operation
        is actually done.
        
        The Windows port does not support asynchronous operation at all (this
        is unlikely to change). On other platforms, all actions except for
        [gtk.types.PrintOperationAction.Export] support asynchronous operation.
  */
  @property void allowAsync(bool propval)
  {
    return setAllowAsync(propval);
  }

  /**
      Get `currentPage` property.
      Returns: The current page in the document.
      
      If this is set before [gtk.print_operation.PrintOperation.run],
      the user will be able to select to print only the current page.
      
      Note that this only makes sense for pre-paginated documents.
  */
  @property int currentPage()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("current-page");
  }

  /**
      Set `currentPage` property.
      Params:
        propval = The current page in the document.
        
        If this is set before [gtk.print_operation.PrintOperation.run],
        the user will be able to select to print only the current page.
        
        Note that this only makes sense for pre-paginated documents.
  */
  @property void currentPage(int propval)
  {
    return setCurrentPage(propval);
  }

  /**
      Get `customTabLabel` property.
      Returns: Used as the label of the tab containing custom widgets.
      
      Note that this property may be ignored on some platforms.
      
      If this is null, GTK uses a default label.
  */
  @property string customTabLabel()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("custom-tab-label");
  }

  /**
      Set `customTabLabel` property.
      Params:
        propval = Used as the label of the tab containing custom widgets.
        
        Note that this property may be ignored on some platforms.
        
        If this is null, GTK uses a default label.
  */
  @property void customTabLabel(string propval)
  {
    return setCustomTabLabel(propval);
  }

  /**
      Get `defaultPageSetup` property.
      Returns: The [gtk.page_setup.PageSetup] used by default.
      
      This page setup will be used by [gtk.print_operation.PrintOperation.run],
      but it can be overridden on a per-page basis by connecting
      to the `signal@Gtk.PrintOperation::request-page-setup` signal.
  */
  @property gtk.page_setup.PageSetup defaultPageSetup()
  {
    return getDefaultPageSetup();
  }

  /**
      Set `defaultPageSetup` property.
      Params:
        propval = The [gtk.page_setup.PageSetup] used by default.
        
        This page setup will be used by [gtk.print_operation.PrintOperation.run],
        but it can be overridden on a per-page basis by connecting
        to the `signal@Gtk.PrintOperation::request-page-setup` signal.
  */
  @property void defaultPageSetup(gtk.page_setup.PageSetup propval)
  {
    return setDefaultPageSetup(propval);
  }

  /**
      Get `embedPageSetup` property.
      Returns: If true, page size combo box and orientation combo box
      are embedded into page setup page.
  */
  @property bool embedPageSetup()
  {
    return getEmbedPageSetup();
  }

  /**
      Set `embedPageSetup` property.
      Params:
        propval = If true, page size combo box and orientation combo box
        are embedded into page setup page.
  */
  @property void embedPageSetup(bool propval)
  {
    return setEmbedPageSetup(propval);
  }

  /**
      Get `exportFilename` property.
      Returns: The name of a file to generate instead of showing the print dialog.
      
      Currently, PDF is the only supported format.
      
      The intended use of this property is for implementing
      “Export to PDF” actions.
      
      “Print to PDF” support is independent of this and is done
      by letting the user pick the “Print to PDF” item from the
      list of printers in the print dialog.
  */
  @property string exportFilename()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("export-filename");
  }

  /**
      Set `exportFilename` property.
      Params:
        propval = The name of a file to generate instead of showing the print dialog.
        
        Currently, PDF is the only supported format.
        
        The intended use of this property is for implementing
        “Export to PDF” actions.
        
        “Print to PDF” support is independent of this and is done
        by letting the user pick the “Print to PDF” item from the
        list of printers in the print dialog.
  */
  @property void exportFilename(string propval)
  {
    return setExportFilename(propval);
  }

  /**
      Get `hasSelection` property.
      Returns: Determines whether there is a selection in your application.
      
      This can allow your application to print the selection.
      This is typically used to make a "Selection" button sensitive.
  */
  @property bool hasSelection()
  {
    return getHasSelection();
  }

  /**
      Set `hasSelection` property.
      Params:
        propval = Determines whether there is a selection in your application.
        
        This can allow your application to print the selection.
        This is typically used to make a "Selection" button sensitive.
  */
  @property void hasSelection(bool propval)
  {
    return setHasSelection(propval);
  }

  /**
      Get `jobName` property.
      Returns: A string used to identify the job (e.g. in monitoring
      applications like eggcups).
      
      If you don't set a job name, GTK picks a default one
      by numbering successive print jobs.
  */
  @property string jobName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("job-name");
  }

  /**
      Set `jobName` property.
      Params:
        propval = A string used to identify the job (e.g. in monitoring
        applications like eggcups).
        
        If you don't set a job name, GTK picks a default one
        by numbering successive print jobs.
  */
  @property void jobName(string propval)
  {
    return setJobName(propval);
  }

  /**
      Get `nPages` property.
      Returns: The number of pages in the document.
      
      This must be set to a positive number before the rendering
      starts. It may be set in a `signal@Gtk.PrintOperation::begin-print`
      signal handler.
      
      Note that the page numbers passed to the
      `signal@Gtk.PrintOperation::request-page-setup` and
      `signal@Gtk.PrintOperation::draw-page` signals are 0-based, i.e.
      if the user chooses to print all pages, the last ::draw-page signal
      will be for page @n_pages - 1.
  */
  @property int nPages()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("n-pages");
  }

  /**
      Set `nPages` property.
      Params:
        propval = The number of pages in the document.
        
        This must be set to a positive number before the rendering
        starts. It may be set in a `signal@Gtk.PrintOperation::begin-print`
        signal handler.
        
        Note that the page numbers passed to the
        `signal@Gtk.PrintOperation::request-page-setup` and
        `signal@Gtk.PrintOperation::draw-page` signals are 0-based, i.e.
        if the user chooses to print all pages, the last ::draw-page signal
        will be for page @n_pages - 1.
  */
  @property void nPages(int propval)
  {
    return setNPages(propval);
  }

  /**
      Get `nPagesToPrint` property.
      Returns: The number of pages that will be printed.
      
      Note that this value is set during print preparation phase
      ([gtk.types.PrintStatus.Preparing]), so this value should never be
      get before the data generation phase ([gtk.types.PrintStatus.GeneratingData]).
      You can connect to the `signal@Gtk.PrintOperation::status-changed` signal
      and call [gtk.print_operation.PrintOperation.getNPagesToPrint] when
      print status is [gtk.types.PrintStatus.GeneratingData].
      
      This is typically used to track the progress of print operation.
  */
  @property int nPagesToPrint()
  {
    return getNPagesToPrint();
  }

  /**
      Get `printSettings` property.
      Returns: The [gtk.print_settings.PrintSettings] used for initializing the dialog.
      
      Setting this property is typically used to re-establish
      print settings from a previous print operation, see
      [gtk.print_operation.PrintOperation.run].
  */
  @property gtk.print_settings.PrintSettings printSettings()
  {
    return getPrintSettings();
  }

  /**
      Set `printSettings` property.
      Params:
        propval = The [gtk.print_settings.PrintSettings] used for initializing the dialog.
        
        Setting this property is typically used to re-establish
        print settings from a previous print operation, see
        [gtk.print_operation.PrintOperation.run].
  */
  @property void printSettings(gtk.print_settings.PrintSettings propval)
  {
    return setPrintSettings(propval);
  }

  /**
      Get `showProgress` property.
      Returns: Determines whether to show a progress dialog during the
      print operation.
  */
  @property bool showProgress()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-progress");
  }

  /**
      Set `showProgress` property.
      Params:
        propval = Determines whether to show a progress dialog during the
        print operation.
  */
  @property void showProgress(bool propval)
  {
    return setShowProgress(propval);
  }

  /**
      Get `status` property.
      Returns: The status of the print operation.
  */
  @property gtk.types.PrintStatus status()
  {
    return getStatus();
  }

  /**
      Get `statusString` property.
      Returns: A string representation of the status of the print operation.
      
      The string is translated and suitable for displaying the print
      status e.g. in a [gtk.statusbar.Statusbar].
      
      See the [gtk.print_operation.PrintOperation.status] property for a status
      value that is suitable for programmatic use.
  */
  @property string statusString()
  {
    return getStatusString();
  }

  /**
      Get `supportSelection` property.
      Returns: If true, the print operation will support print of selection.
      
      This allows the print dialog to show a "Selection" button.
  */
  @property bool supportSelection()
  {
    return getSupportSelection();
  }

  /**
      Set `supportSelection` property.
      Params:
        propval = If true, the print operation will support print of selection.
        
        This allows the print dialog to show a "Selection" button.
  */
  @property void supportSelection(bool propval)
  {
    return setSupportSelection(propval);
  }

  /**
      Get `trackPrintStatus` property.
      Returns: If true, the print operation will try to continue report on
      the status of the print job in the printer queues and printer.
      
      This can allow your application to show things like “out of paper”
      issues, and when the print job actually reaches the printer.
      However, this is often implemented using polling, and should
      not be enabled unless needed.
  */
  @property bool trackPrintStatus()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("track-print-status");
  }

  /**
      Set `trackPrintStatus` property.
      Params:
        propval = If true, the print operation will try to continue report on
        the status of the print job in the printer queues and printer.
        
        This can allow your application to show things like “out of paper”
        issues, and when the print job actually reaches the printer.
        However, this is often implemented using polling, and should
        not be enabled unless needed.
  */
  @property void trackPrintStatus(bool propval)
  {
    return setTrackPrintStatus(propval);
  }

  /**
      Get `unit` property.
      Returns: The transformation for the cairo context obtained from
      [gtk.print_context.PrintContext] is set up in such a way that distances
      are measured in units of @unit.
  */
  @property gtk.types.Unit unit()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Unit)("unit");
  }

  /**
      Set `unit` property.
      Params:
        propval = The transformation for the cairo context obtained from
        [gtk.print_context.PrintContext] is set up in such a way that distances
        are measured in units of @unit.
  */
  @property void unit(gtk.types.Unit propval)
  {
    return setUnit(propval);
  }

  /**
      Get `useFullPage` property.
      Returns: If true, the transformation for the cairo context obtained
      from [gtk.print_context.PrintContext] puts the origin at the top left corner
      of the page.
      
      This may not be the top left corner of the sheet, depending on
      page orientation and the number of pages per sheet. Otherwise,
      the origin is at the top left corner of the imageable area (i.e.
      inside the margins).
  */
  @property bool useFullPage()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-full-page");
  }

  /**
      Set `useFullPage` property.
      Params:
        propval = If true, the transformation for the cairo context obtained
        from [gtk.print_context.PrintContext] puts the origin at the top left corner
        of the page.
        
        This may not be the top left corner of the sheet, depending on
        page orientation and the number of pages per sheet. Otherwise,
        the origin is at the top left corner of the imageable area (i.e.
        inside the margins).
  */
  @property void useFullPage(bool propval)
  {
    return setUseFullPage(propval);
  }

  mixin PrintOperationPreviewT!();

  /**
      Creates a new [gtk.print_operation.PrintOperation].
      Returns: a new [gtk.print_operation.PrintOperation]
  */
  this()
  {
    GtkPrintOperation* _cretval;
    _cretval = gtk_print_operation_new();
    this(_cretval, Yes.Take);
  }

  /**
      Cancels a running print operation.
      
      This function may be called from a `signalGtk.PrintOperation::begin-print`,
      [gtk.print_operation.PrintOperation.paginate] or `signalGtk.PrintOperation::draw-page`
      signal handler to stop the currently running print operation.
  */
  void cancel()
  {
    gtk_print_operation_cancel(cast(GtkPrintOperation*)this._cPtr);
  }

  /**
      Signal that drawing of particular page is complete.
      
      It is called after completion of page drawing (e.g. drawing
      in another thread). If [gtk.print_operation.PrintOperation.setDeferDrawing]
      was called before, then this function has to be called by application.
      Otherwise it is called by GTK itself.
  */
  void drawPageFinish()
  {
    gtk_print_operation_draw_page_finish(cast(GtkPrintOperation*)this._cPtr);
  }

  /**
      Returns the default page setup.
      Returns: the default page setup
  */
  gtk.page_setup.PageSetup getDefaultPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_operation_get_default_page_setup(cast(GtkPrintOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether page setup selection combos are embedded
      Returns: whether page setup selection combos are embedded
  */
  bool getEmbedPageSetup()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_get_embed_page_setup(cast(GtkPrintOperation*)this._cPtr);
    return _retval;
  }

  /**
      Call this when the result of a print operation is
      [gtk.types.PrintOperationResult.Error].
      
      It can be called either after [gtk.print_operation.PrintOperation.run]
      returns, or in the [gtk.print_operation.PrintOperation.done] signal
      handler.
      
      The returned [glib.error.ErrorWrap] will contain more details on what went wrong.
      Throws: [ErrorWrap]
  */
  void getError()
  {
    GError *_err;
    gtk_print_operation_get_error(cast(GtkPrintOperation*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
  }

  /**
      Gets whether there is a selection.
      Returns: whether there is a selection
  */
  bool getHasSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_get_has_selection(cast(GtkPrintOperation*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of pages that will be printed.
      
      Note that this value is set during print preparation phase
      ([gtk.types.PrintStatus.Preparing]), so this function should never be
      called before the data generation phase ([gtk.types.PrintStatus.GeneratingData]).
      You can connect to the `signalGtk.PrintOperation::status-changed`
      signal and call [gtk.print_operation.PrintOperation.getNPagesToPrint] when
      print status is [gtk.types.PrintStatus.GeneratingData].
      
      This is typically used to track the progress of print operation.
      Returns: the number of pages that will be printed
  */
  int getNPagesToPrint()
  {
    int _retval;
    _retval = gtk_print_operation_get_n_pages_to_print(cast(GtkPrintOperation*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current print settings.
      
      Note that the return value is null until either
      [gtk.print_operation.PrintOperation.setPrintSettings] or
      [gtk.print_operation.PrintOperation.run] have been called.
      Returns: the current print settings of op.
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_operation_get_print_settings(cast(GtkPrintOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the status of the print operation.
      
      Also see [gtk.print_operation.PrintOperation.getStatusString].
      Returns: the status of the print operation
  */
  gtk.types.PrintStatus getStatus()
  {
    GtkPrintStatus _cretval;
    _cretval = gtk_print_operation_get_status(cast(GtkPrintOperation*)this._cPtr);
    gtk.types.PrintStatus _retval = cast(gtk.types.PrintStatus)_cretval;
    return _retval;
  }

  /**
      Returns a string representation of the status of the
      print operation.
      
      The string is translated and suitable for displaying
      the print status e.g. in a [gtk.statusbar.Statusbar].
      
      Use [gtk.print_operation.PrintOperation.getStatus] to obtain
      a status value that is suitable for programmatic use.
      Returns: a string representation of the status
           of the print operation
  */
  string getStatusString()
  {
    const(char)* _cretval;
    _cretval = gtk_print_operation_get_status_string(cast(GtkPrintOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the application supports print of selection
      Returns: whether the application supports print of selection
  */
  bool getSupportSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_get_support_selection(cast(GtkPrintOperation*)this._cPtr);
    return _retval;
  }

  /**
      A convenience function to find out if the print operation
      is finished.
      
      a print operation is finished if its status is either
      [gtk.types.PrintStatus.Finished] or [gtk.types.PrintStatus.FinishedAborted].
      
      Note: when you enable print status tracking the print operation
      can be in a non-finished state even after done has been called, as
      the operation status then tracks the print job status on the printer.
      Returns: true, if the print operation is finished.
  */
  bool isFinished()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_operation_is_finished(cast(GtkPrintOperation*)this._cPtr);
    return _retval;
  }

  /**
      Runs the print operation.
      
      Normally that this function does not return until the rendering
      of all pages is complete. You can connect to the
      `signalGtk.PrintOperation::status-changed` signal on op to obtain
      some information about the progress of the print operation.
      
      Furthermore, it may use a recursive mainloop to show the print dialog.
      
      If you set the [Gtk.PrintOperation:allow-async] property, the operation
      will run asynchronously if this is supported on the platform. The
      [gtk.print_operation.PrintOperation.done] signal will be emitted with the result
      of the operation when the it is done (i.e. when the dialog is canceled,
      or when the print succeeds or fails).
      
      ```c
      if (settings != NULL)
        gtk_print_operation_set_print_settings (print, settings);
      
      if (page_setup != NULL)
        gtk_print_operation_set_default_page_setup (print, page_setup);
      
      g_signal_connect (print, "begin-print",
                        G_CALLBACK (begin_print), &data);
      g_signal_connect (print, "draw-page",
                        G_CALLBACK (draw_page), &data);
      
      res = gtk_print_operation_run (print,
                                     GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                     parent,
                                     &error);
      
      if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
       {
         error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
        			                     GTK_DIALOG_DESTROY_WITH_PARENT,
      					     GTK_MESSAGE_ERROR,
      					     GTK_BUTTONS_CLOSE,
      					     "Error printing file:\n%s",
      					     error->message);
         g_signal_connect (error_dialog, "response",
                           G_CALLBACK (gtk_window_destroy), NULL);
         gtk_window_present (GTK_WINDOW (error_dialog));
         g_error_free (error);
       }
      else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
       {
         if (settings != NULL)
      g_object_unref (settings);
         settings = g_object_ref (gtk_print_operation_get_print_settings (print));
       }
      ```
      
      Note that [gtk.print_operation.PrintOperation.run] can only be called once on a
      given [gtk.print_operation.PrintOperation].
  
      Params:
        action = the action to start
        parent = Transient parent of the dialog
      Returns: the result of the print operation. A return value of
          [gtk.types.PrintOperationResult.Apply] indicates that the printing was
          completed successfully. In this case, it is a good idea to obtain
          the used print settings with
          [gtk.print_operation.PrintOperation.getPrintSettings]
          and store them for reuse with the next print operation. A value of
          [gtk.types.PrintOperationResult.InProgress] means the operation is running
          asynchronously, and will emit the [gtk.print_operation.PrintOperation.done]
          signal when done.
      Throws: [ErrorWrap]
  */
  gtk.types.PrintOperationResult run(gtk.types.PrintOperationAction action, gtk.window.Window parent = null)
  {
    GtkPrintOperationResult _cretval;
    GError *_err;
    _cretval = gtk_print_operation_run(cast(GtkPrintOperation*)this._cPtr, action, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gtk.types.PrintOperationResult _retval = cast(gtk.types.PrintOperationResult)_cretval;
    return _retval;
  }

  /**
      Sets whether [gtk.print_operation.PrintOperation.run] may return
      before the print operation is completed.
      
      Note that some platforms may not allow asynchronous
      operation.
  
      Params:
        allowAsync = true to allow asynchronous operation
  */
  void setAllowAsync(bool allowAsync)
  {
    gtk_print_operation_set_allow_async(cast(GtkPrintOperation*)this._cPtr, allowAsync);
  }

  /**
      Sets the current page.
      
      If this is called before [gtk.print_operation.PrintOperation.run],
      the user will be able to select to print only the current page.
      
      Note that this only makes sense for pre-paginated documents.
  
      Params:
        currentPage = the current page, 0-based
  */
  void setCurrentPage(int currentPage)
  {
    gtk_print_operation_set_current_page(cast(GtkPrintOperation*)this._cPtr, currentPage);
  }

  /**
      Sets the label for the tab holding custom widgets.
  
      Params:
        label = the label to use, or null to use the default label
  */
  void setCustomTabLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_print_operation_set_custom_tab_label(cast(GtkPrintOperation*)this._cPtr, _label);
  }

  /**
      Makes default_page_setup the default page setup for op.
      
      This page setup will be used by [gtk.print_operation.PrintOperation.run],
      but it can be overridden on a per-page basis by connecting
      to the `signalGtk.PrintOperation::request-page-setup` signal.
  
      Params:
        defaultPageSetup = a [gtk.page_setup.PageSetup]
  */
  void setDefaultPageSetup(gtk.page_setup.PageSetup defaultPageSetup = null)
  {
    gtk_print_operation_set_default_page_setup(cast(GtkPrintOperation*)this._cPtr, defaultPageSetup ? cast(GtkPageSetup*)defaultPageSetup._cPtr(No.Dup) : null);
  }

  /**
      Sets up the [gtk.print_operation.PrintOperation] to wait for calling of
      [methodGtk.PrintOperation.draw_page_finish from application.
      
      This can be used for drawing page in another thread.
      
      This function must be called in the callback of the
      `signalGtk.PrintOperation::draw-page` signal.
  */
  void setDeferDrawing()
  {
    gtk_print_operation_set_defer_drawing(cast(GtkPrintOperation*)this._cPtr);
  }

  /**
      Embed page size combo box and orientation combo box into page setup page.
      
      Selected page setup is stored as default page setup in [gtk.print_operation.PrintOperation].
  
      Params:
        embed = true to embed page setup selection in the [gtk.print_unix_dialog.PrintUnixDialog]
  */
  void setEmbedPageSetup(bool embed)
  {
    gtk_print_operation_set_embed_page_setup(cast(GtkPrintOperation*)this._cPtr, embed);
  }

  /**
      Sets up the [gtk.print_operation.PrintOperation] to generate a file instead
      of showing the print dialog.
      
      The intended use of this function is for implementing
      “Export to PDF” actions. Currently, PDF is the only supported
      format.
      
      “Print to PDF” support is independent of this and is done
      by letting the user pick the “Print to PDF” item from the list
      of printers in the print dialog.
  
      Params:
        filename = the filename for the exported file
  */
  void setExportFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_print_operation_set_export_filename(cast(GtkPrintOperation*)this._cPtr, _filename);
  }

  /**
      Sets whether there is a selection to print.
      
      Application has to set number of pages to which the selection
      will draw by [gtk.print_operation.PrintOperation.setNPages] in a handler
      for the `signalGtk.PrintOperation::begin-print` signal.
  
      Params:
        hasSelection = true indicates that a selection exists
  */
  void setHasSelection(bool hasSelection)
  {
    gtk_print_operation_set_has_selection(cast(GtkPrintOperation*)this._cPtr, hasSelection);
  }

  /**
      Sets the name of the print job.
      
      The name is used to identify the job (e.g. in monitoring
      applications like eggcups).
      
      If you don’t set a job name, GTK picks a default one by
      numbering successive print jobs.
  
      Params:
        jobName = a string that identifies the print job
  */
  void setJobName(string jobName)
  {
    const(char)* _jobName = jobName.toCString(No.Alloc);
    gtk_print_operation_set_job_name(cast(GtkPrintOperation*)this._cPtr, _jobName);
  }

  /**
      Sets the number of pages in the document.
      
      This must be set to a positive number before the rendering
      starts. It may be set in a `signalGtk.PrintOperation::begin-print`
      signal handler.
      
      Note that the page numbers passed to the
      `signalGtk.PrintOperation::request-page-setup`
      and `signalGtk.PrintOperation::draw-page` signals are 0-based, i.e.
      if the user chooses to print all pages, the last ::draw-page signal
      will be for page n_pages - 1.
  
      Params:
        nPages = the number of pages
  */
  void setNPages(int nPages)
  {
    gtk_print_operation_set_n_pages(cast(GtkPrintOperation*)this._cPtr, nPages);
  }

  /**
      Sets the print settings for op.
      
      This is typically used to re-establish print settings
      from a previous print operation, see [gtk.print_operation.PrintOperation.run].
  
      Params:
        printSettings = [gtk.print_settings.PrintSettings]
  */
  void setPrintSettings(gtk.print_settings.PrintSettings printSettings = null)
  {
    gtk_print_operation_set_print_settings(cast(GtkPrintOperation*)this._cPtr, printSettings ? cast(GtkPrintSettings*)printSettings._cPtr(No.Dup) : null);
  }

  /**
      If show_progress is true, the print operation will show
      a progress dialog during the print operation.
  
      Params:
        showProgress = true to show a progress dialog
  */
  void setShowProgress(bool showProgress)
  {
    gtk_print_operation_set_show_progress(cast(GtkPrintOperation*)this._cPtr, showProgress);
  }

  /**
      Sets whether selection is supported by [gtk.print_operation.PrintOperation].
  
      Params:
        supportSelection = true to support selection
  */
  void setSupportSelection(bool supportSelection)
  {
    gtk_print_operation_set_support_selection(cast(GtkPrintOperation*)this._cPtr, supportSelection);
  }

  /**
      If track_status is true, the print operation will try to continue
      report on the status of the print job in the printer queues and printer.
      
      This can allow your application to show things like “out of paper”
      issues, and when the print job actually reaches the printer.
      
      This function is often implemented using some form of polling,
      so it should not be enabled unless needed.
  
      Params:
        trackStatus = true to track status after printing
  */
  void setTrackPrintStatus(bool trackStatus)
  {
    gtk_print_operation_set_track_print_status(cast(GtkPrintOperation*)this._cPtr, trackStatus);
  }

  /**
      Sets up the transformation for the cairo context obtained from
      [gtk.print_context.PrintContext] in such a way that distances are measured in
      units of unit.
  
      Params:
        unit = the unit to use
  */
  void setUnit(gtk.types.Unit unit)
  {
    gtk_print_operation_set_unit(cast(GtkPrintOperation*)this._cPtr, unit);
  }

  /**
      If full_page is true, the transformation for the cairo context
      obtained from [gtk.print_context.PrintContext] puts the origin at the top left
      corner of the page.
      
      This may not be the top left corner of the sheet, depending on page
      orientation and the number of pages per sheet). Otherwise, the origin
      is at the top left corner of the imageable area (i.e. inside the margins).
  
      Params:
        fullPage = true to set up the [gtk.print_context.PrintContext] for the full page
  */
  void setUseFullPage(bool fullPage)
  {
    gtk_print_operation_set_use_full_page(cast(GtkPrintOperation*)this._cPtr, fullPage);
  }

  /**
      Connect to `BeginPrint` signal.
  
      Emitted after the user has finished changing print settings
      in the dialog, before the actual rendering starts.
      
      A typical use for ::begin-print is to use the parameters from the
      [gtk.print_context.PrintContext] and paginate the document accordingly,
      and then set the number of pages with
      [gtk.print_operation.PrintOperation.setNPages].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation))
  
          `context` the [gtk.print_context.PrintContext] for the current operation (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBeginPrint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation.PrintOperation)))
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
    return connectSignalClosure("begin-print", closure, after);
  }

  /**
      Connect to `CreateCustomWidget` signal.
  
      Emitted when displaying the print dialog.
      
      If you return a widget in a handler for this signal it will be
      added to a custom tab in the print dialog. You typically return a
      container widget with multiple widgets in it.
      
      The print dialog owns the returned widget, and its lifetime is not
      controlled by the application. However, the widget is guaranteed
      to stay around until the `signalGtk.PrintOperation::custom-widget-apply`
      signal is emitted on the operation. Then you can read out any
      information you need from the widgets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gobject.object.ObjectWrap callback(gtk.print_operation.PrintOperation printOperation))
  
          `printOperation` the instance the signal is connected to (optional)
  
          `Returns` A custom widget that gets embedded in
            the print dialog
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateCustomWidget(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gobject.object.ObjectWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_operation.PrintOperation)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gobject.object.ObjectWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-custom-widget", closure, after);
  }

  /**
      Connect to `CustomWidgetApply` signal.
  
      Emitted right before ::begin-print if you added
      a custom widget in the ::create-custom-widget handler.
      
      When you get this signal you should read the information from the
      custom widgets, as the widgets are not guaranteed to be around at a
      later time.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget, gtk.print_operation.PrintOperation printOperation))
  
          `widget` the custom widget added in ::create-custom-widget (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCustomWidgetApply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation.PrintOperation)))
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
    return connectSignalClosure("custom-widget-apply", closure, after);
  }

  /**
      Connect to `Done` signal.
  
      Emitted when the print operation run has finished doing
      everything required for printing.
      
      result gives you information about what happened during the run.
      If result is [gtk.types.PrintOperationResult.Error] then you can call
      [gtk.print_operation.PrintOperation.getError] for more information.
      
      If you enabled print status tracking then
      [gtk.print_operation.PrintOperation.isFinished] may still return false
      after the ::done signal was emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.PrintOperationResult result, gtk.print_operation.PrintOperation printOperation))
  
          `result` the result of the print operation (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDone(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.PrintOperationResult)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation.PrintOperation)))
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
    return connectSignalClosure("done", closure, after);
  }

  /**
      Connect to `DrawPage` signal.
  
      Emitted for every page that is printed.
      
      The signal handler must render the page_nr's page onto the cairo
      context obtained from context using
      [gtk.print_context.PrintContext.getCairoContext].
      
      ```c
      static void
      draw_page (GtkPrintOperation *operation,
                 GtkPrintContext   *context,
                 int                page_nr,
                 gpointer           user_data)
      {
        cairo_t *cr;
        PangoLayout *layout;
        double width, text_height;
        int layout_height;
        PangoFontDescription *desc;
        
        cr = gtk_print_context_get_cairo_context (context);
        width = gtk_print_context_get_width (context);
        
        cairo_rectangle (cr, 0, 0, width, HEADER_HEIGHT);
        
        cairo_set_source_rgb (cr, 0.8, 0.8, 0.8);
        cairo_fill (cr);
        
        layout = gtk_print_context_create_pango_layout (context);
        
        desc = pango_font_description_from_string ("sans 14");
        pango_layout_set_font_description (layout, desc);
        pango_font_description_free (desc);
        
        pango_layout_set_text (layout, "some text", -1);
        pango_layout_set_width (layout, width * PANGO_SCALE);
        pango_layout_set_alignment (layout, PANGO_ALIGN_CENTER);
           		      
        pango_layout_get_size (layout, NULL, &layout_height);
        text_height = (double)layout_height / PANGO_SCALE;
        
        cairo_move_to (cr, width / 2,  (HEADER_HEIGHT - text_height) / 2);
        pango_cairo_show_layout (cr, layout);
        
        g_object_unref (layout);
      }
      ```
      
      Use [gtk.print_operation.PrintOperation.setUseFullPage] and
      [gtk.print_operation.PrintOperation.setUnit] before starting the print
      operation to set up the transformation of the cairo context
      according to your needs.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, int pageNr, gtk.print_operation.PrintOperation printOperation))
  
          `context` the [gtk.print_context.PrintContext] for the current operation (optional)
  
          `pageNr` the number of the currently printed page (0-based) (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDrawPage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.print_operation.PrintOperation)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("draw-page", closure, after);
  }

  /**
      Connect to `EndPrint` signal.
  
      Emitted after all pages have been rendered.
      
      A handler for this signal can clean up any resources that have
      been allocated in the `signalGtk.PrintOperation::begin-print` handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation))
  
          `context` the [gtk.print_context.PrintContext] for the current operation (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEndPrint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation.PrintOperation)))
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
    return connectSignalClosure("end-print", closure, after);
  }

  /**
      Connect to `Paginate` signal.
  
      Emitted after the ::begin-print signal, but before the actual rendering
      starts.
      
      It keeps getting emitted until a connected signal handler returns true.
      
      The ::paginate signal is intended to be used for paginating a document
      in small chunks, to avoid blocking the user interface for a long
      time. The signal handler should update the number of pages using
      [gtk.print_operation.PrintOperation.setNPages], and return true if the document
      has been completely paginated.
      
      If you don't need to do pagination in chunks, you can simply do
      it all in the ::begin-print handler, and set the number of pages
      from there.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation))
  
          `context` the [gtk.print_context.PrintContext] for the current operation (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
          `Returns` true if pagination is complete
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPaginate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_operation.PrintOperation)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paginate", closure, after);
  }

  /**
      Connect to `Preview` signal.
  
      Gets emitted when a preview is requested from the native dialog.
      
      The default handler for this signal uses an external viewer
      application to preview.
      
      To implement a custom print preview, an application must return
      true from its handler for this signal. In order to use the
      provided context for the preview implementation, it must be
      given a suitable cairo context with
      [gtk.print_context.PrintContext.setCairoContext].
      
      The custom preview implementation can use
      [gtk.print_operation_preview.PrintOperationPreview.isSelected] and
      [gtk.print_operation_preview.PrintOperationPreview.renderPage] to find pages which
      are selected for print and render them. The preview must be
      finished by calling [gtk.print_operation_preview.PrintOperationPreview.endPreview]
      (typically in response to the user clicking a close button).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.print_operation_preview.PrintOperationPreview preview, gtk.print_context.PrintContext context, gtk.window.Window parent, gtk.print_operation.PrintOperation printOperation))
  
          `preview` the [gtk.print_operation_preview.PrintOperationPreview] for the current operation (optional)
  
          `context` the [gtk.print_context.PrintContext] that will be used (optional)
  
          `parent` the [gtk.window.Window] to use as window parent (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
          `Returns` true if the listener wants to take over control of the preview
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreview(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_operation_preview.PrintOperationPreview)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.window.Window)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.print_operation.PrintOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preview", closure, after);
  }

  /**
      Connect to `RequestPageSetup` signal.
  
      Emitted once for every page that is printed.
      
      This gives the application a chance to modify the page setup.
      Any changes done to setup will be in force only for printing
      this page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_context.PrintContext context, int pageNr, gtk.page_setup.PageSetup setup, gtk.print_operation.PrintOperation printOperation))
  
          `context` the [gtk.print_context.PrintContext] for the current operation (optional)
  
          `pageNr` the number of the currently printed page (0-based) (optional)
  
          `setup` the [gtk.page_setup.PageSetup] (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestPageSetup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_context.PrintContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.page_setup.PageSetup)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.print_operation.PrintOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-page-setup", closure, after);
  }

  /**
      Connect to `StatusChanged` signal.
  
      Emitted at between the various phases of the print operation.
      
      See [gtk.types.PrintStatus] for the phases that are being discriminated.
      Use [gtk.print_operation.PrintOperation.getStatus] to find out the current
      status.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_operation.PrintOperation printOperation))
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStatusChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_operation.PrintOperation)))
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
    return connectSignalClosure("status-changed", closure, after);
  }

  /**
      Connect to `UpdateCustomWidget` signal.
  
      Emitted after change of selected printer.
      
      The actual page setup and print settings are passed to the custom
      widget, which can actualize itself according to this change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget, gtk.page_setup.PageSetup setup, gtk.print_settings.PrintSettings settings, gtk.print_operation.PrintOperation printOperation))
  
          `widget` the custom widget added in ::create-custom-widget (optional)
  
          `setup` actual page setup (optional)
  
          `settings` actual print settings (optional)
  
          `printOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpdateCustomWidget(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.page_setup.PageSetup)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.print_settings.PrintSettings)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.print_operation.PrintOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update-custom-widget", closure, after);
  }
}
