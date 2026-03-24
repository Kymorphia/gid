/// Module for [FileChooserDialog] class
module gtk.file_chooser_dialog;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;

/**
    [gtk.file_chooser_dialog.FileChooserDialog] is a dialog suitable for use with
    “File Open” or “File Save” commands.
    
    ![An example GtkFileChooserDialog](filechooser.png)
    
    This widget works by putting a [gtk.file_chooser_widget.FileChooserWidget]
    inside a [gtk.dialog.Dialog]. It exposes the [gtk.file_chooser.FileChooser]
    interface, so you can use all of the [gtk.file_chooser.FileChooser] functions
    on the file chooser dialog as well as those for [gtk.dialog.Dialog].
    
    Note that [gtk.file_chooser_dialog.FileChooserDialog] does not have any methods of its
    own. Instead, you should use the functions that work on a
    [gtk.file_chooser.FileChooser].
    
    If you want to integrate well with the platform you should use the
    [gtk.file_chooser_native.FileChooserNative] API, which will use a platform-specific
    dialog if available and fall back to [gtk.file_chooser_dialog.FileChooserDialog]
    otherwise.
    
    ## Typical usage
    
    In the simplest of cases, you can the following code to use
    [gtk.file_chooser_dialog.FileChooserDialog] to select a file for opening:
    
    ```c
    static void
    on_open_response (GtkDialog *dialog,
                      int        response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
    
          g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
    
          open_file (file);
        }
    
      gtk_window_destroy (GTK_WINDOW (dialog));
    }
    
      // ...
      GtkWidget *dialog;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    
      dialog = gtk_file_chooser_dialog_new ("Open File",
                                            parent_window,
                                            action,
                                            _("_Cancel"),
                                            GTK_RESPONSE_CANCEL,
                                            _("_Open"),
                                            GTK_RESPONSE_ACCEPT,
                                            NULL);
    
      gtk_window_present (GTK_WINDOW (dialog));
    
      g_signal_connect (dialog, "response",
                        G_CALLBACK (on_open_response),
                        NULL);
    ```
    
    To use a dialog for saving, you can use this:
    
    ```c
    static void
    on_save_response (GtkDialog *dialog,
                      int        response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
    
          g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
    
          save_to_file (file);
        }
    
      gtk_window_destroy (GTK_WINDOW (dialog));
    }
    
      // ...
      GtkWidget *dialog;
      GtkFileChooser *chooser;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    
      dialog = gtk_file_chooser_dialog_new ("Save File",
                                            parent_window,
                                            action,
                                            _("_Cancel"),
                                            GTK_RESPONSE_CANCEL,
                                            _("_Save"),
                                            GTK_RESPONSE_ACCEPT,
                                            NULL);
      chooser = GTK_FILE_CHOOSER (dialog);
    
      if (user_edited_a_new_document)
        gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
      else
        gtk_file_chooser_set_file (chooser, existing_filename);
    
      gtk_window_present (GTK_WINDOW (dialog));
    
      g_signal_connect (dialog, "response",
                        G_CALLBACK (on_save_response),
                        NULL);
    ```
    
    ## Setting up a file chooser dialog
    
    There are various cases in which you may need to use a [gtk.file_chooser_dialog.FileChooserDialog]:
    
    $(LIST
      * To select a file for opening, use [gtk.types.FileChooserAction.Open].
      
      * To save a file for the first time, use [gtk.types.FileChooserAction.Save],
        and suggest a name such as “Untitled” with
        [gtk.file_chooser.FileChooser.setCurrentName].
      
      * To save a file under a different name, use [gtk.types.FileChooserAction.Save],
        and set the existing file with [gtk.file_chooser.FileChooser.setFile].
      
      * To choose a folder instead of a filem use [gtk.types.FileChooserAction.SelectFolder].
    )
      
    In general, you should only cause the file chooser to show a specific
    folder when it is appropriate to use [gtk.file_chooser.FileChooser.setFile],
    i.e. when you are doing a “Save As” command and you already have a file
    saved somewhere.
    
    ## Response Codes
    
    [gtk.file_chooser_dialog.FileChooserDialog] inherits from [gtk.dialog.Dialog], so buttons that
    go in its action area have response codes such as [gtk.types.ResponseType.Accept] and
    [gtk.types.ResponseType.Cancel]. For example, you could call
    [gtk.file_chooser_dialog.FileChooserDialog.new_] as follows:
    
    ```c
    GtkWidget *dialog;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    
    dialog = gtk_file_chooser_dialog_new ("Open File",
                                          parent_window,
                                          action,
                                          _("_Cancel"),
                                          GTK_RESPONSE_CANCEL,
                                          _("_Open"),
                                          GTK_RESPONSE_ACCEPT,
                                          NULL);
    ```
    
    This will create buttons for “Cancel” and “Open” that use predefined
    response identifiers from [gtk.types.ResponseType].  For most dialog
    boxes you can use your own custom response codes rather than the
    ones in [gtk.types.ResponseType], but [gtk.file_chooser_dialog.FileChooserDialog] assumes that
    its “accept”-type action, e.g. an “Open” or “Save” button,
    will have one of the following response codes:
    
    $(LIST
      * [gtk.types.ResponseType.Accept]
      * [gtk.types.ResponseType.Ok]
      * [gtk.types.ResponseType.Yes]
      * [gtk.types.ResponseType.Apply]
    )
      
    This is because [gtk.file_chooser_dialog.FileChooserDialog] must intercept responses and switch
    to folders if appropriate, rather than letting the dialog terminate — the
    implementation uses these known response codes to know which responses can
    be blocked if appropriate.
    
    To summarize, make sure you use a predefined response code
    when you use [gtk.file_chooser_dialog.FileChooserDialog] to ensure proper operation.
    
    ## CSS nodes
    
    [gtk.file_chooser_dialog.FileChooserDialog] has a single CSS node with the name `window` and style
    class `.filechooser`.

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
class FileChooserDialog : gtk.dialog.Dialog, gtk.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_file_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserDialog self()
  {
    return this;
  }

  /**
  Get builder for [gtk.file_chooser_dialog.FileChooserDialog]
  Returns: New builder object
  */
  static FileChooserDialogGidBuilder builder()
  {
    return new FileChooserDialogGidBuilder;
  }

  mixin FileChooserT!();
}

class FileChooserDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T, gtk.file_chooser.FileChooserGidBuilderImpl!T
{

  mixin FileChooserGidBuilderT!();
}

/// Fluent builder for [gtk.file_chooser_dialog.FileChooserDialog]
final class FileChooserDialogGidBuilder : FileChooserDialogGidBuilderImpl!FileChooserDialogGidBuilder
{
  FileChooserDialog build()
  {
    return new FileChooserDialog(cast(void*)createGObject(FileChooserDialog._getGType), No.Take);
  }
}
