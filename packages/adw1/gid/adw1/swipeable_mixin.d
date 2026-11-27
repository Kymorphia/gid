/// Module for [Swipeable] interface mixin
module gid.adw1.swipeable_mixin;

public import gid.core.basictypes;
public import gid.adw1.swipeable;
public import gid.adw1.swipeable_iface_proxy;
public import gid.adw1.c.functions;
public import gid.adw1.c.types;
public import gid.adw1.types;
public import gid.core.utils;
public import gid.gdk4.rectangle;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    An interface for swipeable widgets.
    
    The [gid.adw1.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See [gid.adw1.swipe_tracker.SwipeTracker] for details about implementing it.
*/
template SwipeableT()
{

  /**
      Gets the progress self will snap back to after the gesture is canceled.
      Returns: the cancel progress, unitless
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCancelProgress`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetCancelProgress()
  {
    auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.adw1.swipeable.Swipeable._getGType);
    if (!_klass || !_klass.getCancelProgress)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getCancelProgress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the swipe distance of self.
      
      This corresponds to how many pixels 1 unit represents.
      Returns: the swipe distance in pixels
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDistance`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetDistance()
  {
    auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.adw1.swipeable.Swipeable._getGType);
    if (!_klass || !_klass.getDistance)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getDistance(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current progress of self.
      Returns: the current progress, unitless
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetProgress`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetProgress()
  {
    auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.adw1.swipeable.Swipeable._getGType);
    if (!_klass || !_klass.getProgress)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getProgress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the snap points of self.
      
      Each snap point represents a progress value that is considered acceptable to
      end the swipe on.
      Returns: the snap points
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSnapPoints`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double[] vfuncGetSnapPoints()
  {
    auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.adw1.swipeable.Swipeable._getGType);
    if (!_klass || !_klass.getSnapPoints)
      return typeof(return).init;

    double* _cretval;
    int _cretlength;
    _cretval = _klass.getSnapPoints(cast(AdwSwipeable*)this._cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the area self can start a swipe from for the given direction and
      gesture type.
      
      This can be used to restrict swipes to only be possible from a certain area,
      for example, to only allow edge swipes, or to have a draggable element and
      ignore swipes elsewhere.
      
      If not implemented, the default implementation returns the allocation of
      self, allowing swipes from anywhere.
  
      Params:
        navigationDirection = the direction of the swipe
        isDrag = whether the swipe is caused by a dragging gesture
        rect = a pointer to a rectangle to store the swipe area
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSwipeArea`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetSwipeArea(gid.adw1.types.NavigationDirection navigationDirection, bool isDrag, out gid.gdk4.rectangle.Rectangle rect)
  {
    auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.adw1.swipeable.Swipeable._getGType);
    if (!_klass || !_klass.getSwipeArea)
      return;

    _klass.getSwipeArea(cast(AdwSwipeable*)this._cPtr, navigationDirection, isDrag, cast(GdkRectangle*)&rect);
  }

  /**
      Gets the progress self will snap back to after the gesture is canceled.
      Returns: the cancel progress, unitless
  */
  override double getCancelProgress() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_cancel_progress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the swipe distance of self.
      
      This corresponds to how many pixels 1 unit represents.
      Returns: the swipe distance in pixels
  */
  override double getDistance() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_distance(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current progress of self.
      Returns: the current progress, unitless
  */
  override double getProgress() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_progress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the snap points of self.
      
      Each snap point represents a progress value that is considered acceptable to
      end the swipe on.
      Returns: the snap points
  */
  override double[] getSnapPoints() nothrow
  {
    double* _cretval;
    int _cretlength;
    _cretval = adw_swipeable_get_snap_points(cast(AdwSwipeable*)this._cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the area self can start a swipe from for the given direction and
      gesture type.
      
      This can be used to restrict swipes to only be possible from a certain area,
      for example, to only allow edge swipes, or to have a draggable element and
      ignore swipes elsewhere.
      
      If not implemented, the default implementation returns the allocation of
      self, allowing swipes from anywhere.
  
      Params:
        navigationDirection = the direction of the swipe
        isDrag = whether the swipe is caused by a dragging gesture
        rect = a pointer to a rectangle to store the swipe area
  */
  override void getSwipeArea(gid.adw1.types.NavigationDirection navigationDirection, bool isDrag, out gid.gdk4.rectangle.Rectangle rect) nothrow
  {
    adw_swipeable_get_swipe_area(cast(AdwSwipeable*)this._cPtr, navigationDirection, isDrag, cast(GdkRectangle*)&rect);
  }

  /// True if the D class T overrides any vfunc method of gid.adw1.swipeable.Swipeable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_adw1_swipeable_Swipeable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCancelProgress", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDistance", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetProgress", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSnapPoints", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSwipeArea", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.adw1.swipeable.Swipeable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_adw1_swipeable_Swipeable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCancelProgress", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_adw1_swipeable_Swipeable(iface, "get_cancel_progress");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDistance", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_adw1_swipeable_Swipeable(iface, "get_distance");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetProgress", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_adw1_swipeable_Swipeable(iface, "get_progress");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSnapPoints", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_adw1_swipeable_Swipeable(iface, "get_snap_points");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSwipeArea", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_adw1_swipeable_Swipeable(iface, "get_swipe_area");
  }

  private static void _installIfaceVfunc_gid_adw1_swipeable_Swipeable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AdwSwipeableInterface*)iface;

    switch (vfunc)
    {
      case "get_cancel_progress":
      {
        static extern(C) double _vfuncGetCancelProgressTramp(AdwSwipeable* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.adw1.swipeable.Swipeable._getGType);
            if (_klass && _klass.getCancelProgress)
              return (cast(typeof(&_vfuncGetCancelProgressTramp))_klass.getCancelProgress)(self);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetCancelProgress();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.swipeable.Swipeable.vfuncGetCancelProgress");
          }
          return _retval;
        }

        _klass.getCancelProgress = cast(typeof(_klass.getCancelProgress))&_vfuncGetCancelProgressTramp;
        break;
      }
      case "get_distance":
      {
        static extern(C) double _vfuncGetDistanceTramp(AdwSwipeable* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.adw1.swipeable.Swipeable._getGType);
            if (_klass && _klass.getDistance)
              return (cast(typeof(&_vfuncGetDistanceTramp))_klass.getDistance)(self);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetDistance();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.swipeable.Swipeable.vfuncGetDistance");
          }
          return _retval;
        }

        _klass.getDistance = cast(typeof(_klass.getDistance))&_vfuncGetDistanceTramp;
        break;
      }
      case "get_progress":
      {
        static extern(C) double _vfuncGetProgressTramp(AdwSwipeable* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.adw1.swipeable.Swipeable._getGType);
            if (_klass && _klass.getProgress)
              return (cast(typeof(&_vfuncGetProgressTramp))_klass.getProgress)(self);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetProgress();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.swipeable.Swipeable.vfuncGetProgress");
          }
          return _retval;
        }

        _klass.getProgress = cast(typeof(_klass.getProgress))&_vfuncGetProgressTramp;
        break;
      }
      case "get_snap_points":
      {
        static extern(C) double* _vfuncGetSnapPointsTramp(AdwSwipeable* self, int* nSnapPoints) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.adw1.swipeable.Swipeable._getGType);
            if (_klass && _klass.getSnapPoints)
              return (cast(typeof(&_vfuncGetSnapPointsTramp))_klass.getSnapPoints)(self, nSnapPoints);
            return typeof(return).init;
          }

          double[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetSnapPoints();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.swipeable.Swipeable.vfuncGetSnapPoints");
          }
          double* _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc(_dretval.length * (*_retval).sizeof);
            _retval[0 .. _dretval.length] = _dretval[];
          }

          *nSnapPoints = cast(typeof(*nSnapPoints))_dretval.length;

          return _retval;
        }

        _klass.getSnapPoints = cast(typeof(_klass.getSnapPoints))&_vfuncGetSnapPointsTramp;
        break;
      }
      case "get_swipe_area":
      {
        static extern(C) void _vfuncGetSwipeAreaTramp(AdwSwipeable* self, AdwNavigationDirection navigationDirection, gboolean isDrag, GdkRectangle* rect) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwSwipeableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.adw1.swipeable.Swipeable._getGType);
            if (_klass && _klass.getSwipeArea)
              return (cast(typeof(&_vfuncGetSwipeAreaTramp))_klass.getSwipeArea)(self, navigationDirection, isDrag, rect);
            return;
          }

          try
          {
            _obj.vfuncGetSwipeArea(navigationDirection, cast(bool)isDrag, *cast(gid.gdk4.rectangle.Rectangle*)rect);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.swipeable.Swipeable.vfuncGetSwipeArea");
          }
        }

        _klass.getSwipeArea = cast(typeof(_klass.getSwipeArea))&_vfuncGetSwipeAreaTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.adw1.swipeable.Swipeable]
template SwipeableGidBuilderT()
{
}
