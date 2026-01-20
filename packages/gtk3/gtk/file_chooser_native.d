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
    #GtkFileChooserNative is an abstraction of a dialog box suitable
    for use with “File/Open” or “File/Save as” commands. By default, this
    just uses a #GtkFileChooserDialog to implement the actual dialog.
    However, on certain platforms, such as Windows and macOS, the native platform
    file chooser is used instead. When the application is running in a
    sandboxed environment without direct filesystem access (such as Flatpak),
    #GtkFileChooserNative may call the proper APIs (portals) to let the user
    choose a file and make it available to the application.
    
    While the API of #GtkFileChooserNative closely mirrors #GtkFileChooserDialog, the main
    difference is that there is no access to any #GtkWindow or #GtkWidget for the dialog.
    This is required, as there may not be one in the case of a platform native dialog.
    Showing, hiding and running the dialog is handled by the #GtkNativeDialog functions.
    
    ## Typical usage ## {#gtkfilechoosernative-typical-usage}
    
    In the simplest of cases, you can the following code to use
    #GtkFileChooserDialog to select a file for opening:
    
    ```
    GtkFileChooserNative *native;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    gint res;
    
    native = gtk_file_chooser_native_new ("Open File",
                                          parent_window,
                                          action,
                                          "_Open",
                                          "_Cancel");
    
    res = gtk_native_dialog_run (GTK_NATIVE_DIALOG (native));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
        GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
        filename = gtk_file_chooser_get_filename (chooser);
        open_file (filename);
        g_free (filename);
      }
    
    g_object_unref (native);
    ```
    
    To use a dialog for saving, you can use this:
    
    ```
    GtkFileChooserNative *native;
    GtkFileChooser *chooser;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    gint res;
    
    native = gtk_file_chooser_native_new ("Save File",
                                          parent_window,
                                          action,
                                          "_Save",
                                          "_Cancel");
    chooser = GTK_FILE_CHOOSER (native);
    
    gtk_file_chooser_set_do_overwrite_confirmation (chooser, TRUE);
    
    if (user_edited_a_new_document)
      gtk_file_chooser_set_current_name (chooser,
                                         _("Untitled document"));
    else
      gtk_file_chooser_set_filename (chooser,
                                     existing_filename);
    
    res = gtk_native_dialog_run (GTK_NATIVE_DIALOG (native));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
    
        filename = gtk_file_chooser_get_filename (chooser);
        save_to_file (filename);
        g_free (filename);
      }
    
    g_object_unref (native);
    ```
    
    For more information on how to best set up a file dialog, see #GtkFileChooserDialog.
    
    ## Response Codes ## {#gtkfilechooserdialognative-responses}
    
    #GtkFileChooserNative inherits from #GtkNativeDialog, which means it
    will return #GTK_RESPONSE_ACCEPT if the user accepted, and
    #GTK_RESPONSE_CANCEL if he pressed cancel. It can also return
    #GTK_RESPONSE_DELETE_EVENT if the window was unexpectedly closed.
    
    ## Differences from #GtkFileChooserDialog ##  {#gtkfilechooserdialognative-differences}
    
    There are a few things in the GtkFileChooser API that are not
    possible to use with #GtkFileChooserNative, as such use would
    prohibit the use of a native dialog.
    
    There is no support for the signals that are emitted when the user
    navigates in the dialog, including:
    $(LIST
      * #GtkFileChooser::current-folder-changed
      * #GtkFileChooser::selection-changed
      * #GtkFileChooser::file-activated
      * #GtkFileChooser::confirm-overwrite
    )
      
    You can also not use the methods that directly control user navigation:
    $(LIST
      * [gtk.file_chooser.FileChooser.unselectFilename]
      * [gtk.file_chooser.FileChooser.selectAll]
      * [gtk.file_chooser.FileChooser.unselectAll]
    )
      
    If you need any of the above you will have to use #GtkFileChooserDialog directly.
    
    No operations that change the the dialog work while the dialog is
    visible. Set all the properties that are required before showing the dialog.
    
    ## Win32 details ## {#gtkfilechooserdialognative-win32}
    
    On windows the IFileDialog implementation (added in Windows Vista) is
    used. It supports many of the features that #GtkFileChooserDialog
    does, but there are some things it does not handle:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget].
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added using a mimetype or custom filter.
    )
      
    If any of these features are used the regular #GtkFileChooserDialog
    will be used in place of the native one.
    
    ## Portal details ## {#gtkfilechooserdialognative-portal}
    
    When the org.freedesktop.portal.FileChooser portal is available on the
    session bus, it is used to bring up an out-of-process file chooser. Depending
    on the kind of session the application is running in, this may or may not
    be a GTK+ file chooser. In this situation, the following things are not
    supported and will be silently ignored:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget].
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added with a custom filter.
    )
      
    ## macOS details ## {#gtkfilechooserdialognative-macos}
    
    On macOS the NSSavePanel and NSOpenPanel classes are used to provide native
    file chooser dialogs. Some features provided by #GtkFileChooserDialog are
    not supported:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget], unless the
        widget is an instance of GtkLabel, in which case the label text will be used
        to set the NSSavePanel message instance property.
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added with a custom filter.
      
      * Shortcut folders.
    )
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
      Creates a new #GtkFileChooserNative.
  
      Params:
        title = Title of the native, or null
        parent = Transient parent of the native, or null
        action = Open or save mode for the dialog
        acceptLabel = text to go in the accept button, or null for the default
        cancelLabel = text to go in the cancel button, or null for the default
      Returns: a new #GtkFileChooserNative
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
      Returns: The custom label, or null for the default. This string
        is owned by GTK+ and should not be modified or freed
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
      Returns: The custom label, or null for the default. This string
        is owned by GTK+ and should not be modified or freed
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
      
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic.
      Pressing Alt and that key activates the button.
  
      Params:
        acceptLabel = custom label or null for the default
  */
  void setAcceptLabel(string acceptLabel = null)
  {
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    gtk_file_chooser_native_set_accept_label(cast(GtkFileChooserNative*)this._cPtr, _acceptLabel);
  }

  /**
      Sets the custom label text for the cancel button.
      
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic.
      Pressing Alt and that key activates the button.
  
      Params:
        cancelLabel = custom label or null for the default
  */
  void setCancelLabel(string cancelLabel = null)
  {
    const(char)* _cancelLabel = cancelLabel.toCString(No.Alloc);
    gtk_file_chooser_native_set_cancel_label(cast(GtkFileChooserNative*)this._cPtr, _cancelLabel);
  }
}
