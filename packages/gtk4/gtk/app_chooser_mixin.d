/// Module for [AppChooser] interface mixin
module gtk.app_chooser_mixin;

public import gtk.app_chooser_iface_proxy;
public import gid.gid;
public import gio.app_info;
public import gobject.gid_builder;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.app_chooser.AppChooser] is an interface for widgets which allow the user to
    choose an application.
    
    The main objects that implement this interface are
    [gtk.app_chooser_widget.AppChooserWidget],
    [gtk.app_chooser_dialog.AppChooserDialog] and [gtk.app_chooser_button.AppChooserButton].
    
    Applications are represented by GIO [gio.app_info.AppInfo] objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The [gtk.app_chooser_widget.AppChooserWidget] provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a [gtk.app_chooser.AppChooser],
    use [gtk.app_chooser.AppChooser.getAppInfo].

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
template AppChooserT()
{

  /**
      Get `contentType` property.
      Returns: The content type of the [gtk.app_chooser.AppChooser] object.
        
        See `GContentType` for more information about content types.
  */
  @property string contentType()
  {
    return getContentType();
  }

  /**
      Returns the currently selected application.
      Returns: a [gio.app_info.AppInfo] for the
          currently selected application
  
      Deprecated: This widget will be removed in GTK 5
  */
  override gio.app_info.AppInfo getAppInfo()
  {
    GAppInfo* _cretval;
    _cretval = gtk_app_chooser_get_app_info(cast(GtkAppChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the content type for which the [gtk.app_chooser.AppChooser]
      shows applications.
      Returns: the content type of self. Free with [glib.global.gfree]
  
      Deprecated: This widget will be removed in GTK 5
  */
  override string getContentType()
  {
    char* _cretval;
    _cretval = gtk_app_chooser_get_content_type(cast(GtkAppChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Reloads the list of applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  override void refresh()
  {
    gtk_app_chooser_refresh(cast(GtkAppChooser*)this._cPtr);
  }
}

template AppChooserGidBuilderT()
{

  /**
      Set `contentType` property.
      Params:
        propval = The content type of the [gtk.app_chooser.AppChooser] object.
          
          See `GContentType` for more information about content types.
      Returns: Builder instance for fluent chaining
  */
  T contentType(string propval)
  {
    return setProperty("content-type", propval);
  }
}
