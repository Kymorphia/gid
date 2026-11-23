/// Module for [MessageDialog] class
module gid.gtk4.message_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    [gid.gtk4.message_dialog.MessageDialog] presents a dialog with some message text.
    
    <picture>
      <source srcset="messagedialog-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkMessageDialog" src="messagedialog.png">
    </picture>
    
    It’s simply a convenience widget; you could construct the equivalent of
    [gid.gtk4.message_dialog.MessageDialog] from [gid.gtk4.dialog.Dialog] without too much effort, but
    [gid.gtk4.message_dialog.MessageDialog] saves typing.
    
    The easiest way to do a modal message dialog is to use the [gid.gtk4.types.DialogFlags.Modal]
    flag, which will call [gid.gtk4.window.Window.setModal] internally. The dialog will
    prevent interaction with the parent window until it's hidden or destroyed.
    You can use the [gid.gtk4.dialog.Dialog.response] signal to know when the user
    dismissed the dialog.
    
    An example for using a modal dialog:
    ```c
    GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT | GTK_DIALOG_MODAL;
    dialog = gtk_message_dialog_new (parent_window,
                                     flags,
                                     GTK_MESSAGE_ERROR,
                                     GTK_BUTTONS_CLOSE,
                                     "Error reading “%s”: %s",
                                     filename,
                                     g_strerror (errno));
    // Destroy the dialog when the user responds to it
    // (e.g. clicks a button)
    
    g_signal_connect (dialog, "response",
                      G_CALLBACK (gtk_window_destroy),
                      NULL);
    ```
    
    You might do a non-modal [gid.gtk4.message_dialog.MessageDialog] simply by omitting the
    [gid.gtk4.types.DialogFlags.Modal] flag:
    
    ```c
    GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
    dialog = gtk_message_dialog_new (parent_window,
                                     flags,
                                     GTK_MESSAGE_ERROR,
                                     GTK_BUTTONS_CLOSE,
                                     "Error reading “%s”: %s",
                                     filename,
                                     g_strerror (errno));
    
    // Destroy the dialog when the user responds to it
    // (e.g. clicks a button)
    g_signal_connect (dialog, "response",
                      G_CALLBACK (gtk_window_destroy),
                      NULL);
    ```
    
    # GtkMessageDialog as GtkBuildable
    
    The [gid.gtk4.message_dialog.MessageDialog] implementation of the [gid.gtk4.buildable.Buildable] interface exposes
    the message area as an internal child with the name “message_area”.

    Deprecated: Use [gid.gtk4.alert_dialog.AlertDialog] instead
*/
class MessageDialog : gid.gtk4.dialog.Dialog
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_message_dialog_get_type != &gidSymbolNotFound ? gtk_message_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMessageDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.message_dialog.MessageDialog]
      Returns: New builder object
  */
  static MessageDialogGidBuilder builder() nothrow
  {
    return new MessageDialogGidBuilder;
  }

  /**
      Get `messageArea` property.
      Returns: The [gid.gtk4.box.Box] that corresponds to the message area of this dialog.
        
        See [gid.gtk4.message_dialog.MessageDialog.getMessageArea] for a detailed
        description of this area.
  */
  @property gid.gtk4.widget.Widget messageArea() nothrow
  {
    return getMessageArea();
  }

  /**
      Get `messageType` property.
      Returns: The type of the message.
  */
  @property gid.gtk4.types.MessageType messageType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.MessageType)("message-type");
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
  */
  @property void messageType(gid.gtk4.types.MessageType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.MessageType)("message-type", propval);
  }

  /**
      Get `secondaryText` property.
      Returns: The secondary text of the message dialog.
  */
  @property string secondaryText() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("secondary-text");
  }

  /**
      Set `secondaryText` property.
      Params:
        propval = The secondary text of the message dialog.
  */
  @property void secondaryText(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("secondary-text", propval);
  }

  /**
      Get `secondaryUseMarkup` property.
      Returns: true if the secondary text of the dialog includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property bool secondaryUseMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("secondary-use-markup");
  }

  /**
      Set `secondaryUseMarkup` property.
      Params:
        propval = true if the secondary text of the dialog includes Pango markup.
          
          See `func@Pango.parse_markup`.
  */
  @property void secondaryUseMarkup(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("secondary-use-markup", propval);
  }

  /**
      Get `text` property.
      Returns: The primary text of the message dialog.
        
        If the dialog has a secondary text, this will appear as the title.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The primary text of the message dialog.
          
          If the dialog has a secondary text, this will appear as the title.
  */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `useMarkup` property.
      Returns: true if the primary text of the dialog includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property bool useMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-markup");
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = true if the primary text of the dialog includes Pango markup.
          
          See `func@Pango.parse_markup`.
  */
  @property void useMarkup(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-markup", propval);
  }

  /**
      Returns the message area of the dialog.
      
      This is the box where the dialog’s primary and secondary labels
      are packed. You can add your own extra content to that box and it
      will appear below those labels. See [gid.gtk4.dialog.Dialog.getContentArea]
      for the corresponding function in the parent [gid.gtk4.dialog.Dialog].
      Returns: A [gid.gtk4.box.Box] corresponding to the
          “message area” in the message_dialog
  
      Deprecated: Use [gid.gtk4.alert_dialog.AlertDialog] instead
  */
  gid.gtk4.widget.Widget getMessageArea() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_message_area(cast(GtkMessageDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the text of the message dialog.
  
      Params:
        str = string with Pango markup
  
      Deprecated: Use [gid.gtk4.alert_dialog.AlertDialog] instead
  */
  void setMarkup(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_message_dialog_set_markup(cast(GtkMessageDialog*)this._cPtr, _str);
  }
}

/// Fluent builder implementation template for [gid.gtk4.message_dialog.MessageDialog]
class MessageDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T
{


  /**
      Set `buttons` property.
      Params:
        propval = Set of buttons to display on the dialog.
      Returns: Builder instance for fluent chaining
  */
  T buttons(gid.gtk4.types.ButtonsType propval) nothrow
  {
    return setProperty("buttons", propval);
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
      Returns: Builder instance for fluent chaining
  */
  T messageType(gid.gtk4.types.MessageType propval) nothrow
  {
    return setProperty("message-type", propval);
  }

  /**
      Set `secondaryText` property.
      Params:
        propval = The secondary text of the message dialog.
      Returns: Builder instance for fluent chaining
  */
  T secondaryText(string propval) nothrow
  {
    return setProperty("secondary-text", propval);
  }

  /**
      Set `secondaryUseMarkup` property.
      Params:
        propval = true if the secondary text of the dialog includes Pango markup.
          
          See `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T secondaryUseMarkup(bool propval) nothrow
  {
    return setProperty("secondary-use-markup", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The primary text of the message dialog.
          
          If the dialog has a secondary text, this will appear as the title.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = true if the primary text of the dialog includes Pango markup.
          
          See `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T useMarkup(bool propval) nothrow
  {
    return setProperty("use-markup", propval);
  }
}

/// Fluent builder for [gid.gtk4.message_dialog.MessageDialog]
final class MessageDialogGidBuilder : MessageDialogGidBuilderImpl!MessageDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MessageDialog build() nothrow
  {
    return new MessageDialog(cast(void*)createGObject(MessageDialog._getGType), Yes.Take);
  }
}
