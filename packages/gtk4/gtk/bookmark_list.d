/// Module for [BookmarkList] class
module gtk.bookmark_list;

public import gid.basictypes;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.bookmark_list.BookmarkList] is a list model that wraps [glib.bookmark_file.BookmarkFile].
    
    It presents a [gio.list_model.ListModel] and fills it asynchronously with the
    [gio.file_info.FileInfo]s returned from that function.
    
    The [gio.file_info.FileInfo]s in the list have some attributes in the recent
    namespace added: `recent::private` (boolean) and `recent:applications`
    (stringv).
*/
class BookmarkList : gobject.object.ObjectWrap, gio.list_model.ListModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bookmark_list_get_type != &gidSymbolNotFound ? gtk_bookmark_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BookmarkList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.bookmark_list.BookmarkList]
      Returns: New builder object
  */
  static BookmarkListGidBuilder builder() nothrow
  {
    return new BookmarkListGidBuilder;
  }

  /**
      Get `attributes` property.
      Returns: The attributes to query.
  */
  @property string attributes() nothrow
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = The attributes to query.
  */
  @property void attributes(string propval) nothrow
  {
    setAttributes(propval);
  }

  /**
      Get `filename` property.
      Returns: The bookmark file to load.
  */
  @property string filename() nothrow
  {
    return getFilename();
  }

  /**
      Get `ioPriority` property.
      Returns: Priority used when loading.
  */
  @property int ioPriority() nothrow
  {
    return getIoPriority();
  }

  /**
      Set `ioPriority` property.
      Params:
        propval = Priority used when loading.
  */
  @property void ioPriority(int propval) nothrow
  {
    setIoPriority(propval);
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `loading` property.
      Returns: true if files are being loaded.
  */
  @property bool loading() nothrow
  {
    return isLoading();
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();

  /**
      Creates a new [gtk.bookmark_list.BookmarkList] with the given attributes.
  
      Params:
        filename = The bookmark file to load
        attributes = The attributes to query
      Returns: a new [gtk.bookmark_list.BookmarkList]
  */
  this(string filename = null, string attributes = null) nothrow
  {
    GtkBookmarkList* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _attributes = attributes.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_bookmark_list_new(_filename, _attributes);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the attributes queried on the children.
      Returns: The queried attributes
  */
  string getAttributes() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_attributes(cast(GtkBookmarkList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the filename of the bookmark file that
      this list is loading.
      Returns: the filename of the .xbel file
  */
  string getFilename() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_filename(cast(GtkBookmarkList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the IO priority to use while loading file.
      Returns: The IO priority.
  */
  int getIoPriority() nothrow
  {
    int _retval;
    _retval = gtk_bookmark_list_get_io_priority(cast(GtkBookmarkList*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the files are currently being loaded.
      
      Files will be added to self from time to time while loading is
      going on. The order in which are added is undefined and may change
      in between runs.
      Returns: true if self is loading
  */
  bool isLoading() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_bookmark_list_is_loading(cast(GtkBookmarkList*)this._cPtr);
    return _retval;
  }

  /**
      Sets the attributes to be enumerated and starts the enumeration.
      
      If attributes is null, no attributes will be queried, but a list
      of [gio.file_info.FileInfo]s will still be created.
  
      Params:
        attributes = the attributes to enumerate
  */
  void setAttributes(string attributes = null) nothrow
  {
    const(char)* _attributes = attributes.toCString!(No.Malloc, Yes.Nullable);
    gtk_bookmark_list_set_attributes(cast(GtkBookmarkList*)this._cPtr, _attributes);
  }

  /**
      Sets the IO priority to use while loading files.
      
      The default IO priority is [glib.types.PRIORITY_DEFAULT].
  
      Params:
        ioPriority = IO priority to use
  */
  void setIoPriority(int ioPriority) nothrow
  {
    gtk_bookmark_list_set_io_priority(cast(GtkBookmarkList*)this._cPtr, ioPriority);
  }
}

/// Fluent builder implementation template for [gtk.bookmark_list.BookmarkList]
class BookmarkListGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `attributes` property.
      Params:
        propval = The attributes to query.
      Returns: Builder instance for fluent chaining
  */
  T attributes(string propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /**
      Set `filename` property.
      Params:
        propval = The bookmark file to load.
      Returns: Builder instance for fluent chaining
  */
  T filename(string propval) nothrow
  {
    return setProperty("filename", propval);
  }

  /**
      Set `ioPriority` property.
      Params:
        propval = Priority used when loading.
      Returns: Builder instance for fluent chaining
  */
  T ioPriority(int propval) nothrow
  {
    return setProperty("io-priority", propval);
  }
}

/// Fluent builder for [gtk.bookmark_list.BookmarkList]
final class BookmarkListGidBuilder : BookmarkListGidBuilderImpl!BookmarkListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BookmarkList build() nothrow
  {
    return new BookmarkList(cast(void*)createGObject(BookmarkList._getGType), Yes.Take);
  }
}
