/// Module for [Printer] class
module gtk.printer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.paper_size;
import gtk.types;

/**
    A [gtk.printer.Printer] object represents a printer.
    
    You only need to deal directly with printers if you use the
    non-portable [gtk.print_unix_dialog.PrintUnixDialog] API.
    
    A [gtk.printer.Printer] allows to get status information about the printer,
    such as its description, its location, the number of queued jobs,
    etc. Most importantly, a [gtk.printer.Printer] object can be used to create
    a [gtk.print_job.PrintJob] object, which lets you print to the printer.
*/
class Printer : gobject.object.ObjectWrap
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
    return cast(void function())gtk_printer_get_type != &gidSymbolNotFound ? gtk_printer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Printer self()
  {
    return this;
  }

  /**
      Get `acceptingJobs` property.
      Returns: true if the printer is accepting jobs.
  */
  @property bool acceptingJobs()
  {
    return isAcceptingJobs();
  }

  /**
      Get `iconName` property.
      Returns: Icon name to use for the printer.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Get `jobCount` property.
      Returns: Number of jobs queued in the printer.
  */
  @property int jobCount()
  {
    return getJobCount();
  }

  /**
      Get `location` property.
      Returns: Information about the location of the printer.
  */
  @property string location()
  {
    return getLocation();
  }

  /**
      Get `paused` property.
      Returns: true if this printer is paused.
        
        A paused printer still accepts jobs, but it does
        not print them.
  */
  @property bool paused()
  {
    return isPaused();
  }

  /**
      Get `stateMessage` property.
      Returns: String giving the current status of the printer.
  */
  @property string stateMessage()
  {
    return getStateMessage();
  }

  /**
      Creates a new [gtk.printer.Printer].
  
      Params:
        name = the name of the printer
        backend = a [gtk.types.PrintBackend]
        virtual = whether the printer is virtual
      Returns: a new [gtk.printer.Printer]
  */
  this(string name, gtk.types.PrintBackend backend, bool virtual)
  {
    GtkPrinter* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_printer_new(_name, backend, virtual);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether the printer accepts input in
      PDF format.
      Returns: true if printer accepts PDF
  */
  bool acceptsPdf()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_accepts_pdf(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer accepts input in
      PostScript format.
      Returns: true if printer accepts PostScript
  */
  bool acceptsPs()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_accepts_ps(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Compares two printers.
  
      Params:
        b = another [gtk.printer.Printer]
      Returns: 0 if the printer match, a negative value if `a` < `b`,
          or a positive value if `a` > `b`
  */
  int compare(gtk.printer.Printer b)
  {
    int _retval;
    _retval = gtk_printer_compare(cast(GtkPrinter*)this._cPtr, b ? cast(GtkPrinter*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the backend of the printer.
      Returns: the backend of printer
  */
  gtk.types.PrintBackend getBackend()
  {
    auto _retval = gtk_printer_get_backend(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns the printer’s capabilities.
      
      This is useful when you’re using [gtk.print_unix_dialog.PrintUnixDialog]’s
      manual-capabilities setting and need to know which settings
      the printer can handle and which you must handle yourself.
      
      This will return 0 unless the printer’s details are
      available, see [gtk.printer.Printer.hasDetails] and
      [gtk.printer.Printer.requestDetails].
      Returns: the printer’s capabilities
  */
  gtk.types.PrintCapabilities getCapabilities()
  {
    GtkPrintCapabilities _cretval;
    _cretval = gtk_printer_get_capabilities(cast(GtkPrinter*)this._cPtr);
    gtk.types.PrintCapabilities _retval = cast(gtk.types.PrintCapabilities)_cretval;
    return _retval;
  }

  /**
      Returns default page size of printer.
      Returns: a newly allocated [gtk.page_setup.PageSetup] with default page size
          of the printer.
  */
  gtk.page_setup.PageSetup getDefaultPageSize()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_printer_get_default_page_size(cast(GtkPrinter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the description of the printer.
      Returns: the description of printer
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_printer_get_description(cast(GtkPrinter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieve the hard margins of printer.
      
      These are the margins that define the area at the borders
      of the paper that the printer cannot print to.
      
      Note: This will not succeed unless the printer’s details are
      available, see [gtk.printer.Printer.hasDetails] and
      [gtk.printer.Printer.requestDetails].
  
      Params:
        top = a location to store the top margin in
        bottom = a location to store the bottom margin in
        left = a location to store the left margin in
        right = a location to store the right margin in
      Returns: true iff the hard margins were retrieved
  */
  bool getHardMargins(out double top, out double bottom, out double left, out double right)
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_get_hard_margins(cast(GtkPrinter*)this._cPtr, cast(double*)&top, cast(double*)&bottom, cast(double*)&left, cast(double*)&right);
    return _retval;
  }

  /**
      Retrieve the hard margins of printer for paper_size.
      
      These are the margins that define the area at the borders
      of the paper that the printer cannot print to.
      
      Note: This will not succeed unless the printer’s details are
      available, see [gtk.printer.Printer.hasDetails] and
      [gtk.printer.Printer.requestDetails].
  
      Params:
        paperSize = a [gtk.paper_size.PaperSize]
        top = a location to store the top margin in
        bottom = a location to store the bottom margin in
        left = a location to store the left margin in
        right = a location to store the right margin in
      Returns: true iff the hard margins were retrieved
  */
  bool getHardMarginsForPaperSize(gtk.paper_size.PaperSize paperSize, out double top, out double bottom, out double left, out double right)
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_get_hard_margins_for_paper_size(cast(GtkPrinter*)this._cPtr, paperSize ? cast(GtkPaperSize*)paperSize._cPtr(No.Dup) : null, cast(double*)&top, cast(double*)&bottom, cast(double*)&left, cast(double*)&right);
    return _retval;
  }

  /**
      Gets the name of the icon to use for the printer.
      Returns: the icon name for printer
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_printer_get_icon_name(cast(GtkPrinter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of jobs currently queued on the printer.
      Returns: the number of jobs on printer
  */
  int getJobCount()
  {
    int _retval;
    _retval = gtk_printer_get_job_count(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns a description of the location of the printer.
      Returns: the location of printer
  */
  string getLocation()
  {
    const(char)* _cretval;
    _cretval = gtk_printer_get_location(cast(GtkPrinter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the name of the printer.
      Returns: the name of printer
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_printer_get_name(cast(GtkPrinter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the state message describing the current state
      of the printer.
      Returns: the state message of printer
  */
  string getStateMessage()
  {
    const(char)* _cretval;
    _cretval = gtk_printer_get_state_message(cast(GtkPrinter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the printer details are available.
      Returns: true if printer details are available
  */
  bool hasDetails()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_has_details(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer is accepting jobs
      Returns: true if printer is accepting jobs
  */
  bool isAcceptingJobs()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_is_accepting_jobs(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer is currently active (i.e.
      accepts new jobs).
      Returns: true if printer is active
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_is_active(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer is the default printer.
      Returns: true if printer is the default
  */
  bool isDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_is_default(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer is currently paused.
      
      A paused printer still accepts jobs, but it is not
      printing them.
      Returns: true if printer is paused
  */
  bool isPaused()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_is_paused(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the printer is virtual (i.e. does not
      represent actual printer hardware, but something like
      a CUPS class).
      Returns: true if printer is virtual
  */
  bool isVirtual()
  {
    bool _retval;
    _retval = cast(bool)gtk_printer_is_virtual(cast(GtkPrinter*)this._cPtr);
    return _retval;
  }

  /**
      Lists all the paper sizes printer supports.
      
      This will return and empty list unless the printer’s details
      are available, see [gtk.printer.Printer.hasDetails] and
      [gtk.printer.Printer.requestDetails].
      Returns: a newly
          allocated list of newly allocated [gtk.page_setup.PageSetup]s.
  */
  gtk.page_setup.PageSetup[] listPapers()
  {
    GList* _cretval;
    _cretval = gtk_printer_list_papers(cast(GtkPrinter*)this._cPtr);
    auto _retval = gListToD!(gtk.page_setup.PageSetup, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Requests the printer details.
      
      When the details are available, the
      `signalGtk.Printer::details-acquired` signal
      will be emitted on printer.
  */
  void requestDetails()
  {
    gtk_printer_request_details(cast(GtkPrinter*)this._cPtr);
  }

  /**
      Connect to `DetailsAcquired` signal.
  
      Emitted in response to a request for detailed information
        about a printer from the print backend.
        
        The success parameter indicates if the information was
        actually obtained.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool success, gtk.printer.Printer printer))
  
          `success` true if the details were successfully acquired (optional)
  
          `printer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDetailsAcquired(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.printer.Printer)))
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
    return connectSignalClosure("details-acquired", closure, after);
  }
}
