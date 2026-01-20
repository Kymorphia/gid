/// Module for [FileChooser] interface mixin
module gtk.file_chooser_mixin;

public import gtk.file_chooser_iface_proxy;
public import gid.gid;
public import gio.file;
public import glib.error;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.file_filter;
public import gtk.types;
public import gtk.widget;

/**
    #GtkFileChooser is an interface that can be implemented by file
    selection widgets.  In GTK+, the main objects that implement this
    interface are #GtkFileChooserWidget, #GtkFileChooserDialog, and
    #GtkFileChooserButton.  You do not need to write an object that
    implements the #GtkFileChooser interface unless you are trying to
    adapt an existing file selector to expose a standard programming
    interface.
    
    #GtkFileChooser allows for shortcuts to various places in the filesystem.
    In the default implementation these are displayed in the left pane. It
    may be a bit confusing at first that these shortcuts come from various
    sources and in various flavours, so lets explain the terminology here:
    
    $(LIST
      * Bookmarks: are created by the user, by dragging folders from the
        right pane to the left pane, or by using the “Add”. Bookmarks
        can be renamed and deleted by the user.
      
      * Shortcuts: can be provided by the application. For example, a Paint
        program may want to add a shortcut for a Clipart folder. Shortcuts
        cannot be modified by the user.
      
      * Volumes: are provided by the underlying filesystem abstraction. They are
        the “roots” of the filesystem.
    )
      
    # File Names and Encodings
    
    When the user is finished selecting files in a
    #GtkFileChooser, your program can get the selected names
    either as filenames or as URIs.  For URIs, the normal escaping
    rules are applied if the URI contains non-ASCII characters.
    However, filenames are always returned in
    the character set specified by the
    `G_FILENAME_ENCODING` environment variable.
    Please see the GLib documentation for more details about this
    variable.
    
    This means that while you can pass the result of
    [gtk.file_chooser.FileChooser.getFilename] to [glib.global.open] or [glib.global.fopen],
    you may not be able to directly set it as the text of a
    #GtkLabel widget unless you convert it first to UTF-8,
    which all GTK+ widgets expect. You should use [glib.global.filenameToUtf8]
    to convert filenames into strings that can be passed to GTK+
    widgets.
    
    # Adding a Preview Widget
    
    You can add a custom preview widget to a file chooser and then
    get notification about when the preview needs to be updated.
    To install a preview widget, use
    [gtk.file_chooser.FileChooser.setPreviewWidget].  Then, connect to the
    #GtkFileChooser::update-preview signal to get notified when
    you need to update the contents of the preview.
    
    Your callback should use
    [gtk.file_chooser.FileChooser.getPreviewFilename] to see what needs
    previewing.  Once you have generated the preview for the
    corresponding file, you must call
    [gtk.file_chooser.FileChooser.setPreviewWidgetActive] with a boolean
    flag that indicates whether your callback could successfully
    generate a preview.
    
    ## Example: Using a Preview Widget ## {#gtkfilechooser-preview}
    ```c
    {
      GtkImage *preview;
    
      ...
    
      preview = gtk_image_new ();
    
      gtk_file_chooser_set_preview_widget (my_file_chooser, preview);
      g_signal_connect (my_file_chooser, "update-preview",
    		    G_CALLBACK (update_preview_cb), preview);
    }
    
    static void
    update_preview_cb (GtkFileChooser *file_chooser, gpointer data)
    {
      GtkWidget *preview;
      char *filename;
      GdkPixbuf *pixbuf;
      gboolean have_preview;
    
      preview = GTK_WIDGET (data);
      filename = gtk_file_chooser_get_preview_filename (file_chooser);
    
      pixbuf = gdk_pixbuf_new_from_file_at_size (filename, 128, 128, NULL);
      have_preview = (pixbuf != NULL);
      g_free (filename);
    
      gtk_image_set_from_pixbuf (GTK_IMAGE (preview), pixbuf);
      if (pixbuf)
        g_object_unref (pixbuf);
    
      gtk_file_chooser_set_preview_widget_active (file_chooser, have_preview);
    }
    ```
    
    # Adding Extra Widgets
    
    You can add extra widgets to a file chooser to provide options
    that are not present in the default design.  For example, you
    can add a toggle button to give the user the option to open a
    file in read-only mode.  You can use
    [gtk.file_chooser.FileChooser.setExtraWidget] to insert additional
    widgets in a file chooser.
    
    An example for adding extra widgets:
    ```c
    
      GtkWidget *toggle;
    
      ...
    
      toggle = gtk_check_button_new_with_label ("Open file read-only");
      gtk_widget_show (toggle);
      gtk_file_chooser_set_extra_widget (my_file_chooser, toggle);
    }
    ```
    
    If you want to set more than one extra widget in the file
    chooser, you can a container such as a #GtkBox or a #GtkGrid
    and include your widgets in it.  Then, set the container as
    the whole extra widget.
*/
template FileChooserT()
{

  /** */
  @property gtk.types.FileChooserAction action()
  {
    return getAction();
  }

  /** */
  @property void action(gtk.types.FileChooserAction propval)
  {
    return setAction(propval);
  }

  /**
      Get `createFolders` property.
      Returns: Whether a file chooser not in [gtk.types.FileChooserAction.Open] mode
        will offer the user to create new folders.
  */
  @property bool createFolders()
  {
    return getCreateFolders();
  }

  /**
      Set `createFolders` property.
      Params:
        propval = Whether a file chooser not in [gtk.types.FileChooserAction.Open] mode
          will offer the user to create new folders.
  */
  @property void createFolders(bool propval)
  {
    return setCreateFolders(propval);
  }

  /**
      Get `doOverwriteConfirmation` property.
      Returns: Whether a file chooser in [gtk.types.FileChooserAction.Save] mode
        will present an overwrite confirmation dialog if the user
        selects a file name that already exists.
  */
  @property bool doOverwriteConfirmation()
  {
    return getDoOverwriteConfirmation();
  }

  /**
      Set `doOverwriteConfirmation` property.
      Params:
        propval = Whether a file chooser in [gtk.types.FileChooserAction.Save] mode
          will present an overwrite confirmation dialog if the user
          selects a file name that already exists.
  */
  @property void doOverwriteConfirmation(bool propval)
  {
    return setDoOverwriteConfirmation(propval);
  }

  /** */
  @property gtk.widget.Widget extraWidget()
  {
    return getExtraWidget();
  }

  /** */
  @property void extraWidget(gtk.widget.Widget propval)
  {
    return setExtraWidget(propval);
  }

  /** */
  @property gtk.file_filter.FileFilter filter()
  {
    return getFilter();
  }

  /** */
  @property void filter(gtk.file_filter.FileFilter propval)
  {
    return setFilter(propval);
  }

  /** */
  @property bool localOnly()
  {
    return getLocalOnly();
  }

  /** */
  @property void localOnly(bool propval)
  {
    return setLocalOnly(propval);
  }

  /** */
  @property gtk.widget.Widget previewWidget()
  {
    return getPreviewWidget();
  }

  /** */
  @property void previewWidget(gtk.widget.Widget propval)
  {
    return setPreviewWidget(propval);
  }

  /** */
  @property bool previewWidgetActive()
  {
    return getPreviewWidgetActive();
  }

  /** */
  @property void previewWidgetActive(bool propval)
  {
    return setPreviewWidgetActive(propval);
  }

  /** */
  @property bool selectMultiple()
  {
    return getSelectMultiple();
  }

  /** */
  @property void selectMultiple(bool propval)
  {
    return setSelectMultiple(propval);
  }

  /** */
  @property bool showHidden()
  {
    return getShowHidden();
  }

  /** */
  @property void showHidden(bool propval)
  {
    return setShowHidden(propval);
  }

  /** */
  @property bool usePreviewLabel()
  {
    return getUsePreviewLabel();
  }

  /** */
  @property void usePreviewLabel(bool propval)
  {
    return setUsePreviewLabel(propval);
  }

  /**
      Adds a 'choice' to the file chooser. This is typically implemented
      as a combobox or, for boolean choices, as a checkbutton. You can select
      a value using [gtk.file_chooser.FileChooser.setChoice] before the dialog is shown,
      and you can obtain the user-selected value in the ::response signal handler
      using [gtk.file_chooser.FileChooser.getChoice].
      
      Compare [gtk.file_chooser.FileChooser.setExtraWidget].
  
      Params:
        id = id for the added choice
        label = user-visible label for the added choice
        options = ids for the options of the choice, or null for a boolean choice
        optionLabels = user-visible labels for the options, must be the same length as options
  */
  override void addChoice(string id, string label, string[] options = null, string[] optionLabels = null)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    char*[] _tmpoptions;
    foreach (s; options)
      _tmpoptions ~= s.toCString(No.Alloc);
    _tmpoptions ~= null;
    const(char*)* _options = _tmpoptions.ptr;

    char*[] _tmpoptionLabels;
    foreach (s; optionLabels)
      _tmpoptionLabels ~= s.toCString(No.Alloc);
    _tmpoptionLabels ~= null;
    const(char*)* _optionLabels = _tmpoptionLabels.ptr;

    gtk_file_chooser_add_choice(cast(GtkFileChooser*)this._cPtr, _id, _label, _options, _optionLabels);
  }

  /**
      Adds filter to the list of filters that the user can select between.
      When a filter is selected, only files that are passed by that
      filter are displayed.
      
      Note that the chooser takes ownership of the filter, so you have to
      ref and sink it if you want to keep a reference.
  
      Params:
        filter = a #GtkFileFilter
  */
  override void addFilter(gtk.file_filter.FileFilter filter)
  {
    gtk_file_chooser_add_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(Yes.Dup) : null);
  }

  /**
      Adds a folder to be displayed with the shortcut folders in a file chooser.
      Note that shortcut folders do not get saved, as they are provided by the
      application.  For example, you can use this to add a
      “/usr/share/mydrawprogram/Clipart” folder to the volume list.
  
      Params:
        folder = filename of the folder to add
      Returns: true if the folder could be added successfully, false
        otherwise.  In the latter case, the error will be set as appropriate.
      Throws: [ErrorWrap]
  */
  override bool addShortcutFolder(string folder)
  {
    bool _retval;
    const(char)* _folder = folder.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_add_shortcut_folder(cast(GtkFileChooser*)this._cPtr, _folder, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Adds a folder URI to be displayed with the shortcut folders in a file
      chooser.  Note that shortcut folders do not get saved, as they are provided
      by the application.  For example, you can use this to add a
      “file:///usr/share/mydrawprogram/Clipart” folder to the volume list.
  
      Params:
        uri = URI of the folder to add
      Returns: true if the folder could be added successfully, false
        otherwise.  In the latter case, the error will be set as appropriate.
      Throws: [ErrorWrap]
  */
  override bool addShortcutFolderUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_add_shortcut_folder_uri(cast(GtkFileChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the type of operation that the file chooser is performing; see
      [gtk.file_chooser.FileChooser.setAction].
      Returns: the action that the file selector is performing
  */
  override gtk.types.FileChooserAction getAction()
  {
    GtkFileChooserAction _cretval;
    _cretval = gtk_file_chooser_get_action(cast(GtkFileChooser*)this._cPtr);
    gtk.types.FileChooserAction _retval = cast(gtk.types.FileChooserAction)_cretval;
    return _retval;
  }

  /**
      Gets the currently selected option in the 'choice' with the given ID.
  
      Params:
        id = the ID of the choice to get
      Returns: the ID of the currenly selected option
  */
  override string getChoice(string id)
  {
    const(char)* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gtk_file_chooser_get_choice(cast(GtkFileChooser*)this._cPtr, _id);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether file choser will offer to create new folders.
      See [gtk.file_chooser.FileChooser.setCreateFolders].
      Returns: true if the Create Folder button should be displayed.
  */
  override bool getCreateFolders()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_create_folders(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current folder of chooser as a local filename.
      See [gtk.file_chooser.FileChooser.setCurrentFolder].
      
      Note that this is the folder that the file chooser is currently displaying
      (e.g. "/home/username/Documents"), which is not the same
      as the currently-selected folder if the chooser is in
      [gtk.types.FileChooserAction.SelectFolder] mode
      (e.g. "/home/username/Documents/selected-folder/".  To get the
      currently-selected folder in that mode, use [gtk.file_chooser.FileChooser.getUri] as the
      usual way to get the selection.
      Returns: the full path of the current
        folder, or null if the current path cannot be represented as a local
        filename.  Free with [glib.global.gfree].  This function will also return
        null if the file chooser was unable to load the last folder that
        was requested from it; for example, as would be for calling
        [gtk.file_chooser.FileChooser.setCurrentFolder] on a nonexistent folder.
  */
  override string getCurrentFolder()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_current_folder(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the current folder of chooser as #GFile.
      See [gtk.file_chooser.FileChooser.getCurrentFolderUri].
      Returns: the #GFile for the current folder.
  */
  override gio.file.File getCurrentFolderFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_chooser_get_current_folder_file(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current folder of chooser as an URI.
      See [gtk.file_chooser.FileChooser.setCurrentFolderUri].
      
      Note that this is the folder that the file chooser is currently displaying
      (e.g. "file:///home/username/Documents"), which is not the same
      as the currently-selected folder if the chooser is in
      [gtk.types.FileChooserAction.SelectFolder] mode
      (e.g. "file:///home/username/Documents/selected-folder/".  To get the
      currently-selected folder in that mode, use [gtk.file_chooser.FileChooser.getUri] as the
      usual way to get the selection.
      Returns: the URI for the current folder.
        Free with [glib.global.gfree].  This function will also return null if the file chooser
        was unable to load the last folder that was requested from it; for example,
        as would be for calling [gtk.file_chooser.FileChooser.setCurrentFolderUri] on a
        nonexistent folder.
  */
  override string getCurrentFolderUri()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_current_folder_uri(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the current name in the file selector, as entered by the user in the
      text entry for “Name”.
      
      This is meant to be used in save dialogs, to get the currently typed filename
      when the file itself does not exist yet.  For example, an application that
      adds a custom extra widget to the file chooser for “file format” may want to
      change the extension of the typed filename based on the chosen format, say,
      from “.jpg” to “.png”.
      Returns: The raw text from the file chooser’s “Name” entry.  Free this with
        [glib.global.gfree].  Note that this string is not a full pathname or URI; it is
        whatever the contents of the entry are.  Note also that this string is in
        UTF-8 encoding, which is not necessarily the system’s encoding for filenames.
  */
  override string getCurrentName()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_current_name(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Queries whether a file chooser is set to confirm for overwriting when the user
      types a file name that already exists.
      Returns: true if the file chooser will present a confirmation dialog;
        false otherwise.
  */
  override bool getDoOverwriteConfirmation()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_do_overwrite_confirmation(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current extra widget; see
      [gtk.file_chooser.FileChooser.setExtraWidget].
      Returns: the current extra widget, or null
  */
  override gtk.widget.Widget getExtraWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_get_extra_widget(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GFile for the currently selected file in
      the file selector. If multiple files are selected,
      one of the files will be returned at random.
      
      If the file chooser is in folder mode, this function returns the selected
      folder.
      Returns: a selected #GFile. You own the returned file;
            use [gobject.object.ObjectWrap.unref] to release it.
  */
  override gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_chooser_get_file(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the filename for the currently selected file in
      the file selector. The filename is returned as an absolute path. If
      multiple files are selected, one of the filenames will be returned at
      random.
      
      If the file chooser is in folder mode, this function returns the selected
      folder.
      Returns: The currently selected filename,
         or null if no file is selected, or the selected file can't
         be represented with a local filename. Free with [glib.global.gfree].
  */
  override string getFilename()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_filename(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Lists all the selected files and subfolders in the current folder of
      chooser. The returned names are full absolute paths. If files in the current
      folder cannot be represented as local filenames they will be ignored. (See
      [gtk.file_chooser.FileChooser.getUris])
      Returns: a #GSList
           containing the filenames of all selected files and subfolders in
           the current folder. Free the returned list with [glib.slist.SList.free],
           and the filenames with [glib.global.gfree].
  */
  override string[] getFilenames()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_get_filenames(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Lists all the selected files and subfolders in the current folder of chooser
      as #GFile. An internal function, see [gtk.file_chooser.FileChooser.getUris].
      Returns: a #GSList
          containing a #GFile for each selected file and subfolder in the
          current folder.  Free the returned list with [glib.slist.SList.free], and
          the files with [gobject.object.ObjectWrap.unref].
  */
  override gio.file.File[] getFiles()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_get_files(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(gio.file.File, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the current filter; see [gtk.file_chooser.FileChooser.setFilter].
      Returns: the current filter, or null
  */
  override gtk.file_filter.FileFilter getFilter()
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_chooser_get_filter(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether only local files can be selected in the
      file selector. See [gtk.file_chooser.FileChooser.setLocalOnly]
      Returns: true if only local files can be selected.
  */
  override bool getLocalOnly()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_local_only(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GFile that should be previewed in a custom preview
      Internal function, see [gtk.file_chooser.FileChooser.getPreviewUri].
      Returns: the #GFile for the file to preview,
            or null if no file is selected. Free with [gobject.object.ObjectWrap.unref].
  */
  override gio.file.File getPreviewFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_chooser_get_preview_file(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the filename that should be previewed in a custom preview
      widget. See [gtk.file_chooser.FileChooser.setPreviewWidget].
      Returns: the filename to preview, or null if
         no file is selected, or if the selected file cannot be represented
         as a local filename. Free with [glib.global.gfree]
  */
  override string getPreviewFilename()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_preview_filename(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI that should be previewed in a custom preview
      widget. See [gtk.file_chooser.FileChooser.setPreviewWidget].
      Returns: the URI for the file to preview,
            or null if no file is selected. Free with [glib.global.gfree].
  */
  override string getPreviewUri()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_preview_uri(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the current preview widget; see
      [gtk.file_chooser.FileChooser.setPreviewWidget].
      Returns: the current preview widget, or null
  */
  override gtk.widget.Widget getPreviewWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_get_preview_widget(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the preview widget set by [gtk.file_chooser.FileChooser.setPreviewWidget]
      should be shown for the current filename. See
      [gtk.file_chooser.FileChooser.setPreviewWidgetActive].
      Returns: true if the preview widget is active for the current filename.
  */
  override bool getPreviewWidgetActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_preview_widget_active(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether multiple files can be selected in the file
      selector. See [gtk.file_chooser.FileChooser.setSelectMultiple].
      Returns: true if multiple files can be selected.
  */
  override bool getSelectMultiple()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_select_multiple(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether hidden files and folders are displayed in the file selector.
      See [gtk.file_chooser.FileChooser.setShowHidden].
      Returns: true if hidden files and folders are displayed.
  */
  override bool getShowHidden()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_show_hidden(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the URI for the currently selected file in
      the file selector. If multiple files are selected,
      one of the filenames will be returned at random.
      
      If the file chooser is in folder mode, this function returns the selected
      folder.
      Returns: The currently selected URI, or null
           if no file is selected. If [gtk.file_chooser.FileChooser.setLocalOnly] is set to
           true (the default) a local URI will be returned for any FUSE locations.
           Free with [glib.global.gfree]
  */
  override string getUri()
  {
    char* _cretval;
    _cretval = gtk_file_chooser_get_uri(cast(GtkFileChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Lists all the selected files and subfolders in the current folder of
      chooser. The returned names are full absolute URIs.
      Returns: a #GSList containing the URIs of all selected
          files and subfolders in the current folder. Free the returned list
          with [glib.slist.SList.free], and the filenames with [glib.global.gfree].
  */
  override string[] getUris()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_get_uris(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets whether a stock label should be drawn with the name of the previewed
      file.  See [gtk.file_chooser.FileChooser.setUsePreviewLabel].
      Returns: true if the file chooser is set to display a label with the
        name of the previewed file, false otherwise.
  */
  override bool getUsePreviewLabel()
  {
    bool _retval;
    _retval = cast(bool)gtk_file_chooser_get_use_preview_label(cast(GtkFileChooser*)this._cPtr);
    return _retval;
  }

  /**
      Lists the current set of user-selectable filters; see
      [gtk.file_chooser.FileChooser.addFilter], [gtk.file_chooser.FileChooser.removeFilter].
      Returns: a
         #GSList containing the current set of user selectable filters. The
         contents of the list are owned by GTK+, but you must free the list
         itself with [glib.slist.SList.free] when you are done with it.
  */
  override gtk.file_filter.FileFilter[] listFilters()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_list_filters(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(gtk.file_filter.FileFilter, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Queries the list of shortcut folders in the file chooser, as set by
      [gtk.file_chooser.FileChooser.addShortcutFolderUri].
      Returns: A list of
        folder URIs, or null if there are no shortcut folders.  Free the
        returned list with [glib.slist.SList.free], and the URIs with [glib.global.gfree].
  */
  override string[] listShortcutFolderUris()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_list_shortcut_folder_uris(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Queries the list of shortcut folders in the file chooser, as set by
      [gtk.file_chooser.FileChooser.addShortcutFolder].
      Returns: A list
        of folder filenames, or null if there are no shortcut folders.
        Free the returned list with [glib.slist.SList.free], and the filenames with
        [glib.global.gfree].
  */
  override string[] listShortcutFolders()
  {
    GSList* _cretval;
    _cretval = gtk_file_chooser_list_shortcut_folders(cast(GtkFileChooser*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes a 'choice' that has been added with [gtk.file_chooser.FileChooser.addChoice].
  
      Params:
        id = the ID of the choice to remove
  */
  override void removeChoice(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    gtk_file_chooser_remove_choice(cast(GtkFileChooser*)this._cPtr, _id);
  }

  /**
      Removes filter from the list of filters that the user can select between.
  
      Params:
        filter = a #GtkFileFilter
  */
  override void removeFilter(gtk.file_filter.FileFilter filter)
  {
    gtk_file_chooser_remove_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Removes a folder from a file chooser’s list of shortcut folders.
  
      Params:
        folder = filename of the folder to remove
      Returns: true if the operation succeeds, false otherwise.
        In the latter case, the error will be set as appropriate.
        
        See also: [gtk.file_chooser.FileChooser.addShortcutFolder]
      Throws: [ErrorWrap]
  */
  override bool removeShortcutFolder(string folder)
  {
    bool _retval;
    const(char)* _folder = folder.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_remove_shortcut_folder(cast(GtkFileChooser*)this._cPtr, _folder, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Removes a folder URI from a file chooser’s list of shortcut folders.
  
      Params:
        uri = URI of the folder to remove
      Returns: true if the operation succeeds, false otherwise.
        In the latter case, the error will be set as appropriate.
        
        See also: [gtk.file_chooser.FileChooser.addShortcutFolderUri]
      Throws: [ErrorWrap]
  */
  override bool removeShortcutFolderUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_remove_shortcut_folder_uri(cast(GtkFileChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Selects all the files in the current folder of a file chooser.
  */
  override void selectAll()
  {
    gtk_file_chooser_select_all(cast(GtkFileChooser*)this._cPtr);
  }

  /**
      Selects the file referred to by file. An internal function. See
      _gtk_file_chooser_select_uri().
  
      Params:
        file = the file to select
      Returns: Not useful.
      Throws: [ErrorWrap]
  */
  override bool selectFile(gio.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_select_file(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Selects a filename. If the file name isn’t in the current
      folder of chooser, then the current folder of chooser will
      be changed to the folder containing filename.
  
      Params:
        filename = the filename to select
      Returns: Not useful.
        
        See also: [gtk.file_chooser.FileChooser.setFilename]
  */
  override bool selectFilename(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_select_filename(cast(GtkFileChooser*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Selects the file to by uri. If the URI doesn’t refer to a
      file in the current folder of chooser, then the current folder of
      chooser will be changed to the folder containing filename.
  
      Params:
        uri = the URI to select
      Returns: Not useful.
  */
  override bool selectUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_select_uri(cast(GtkFileChooser*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Sets the type of operation that the chooser is performing; the
      user interface is adapted to suit the selected action. For example,
      an option to create a new folder might be shown if the action is
      [gtk.types.FileChooserAction.Save] but not if the action is
      [gtk.types.FileChooserAction.Open].
  
      Params:
        action = the action that the file selector is performing
  */
  override void setAction(gtk.types.FileChooserAction action)
  {
    gtk_file_chooser_set_action(cast(GtkFileChooser*)this._cPtr, action);
  }

  /**
      Selects an option in a 'choice' that has been added with
      [gtk.file_chooser.FileChooser.addChoice]. For a boolean choice, the
      possible options are "true" and "false".
  
      Params:
        id = the ID of the choice to set
        option = the ID of the option to select
  */
  override void setChoice(string id, string option)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _option = option.toCString(No.Alloc);
    gtk_file_chooser_set_choice(cast(GtkFileChooser*)this._cPtr, _id, _option);
  }

  /**
      Sets whether file choser will offer to create new folders.
      This is only relevant if the action is not set to be
      [gtk.types.FileChooserAction.Open].
  
      Params:
        createFolders = true if the Create Folder button should be displayed
  */
  override void setCreateFolders(bool createFolders)
  {
    gtk_file_chooser_set_create_folders(cast(GtkFileChooser*)this._cPtr, createFolders);
  }

  /**
      Sets the current folder for chooser from a local filename.
      The user will be shown the full contents of the current folder,
      plus user interface elements for navigating to other folders.
      
      In general, you should not use this function.  See the
      [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
      for the rationale behind this.
  
      Params:
        filename = the full path of the new current folder
      Returns: Not useful.
  */
  override bool setCurrentFolder(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_set_current_folder(cast(GtkFileChooser*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Sets the current folder for chooser from a #GFile.
      Internal function, see [gtk.file_chooser.FileChooser.setCurrentFolderUri].
  
      Params:
        file = the #GFile for the new folder
      Returns: true if the folder could be changed successfully, false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool setCurrentFolderFile(gio.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_set_current_folder_file(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the current folder for chooser from an URI.
      The user will be shown the full contents of the current folder,
      plus user interface elements for navigating to other folders.
      
      In general, you should not use this function.  See the
      [section on setting up a file chooser dialog][gtkfilechooserdialog-setting-up]
      for the rationale behind this.
  
      Params:
        uri = the URI for the new current folder
      Returns: true if the folder could be changed successfully, false
        otherwise.
  */
  override bool setCurrentFolderUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_set_current_folder_uri(cast(GtkFileChooser*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Sets the current name in the file selector, as if entered
      by the user. Note that the name passed in here is a UTF-8
      string rather than a filename. This function is meant for
      such uses as a suggested name in a “Save As...” dialog.  You can
      pass “Untitled.doc” or a similarly suitable suggestion for the name.
      
      If you want to preselect a particular existing file, you should use
      [gtk.file_chooser.FileChooser.setFilename] or [gtk.file_chooser.FileChooser.setUri] instead.
      Please see the documentation for those functions for an example of using
      [gtk.file_chooser.FileChooser.setCurrentName] as well.
  
      Params:
        name = the filename to use, as a UTF-8 string
  */
  override void setCurrentName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_file_chooser_set_current_name(cast(GtkFileChooser*)this._cPtr, _name);
  }

  /**
      Sets whether a file chooser in [gtk.types.FileChooserAction.Save] mode will present
      a confirmation dialog if the user types a file name that already exists.  This
      is false by default.
      
      If set to true, the chooser will emit the
      #GtkFileChooser::confirm-overwrite signal when appropriate.
      
      If all you need is the stock confirmation dialog, set this property to true.
      You can override the way confirmation is done by actually handling the
      #GtkFileChooser::confirm-overwrite signal; please refer to its documentation
      for the details.
  
      Params:
        doOverwriteConfirmation = whether to confirm overwriting in save mode
  */
  override void setDoOverwriteConfirmation(bool doOverwriteConfirmation)
  {
    gtk_file_chooser_set_do_overwrite_confirmation(cast(GtkFileChooser*)this._cPtr, doOverwriteConfirmation);
  }

  /**
      Sets an application-supplied widget to provide extra options to the user.
  
      Params:
        extraWidget = widget for extra options
  */
  override void setExtraWidget(gtk.widget.Widget extraWidget)
  {
    gtk_file_chooser_set_extra_widget(cast(GtkFileChooser*)this._cPtr, extraWidget ? cast(GtkWidget*)extraWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets file as the current filename for the file chooser, by changing
      to the file’s parent folder and actually selecting the file in list.  If
      the chooser is in [gtk.types.FileChooserAction.Save] mode, the file’s base name
      will also appear in the dialog’s file name entry.
      
      If the file name isn’t in the current folder of chooser, then the current
      folder of chooser will be changed to the folder containing filename. This
      is equivalent to a sequence of [gtk.file_chooser.FileChooser.unselectAll] followed by
      [gtk.file_chooser.FileChooser.selectFilename].
      
      Note that the file must exist, or nothing will be done except
      for the directory change.
      
      If you are implementing a save dialog,
      you should use this function if you already have a file name to which the
      user may save; for example, when the user opens an existing file and then
      does Save As...  If you don’t have
      a file name already — for example, if the user just created a new
      file and is saving it for the first time, do not call this function.
      Instead, use something similar to this:
      ```c
      if (document_is_new)
        {
          // the user just created a new document
          gtk_file_chooser_set_current_folder_file (chooser, default_file_for_saving);
          gtk_file_chooser_set_current_name (chooser, "Untitled document");
        }
      else
        {
          // the user edited an existing document
          gtk_file_chooser_set_file (chooser, existing_file);
        }
      ```
  
      Params:
        file = the #GFile to set as current
      Returns: Not useful.
      Throws: [ErrorWrap]
  */
  override bool setFile(gio.file.File file)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_chooser_set_file(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets filename as the current filename for the file chooser, by changing to
      the file’s parent folder and actually selecting the file in list; all other
      files will be unselected.  If the chooser is in
      [gtk.types.FileChooserAction.Save] mode, the file’s base name will also appear in
      the dialog’s file name entry.
      
      Note that the file must exist, or nothing will be done except
      for the directory change.
      
      You should use this function only when implementing a save
      dialog for which you already have a file name to which
      the user may save.  For example, when the user opens an existing file and
      then does Save As... to save a copy or
      a modified version.  If you don’t have a file name already — for
      example, if the user just created a new file and is saving it for the first
      time, do not call this function.  Instead, use something similar to this:
      ```c
      if (document_is_new)
        {
          // the user just created a new document
          gtk_file_chooser_set_current_name (chooser, "Untitled document");
        }
      else
        {
          // the user edited an existing document
          gtk_file_chooser_set_filename (chooser, existing_filename);
        }
      ```
      
      In the first case, the file chooser will present the user with useful suggestions
      as to where to save his new file.  In the second case, the file’s existing location
      is already known, so the file chooser will use it.
  
      Params:
        filename = the filename to set as current
      Returns: Not useful.
  */
  override bool setFilename(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_set_filename(cast(GtkFileChooser*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Sets the current filter; only the files that pass the
      filter will be displayed. If the user-selectable list of filters
      is non-empty, then the filter should be one of the filters
      in that list. Setting the current filter when the list of
      filters is empty is useful if you want to restrict the displayed
      set of files without letting the user change it.
  
      Params:
        filter = a #GtkFileFilter
  */
  override void setFilter(gtk.file_filter.FileFilter filter)
  {
    gtk_file_chooser_set_filter(cast(GtkFileChooser*)this._cPtr, filter ? cast(GtkFileFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets whether only local files can be selected in the
      file selector. If local_only is true (the default),
      then the selected file or files are guaranteed to be
      accessible through the operating systems native file
      system and therefore the application only
      needs to worry about the filename functions in
      #GtkFileChooser, like [gtk.file_chooser.FileChooser.getFilename],
      rather than the URI functions like
      [gtk.file_chooser.FileChooser.getUri],
      
      On some systems non-native files may still be
      available using the native filesystem via a userspace
      filesystem (FUSE).
  
      Params:
        localOnly = true if only local files can be selected
  */
  override void setLocalOnly(bool localOnly)
  {
    gtk_file_chooser_set_local_only(cast(GtkFileChooser*)this._cPtr, localOnly);
  }

  /**
      Sets an application-supplied widget to use to display a custom preview
      of the currently selected file. To implement a preview, after setting the
      preview widget, you connect to the #GtkFileChooser::update-preview
      signal, and call [gtk.file_chooser.FileChooser.getPreviewFilename] or
      [gtk.file_chooser.FileChooser.getPreviewUri] on each change. If you can
      display a preview of the new file, update your widget and
      set the preview active using [gtk.file_chooser.FileChooser.setPreviewWidgetActive].
      Otherwise, set the preview inactive.
      
      When there is no application-supplied preview widget, or the
      application-supplied preview widget is not active, the file chooser
      will display no preview at all.
  
      Params:
        previewWidget = widget for displaying preview.
  */
  override void setPreviewWidget(gtk.widget.Widget previewWidget)
  {
    gtk_file_chooser_set_preview_widget(cast(GtkFileChooser*)this._cPtr, previewWidget ? cast(GtkWidget*)previewWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the preview widget set by
      [gtk.file_chooser.FileChooser.setPreviewWidget] should be shown for the
      current filename. When active is set to false, the file chooser
      may display an internally generated preview of the current file
      or it may display no preview at all. See
      [gtk.file_chooser.FileChooser.setPreviewWidget] for more details.
  
      Params:
        active = whether to display the user-specified preview widget
  */
  override void setPreviewWidgetActive(bool active)
  {
    gtk_file_chooser_set_preview_widget_active(cast(GtkFileChooser*)this._cPtr, active);
  }

  /**
      Sets whether multiple files can be selected in the file selector.  This is
      only relevant if the action is set to be [gtk.types.FileChooserAction.Open] or
      [gtk.types.FileChooserAction.SelectFolder].
  
      Params:
        selectMultiple = true if multiple files can be selected.
  */
  override void setSelectMultiple(bool selectMultiple)
  {
    gtk_file_chooser_set_select_multiple(cast(GtkFileChooser*)this._cPtr, selectMultiple);
  }

  /**
      Sets whether hidden files and folders are displayed in the file selector.
  
      Params:
        showHidden = true if hidden files and folders should be displayed.
  */
  override void setShowHidden(bool showHidden)
  {
    gtk_file_chooser_set_show_hidden(cast(GtkFileChooser*)this._cPtr, showHidden);
  }

  /**
      Sets the file referred to by uri as the current file for the file chooser,
      by changing to the URI’s parent folder and actually selecting the URI in the
      list.  If the chooser is [gtk.types.FileChooserAction.Save] mode, the URI’s base
      name will also appear in the dialog’s file name entry.
      
      Note that the URI must exist, or nothing will be done except for the
      directory change.
      
      You should use this function only when implementing a save
      dialog for which you already have a file name to which
      the user may save.  For example, when the user opens an existing file and then
      does Save As... to save a copy or a
      modified version.  If you don’t have a file name already — for example,
      if the user just created a new file and is saving it for the first time, do
      not call this function.  Instead, use something similar to this:
      ```c
      if (document_is_new)
        {
          // the user just created a new document
          gtk_file_chooser_set_current_name (chooser, "Untitled document");
        }
      else
        {
          // the user edited an existing document
          gtk_file_chooser_set_uri (chooser, existing_uri);
        }
      ```
      
      
      In the first case, the file chooser will present the user with useful suggestions
      as to where to save his new file.  In the second case, the file’s existing location
      is already known, so the file chooser will use it.
  
      Params:
        uri = the URI to set as current
      Returns: Not useful.
  */
  override bool setUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)gtk_file_chooser_set_uri(cast(GtkFileChooser*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Sets whether the file chooser should display a stock label with the name of
      the file that is being previewed; the default is true.  Applications that
      want to draw the whole preview area themselves should set this to false and
      display the name themselves in their preview widget.
      
      See also: [gtk.file_chooser.FileChooser.setPreviewWidget]
  
      Params:
        useLabel = whether to display a stock label with the name of the previewed file
  */
  override void setUsePreviewLabel(bool useLabel)
  {
    gtk_file_chooser_set_use_preview_label(cast(GtkFileChooser*)this._cPtr, useLabel);
  }

  /**
      Unselects all the files in the current folder of a file chooser.
  */
  override void unselectAll()
  {
    gtk_file_chooser_unselect_all(cast(GtkFileChooser*)this._cPtr);
  }

  /**
      Unselects the file referred to by file. If the file is not in the current
      directory, does not exist, or is otherwise not currently selected, does nothing.
  
      Params:
        file = a #GFile
  */
  override void unselectFile(gio.file.File file)
  {
    gtk_file_chooser_unselect_file(cast(GtkFileChooser*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Unselects a currently selected filename. If the filename
      is not in the current directory, does not exist, or
      is otherwise not currently selected, does nothing.
  
      Params:
        filename = the filename to unselect
  */
  override void unselectFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_file_chooser_unselect_filename(cast(GtkFileChooser*)this._cPtr, _filename);
  }

  /**
      Unselects the file referred to by uri. If the file
      is not in the current directory, does not exist, or
      is otherwise not currently selected, does nothing.
  
      Params:
        uri = the URI to unselect
  */
  override void unselectUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gtk_file_chooser_unselect_uri(cast(GtkFileChooser*)this._cPtr, _uri);
  }

  /**
      Connect to `ConfirmOverwrite` signal.
  
      This signal gets emitted whenever it is appropriate to present a
        confirmation dialog when the user has selected a file name that
        already exists.  The signal only gets emitted when the file
        chooser is in [gtk.types.FileChooserAction.Save] mode.
        
        Most applications just need to turn on the
        #GtkFileChooser:do-overwrite-confirmation property (or call the
        [gtk.file_chooser.FileChooser.setDoOverwriteConfirmation] function), and
        they will automatically get a stock confirmation dialog.
        Applications which need to customize this behavior should do
        that, and also connect to the #GtkFileChooser::confirm-overwrite
        signal.
        
        A signal handler for this signal must return a
        #GtkFileChooserConfirmation value, which indicates the action to
        take.  If the handler determines that the user wants to select a
        different filename, it should return
        [gtk.types.FileChooserConfirmation.SelectAgain].  If it determines
        that the user is satisfied with his choice of file name, it
        should return [gtk.types.FileChooserConfirmation.AcceptFilename].
        On the other hand, if it determines that the stock confirmation
        dialog should be used, it should return
        [gtk.types.FileChooserConfirmation.Confirm]. The following example
        illustrates this.
        
        ## Custom confirmation ## {#gtkfilechooser-confirmation}
        
        ```c
        static GtkFileChooserConfirmation
        confirm_overwrite_callback (GtkFileChooser *chooser, gpointer data)
        {
          char *uri;
        
          uri = gtk_file_chooser_get_uri (chooser);
        
          if (is_uri_read_only (uri))
            {
              if (user_wants_to_replace_read_only_file (uri))
                return GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME;
              else
                return GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN;
            } else
              return GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM; // fall back to the default dialog
        }
        
        ...
        
        chooser = gtk_file_chooser_dialog_new (...);
        
        gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), TRUE);
        g_signal_connect (chooser, "confirm-overwrite",
                          G_CALLBACK (confirm_overwrite_callback), NULL);
        
        if (gtk_dialog_run (chooser) == GTK_RESPONSE_ACCEPT)
                save_to_file (gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (chooser));
        
        gtk_widget_destroy (chooser);
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gtk.types.FileChooserConfirmation callback(gtk.file_chooser.FileChooser fileChooser))
  
          `fileChooser` the instance the signal is connected to (optional)
  
          `Returns` a #GtkFileChooserConfirmation value that indicates which
             action to take after emitting the signal.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConfirmOverwrite(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gtk.types.FileChooserConfirmation)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser.FileChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gtk.types.FileChooserConfirmation)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("confirm-overwrite", closure, after);
  }

  /**
      Connect to `CurrentFolderChanged` signal.
  
      This signal is emitted when the current folder in a #GtkFileChooser
        changes.  This can happen due to the user performing some action that
        changes folders, such as selecting a bookmark or visiting a folder on the
        file list.  It can also happen as a result of calling a function to
        explicitly change the current folder in a file chooser.
        
        Normally you do not need to connect to this signal, unless you need to keep
        track of which folder a file chooser is showing.
        
        See also:  [gtk.file_chooser.FileChooser.setCurrentFolder],
        [gtk.file_chooser.FileChooser.getCurrentFolder],
        [gtk.file_chooser.FileChooser.setCurrentFolderUri],
        [gtk.file_chooser.FileChooser.getCurrentFolderUri].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser.FileChooser fileChooser))
  
          `fileChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCurrentFolderChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser.FileChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-folder-changed", closure, after);
  }

  /**
      Connect to `FileActivated` signal.
  
      This signal is emitted when the user "activates" a file in the file
        chooser.  This can happen by double-clicking on a file in the file list, or
        by pressing `Enter`.
        
        Normally you do not need to connect to this signal.  It is used internally
        by #GtkFileChooserDialog to know when to activate the default button in the
        dialog.
        
        See also: [gtk.file_chooser.FileChooser.getFilename],
        [gtk.file_chooser.FileChooser.getFilenames], [gtk.file_chooser.FileChooser.getUri],
        [gtk.file_chooser.FileChooser.getUris].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser.FileChooser fileChooser))
  
          `fileChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFileActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser.FileChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("file-activated", closure, after);
  }

  /**
      Connect to `SelectionChanged` signal.
  
      This signal is emitted when there is a change in the set of selected files
        in a #GtkFileChooser.  This can happen when the user modifies the selection
        with the mouse or the keyboard, or when explicitly calling functions to
        change the selection.
        
        Normally you do not need to connect to this signal, as it is easier to wait
        for the file chooser to finish running, and then to get the list of
        selected files using the functions mentioned below.
        
        See also: [gtk.file_chooser.FileChooser.selectFilename],
        [gtk.file_chooser.FileChooser.unselectFilename], [gtk.file_chooser.FileChooser.getFilename],
        [gtk.file_chooser.FileChooser.getFilenames], [gtk.file_chooser.FileChooser.selectUri],
        [gtk.file_chooser.FileChooser.unselectUri], [gtk.file_chooser.FileChooser.getUri],
        [gtk.file_chooser.FileChooser.getUris].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser.FileChooser fileChooser))
  
          `fileChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser.FileChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      Connect to `UpdatePreview` signal.
  
      This signal is emitted when the preview in a file chooser should be
        regenerated.  For example, this can happen when the currently selected file
        changes.  You should use this signal if you want your file chooser to have
        a preview widget.
        
        Once you have installed a preview widget with
        [gtk.file_chooser.FileChooser.setPreviewWidget], you should update it when this
        signal is emitted.  You can use the functions
        [gtk.file_chooser.FileChooser.getPreviewFilename] or
        [gtk.file_chooser.FileChooser.getPreviewUri] to get the name of the file to preview.
        Your widget may not be able to preview all kinds of files; your callback
        must call [gtk.file_chooser.FileChooser.setPreviewWidgetActive] to inform the file
        chooser about whether the preview was generated successfully or not.
        
        Please see the example code in
        [Using a Preview Widget][gtkfilechooser-preview].
        
        See also: [gtk.file_chooser.FileChooser.setPreviewWidget],
        [gtk.file_chooser.FileChooser.setPreviewWidgetActive],
        [gtk.file_chooser.FileChooser.setUsePreviewLabel],
        [gtk.file_chooser.FileChooser.getPreviewFilename],
        [gtk.file_chooser.FileChooser.getPreviewUri].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser.FileChooser fileChooser))
  
          `fileChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpdatePreview(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser.FileChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update-preview", closure, after);
  }
}
