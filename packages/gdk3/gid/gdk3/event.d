/// Module for [Event] class
module gid.gdk3.event;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.device;
import gid.gdk3.device_tool;
import gid.gdk3.event_any;
import gid.gdk3.event_button;
import gid.gdk3.event_configure;
import gid.gdk3.event_crossing;
import gid.gdk3.event_dnd;
import gid.gdk3.event_expose;
import gid.gdk3.event_focus;
import gid.gdk3.event_grab_broken;
import gid.gdk3.event_key;
import gid.gdk3.event_motion;
import gid.gdk3.event_owner_change;
import gid.gdk3.event_pad_axis;
import gid.gdk3.event_pad_button;
import gid.gdk3.event_pad_group_mode;
import gid.gdk3.event_property;
import gid.gdk3.event_proximity;
import gid.gdk3.event_scroll;
import gid.gdk3.event_selection;
import gid.gdk3.event_sequence;
import gid.gdk3.event_setting;
import gid.gdk3.event_touch;
import gid.gdk3.event_touchpad_pinch;
import gid.gdk3.event_touchpad_swipe;
import gid.gdk3.event_visibility;
import gid.gdk3.event_window_state;
import gid.gdk3.screen;
import gid.gdk3.seat;
import gid.gdk3.types;
import gid.gdk3.window;
import gid.gobject2.boxed;
import gid.gobject2.object;

