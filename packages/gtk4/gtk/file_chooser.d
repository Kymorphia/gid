/// Module for [FileChooser] interface
module gtk.file_chooser;

public import gtk.file_chooser_iface_proxy;
import gid.gid;
import gio.file;
import gio.list_model;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_filter;
import gtk.types;

/**
    [gtk.file_chooser.FileChooser] is an interface that can be implemented by file
    selection widgets.
    
    In GTK, the main objects that implement this interface are
    [gtk.file_chooser_widget.FileChooserWidget] and [gtk.file_chooser_dialog.FileChooserDialog].
    
    You do not need to write an object that implements the [gtk.file_chooser.FileChooser]
    interface unless you are trying to adapt an existing file selector to
    expose a standard programming interface.
    
    [gtk.file_chooser.FileChooser] allows for shortcuts to various places in the filesystem.
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
    
    When the user is finished selecting files in a [gtk.file_chooser.FileChooser], your
    program can get the selected filenames as [gio.file.File]s.
    
    # Adding options
    
    You can add extra widgets to a file chooser to provide options
    that are not present in the default design, by using
    [gtk.file_chooser.FileChooser.addChoice]. Each choice has an identifier and
    a user visible label; additionally, each choice can have multiple
    options. If a choice has no option, it will be rendered as a
    check button with the given label; if a choice has options, it will
    be rendered as a combo box.

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
interface FileChooser
{

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_chooser_get_type != &gidSymbolNotFound ? gtk_file_chooser_get_type() : cast(GType)0;
  }

  /**
      Adds a 'choice' to the file chooser.
      
      This is typically implemented as a combobox or, for boolean choices,
      as a checkbutton. You can select a value using
      [gtk.file_chooser.FileChooser.setChoice] before the dialog is shown,
      and you can obtain the user-selected value in the
      [gtk.dialog.Dialog.response] signal handler using
      [gtk.file_chooser.FileChooser.getChoice].
  
      Params:
        id = id for the added choice
        label = user-visible label for the added choice
        options = ids for the options of the choice, or null for a boolean choice
        optionLabels = user-visible labels for the options, must be the same length as options
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void addChoice(string id, string label, string[] options = null, string[] optionLabels = null);

  /**
      Adds filter to the list of filters that the user can select between.
      
      When a filter is selected, only files that are passed by that
      filter are displayed.
      
      Note that the chooser takes ownership of the filter if it is floating,
      so you have to ref and sink it if you want to keep a reference.
  
      Params:
        filter = a [gtk.file_filter.FileFilter]
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void addFilter(gtk.file_filter.FileFilter filter);

  /**
      Adds a folder to be displayed with the shortcut folders
      in a file chooser.
  
      Params:
        folder = a [gio.file.File] for the folder to add
      Returns: true if the folder could be added successfully,
          false otherwise.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool addShortcutFolder(gio.file.File folder);

  /**
      Gets the type of operation that the file chooser is performing.
      Returns: the action that the file selector is performing
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gtk.types.FileChooserAction getAction();

  /**
      Gets the currently selected option in the 'choice' with the given ID.
  
      Params:
        id = the ID of the choice to get
      Returns: the ID of the currently selected option
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  string getChoice(string id);

  /**
      Gets whether file chooser will offer to create new folders.
      Returns: true if the Create Folder button should be displayed.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool getCreateFolders();

  /**
      Gets the current folder of chooser as [gio.file.File].
      Returns: the [gio.file.File] for the current folder.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gio.file.File getCurrentFolder();

  /**
      Gets the current name in the file selector, as entered by the user.
      
      This is meant to be used in save dialogs, to get the currently typed
      filename when the file itself does not exist yet.
      Returns: The raw text from the file chooser’s “Name” entry. Free with
          [glib.global.gfree]. Note that this string is not a full pathname or URI; it is
          whatever the contents of the entry are. Note also that this string is
          in UTF-8 encoding, which is not necessarily the system’s encoding for
          filenames.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  string getCurrentName();

  /**
      Gets the [gio.file.File] for the currently selected file in
      the file selector.
      
      If multiple files are selected, one of the files will be
      returned at random.
      
      If the file chooser is in folder mode, this function returns
      the selected folder.
      Returns: a selected [gio.file.File]. You own the
          returned file; use [gobject.object.ObjectG.unref] to release it.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gio.file.File getFile();

  /**
      Lists all the selected files and subfolders in the current folder
      of chooser as [gio.file.File].
      Returns: a list model containing a [gio.file.File] for each
          selected file and subfolder in the current folder. Free the returned
          list with [gobject.object.ObjectG.unref].
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gio.list_model.ListModel getFiles();

  /**
      Gets the current filter.
      Returns: the current filter
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gtk.file_filter.FileFilter getFilter();

  /**
      Gets the current set of user-selectable filters, as a list model.
      
      See [gtk.file_chooser.FileChooser.addFilter] and
      [gtk.file_chooser.FileChooser.removeFilter] for changing individual filters.
      
      You should not modify the returned list model. Future changes to
      chooser may or may not affect the returned model.
      Returns: a [gio.list_model.ListModel] containing the current set
          of user-selectable filters.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gio.list_model.ListModel getFilters();

  /**
      Gets whether multiple files can be selected in the file
      chooser.
      Returns: true if multiple files can be selected.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool getSelectMultiple();

  /**
      Queries the list of shortcut folders in the file chooser.
      
      You should not modify the returned list model. Future changes to
      chooser may or may not affect the returned model.
      Returns: A list model of [gio.file.File]s
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  gio.list_model.ListModel getShortcutFolders();

  /**
      Removes a 'choice' that has been added with [gtk.file_chooser.FileChooser.addChoice].
  
      Params:
        id = the ID of the choice to remove
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void removeChoice(string id);

  /**
      Removes filter from the list of filters that the user can select between.
  
      Params:
        filter = a [gtk.file_filter.FileFilter]
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void removeFilter(gtk.file_filter.FileFilter filter);

  /**
      Removes a folder from the shortcut folders in a file chooser.
  
      Params:
        folder = a [gio.file.File] for the folder to remove
      Returns: true if the folder could be removed successfully,
          false otherwise.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool removeShortcutFolder(gio.file.File folder);

  /**
      Sets the type of operation that the chooser is performing.
      
      The user interface is adapted to suit the selected action.
      
      For example, an option to create a new folder might be shown
      if the action is [gtk.types.FileChooserAction.Save] but not if the
      action is [gtk.types.FileChooserAction.Open].
  
      Params:
        action = the action that the file selector is performing
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setAction(gtk.types.FileChooserAction action);

  /**
      Selects an option in a 'choice' that has been added with
      [gtk.file_chooser.FileChooser.addChoice].
      
      For a boolean choice, the possible options are "true" and "false".
  
      Params:
        id = the ID of the choice to set
        option = the ID of the option to select
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setChoice(string id, string option);

  /**
      Sets whether file chooser will offer to create new folders.
      
      This is only relevant if the action is not set to be
      [gtk.types.FileChooserAction.Open].
  
      Params:
        createFolders = true if the Create Folder button should be displayed
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setCreateFolders(bool createFolders);

  /**
      Sets the current folder for chooser from a [gio.file.File].
  
      Params:
        file = the [gio.file.File] for the new folder
      Returns: true if the folder could be changed successfully, false
          otherwise.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool setCurrentFolder(gio.file.File file = null);

  /**
      Sets the current name in the file selector, as if entered
      by the user.
      
      Note that the name passed in here is a UTF-8 string rather
      than a filename. This function is meant for such uses as a
      suggested name in a “Save As...” dialog.  You can pass
      “Untitled.doc” or a similarly suitable suggestion for the name.
      
      If you want to preselect a particular existing file, you should
      use [gtk.file_chooser.FileChooser.setFile] instead.
      
      Please see the documentation for those functions for an example
      of using [gtk.file_chooser.FileChooser.setCurrentName] as well.
  
      Params:
        name = the filename to use, as a UTF-8 string
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setCurrentName(string name);

  /**
      Sets file as the current filename for the file chooser.
      
      This includes changing to the file’s parent folder and actually selecting
      the file in list. If the chooser is in [gtk.types.FileChooserAction.Save] mode,
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
        file = the [gio.file.File] to set as current
      Returns: Not useful
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  bool setFile(gio.file.File file);

  /**
      Sets the current filter.
      
      Only the files that pass the filter will be displayed.
      If the user-selectable list of filters is non-empty, then
      the filter should be one of the filters in that list.
      
      Setting the current filter when the list of filters is
      empty is useful if you want to restrict the displayed
      set of files without letting the user change it.
  
      Params:
        filter = a [gtk.file_filter.FileFilter]
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setFilter(gtk.file_filter.FileFilter filter);

  /**
      Sets whether multiple files can be selected in the file chooser.
      
      This is only relevant if the action is set to be
      [gtk.types.FileChooserAction.Open] or
      [gtk.types.FileChooserAction.SelectFolder].
  
      Params:
        selectMultiple = true if multiple files can be selected.
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setSelectMultiple(bool selectMultiple);
}
