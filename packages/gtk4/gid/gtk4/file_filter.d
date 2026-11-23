/// Module for [FileFilter] class
module gid.gtk4.file_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.filter;
import gid.gtk4.types;

/**
    Filters files by name or mime type.
    
    [gid.gtk4.file_filter.FileFilter] can be used to restrict the files being shown in a
    file chooser. Files can be filtered based on their name (with
    [gid.gtk4.file_filter.FileFilter.addPattern] or [gid.gtk4.file_filter.FileFilter.addSuffix])
    or on their mime type (with [gid.gtk4.file_filter.FileFilter.addMimeType]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that [gid.gtk4.file_filter.FileFilter] allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, file filters are used by adding them to a file chooser
    (see [gid.gtk4.file_dialog.FileDialog.setFilters]), but it is also possible to
    manually use a file filter on any [gid.gtk4.filter_list_model.FilterListModel] containing
    [gid.gio2.file_info.FileInfo] objects.
    
    # GtkFileFilter as GtkBuildable
    
    The [gid.gtk4.file_filter.FileFilter] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding rules using the `<mime-types>` and `<patterns>` and
    `<suffixes>` elements and listing the rules within. Specifying a
    `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
    as calling
    [gid.gtk4.file_filter.FileFilter.addMimeType] or
    [gid.gtk4.file_filter.FileFilter.addPattern] or
    [gid.gtk4.file_filter.FileFilter.addSuffix].
    
    An example of a UI definition fragment specifying [gid.gtk4.file_filter.FileFilter]
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
class FileFilter : gid.gtk4.filter.Filter, gid.gtk4.buildable.Buildable
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
      Get builder for [gid.gtk4.file_filter.FileFilter]
      Returns: New builder object
  */
  static FileFilterGidBuilder builder() nothrow
  {
    return new FileFilterGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The human-readable name of the filter.
        
        This is the string that will be displayed in the user interface
        if there is a selectable list of filters.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The human-readable name of the filter.
          
          This is the string that will be displayed in the user interface
          if there is a selectable list of filters.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new [gid.gtk4.file_filter.FileFilter] with no rules added to it.
      
      Such a filter doesn’t accept any files, so is not
      particularly useful until you add rules with
      [gid.gtk4.file_filter.FileFilter.addMimeType],
      [gid.gtk4.file_filter.FileFilter.addPattern],
      [gid.gtk4.file_filter.FileFilter.addSuffix] or
      [gid.gtk4.file_filter.FileFilter.addPixbufFormats].
      
      To create a filter that accepts any file, use:
      ```c
      GtkFileFilter *filter = gtk_file_filter_new ();
      gtk_file_filter_add_pattern (filter, "*");
      ```
      Returns: a new [gid.gtk4.file_filter.FileFilter]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkFileFilter* _cretval;
      _cretval = gtk_file_filter_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Deserialize a file filter from a [gid.glib2.variant.Variant].
      
      The variant must be in the format produced by
      [gid.gtk4.file_filter.FileFilter.toGvariant].
  
      Params:
        variant = an `a{sv}` [gid.glib2.variant.Variant]
      Returns: a new [gid.gtk4.file_filter.FileFilter] object
  */
  static gid.gtk4.file_filter.FileFilter newFromGvariant(gid.glib2.variant.Variant variant) nothrow
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_filter_new_from_gvariant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds a rule allowing a given mime type.
  
      Params:
        mimeType = name of a MIME type
  */
  void addMimeType(string mimeType) nothrow
  {
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    gtk_file_filter_add_mime_type(cast(GtkFileFilter*)this._cPtr, _mimeType);
  }

  /**
      Adds a rule allowing a given array of mime types.
      It can for example be used with
      [Gly.Loader.get_mime_types](https://gnome.pages.gitlab.gnome.org/glycin/libglycin/type_func.Loader.get_mime_types.html).
      
      This is equivalent to calling [gid.gtk4.file_filter.FileFilter.addMimeType]
      for all the supported mime types.
  
      Params:
        mimeTypes = a null-terminated array of mime types
  */
  void addMimeTypes(string[] mimeTypes) nothrow
  {
    auto _mimeTypes_arr = new char*[](mimeTypes.length + 1);
    auto _mimeTypes = cast(char**)_mimeTypes_arr.ptr;
    foreach (i, s; mimeTypes) _mimeTypes[i] = s.toCString!(No.Malloc);
    gtk_file_filter_add_mime_types(cast(GtkFileFilter*)this._cPtr, _mimeTypes);
  }

  /**
      Adds a rule allowing a shell style glob pattern.
      
      Note that it depends on the platform whether pattern
      matching ignores case or not. On Windows, it does, on
      other platforms, it doesn't.
  
      Params:
        pattern = a shell style glob pattern
  */
  void addPattern(string pattern) nothrow
  {
    const(char)* _pattern = pattern.toCString!(No.Malloc, No.Nullable);
    gtk_file_filter_add_pattern(cast(GtkFileFilter*)this._cPtr, _pattern);
  }

  /**
      Adds a rule allowing image files in the formats supported by [gid.gdkpixbuf2.pixbuf.Pixbuf].
      
      This is equivalent to calling [gid.gtk4.file_filter.FileFilter.addMimeType]
      for all the supported mime types.
  
      Deprecated: Use the api of your image loading framework (e.g. glycin)
          to enumerate supported formats
  */
  void addPixbufFormats() nothrow
  {
    gtk_file_filter_add_pixbuf_formats(cast(GtkFileFilter*)this._cPtr);
  }

  /**
      Adds a suffix match rule to a filter.
      
      This is similar to adding a match for the pattern "*.suffix"
      
      An exaple to filter files with the suffix ".sub":
      ```c
      gtk_file_filter_add_suffix (filter, "sub");
      ```
      
      Filters with multiple dots are allowed.
      
      In contrast to pattern matches, suffix matches
      are *always* case-insensitive.
  
      Params:
        suffix = filename suffix to match
  */
  void addSuffix(string suffix) nothrow
  {
    const(char)* _suffix = suffix.toCString!(No.Malloc, No.Nullable);
    gtk_file_filter_add_suffix(cast(GtkFileFilter*)this._cPtr, _suffix);
  }

  /**
      Gets the attributes that need to be filled in for the [gid.gio2.file_info.FileInfo]
      passed to this filter.
      
      This function will not typically be used by applications;
      it is intended for use in file chooser implementation.
      Returns: the attributes
  */
  string[] getAttributes() nothrow
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
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Gets the human-readable name for the filter.
      
      See [gid.gtk4.file_filter.FileFilter.setName].
      Returns: the human-readable name of the filter
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_filter_get_name(cast(GtkFileFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets a human-readable name of the filter.
      
      This is the string that will be displayed in the user interface
      if there is a selectable list of filters.
  
      Params:
        name = the human-readable name for the filter
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_file_filter_set_name(cast(GtkFileFilter*)this._cPtr, _name);
  }

  /**
      Serialize a file filter to an `a{sv}` variant.
      Returns: a new, floating, [gid.glib2.variant.Variant]
  */
  gid.glib2.variant.Variant toGvariant() nothrow
  {
    GVariant* _cretval;
    _cretval = gtk_file_filter_to_gvariant(cast(GtkFileFilter*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.file_filter.FileFilter]
class FileFilterGidBuilderImpl(T) : gid.gtk4.filter.FilterGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `mimeTypes` property.
      Params:
        propval = The MIME types that this filter matches.
      Returns: Builder instance for fluent chaining
  */
  T mimeTypes(string[] propval) nothrow
  {
    return setProperty("mime-types", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The human-readable name of the filter.
          
          This is the string that will be displayed in the user interface
          if there is a selectable list of filters.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `patterns` property.
      Params:
        propval = The patterns that this filter matches.
      Returns: Builder instance for fluent chaining
  */
  T patterns(string[] propval) nothrow
  {
    return setProperty("patterns", propval);
  }

  /**
      Set `suffixes` property.
      Params:
        propval = The suffixes that this filter matches.
      Returns: Builder instance for fluent chaining
  */
  T suffixes(string[] propval) nothrow
  {
    return setProperty("suffixes", propval);
  }
}

/// Fluent builder for [gid.gtk4.file_filter.FileFilter]
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
