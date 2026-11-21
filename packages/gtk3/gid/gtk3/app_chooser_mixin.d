/// Module for [AppChooser] interface mixin
module gid.gtk3.app_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtk3.app_chooser_iface_proxy;
public import gid.core.gid;
public import gid.gio2.app_info;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

/**
    #GtkAppChooser is an interface that can be implemented by widgets which
    allow the user to choose an application (typically for the purpose of
    opening a file). The main objects that implement this interface are
    #GtkAppChooserWidget, #GtkAppChooserDialog and #GtkAppChooserButton.
    
    Applications are represented by GIO #GAppInfo objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The #GtkAppChooserWidget provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a #GtkAppChooser,
    use [gid.gtk4.app_chooser.AppChooser.getAppInfo].
*/
template AppChooserT()
{

  /**
      Get `contentType` property.
      Returns: The content type of the #GtkAppChooser object.
        
        See [GContentType][gio-GContentType]
        for more information about content types.
  */
  @property string contentType() nothrow
  {
    return getContentType();
  }

  /**
      Returns the currently selected application.
      Returns: a #GAppInfo for the currently selected
            application, or null if none is selected. Free with [gid.gobject2.object.ObjectWrap.unref]
  */
  override gid.gio2.app_info.AppInfo getAppInfo() nothrow
  {
    GAppInfo* _cretval;
    _cretval = gtk_app_chooser_get_app_info(cast(GtkAppChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooser:content-type property.
      Returns: the content type of self. Free with [gid.glib2.global.gfree]
  */
  override string getContentType() nothrow
  {
    char* _cretval;
    _cretval = gtk_app_chooser_get_content_type(cast(GtkAppChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Reloads the list of applications.
  */
  override void refresh() nothrow
  {
    gtk_app_chooser_refresh(cast(GtkAppChooser*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gtk3.app_chooser.AppChooser]
template AppChooserGidBuilderT()
{

  /**
      Set `contentType` property.
      Params:
        propval = The content type of the #GtkAppChooser object.
          
          See [GContentType][gio-GContentType]
          for more information about content types.
      Returns: Builder instance for fluent chaining
  */
  T contentType(string propval) nothrow
  {
    return setProperty("content-type", propval);
  }
}
