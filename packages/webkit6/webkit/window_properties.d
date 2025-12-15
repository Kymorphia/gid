/// Module for [WindowProperties] class
module webkit.window_properties;

import gdk.rectangle;
import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Window properties of a #WebKitWebView.
    
    The content of a #WebKitWebView can request to change certain
    properties of the window containing the view. This can include the x, y position
    of the window, the width and height but also if a toolbar,
    scrollbar, statusbar, locationbar should be visible to the user,
    and the request to show the #WebKitWebView fullscreen.
    
    The #WebKitWebView::ready-to-show signal handler is the proper place
    to apply the initial window properties. Then you can monitor the
    #WebKitWindowProperties by connecting to ::notify signal.
    
    ```c
    static void ready_to_show_cb (WebKitWebView *web_view, gpointer user_data)
    {
        GtkWidget *window;
        WebKitWindowProperties *window_properties;
        gboolean visible;
    
        // Create the window to contain the WebKitWebView.
        window = browser_window_new ();
        gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET (web_view));
        gtk_widget_show (GTK_WIDGET (web_view));
    
        // Get the WebKitWindowProperties of the web view and monitor it.
        window_properties = webkit_web_view_get_window_properties (web_view);
        g_signal_connect (window_properties, "notify::geometry",
                          G_CALLBACK (window_geometry_changed), window);
        g_signal_connect (window_properties, "notify::toolbar-visible",
                          G_CALLBACK (window_toolbar_visibility_changed), window);
        g_signal_connect (window_properties, "notify::menubar-visible",
                          G_CALLBACK (window_menubar_visibility_changed), window);
    
        // Apply the window properties before showing the window.
        visible = webkit_window_properties_get_toolbar_visible (window_properties);
        browser_window_set_toolbar_visible (BROWSER_WINDOW (window), visible);
        visible = webkit_window_properties_get_menubar_visible (window_properties);
        browser_window_set_menubar_visible (BROWSER_WINDOW (window), visible);
    
        if (webkit_window_properties_get_fullscreen (window_properties)) {
            gtk_window_fullscreen (GTK_WINDOW (window));
        } else {
            GdkRectangle geometry;
    
            gtk_window_set_resizable (GTK_WINDOW (window),
                                      webkit_window_properties_get_resizable (window_properties));
            webkit_window_properties_get_geometry (window_properties, &geometry);
            gtk_window_move (GTK_WINDOW (window), geometry.x, geometry.y);
            gtk_window_resize (GTK_WINDOW (window), geometry.width, geometry.height);
        }
    
        gtk_widget_show (window);
    }
    ```
*/
class WindowProperties : gobject.object.ObjectWrap
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
    return cast(void function())webkit_window_properties_get_type != &gidSymbolNotFound ? webkit_window_properties_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowProperties self()
  {
    return this;
  }

  /**
      Get whether the window should be shown in fullscreen state or not.
      Returns: true if the window should be fullscreen or false otherwise.
  */
  bool getFullscreen()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_fullscreen(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get the geometry the window should have on the screen when shown.
  
      Params:
        geometry = return location for the window geometry
  */
  void getGeometry(out gdk.rectangle.Rectangle geometry)
  {
    GdkRectangle _geometry;
    webkit_window_properties_get_geometry(cast(WebKitWindowProperties*)this._cPtr, &_geometry);
    geometry = new gdk.rectangle.Rectangle(cast(void*)&_geometry, No.Take);
  }

  /**
      Get whether the window should have the locationbar visible or not.
      Returns: true if locationbar should be visible or false otherwise.
  */
  bool getLocationbarVisible()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_locationbar_visible(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the window should have the menubar visible or not.
      Returns: true if menubar should be visible or false otherwise.
  */
  bool getMenubarVisible()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_menubar_visible(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the window should be resizable by the user or not.
      Returns: true if the window should be resizable or false otherwise.
  */
  bool getResizable()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_resizable(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the window should have the scrollbars visible or not.
      Returns: true if scrollbars should be visible or false otherwise.
  */
  bool getScrollbarsVisible()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_scrollbars_visible(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the window should have the statusbar visible or not.
      Returns: true if statusbar should be visible or false otherwise.
  */
  bool getStatusbarVisible()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_statusbar_visible(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the window should have the toolbar visible or not.
      Returns: true if toolbar should be visible or false otherwise.
  */
  bool getToolbarVisible()
  {
    bool _retval;
    _retval = cast(bool)webkit_window_properties_get_toolbar_visible(cast(WebKitWindowProperties*)this._cPtr);
    return _retval;
  }
}
