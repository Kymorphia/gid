/// Module for [Navigation] interface
module gstvideo.navigation;

public import gstvideo.navigation_iface_proxy;
import gid.gid;
import gst.event;
import gst.message;
import gst.object;
import gst.query;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    The Navigation interface is used for creating and injecting navigation
    related events such as mouse button presses, cursor motion and key presses.
    The associated library also provides methods for parsing received events, and
    for sending and receiving navigation related bus events. One main usecase is
    DVD menu navigation.
    
    The main parts of the API are:
    
    $(LIST
      * The GstNavigation interface, implemented by elements which provide an
        application with the ability to create and inject navigation events into
        the pipeline.
      * GstNavigation event handling API. GstNavigation events are created in
        response to calls on a GstNavigation interface implementation, and sent in
        the pipeline. Upstream elements can use the navigation event API functions
        to parse the contents of received messages.
      
      * GstNavigation message handling API. GstNavigation messages may be sent on
        the message bus to inform applications of navigation related changes in the
        pipeline, such as the mouse moving over a clickable region, or the set of
        available angles changing.
    )
      
    The GstNavigation message functions provide functions for creating and
    parsing custom bus messages for signaling GstNavigation changes.
*/
interface Navigation
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_navigation_get_type != &gidSymbolNotFound ? gst_navigation_get_type() : cast(GType)0;
  }

  /**
      Try to retrieve x and y coordinates of a #GstNavigation event.
  
      Params:
        event = The #GstEvent to inspect.
        x = Pointer to a gdouble to receive the x coordinate of the
              navigation event.
        y = Pointer to a gdouble to receive the y coordinate of the
              navigation event.
      Returns: A boolean indicating success.
  */
  static bool eventGetCoordinates(gst.event.Event event, out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_get_coordinates(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Inspect a #GstEvent and return the #GstNavigationEventType of the event, or
      #GST_NAVIGATION_EVENT_INVALID if the event is not a #GstNavigation event.
  
      Params:
        event = A #GstEvent to inspect.
      Returns: 
  */
  static gstvideo.types.NavigationEventType eventGetType(gst.event.Event event)
  {
    GstNavigationEventType _cretval;
    _cretval = gst_navigation_event_get_type(event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    gstvideo.types.NavigationEventType _retval = cast(gstvideo.types.NavigationEventType)_cretval;
    return _retval;
  }

  /**
      Create a new navigation event given navigation command..
  
      Params:
        command = The navigation command to use.
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewCommand(gstvideo.types.NavigationCommand command)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_command(command);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the given key press.
  
      Params:
        key = A string identifying the key press.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewKeyPress(string key, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_navigation_event_new_key_press(_key, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the given key release.
  
      Params:
        key = A string identifying the released key.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewKeyRelease(string key, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_navigation_event_new_key_release(_key, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the given key mouse button press.
  
      Params:
        button = The number of the pressed mouse button.
        x = The x coordinate of the mouse cursor.
        y = The y coordinate of the mouse cursor.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewMouseButtonPress(int button, double x, double y, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_mouse_button_press(button, x, y, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the given key mouse button release.
  
      Params:
        button = The number of the released mouse button.
        x = The x coordinate of the mouse cursor.
        y = The y coordinate of the mouse cursor.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewMouseButtonRelease(int button, double x, double y, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_mouse_button_release(button, x, y, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the new mouse location.
  
      Params:
        x = The x coordinate of the mouse cursor.
        y = The y coordinate of the mouse cursor.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewMouseMove(double x, double y, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_mouse_move(x, y, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for the mouse scroll.
  
      Params:
        x = The x coordinate of the mouse cursor.
        y = The y coordinate of the mouse cursor.
        deltaX = The x component of the scroll movement.
        deltaY = The y component of the scroll movement.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewMouseScroll(double x, double y, double deltaX, double deltaY, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_mouse_scroll(x, y, deltaX, deltaY, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event signalling that all currently active touch
      points are cancelled and should be discarded. For example, under Wayland
      this event might be sent when a swipe passes the threshold to be recognized
      as a gesture by the compositor.
  
      Params:
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewTouchCancel(gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_touch_cancel(state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for an added touch point.
  
      Params:
        identifier = A number uniquely identifying this touch point. It must stay
             unique to this touch point at least until an up event is sent for
             the same identifier, or all touch points are cancelled.
        x = The x coordinate of the new touch point.
        y = The y coordinate of the new touch point.
        pressure = Pressure data of the touch point, from 0.0 to 1.0, or NaN if no
             data is available.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewTouchDown(uint identifier, double x, double y, double pressure, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_touch_down(identifier, x, y, pressure, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event signalling the end of a touch frame. Touch
      frames signal that all previous down, motion and up events not followed by
      another touch frame event already should be considered simultaneous.
  
      Params:
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewTouchFrame(gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_touch_frame(state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for a moved touch point.
  
      Params:
        identifier = A number uniquely identifying this touch point. It must
             correlate to exactly one previous touch_start event.
        x = The x coordinate of the touch point.
        y = The y coordinate of the touch point.
        pressure = Pressure data of the touch point, from 0.0 to 1.0, or NaN if no
             data is available.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewTouchMotion(uint identifier, double x, double y, double pressure, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_touch_motion(identifier, x, y, pressure, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event for a removed touch point.
  
      Params:
        identifier = A number uniquely identifying this touch point. It must
             correlate to exactly one previous down event, but can be reused
             after sending this event.
        x = The x coordinate of the touch point.
        y = The y coordinate of the touch point.
        state = a bit-mask representing the state of the modifier keys (e.g. Control,
          Shift and Alt).
      Returns: a new #GstEvent
  */
  static gst.event.Event eventNewTouchUp(uint identifier, double x, double y, gstvideo.types.NavigationModifierType state)
  {
    GstEvent* _cretval;
    _cretval = gst_navigation_event_new_touch_up(identifier, x, y, state);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Inspect a #GstNavigation command event and retrieve the enum value of the
      associated command.
  
      Params:
        event = A #GstEvent to inspect.
        command = Pointer to GstNavigationCommand to receive the
              type of the navigation event.
      Returns: TRUE if the navigation command could be extracted, otherwise FALSE.
  */
  static bool eventParseCommand(gst.event.Event event, out gstvideo.types.NavigationCommand command)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_command(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, &command);
    return _retval;
  }

  /**
      Note: Modifier keys (as defined in #GstNavigationModifierType)
      [press](GST_NAVIGATION_EVENT_KEY_PRESS) and
      [release](GST_NAVIGATION_KEY_PRESS) events are generated even if those states are
      present on all other related events
  
      Params:
        event = A #GstEvent to inspect.
        key = A pointer to a location to receive
              the string identifying the key press. The returned string is owned by the
              event, and valid only until the event is unreffed.
      Returns: 
  */
  static bool eventParseKeyEvent(gst.event.Event event, out string key)
  {
    bool _retval;
    char* _key;
    _retval = cast(bool)gst_navigation_event_parse_key_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, &_key);
    key = _key.fromCString(No.Free);
    return _retval;
  }

  /** */
  static bool eventParseModifierState(gst.event.Event event, out gstvideo.types.NavigationModifierType state)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_modifier_state(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, &state);
    return _retval;
  }

  /**
      Retrieve the details of either a #GstNavigation mouse button press event or
      a mouse button release event. Determine which type the event is using
      [gstvideo.navigation.Navigation.eventGetType] to retrieve the #GstNavigationEventType.
  
      Params:
        event = A #GstEvent to inspect.
        button = Pointer to a gint that will receive the button
              number associated with the event.
        x = Pointer to a gdouble to receive the x coordinate of the
              mouse button event.
        y = Pointer to a gdouble to receive the y coordinate of the
              mouse button event.
      Returns: TRUE if the button number and both coordinates could be extracted,
            otherwise FALSE.
  */
  static bool eventParseMouseButtonEvent(gst.event.Event event, out int button, out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_mouse_button_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(int*)&button, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Inspect a #GstNavigation mouse movement event and extract the coordinates
      of the event.
  
      Params:
        event = A #GstEvent to inspect.
        x = Pointer to a gdouble to receive the x coordinate of the
              mouse movement.
        y = Pointer to a gdouble to receive the y coordinate of the
              mouse movement.
      Returns: TRUE if both coordinates could be extracted, otherwise FALSE.
  */
  static bool eventParseMouseMoveEvent(gst.event.Event event, out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_mouse_move_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Inspect a #GstNavigation mouse scroll event and extract the coordinates
      of the event.
  
      Params:
        event = A #GstEvent to inspect.
        x = Pointer to a gdouble to receive the x coordinate of the
              mouse movement.
        y = Pointer to a gdouble to receive the y coordinate of the
              mouse movement.
        deltaX = Pointer to a gdouble to receive the delta_x coordinate of the
              mouse movement.
        deltaY = Pointer to a gdouble to receive the delta_y coordinate of the
              mouse movement.
      Returns: TRUE if all coordinates could be extracted, otherwise FALSE.
  */
  static bool eventParseMouseScrollEvent(gst.event.Event event, out double x, out double y, out double deltaX, out double deltaY)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_mouse_scroll_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y, cast(double*)&deltaX, cast(double*)&deltaY);
    return _retval;
  }

  /**
      Retrieve the details of a #GstNavigation touch-down or touch-motion event.
      Determine which type the event is using [gstvideo.navigation.Navigation.eventGetType]
      to retrieve the #GstNavigationEventType.
  
      Params:
        event = A #GstEvent to inspect.
        identifier = Pointer to a guint that will receive the
              identifier unique to this touch point.
        x = Pointer to a gdouble that will receive the x
              coordinate of the touch event.
        y = Pointer to a gdouble that will receive the y
              coordinate of the touch event.
        pressure = Pointer to a gdouble that will receive the
              force of the touch event, in the range from 0.0 to 1.0. If pressure
              data is not available, NaN will be set instead.
      Returns: TRUE if all details could be extracted, otherwise FALSE.
  */
  static bool eventParseTouchEvent(gst.event.Event event, out uint identifier, out double x, out double y, out double pressure)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_touch_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(uint*)&identifier, cast(double*)&x, cast(double*)&y, cast(double*)&pressure);
    return _retval;
  }

  /**
      Retrieve the details of a #GstNavigation touch-up event.
  
      Params:
        event = A #GstEvent to inspect.
        identifier = Pointer to a guint that will receive the
              identifier unique to this touch point.
        x = Pointer to a gdouble that will receive the x
              coordinate of the touch event.
        y = Pointer to a gdouble that will receive the y
              coordinate of the touch event.
      Returns: TRUE if all details could be extracted, otherwise FALSE.
  */
  static bool eventParseTouchUpEvent(gst.event.Event event, out uint identifier, out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_parse_touch_up_event(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(uint*)&identifier, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Try to set x and y coordinates on a #GstNavigation event. The event must
      be writable.
  
      Params:
        event = The #GstEvent to modify.
        x = The x coordinate to set.
        y = The y coordinate to set.
      Returns: A boolean indicating success.
  */
  static bool eventSetCoordinates(gst.event.Event event, double x, double y)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_event_set_coordinates(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, x, y);
    return _retval;
  }

  /**
      Check a bus message to see if it is a #GstNavigation event, and return
      the #GstNavigationMessageType identifying the type of the message if so.
  
      Params:
        message = A #GstMessage to inspect.
      Returns: The type of the #GstMessage, or
        #GST_NAVIGATION_MESSAGE_INVALID if the message is not a #GstNavigation
        notification.
  */
  static gstvideo.types.NavigationMessageType messageGetType(gst.message.Message message)
  {
    GstNavigationMessageType _cretval;
    _cretval = gst_navigation_message_get_type(message ? cast(GstMessage*)message._cPtr(No.Dup) : null);
    gstvideo.types.NavigationMessageType _retval = cast(gstvideo.types.NavigationMessageType)_cretval;
    return _retval;
  }

  /**
      Creates a new #GstNavigation message with type
      #GST_NAVIGATION_MESSAGE_ANGLES_CHANGED for notifying an application
      that the current angle, or current number of angles available in a
      multiangle video has changed.
  
      Params:
        src = A #GstObject to set as source of the new message.
        curAngle = The currently selected angle.
        nAngles = The number of viewing angles now available.
      Returns: The new #GstMessage.
  */
  static gst.message.Message messageNewAnglesChanged(gst.object.ObjectWrap src, uint curAngle, uint nAngles)
  {
    GstMessage* _cretval;
    _cretval = gst_navigation_message_new_angles_changed(src ? cast(GstObject*)src._cPtr(No.Dup) : null, curAngle, nAngles);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstNavigation message with type
      #GST_NAVIGATION_MESSAGE_COMMANDS_CHANGED
  
      Params:
        src = A #GstObject to set as source of the new message.
      Returns: The new #GstMessage.
  */
  static gst.message.Message messageNewCommandsChanged(gst.object.ObjectWrap src)
  {
    GstMessage* _cretval;
    _cretval = gst_navigation_message_new_commands_changed(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstNavigation message with type
      #GST_NAVIGATION_MESSAGE_EVENT.
  
      Params:
        src = A #GstObject to set as source of the new message.
        event = A navigation #GstEvent
      Returns: The new #GstMessage.
  */
  static gst.message.Message messageNewEvent(gst.object.ObjectWrap src, gst.event.Event event)
  {
    GstMessage* _cretval;
    _cretval = gst_navigation_message_new_event(src ? cast(GstObject*)src._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstNavigation message with type
      #GST_NAVIGATION_MESSAGE_MOUSE_OVER.
  
      Params:
        src = A #GstObject to set as source of the new message.
        active = true if the mouse has entered a clickable area of the display.
          false if it over a non-clickable area.
      Returns: The new #GstMessage.
  */
  static gst.message.Message messageNewMouseOver(gst.object.ObjectWrap src, bool active)
  {
    GstMessage* _cretval;
    _cretval = gst_navigation_message_new_mouse_over(src ? cast(GstObject*)src._cPtr(No.Dup) : null, active);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse a #GstNavigation message of type GST_NAVIGATION_MESSAGE_ANGLES_CHANGED
      and extract the cur_angle and n_angles parameters.
  
      Params:
        message = A #GstMessage to inspect.
        curAngle = A pointer to a #guint to receive the new
              current angle number, or NULL
        nAngles = A pointer to a #guint to receive the new angle
              count, or NULL.
      Returns: true if the message could be successfully parsed. false if not.
  */
  static bool messageParseAnglesChanged(gst.message.Message message, out uint curAngle, out uint nAngles)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_message_parse_angles_changed(message ? cast(GstMessage*)message._cPtr(No.Dup) : null, cast(uint*)&curAngle, cast(uint*)&nAngles);
    return _retval;
  }

  /**
      Parse a #GstNavigation message of type #GST_NAVIGATION_MESSAGE_EVENT
      and extract contained #GstEvent. The caller must unref the event when done
      with it.
  
      Params:
        message = A #GstMessage to inspect.
        event = a pointer to a #GstEvent to receive
              the contained navigation event.
      Returns: true if the message could be successfully parsed. false if not.
  */
  static bool messageParseEvent(gst.message.Message message, out gst.event.Event event)
  {
    bool _retval;
    GstEvent* _event;
    _retval = cast(bool)gst_navigation_message_parse_event(message ? cast(GstMessage*)message._cPtr(No.Dup) : null, &_event);
    event = new gst.event.Event(cast(void*)_event, Yes.Take);
    return _retval;
  }

  /**
      Parse a #GstNavigation message of type #GST_NAVIGATION_MESSAGE_MOUSE_OVER
      and extract the active/inactive flag. If the mouse over event is marked
      active, it indicates that the mouse is over a clickable area.
  
      Params:
        message = A #GstMessage to inspect.
        active = A pointer to a gboolean to receive the
              active/inactive state, or NULL.
      Returns: true if the message could be successfully parsed. false if not.
  */
  static bool messageParseMouseOver(gst.message.Message message, out bool active)
  {
    bool _retval;
    gboolean _active;
    _retval = cast(bool)gst_navigation_message_parse_mouse_over(message ? cast(GstMessage*)message._cPtr(No.Dup) : null, &_active);
    active = cast(bool)_active;
    return _retval;
  }

  /**
      Inspect a #GstQuery and return the #GstNavigationQueryType associated with
      it if it is a #GstNavigation query.
  
      Params:
        query = The query to inspect
      Returns: The #GstNavigationQueryType of the query, or
        #GST_NAVIGATION_QUERY_INVALID
  */
  static gstvideo.types.NavigationQueryType queryGetType(gst.query.Query query)
  {
    GstNavigationQueryType _cretval;
    _cretval = gst_navigation_query_get_type(query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    gstvideo.types.NavigationQueryType _retval = cast(gstvideo.types.NavigationQueryType)_cretval;
    return _retval;
  }

  /**
      Create a new #GstNavigation angles query. When executed, it will
      query the pipeline for the set of currently available angles, which may be
      greater than one in a multiangle video.
      Returns: The new query.
  */
  static gst.query.Query queryNewAngles()
  {
    GstQuery* _cretval;
    _cretval = gst_navigation_query_new_angles();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new #GstNavigation commands query. When executed, it will
      query the pipeline for the set of currently available commands.
      Returns: The new query.
  */
  static gst.query.Query queryNewCommands()
  {
    GstQuery* _cretval;
    _cretval = gst_navigation_query_new_commands();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse the current angle number in the #GstNavigation angles query into the
      #guint pointed to by the cur_angle variable, and the number of available
      angles into the #guint pointed to by the n_angles variable.
  
      Params:
        query = a #GstQuery
        curAngle = Pointer to a #guint into which to store the
              currently selected angle value from the query, or NULL
        nAngles = Pointer to a #guint into which to store the
              number of angles value from the query, or NULL
      Returns: true if the query could be successfully parsed. false if not.
  */
  static bool queryParseAngles(gst.query.Query query, out uint curAngle, out uint nAngles)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_query_parse_angles(query ? cast(GstQuery*)query._cPtr(No.Dup) : null, cast(uint*)&curAngle, cast(uint*)&nAngles);
    return _retval;
  }

  /**
      Parse the number of commands in the #GstNavigation commands query.
  
      Params:
        query = a #GstQuery
        nCmds = the number of commands in this query.
      Returns: true if the query could be successfully parsed. false if not.
  */
  static bool queryParseCommandsLength(gst.query.Query query, out uint nCmds)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_query_parse_commands_length(query ? cast(GstQuery*)query._cPtr(No.Dup) : null, cast(uint*)&nCmds);
    return _retval;
  }

  /**
      Parse the #GstNavigation command query and retrieve the nth command from
      it into cmd. If the list contains less elements than nth, cmd will be
      set to #GST_NAVIGATION_COMMAND_INVALID.
  
      Params:
        query = a #GstQuery
        nth = the nth command to retrieve.
        cmd = a pointer to store the nth command into.
      Returns: true if the query could be successfully parsed. false if not.
  */
  static bool queryParseCommandsNth(gst.query.Query query, uint nth, out gstvideo.types.NavigationCommand cmd)
  {
    bool _retval;
    _retval = cast(bool)gst_navigation_query_parse_commands_nth(query ? cast(GstQuery*)query._cPtr(No.Dup) : null, nth, &cmd);
    return _retval;
  }

  /**
      Set the #GstNavigation angles query result field in query.
  
      Params:
        query = a #GstQuery
        curAngle = the current viewing angle to set.
        nAngles = the number of viewing angles to set.
  */
  static void querySetAngles(gst.query.Query query, uint curAngle, uint nAngles)
  {
    gst_navigation_query_set_angles(query ? cast(GstQuery*)query._cPtr(No.Dup) : null, curAngle, nAngles);
  }

  /**
      Set the #GstNavigation command query result fields in query. The number
      of commands passed must be equal to n_commands.
  
      Params:
        query = a #GstQuery
        cmds = An array containing n_cmds
              GstNavigationCommand values.
  */
  static void querySetCommandsv(gst.query.Query query, gstvideo.types.NavigationCommand[] cmds)
  {
    int _nCmds;
    if (cmds)
      _nCmds = cast(int)cmds.length;

    auto _cmds = cast(GstNavigationCommand*)cmds.ptr;
    gst_navigation_query_set_commandsv(query ? cast(GstQuery*)query._cPtr(No.Dup) : null, _nCmds, _cmds);
  }

  /**
      Sends the indicated command to the navigation interface.
  
      Params:
        command = The command to issue
  */
  void sendCommand(gstvideo.types.NavigationCommand command);

  /** */
  void sendEvent(gst.structure.Structure structure);

  /**
      Sends an event to the navigation interface.
  
      Params:
        event = The event to send
  */
  void sendEventSimple(gst.event.Event event);

  /** */
  void sendKeyEvent(string event, string key);

  /**
      Sends a mouse event to the navigation interface. Mouse event coordinates
      are sent relative to the display space of the related output area. This is
      usually the size in pixels of the window associated with the element
      implementing the #GstNavigation interface.
  
      Params:
        event = The type of mouse event, as a text string. Recognised values are
          "mouse-button-press", "mouse-button-release" and "mouse-move".
        button = The button number of the button being pressed or released. Pass 0
          for mouse-move events.
        x = The x coordinate of the mouse event.
        y = The y coordinate of the mouse event.
  */
  void sendMouseEvent(string event, int button, double x, double y);

  /**
      Sends a mouse scroll event to the navigation interface. Mouse event coordinates
      are sent relative to the display space of the related output area. This is
      usually the size in pixels of the window associated with the element
      implementing the #GstNavigation interface.
  
      Params:
        x = The x coordinate of the mouse event.
        y = The y coordinate of the mouse event.
        deltaX = The delta_x coordinate of the mouse event.
        deltaY = The delta_y coordinate of the mouse event.
  */
  void sendMouseScrollEvent(double x, double y, double deltaX, double deltaY);
}
