/// Module for [ToplevelLayout] class
module gid.gdk4.toplevel_layout;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.monitor;
import gid.gdk4.types;
import gid.gobject2.boxed;
import gid.gobject2.object;

/**
    Contains information that is necessary to present a sovereign
    window on screen.
    
    The [gid.gdk4.toplevel_layout.ToplevelLayout] struct is necessary for using
    [gid.gdk4.toplevel.Toplevel.present].
    
    Toplevel surfaces are sovereign windows that can be presented
    to the user in various states (maximized, on all workspaces,
    etc).
*/
class ToplevelLayout : gid.gobject2.boxed.BoxedWrap!(gdk_toplevel_layout_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ToplevelLayout self() nothrow
  {
    return this;
  }

  /**
      Create a toplevel layout description.
      
      Used together with [gid.gdk4.toplevel.Toplevel.present] to describe
      how a toplevel surface should be placed and behave on-screen.
      
      The size is in ”application pixels”, not
      ”device pixels” (see [gid.gdk4.surface.Surface.getScale]).
      Returns: newly created instance of [gid.gdk4.toplevel_layout.ToplevelLayout]
  */
  this() nothrow
  {
    GdkToplevelLayout* _cretval;
    _cretval = gdk_toplevel_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Create a new [gid.gdk4.toplevel_layout.ToplevelLayout] and copy the contents of layout into it.
      Returns: a copy of layout.
  */
  gid.gdk4.toplevel_layout.ToplevelLayout copy() nothrow
  {
    GdkToplevelLayout* _cretval;
    _cretval = gdk_toplevel_layout_copy(cast(GdkToplevelLayout*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.toplevel_layout.ToplevelLayout(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check whether layout and other has identical layout properties.
  
      Params:
        other = another toplevel layout
      Returns: true if layout and other have identical layout properties,
          otherwise false.
  */
  bool equal(gid.gdk4.toplevel_layout.ToplevelLayout other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_layout_equal(cast(GdkToplevelLayout*)this._cPtr, other ? cast(GdkToplevelLayout*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      If the layout specifies whether to the toplevel should go fullscreen,
      the value pointed to by fullscreen is set to true if it should go
      fullscreen, or false, if it should go unfullscreen.
  
      Params:
        fullscreen = location to store whether the toplevel should be fullscreen
      Returns: whether the layout specifies the fullscreen state for the toplevel
  */
  bool getFullscreen(out bool fullscreen) nothrow
  {
    bool _retval;
    gboolean _fullscreen;
    _retval = cast(bool)gdk_toplevel_layout_get_fullscreen(cast(GdkToplevelLayout*)this._cPtr, &_fullscreen);
    fullscreen = cast(bool)_fullscreen;
    return _retval;
  }

  /**
      Returns the monitor that the layout is fullscreening
      the surface on.
      Returns: the monitor on which layout fullscreens
  */
  gid.gdk4.monitor.MonitorWrap getFullscreenMonitor() nothrow
  {
    GdkMonitor* _cretval;
    _cretval = gdk_toplevel_layout_get_fullscreen_monitor(cast(GdkToplevelLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.monitor.MonitorWrap)(cast(GdkMonitor*)_cretval, No.Take);
    return _retval;
  }

  /**
      If the layout specifies whether to the toplevel should go maximized,
      the value pointed to by maximized is set to true if it should go
      maximized, or false, if it should go unmaximized.
  
      Params:
        maximized = set to true if the toplevel should be maximized
      Returns: whether the layout specifies the maximized state for the toplevel
  */
  bool getMaximized(out bool maximized) nothrow
  {
    bool _retval;
    gboolean _maximized;
    _retval = cast(bool)gdk_toplevel_layout_get_maximized(cast(GdkToplevelLayout*)this._cPtr, &_maximized);
    maximized = cast(bool)_maximized;
    return _retval;
  }

  /**
      Returns whether the layout should allow the user
      to resize the surface.
      Returns: true if the layout is resizable
  */
  bool getResizable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_layout_get_resizable(cast(GdkToplevelLayout*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the layout should cause the surface
      to be fullscreen when presented.
  
      Params:
        fullscreen = true to fullscreen the surface
        monitor = the monitor to fullscreen on
  */
  void setFullscreen(bool fullscreen, gid.gdk4.monitor.MonitorWrap monitor = null) nothrow
  {
    gdk_toplevel_layout_set_fullscreen(cast(GdkToplevelLayout*)this._cPtr, fullscreen, monitor ? cast(GdkMonitor*)monitor._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the layout should cause the surface
      to be maximized when presented.
  
      Params:
        maximized = true to maximize
  */
  void setMaximized(bool maximized) nothrow
  {
    gdk_toplevel_layout_set_maximized(cast(GdkToplevelLayout*)this._cPtr, maximized);
  }

  /**
      Sets whether the layout should allow the user
      to resize the surface after it has been presented.
  
      Params:
        resizable = true to allow resizing
  */
  void setResizable(bool resizable) nothrow
  {
    gdk_toplevel_layout_set_resizable(cast(GdkToplevelLayout*)this._cPtr, resizable);
  }
}
