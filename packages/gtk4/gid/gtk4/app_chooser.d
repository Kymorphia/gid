/// Module for [AppChooser] interface
module gid.gtk4.app_chooser;

public import gid.core.basictypes;
public import gid.gtk4.app_chooser_iface_proxy;
import gid.core.utils;
import gid.gio2.app_info;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    [gid.gtk4.app_chooser.AppChooser] is an interface for widgets which allow the user to
    choose an application.
    
    The main objects that implement this interface are
    [gid.gtk4.app_chooser_widget.AppChooserWidget],
    [gid.gtk4.app_chooser_dialog.AppChooserDialog] and [gid.gtk4.app_chooser_button.AppChooserButton].
    
    Applications are represented by GIO [gid.gio2.app_info.AppInfo] objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The [gid.gtk4.app_chooser_widget.AppChooserWidget] provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a [gid.gtk4.app_chooser.AppChooser],
    use [gid.gtk4.app_chooser.AppChooser.getAppInfo].

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
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
      Returns: The content type of the [gid.gtk4.app_chooser.AppChooser] object.
        
        See `GContentType` for more information about content types.
  */
  @property string contentType() nothrow;

  /**
      Returns the currently selected application.
      Returns: a [gid.gio2.app_info.AppInfo] for the
          currently selected application
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gio2.app_info.AppInfo getAppInfo();

  /**
      Returns the content type for which the [gid.gtk4.app_chooser.AppChooser]
      shows applications.
      Returns: the content type of self. Free with [gid.glib2.global.gfree]
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getContentType();

  /**
      Reloads the list of applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void refresh();
}

/// Fluent builder implementation template for [gid.gtk4.app_chooser.AppChooser]
interface AppChooserGidBuilderImpl(T)
{

  /**
      Set `contentType` property.
      Params:
        propval = The content type of the [gid.gtk4.app_chooser.AppChooser] object.
          
          See `GContentType` for more information about content types.
      Returns: Builder instance for fluent chaining
  */
  T contentType(string propval) nothrow;
}
