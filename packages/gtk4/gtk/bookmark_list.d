/// Module for [BookmarkList] class
module gtk.bookmark_list;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bookmark_list_get_type != &gidSymbolNotFound ? gtk_bookmark_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BookmarkList self()
  {
    return this;
  }

  /**
      Get `attributes` property.
      Returns: The attributes to query.
  */
  @property string attributes()
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = The attributes to query.
  */
  @property void attributes(string propval)
  {
    return setAttributes(propval);
  }

  /**
      Get `ioPriority` property.
      Returns: Priority used when loading.
  */
  @property int ioPriority()
  {
    return getIoPriority();
  }

  /**
      Set `ioPriority` property.
      Params:
        propval = Priority used when loading.
  */
  @property void ioPriority(int propval)
  {
    return setIoPriority(propval);
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `loading` property.
      Returns: true if files are being loaded.
  */
  @property bool loading()
  {
    return isLoading();
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
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
  this(string filename = null, string attributes = null)
  {
    GtkBookmarkList* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _attributes = attributes.toCString(No.Alloc);
    _cretval = gtk_bookmark_list_new(_filename, _attributes);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the attributes queried on the children.
      Returns: The queried attributes
  */
  string getAttributes()
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_attributes(cast(GtkBookmarkList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the filename of the bookmark file that
      this list is loading.
      Returns: the filename of the .xbel file
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_filename(cast(GtkBookmarkList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the IO priority to use while loading file.
      Returns: The IO priority.
  */
  int getIoPriority()
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
  bool isLoading()
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
  void setAttributes(string attributes = null)
  {
    const(char)* _attributes = attributes.toCString(No.Alloc);
    gtk_bookmark_list_set_attributes(cast(GtkBookmarkList*)this._cPtr, _attributes);
  }

  /**
      Sets the IO priority to use while loading files.
      
      The default IO priority is `G_PRIORITY_DEFAULT`.
  
      Params:
        ioPriority = IO priority to use
  */
  void setIoPriority(int ioPriority)
  {
    gtk_bookmark_list_set_io_priority(cast(GtkBookmarkList*)this._cPtr, ioPriority);
  }
}
