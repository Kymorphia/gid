/// Module for [PaperSize] class
module gtk.paper_size;

import gid.gid;
import glib.error;
import glib.key_file;
import glib.variant;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    GtkPaperSize handles paper sizes. It uses the standard called
    [PWG 5101.1-2002 PWG: Standard for Media Standardized Names](http://www.pwg.org/standards.html)
    to name the paper sizes (and to get the data for the page sizes).
    In addition to standard paper sizes, GtkPaperSize allows to
    construct custom paper sizes with arbitrary dimensions.
    
    The #GtkPaperSize object stores not only the dimensions (width
    and height) of a paper size and its name, it also provides
    default [print margins][print-margins].
    
    Printing support has been added in GTK+ 2.10.
*/
class PaperSize : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_paper_size_get_type != &gidSymbolNotFound ? gtk_paper_size_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PaperSize self()
  {
    return this;
  }

  /**
      Creates a new #GtkPaperSize object by parsing a
      [PWG 5101.1-2002](ftp://ftp.pwg.org/pub/pwg/candidates/cs-pwgmsn10-20020226-5101.1.pdf)
      paper name.
      
      If name is null, the default paper size is returned,
      see [gtk.paper_size.PaperSize.getDefault].
  
      Params:
        name = a paper size name, or null
      Returns: a new #GtkPaperSize, use [gtk.paper_size.PaperSize.free]
        to free it
  */
  this(string name = null)
  {
    GtkPaperSize* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_paper_size_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkPaperSize object with the
      given parameters.
  
      Params:
        name = the paper name
        displayName = the human-readable name
        width = the paper width, in units of unit
        height = the paper height, in units of unit
        unit = the unit for width and height. not [gtk.types.Unit.None].
      Returns: a new #GtkPaperSize object, use [gtk.paper_size.PaperSize.free]
        to free it
  */
  static gtk.paper_size.PaperSize newCustom(string name, string displayName, double width, double height, gtk.types.Unit unit)
  {
    GtkPaperSize* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _displayName = displayName.toCString(No.Alloc);
    _cretval = gtk_paper_size_new_custom(_name, _displayName, width, height, unit);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Deserialize a paper size from an a{sv} variant in
      the format produced by [gtk.paper_size.PaperSize.toGvariant].
  
      Params:
        variant = an a{sv} #GVariant
      Returns: a new #GtkPaperSize object
  */
  static gtk.paper_size.PaperSize newFromGvariant(glib.variant.Variant variant)
  {
    GtkPaperSize* _cretval;
    _cretval = gtk_paper_size_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GtkPaperSize object by using
      IPP information.
      
      If ipp_name is not a recognized paper name,
      width and height are used to
      construct a custom #GtkPaperSize object.
  
      Params:
        ippName = an IPP paper name
        width = the paper width, in points
        height = the paper height in points
      Returns: a new #GtkPaperSize, use [gtk.paper_size.PaperSize.free]
        to free it
  */
  static gtk.paper_size.PaperSize newFromIpp(string ippName, double width, double height)
  {
    GtkPaperSize* _cretval;
    const(char)* _ippName = ippName.toCString(No.Alloc);
    _cretval = gtk_paper_size_new_from_ipp(_ippName, width, height);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reads a paper size from the group group_name in the key file
      key_file.
  
      Params:
        keyFile = the #GKeyFile to retrieve the papersize from
        groupName = the name of the group in the key file to read,
              or null to read the first group
      Returns: a new #GtkPaperSize object with the restored
            paper size, or null if an error occurred
      Throws: [ErrorWrap]
  */
  static gtk.paper_size.PaperSize newFromKeyFile(glib.key_file.KeyFile keyFile, string groupName = null)
  {
    GtkPaperSize* _cretval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_paper_size_new_from_key_file(keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GtkPaperSize object by using
      PPD information.
      
      If ppd_name is not a recognized PPD paper name,
      ppd_display_name, width and height are used to
      construct a custom #GtkPaperSize object.
  
      Params:
        ppdName = a PPD paper name
        ppdDisplayName = the corresponding human-readable name
        width = the paper width, in points
        height = the paper height in points
      Returns: a new #GtkPaperSize, use [gtk.paper_size.PaperSize.free]
        to free it
  */
  static gtk.paper_size.PaperSize newFromPpd(string ppdName, string ppdDisplayName, double width, double height)
  {
    GtkPaperSize* _cretval;
    const(char)* _ppdName = ppdName.toCString(No.Alloc);
    const(char)* _ppdDisplayName = ppdDisplayName.toCString(No.Alloc);
    _cretval = gtk_paper_size_new_from_ppd(_ppdName, _ppdDisplayName, width, height);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies an existing #GtkPaperSize.
      Returns: a copy of other
  */
  gtk.paper_size.PaperSize copy()
  {
    GtkPaperSize* _cretval;
    _cretval = gtk_paper_size_copy(cast(GtkPaperSize*)this._cPtr);
    auto _retval = _cretval ? new gtk.paper_size.PaperSize(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the default bottom margin for the #GtkPaperSize.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the default bottom margin
  */
  double getDefaultBottomMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_default_bottom_margin(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the default left margin for the #GtkPaperSize.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the default left margin
  */
  double getDefaultLeftMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_default_left_margin(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the default right margin for the #GtkPaperSize.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the default right margin
  */
  double getDefaultRightMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_default_right_margin(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the default top margin for the #GtkPaperSize.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the default top margin
  */
  double getDefaultTopMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_default_top_margin(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the human-readable name of the #GtkPaperSize.
      Returns: the human-readable name of size
  */
  string getDisplayName()
  {
    const(char)* _cretval;
    _cretval = gtk_paper_size_get_display_name(cast(GtkPaperSize*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the paper height of the #GtkPaperSize, in
      units of unit.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the paper height
  */
  double getHeight(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_height(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the name of the #GtkPaperSize.
      Returns: the name of size
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_paper_size_get_name(cast(GtkPaperSize*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the PPD name of the #GtkPaperSize, which
      may be null.
      Returns: the PPD name of size
  */
  string getPpdName()
  {
    const(char)* _cretval;
    _cretval = gtk_paper_size_get_ppd_name(cast(GtkPaperSize*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the paper width of the #GtkPaperSize, in
      units of unit.
  
      Params:
        unit = the unit for the return value, not [gtk.types.Unit.None]
      Returns: the paper width
  */
  double getWidth(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_paper_size_get_width(cast(GtkPaperSize*)this._cPtr, unit);
    return _retval;
  }

  /**
      Returns true if size is not a standard paper size.
      Returns: whether size is a custom paper size.
  */
  bool isCustom()
  {
    bool _retval;
    _retval = cast(bool)gtk_paper_size_is_custom(cast(GtkPaperSize*)this._cPtr);
    return _retval;
  }

  /**
      Compares two #GtkPaperSize objects.
  
      Params:
        size2 = another #GtkPaperSize object
      Returns: true, if size1 and size2
        represent the same paper size
  */
  bool isEqual(gtk.paper_size.PaperSize size2)
  {
    bool _retval;
    _retval = cast(bool)gtk_paper_size_is_equal(cast(GtkPaperSize*)this._cPtr, size2 ? cast(GtkPaperSize*)size2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if size is an IPP standard paper size.
      Returns: whether size is not an IPP custom paper size.
  */
  bool isIpp()
  {
    bool _retval;
    _retval = cast(bool)gtk_paper_size_is_ipp(cast(GtkPaperSize*)this._cPtr);
    return _retval;
  }

  /**
      Changes the dimensions of a size to width x height.
  
      Params:
        width = the new width in units of unit
        height = the new height in units of unit
        unit = the unit for width and height
  */
  void setSize(double width, double height, gtk.types.Unit unit)
  {
    gtk_paper_size_set_size(cast(GtkPaperSize*)this._cPtr, width, height, unit);
  }

  /**
      Serialize a paper size to an a{sv} variant.
      Returns: a new, floating, #GVariant
  */
  glib.variant.Variant toGvariant()
  {
    GVariant* _cretval;
    _cretval = gtk_paper_size_to_gvariant(cast(GtkPaperSize*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function adds the paper size from size to key_file.
  
      Params:
        keyFile = the #GKeyFile to save the paper size to
        groupName = the group to add the settings to in key_file
  */
  void toKeyFile(glib.key_file.KeyFile keyFile, string groupName)
  {
    const(char)* _groupName = groupName.toCString(No.Alloc);
    gtk_paper_size_to_key_file(cast(GtkPaperSize*)this._cPtr, keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName);
  }

  /**
      Returns the name of the default paper size, which
      depends on the current locale.
      Returns: the name of the default paper size. The string
        is owned by GTK+ and should not be modified.
  */
  static string getDefault()
  {
    const(char)* _cretval;
    _cretval = gtk_paper_size_get_default();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Creates a list of known paper sizes.
  
      Params:
        includeCustom = whether to include custom paper sizes
              as defined in the page setup dialog
      Returns: a newly allocated list of newly
           allocated #GtkPaperSize objects
  */
  static gtk.paper_size.PaperSize[] getPaperSizes(bool includeCustom)
  {
    GList* _cretval;
    _cretval = gtk_paper_size_get_paper_sizes(includeCustom);
    auto _retval = gListToD!(gtk.paper_size.PaperSize, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