/**
    A #GdkEvent contains a union of all of the event types,
    and allows access to the data fields in a number of ways.
    
    The event type is always the first field in all of the event types, and
    can always be accessed with the following code, no matter what type of
    event it is:
    ```c
      GdkEvent *event;
      GdkEventType type;
    
      type = event->type;
    ```
    
    To access other fields of the event, the pointer to the event
    can be cast to the appropriate event type, or the union member
    name can be used. For example if the event type is [gid.gdk4.types.EventType.ButtonPress]
    then the x coordinate of the button press can be accessed with:
    ```c
      GdkEvent *event;
      gdouble x;
    
      x = ((GdkEventButton*)event)->x;
    ```
    or:
    ```c
      GdkEvent *event;
      gdouble x;
    
      x = event->button.x;
    ```
*/
class Event : gid.gobject2.boxed.BoxedWrap!(gdk_event_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Event self() nothrow
  {
    return this;
  }

  /**
      Get `type` field.
      Returns: the #GdkEventType
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEvent*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GdkEventType
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEvent*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `any` field.
      Returns: a #GdkEventAny
  */
  @property gid.gdk3.event_any.EventAny any() nothrow
  {
    return new gid.gdk3.event_any.EventAny(cast(GdkEventAny*)&(cast(GdkEvent*)this._cPtr).any, this);
  }

  /**
      Get `expose` field.
      Returns: a #GdkEventExpose
  */
  @property gid.gdk3.event_expose.EventExpose expose() nothrow
  {
    return new gid.gdk3.event_expose.EventExpose(cast(GdkEventExpose*)&(cast(GdkEvent*)this._cPtr).expose, this);
  }

  /**
      Get `visibility` field.
      Returns: a #GdkEventVisibility
  */
  @property gid.gdk3.event_visibility.EventVisibility visibility() nothrow
  {
    return new gid.gdk3.event_visibility.EventVisibility(cast(GdkEventVisibility*)&(cast(GdkEvent*)this._cPtr).visibility, this);
  }

  /**
      Get `motion` field.
      Returns: a #GdkEventMotion
  */
  @property gid.gdk3.event_motion.EventMotion motion() nothrow
  {
    return new gid.gdk3.event_motion.EventMotion(cast(GdkEventMotion*)&(cast(GdkEvent*)this._cPtr).motion, this);
  }

  /**
      Get `button` field.
      Returns: a #GdkEventButton
  */
  @property gid.gdk3.event_button.EventButton button() nothrow
  {
    return new gid.gdk3.event_button.EventButton(cast(GdkEventButton*)&(cast(GdkEvent*)this._cPtr).button, this);
  }

  /**
      Get `touch` field.
      Returns: a #GdkEventTouch
  */
  @property gid.gdk3.event_touch.EventTouch touch() nothrow
  {
    return new gid.gdk3.event_touch.EventTouch(cast(GdkEventTouch*)&(cast(GdkEvent*)this._cPtr).touch, this);
  }

  /**
      Get `scroll` field.
      Returns: a #GdkEventScroll
  */
  @property gid.gdk3.event_scroll.EventScroll scroll() nothrow
  {
    return new gid.gdk3.event_scroll.EventScroll(cast(GdkEventScroll*)&(cast(GdkEvent*)this._cPtr).scroll, this);
  }

  /**
      Get `key` field.
      Returns: a #GdkEventKey
  */
  @property gid.gdk3.event_key.EventKey key() nothrow
  {
    return new gid.gdk3.event_key.EventKey(cast(GdkEventKey*)&(cast(GdkEvent*)this._cPtr).key, this);
  }

  /**
      Get `crossing` field.
      Returns: a #GdkEventCrossing
  */
  @property gid.gdk3.event_crossing.EventCrossing crossing() nothrow
  {
    return new gid.gdk3.event_crossing.EventCrossing(cast(GdkEventCrossing*)&(cast(GdkEvent*)this._cPtr).crossing, this);
  }

  /**
      Get `focusChange` field.
      Returns: a #GdkEventFocus
  */
  @property gid.gdk3.event_focus.EventFocus focusChange() nothrow
  {
    return new gid.gdk3.event_focus.EventFocus(cast(GdkEventFocus*)&(cast(GdkEvent*)this._cPtr).focusChange, this);
  }

  /**
      Get `configure` field.
      Returns: a #GdkEventConfigure
  */
  @property gid.gdk3.event_configure.EventConfigure configure() nothrow
  {
    return new gid.gdk3.event_configure.EventConfigure(cast(GdkEventConfigure*)&(cast(GdkEvent*)this._cPtr).configure, this);
  }

  /**
      Get `property` field.
      Returns: a #GdkEventProperty
  */
  @property gid.gdk3.event_property.EventProperty property() nothrow
  {
    return new gid.gdk3.event_property.EventProperty(cast(GdkEventProperty*)&(cast(GdkEvent*)this._cPtr).property, this);
  }

  /**
      Get `selection` field.
      Returns: a #GdkEventSelection
  */
  @property gid.gdk3.event_selection.EventSelection selection() nothrow
  {
    return new gid.gdk3.event_selection.EventSelection(cast(GdkEventSelection*)&(cast(GdkEvent*)this._cPtr).selection, this);
  }

  /**
      Get `ownerChange` field.
      Returns: a #GdkEventOwnerChange
  */
  @property gid.gdk3.event_owner_change.EventOwnerChange ownerChange() nothrow
  {
    return new gid.gdk3.event_owner_change.EventOwnerChange(cast(GdkEventOwnerChange*)&(cast(GdkEvent*)this._cPtr).ownerChange, this);
  }

  /**
      Get `proximity` field.
      Returns: a #GdkEventProximity
  */
  @property gid.gdk3.event_proximity.EventProximity proximity() nothrow
  {
    return new gid.gdk3.event_proximity.EventProximity(cast(GdkEventProximity*)&(cast(GdkEvent*)this._cPtr).proximity, this);
  }

  /**
      Get `dnd` field.
      Returns: a #GdkEventDND
  */
  @property gid.gdk3.event_dnd.EventDND dnd() nothrow
  {
    return new gid.gdk3.event_dnd.EventDND(cast(GdkEventDND*)&(cast(GdkEvent*)this._cPtr).dnd, this);
  }

  /**
      Get `windowState` field.
      Returns: a #GdkEventWindowState
  */
  @property gid.gdk3.event_window_state.EventWindowState windowState() nothrow
  {
    return new gid.gdk3.event_window_state.EventWindowState(cast(GdkEventWindowState*)&(cast(GdkEvent*)this._cPtr).windowState, this);
  }

  /**
      Get `setting` field.
      Returns: a #GdkEventSetting
  */
  @property gid.gdk3.event_setting.EventSetting setting() nothrow
  {
    return new gid.gdk3.event_setting.EventSetting(cast(GdkEventSetting*)&(cast(GdkEvent*)this._cPtr).setting, this);
  }

  /**
      Get `grabBroken` field.
      Returns: a #GdkEventGrabBroken
  */
  @property gid.gdk3.event_grab_broken.EventGrabBroken grabBroken() nothrow
  {
    return new gid.gdk3.event_grab_broken.EventGrabBroken(cast(GdkEventGrabBroken*)&(cast(GdkEvent*)this._cPtr).grabBroken, this);
  }

  /**
      Get `touchpadSwipe` field.
      Returns: a #GdkEventTouchpadSwipe
  */
  @property gid.gdk3.event_touchpad_swipe.EventTouchpadSwipe touchpadSwipe() nothrow
  {
    return new gid.gdk3.event_touchpad_swipe.EventTouchpadSwipe(cast(GdkEventTouchpadSwipe*)&(cast(GdkEvent*)this._cPtr).touchpadSwipe, this);
  }

  /**
      Get `touchpadPinch` field.
      Returns: a #GdkEventTouchpadPinch
  */
  @property gid.gdk3.event_touchpad_pinch.EventTouchpadPinch touchpadPinch() nothrow
  {
    return new gid.gdk3.event_touchpad_pinch.EventTouchpadPinch(cast(GdkEventTouchpadPinch*)&(cast(GdkEvent*)this._cPtr).touchpadPinch, this);
  }

  /**
      Get `padButton` field.
      Returns: a #GdkEventPadButton
  */
  @property gid.gdk3.event_pad_button.EventPadButton padButton() nothrow
  {
    return new gid.gdk3.event_pad_button.EventPadButton(cast(GdkEventPadButton*)&(cast(GdkEvent*)this._cPtr).padButton, this);
  }

  /**
      Get `padAxis` field.
      Returns: a #GdkEventPadAxis
  */
  @property gid.gdk3.event_pad_axis.EventPadAxis padAxis() nothrow
  {
    return new gid.gdk3.event_pad_axis.EventPadAxis(cast(GdkEventPadAxis*)&(cast(GdkEvent*)this._cPtr).padAxis, this);
  }

  /**
      Get `padGroupMode` field.
      Returns: a #GdkEventPadGroupMode
  */
  @property gid.gdk3.event_pad_group_mode.EventPadGroupMode padGroupMode() nothrow
  {
    return new gid.gdk3.event_pad_group_mode.EventPadGroupMode(cast(GdkEventPadGroupMode*)&(cast(GdkEvent*)this._cPtr).padGroupMode, this);
  }

  /**
      Creates a new event of the given type. All fields are set to 0.
  
      Params:
        type = a #GdkEventType
      Returns: a newly-allocated #GdkEvent. The returned #GdkEvent
        should be freed with [gid.gdk3.event.Event.free].
  */
  this(gid.gdk3.types.EventType type) nothrow
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GdkEvent, copying or incrementing the reference count of the
      resources associated with it (e.g. #GdkWindow’s and strings).
      Returns: a copy of event. The returned #GdkEvent should be freed with
        [gid.gdk3.event.Event.free].
  */
  gid.gdk3.event.Event copy() nothrow
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_copy(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk3.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Extract the axis value for a particular axis use from
      an event structure.
  
      Params:
        axisUse = the axis use to look for
        value = location to store the value found
      Returns: true if the specified axis was found, otherwise false
  */
  bool getAxis(gid.gdk3.types.AxisUse axisUse, out double value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_axis(cast(const(GdkEvent)*)this._cPtr, axisUse, cast(double*)&value);
    return _retval;
  }

  /**
      Extract the button number from an event.
  
      Params:
        button = location to store mouse button number
      Returns: true if the event delivered a button number
  */
  bool getButton(out uint button) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_button(cast(const(GdkEvent)*)this._cPtr, cast(uint*)&button);
    return _retval;
  }

  /**
      Extracts the click count from an event.
  
      Params:
        clickCount = location to store click count
      Returns: true if the event delivered a click count
  */
  bool getClickCount(out uint clickCount) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_click_count(cast(const(GdkEvent)*)this._cPtr, cast(uint*)&clickCount);
    return _retval;
  }

  /**
      Extract the event window relative x/y coordinates from an event.
  
      Params:
        xWin = location to put event window x coordinate
        yWin = location to put event window y coordinate
      Returns: true if the event delivered event window coordinates
  */
  bool getCoords(out double xWin, out double yWin) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_coords(cast(const(GdkEvent)*)this._cPtr, cast(double*)&xWin, cast(double*)&yWin);
    return _retval;
  }

  /**
      If the event contains a “device” field, this function will return
      it, else it will return null.
      Returns: a #GdkDevice, or null.
  */
  gid.gdk3.device.Device getDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_device(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      If the event was generated by a device that supports
      different tools (eg. a tablet), this function will
      return a #GdkDeviceTool representing the tool that
      caused the event. Otherwise, null will be returned.
      
      Note: the #GdkDeviceTool<!-- -->s will be constant during
      the application lifetime, if settings must be stored
      persistently across runs, see [gid.gdk4.device_tool.DeviceTool.getSerial]
      Returns: The current device tool, or null
  */
  gid.gdk3.device_tool.DeviceTool getDeviceTool() nothrow
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_event_get_device_tool(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      If event if of type [gid.gdk4.types.EventType.TouchBegin], [gid.gdk4.types.EventType.TouchUpdate],
      [gid.gdk4.types.EventType.TouchEnd] or [gid.gdk4.types.EventType.TouchCancel], returns the #GdkEventSequence
      to which the event belongs. Otherwise, return null.
      Returns: the event sequence that the event belongs to
  */
  gid.gdk3.event_sequence.EventSequence getEventSequence() nothrow
  {
    GdkEventSequence* _cretval;
    _cretval = gdk_event_get_event_sequence(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk3.event_sequence.EventSequence(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the type of the event.
      Returns: a #GdkEventType
  */
  gid.gdk3.types.EventType getEventType() nothrow
  {
    GdkEventType _cretval;
    _cretval = gdk_event_get_event_type(cast(const(GdkEvent)*)this._cPtr);
    gid.gdk3.types.EventType _retval = cast(gid.gdk3.types.EventType)_cretval;
    return _retval;
  }

  /**
      Extracts the hardware keycode from an event.
      
      Also see [gid.gdk3.event.Event.getScancode].
  
      Params:
        keycode = location to store the keycode
      Returns: true if the event delivered a hardware keycode
  */
  bool getKeycode(out ushort keycode) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_keycode(cast(const(GdkEvent)*)this._cPtr, cast(ushort*)&keycode);
    return _retval;
  }

  /**
      Extracts the keyval from an event.
  
      Params:
        keyval = location to store the keyval
      Returns: true if the event delivered a key symbol
  */
  bool getKeyval(out uint keyval) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_keyval(cast(const(GdkEvent)*)this._cPtr, cast(uint*)&keyval);
    return _retval;
  }

  /**
      #event: a #GdkEvent
      Returns whether this event is an 'emulated' pointer event (typically
      from a touch event), as opposed to a real one.
      Returns: true if this event is emulated
  */
  bool getPointerEmulated() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_pointer_emulated(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extract the root window relative x/y coordinates from an event.
  
      Params:
        xRoot = location to put root window x coordinate
        yRoot = location to put root window y coordinate
      Returns: true if the event delivered root window coordinates
  */
  bool getRootCoords(out double xRoot, out double yRoot) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_root_coords(cast(const(GdkEvent)*)this._cPtr, cast(double*)&xRoot, cast(double*)&yRoot);
    return _retval;
  }

  /**
      Gets the keyboard low-level scancode of a key event.
      
      This is usually hardware_keycode. On Windows this is the high
      word of WM_KEY{DOWN,UP} lParam which contains the scancode and
      some extended flags.
      Returns: The associated keyboard scancode or 0
  */
  int getScancode() nothrow
  {
    int _retval;
    _retval = gdk_event_get_scancode(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Returns the screen for the event. The screen is
      typically the screen for `event->any.window`, but
      for events such as mouse events, it is the screen
      where the pointer was when the event occurs -
      that is, the screen which has the root window
      to which `event->motion.x_root` and
      `event->motion.y_root` are relative.
      Returns: the screen for the event
  */
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gdk_event_get_screen(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the scroll deltas from a #GdkEvent
      
      See also: [gid.gdk3.event.Event.getScrollDirection]
  
      Params:
        deltaX = return location for X delta
        deltaY = return location for Y delta
      Returns: true if the event contains smooth scroll information
          and false otherwise
  */
  bool getScrollDeltas(out double deltaX, out double deltaY) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_scroll_deltas(cast(const(GdkEvent)*)this._cPtr, cast(double*)&deltaX, cast(double*)&deltaY);
    return _retval;
  }

  /**
      Extracts the scroll direction from an event.
      
      If event is not of type [gid.gdk4.types.EventType.Scroll], the contents of direction
      are undefined.
      
      If you wish to handle both discrete and smooth scrolling, you
      should check the return value of this function, or of
      [gid.gdk3.event.Event.getScrollDeltas]; for instance:
      
      ```c
        GdkScrollDirection direction;
        double vscroll_factor = 0.0;
        double x_scroll, y_scroll;
      
        if (gdk_event_get_scroll_direction (event, &direction))
          {
            // Handle discrete scrolling with a known constant delta;
            const double delta = 12.0;
      
            switch (direction)
              {
              case GDK_SCROLL_UP:
                vscroll_factor = -delta;
                break;
              case GDK_SCROLL_DOWN:
                vscroll_factor = delta;
                break;
              default:
                // no scrolling
                break;
              }
          }
        else if (gdk_event_get_scroll_deltas (event, &x_scroll, &y_scroll))
          {
            // Handle smooth scrolling directly
            vscroll_factor = y_scroll;
          }
      ```
  
      Params:
        direction = location to store the scroll direction
      Returns: true if the event delivered a scroll direction
          and false otherwise
  */
  bool getScrollDirection(out gid.gdk3.types.ScrollDirection direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_scroll_direction(cast(const(GdkEvent)*)this._cPtr, &direction);
    return _retval;
  }

  /**
      Returns the #GdkSeat this event was generated for.
      Returns: The #GdkSeat of this event
  */
  gid.gdk3.seat.Seat getSeat() nothrow
  {
    GdkSeat* _cretval;
    _cretval = gdk_event_get_seat(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function returns the hardware (slave) #GdkDevice that has
      triggered the event, falling back to the virtual (master) device
      (as in [gid.gdk4.event.Event.getDevice]) if the event wasn’t caused by
      interaction with a hardware device. This may happen for example
      in synthesized crossing events after a #GdkWindow updates its
      geometry or a grab is acquired/released.
      
      If the event does not contain a device field, this function will
      return null.
      Returns: a #GdkDevice, or null.
  */
  gid.gdk3.device.Device getSourceDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_source_device(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      If the event contains a “state” field, puts that field in state. Otherwise
      stores an empty state (0). Returns true if there was a state field
      in the event. event may be null, in which case it’s treated
      as if the event had no state field.
  
      Params:
        state = return location for state
      Returns: true if there was a state field in the event
  */
  bool getState(out gid.gdk3.types.ModifierType state) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_get_state(cast(const(GdkEvent)*)this._cPtr, &state);
    return _retval;
  }

  /**
      Returns the time stamp from event, if there is one; otherwise
      returns #GDK_CURRENT_TIME. If event is null, returns #GDK_CURRENT_TIME.
      Returns: time stamp field from event
  */
  uint getTime() nothrow
  {
    uint _retval;
    _retval = gdk_event_get_time(cast(const(GdkEvent)*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the #GdkWindow associated with an event.
      Returns: The #GdkWindow associated with the event
  */
  gid.gdk3.window.Window getWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gdk_event_get_window(cast(const(GdkEvent)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Check whether a scroll event is a stop scroll event. Scroll sequences
      with smooth scroll information may provide a stop scroll event once the
      interaction with the device finishes, e.g. by lifting a finger. This
      stop scroll event is the signal that a widget may trigger kinetic
      scrolling based on the current velocity.
      
      Stop scroll events always have a a delta of 0/0.
      Returns: true if the event is a scroll stop event
  */
  bool isScrollStopEvent() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_is_scroll_stop_event(cast(const(GdkEvent)*)this._cPtr);
    return _retval;
  }

  /**
      Appends a copy of the given event onto the front of the event
      queue for event->any.window’s display, or the default event
      queue if event->any.window is null. See [gid.gdk4.display.Display.putEvent].
  */
  void put() nothrow
  {
    gdk_event_put(cast(const(GdkEvent)*)this._cPtr);
  }

  /**
      Sets the device for event to device. The event must
      have been allocated by GTK+, for instance, by
      [gid.gdk3.event.Event.copy].
  
      Params:
        device = a #GdkDevice
  */
  void setDevice(gid.gdk3.device.Device device) nothrow
  {
    gdk_event_set_device(cast(GdkEvent*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      Sets the device tool for this event, should be rarely used.
  
      Params:
        tool = tool to set on the event, or null
  */
  void setDeviceTool(gid.gdk3.device_tool.DeviceTool tool = null) nothrow
  {
    gdk_event_set_device_tool(cast(GdkEvent*)this._cPtr, tool ? cast(GdkDeviceTool*)tool._cPtr(No.Dup) : null);
  }

  /**
      Sets the screen for event to screen. The event must
      have been allocated by GTK+, for instance, by
      [gid.gdk3.event.Event.copy].
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    gdk_event_set_screen(cast(GdkEvent*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Sets the slave device for event to device.
      
      The event must have been allocated by GTK+,
      for instance by [gid.gdk3.event.Event.copy].
  
      Params:
        device = a #GdkDevice
  */
  void setSourceDevice(gid.gdk3.device.Device device) nothrow
  {
    gdk_event_set_source_device(cast(GdkEvent*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      This function returns whether a #GdkEventButton should trigger a
      context menu, according to platform conventions. The right mouse
      button always triggers context menus. Additionally, if
      [gid.gdk3.keymap.Keymap.getModifierMask] returns a non-0 mask for
      [gid.gdk3.types.ModifierIntent.ContextMenu], then the left mouse button will
      also trigger a context menu if this modifier is pressed.
      
      This function should always be used instead of simply checking for
      event->button == [gid.gdk4.types.BUTTON_SECONDARY].
      Returns: true if the event should trigger a context menu.
  */
  bool triggersContextMenu() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_event_triggers_context_menu(cast(const(GdkEvent)*)this._cPtr);
    return _retval;
  }

  /**
      Checks all open displays for a #GdkEvent to process,to be processed
      on, fetching events from the windowing system if necessary.
      See [gid.gdk3.display.Display.getEvent].
      Returns: the next #GdkEvent to be processed, or null
        if no events are pending. The returned #GdkEvent should be freed
        with [gid.gdk3.event.Event.free].
  */
  static gid.gdk3.event.Event get() nothrow
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_get();
    auto _retval = _cretval ? new gid.gdk3.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets the function to call to handle all events from GDK.
      
      Note that GTK+ uses this to install its own event handler, so it is
      usually not useful for GTK+ applications. (Although an application
      can call this function then call [gid.gtk3.global.mainDoEvent] to pass
      events to GTK+.)
  
      Params:
        func = the function to call to handle events from GDK.
  */
  static void handlerSet(gid.gdk3.types.EventFunc func) nothrow
  {
    extern(C) void _funcCallback(GdkEvent* event, void* data) nothrow
    {
      auto _dlg = cast(gid.gdk3.types.EventFunc*)data;
      auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(_event);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk3.types.EventFunc");
      }
      if (_event)
        _event._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gdk_event_handler_set(_funcCB, _func, _funcDestroyCB);
  }

  /**
      If there is an event waiting in the event queue of some open
      display, returns a copy of it. See [gid.gdk3.display.Display.peekEvent].
      Returns: a copy of the first #GdkEvent on some event
        queue, or null if no events are in any queues. The returned
        #GdkEvent should be freed with [gid.gdk3.event.Event.free].
  */
  static gid.gdk3.event.Event peek() nothrow
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_peek();
    auto _retval = _cretval ? new gid.gdk3.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Request more motion notifies if event is a motion notify hint event.
      
      This function should be used instead of [gid.gdk3.window.Window.getPointer] to
      request further motion notifies, because it also works for extension
      events where motion notifies are provided for devices other than the
      core pointer. Coordinate extraction, processing and requesting more
      motion events from a [gid.gdk4.types.EventType.MotionNotify] event usually works like this:
      
      ```c
      {
        // motion_event handler
        x = motion_event->x;
        y = motion_event->y;
        // handle (x,y) motion
        gdk_event_request_motions (motion_event); // handles is_hint events
      }
      ```
  
      Params:
        event = a valid #GdkEvent
  */
  static void requestMotions(gid.gdk3.event_motion.EventMotion event) nothrow
  {
    gdk_event_request_motions(event ? cast(const(GdkEventMotion)*)event._cPtr(No.Dup) : null);
  }
}
