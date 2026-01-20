/// Module for [Navigation] interface mixin
module gstvideo.navigation_mixin;

public import gstvideo.navigation_iface_proxy;
public import gid.gid;
public import gst.event;
public import gst.message;
public import gst.object;
public import gst.query;
public import gst.structure;
public import gstvideo.c.functions;
public import gstvideo.c.types;
public import gstvideo.types;

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
template NavigationT()
{








































  /**
      Sends the indicated command to the navigation interface.
  
      Params:
        command = The command to issue
  */
  override void sendCommand(gstvideo.types.NavigationCommand command)
  {
    gst_navigation_send_command(cast(GstNavigation*)this._cPtr, command);
  }

  /** */
  override void sendEvent(gst.structure.Structure structure)
  {
    gst_navigation_send_event(cast(GstNavigation*)this._cPtr, cast(GstStructure*)&structure);
  }

  /**
      Sends an event to the navigation interface.
  
      Params:
        event = The event to send
  */
  override void sendEventSimple(gst.event.Event event)
  {
    gst_navigation_send_event_simple(cast(GstNavigation*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
  }

  /** */
  override void sendKeyEvent(string event, string key)
  {
    const(char)* _event = event.toCString(No.Alloc);
    const(char)* _key = key.toCString(No.Alloc);
    gst_navigation_send_key_event(cast(GstNavigation*)this._cPtr, _event, _key);
  }

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
  override void sendMouseEvent(string event, int button, double x, double y)
  {
    const(char)* _event = event.toCString(No.Alloc);
    gst_navigation_send_mouse_event(cast(GstNavigation*)this._cPtr, _event, button, x, y);
  }

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
  override void sendMouseScrollEvent(double x, double y, double deltaX, double deltaY)
  {
    gst_navigation_send_mouse_scroll_event(cast(GstNavigation*)this._cPtr, x, y, deltaX, deltaY);
  }
}
