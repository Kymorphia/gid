/// Module for [RecentFilter] class
module gtk.recent_filter;

import gid.gid;
import gobject.initially_unowned;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.recent_filter_info;
import gtk.types;

/**
    A #GtkRecentFilter can be used to restrict the files being shown
    in a #GtkRecentChooser.  Files can be filtered based on their name
    (with [gtk.recent_filter.RecentFilter.addPattern]), on their mime type (with
    [gtk.file_filter.FileFilter.addMimeType]), on the application that has
    registered them (with [gtk.recent_filter.RecentFilter.addApplication]), or by
    a custom filter function (with [gtk.recent_filter.RecentFilter.addCustom]).
    
    Filtering by mime type handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of text/plain.
    Note that #GtkRecentFilter allows wildcards for the subtype of a
    mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkRecentChooser,
    see [gtk.recent_chooser.RecentChooser.addFilter], but it is also possible to
    manually use a filter on a file with [gtk.recent_filter.RecentFilter.filter].
    
    Recently used files are supported since GTK+ 2.10.
    
    ## GtkRecentFilter as GtkBuildable
    
    The GtkRecentFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>`, `<pattern>` or `<application>` has the same effect as
    calling [gtk.recent_filter.RecentFilter.addMimeType],
    [gtk.recent_filter.RecentFilter.addPattern] or [gtk.recent_filter.RecentFilter.addApplication].
    
    An example of a UI definition fragment specifying [gtk.recent_filter.RecentFilter]
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
class RecentFilter : gobject.initially_unowned.InitiallyUnowned, gtk.buildable.Buildable
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
    return cast(void function())gtk_recent_filter_get_type != &gidSymbolNotFound ? gtk_recent_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentFilter self()
  {
    return this;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkRecentFilter with no rules added to it.
      Such filter does not accept any recently used resources, so is not
      particularly useful until you add rules with
      [gtk.recent_filter.RecentFilter.addPattern], [gtk.recent_filter.RecentFilter.addMimeType],
      [gtk.recent_filter.RecentFilter.addApplication], [gtk.recent_filter.RecentFilter.addAge].
      To create a filter that accepts any recently used resource, use:
      ```c
      GtkRecentFilter *filter = gtk_recent_filter_new ();
      gtk_recent_filter_add_pattern (filter, "*");
      ```
      Returns: a new #GtkRecentFilter
  */
  this()
  {
    GtkRecentFilter* _cretval;
    _cretval = gtk_recent_filter_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a rule that allows resources based on their age - that is, the number
      of days elapsed since they were last modified.
  
      Params:
        days = number of days
  */
  void addAge(int days)
  {
    gtk_recent_filter_add_age(cast(GtkRecentFilter*)this._cPtr, days);
  }

  /**
      Adds a rule that allows resources based on the name of the application
      that has registered them.
  
      Params:
        application = an application name
  */
  void addApplication(string application)
  {
    const(char)* _application = application.toCString(No.Alloc);
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
  void addCustom(gtk.types.RecentFilterFlags needed, gtk.types.RecentFilterFunc func)
  {
    extern(C) gboolean _funcCallback(const(GtkRecentFilterInfo)* filterInfo, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.RecentFilterFunc*)userData;

      _dretval = (*_dlg)(filterInfo ? new gtk.recent_filter_info.RecentFilterInfo(cast(void*)filterInfo, No.Take) : null);
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
  void addGroup(string group)
  {
    const(char)* _group = group.toCString(No.Alloc);
    gtk_recent_filter_add_group(cast(GtkRecentFilter*)this._cPtr, _group);
  }

  /**
      Adds a rule that allows resources based on their registered MIME type.
  
      Params:
        mimeType = a MIME type
  */
  void addMimeType(string mimeType)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gtk_recent_filter_add_mime_type(cast(GtkRecentFilter*)this._cPtr, _mimeType);
  }

  /**
      Adds a rule that allows resources based on a pattern matching their
      display name.
  
      Params:
        pattern = a file pattern
  */
  void addPattern(string pattern)
  {
    const(char)* _pattern = pattern.toCString(No.Alloc);
    gtk_recent_filter_add_pattern(cast(GtkRecentFilter*)this._cPtr, _pattern);
  }

  /**
      Adds a rule allowing image files in the formats supported
      by GdkPixbuf.
  */
  void addPixbufFormats()
  {
    gtk_recent_filter_add_pixbuf_formats(cast(GtkRecentFilter*)this._cPtr);
  }

  /**
      Tests whether a file should be displayed according to filter.
      The #GtkRecentFilterInfo filter_info should include
      the fields returned from [gtk.recent_filter.RecentFilter.getNeeded], and
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
  bool filter(gtk.recent_filter_info.RecentFilterInfo filterInfo)
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_filter_filter(cast(GtkRecentFilter*)this._cPtr, filterInfo ? cast(const(GtkRecentFilterInfo)*)filterInfo._cPtr : null);
    return _retval;
  }

  /**
      Gets the human-readable name for the filter.
      See [gtk.recent_filter.RecentFilter.setName].
      Returns: the name of the filter, or null.  The returned string
          is owned by the filter object and should not be freed.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_recent_filter_get_name(cast(GtkRecentFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the fields that need to be filled in for the #GtkRecentFilterInfo
      passed to [gtk.recent_filter.RecentFilter.filter]
      
      This function will not typically be used by applications; it
      is intended principally for use in the implementation of
      #GtkRecentChooser.
      Returns: bitfield of flags indicating needed fields when
          calling [gtk.recent_filter.RecentFilter.filter]
  */
  gtk.types.RecentFilterFlags getNeeded()
  {
    GtkRecentFilterFlags _cretval;
    _cretval = gtk_recent_filter_get_needed(cast(GtkRecentFilter*)this._cPtr);
    gtk.types.RecentFilterFlags _retval = cast(gtk.types.RecentFilterFlags)_cretval;
    return _retval;
  }

  /**
      Sets the human-readable name of the filter; this is the string
      that will be displayed in the recently used resources selector
      user interface if there is a selectable list of filters.
  
      Params:
        name = then human readable name of filter
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_recent_filter_set_name(cast(GtkRecentFilter*)this._cPtr, _name);
  }
}
