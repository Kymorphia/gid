/// Module for [FileChooser] interface mixin
module gid.gtk4.file_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtk4.file_chooser_iface_proxy;
public import gid.core.utils;
public import gid.gio2.file;
public import gid.gio2.list_model;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.file_filter;
public import gid.gtk4.types;

/**
    [gid.gtk4.file_chooser.FileChooser] is an interface that can be implemented by file
    selection widgets.
    
    In GTK, the main objects that implement this interface are
    [gid.gtk4.file_chooser_widget.FileChooserWidget] and [gid.gtk4.file_chooser_dialog.FileChooserDialog].
    
    You do not need to write an object that implements the [gid.gtk4.file_chooser.FileChooser]
    interface unless you are trying to adapt an existing file selector to
    expose a standard programming interface.
    
    [gid.gtk4.file_chooser.FileChooser] allows for shortcuts to various places in the filesystem.
    In the default implementation these are displayed in the left pane. It
    may be a bit confusing at first that these shortcuts come from various
    sources and in various flavours, so lets explain the terminology here:
    
    - Bookmarks: are created by the user, by dragging folders from the
      right pane to the left pane, or by using the “Add”. Bookmarks
      can be renamed and deleted by the user.
    
    - Shortcuts: can be provided by the application. For example, a Paint
      program may want to add a shortcut for a Clipart folder. Shortcuts
      cannot be modified by the user.
    
    - Volumes: are provided by the underlying filesystem abstraction. They are
      the “roots” of the filesystem.
    
    # File Names and Encodings
    
    When the user is finished selecting files in a [gid.gtk4.file_chooser.FileChooser], your
    program can get the selected filenames as [gid.gio2.file.File]s.
    
    # Adding options
    
    You can add extra widgets to a file chooser to provide options
    that are not present in the default design, by using
    [gid.gtk4.file_chooser.FileChooser.addChoice]. Each choice has an identifier and
    a user visible label; additionally, each choice can have multiple
    options. If a choice has no option, it will be rendered as a
    check button with the given label; if a choice has options, it will
    be rendered as a combo box.

    Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
*/
template FileChooserT()
{

  /**
      Get `action` property.
      Returns: The type of operation that the file chooser is performing.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property gid.gtk4.types.FileChooserAction action() nothrow
  {
    return getAction();
  }

  /**
      Set `action` property.
      Params:
        propval = The type of operation that the file chooser is performing.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property void action(gid.gtk4.types.FileChooserAction propval) nothrow
  {
    setAction(propval);
  }

  /**
      Get `createFolders` property.
      Returns: Whether a file chooser not in [gid.gtk4.types.FileChooserAction.Open] mode
        will offer the user to create new folders.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property bool createFolders() nothrow
  {
    return getCreateFolders();
  }

  /**
      Set `createFolders` property.
      Params:
        propval = Whether a file chooser not in [gid.gtk4.types.FileChooserAction.Open] mode
          will offer the user to create new folders.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property void createFolders(bool propval) nothrow
  {
    setCreateFolders(propval);
  }

  /**
      Get `filter` property.
      Returns: The current filter for selecting files that are displayed.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property gid.gtk4.file_filter.FileFilter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The current filter for selecting files that are displayed.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property void filter(gid.gtk4.file_filter.FileFilter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `filters` property.
      Returns: A [gid.gio2.list_model.ListModel] containing the filters that have been
        added with [gid.gtk4.file_chooser.FileChooser.addFilter].
        
        The returned object should not be modified. It may
        or may not be updated for later changes.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property gid.gio2.list_model.ListModel filters() nothrow
  {
    return getFilters();
  }

  /**
      Get `selectMultiple` property.
      Returns: Whether to allow multiple files to be selected.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property bool selectMultiple() nothrow
  {
    return getSelectMultiple();
  }

  /**
      Set `selectMultiple` property.
      Params:
        propval = Whether to allow multiple files to be selected.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property void selectMultiple(bool propval) nothrow
  {
    setSelectMultiple(propval);
  }

  /**
      Get `shortcutFolders` property.
      Returns: A [gid.gio2.list_model.ListModel] containing the shortcut folders that have been
        added with [gid.gtk4.file_chooser.FileChooser.addShortcutFolder].
        
        The returned object should not be modified. It may
        or may not be updated for later changes.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  @property gid.gio2.list_model.ListModel shortcutFolders() nothrow
  {
    return getShortcutFolders();
  }

  /**
      Adds a 'choice' to the file chooser.
      
      This is typically implemented as a combobox or, for boolean choices,
      as a checkbutton. You can select a value using
      [gid.gtk4.file_chooser.FileChooser.setChoice] before the dialog is shown,
      and you can obtain the user-selected value in the
      [gid.gtk4.dialog.Dialog.response] signal handler using
      [gid.gtk4.file_chooser.FileChooser.getChoice].
  
      Params:
        id = id for the added choice
        label = user-visible label for the added choice
        options = ids for the options of the choice, or null for a boolean choice
        optionLabels = user-visible labels for the options, must be the same length as options
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void addChoice(string id, string label, string[] options = null, string[] optionLabels = null) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    auto _options_arr = new char*[](options.length + 1);
    auto _options = cast(char**)_options_arr.ptr;
    foreach (i, s; options) _options[i] = s.toCString!(No.Malloc);
    auto _optionLabels_arr = new char*[](optionLabels.length + 1);
    auto _optionLabels = cast(char**)_optionLabels_arr.ptr;
    foreach (i, s; optionLabels) _optionLabels[i] = s.toCString!(No.Malloc);
    gtk_file_chooser_add_choice(cast(GtkFileChooser*)this._cPtr, _id, _label, _options, _optionLabels);
  }

  /**
      Adds filter to the list of filters that the user can select between.
      
      When a filter is selected, only files that are passed by that
      filter are displayed.
      
      Note that the chooser takes ownership of the filter if it is floating,
      so you have to ref and sink it if you want to keep a reference.
  
      Params:
        filter = a [gid.gtk4.file_filter.FileFilter]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void addFilter(gid.gtk4.file_filter.FileFilter filter) nothrow
  {
    gtk_file_chooser_add_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Adds a folder to be displayed with the shortcut folders
      in a file chooser.
  
      Params:
        folder = a [gid.gio2.file.File] for the folder to add
      Returns: true if the folder could be added successfully,
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool addShortcutFolder(gid.gio2.file.File folder)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_add_shortcut_folder(cast(GtkFileChooser*)this._cPtr, folder ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)folder)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the type of operation that the file chooser is performing.
      Returns: the action that the file selector is performing
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gtk4.types.FileChooserAction getAction() nothrow
  {
    GtkFileChooserAction _cretval;
    _cretval = gtk_file_chooser_get_action(cast(GtkFileChooser*)this._cPtr);
    gid.gtk4.types.FileChooserAction _retval = cast(gid.gtk4.types.FileChooserAction)_cretval;
    return _retval;
  }

  /**
      Gets the currently selected option in the 'choice' with the given ID.
  
      Params:
        id = the ID of the choice to get
      Returns: the ID of the currently selected option
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override string getChoice(string id) nothrow
  {
    const(char)* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_file_chooser_get_choice(cast(GtkFileChooser*)this._cPtr, _id);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether file chooser will offer to create new folders.
      Returns: true if the Create Folder button should be displayed.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool getCreateFolders() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_create_folders(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current folder of chooser as [gid.gio2.file.File].
      Returns: the [gid.gio2.file.File] for the current folder.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gio2.file.File getCurrentFolder() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_file_chooser_get_current_folder(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current name in the file selector, as entered by the user.
      
      This is meant to be used in save dialogs, to get the currently typed
      filename when the file itself does not exist yet.
      Returns: The raw text from the file chooser’s “Name” entry. Free with
          [gid.glib2.global.gfree]. Note that this string is not a full pathname or URI; it is
          whatever the contents of the entry are. Note also that this string is
          in UTF-8 encoding, which is not necessarily the system’s encoding for
          filenames.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override string getCurrentName() nothrow
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_current_name(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the [gid.gio2.file.File] for the currently selected file in
      the file selector.
      
      If multiple files are selected, one of the files will be
      returned at random.
      
      If the file chooser is in folder mode, this function returns
      the selected folder.
      Returns: a selected [gid.gio2.file.File]. You own the
          returned file; use [gid.gobject2.object.ObjectWrap.unref] to release it.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_file_chooser_get_file(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Lists all the selected files and subfolders in the current folder
      of chooser as [gid.gio2.file.File].
      Returns: a list model containing a [gid.gio2.file.File] for each
          selected file and subfolder in the current folder. Free the returned
          list with [gid.gobject2.object.ObjectWrap.unref].
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gio2.list_model.ListModel getFiles() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_file_chooser_get_files(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current filter.
      Returns: the current filter
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gtk4.file_filter.FileFilter getFilter() nothrow
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_chooser_get_filter(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current set of user-selectable filters, as a list model.
      
      See [gid.gtk4.file_chooser.FileChooser.addFilter] and
      [gid.gtk4.file_chooser.FileChooser.removeFilter] for changing individual filters.
      
      You should not modify the returned list model. Future changes to
      chooser may or may not affect the returned model.
      Returns: a [gid.gio2.list_model.ListModel] containing the current set
          of user-selectable filters.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gio2.list_model.ListModel getFilters() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_file_chooser_get_filters(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether multiple files can be selected in the file
      chooser.
      Returns: true if multiple files can be selected.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool getSelectMultiple() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_select_multiple(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Queries the list of shortcut folders in the file chooser.
      
      You should not modify the returned list model. Future changes to
      chooser may or may not affect the returned model.
      Returns: A list model of [gid.gio2.file.File]s
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override gid.gio2.list_model.ListModel getShortcutFolders() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_file_chooser_get_shortcut_folders(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes a 'choice' that has been added with [gid.gtk4.file_chooser.FileChooser.addChoice].
  
      Params:
        id = the ID of the choice to remove
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void removeChoice(string id) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    gtk_file_chooser_remove_choice(cast(GtkFileChooser*)this._cPtr, _id);
  }

  /**
      Removes filter from the list of filters that the user can select between.
  
      Params:
        filter = a [gid.gtk4.file_filter.FileFilter]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void removeFilter(gid.gtk4.file_filter.FileFilter filter) nothrow
  {
    gtk_file_chooser_remove_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Removes a folder from the shortcut folders in a file chooser.
  
      Params:
        folder = a [gid.gio2.file.File] for the folder to remove
      Returns: true if the folder could be removed successfully,
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool removeShortcutFolder(gid.gio2.file.File folder)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_remove_shortcut_folder(cast(GtkFileChooser*)this._cPtr, folder ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)folder)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the type of operation that the chooser is performing.
      
      The user interface is adapted to suit the selected action.
      
      For example, an option to create a new folder might be shown
      if the action is [gid.gtk4.types.FileChooserAction.Save] but not if the
      action is [gid.gtk4.types.FileChooserAction.Open].
  
      Params:
        action = the action that the file selector is performing
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setAction(gid.gtk4.types.FileChooserAction action) nothrow
  {
    gtk_file_chooser_set_action(cast(GtkFileChooser*)this._cPtr, action);
  }

  /**
      Selects an option in a 'choice' that has been added with
      [gid.gtk4.file_chooser.FileChooser.addChoice].
      
      For a boolean choice, the possible options are "true" and "false".
  
      Params:
        id = the ID of the choice to set
        option = the ID of the option to select
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setChoice(string id, string option) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    const(char)* _option = option.toCString!(No.Malloc, No.Nullable);
    gtk_file_chooser_set_choice(cast(GtkFileChooser*)this._cPtr, _id, _option);
  }

  /**
      Sets whether file chooser will offer to create new folders.
      
      This is only relevant if the action is not set to be
      [gid.gtk4.types.FileChooserAction.Open].
  
      Params:
        createFolders = true if the Create Folder button should be displayed
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setCreateFolders(bool createFolders) nothrow
  {
    gtk_file_chooser_set_create_folders(cast(GtkFileChooser*)this._cPtr, createFolders);
  }

  /**
      Sets the current folder for chooser from a [gid.gio2.file.File].
  
      Params:
        file = the [gid.gio2.file.File] for the new folder
      Returns: true if the folder could be changed successfully, false
          otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool setCurrentFolder(gid.gio2.file.File file = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_set_current_folder(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the current name in the file selector, as if entered
      by the user.
      
      Note that the name passed in here is a UTF-8 string rather
      than a filename. This function is meant for such uses as a
      suggested name in a “Save As...” dialog.  You can pass
      “Untitled.doc” or a similarly suitable suggestion for the name.
      
      If you want to preselect a particular existing file, you should
      use [gid.gtk4.file_chooser.FileChooser.setFile] instead.
      
      Please see the documentation for those functions for an example
      of using [gid.gtk4.file_chooser.FileChooser.setCurrentName] as well.
  
      Params:
        name = the filename to use, as a UTF-8 string
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setCurrentName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_file_chooser_set_current_name(cast(GtkFileChooser*)this._cPtr, _name);
  }

  /**
      Sets file as the current filename for the file chooser.
      
      This includes changing to the file’s parent folder and actually selecting
      the file in list. If the chooser is in [gid.gtk4.types.FileChooserAction.Save] mode,
      the file’s base name will also appear in the dialog’s file name entry.
      
      If the file name isn’t in the current folder of chooser, then the current
      folder of chooser will be changed to the folder containing file.
      
      Note that the file must exist, or nothing will be done except
      for the directory change.
      
      If you are implementing a save dialog, you should use this function if
      you already have a file name to which the user may save; for example,
      when the user opens an existing file and then does “Save As…”. If you
      don’t have a file name already — for example, if the user just created
      a new file and is saving it for the first time, do not call this function.
      
      Instead, use something similar to this:
      
      ```c
      static void
      prepare_file_chooser (GtkFileChooser *chooser,
                            GFile          *existing_file)
      {
        gboolean document_is_new = (existing_file == NULL);
      
        if (document_is_new)
          {
            GFile *default_file_for_saving = g_file_new_for_path ("./out.txt");
            // the user just created a new document
            gtk_file_chooser_set_current_folder (chooser, default_file_for_saving, NULL);
            gtk_file_chooser_set_current_name (chooser, "Untitled document");
            g_object_unref (default_file_for_saving);
          }
        else
          {
            // the user edited an existing document
            gtk_file_chooser_set_file (chooser, existing_file, NULL);
          }
      }
      ```
  
      Params:
        file = the [gid.gio2.file.File] to set as current
      Returns: Not useful
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override bool setFile(gid.gio2.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_set_file(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the current filter.
      
      Only the files that pass the filter will be displayed.
      If the user-selectable list of filters is non-empty, then
      the filter should be one of the filters in that list.
      
      Setting the current filter when the list of filters is
      empty is useful if you want to restrict the displayed
      set of files without letting the user change it.
  
      Params:
        filter = a [gid.gtk4.file_filter.FileFilter]
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setFilter(gid.gtk4.file_filter.FileFilter filter) nothrow
  {
    gtk_file_chooser_set_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets whether multiple files can be selected in the file chooser.
      
      This is only relevant if the action is set to be
      [gid.gtk4.types.FileChooserAction.Open] or
      [gid.gtk4.types.FileChooserAction.SelectFolder].
  
      Params:
        selectMultiple = true if multiple files can be selected.
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  override void setSelectMultiple(bool selectMultiple) nothrow
  {
    gtk_file_chooser_set_select_multiple(cast(GtkFileChooser*)this._cPtr, selectMultiple);
  }
}

/// Fluent builder implementation template for [gid.gtk4.file_chooser.FileChooser]
template FileChooserGidBuilderT()
{

  /**
      Set `action` property.
      Params:
        propval = The type of operation that the file chooser is performing.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  T action(gid.gtk4.types.FileChooserAction propval) nothrow
  {
    return setProperty("action", propval);
  }

  /**
      Set `createFolders` property.
      Params:
        propval = Whether a file chooser not in [gid.gtk4.types.FileChooserAction.Open] mode
          will offer the user to create new folders.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  T createFolders(bool propval) nothrow
  {
    return setProperty("create-folders", propval);
  }

  /**
      Set `filter` property.
      Params:
        propval = The current filter for selecting files that are displayed.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  T filter(gid.gtk4.file_filter.FileFilter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `selectMultiple` property.
      Params:
        propval = Whether to allow multiple files to be selected.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
  */
  T selectMultiple(bool propval) nothrow
  {
    return setProperty("select-multiple", propval);
  }
}
