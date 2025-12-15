/// Module for [PageSetup] class
module gtk.page_setup;

import gid.gid;
import glib.error;
import glib.key_file;
import glib.variant;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.paper_size;
import gtk.types;

/**
    A GtkPageSetup object stores the page size, orientation and margins.
    The idea is that you can get one of these from the page setup dialog
    and then pass it to the #GtkPrintOperation when printing.
    The benefit of splitting this out of the #GtkPrintSettings is that
    these affect the actual layout of the page, and thus need to be set
    long before user prints.
    
    ## Margins ## {#print-margins}
    The margins specified in this object are the “print margins”, i.e. the
    parts of the page that the printer cannot print on. These are different
    from the layout margins that a word processor uses; they are typically
    used to determine the minimal size for the layout
    margins.
    
    To obtain a #GtkPageSetup use [gtk.page_setup.PageSetup.new_] to get the defaults,
    or use [gtk.global.printRunPageSetupDialog] to show the page setup dialog
    and receive the resulting page setup.
    
    ## A page setup dialog
    
    ```c
    static GtkPrintSettings *settings = NULL;
    static GtkPageSetup *page_setup = NULL;
    
    static void
    do_page_setup (void)
    {
      GtkPageSetup *new_page_setup;
    
      if (settings == NULL)
        settings = gtk_print_settings_new ();
    
      new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
                                                        page_setup, settings);
    
      if (page_setup)
        g_object_unref (page_setup);
    
      page_setup = new_page_setup;
    }
    ```
    
    Printing support was added in GTK+ 2.10.
*/
class PageSetup : gobject.object.ObjectWrap
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
    return cast(void function())gtk_page_setup_get_type != &gidSymbolNotFound ? gtk_page_setup_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PageSetup self()
  {
    return this;
  }

  /**
      Creates a new #GtkPageSetup.
      Returns: a new #GtkPageSetup.
  */
  this()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_new();
    this(_cretval, Yes.Take);
  }

  /**
      Reads the page setup from the file file_name. Returns a
      new #GtkPageSetup object with the restored page setup,
      or null if an error occurred. See [gtk.page_setup.PageSetup.toFile].
  
      Params:
        fileName = the filename to read the page setup from
      Returns: the restored #GtkPageSetup
      Throws: [ErrorWrap]
  */
  static gtk.page_setup.PageSetup newFromFile(string fileName)
  {
    GtkPageSetup* _cretval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_page_setup_new_from_file(_fileName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Desrialize a page setup from an a{sv} variant in
      the format produced by [gtk.page_setup.PageSetup.toGvariant].
  
      Params:
        variant = an a{sv} #GVariant
      Returns: a new #GtkPageSetup object
  */
  static gtk.page_setup.PageSetup newFromGvariant(glib.variant.Variant variant)
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Reads the page setup from the group group_name in the key file
      key_file. Returns a new #GtkPageSetup object with the restored
      page setup, or null if an error occurred.
  
      Params:
        keyFile = the #GKeyFile to retrieve the page_setup from
        groupName = the name of the group in the key_file to read, or null
                       to use the default name “Page Setup”
      Returns: the restored #GtkPageSetup
      Throws: [ErrorWrap]
  */
  static gtk.page_setup.PageSetup newFromKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    GtkPageSetup* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_page_setup_new_from_key_file(keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copies a #GtkPageSetup.
      Returns: a copy of other
  */
  gtk.page_setup.PageSetup copy()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_copy(cast(GtkPageSetup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the bottom margin in units of unit.
  
      Params:
        unit = the unit for the return value
      Returns: the bottom margin
  */
  double getBottomMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_bottom_margin(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the left margin in units of unit.
  
      Params:
        unit = the unit for the return value
      Returns: the left margin
  */
  double getLeftMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_left_margin(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the page orientation of the #GtkPageSetup.
      Returns: the page orientation
  */
  gtk.types.PageOrientation getOrientation()
  {
    GtkPageOrientation _cretval;
    _cretval = gtk_page_setup_get_orientation(cast(GtkPageSetup*)this._cPtr);
    gtk.types.PageOrientation _retval = cast(gtk.types.PageOrientation)_cretval;
    return _retval;
  }

  /**
      Returns the page height in units of unit.
      
      Note that this function takes orientation and
      margins into consideration.
      See [gtk.page_setup.PageSetup.getPaperHeight].
  
      Params:
        unit = the unit for the return value
      Returns: the page height.
  */
  double getPageHeight(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_page_height(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Returns the page width in units of unit.
      
      Note that this function takes orientation and
      margins into consideration.
      See [gtk.page_setup.PageSetup.getPaperWidth].
  
      Params:
        unit = the unit for the return value
      Returns: the page width.
  */
  double getPageWidth(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_page_width(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Returns the paper height in units of unit.
      
      Note that this function takes orientation, but
      not margins into consideration.
      See [gtk.page_setup.PageSetup.getPageHeight].
  
      Params:
        unit = the unit for the return value
      Returns: the paper height.
  */
  double getPaperHeight(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_paper_height(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the paper size of the #GtkPageSetup.
      Returns: the paper size
  */
  gtk.paper_size.PaperSize getPaperSize()
  {
    GtkPaperSize* _cretval;
    _cretval = gtk_page_setup_get_paper_size(cast(GtkPageSetup*)this._cPtr);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the paper width in units of unit.
      
      Note that this function takes orientation, but
      not margins into consideration.
      See [gtk.page_setup.PageSetup.getPageWidth].
  
      Params:
        unit = the unit for the return value
      Returns: the paper width.
  */
  double getPaperWidth(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_paper_width(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the right margin in units of unit.
  
      Params:
        unit = the unit for the return value
      Returns: the right margin
  */
  double getRightMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_right_margin(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the top margin in units of unit.
  
      Params:
        unit = the unit for the return value
      Returns: the top margin
  */
  double getTopMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_top_margin(cast(GtkPageSetup*)this._cPtr, unit);
    return _retval;
  }

  /**
      Reads the page setup from the file file_name.
      See [gtk.page_setup.PageSetup.toFile].
  
      Params:
        fileName = the filename to read the page setup from
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool loadFile(string fileName)
  {
    bool _retval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_page_setup_load_file(cast(GtkPageSetup*)this._cPtr, _fileName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads the page setup from the group group_name in the key file
      key_file.
  
      Params:
        keyFile = the #GKeyFile to retrieve the page_setup from
        groupName = the name of the group in the key_file to read, or null
                       to use the default name “Page Setup”
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool loadKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_page_setup_load_key_file(cast(GtkPageSetup*)this._cPtr, keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the bottom margin of the #GtkPageSetup.
  
      Params:
        margin = the new bottom margin in units of unit
        unit = the units for margin
  */
  void setBottomMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_bottom_margin(cast(GtkPageSetup*)this._cPtr, margin, unit);
  }

  /**
      Sets the left margin of the #GtkPageSetup.
  
      Params:
        margin = the new left margin in units of unit
        unit = the units for margin
  */
  void setLeftMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_left_margin(cast(GtkPageSetup*)this._cPtr, margin, unit);
  }

  /**
      Sets the page orientation of the #GtkPageSetup.
  
      Params:
        orientation = a #GtkPageOrientation value
  */
  void setOrientation(gtk.types.PageOrientation orientation)
  {
    gtk_page_setup_set_orientation(cast(GtkPageSetup*)this._cPtr, orientation);
  }

  /**
      Sets the paper size of the #GtkPageSetup without
      changing the margins. See
      [gtk.page_setup.PageSetup.setPaperSizeAndDefaultMargins].
  
      Params:
        size = a #GtkPaperSize
  */
  void setPaperSize(gtk.paper_size.PaperSize size)
  {
    gtk_page_setup_set_paper_size(cast(GtkPageSetup*)this._cPtr, size ? cast(GtkPaperSize*)size._cPtr(No.Dup) : null);
  }

  /**
      Sets the paper size of the #GtkPageSetup and modifies
      the margins according to the new paper size.
  
      Params:
        size = a #GtkPaperSize
  */
  void setPaperSizeAndDefaultMargins(gtk.paper_size.PaperSize size)
  {
    gtk_page_setup_set_paper_size_and_default_margins(cast(GtkPageSetup*)this._cPtr, size ? cast(GtkPaperSize*)size._cPtr(No.Dup) : null);
  }

  /**
      Sets the right margin of the #GtkPageSetup.
  
      Params:
        margin = the new right margin in units of unit
        unit = the units for margin
  */
  void setRightMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_right_margin(cast(GtkPageSetup*)this._cPtr, margin, unit);
  }

  /**
      Sets the top margin of the #GtkPageSetup.
  
      Params:
        margin = the new top margin in units of unit
        unit = the units for margin
  */
  void setTopMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_top_margin(cast(GtkPageSetup*)this._cPtr, margin, unit);
  }

  /**
      This function saves the information from setup to file_name.
  
      Params:
        fileName = the file to save to
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool toFile(string fileName)
  {
    bool _retval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_page_setup_to_file(cast(GtkPageSetup*)this._cPtr, _fileName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Serialize page setup to an a{sv} variant.
      Returns: a new, floating, #GVariant
  */
  glib.variant.Variant toGvariant()
  {
    GVariant* _cretval;
    _cretval = gtk_page_setup_to_gvariant(cast(GtkPageSetup*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function adds the page setup from setup to key_file.
  
      Params:
        keyFile = the #GKeyFile to save the page setup to
        groupName = the group to add the settings to in key_file,
               or null to use the default name “Page Setup”
  */
  void toKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    gtk_page_setup_to_key_file(cast(GtkPageSetup*)this._cPtr, keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName);
  }
}
