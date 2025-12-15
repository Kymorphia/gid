/// Module for [FileDialog] class
module gtk.file_dialog;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.list_model;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_filter;
import gtk.types;
import gtk.window;

/**
    A [gtk.file_dialog.FileDialog] object collects the arguments that
    are needed to present a file chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with [gtk.file_dialog.FileDialog.open],
    [gtk.file_dialog.FileDialog.save], etc. These APIs follow the
    GIO async pattern, and the result can be obtained by calling
    the corresponding finish function, for example
    [gtk.file_dialog.FileDialog.openFinish].
*/
class FileDialog : gobject.object.ObjectWrap
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
    return cast(void function())gtk_file_dialog_get_type != &gidSymbolNotFound ? gtk_file_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileDialog self()
  {
    return this;
  }

  /**
      Get `acceptLabel` property.
      Returns: Label for the file chooser's accept button.
  */
  @property string acceptLabel()
  {
    return getAcceptLabel();
  }

  /**
      Set `acceptLabel` property.
      Params:
        propval = Label for the file chooser's accept button.
  */
  @property void acceptLabel(string propval)
  {
    return setAcceptLabel(propval);
  }

  /**
      Get `defaultFilter` property.
      Returns: The default filter, that is, the filter that is initially
      active in the file chooser dialog.
      
      If the default filter is null, the first filter of [gtk.file_dialog.FileDialog.filters]
      is used as the default filter. If that property contains no filter, the dialog will
      be unfiltered.
      
      If [gtk.file_dialog.FileDialog.filters] is not null, the default filter should be part
      of the list. If it is not, the dialog may choose to not make it available.
  */
  @property gtk.file_filter.FileFilter defaultFilter()
  {
    return getDefaultFilter();
  }

  /**
      Set `defaultFilter` property.
      Params:
        propval = The default filter, that is, the filter that is initially
        active in the file chooser dialog.
        
        If the default filter is null, the first filter of [gtk.file_dialog.FileDialog.filters]
        is used as the default filter. If that property contains no filter, the dialog will
        be unfiltered.
        
        If [gtk.file_dialog.FileDialog.filters] is not null, the default filter should be part
        of the list. If it is not, the dialog may choose to not make it available.
  */
  @property void defaultFilter(gtk.file_filter.FileFilter propval)
  {
    return setDefaultFilter(propval);
  }

  /**
      Get `filters` property.
      Returns: The list of filters.
      
      See `property@Gtk.FileDialog:default-filter` about how those two properties interact.
  */
  @property gio.list_model.ListModel filters()
  {
    return getFilters();
  }

  /**
      Set `filters` property.
      Params:
        propval = The list of filters.
        
        See `property@Gtk.FileDialog:default-filter` about how those two properties interact.
  */
  @property void filters(gio.list_model.ListModel propval)
  {
    return setFilters(propval);
  }

  /**
      Get `initialFile` property.
      Returns: The initial file, that is, the file that is initially selected
      in the file chooser dialog
      
      This is a utility property that sets both `property@Gtk.FileDialog:initial-folder` and
      `property@Gtk.FileDialog:initial-name`.
  */
  @property gio.file.File initialFile()
  {
    return getInitialFile();
  }

  /**
      Set `initialFile` property.
      Params:
        propval = The initial file, that is, the file that is initially selected
        in the file chooser dialog
        
        This is a utility property that sets both `property@Gtk.FileDialog:initial-folder` and
        `property@Gtk.FileDialog:initial-name`.
  */
  @property void initialFile(gio.file.File propval)
  {
    return setInitialFile(propval);
  }

  /**
      Get `initialFolder` property.
      Returns: The initial folder, that is, the directory that is initially
      opened in the file chooser dialog
  */
  @property gio.file.File initialFolder()
  {
    return getInitialFolder();
  }

  /**
      Set `initialFolder` property.
      Params:
        propval = The initial folder, that is, the directory that is initially
        opened in the file chooser dialog
  */
  @property void initialFolder(gio.file.File propval)
  {
    return setInitialFolder(propval);
  }

  /**
      Get `initialName` property.
      Returns: The initial name, that is, the filename that is initially
      selected in the file chooser dialog.
  */
  @property string initialName()
  {
    return getInitialName();
  }

  /**
      Set `initialName` property.
      Params:
        propval = The initial name, that is, the filename that is initially
        selected in the file chooser dialog.
  */
  @property void initialName(string propval)
  {
    return setInitialName(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the file chooser dialog is modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the file chooser dialog is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the file chooser dialog.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the file chooser dialog.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new [gtk.file_dialog.FileDialog] object.
      Returns: the new [gtk.file_dialog.FileDialog]
  */
  this()
  {
    GtkFileDialog* _cretval;
    _cretval = gtk_file_dialog_new();
    this(_cretval, Yes.Take);
  }

  /** */
  string getAcceptLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_accept_label(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the filter that will be selected by default
      in the file chooser dialog.
      Returns: the current filter
  */
  gtk.file_filter.FileFilter getDefaultFilter()
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_dialog_get_default_filter(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the filters that will be offered to the user
      in the file chooser dialog.
      Returns: the filters, as
          a [gio.list_model.ListModel] of `GtkFileFilters`
  */
  gio.list_model.ListModel getFilters()
  {
    GListModel* _cretval;
    _cretval = gtk_file_dialog_get_filters(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the file that will be initially selected in
      the file chooser dialog.
      Returns: the file
  */
  gio.file.File getInitialFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_dialog_get_initial_file(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the folder that will be set as the
      initial folder in the file chooser dialog.
      Returns: the folder
  */
  gio.file.File getInitialFolder()
  {
    GFile* _cretval;
    _cretval = gtk_file_dialog_get_initial_folder(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name for the file that should be initially set.
      Returns: the name
  */
  string getInitialName()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_initial_name(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the file chooser dialog
      blocks interaction with the parent window
      while it is presented.
      Returns: `TRUE` if the file chooser dialog is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_dialog_get_modal(cast(GtkFileDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
      file chooser dialog.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_title(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function initiates a file selection operation by
      presenting a file chooser dialog to the user.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.file_dialog.FileDialog.openFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void open(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.open] call and
      returns the resulting file.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the file that was selected.
          Otherwise, `NULL` is returned and error is set
      Throws: [ErrorWrap]
  */
  gio.file.File openFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a multi-file selection operation by
      presenting a file chooser dialog to the user.
      
      The file chooser will initially be opened in the directory
      `propertyGtk.FileDialog:initial-folder`.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.file_dialog.FileDialog.openMultipleFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void openMultiple(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open_multiple(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.open] call and
      returns the resulting files in a [gio.list_model.ListModel].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the file that was selected,
          as a [gio.list_model.ListModel] of `GFiles`. Otherwise, `NULL` is returned
          and error is set
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel openMultipleFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_multiple_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a file save operation by
      presenting a file chooser dialog to the user.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.file_dialog.FileDialog.saveFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void save(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_save(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.save] call and
      returns the resulting file.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the file that was selected.
          Otherwise, `NULL` is returned and error is set
      Throws: [ErrorWrap]
  */
  gio.file.File saveFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_save_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a directory selection operation by
      presenting a file chooser dialog to the user.
      
      If you pass initial_folder, the file chooser will initially be
      opened in the parent directory of that folder, otherwise, it
      will be in the directory `propertyGtk.FileDialog:initial-folder`.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.file_dialog.FileDialog.selectFolderFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void selectFolder(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_folder(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.selectFolder] call and
      returns the resulting file.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the file that was selected.
          Otherwise, `NULL` is returned and error is set
      Throws: [ErrorWrap]
  */
  gio.file.File selectFolderFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_folder_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a multi-directory selection operation by
      presenting a file chooser dialog to the user.
      
      The file chooser will initially be opened in the directory
      `propertyGtk.FileDialog:initial-folder`.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.file_dialog.FileDialog.selectMultipleFoldersFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void selectMultipleFolders(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_multiple_folders(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.selectMultipleFolders]
      call and returns the resulting files in a [gio.list_model.ListModel].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the file that was selected,
          as a [gio.list_model.ListModel] of `GFiles`. Otherwise, `NULL` is returned
          and error is set
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel selectMultipleFoldersFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_multiple_folders_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the label shown on the file chooser's accept button.
      
      Leaving the accept label unset or setting it as `NULL` will fall back to
      a default label, depending on what API is used to launch the file dialog.
  
      Params:
        acceptLabel = the new accept label
  */
  void setAcceptLabel(string acceptLabel = null)
  {
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    gtk_file_dialog_set_accept_label(cast(GtkFileDialog*)this._cPtr, _acceptLabel);
  }

  /**
      Sets the filter that will be selected by default
      in the file chooser dialog.
      
      If set to null, the first item in [gtk.file_dialog.FileDialog.filters]
      will be used as the default filter. If that list is empty, the dialog
      will be unfiltered.
  
      Params:
        filter = a [gtk.file_filter.FileFilter]
  */
  void setDefaultFilter(gtk.file_filter.FileFilter filter = null)
  {
    gtk_file_dialog_set_default_filter(cast(GtkFileDialog*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the filters that will be offered to the user
      in the file chooser dialog.
  
      Params:
        filters = a [gio.list_model.ListModel] of `GtkFileFilters`
  */
  void setFilters(gio.list_model.ListModel filters = null)
  {
    gtk_file_dialog_set_filters(cast(GtkFileDialog*)this._cPtr, filters ? cast(GListModel*)(cast(gobject.object.ObjectWrap)filters)._cPtr(No.Dup) : null);
  }

  /**
      Sets the file that will be initially selected in
      the file chooser dialog.
      
      This function is a shortcut for calling both
      [gtk.file_dialog.FileDialog.setInitialFolder] and
      [gtk.file_dialog.FileDialog.setInitialName] with the directory and
      name of file respectively.
  
      Params:
        file = a [gio.file.File]
  */
  void setInitialFile(gio.file.File file = null)
  {
    gtk_file_dialog_set_initial_file(cast(GtkFileDialog*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets the folder that will be set as the
      initial folder in the file chooser dialog.
  
      Params:
        folder = a [gio.file.File]
  */
  void setInitialFolder(gio.file.File folder = null)
  {
    gtk_file_dialog_set_initial_folder(cast(GtkFileDialog*)this._cPtr, folder ? cast(GFile*)(cast(gobject.object.ObjectWrap)folder)._cPtr(No.Dup) : null);
  }

  /**
      Sets the name for the file that should be initially set.
      For saving dialogs, this will usually be pre-entered into the name field.
      
      If a file with this name already exists in the directory set via
      `propertyGtk.FileDialog:initial-folder`, the dialog should preselect it.
  
      Params:
        name = a UTF8 string
  */
  void setInitialName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_file_dialog_set_initial_name(cast(GtkFileDialog*)this._cPtr, _name);
  }

  /**
      Sets whether the file chooser dialog
      blocks interaction with the parent window
      while it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal)
  {
    gtk_file_dialog_set_modal(cast(GtkFileDialog*)this._cPtr, modal);
  }

  /**
      Sets the title that will be shown on the
      file chooser dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_file_dialog_set_title(cast(GtkFileDialog*)this._cPtr, _title);
  }
}
