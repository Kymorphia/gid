/// Module for [MessageDialog] class
module gtk.message_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.types;
import gtk.widget;

/**
    #GtkMessageDialog presents a dialog with some message text. It’s simply a
    convenience widget; you could construct the equivalent of #GtkMessageDialog
    from #GtkDialog without too much effort, but #GtkMessageDialog saves typing.
    
    One difference from #GtkDialog is that #GtkMessageDialog sets the
    #GtkWindow:skip-taskbar-hint property to true, so that the dialog is hidden
    from the taskbar by default.
    
    The easiest way to do a modal message dialog is to use [gtk.dialog.Dialog.run], though
    you can also pass in the [gtk.types.DialogFlags.Modal] flag, [gtk.dialog.Dialog.run] automatically
    makes the dialog modal and waits for the user to respond to it. [gtk.dialog.Dialog.run]
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
class MessageDialog : gtk.dialog.Dialog
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
    return cast(void function())gtk_message_dialog_get_type != &gidSymbolNotFound ? gtk_message_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageDialog self()
  {
    return this;
  }

  /**
      Get `image` property.
      Returns: The image for this dialog.
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  @property gtk.widget.Widget image()
  {
    return getImage();
  }

  /**
      Set `image` property.
      Params:
        propval = The image for this dialog.
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  @property void image(gtk.widget.Widget propval)
  {
    return setImage(propval);
  }

  /**
      Get `messageArea` property.
      Returns: The #GtkBox that corresponds to the message area of this dialog.  See
        [gtk.message_dialog.MessageDialog.getMessageArea] for a detailed description of this
        area.
  */
  @property gtk.widget.Widget messageArea()
  {
    return getMessageArea();
  }

  /**
      Get `messageType` property.
      Returns: The type of the message.
  */
  @property gtk.types.MessageType messageType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.MessageType)("message-type");
  }

  /**
      Set `messageType` property.
      Params:
        propval = The type of the message.
  */
  @property void messageType(gtk.types.MessageType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.MessageType)("message-type", propval);
  }

  /**
      Get `secondaryText` property.
      Returns: The secondary text of the message dialog.
  */
  @property string secondaryText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-text");
  }

  /**
      Set `secondaryText` property.
      Params:
        propval = The secondary text of the message dialog.
  */
  @property void secondaryText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("secondary-text", propval);
  }

  /**
      Get `secondaryUseMarkup` property.
      Returns: true if the secondary text of the dialog includes Pango markup.
        See [pango.global.parseMarkup].
  */
  @property bool secondaryUseMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("secondary-use-markup");
  }

  /**
      Set `secondaryUseMarkup` property.
      Params:
        propval = true if the secondary text of the dialog includes Pango markup.
          See [pango.global.parseMarkup].
  */
  @property void secondaryUseMarkup(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("secondary-use-markup", propval);
  }

  /**
      Get `text` property.
      Returns: The primary text of the message dialog. If the dialog has
        a secondary text, this will appear as the title.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The primary text of the message dialog. If the dialog has
          a secondary text, this will appear as the title.
  */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `useMarkup` property.
      Returns: true if the primary text of the dialog includes Pango markup.
        See [pango.global.parseMarkup].
  */
  @property bool useMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-markup");
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = true if the primary text of the dialog includes Pango markup.
          See [pango.global.parseMarkup].
  */
  @property void useMarkup(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-markup", propval);
  }

  /**
      Gets the dialog’s image.
      Returns: the dialog’s image
  
      Deprecated: Use #GtkDialog for dialogs with images
  */
  gtk.widget.Widget getImage()
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_image(cast(GtkMessageDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the message area of the dialog. This is the box where the
      dialog’s primary and secondary labels are packed. You can add your
      own extra content to that box and it will appear below those labels.
      See [gtk.dialog.Dialog.getContentArea] for the corresponding
      function in the parent #GtkDialog.
      Returns: A #GtkBox corresponding to the
            “message area” in the message_dialog.
  */
  gtk.widget.Widget getMessageArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_message_area(cast(GtkMessageDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the dialog’s image to image.
  
      Params:
        image = the image
  
      Deprecated: Use #GtkDialog to create dialogs with images
  */
  void setImage(gtk.widget.Widget image)
  {
    gtk_message_dialog_set_image(cast(GtkMessageDialog*)this._cPtr, image ? cast(GtkWidget*)image._cPtr(No.Dup) : null);
  }

  /**
      Sets the text of the message dialog to be str, which is marked
      up with the [Pango text markup language][PangoMarkupFormat].
  
      Params:
        str = markup string (see [Pango markup format][PangoMarkupFormat])
  */
  void setMarkup(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_message_dialog_set_markup(cast(GtkMessageDialog*)this._cPtr, _str);
  }
}
