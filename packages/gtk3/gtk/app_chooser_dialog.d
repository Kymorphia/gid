/// Module for [AppChooserDialog] class
module gtk.app_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.file;
import gobject.object;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    #GtkAppChooserDialog shows a #GtkAppChooserWidget inside a #GtkDialog.
    
    Note that #GtkAppChooserDialog does not have any interesting methods
    of its own. Instead, you should get the embedded #GtkAppChooserWidget
    using [gtk.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic #GtkAppChooser interface is not sufficient for your needs.
    
    To set the heading that is shown above the #GtkAppChooserWidget,
    use [gtk.app_chooser_dialog.AppChooserDialog.setHeading].
*/
class AppChooserDialog : gtk.dialog.Dialog, gtk.app_chooser.AppChooser
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
    return cast(void function())gtk_app_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_app_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppChooserDialog self()
  {
    return this;
  }

  /**
      Get `heading` property.
      Returns: The text to show at the top of the dialog.
        The string may contain Pango markup.
  */
  @property string heading()
  {
    return getHeading();
  }

  /**
      Set `heading` property.
      Params:
        propval = The text to show at the top of the dialog.
          The string may contain Pango markup.
  */
  @property void heading(string propval)
  {
    return setHeading(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new #GtkAppChooserDialog for the provided #GFile,
      to allow the user to select an application for it.
  
      Params:
        parent = a #GtkWindow, or null
        flags = flags for this dialog
        file = a #GFile
      Returns: a newly created #GtkAppChooserDialog
  */
  this(gtk.window.Window parent, gtk.types.DialogFlags flags, gio.file.File file)
  {
    GtkWidget* _cretval;
    _cretval = gtk_app_chooser_dialog_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkAppChooserDialog for the provided content type,
      to allow the user to select an application for it.
  
      Params:
        parent = a #GtkWindow, or null
        flags = flags for this dialog
        contentType = a content type string
      Returns: a newly created #GtkAppChooserDialog
  */
  static gtk.app_chooser_dialog.AppChooserDialog newForContentType(gtk.window.Window parent, gtk.types.DialogFlags flags, string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_app_chooser_dialog_new_for_content_type(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, _contentType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.app_chooser_dialog.AppChooserDialog)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text to display at the top of the dialog.
      Returns: the text to display at the top of the dialog, or null, in which
            case a default text is displayed
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_dialog_get_heading(cast(GtkAppChooserDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the #GtkAppChooserWidget of this dialog.
      Returns: the #GtkAppChooserWidget of self
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_app_chooser_dialog_get_widget(cast(GtkAppChooserDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the text to display at the top of the dialog.
      If the heading is not set, the dialog displays a default text.
  
      Params:
        heading = a string containing Pango markup
  */
  void setHeading(string heading)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    gtk_app_chooser_dialog_set_heading(cast(GtkAppChooserDialog*)this._cPtr, _heading);
  }
}
