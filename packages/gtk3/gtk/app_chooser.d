/// Module for [AppChooser] interface
module gtk.app_chooser;

public import gtk.app_chooser_iface_proxy;
import gid.gid;
import gio.app_info;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
    use [gtk.app_chooser.AppChooser.getAppInfo].
*/
interface AppChooser
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_app_chooser_get_type != &gidSymbolNotFound ? gtk_app_chooser_get_type() : cast(GType)0;
  }

  /**
      Get `contentType` property.
      Returns: The content type of the #GtkAppChooser object.
        
        See [GContentType][gio-GContentType]
        for more information about content types.
  */
  @property string contentType();

  /**
      Returns the currently selected application.
      Returns: a #GAppInfo for the currently selected
            application, or null if none is selected. Free with [gobject.object.ObjectWrap.unref]
  */
  gio.app_info.AppInfo getAppInfo();

  /**
      Returns the current value of the #GtkAppChooser:content-type property.
      Returns: the content type of self. Free with [glib.global.gfree]
  */
  string getContentType();

  /**
      Reloads the list of applications.
  */
  void refresh();
}

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
  T contentType(string propval);
}
