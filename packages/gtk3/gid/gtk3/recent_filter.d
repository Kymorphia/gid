/// Module for [RecentFilter] class
module gid.gtk3.recent_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.recent_filter_info;
import gid.gtk3.types;

/**
    A #GtkRecentFilter can be used to restrict the files being shown
    in a #GtkRecentChooser.  Files can be filtered based on their name
    (with [gid.gtk3.recent_filter.RecentFilter.addPattern]), on their mime type (with
    [gid.gtk4.file_filter.FileFilter.addMimeType]), on the application that has
    registered them (with [gid.gtk3.recent_filter.RecentFilter.addApplication]), or by
    a custom filter function (with [gid.gtk3.recent_filter.RecentFilter.addCustom]).
    
    Filtering by mime type handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of text/plain.
    Note that #GtkRecentFilter allows wildcards for the subtype of a
    mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkRecentChooser,
    see [gid.gtk3.recent_chooser.RecentChooser.addFilter], but it is also possible to
    manually use a filter on a file with [gid.gtk3.recent_filter.RecentFilter.filter].
    
    Recently used files are supported since GTK+ 2.10.
    
    ## GtkRecentFilter as GtkBuildable
    
    The GtkRecentFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>`, `<pattern>` or `<application>` has the same effect as
    calling [gid.gtk3.recent_filter.RecentFilter.addMimeType],
    [gid.gtk3.recent_filter.RecentFilter.addPattern] or [gid.gtk3.recent_filter.RecentFilter.addApplication].
    
    An example of a UI definition fragment specifying [gid.gtk3.recent_filter.RecentFilter]
    rules:
    
    ```xml
    <object class="GtkRecentFilter">
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/png</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
        <pattern>*.png</pattern>
      </patterns>
      <applications>
        <application>gimp</application>
        <application>gedit</application>
        <application>glade</application>
      </applications>
    </object>
    ```
*/
class RecentFilter : gid.gobject2.initially_unowned.InitiallyUnowned, gid.gtk3.buildable.Buildable
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
    return cast(void function())gtk_recent_filter_get_type != &gidSymbolNotFound ? gtk_recent_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRecentFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.recent_filter.RecentFilter]
      Returns: New builder object
  */
  static RecentFilterGidBuilder builder() nothrow
  {
    return new RecentFilterGidBuilder;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkRecentFilter with no rules added to it.
      Such filter does not accept any recently used resources, so is not
      particularly useful until you add rules with
      [gid.gtk3.recent_filter.RecentFilter.addPattern], [gid.gtk3.recent_filter.RecentFilter.addMimeType],
      [gid.gtk3.recent_filter.RecentFilter.addApplication], [gid.gtk3.recent_filter.RecentFilter.addAge].
      To create a filter that accepts any recently used resource, use:
      ```c
      GtkRecentFilter *filter = gtk_recent_filter_new ();
      gtk_recent_filter_add_pattern (filter, "*");
      ```
      Returns: a new #GtkRecentFilter
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkRecentFilter* _cretval;
      _cretval = gtk_recent_filter_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a rule that allows resources based on their age - that is, the number
      of days elapsed since they were last modified.
  
      Params:
        days = number of days
  */
  void addAge(int days) nothrow
  {
    gtk_recent_filter_add_age(cast(GtkRecentFilter*)this._cPtr, days);
  }

  /**
      Adds a rule that allows resources based on the name of the application
      that has registered them.
  
      Params:
        application = an application name
  */
  void addApplication(string application) nothrow
  {
    const(char)* _application = application.toCString!(No.Malloc, No.Nullable);
    gtk_recent_filter_add_application(cast(GtkRecentFilter*)this._cPtr, _application);
  }

  /**
      Adds a rule to a filter that allows resources based on a custom callback
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
  void addCustom(gid.gtk3.types.RecentFilterFlags needed, gid.gtk3.types.RecentFilterFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(const(GtkRecentFilterInfo)* filterInfo, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.RecentFilterFunc*)userData;
      auto _filterInfo = filterInfo ? new gid.gtk3.recent_filter_info.RecentFilterInfo(cast(void*)filterInfo, null) : null;

      try
      {
        _dretval = (*_dlg)(_filterInfo);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.RecentFilterFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_recent_filter_add_custom(cast(GtkRecentFilter*)this._cPtr, needed, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Adds a rule that allows resources based on the name of the group
      to which they belong
  
      Params:
        group = a group name
  */
  void addGroup(string group) nothrow
  {
    const(char)* _group = group.toCString!(No.Malloc, No.Nullable);
    gtk_recent_filter_add_group(cast(GtkRecentFilter*)this._cPtr, _group);
  }

  /**
      Adds a rule that allows resources based on their registered MIME type.
  
      Params:
        mimeType = a MIME type
  */
  void addMimeType(string mimeType) nothrow
  {
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    gtk_recent_filter_add_mime_type(cast(GtkRecentFilter*)this._cPtr, _mimeType);
  }

  /**
      Adds a rule that allows resources based on a pattern matching their
      display name.
  
      Params:
        pattern = a file pattern
  */
  void addPattern(string pattern) nothrow
  {
    const(char)* _pattern = pattern.toCString!(No.Malloc, No.Nullable);
    gtk_recent_filter_add_pattern(cast(GtkRecentFilter*)this._cPtr, _pattern);
  }

  /**
      Adds a rule allowing image files in the formats supported
      by GdkPixbuf.
  */
  void addPixbufFormats() nothrow
  {
    gtk_recent_filter_add_pixbuf_formats(cast(GtkRecentFilter*)this._cPtr);
  }

  /**
      Tests whether a file should be displayed according to filter.
      The #GtkRecentFilterInfo filter_info should include
      the fields returned from [gid.gtk3.recent_filter.RecentFilter.getNeeded], and
      must set the #GtkRecentFilterInfo.contains field of filter_info
      to indicate which fields have been set.
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkRecentChooser.
  
      Params:
        filterInfo = a #GtkRecentFilterInfo containing information
            about a recently used resource
      Returns: true if the file should be displayed
  */
  bool filter(gid.gtk3.recent_filter_info.RecentFilterInfo filterInfo) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_filter_filter(cast(GtkRecentFilter*)this._cPtr, filterInfo ? cast(const(GtkRecentFilterInfo)*)filterInfo._cPtr : null);
    return _retval;
  }

  /**
      Gets the human-readable name for the filter.
      See [gid.gtk3.recent_filter.RecentFilter.setName].
      Returns: the name of the filter, or null.  The returned string
          is owned by the filter object and should not be freed.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_recent_filter_get_name(cast(GtkRecentFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the fields that need to be filled in for the #GtkRecentFilterInfo
      passed to [gid.gtk3.recent_filter.RecentFilter.filter]
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkRecentChooser.
      Returns: bitfield of flags indicating needed fields when
          calling [gid.gtk3.recent_filter.RecentFilter.filter]
  */
  gid.gtk3.types.RecentFilterFlags getNeeded() nothrow
  {
    GtkRecentFilterFlags _cretval;
    _cretval = gtk_recent_filter_get_needed(cast(GtkRecentFilter*)this._cPtr);
    gid.gtk3.types.RecentFilterFlags _retval = cast(gid.gtk3.types.RecentFilterFlags)_cretval;
    return _retval;
  }

  /**
      Sets the human-readable name of the filter; this is the string
      that will be displayed in the recently used resources selector
      user interface if there is a selectable list of filters.
  
      Params:
        name = then human readable name of filter
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_recent_filter_set_name(cast(GtkRecentFilter*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.gtk3.recent_filter.RecentFilter]
class RecentFilterGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.recent_filter.RecentFilter]
final class RecentFilterGidBuilder : RecentFilterGidBuilderImpl!RecentFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecentFilter build() nothrow
  {
    return new RecentFilter(cast(void*)createGObject(RecentFilter._getGType), Yes.Take);
  }
}
