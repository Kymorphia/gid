/// Module for [FileChooserDialog] class
module gid.gtk4.file_chooser_dialog;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.file_chooser;
import gid.gtk4.file_chooser_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;

/**
    [gid.gtk4.file_chooser_dialog.FileChooserDialog] is a dialog suitable for use with
    “File Open” or “File Save” commands.
    
    ![An example GtkFileChooserDialog](filechooser.png)
    
    This widget works by putting a [gid.gtk4.file_chooser_widget.FileChooserWidget]
    inside a [gid.gtk4.dialog.Dialog]. It exposes the [gid.gtk4.file_chooser.FileChooser]
    interface, so you can use all of the [gid.gtk4.file_chooser.FileChooser] functions
    on the file chooser dialog as well as those for [gid.gtk4.dialog.Dialog].
    
    Note that [gid.gtk4.file_chooser_dialog.FileChooserDialog] does not have any methods of its
    own. Instead, you should use the functions that work on a
    [gid.gtk4.file_chooser.FileChooser].
    
    If you want to integrate well with the platform you should use the
    [gid.gtk4.file_chooser_native.FileChooserNative] API, which will use a platform-specific
    dialog if available and fall back to [gid.gtk4.file_chooser_dialog.FileChooserDialog]
    otherwise.
    
    ## Typical usage
    
    In the simplest of cases, you can the following code to use
    [gid.gtk4.file_chooser_dialog.FileChooserDialog] to select a file for opening:
    
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
    
    There are various cases in which you may need to use a [gid.gtk4.file_chooser_dialog.FileChooserDialog]:
    
    - To select a file for opening, use [gid.gtk4.types.FileChooserAction.Open].
    
    - To save a file for the first time, use [gid.gtk4.types.FileChooserAction.Save],
      and suggest a name such as “Untitled” with
      [gid.gtk4.file_chooser.FileChooser.setCurrentName].
    
    - To save a file under a different name, use [gid.gtk4.types.FileChooserAction.Save],
      and set the existing file with [gid.gtk4.file_chooser.FileChooser.setFile].
    
    - To choose a folder instead of a file, use [gid.gtk4.types.FileChooserAction.SelectFolder].
    
    In general, you should only cause the file chooser to show a specific
    folder when it is appropriate to use [gid.gtk4.file_chooser.FileChooser.setFile],
    i.e. when you are doing a “Save As” command and you already have a file
    saved somewhere.
    
    ## Response Codes
    
    [gid.gtk4.file_chooser_dialog.FileChooserDialog] inherits from [gid.gtk4.dialog.Dialog], so buttons that
    go in its action area have response codes such as [gid.gtk4.types.ResponseType.Accept] and
    [gid.gtk4.types.ResponseType.Cancel]. For example, you could call
    [gid.gtk4.file_chooser_dialog.FileChooserDialog.new_] as follows:
    
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
    response identifiers from [gid.gtk4.types.ResponseType].  For most dialog
    boxes you can use your own custom response codes rather than the
    ones in [gid.gtk4.types.ResponseType], but [gid.gtk4.file_chooser_dialog.FileChooserDialog] assumes that
    its “accept”-type action, e.g. an “Open” or “Save” button,
    will have one of the following response codes:
    
    - [gid.gtk4.types.ResponseType.Accept]
    - [gid.gtk4.types.ResponseType.Ok]
    - [gid.gtk4.types.ResponseType.Yes]
    - [gid.gtk4.types.ResponseType.Apply]
    
    This is because [gid.gtk4.file_chooser_dialog.FileChooserDialog] must intercept responses and switch
    to folders if appropriate, rather than letting the dialog terminate — the
    implementation uses these known response codes to know which responses can
    be blocked if appropriate.
    
    To summarize, make sure you use a predefined response code
    when you use [gid.gtk4.file_chooser_dialog.FileChooserDialog] to ensure proper operation.
    
    ## CSS nodes
    
    [gid.gtk4.file_chooser_dialog.FileChooserDialog] has a single CSS node with the name `window` and style
    class `.filechooser`.

    Deprecated: Use [gid.gtk4.file_dialog.FileDialog] instead
*/
class FileChooserDialog : gid.gtk4.dialog.Dialog, gid.gtk4.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_file_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFileChooserDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.file_chooser_dialog.FileChooserDialog]
      Returns: New builder object
  */
  static FileChooserDialogGidBuilder builder() nothrow
  {
    return new FileChooserDialogGidBuilder;
  }

  mixin FileChooserT!();
}

/// Fluent builder implementation template for [gid.gtk4.file_chooser_dialog.FileChooserDialog]
class FileChooserDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T, gid.gtk4.file_chooser.FileChooserGidBuilderImpl!T
{

  mixin FileChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.file_chooser_dialog.FileChooserDialog]
final class FileChooserDialogGidBuilder : FileChooserDialogGidBuilderImpl!FileChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileChooserDialog build() nothrow
  {
    return new FileChooserDialog(cast(void*)createGObject(FileChooserDialog._getGType), Yes.Take);
  }
}
