/// Module for [PrintJob] class
module gtk.print_job;

import cairo.surface;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_settings;
import gtk.printer;
import gtk.types;

/**
    A [gtk.print_job.PrintJob] object represents a job that is sent to a printer.
    
    You only need to deal directly with print jobs if you use the
    non-portable [gtk.print_unix_dialog.PrintUnixDialog] API.
    
    Use [gtk.print_job.PrintJob.getSurface] to obtain the cairo surface
    onto which the pages must be drawn. Use [gtk.print_job.PrintJob.send]
    to send the finished job to the printer. If you don’t use cairo
    [gtk.print_job.PrintJob] also supports printing of manually generated PostScript,
    via [gtk.print_job.PrintJob.setSourceFile].
*/
class PrintJob : gobject.object.ObjectWrap
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
    return cast(void function())gtk_print_job_get_type != &gidSymbolNotFound ? gtk_print_job_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintJob self()
  {
    return this;
  }

  /**
      Get `trackPrintStatus` property.
      Returns: true if the print job will continue to emit status-changed
        signals after the print data has been setn to the printer.
  */
  @property bool trackPrintStatus()
  {
    return getTrackPrintStatus();
  }

  /**
      Set `trackPrintStatus` property.
      Params:
        propval = true if the print job will continue to emit status-changed
          signals after the print data has been setn to the printer.
  */
  @property void trackPrintStatus(bool propval)
  {
    return setTrackPrintStatus(propval);
  }

  /**
      Creates a new [gtk.print_job.PrintJob].
  
      Params:
        title = the job title
        printer = a [gtk.printer.Printer]
        settings = a [gtk.print_settings.PrintSettings]
        pageSetup = a [gtk.page_setup.PageSetup]
      Returns: a new [gtk.print_job.PrintJob]
  */
  this(string title, gtk.printer.Printer printer, gtk.print_settings.PrintSettings settings, gtk.page_setup.PageSetup pageSetup)
  {
    GtkPrintJob* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_print_job_new(_title, printer ? cast(GtkPrinter*)printer._cPtr(No.Dup) : null, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether this job is printed collated.
      Returns: whether the job is printed collated
  */
  bool getCollate()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_job_get_collate(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets the n-up setting for this job.
      Returns: the n-up setting
  */
  uint getNUp()
  {
    uint _retval;
    _retval = gtk_print_job_get_n_up(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets the n-up layout setting for this job.
      Returns: the n-up layout
  */
  gtk.types.NumberUpLayout getNUpLayout()
  {
    GtkNumberUpLayout _cretval;
    _cretval = gtk_print_job_get_n_up_layout(cast(GtkPrintJob*)this._cPtr);
    gtk.types.NumberUpLayout _retval = cast(gtk.types.NumberUpLayout)_cretval;
    return _retval;
  }

  /**
      Gets the number of copies of this job.
      Returns: the number of copies
  */
  int getNumCopies()
  {
    int _retval;
    _retval = gtk_print_job_get_num_copies(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page ranges for this job.
      Returns: a pointer to an
          array of [gtk.types.PageRange] structs
  */
  gtk.types.PageRange[] getPageRanges()
  {
    GtkPageRange* _cretval;
    int _cretlength;
    _cretval = gtk_print_job_get_page_ranges(cast(GtkPrintJob*)this._cPtr, &_cretlength);
    gtk.types.PageRange[] _retval;

    if (_cretval)
    {
      _retval = new gtk.types.PageRange[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i];
    }
    return _retval;
  }

  /**
      Gets the [gtk.types.PageSet] setting for this job.
      Returns: the [gtk.types.PageSet] setting
  */
  gtk.types.PageSet getPageSet()
  {
    GtkPageSet _cretval;
    _cretval = gtk_print_job_get_page_set(cast(GtkPrintJob*)this._cPtr);
    gtk.types.PageSet _retval = cast(gtk.types.PageSet)_cretval;
    return _retval;
  }

  /**
      Gets the [gtk.types.PrintPages] setting for this job.
      Returns: the [gtk.types.PrintPages] setting
  */
  gtk.types.PrintPages getPages()
  {
    GtkPrintPages _cretval;
    _cretval = gtk_print_job_get_pages(cast(GtkPrintJob*)this._cPtr);
    gtk.types.PrintPages _retval = cast(gtk.types.PrintPages)_cretval;
    return _retval;
  }

  /**
      Gets the [gtk.printer.Printer] of the print job.
      Returns: the printer of job
  */
  gtk.printer.Printer getPrinter()
  {
    GtkPrinter* _cretval;
    _cretval = gtk_print_job_get_printer(cast(GtkPrintJob*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.printer.Printer)(cast(GtkPrinter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether this job is printed reversed.
      Returns: whether the job is printed reversed.
  */
  bool getReverse()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_job_get_reverse(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the job is printed rotated.
      Returns: whether the job is printed rotated
  */
  bool getRotate()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_job_get_rotate(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets the scale for this job.
      Returns: the scale
  */
  double getScale()
  {
    double _retval;
    _retval = gtk_print_job_get_scale(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gtk.print_settings.PrintSettings] of the print job.
      Returns: the settings of job
  */
  gtk.print_settings.PrintSettings getSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_job_get_settings(cast(GtkPrintJob*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the status of the print job.
      Returns: the status of job
  */
  gtk.types.PrintStatus getStatus()
  {
    GtkPrintStatus _cretval;
    _cretval = gtk_print_job_get_status(cast(GtkPrintJob*)this._cPtr);
    gtk.types.PrintStatus _retval = cast(gtk.types.PrintStatus)_cretval;
    return _retval;
  }

  /**
      Gets a cairo surface onto which the pages of
      the print job should be rendered.
      Returns: the cairo surface of job
      Throws: [ErrorWrap]
  */
  cairo.surface.Surface getSurface()
  {
    cairo_surface_t* _cretval;
    GError *_err;
    _cretval = gtk_print_job_get_surface(cast(GtkPrintJob*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the job title.
      Returns: the title of job
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_print_job_get_title(cast(GtkPrintJob*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether jobs will be tracked after printing.
      
      For details, see [gtk.print_job.PrintJob.setTrackPrintStatus].
      Returns: true if print job status will be reported after printing
  */
  bool getTrackPrintStatus()
  {
    bool _retval;
    _retval = cast(bool)gtk_print_job_get_track_print_status(cast(GtkPrintJob*)this._cPtr);
    return _retval;
  }

  /**
      Sends the print job off to the printer.
  
      Params:
        callback = function to call when the job completes or an error occurs
  */
  void send(gtk.types.PrintJobCompleteFunc callback)
  {
    extern(C) void _callbackCallback(GtkPrintJob* printJob, void* userData, const(GError)* error)
    {
      auto _dlg = cast(gtk.types.PrintJobCompleteFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.print_job.PrintJob)(cast(void*)printJob, No.Take), error ? new glib.error.ErrorWrap(cast(void*)error, No.Take) : null);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gtk_print_job_send(cast(GtkPrintJob*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets whether this job is printed collated.
  
      Params:
        collate = whether the job is printed collated
  */
  void setCollate(bool collate)
  {
    gtk_print_job_set_collate(cast(GtkPrintJob*)this._cPtr, collate);
  }

  /**
      Sets the n-up setting for this job.
  
      Params:
        nUp = the n-up value
  */
  void setNUp(uint nUp)
  {
    gtk_print_job_set_n_up(cast(GtkPrintJob*)this._cPtr, nUp);
  }

  /**
      Sets the n-up layout setting for this job.
  
      Params:
        layout = the n-up layout setting
  */
  void setNUpLayout(gtk.types.NumberUpLayout layout)
  {
    gtk_print_job_set_n_up_layout(cast(GtkPrintJob*)this._cPtr, layout);
  }

  /**
      Sets the number of copies for this job.
  
      Params:
        numCopies = the number of copies
  */
  void setNumCopies(int numCopies)
  {
    gtk_print_job_set_num_copies(cast(GtkPrintJob*)this._cPtr, numCopies);
  }

  /**
      Sets the [gtk.types.PageSet] setting for this job.
  
      Params:
        pageSet = a [gtk.types.PageSet] setting
  */
  void setPageSet(gtk.types.PageSet pageSet)
  {
    gtk_print_job_set_page_set(cast(GtkPrintJob*)this._cPtr, pageSet);
  }

  /**
      Sets the [gtk.types.PrintPages] setting for this job.
  
      Params:
        pages = the [gtk.types.PrintPages] setting
  */
  void setPages(gtk.types.PrintPages pages)
  {
    gtk_print_job_set_pages(cast(GtkPrintJob*)this._cPtr, pages);
  }

  /**
      Sets whether this job is printed reversed.
  
      Params:
        reverse = whether the job is printed reversed
  */
  void setReverse(bool reverse)
  {
    gtk_print_job_set_reverse(cast(GtkPrintJob*)this._cPtr, reverse);
  }

  /**
      Sets whether this job is printed rotated.
  
      Params:
        rotate = whether to print rotated
  */
  void setRotate(bool rotate)
  {
    gtk_print_job_set_rotate(cast(GtkPrintJob*)this._cPtr, rotate);
  }

  /**
      Sets the scale for this job.
      
      1.0 means unscaled.
  
      Params:
        scale = the scale
  */
  void setScale(double scale)
  {
    gtk_print_job_set_scale(cast(GtkPrintJob*)this._cPtr, scale);
  }

  /**
      Make the [gtk.print_job.PrintJob] send an existing document to the
      printing system.
      
      The file can be in any format understood by the platforms
      printing system (typically PostScript, but on many platforms
      PDF may work too). See [gtk.printer.Printer.acceptsPdf] and
      [gtk.printer.Printer.acceptsPs].
      
      This is similar to [gtk.print_job.PrintJob.setSourceFile],
      but takes expects an open file descriptor for the file,
      instead of a filename.
  
      Params:
        fd = a file descriptor
      Returns: false if an error occurred
      Throws: [ErrorWrap]
  */
  bool setSourceFd(int fd)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_print_job_set_source_fd(cast(GtkPrintJob*)this._cPtr, fd, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Make the [gtk.print_job.PrintJob] send an existing document to the
      printing system.
      
      The file can be in any format understood by the platforms
      printing system (typically PostScript, but on many platforms
      PDF may work too). See [gtk.printer.Printer.acceptsPdf] and
      [gtk.printer.Printer.acceptsPs].
  
      Params:
        filename = the file to be printed
      Returns: false if an error occurred
      Throws: [ErrorWrap]
  */
  bool setSourceFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_print_job_set_source_file(cast(GtkPrintJob*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      If track_status is true, the print job will try to continue report
      on the status of the print job in the printer queues and printer.
      
      This can allow your application to show things like “out of paper”
      issues, and when the print job actually reaches the printer.
      
      This function is often implemented using some form of polling,
      so it should not be enabled unless needed.
  
      Params:
        trackStatus = true to track status after printing
  */
  void setTrackPrintStatus(bool trackStatus)
  {
    gtk_print_job_set_track_print_status(cast(GtkPrintJob*)this._cPtr, trackStatus);
  }

  /**
      Connect to `StatusChanged` signal.
  
      Emitted when the status of a job changes.
        
        The signal handler can use [gtk.print_job.PrintJob.getStatus]
        to obtain the new status.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.print_job.PrintJob printJob))
  
          `printJob` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStatusChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.print_job.PrintJob)))
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
}
