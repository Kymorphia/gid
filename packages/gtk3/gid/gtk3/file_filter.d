/// Module for [FileFilter] class
module gid.gtk3.file_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.file_filter_info;
import gid.gtk3.types;

/**
    A GtkFileFilter can be used to restrict the files being shown in a
    #GtkFileChooser. Files can be filtered based on their name (with
    [gid.gtk4.file_filter.FileFilter.addPattern]), on their mime type (with
    [gid.gtk4.file_filter.FileFilter.addMimeType]), or by a custom filter function
    (with [gid.gtk3.file_filter.FileFilter.addCustom]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that #GtkFileFilter allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkFileChooser,
    see [gid.gtk4.file_chooser.FileChooser.addFilter], but it is also possible
    to manually use a filter on a file with [gid.gtk3.file_filter.FileFilter.filter].
    
    # GtkFileFilter as GtkBuildable
    
    The GtkFileFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>` or `<pattern>` has the same effect as as calling
    [gid.gtk4.file_filter.FileFilter.addMimeType] or [gid.gtk4.file_filter.FileFilter.addPattern].
    
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
class FileFilter : gid.gobject2.initially_unowned.InitiallyUnowned, gid.gtk3.buildable.Buildable
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
    return cast(void function())gtk_file_filter_get_type != &gidSymbolNotFound ? gtk_file_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFileFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.file_filter.FileFilter]
      Returns: New builder object
  */
  static FileFilterGidBuilder builder() nothrow
  {
    return new FileFilterGidBuilder;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkFileFilter with no rules added to it.
      Such a filter doesn’t accept any files, so is not
      particularly useful until you add rules with
      [gid.gtk4.file_filter.FileFilter.addMimeType], [gid.gtk4.file_filter.FileFilter.addPattern],
      or [gid.gtk3.file_filter.FileFilter.addCustom]. To create a filter
      that accepts any file, use:
      ```c
      GtkFileFilter *filter = gtk_file_filter_new ();
      gtk_file_filter_add_pattern (filter, "*");
      ```
      Returns: a new #GtkFileFilter
  */
  this() nothrow
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new();
    this(_cretval, No.Take);
  }

  /**
      Deserialize a file filter from an a{sv} variant in
      the format produced by [gid.gtk4.file_filter.FileFilter.toGvariant].
  
      Params:
        variant = an a{sv} #GVariant
      Returns: a new #GtkFileFilter object
  */
  static gid.gtk3.file_filter.FileFilter newFromGvariant(gid.glib2.variant.Variant variant) nothrow
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, Yes.Take);
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
  void addCustom(gid.gtk3.types.FileFilterFlags needed, gid.gtk3.types.FileFilterFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(const(GtkFileFilterInfo)* filterInfo, void* data) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.FileFilterFunc*)data;
      auto _filterInfo = filterInfo ? new gid.gtk3.file_filter_info.FileFilterInfo(cast(void*)filterInfo, null) : null;

      try
      {
        _dretval = (*_dlg)(_filterInfo);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.FileFilterFunc");
      }
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
  void addMimeType(string mimeType) nothrow
  {
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    gtk_file_filter_add_mime_type(cast(GtkFileFilter*)this._cPtr, _mimeType);
  }

  /**
      Adds a rule allowing a shell style glob to a filter.
  
      Params:
        pattern = a shell style glob
  */
  void addPattern(string pattern) nothrow
  {
    const(char)* _pattern = pattern.toCString!(No.Malloc, No.Nullable);
    gtk_file_filter_add_pattern(cast(GtkFileFilter*)this._cPtr, _pattern);
  }

  /**
      Adds a rule allowing image files in the formats supported
      by GdkPixbuf.
  */
  void addPixbufFormats() nothrow
  {
    gtk_file_filter_add_pixbuf_formats(cast(GtkFileFilter*)this._cPtr);
  }

  /**
      Tests whether a file should be displayed according to filter.
      The #GtkFileFilterInfo filter_info should include
      the fields returned from [gid.gtk3.file_filter.FileFilter.getNeeded].
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkFileChooser.
  
      Params:
        filterInfo = a #GtkFileFilterInfo containing information
           about a file.
      Returns: true if the file should be displayed
  */
  bool filter(gid.gtk3.file_filter_info.FileFilterInfo filterInfo) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_filter_filter(cast(GtkFileFilter*)this._cPtr, filterInfo ? cast(const(GtkFileFilterInfo)*)filterInfo._cPtr : null);
    return _retval;
  }

  /**
      Gets the human-readable name for the filter. See [gid.gtk4.file_filter.FileFilter.setName].
      Returns: The human-readable name of the filter,
          or null. This value is owned by GTK+ and must not
          be modified or freed.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_filter_get_name(cast(GtkFileFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the fields that need to be filled in for the #GtkFileFilterInfo
      passed to [gid.gtk3.file_filter.FileFilter.filter]
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkFileChooser.
      Returns: bitfield of flags indicating needed fields when
          calling [gid.gtk3.file_filter.FileFilter.filter]
  */
  gid.gtk3.types.FileFilterFlags getNeeded() nothrow
  {
    GtkFileFilterFlags _cretval;
    _cretval = gtk_file_filter_get_needed(cast(GtkFileFilter*)this._cPtr);
    gid.gtk3.types.FileFilterFlags _retval = cast(gid.gtk3.types.FileFilterFlags)_cretval;
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
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_file_filter_set_name(cast(GtkFileFilter*)this._cPtr, _name);
  }

  /**
      Serialize a file filter to an a{sv} variant.
      Returns: a new, floating, #GVariant
  */
  gid.glib2.variant.Variant toGvariant() nothrow
  {
    GVariant* _cretval;
    _cretval = gtk_file_filter_to_gvariant(cast(GtkFileFilter*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.file_filter.FileFilter]
class FileFilterGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.file_filter.FileFilter]
final class FileFilterGidBuilder : FileFilterGidBuilderImpl!FileFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileFilter build() nothrow
  {
    return new FileFilter(cast(void*)createGObject(FileFilter._getGType), Yes.Take);
  }
}
