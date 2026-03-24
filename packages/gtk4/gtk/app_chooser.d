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
      Returns: The content type of the [gtk.app_chooser.AppChooser] object.
        
        See `GContentType` for more information about content types.
  */
  @property string contentType();

  /**
      Returns the currently selected application.
      Returns: a [gio.app_info.AppInfo] for the
          currently selected application
  
      Deprecated: This widget will be removed in GTK 5
  */
  gio.app_info.AppInfo getAppInfo();

  /**
      Returns the content type for which the [gtk.app_chooser.AppChooser]
      shows applications.
      Returns: the content type of self. Free with [glib.global.gfree]
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getContentType();

  /**
      Reloads the list of applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void refresh();
}

interface AppChooserGidBuilderImpl(T)
{

  /**
      Set `contentType` property.
      Params:
        propval = The content type of the [gtk.app_chooser.AppChooser] object.
          
          See `GContentType` for more information about content types.
      Returns: Builder instance for fluent chaining
  */
  T contentType(string propval);
}
