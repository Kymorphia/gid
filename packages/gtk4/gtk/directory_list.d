/// Module for [DirectoryList] class
module gtk.directory_list;

import gid.gid;
import gio.file;
import gio.list_model;
import gio.list_model_mixin;
import glib.error;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.directory_list.DirectoryList] is a list model that wraps [gio.file.File.enumerateChildrenAsync].
    
    It presents a [gio.list_model.ListModel] and fills it asynchronously with the [gio.file_info.FileInfo]s
    returned from that function.
    
    Enumeration will start automatically when the
    [gtk.directory_list.DirectoryList.file] property is set.
    
    While the [gtk.directory_list.DirectoryList] is being filled, the
    [gtk.directory_list.DirectoryList.loading] property will be set to true. You can
    listen to that property if you want to show information like a [gtk.spinner.Spinner]
    or a "Loading..." text.
    
    If loading fails at any point, the [gtk.directory_list.DirectoryList.error]
    property will be set to give more indication about the failure.
    
    The [gio.file_info.FileInfo]s returned from a [gtk.directory_list.DirectoryList] have the "standard::file"
    attribute set to the [gio.file.File] they refer to. This way you can get at the file
    that is referred to in the same way you would via [gio.file_enumerator.FileEnumerator.getChild].
    This means you do not need access to the [gtk.directory_list.DirectoryList], but can access
    the [gio.file.File] directly from the [gio.file_info.FileInfo] when operating with a [gtk.list_view.ListView]
    or similar.
*/
class DirectoryList : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())gtk_directory_list_get_type != &gidSymbolNotFound ? gtk_directory_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DirectoryList self()
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
      Get `error` property.
      Returns: Error encountered while loading files.
  */
  @property glib.error.ErrorWrap error()
  {
    return getError();
  }

  /**
      Get `file` property.
      Returns: File to query.
  */
  @property gio.file.File file()
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = File to query.
  */
  @property void file(gio.file.File propval)
  {
    return setFile(propval);
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
      Get `monitored` property.
      Returns: true if the directory is monitored for changed.
  */
  @property bool monitored()
  {
    return getMonitored();
  }

  /**
      Set `monitored` property.
      Params:
        propval = true if the directory is monitored for changed.
  */
  @property void monitored(bool propval)
  {
    return setMonitored(propval);
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
      Creates a new [gtk.directory_list.DirectoryList].
      
      The [gtk.directory_list.DirectoryList] is querying the given file
      with the given attributes.
  
      Params:
        attributes = The attributes to query with
        file = The file to query
      Returns: a new [gtk.directory_list.DirectoryList]
  */
  this(string attributes = null, gio.file.File file = null)
  {
    GtkDirectoryList* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    _cretval = gtk_directory_list_new(_attributes, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the attributes queried on the children.
      Returns: The queried attributes
  */
  string getAttributes()
  {
    const(char)* _cretval;
    _cretval = gtk_directory_list_get_attributes(cast(GtkDirectoryList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the loading error, if any.
      
      If an error occurs during the loading process, the loading process
      will finish and this property allows querying the error that happened.
      This error will persist until a file is loaded again.
      
      An error being set does not mean that no files were loaded, and all
      successfully queried files will remain in the list.
      Returns: The loading error or null if
          loading finished successfully
  */
  glib.error.ErrorWrap getError()
  {
    const(GError)* _cretval;
    _cretval = gtk_directory_list_get_error(cast(GtkDirectoryList*)this._cPtr);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the file whose children are currently enumerated.
      Returns: The file whose children are enumerated
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_directory_list_get_file(cast(GtkDirectoryList*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the IO priority set via [gtk.directory_list.DirectoryList.setIoPriority].
      Returns: The IO priority.
  */
  int getIoPriority()
  {
    int _retval;
    _retval = gtk_directory_list_get_io_priority(cast(GtkDirectoryList*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the directory list is monitoring
      the directory for changes.
      Returns: true if the directory is monitored
  */
  bool getMonitored()
  {
    bool _retval;
    _retval = cast(bool)gtk_directory_list_get_monitored(cast(GtkDirectoryList*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the children enumeration is currently in
      progress.
      
      Files will be added to self from time to time while loading is
      going on. The order in which are added is undefined and may change
      in between runs.
      Returns: true if self is loading
  */
  bool isLoading()
  {
    bool _retval;
    _retval = cast(bool)gtk_directory_list_is_loading(cast(GtkDirectoryList*)this._cPtr);
    return _retval;
  }

  /**
      Sets the attributes to be enumerated and starts the enumeration.
      
      If attributes is null, the list of file infos will still be created, it will just
      not contain any extra attributes.
  
      Params:
        attributes = the attributes to enumerate
  */
  void setAttributes(string attributes = null)
  {
    const(char)* _attributes = attributes.toCString(No.Alloc);
    gtk_directory_list_set_attributes(cast(GtkDirectoryList*)this._cPtr, _attributes);
  }

  /**
      Sets the file to be enumerated and starts the enumeration.
      
      If file is null, the result will be an empty list.
  
      Params:
        file = the [gio.file.File] to be enumerated
  */
  void setFile(gio.file.File file = null)
  {
    gtk_directory_list_set_file(cast(GtkDirectoryList*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets the IO priority to use while loading directories.
      
      Setting the priority while self is loading will reprioritize the
      ongoing load as soon as possible.
      
      The default IO priority is `G_PRIORITY_DEFAULT`, which is higher than
      the GTK redraw priority. If you are loading a lot of directories in
      parallel, lowering it to something like `G_PRIORITY_DEFAULT_IDLE`
      may increase responsiveness.
  
      Params:
        ioPriority = IO priority to use
  */
  void setIoPriority(int ioPriority)
  {
    gtk_directory_list_set_io_priority(cast(GtkDirectoryList*)this._cPtr, ioPriority);
  }

  /**
      Sets whether the directory list will monitor the directory
      for changes.
      
      If monitoring is enabled, the ::items-changed signal will
      be emitted when the directory contents change.
      
      
      When monitoring is turned on after the initial creation
      of the directory list, the directory is reloaded to avoid
      missing files that appeared between the initial loading
      and when monitoring was turned on.
  
      Params:
        monitored = true to monitor the directory for changes
  */
  void setMonitored(bool monitored)
  {
    gtk_directory_list_set_monitored(cast(GtkDirectoryList*)this._cPtr, monitored);
  }
}
