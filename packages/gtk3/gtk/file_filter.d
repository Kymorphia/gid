/// Module for [FileFilter] class
module gtk.file_filter;

import gid.gid;
import glib.variant;
import gobject.initially_unowned;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_filter_info;
import gtk.types;

/**
    A GtkFileFilter can be used to restrict the files being shown in a
    #GtkFileChooser. Files can be filtered based on their name (with
    [gtk.file_filter.FileFilter.addPattern]), on their mime type (with
    [gtk.file_filter.FileFilter.addMimeType]), or by a custom filter function
    (with [gtk.file_filter.FileFilter.addCustom]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that #GtkFileFilter allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkFileChooser,
    see [gtk.file_chooser.FileChooser.addFilter], but it is also possible
    to manually use a filter on a file with [gtk.file_filter.FileFilter.filter].
    
    # GtkFileFilter as GtkBuildable
    
    The GtkFileFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>` or `<pattern>` has the same effect as as calling
    [gtk.file_filter.FileFilter.addMimeType] or [gtk.file_filter.FileFilter.addPattern].
    
    An example of a UI definition fragment specifying GtkFileFilter
    rules:
    
    ```xml
    <object class="GtkFileFilter">
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/ *</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
        <pattern>*.png</pattern>
      </patterns>
    </object>
    ```
*/
class FileFilter : gobject.initially_unowned.InitiallyUnowned, gtk.buildable.Buildable
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
    return cast(void function())gtk_file_filter_get_type != &gidSymbolNotFound ? gtk_file_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileFilter self()
  {
    return this;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkFileFilter with no rules added to it.
      Such a filter doesn’t accept any files, so is not
      particularly useful until you add rules with
      [gtk.file_filter.FileFilter.addMimeType], [gtk.file_filter.FileFilter.addPattern],
      or [gtk.file_filter.FileFilter.addCustom]. To create a filter
      that accepts any file, use:
      ```c
      GtkFileFilter *filter = gtk_file_filter_new ();
      gtk_file_filter_add_pattern (filter, "*");
      ```
      Returns: a new #GtkFileFilter
  */
  this()
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new();
    this(_cretval, No.Take);
  }

  /**
      Deserialize a file filter from an a{sv} variant in
      the format produced by [gtk.file_filter.FileFilter.toGvariant].
  
      Params:
        variant = an a{sv} #GVariant
      Returns: a new #GtkFileFilter object
  */
  static gtk.file_filter.FileFilter newFromGvariant(glib.variant.Variant variant)
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds rule to a filter that allows files based on a custom callback
      function. The bitfield needed which is passed in provides information
      about what sorts of information that the filter function needs;
      this allows GTK+ to avoid retrieving expensive information when
      it isn’t needed by the filter.
  
      Params:
        needed = bitfield of flags indicating the information that the custom
                   filter function needs.
        func = callback function; if the function returns true, then
            the file will be displayed.
  */
  void addCustom(gtk.types.FileFilterFlags needed, gtk.types.FileFilterFunc func)
  {
    extern(C) gboolean _funcCallback(const(GtkFileFilterInfo)* filterInfo, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.FileFilterFunc*)data;

      _dretval = (*_dlg)(filterInfo ? new gtk.file_filter_info.FileFilterInfo(cast(void*)filterInfo, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_file_filter_add_custom(cast(GtkFileFilter*)this._cPtr, needed, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Adds a rule allowing a given mime type to filter.
  
      Params:
        mimeType = name of a MIME type
  */
  void addMimeType(string mimeType)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gtk_file_filter_add_mime_type(cast(GtkFileFilter*)this._cPtr, _mimeType);
  }

  /**
      Adds a rule allowing a shell style glob to a filter.
  
      Params:
        pattern = a shell style glob
  */
  void addPattern(string pattern)
  {
    const(char)* _pattern = pattern.toCString(No.Alloc);
    gtk_file_filter_add_pattern(cast(GtkFileFilter*)this._cPtr, _pattern);
  }

  /**
      Adds a rule allowing image files in the formats supported
      by GdkPixbuf.
  */
  void addPixbufFormats()
  {
    gtk_file_filter_add_pixbuf_formats(cast(GtkFileFilter*)this._cPtr);
  }

  /**
      Tests whether a file should be displayed according to filter.
      The #GtkFileFilterInfo filter_info should include
      the fields returned from [gtk.file_filter.FileFilter.getNeeded].
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkFileChooser.
  
      Params:
        filterInfo = a #GtkFileFilterInfo containing information
           about a file.
      Returns: true if the file should be displayed
  */
  bool filter(gtk.file_filter_info.FileFilterInfo filterInfo)
  {
    bool _retval;
    _retval = cast(bool)gtk_file_filter_filter(cast(GtkFileFilter*)this._cPtr, filterInfo ? cast(const(GtkFileFilterInfo)*)filterInfo._cPtr : null);
    return _retval;
  }

  /**
      Gets the human-readable name for the filter. See [gtk.file_filter.FileFilter.setName].
      Returns: The human-readable name of the filter,
          or null. This value is owned by GTK+ and must not
          be modified or freed.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_file_filter_get_name(cast(GtkFileFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the fields that need to be filled in for the #GtkFileFilterInfo
      passed to [gtk.file_filter.FileFilter.filter]
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkFileChooser.
      Returns: bitfield of flags indicating needed fields when
          calling [gtk.file_filter.FileFilter.filter]
  */
  gtk.types.FileFilterFlags getNeeded()
  {
    GtkFileFilterFlags _cretval;
    _cretval = gtk_file_filter_get_needed(cast(GtkFileFilter*)this._cPtr);
    gtk.types.FileFilterFlags _retval = cast(gtk.types.FileFilterFlags)_cretval;
    return _retval;
  }

  /**
      Sets the human-readable name of the filter; this is the string
      that will be displayed in the file selector user interface if
      there is a selectable list of filters.
  
      Params:
        name = the human-readable-name for the filter, or null
            to remove any existing name.
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_file_filter_set_name(cast(GtkFileFilter*)this._cPtr, _name);
  }

  /**
      Serialize a file filter to an a{sv} variant.
      Returns: a new, floating, #GVariant
  */
  glib.variant.Variant toGvariant()
  {
    GVariant* _cretval;
    _cretval = gtk_file_filter_to_gvariant(cast(GtkFileFilter*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }
}
