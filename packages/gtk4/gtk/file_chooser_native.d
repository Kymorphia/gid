/// Module for [FileChooserNative] class
module gtk.file_chooser_native;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.native_dialog;
import gtk.types;
import gtk.window;

/**
    [gtk.file_chooser_native.FileChooserNative] is an abstraction of a dialog suitable
    for use with “File Open” or “File Save as” commands.
    
    By default, this just uses a [gtk.file_chooser_dialog.FileChooserDialog] to implement
    the actual dialog. However, on some platforms, such as Windows and
    macOS, the native platform file chooser is used instead. When the
    application is running in a sandboxed environment without direct
    filesystem access (such as Flatpak), [gtk.file_chooser_native.FileChooserNative] may call
    the proper APIs (portals) to let the user choose a file and make it
    available to the application.
    
    While the API of [gtk.file_chooser_native.FileChooserNative] closely mirrors [gtk.file_chooser_dialog.FileChooserDialog],
    the main difference is that there is no access to any [gtk.window.Window] or [gtk.widget.Widget]
    for the dialog. This is required, as there may not be one in the case of a
    platform native dialog.
    
    Showing, hiding and running the dialog is handled by the
    [gtk.native_dialog.NativeDialog] functions.
    
    Note that unlike [gtk.file_chooser_dialog.FileChooserDialog], [gtk.file_chooser_native.FileChooserNative] objects
    are not toplevel widgets, and GTK does not keep them alive. It is your
    responsibility to keep a reference until you are done with the
    object.
    
    ## Typical usage
    
    In the simplest of cases, you can the following code to use
    [gtk.file_chooser_native.FileChooserNative] to select a file for opening:
    
    ```c
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);
    
          open_file (file);
    
          g_object_unref (file);
        }
    
      g_object_unref (native);
    }
    
      // ...
      GtkFileChooserNative *native;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    
      native = gtk_file_chooser_native_new ("Open File",
                                            parent_window,
                                            action,
                                            "_Open",
                                            "_Cancel");
    
      g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ```
    
    To use a [gtk.file_chooser_native.FileChooserNative] for saving, you can use this:
    
    ```c
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);
    
          save_to_file (file);
    
          g_object_unref (file);
        }
    
      g_object_unref (native);
    }
    
      // ...
      GtkFileChooserNative *native;
      GtkFileChooser *chooser;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    
      native = gtk_file_chooser_native_new ("Save File",
                                            parent_window,
                                            action,
                                            "_Save",
                                            "_Cancel");
      chooser = GTK_FILE_CHOOSER (native);
    
      if (user_edited_a_new_document)
        gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
      else
        gtk_file_chooser_set_file (chooser, existing_file, NULL);
    
      g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ```
    
    For more information on how to best set up a file dialog,
    see the [gtk.file_chooser_dialog.FileChooserDialog] documentation.
    
    ## Response Codes
    
    [gtk.file_chooser_native.FileChooserNative] inherits from [gtk.native_dialog.NativeDialog],
    which means it will return [gtk.types.ResponseType.Accept] if the user accepted,
    and [gtk.types.ResponseType.Cancel] if he pressed cancel. It can also return
    [gtk.types.ResponseType.DeleteEvent] if the window was unexpectedly closed.
    
    ## Differences from [gtk.file_chooser_dialog.FileChooserDialog]
    
    There are a few things in the [gtk.file_chooser.FileChooser] interface that
    are not possible to use with [gtk.file_chooser_native.FileChooserNative], as such use would
    prohibit the use of a native dialog.
    
    No operations that change the dialog work while the dialog is visible.
    Set all the properties that are required before showing the dialog.
    
    ## Win32 details
    
    On windows the `IFileDialog` implementation (added in Windows Vista) is
    used. It supports many of the features that [gtk.file_chooser.FileChooser] has, but
    there are some things it does not handle:
    
    $(LIST
      * Any [gtk.file_filter.FileFilter] added using a mimetype
    )
      
    If any of these features are used the regular [gtk.file_chooser_dialog.FileChooserDialog]
    will be used in place of the native one.
    
    ## Portal details
    
    When the `org.freedesktop.portal.FileChooser` portal is available on
    the session bus, it is used to bring up an out-of-process file chooser.
    Depending on the kind of session the application is running in, this may
    or may not be a GTK file chooser.
    
    ## macOS details
    
    On macOS the `NSSavePanel` and `NSOpenPanel` classes are used to provide
    native file chooser dialogs. Some features provided by [gtk.file_chooser.FileChooser]
    are not supported:
    
    $(LIST
      * Shortcut folders.
    )

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
class FileChooserNative : gtk.native_dialog.NativeDialog, gtk.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_native_get_type != &gidSymbolNotFound ? gtk_file_chooser_native_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserNative self()
  {
    return this;
  }

  /**
      Get `acceptLabel` property.
      Returns: The text used for the label on the accept button in the dialog, or
        null to use the default text.
  */
  @property string acceptLabel()
  {
    return getAcceptLabel();
  }

  /**
      Set `acceptLabel` property.
      Params:
        propval = The text used for the label on the accept button in the dialog, or
          null to use the default text.
  */
  @property void acceptLabel(string propval)
  {
    return setAcceptLabel(propval);
  }

  /**
      Get `cancelLabel` property.
      Returns: The text used for the label on the cancel button in the dialog, or
        null to use the default text.
  */
  @property string cancelLabel()
  {
    return getCancelLabel();
  }

  /**
      Set `cancelLabel` property.
      Params:
        propval = The text used for the label on the cancel button in the dialog, or
          null to use the default text.
  */
  @property void cancelLabel(string propval)
  {
    return setCancelLabel(propval);
  }

  mixin FileChooserT!();

  /**
      Creates a new [gtk.file_chooser_native.FileChooserNative].
  
      Params:
        title = Title of the native
        parent = Transient parent of the native
        action = Open or save mode for the dialog
        acceptLabel = text to go in the accept button, or null for the default
        cancelLabel = text to go in the cancel button, or null for the default
      Returns: a new [gtk.file_chooser_native.FileChooserNative]
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  this(string title, gtk.window.Window parent, gtk.types.FileChooserAction action, string acceptLabel = null, string cancelLabel = null)
  {
    GtkFileChooserNative* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    const(char)* _cancelLabel = cancelLabel.toCString(No.Alloc);
    _cretval = gtk_file_chooser_native_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, action, _acceptLabel, _cancelLabel);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the custom label text for the accept button.
      Returns: The custom label
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  string getAcceptLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_file_chooser_native_get_accept_label(cast(GtkFileChooserNative*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the custom label text for the cancel button.
      Returns: The custom label
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  string getCancelLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_file_chooser_native_get_cancel_label(cast(GtkFileChooserNative*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the custom label text for the accept button.
      
      If characters in label are preceded by an underscore, they are
      underlined. If you need a literal underscore character in a label,
      use “__” (two underscores). The first underlined character represents
      a keyboard accelerator called a mnemonic.
      
      Pressing Alt and that key should activate the button.
  
      Params:
        acceptLabel = custom label
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setAcceptLabel(string acceptLabel = null)
  {
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    gtk_file_chooser_native_set_accept_label(cast(GtkFileChooserNative*)this._cPtr, _acceptLabel);
  }

  /**
      Sets the custom label text for the cancel button.
      
      If characters in label are preceded by an underscore, they are
      underlined. If you need a literal underscore character in a label,
      use “__” (two underscores). The first underlined character represents
      a keyboard accelerator called a mnemonic.
      
      Pressing Alt and that key should activate the button.
  
      Params:
        cancelLabel = custom label
  
      Deprecated: Use [gtk.file_dialog.FileDialog] instead
  */
  void setCancelLabel(string cancelLabel = null)
  {
    const(char)* _cancelLabel = cancelLabel.toCString(No.Alloc);
    gtk_file_chooser_native_set_cancel_label(cast(GtkFileChooserNative*)this._cPtr, _cancelLabel);
  }
}
