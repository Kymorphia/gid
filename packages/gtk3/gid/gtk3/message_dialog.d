/// Module for [MessageDialog] class
module gid.gtk3.message_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.dialog;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkMessageDialog presents a dialog with some message text. It’s simply a
    convenience widget; you could construct the equivalent of #GtkMessageDialog
    from #GtkDialog without too much effort, but #GtkMessageDialog saves typing.
    
    One difference from #GtkDialog is that #GtkMessageDialog sets the
    #GtkWindow:skip-taskbar-hint property to true, so that the dialog is hidden
    from the taskbar by default.
    
    The easiest way to do a modal message dialog is to use [gid.gtk3.dialog.Dialog.run], though
    you can also pass in the [gid.gtk4.types.DialogFlags.Modal] flag, [gid.gtk3.dialog.Dialog.run] automatically
    makes the dialog modal and waits for the user to respond to it. [gid.gtk3.dialog.Dialog.run]
    returns when any dialog button is clicked.
    
    An example for using a modal dialog:
    ```c
     GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_message_dialog_new (parent_window,
                                      flags,
                                      GTK_MESSAGE_ERROR,
                                      GTK_BUTTONS_CLOSE,
                                      "Error reading “%s”: %s",
                                      filename,
                                      g_strerror (errno));
     gtk_dialog_run (GTK_DIALOG (dialog));
     gtk_widget_destroy (dialog);
    ```
    
    You might do a non-modal #GtkMessageDialog as follows:
    
    An example for a non-modal dialog:
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
    
     g_signal_connect_swapped (dialog, "response",
                               G_CALLBACK (gtk_widget_destroy),
                               dialog);
    ```
    
    # GtkMessageDialog as GtkBuildable
    
    The GtkMessageDialog implementation of the GtkBuildable interface exposes
    the message area as an internal child with the name “message_area”.
*/
class MessageDialog : gid.gtk3.dialog.Dialog
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
      Get builder for [gid.gtk3.message_dialog.MessageDialog]
      Returns: New builder object
  */
  static MessageDialogGidBuilder builder() nothrow
  {
    return new MessageDialogGidBuilder;
  }

  /**
      Get `image` property.
      Returns: The image for this dialog.
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  @property gid.gtk3.widget.Widget image() nothrow
  {
    return getImage();
  }

  /**
      Set `image` property.
      Params:
        propval = The image for this dialog.
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  @property void image(gid.gtk3.widget.Widget propval) nothrow
  {
    setImage(propval);
  }

  /**
      Get `messageArea` property.
      Returns: The #GtkBox that corresponds to the message area of this dialog.  See
        [gid.gtk4.message_dialog.MessageDialog.getMessageArea] for a detailed description of this
        area.
  */
  @property gid.gtk3.widget.Widget messageArea() nothrow
  {
    return getMessageArea();
  }

  /**
      Get `messageType` property.
      Returns: The type of the message.
  */
  @property gid.gtk3.types.MessageType messageType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.MessageType)("message-type");
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
  */
  @property void messageType(gid.gtk3.types.MessageType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.MessageType)("message-type", propval);
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
        See [gid.pango1.global.parseMarkup].
  */
  @property bool secondaryUseMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("secondary-use-markup");
  }

  /**
      Set `secondaryUseMarkup` property.
      Params:
        propval = true if the secondary text of the dialog includes Pango markup.
          See [gid.pango1.global.parseMarkup].
  */
  @property void secondaryUseMarkup(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("secondary-use-markup", propval);
  }

  /**
      Get `text` property.
      Returns: The primary text of the message dialog. If the dialog has
        a secondary text, this will appear as the title.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The primary text of the message dialog. If the dialog has
          a secondary text, this will appear as the title.
  */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `useMarkup` property.
      Returns: true if the primary text of the dialog includes Pango markup.
        See [gid.pango1.global.parseMarkup].
  */
  @property bool useMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-markup");
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = true if the primary text of the dialog includes Pango markup.
          See [gid.pango1.global.parseMarkup].
  */
  @property void useMarkup(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-markup", propval);
  }

  /**
      Gets the dialog’s image.
      Returns: the dialog’s image
  
      Deprecated: Use #GtkDialog for dialogs with images
  */
  gid.gtk3.widget.Widget getImage() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_image(cast(GtkMessageDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the message area of the dialog. This is the box where the
      dialog’s primary and secondary labels are packed. You can add your
      own extra content to that box and it will appear below those labels.
      See [gid.gtk4.dialog.Dialog.getContentArea] for the corresponding
      function in the parent #GtkDialog.
      Returns: A #GtkBox corresponding to the
            “message area” in the message_dialog.
  */
  gid.gtk3.widget.Widget getMessageArea() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_message_area(cast(GtkMessageDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the dialog’s image to image.
  
      Params:
        image = the image
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  void setImage(gid.gtk3.widget.Widget image) nothrow
  {
    gtk_message_dialog_set_image(cast(GtkMessageDialog*)this._cPtr, image ? cast(GtkWidget*)image._cPtr(No.Dup) : null);
  }

  /**
      Sets the text of the message dialog to be str, which is marked
      up with the [Pango text markup language][PangoMarkupFormat].
  
      Params:
        str = markup string (see [Pango markup format][PangoMarkupFormat])
  */
  void setMarkup(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_message_dialog_set_markup(cast(GtkMessageDialog*)this._cPtr, _str);
  }
}

/// Fluent builder implementation template for [gid.gtk3.message_dialog.MessageDialog]
class MessageDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T
{


  /** */
  T buttons(gid.gtk3.types.ButtonsType propval) nothrow
  {
    return setProperty("buttons", propval);
  }

  /**
      Set `image` property.
      Params:
        propval = The image for this dialog.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  T image(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("image", propval);
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
      Returns: Builder instance for fluent chaining
  */
  T messageType(gid.gtk3.types.MessageType propval) nothrow
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
          See [gid.pango1.global.parseMarkup].
      Returns: Builder instance for fluent chaining
  */
  T secondaryUseMarkup(bool propval) nothrow
  {
    return setProperty("secondary-use-markup", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The primary text of the message dialog. If the dialog has
          a secondary text, this will appear as the title.
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
          See [gid.pango1.global.parseMarkup].
      Returns: Builder instance for fluent chaining
  */
  T useMarkup(bool propval) nothrow
  {
    return setProperty("use-markup", propval);
  }
}

/// Fluent builder for [gid.gtk3.message_dialog.MessageDialog]
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
