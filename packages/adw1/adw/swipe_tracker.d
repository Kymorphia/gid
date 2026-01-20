/// Module for [SwipeTracker] class
module adw.swipe_tracker;

import adw.c.functions;
import adw.c.types;
import adw.swipeable;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.orientable;
import gtk.orientable_mixin;

/**
    A swipe tracker used in `class@Carousel`, `class@NavigationView` and
    `class@OverlaySplitView`.
    
    The [adw.swipe_tracker.SwipeTracker] object can be used for implementing widgets with swipe
    gestures. It supports touch-based swipes, pointer dragging, and touchpad
    scrolling.
    
    The widgets will probably want to expose the `property@SwipeTracker:enabled`
    property. If they expect to use horizontal orientation,
    `property@SwipeTracker:reversed` can be used for supporting RTL text
    direction.
*/
class SwipeTracker : gobject.object.ObjectWrap, gtk.orientable.Orientable
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
    return cast(void function())adw_swipe_tracker_get_type != &gidSymbolNotFound ? adw_swipe_tracker_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SwipeTracker self()
  {
    return this;
  }

  /**
      Get `allowLongSwipes` property.
      Returns: Whether to allow swiping for more than one snap point at a time.
        
        If the value is `FALSE`, each swipe can only move to the adjacent snap
        points.
  */
  @property bool allowLongSwipes()
  {
    return getAllowLongSwipes();
  }

  /**
      Set `allowLongSwipes` property.
      Params:
        propval = Whether to allow swiping for more than one snap point at a time.
          
          If the value is `FALSE`, each swipe can only move to the adjacent snap
          points.
  */
  @property void allowLongSwipes(bool propval)
  {
    return setAllowLongSwipes(propval);
  }

  /**
      Get `allowMouseDrag` property.
      Returns: Whether to allow dragging with mouse pointer.
  */
  @property bool allowMouseDrag()
  {
    return getAllowMouseDrag();
  }

  /**
      Set `allowMouseDrag` property.
      Params:
        propval = Whether to allow dragging with mouse pointer.
  */
  @property void allowMouseDrag(bool propval)
  {
    return setAllowMouseDrag(propval);
  }

  /**
      Get `allowWindowHandle` property.
      Returns: Whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
        
        This will make dragging the window impossible.
  */
  @property bool allowWindowHandle()
  {
    return getAllowWindowHandle();
  }

  /**
      Set `allowWindowHandle` property.
      Params:
        propval = Whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
          
          This will make dragging the window impossible.
  */
  @property void allowWindowHandle(bool propval)
  {
    return setAllowWindowHandle(propval);
  }

  /**
      Get `enabled` property.
      Returns: Whether the swipe tracker is enabled.
        
        When it's not enabled, no events will be processed. Usually widgets will
        want to expose this via a property.
  */
  @property bool enabled()
  {
    return getEnabled();
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether the swipe tracker is enabled.
          
          When it's not enabled, no events will be processed. Usually widgets will
          want to expose this via a property.
  */
  @property void enabled(bool propval)
  {
    return setEnabled(propval);
  }

  /**
      Get `lowerOvershoot` property.
      Returns: Whether to allow swiping past the first available snap point.
  */
  @property bool lowerOvershoot()
  {
    return getLowerOvershoot();
  }

  /**
      Set `lowerOvershoot` property.
      Params:
        propval = Whether to allow swiping past the first available snap point.
  */
  @property void lowerOvershoot(bool propval)
  {
    return setLowerOvershoot(propval);
  }

  /**
      Get `reversed` property.
      Returns: Whether to reverse the swipe direction.
        
        If the swipe tracker is horizontal, it can be used for supporting RTL text
        direction.
  */
  @property bool reversed()
  {
    return getReversed();
  }

  /**
      Set `reversed` property.
      Params:
        propval = Whether to reverse the swipe direction.
          
          If the swipe tracker is horizontal, it can be used for supporting RTL text
          direction.
  */
  @property void reversed(bool propval)
  {
    return setReversed(propval);
  }

  /**
      Get `upperOvershoot` property.
      Returns: Whether to allow swiping past the last available snap point.
  */
  @property bool upperOvershoot()
  {
    return getUpperOvershoot();
  }

  /**
      Set `upperOvershoot` property.
      Params:
        propval = Whether to allow swiping past the last available snap point.
  */
  @property void upperOvershoot(bool propval)
  {
    return setUpperOvershoot(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.swipe_tracker.SwipeTracker] for widget.
  
      Params:
        swipeable = a widget to add the tracker on
      Returns: the newly created [adw.swipe_tracker.SwipeTracker]
  */
  this(adw.swipeable.Swipeable swipeable)
  {
    AdwSwipeTracker* _cretval;
    _cretval = adw_swipe_tracker_new(swipeable ? cast(AdwSwipeable*)(cast(gobject.object.ObjectWrap)swipeable)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether to allow swiping for more than one snap point at a time.
      Returns: whether long swipes are allowed
  */
  bool getAllowLongSwipes()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_allow_long_swipes(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can be dragged with mouse pointer.
      Returns: whether mouse dragging is allowed
  */
  bool getAllowMouseDrag()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_allow_mouse_drag(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
      Returns: whether swiping from window handles is allowed
  */
  bool getAllowWindowHandle()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_allow_window_handle(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is enabled.
      Returns: whether self is enabled
  */
  bool getEnabled()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_enabled(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to allow swiping past the first available snap point.
      Returns: whether to allow swiping past the first available snap point
  */
  bool getLowerOvershoot()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_lower_overshoot(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is reversing the swipe direction.
      Returns: whether the direction is reversed
  */
  bool getReversed()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_reversed(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Get the widget self is attached to.
      Returns: the swipeable widget
  */
  adw.swipeable.Swipeable getSwipeable()
  {
    AdwSwipeable* _cretval;
    _cretval = adw_swipe_tracker_get_swipeable(cast(AdwSwipeTracker*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.swipeable.Swipeable)(cast(AdwSwipeable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to allow swiping past the last available snap point.
      Returns: whether to allow swiping past the last available snap point
  */
  bool getUpperOvershoot()
  {
    bool _retval;
    _retval = cast(bool)adw_swipe_tracker_get_upper_overshoot(cast(AdwSwipeTracker*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether to allow swiping for more than one snap point at a time.
      
      If the value is `FALSE`, each swipe can only move to the adjacent snap
      points.
  
      Params:
        allowLongSwipes = whether to allow long swipes
  */
  void setAllowLongSwipes(bool allowLongSwipes)
  {
    adw_swipe_tracker_set_allow_long_swipes(cast(AdwSwipeTracker*)this._cPtr, allowLongSwipes);
  }

  /**
      Sets whether self can be dragged with mouse pointer.
  
      Params:
        allowMouseDrag = whether to allow mouse dragging
  */
  void setAllowMouseDrag(bool allowMouseDrag)
  {
    adw_swipe_tracker_set_allow_mouse_drag(cast(AdwSwipeTracker*)this._cPtr, allowMouseDrag);
  }

  /**
      Sets whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
      
      Setting it to `TRUE` will make dragging the window impossible.
  
      Params:
        allowWindowHandle = whether to allow swiping from window handles
  */
  void setAllowWindowHandle(bool allowWindowHandle)
  {
    adw_swipe_tracker_set_allow_window_handle(cast(AdwSwipeTracker*)this._cPtr, allowWindowHandle);
  }

  /**
      Sets whether self is enabled.
      
      When it's not enabled, no events will be processed. Usually widgets will want
      to expose this via a property.
  
      Params:
        enabled = whether self is enabled
  */
  void setEnabled(bool enabled)
  {
    adw_swipe_tracker_set_enabled(cast(AdwSwipeTracker*)this._cPtr, enabled);
  }

  /**
      Sets whether to allow swiping past the first available snap point.
  
      Params:
        overshoot = whether to allow swiping past the first available snap point
  */
  void setLowerOvershoot(bool overshoot)
  {
    adw_swipe_tracker_set_lower_overshoot(cast(AdwSwipeTracker*)this._cPtr, overshoot);
  }

  /**
      Sets whether to reverse the swipe direction.
      
      If the swipe tracker is horizontal, it can be used for supporting RTL text
      direction.
  
      Params:
        reversed = whether to reverse the swipe direction
  */
  void setReversed(bool reversed)
  {
    adw_swipe_tracker_set_reversed(cast(AdwSwipeTracker*)this._cPtr, reversed);
  }

  /**
      Sets whether to allow swiping past the last available snap point.
  
      Params:
        overshoot = whether to allow swiping past the last available snap point
  */
  void setUpperOvershoot(bool overshoot)
  {
    adw_swipe_tracker_set_upper_overshoot(cast(AdwSwipeTracker*)this._cPtr, overshoot);
  }

  /**
      Moves the current progress value by delta.
      
      This can be used to adjust the current position if snap points move during
      the gesture.
  
      Params:
        delta = the position delta
  */
  void shiftPosition(double delta)
  {
    adw_swipe_tracker_shift_position(cast(AdwSwipeTracker*)this._cPtr, delta);
  }

  /**
      Connect to `BeginSwipe` signal.
  
      This signal is emitted right before a swipe will be started, after the
        drag threshold has been passed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.swipe_tracker.SwipeTracker swipeTracker))
  
          `swipeTracker` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBeginSwipe(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.swipe_tracker.SwipeTracker)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("begin-swipe", closure, after);
  }

  /**
      Connect to `EndSwipe` signal.
  
      This signal is emitted as soon as the gesture has stopped.
        
        The user is expected to animate the deceleration from the current progress
        value to to with an animation using velocity as the initial velocity,
        provided in pixels per second. `classSpringAnimation` is usually a good
        fit for this.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double velocity, double to, adw.swipe_tracker.SwipeTracker swipeTracker))
  
          `velocity` the velocity of the swipe (optional)
  
          `to` the progress value to animate to (optional)
  
          `swipeTracker` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEndSwipe(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.swipe_tracker.SwipeTracker)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-swipe", closure, after);
  }

  /**
      Connect to `Prepare` signal.
  
      This signal is emitted when a possible swipe is detected.
        
        The direction value can be used to restrict the swipe to a certain
        direction.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.types.NavigationDirection direction, adw.swipe_tracker.SwipeTracker swipeTracker))
  
          `direction` the direction of the swipe (optional)
  
          `swipeTracker` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrepare(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == adw.types.NavigationDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.swipe_tracker.SwipeTracker)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }

  /**
      Connect to `UpdateSwipe` signal.
  
      This signal is emitted every time the progress value changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double progress, adw.swipe_tracker.SwipeTracker swipeTracker))
  
          `progress` the current animation progress value (optional)
  
          `swipeTracker` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpdateSwipe(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.swipe_tracker.SwipeTracker)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update-swipe", closure, after);
  }
}
