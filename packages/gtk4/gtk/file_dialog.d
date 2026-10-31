/// Module for [FileDialog] class
module gtk.file_dialog;

public import gid.basictypes;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.list_model;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_filter;
import gtk.types;
import gtk.window;

/**
    Asynchronous API to present a file chooser dialog.
    
    [gtk.file_dialog.FileDialog] collects the arguments that are needed to present
    the dialog to the user, such as a title for the dialog and whether
    it should be modal.
    
    The dialog is shown with [gtk.file_dialog.FileDialog.open],
    [gtk.file_dialog.FileDialog.save], etc.
*/
class FileDialog : gobject.object.ObjectWrap
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
    return cast(void function())gtk_file_dialog_get_type != &gidSymbolNotFound ? gtk_file_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.file_dialog.FileDialog]
      Returns: New builder object
  */
  static FileDialogGidBuilder builder() nothrow
  {
    return new FileDialogGidBuilder;
  }

  /**
      Get `acceptLabel` property.
      Returns: Label for the file chooser's accept button.
  */
  @property string acceptLabel() nothrow
  {
    return getAcceptLabel();
  }

  /**
      Set `acceptLabel` property.
      Params:
        propval = Label for the file chooser's accept button.
  */
  @property void acceptLabel(string propval) nothrow
  {
    setAcceptLabel(propval);
  }

  /**
      Get `defaultFilter` property.
      Returns: The default filter.
        
        This filter is initially active in the file chooser dialog.
        
        If the default filter is `NULL`, the first filter of [gtk.file_dialog.FileDialog.filters]
        is used as the default filter. If that property contains no filter, the dialog will
        be unfiltered.
        
        If [gtk.file_dialog.FileDialog.filters] is not `NULL`, the default filter should be
        part of the list. If it is not, the dialog may choose to not make it available.
  */
  @property gtk.file_filter.FileFilter defaultFilter() nothrow
  {
    return getDefaultFilter();
  }

  /**
      Set `defaultFilter` property.
      Params:
        propval = The default filter.
          
          This filter is initially active in the file chooser dialog.
          
          If the default filter is `NULL`, the first filter of [gtk.file_dialog.FileDialog.filters]
          is used as the default filter. If that property contains no filter, the dialog will
          be unfiltered.
          
          If [gtk.file_dialog.FileDialog.filters] is not `NULL`, the default filter should be
          part of the list. If it is not, the dialog may choose to not make it available.
  */
  @property void defaultFilter(gtk.file_filter.FileFilter propval) nothrow
  {
    setDefaultFilter(propval);
  }

  /**
      Get `filters` property.
      Returns: The list of filters.
        
        See [gtk.file_dialog.FileDialog.defaultFilter] about how these
        two properties interact.
  */
  @property gio.list_model.ListModel filters() nothrow
  {
    return getFilters();
  }

  /**
      Set `filters` property.
      Params:
        propval = The list of filters.
          
          See [gtk.file_dialog.FileDialog.defaultFilter] about how these
          two properties interact.
  */
  @property void filters(gio.list_model.ListModel propval) nothrow
  {
    setFilters(propval);
  }

  /**
      Get `initialFile` property.
      Returns: The initial file.
        
        This file is initially selected in the file chooser dialog
        
        This is a utility property that sets both [gtk.file_dialog.FileDialog.initialFolder]
        and [gtk.file_dialog.FileDialog.initialName].
  */
  @property gio.file.File initialFile() nothrow
  {
    return getInitialFile();
  }

  /**
      Set `initialFile` property.
      Params:
        propval = The initial file.
          
          This file is initially selected in the file chooser dialog
          
          This is a utility property that sets both [gtk.file_dialog.FileDialog.initialFolder]
          and [gtk.file_dialog.FileDialog.initialName].
  */
  @property void initialFile(gio.file.File propval) nothrow
  {
    setInitialFile(propval);
  }

  /**
      Get `initialFolder` property.
      Returns: The initial folder.
        
        This is the directory that is initially opened in the file chooser dialog.
  */
  @property gio.file.File initialFolder() nothrow
  {
    return getInitialFolder();
  }

  /**
      Set `initialFolder` property.
      Params:
        propval = The initial folder.
          
          This is the directory that is initially opened in the file chooser dialog.
  */
  @property void initialFolder(gio.file.File propval) nothrow
  {
    setInitialFolder(propval);
  }

  /**
      Get `initialName` property.
      Returns: The initial name.
        
        This is the name of the file that is initially selected in the file chooser dialog.
  */
  @property string initialName() nothrow
  {
    return getInitialName();
  }

  /**
      Set `initialName` property.
      Params:
        propval = The initial name.
          
          This is the name of the file that is initially selected in the file chooser dialog.
  */
  @property void initialName(string propval) nothrow
  {
    setInitialName(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the file chooser dialog is modal.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the file chooser dialog is modal.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the file chooser dialog.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the file chooser dialog.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [gtk.file_dialog.FileDialog] object.
      Returns: the new [gtk.file_dialog.FileDialog]
  */
  this() nothrow
  {
    GtkFileDialog* _cretval;
    _cretval = gtk_file_dialog_new();
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the text used by the dialog on its accept button.
      Returns: the label shown on the file chooser's accept button
  */
  string getAcceptLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_accept_label(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the filter that will be selected by default
      in the file chooser dialog.
      Returns: the default filter
  */
  gtk.file_filter.FileFilter getDefaultFilter() nothrow
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_dialog_get_default_filter(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the filters that will be offered to the user
      in the file chooser dialog.
      Returns: the filters,
          as a list model of [gtk.file_filter.FileFilter]
  */
  gio.list_model.ListModel getFilters() nothrow
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
  gio.file.File getInitialFile() nothrow
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
  gio.file.File getInitialFolder() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_file_dialog_get_initial_folder(cast(GtkFileDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the filename that will be initially selected.
      Returns: the name
  */
  string getInitialName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_initial_name(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the file chooser dialog blocks interaction
      with the parent window while it is presented.
      Returns: true if the file chooser dialog is modal
  */
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_dialog_get_modal(cast(GtkFileDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the file chooser dialog.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_title(cast(GtkFileDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be set up to select a single file.
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void open(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.open] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the file that was selected
      Throws: [ErrorWrap]
  */
  gio.file.File openFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be set up to select multiple files.
      
      The file chooser dialog will initially be opened in the directory
      [gtk.file_dialog.FileDialog.initialFolder].
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void openMultiple(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open_multiple(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.open] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the files that were selected,
          as a list model of [gio.file.File]
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel openMultipleFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_multiple_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be set up to select multiple files.
      
      The file chooser dialog will initially be opened in the directory
      [gtk.file_dialog.FileDialog.initialFolder].
      
      In contrast to [gtk.file_dialog.FileDialog.open], this function
      lets the user select the text encoding for the files, if possible.
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void openMultipleTextFiles(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open_multiple_text_files(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.open] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
        encoding = return location for the text encoding to use
      Returns: the files that were selected,
          as a list model of [gio.file.File]
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel openMultipleTextFilesFinish(gio.async_result.AsyncResult result, out string encoding)
  {
    GListModel* _cretval;
    char* _encoding;
    GError *_err;
    _cretval = gtk_file_dialog_open_multiple_text_files_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_encoding, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    encoding = _encoding.fromCString!(No.Free);
    return _retval;
  }

  /**
      Initiates a file selection operation by presenting a file chooser
      dialog to the user.
      
      In contrast to [gtk.file_dialog.FileDialog.open], this function
      lets the user select the text encoding for the file, if possible.
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void openTextFile(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open_text_file(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.openTextFile] call
      and returns the resulting file and text encoding.
      
      If the user has explicitly selected a text encoding to use
      for the file, then encoding will be set to a codeset name that
      is suitable for passing to iconv_open(). Otherwise, it will
      be `NULL`.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = a [gio.async_result.AsyncResult]
        encoding = return location for the text encoding to use
      Returns: the file that was selected
      Throws: [ErrorWrap]
  */
  gio.file.File openTextFileFinish(gio.async_result.AsyncResult result, out string encoding)
  {
    GFile* _cretval;
    char* _encoding;
    GError *_err;
    _cretval = gtk_file_dialog_open_text_file_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_encoding, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    encoding = _encoding.fromCString!(No.Free);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be save mode.
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void save(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_save(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.save] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the file that was selected
      Throws: [ErrorWrap]
  */
  gio.file.File saveFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_save_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Initiates a file save operation by presenting a file chooser
      dialog to the user.
      
      In contrast to [gtk.file_dialog.FileDialog.save], this function
      lets the user select the text encoding and line endings for
      the text file, if possible.
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void saveTextFile(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_save_text_file(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.saveTextFile] call
      and returns the resulting file, text encoding and line endings.
      
      If the user has explicitly selected a text encoding to use
      for the file, then encoding will be set to a codeset name that
      is suitable for passing to iconv_open(). Otherwise, it will
      be `NULL`.
      
      The line_ending will be set to one of "\n", "\r\n", "\r" or "",
      where the latter means to preserve existing line endings.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = a [gio.async_result.AsyncResult]
        encoding = return location for the text encoding to use
        lineEnding = return location for the line endings to use
      Returns: the file that was selected.
      Throws: [ErrorWrap]
  */
  gio.file.File saveTextFileFinish(gio.async_result.AsyncResult result, out string encoding, out string lineEnding)
  {
    GFile* _cretval;
    char* _encoding;
    char* _lineEnding;
    GError *_err;
    _cretval = gtk_file_dialog_save_text_file_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_encoding, &_lineEnding, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    encoding = _encoding.fromCString!(No.Free);
    lineEnding = _lineEnding.fromCString!(No.Free);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be set up to select a single folder.
      
      If you pass initial_folder, the file chooser dialog will initially
      be opened in the parent directory of that folder, otherwise, it
      will be in the directory [gtk.file_dialog.FileDialog.initialFolder].
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void selectFolder(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_folder(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.selectFolder] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the folder that was selected
      Throws: [ErrorWrap]
  */
  gio.file.File selectFolderFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_folder_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Presents a file chooser dialog to the user.
      
      The file chooser dialog will be set up to allow selecting
      multiple folders.
      
      The file chooser dialog will initially be opened in the
      directory [gtk.file_dialog.FileDialog.initialFolder].
      
      The callback will be called when the dialog is closed.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void selectMultipleFolders(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_multiple_folders(cast(GtkFileDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_dialog.FileDialog.selectMultipleFolders] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the folders that were selected,
          as a list model of [gio.file.File]
      Throws: [ErrorWrap]
  */
  gio.list_model.ListModel selectMultipleFoldersFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_multiple_folders_finish(cast(GtkFileDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the label shown on the file chooser's accept button.
      
      Leaving the accept label unset or setting it as `NULL` will
      fall back to a default label, depending on what API is used
      to launch the file dialog.
  
      Params:
        acceptLabel = the new accept label
  */
  void setAcceptLabel(string acceptLabel = null) nothrow
  {
    const(char)* _acceptLabel = acceptLabel.toCString!(No.Malloc, Yes.Nullable);
    gtk_file_dialog_set_accept_label(cast(GtkFileDialog*)this._cPtr, _acceptLabel);
  }

  /**
      Sets the filter that will be selected by default
      in the file chooser dialog.
      
      If set to `NULL`, the first item in [gtk.file_dialog.FileDialog.filters]
      will be used as the default filter. If that list is empty, the dialog
      will be unfiltered.
  
      Params:
        filter = the file filter
  */
  void setDefaultFilter(gtk.file_filter.FileFilter filter = null) nothrow
  {
    gtk_file_dialog_set_default_filter(cast(GtkFileDialog*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the filters that will be offered to the user
      in the file chooser dialog.
  
      Params:
        filters = a list model of [gtk.file_filter.FileFilter]
  */
  void setFilters(gio.list_model.ListModel filters = null) nothrow
  {
    gtk_file_dialog_set_filters(cast(GtkFileDialog*)this._cPtr, filters ? cast(GListModel*)(cast(gobject.object.ObjectWrap)filters)._cPtr(No.Dup) : null);
  }

  /**
      Sets the file that will be initially selected in
      the file chooser dialog.
      
      This function is a shortcut for calling both
      [gtk.file_dialog.FileDialog.setInitialFolder] and
      [gtk.file_dialog.FileDialog.setInitialName] with the
      directory and name of file, respectively.
  
      Params:
        file = a file
  */
  void setInitialFile(gio.file.File file = null) nothrow
  {
    gtk_file_dialog_set_initial_file(cast(GtkFileDialog*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets the folder that will be set as the
      initial folder in the file chooser dialog.
  
      Params:
        folder = a file
  */
  void setInitialFolder(gio.file.File folder = null) nothrow
  {
    gtk_file_dialog_set_initial_folder(cast(GtkFileDialog*)this._cPtr, folder ? cast(GFile*)(cast(gobject.object.ObjectWrap)folder)._cPtr(No.Dup) : null);
  }

  /**
      Sets the filename that will be initially selected.
      
      For save dialogs, name will usually be pre-entered into the
      name field.
      
      If a file with this name already exists in the directory set
      via [gtk.file_dialog.FileDialog.initialFolder], the dialog will
      preselect it.
  
      Params:
        name = a string
  */
  void setInitialName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_file_dialog_set_initial_name(cast(GtkFileDialog*)this._cPtr, _name);
  }

  /**
      Sets whether the file chooser dialog blocks interaction
      with the parent window while it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal) nothrow
  {
    gtk_file_dialog_set_modal(cast(GtkFileDialog*)this._cPtr, modal);
  }

  /**
      Sets the title that will be shown on the file chooser dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_file_dialog_set_title(cast(GtkFileDialog*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [gtk.file_dialog.FileDialog]
class FileDialogGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `acceptLabel` property.
      Params:
        propval = Label for the file chooser's accept button.
      Returns: Builder instance for fluent chaining
  */
  T acceptLabel(string propval) nothrow
  {
    return setProperty("accept-label", propval);
  }

  /**
      Set `defaultFilter` property.
      Params:
        propval = The default filter.
          
          This filter is initially active in the file chooser dialog.
          
          If the default filter is `NULL`, the first filter of [gtk.file_dialog.FileDialog.filters]
          is used as the default filter. If that property contains no filter, the dialog will
          be unfiltered.
          
          If [gtk.file_dialog.FileDialog.filters] is not `NULL`, the default filter should be
          part of the list. If it is not, the dialog may choose to not make it available.
      Returns: Builder instance for fluent chaining
  */
  T defaultFilter(gtk.file_filter.FileFilter propval) nothrow
  {
    return setProperty("default-filter", propval);
  }

  /**
      Set `filters` property.
      Params:
        propval = The list of filters.
          
          See [gtk.file_dialog.FileDialog.defaultFilter] about how these
          two properties interact.
      Returns: Builder instance for fluent chaining
  */
  T filters(gio.list_model.ListModel propval) nothrow
  {
    return setProperty("filters", propval);
  }

  /**
      Set `initialFile` property.
      Params:
        propval = The initial file.
          
          This file is initially selected in the file chooser dialog
          
          This is a utility property that sets both [gtk.file_dialog.FileDialog.initialFolder]
          and [gtk.file_dialog.FileDialog.initialName].
      Returns: Builder instance for fluent chaining
  */
  T initialFile(gio.file.File propval) nothrow
  {
    return setProperty("initial-file", propval);
  }

  /**
      Set `initialFolder` property.
      Params:
        propval = The initial folder.
          
          This is the directory that is initially opened in the file chooser dialog.
      Returns: Builder instance for fluent chaining
  */
  T initialFolder(gio.file.File propval) nothrow
  {
    return setProperty("initial-folder", propval);
  }

  /**
      Set `initialName` property.
      Params:
        propval = The initial name.
          
          This is the name of the file that is initially selected in the file chooser dialog.
      Returns: Builder instance for fluent chaining
  */
  T initialName(string propval) nothrow
  {
    return setProperty("initial-name", propval);
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the file chooser dialog is modal.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the file chooser dialog.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gtk.file_dialog.FileDialog]
final class FileDialogGidBuilder : FileDialogGidBuilderImpl!FileDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileDialog build() nothrow
  {
    return new FileDialog(cast(void*)createGObject(FileDialog._getGType), Yes.Take);
  }
}
