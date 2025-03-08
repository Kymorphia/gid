module gdk.toplevel_layout;

import gdk.c.functions;
import gdk.c.types;
import gdk.monitor;
import gdk.types;
import gid.gid;
import gobject.boxed;
import gobject.object;

/**
    The [gdk.toplevel_layout.ToplevelLayout] struct contains information that
  is necessary to present a sovereign window on screen.
  
  The [gdk.toplevel_layout.ToplevelLayout] struct is necessary for using
  [gdk.toplevel.Toplevel.present].
  
  Toplevel surfaces are sovereign windows that can be presented
  to the user in various states (maximized, on all workspaces,
  etc).
*/
class ToplevelLayout : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_toplevel_layout_get_type != &gidSymbolNotFound ? gdk_toplevel_layout_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a toplevel layout description.
    
    Used together with [gdk.toplevel.Toplevel.present] to describe
    how a toplevel surface should be placed and behave on-screen.
    
    The size is in ”application pixels”, not
    ”device pixels” (see [gdk.surface.Surface.getScaleFactor]).
    Returns:     newly created instance of [gdk.toplevel_layout.ToplevelLayout]
  */
  this()
  {
    GdkToplevelLayout* _cretval;
    _cretval = gdk_toplevel_layout_new();
    this(_cretval, Yes.take);
  }

  /**
      Create a new [gdk.toplevel_layout.ToplevelLayout] and copy the contents of layout into it.
    Returns:     a copy of layout.
  */
  gdk.toplevel_layout.ToplevelLayout copy()
  {
    GdkToplevelLayout* _cretval;
    _cretval = gdk_toplevel_layout_copy(cast(GdkToplevelLayout*)cPtr);
    auto _retval = _cretval ? new gdk.toplevel_layout.ToplevelLayout(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Check whether layout and other has identical layout properties.
    Params:
      other =       another [gdk.toplevel_layout.ToplevelLayout]
    Returns:     true if layout and other have identical layout properties,
        otherwise false.
  */
  bool equal(gdk.toplevel_layout.ToplevelLayout other)
  {
    bool _retval;
    _retval = gdk_toplevel_layout_equal(cast(GdkToplevelLayout*)cPtr, other ? cast(GdkToplevelLayout*)other.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      If the layout specifies whether to the toplevel should go fullscreen,
    the value pointed to by fullscreen is set to true if it should go
    fullscreen, or false, if it should go unfullscreen.
    Params:
      fullscreen =       location to store whether the toplevel should be fullscreen
    Returns:     whether the layout specifies the fullscreen state for the toplevel
  */
  bool getFullscreen(out bool fullscreen)
  {
    bool _retval;
    _retval = gdk_toplevel_layout_get_fullscreen(cast(GdkToplevelLayout*)cPtr, cast(bool*)&fullscreen);
    return _retval;
  }

  /**
      Returns the monitor that the layout is fullscreening
    the surface on.
    Returns:     the monitor on which layout fullscreens
  */
  gdk.monitor.MonitorG getFullscreenMonitor()
  {
    GdkMonitor* _cretval;
    _cretval = gdk_toplevel_layout_get_fullscreen_monitor(cast(GdkToplevelLayout*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.monitor.MonitorG)(cast(GdkMonitor*)_cretval, No.take);
    return _retval;
  }

  /**
      If the layout specifies whether to the toplevel should go maximized,
    the value pointed to by maximized is set to true if it should go
    fullscreen, or false, if it should go unmaximized.
    Params:
      maximized =       set to true if the toplevel should be maximized
    Returns:     whether the layout specifies the maximized state for the toplevel
  */
  bool getMaximized(out bool maximized)
  {
    bool _retval;
    _retval = gdk_toplevel_layout_get_maximized(cast(GdkToplevelLayout*)cPtr, cast(bool*)&maximized);
    return _retval;
  }

  /**
      Returns whether the layout should allow the user
    to resize the surface.
    Returns:     true if the layout is resizable
  */
  bool getResizable()
  {
    bool _retval;
    _retval = gdk_toplevel_layout_get_resizable(cast(GdkToplevelLayout*)cPtr);
    return _retval;
  }

  /**
      Sets whether the layout should cause the surface
    to be fullscreen when presented.
    Params:
      fullscreen =       true to fullscreen the surface
      monitor =       the monitor to fullscreen on
  */
  void setFullscreen(bool fullscreen, gdk.monitor.MonitorG monitor = null)
  {
    gdk_toplevel_layout_set_fullscreen(cast(GdkToplevelLayout*)cPtr, fullscreen, monitor ? cast(GdkMonitor*)monitor.cPtr(No.dup) : null);
  }

  /**
      Sets whether the layout should cause the surface
    to be maximized when presented.
    Params:
      maximized =       true to maximize
  */
  void setMaximized(bool maximized)
  {
    gdk_toplevel_layout_set_maximized(cast(GdkToplevelLayout*)cPtr, maximized);
  }

  /**
      Sets whether the layout should allow the user
    to resize the surface after it has been presented.
    Params:
      resizable =       true to allow resizing
  */
  void setResizable(bool resizable)
  {
    gdk_toplevel_layout_set_resizable(cast(GdkToplevelLayout*)cPtr, resizable);
  }
}
