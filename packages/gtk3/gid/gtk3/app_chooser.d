/// Module for [AppChooser] interface
module gid.gtk3.app_chooser;

public import gid.core.basictypes;
public import gid.gtk3.app_chooser_iface_proxy;
import gid.core.utils;
import gid.gio2.app_info;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

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
@gidGir("AppChooser")
interface AppChooser : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_app_chooser_get_type != &gidSymbolNotFound ? gtk_app_chooser_get_type() : cast(GType)0;
  }

  /**
      Get `contentType` property.
      Returns: The content type of the #GtkAppChooser object.
        
        See [GContentType][gio-GContentType]
        for more information about content types.
  */
  @property string contentType() nothrow;

  /**
      Returns the currently selected application.
      Returns: a #GAppInfo for the currently selected
            application, or null if none is selected. Free with [gid.gobject2.object.ObjectWrap.unref]
  */
  gid.gio2.app_info.AppInfo getAppInfo();

  /**
      Returns the current value of the #GtkAppChooser:content-type property.
      Returns: the content type of self. Free with [gid.glib2.global.gfree]
  */
  string getContentType();

  /**
      Reloads the list of applications.
  */
  void refresh();
}

/// Fluent builder implementation template for [gid.gtk3.app_chooser.AppChooser]
interface AppChooserGidBuilderImpl(T)
{

  /**
      Set `contentType` property.
      Params:
        propval = The content type of the #GtkAppChooser object.
          
          See [GContentType][gio-GContentType]
          for more information about content types.
      Returns: Builder instance for fluent chaining
  */
  T contentType(string propval) nothrow;
}
