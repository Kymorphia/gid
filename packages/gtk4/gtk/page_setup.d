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
    A [gtk.page_setup.PageSetup] object stores the page size, orientation and margins.
  
  The idea is that you can get one of these from the page setup dialog
  and then pass it to the [gtk.print_operation.PrintOperation] when printing.
  The benefit of splitting this out of the [gtk.print_settings.PrintSettings] is that
  these affect the actual layout of the page, and thus need to be set
  long before user prints.
  
  ## Margins
  
  The margins specified in this object are the “print margins”, i.e. the
  parts of the page that the printer cannot print on. These are different
  from the layout margins that a word processor uses; they are typically
  used to determine the minimal size for the layout margins.
  
  To obtain a [gtk.page_setup.PageSetup] use [gtk.page_setup.PageSetup.new_] to get the defaults,
  or use `func@Gtk.print_run_page_setup_dialog` to show the page setup dialog
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
*/
class PageSetup : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_page_setup_get_type != &gidSymbolNotFound ? gtk_page_setup_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.page_setup.PageSetup].
    Returns:     a new [gtk.page_setup.PageSetup].
  */
  this()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_new();
    this(_cretval, Yes.Take);
  }

  /**
      Reads the page setup from the file file_name.
    
    Returns a new [gtk.page_setup.PageSetup] object with the restored
    page setup, or null if an error occurred.
    See [gtk.page_setup.PageSetup.toFile].
    Params:
      fileName =       the filename to read the page setup from
    Returns:     the restored [gtk.page_setup.PageSetup]
  */
  static gtk.page_setup.PageSetup newFromFile(string fileName)
  {
    GtkPageSetup* _cretval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_page_setup_new_from_file(_fileName, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Desrialize a page setup from an a{sv} variant.
    
    The variant must be in the format produced by
    [gtk.page_setup.PageSetup.toGvariant].
    Params:
      variant =       an a{sv} [glib.variant.VariantG]
    Returns:     a new [gtk.page_setup.PageSetup] object
  */
  static gtk.page_setup.PageSetup newFromGvariant(glib.variant.VariantG variant)
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_new_from_gvariant(variant ? cast(VariantC*)variant.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Reads the page setup from the group group_name in the key file
    key_file.
    
    Returns a new [gtk.page_setup.PageSetup] object with the restored
    page setup, or null if an error occurred.
    Params:
      keyFile =       the [glib.key_file.KeyFile] to retrieve the page_setup from
      groupName =       the name of the group in the key_file to read
           to use the default name “Page Setup”
    Returns:     the restored [gtk.page_setup.PageSetup]
  */
  static gtk.page_setup.PageSetup newFromKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    GtkPageSetup* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_page_setup_new_from_key_file(keyFile ? cast(GKeyFile*)keyFile.cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copies a [gtk.page_setup.PageSetup].
    Returns:     a copy of other
  */
  gtk.page_setup.PageSetup copy()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_copy(cast(GtkPageSetup*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the bottom margin in units of unit.
    Params:
      unit =       the unit for the return value
    Returns:     the bottom margin
  */
  double getBottomMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_bottom_margin(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Gets the left margin in units of unit.
    Params:
      unit =       the unit for the return value
    Returns:     the left margin
  */
  double getLeftMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_left_margin(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Gets the page orientation of the [gtk.page_setup.PageSetup].
    Returns:     the page orientation
  */
  gtk.types.PageOrientation getOrientation()
  {
    GtkPageOrientation _cretval;
    _cretval = gtk_page_setup_get_orientation(cast(GtkPageSetup*)cPtr);
    gtk.types.PageOrientation _retval = cast(gtk.types.PageOrientation)_cretval;
    return _retval;
  }

  /**
      Returns the page height in units of unit.
    
    Note that this function takes orientation
    and margins into consideration.
    See [gtk.page_setup.PageSetup.getPaperHeight].
    Params:
      unit =       the unit for the return value
    Returns:     the page height.
  */
  double getPageHeight(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_page_height(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Returns the page width in units of unit.
    
    Note that this function takes orientation
    and margins into consideration.
    See [gtk.page_setup.PageSetup.getPaperWidth].
    Params:
      unit =       the unit for the return value
    Returns:     the page width.
  */
  double getPageWidth(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_page_width(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Returns the paper height in units of unit.
    
    Note that this function takes orientation,
    but not margins into consideration.
    See [gtk.page_setup.PageSetup.getPageHeight].
    Params:
      unit =       the unit for the return value
    Returns:     the paper height.
  */
  double getPaperHeight(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_paper_height(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Gets the paper size of the [gtk.page_setup.PageSetup].
    Returns:     the paper size
  */
  gtk.paper_size.PaperSize getPaperSize()
  {
    GtkPaperSize* _cretval;
    _cretval = gtk_page_setup_get_paper_size(cast(GtkPageSetup*)cPtr);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the paper width in units of unit.
    
    Note that this function takes orientation,
    but not margins into consideration.
    See [gtk.page_setup.PageSetup.getPageWidth].
    Params:
      unit =       the unit for the return value
    Returns:     the paper width.
  */
  double getPaperWidth(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_paper_width(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Gets the right margin in units of unit.
    Params:
      unit =       the unit for the return value
    Returns:     the right margin
  */
  double getRightMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_right_margin(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Gets the top margin in units of unit.
    Params:
      unit =       the unit for the return value
    Returns:     the top margin
  */
  double getTopMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_page_setup_get_top_margin(cast(GtkPageSetup*)cPtr, unit);
    return _retval;
  }

  /**
      Reads the page setup from the file file_name.
    
    See [gtk.page_setup.PageSetup.toFile].
    Params:
      fileName =       the filename to read the page setup from
    Returns:     true on success
  */
  bool loadFile(string fileName)
  {
    bool _retval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_page_setup_load_file(cast(GtkPageSetup*)cPtr, _fileName, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Reads the page setup from the group group_name in the key file
    key_file.
    Params:
      keyFile =       the [glib.key_file.KeyFile] to retrieve the page_setup from
      groupName =       the name of the group in the key_file to read
          to use the default name “Page Setup”
    Returns:     true on success
  */
  bool loadKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_page_setup_load_key_file(cast(GtkPageSetup*)cPtr, keyFile ? cast(GKeyFile*)keyFile.cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets the bottom margin of the [gtk.page_setup.PageSetup].
    Params:
      margin =       the new bottom margin in units of unit
      unit =       the units for margin
  */
  void setBottomMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_bottom_margin(cast(GtkPageSetup*)cPtr, margin, unit);
  }

  /**
      Sets the left margin of the [gtk.page_setup.PageSetup].
    Params:
      margin =       the new left margin in units of unit
      unit =       the units for margin
  */
  void setLeftMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_left_margin(cast(GtkPageSetup*)cPtr, margin, unit);
  }

  /**
      Sets the page orientation of the [gtk.page_setup.PageSetup].
    Params:
      orientation =       a [gtk.types.PageOrientation] value
  */
  void setOrientation(gtk.types.PageOrientation orientation)
  {
    gtk_page_setup_set_orientation(cast(GtkPageSetup*)cPtr, orientation);
  }

  /**
      Sets the paper size of the [gtk.page_setup.PageSetup] without
    changing the margins.
    
    See [gtk.page_setup.PageSetup.setPaperSizeAndDefaultMargins].
    Params:
      size =       a [gtk.paper_size.PaperSize]
  */
  void setPaperSize(gtk.paper_size.PaperSize size)
  {
    gtk_page_setup_set_paper_size(cast(GtkPageSetup*)cPtr, size ? cast(GtkPaperSize*)size.cPtr(No.Dup) : null);
  }

  /**
      Sets the paper size of the [gtk.page_setup.PageSetup] and modifies
    the margins according to the new paper size.
    Params:
      size =       a [gtk.paper_size.PaperSize]
  */
  void setPaperSizeAndDefaultMargins(gtk.paper_size.PaperSize size)
  {
    gtk_page_setup_set_paper_size_and_default_margins(cast(GtkPageSetup*)cPtr, size ? cast(GtkPaperSize*)size.cPtr(No.Dup) : null);
  }

  /**
      Sets the right margin of the [gtk.page_setup.PageSetup].
    Params:
      margin =       the new right margin in units of unit
      unit =       the units for margin
  */
  void setRightMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_right_margin(cast(GtkPageSetup*)cPtr, margin, unit);
  }

  /**
      Sets the top margin of the [gtk.page_setup.PageSetup].
    Params:
      margin =       the new top margin in units of unit
      unit =       the units for margin
  */
  void setTopMargin(double margin, gtk.types.Unit unit)
  {
    gtk_page_setup_set_top_margin(cast(GtkPageSetup*)cPtr, margin, unit);
  }

  /**
      This function saves the information from setup to file_name.
    Params:
      fileName =       the file to save to
    Returns:     true on success
  */
  bool toFile(string fileName)
  {
    bool _retval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_page_setup_to_file(cast(GtkPageSetup*)cPtr, _fileName, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Serialize page setup to an a{sv} variant.
    Returns:     a new, floating, [glib.variant.VariantG]
  */
  glib.variant.VariantG toGvariant()
  {
    VariantC* _cretval;
    _cretval = gtk_page_setup_to_gvariant(cast(GtkPageSetup*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function adds the page setup from setup to key_file.
    Params:
      keyFile =       the [glib.key_file.KeyFile] to save the page setup to
      groupName =       the group to add the settings to in key_file,
          or null to use the default name “Page Setup”
  */
  void toKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    gtk_page_setup_to_key_file(cast(GtkPageSetup*)cPtr, keyFile ? cast(GKeyFile*)keyFile.cPtr(No.Dup) : null, _groupName);
  }
}
