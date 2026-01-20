/// Module for [AppChooserDialog] class
module gtk.app_chooser_dialog;

import gid.gid;
import gio.file;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    [gtk.app_chooser_dialog.AppChooserDialog] shows a [gtk.app_chooser_widget.AppChooserWidget] inside a [gtk.dialog.Dialog].
    
    ![An example GtkAppChooserDialog](appchooserdialog.png)
    
    Note that [gtk.app_chooser_dialog.AppChooserDialog] does not have any interesting methods
    of its own. Instead, you should get the embedded [gtk.app_chooser_widget.AppChooserWidget]
    using [gtk.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic [gtk.app_chooser.AppChooser] interface is not sufficient for
    your needs.
    
    To set the heading that is shown above the [gtk.app_chooser_widget.AppChooserWidget],
    use [gtk.app_chooser_dialog.AppChooserDialog.setHeading].
    
    ## CSS nodes
    
    [gtk.app_chooser_dialog.AppChooserDialog] has a single CSS node with the name `window` and style
    class `.appchooser`.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
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
      Creates a new [gtk.app_chooser_dialog.AppChooserDialog] for the provided [gio.file.File].
      
      The dialog will show applications that can open the file.
  
      Params:
        parent = a [gtk.window.Window]
        flags = flags for this dialog
        file = a [gio.file.File]
      Returns: a newly created [gtk.app_chooser_dialog.AppChooserDialog]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(gtk.window.Window parent, gtk.types.DialogFlags flags, gio.file.File file)
  {
    GtkWidget* _cretval;
    _cretval = gtk_app_chooser_dialog_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, flags, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.app_chooser_dialog.AppChooserDialog] for the provided content type.
      
      The dialog will show applications that can open the content type.
  
      Params:
        parent = a [gtk.window.Window]
        flags = flags for this dialog
        contentType = a content type string
      Returns: a newly created [gtk.app_chooser_dialog.AppChooserDialog]
  
      Deprecated: This widget will be removed in GTK 5
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
      Returns: the text to display at the top of the dialog,
          or null, in which case a default text is displayed
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_dialog_get_heading(cast(GtkAppChooserDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the [gtk.app_chooser_widget.AppChooserWidget] of this dialog.
      Returns: the [gtk.app_chooser_widget.AppChooserWidget] of self
  
      Deprecated: This widget will be removed in GTK 5
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
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setHeading(string heading)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    gtk_app_chooser_dialog_set_heading(cast(GtkAppChooserDialog*)this._cPtr, _heading);
  }
}
