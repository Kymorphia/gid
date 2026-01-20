/// Module for [FileFilter] class
module gtk.file_filter;

import gid.gid;
import glib.variant;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.filter;
import gtk.types;

/**
    [gtk.file_filter.FileFilter] filters files by name or mime type.
    
    [gtk.file_filter.FileFilter] can be used to restrict the files being shown in a
    [gtk.file_chooser.FileChooser]. Files can be filtered based on their name (with
    [gtk.file_filter.FileFilter.addPattern] or [gtk.file_filter.FileFilter.addSuffix])
    or on their mime type (with [gtk.file_filter.FileFilter.addMimeType]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that [gtk.file_filter.FileFilter] allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, file filters are used by adding them to a [gtk.file_chooser.FileChooser]
    (see [gtk.file_chooser.FileChooser.addFilter]), but it is also possible to
    manually use a file filter on any [gtk.filter_list_model.FilterListModel] containing
    [gio.file_info.FileInfo] objects.
    
    # GtkFileFilter as GtkBuildable
    
    The [gtk.file_filter.FileFilter] implementation of the [gtk.buildable.Buildable] interface
    supports adding rules using the `<mime-types>` and `<patterns>` and
    `<suffixes>` elements and listing the rules within. Specifying a
    `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
    as calling
    [gtk.file_filter.FileFilter.addMimeType] or
    [gtk.file_filter.FileFilter.addPattern] or
    [gtk.file_filter.FileFilter.addSuffix].
    
    An example of a UI definition fragment specifying [gtk.file_filter.FileFilter]
    rules:
    ```xml
    <object class="GtkFileFilter">
      <property name="name" translatable="yes">Text and Images</property>
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/ *</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
      </patterns>
      <suffixes>
        <suffix>png</suffix>
      </suffixes>
    </object>
    ```
*/
class FileFilter : gtk.filter.Filter, gtk.buildable.Buildable
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

  /**
      Get `name` property.
      Returns: The human-readable name of the filter.
        
        This is the string that will be displayed in the file chooser
        user interface if there is a selectable list of filters.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The human-readable name of the filter.
          
          This is the string that will be displayed in the file chooser
          user interface if there is a selectable list of filters.
  */
  @property void name(string propval)
  {
    return setName(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new [gtk.file_filter.FileFilter] with no rules added to it.
      
      Such a filter doesn’t accept any files, so is not
      particularly useful until you add rules with
      [gtk.file_filter.FileFilter.addMimeType],
      [gtk.file_filter.FileFilter.addPattern],
      [gtk.file_filter.FileFilter.addSuffix] or
      [gtk.file_filter.FileFilter.addPixbufFormats].
      
      To create a filter that accepts any file, use:
      ```c
      GtkFileFilter *filter = gtk_file_filter_new ();
      gtk_file_filter_add_pattern (filter, "*");
      ```
      Returns: a new [gtk.file_filter.FileFilter]
  */
  this()
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new();
    this(_cretval, Yes.Take);
  }

  /**
      Deserialize a file filter from a [glib.variant.Variant].
      
      The variant must be in the format produced by
      [gtk.file_filter.FileFilter.toGvariant].
  
      Params:
        variant = an `a{sv}` [glib.variant.Variant]
      Returns: a new [gtk.file_filter.FileFilter] object
  */
  static gtk.file_filter.FileFilter newFromGvariant(glib.variant.Variant variant)
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, Yes.Take);
    return _retval;
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
      
      Note that it depends on the platform whether pattern
      matching ignores case or not. On Windows, it does, on
      other platforms, it doesn't.
  
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
      
      This is equivalent to calling [gtk.file_filter.FileFilter.addMimeType]
      for all the supported mime types.
  */
  void addPixbufFormats()
  {
    gtk_file_filter_add_pixbuf_formats(cast(GtkFileFilter*)this._cPtr);
  }

  /**
      Adds a suffix match rule to a filter.
      
      This is similar to adding a match for the pattern
      "*.suffix".
      
      In contrast to pattern matches, suffix matches
      are *always* case-insensitive.
  
      Params:
        suffix = filename suffix to match
  */
  void addSuffix(string suffix)
  {
    const(char)* _suffix = suffix.toCString(No.Alloc);
    gtk_file_filter_add_suffix(cast(GtkFileFilter*)this._cPtr, _suffix);
  }

  /**
      Gets the attributes that need to be filled in for the [gio.file_info.FileInfo]
      passed to this filter.
      
      This function will not typically be used by applications;
      it is intended principally for use in the implementation
      of [gtk.file_chooser.FileChooser].
      Returns: the attributes
  */
  string[] getAttributes()
  {
    const(char*)* _cretval;
    _cretval = gtk_file_filter_get_attributes(cast(GtkFileFilter*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the human-readable name for the filter.
      
      See [gtk.file_filter.FileFilter.setName].
      Returns: The human-readable name of the filter
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_file_filter_get_name(cast(GtkFileFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets a human-readable name of the filter.
      
      This is the string that will be displayed in the file chooser
      if there is a selectable list of filters.
  
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
      Serialize a file filter to an `a{sv}` variant.
      Returns: a new, floating, [glib.variant.Variant]
  */
  glib.variant.Variant toGvariant()
  {
    GVariant* _cretval;
    _cretval = gtk_file_filter_to_gvariant(cast(GtkFileFilter*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }
}
