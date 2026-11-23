/// Module for [Navigation] interface mixin
module gid.gstvideo1.navigation_mixin;

public import gid.core.basictypes;
public import gid.gstvideo1.navigation_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gst1.event;
public import gid.gst1.message;
public import gid.gst1.object;
public import gid.gst1.query;
public import gid.gst1.structure;
public import gid.gstvideo1.c.functions;
public import gid.gstvideo1.c.types;
public import gid.gstvideo1.types;

/**
    The Navigation interface is used for creating and injecting navigation
    related events such as mouse button presses, cursor motion and key presses.
    The associated library also provides methods for parsing received events, and
    for sending and receiving navigation related bus events. One main usecase is
    DVD menu navigation.
    
    The main parts of the API are:
    
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
    
    The GstNavigation message functions provide functions for creating and
    parsing custom bus messages for signaling GstNavigation changes.
*/
template NavigationT()
{









































  /**
      sending a navigation event.
  
      Params:
        structure =  (modified in place, changes are seen by the caller)
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSendEvent`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use #GstNavigationInterface.send_event_simple() instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSendEvent(gid.gst1.structure.Structure structure)
  {
    auto _klass = cast(GstNavigationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.navigation.Navigation._getGType);
    if (!_klass || !_klass.sendEvent)
      return;

    _klass.sendEvent(cast(GstNavigation*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(No.Dup) : null);
  }

  /**
      Sends an event to the navigation interface.
  
      Params:
        event = The event to send
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSendEventSimple`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSendEventSimple(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstNavigationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.navigation.Navigation._getGType);
    if (!_klass || !_klass.sendEventSimple)
      return;

    _klass.sendEventSimple(cast(GstNavigation*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
  }

  /**
      Sends the indicated command to the navigation interface.
  
      Params:
        command = The command to issue
  */
  override void sendCommand(gid.gstvideo1.types.NavigationCommand command) nothrow
  {
    gst_navigation_send_command(cast(GstNavigation*)this._cPtr, command);
  }

  /** */
  override void sendEvent(gid.gst1.structure.Structure structure) nothrow
  {
    gst_navigation_send_event(cast(GstNavigation*)this._cPtr, structure ? cast(GstStructure*)structure._cPtr(No.Dup) : null);
  }

  /**
      Sends an event to the navigation interface.
  
      Params:
        event = The event to send
  */
  override void sendEventSimple(gid.gst1.event.Event event) nothrow
  {
    gst_navigation_send_event_simple(cast(GstNavigation*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
  }

  /** */
  override void sendKeyEvent(string event, string key) nothrow
  {
    const(char)* _event = event.toCString!(No.Malloc, No.Nullable);
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    gst_navigation_send_key_event(cast(GstNavigation*)this._cPtr, _event, _key);
  }

  /**
      Sends a mouse event to the navigation interface. Mouse event coordinates
      are sent relative to the display space of the related output area. This is
      usually the size in pixels of the window associated with the element
      implementing the #GstNavigation interface.
  
      Params:
        event = The type of mouse event, as a text string. Recognised values are
          "mouse-button-press", "mouse-button-release", "mouse-move" and "mouse-double-click".
        button = The button number of the button being pressed or released. Pass 0
          for mouse-move events.
        x = The x coordinate of the mouse event.
        y = The y coordinate of the mouse event.
  */
  override void sendMouseEvent(string event, int button, double x, double y) nothrow
  {
    const(char)* _event = event.toCString!(No.Malloc, No.Nullable);
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
  override void sendMouseScrollEvent(double x, double y, double deltaX, double deltaY) nothrow
  {
    gst_navigation_send_mouse_scroll_event(cast(GstNavigation*)this._cPtr, x, y, deltaX, deltaY);
  }

  /// True if the D class T overrides any vfunc method of gid.gstvideo1.navigation.Navigation (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gstvideo1_navigation_Navigation(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendEvent", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendEventSimple", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gstvideo1.navigation.Navigation vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gstvideo1_navigation_Navigation(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendEvent", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_navigation_Navigation(iface, "send_event");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendEventSimple", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_navigation_Navigation(iface, "send_event_simple");
  }

  private static void _installIfaceVfunc_gid_gstvideo1_navigation_Navigation(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstNavigationInterface*)iface;

    switch (vfunc)
    {
      case "send_event":
      {
        static extern(C) void _vfuncSendEventTramp(GstNavigation* navigation, GstStructure* structure) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)navigation);
          if (!_obj)
          {
            auto _klass = cast(GstNavigationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)navigation), gid.gstvideo1.navigation.Navigation._getGType);
            if (_klass && _klass.sendEvent)
              return (cast(typeof(&_vfuncSendEventTramp))_klass.sendEvent)(navigation, structure);
            return;
          }

          auto _structure = structure ? new gid.gst1.structure.Structure(cast(void*)structure, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncSendEvent(_structure);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.navigation.Navigation.vfuncSendEvent");
          }
          if (_structure)
            _structure._cUnborrow;

        }

        _klass.sendEvent = cast(typeof(_klass.sendEvent))&_vfuncSendEventTramp;
        break;
      }
      case "send_event_simple":
      {
        static extern(C) void _vfuncSendEventSimpleTramp(GstNavigation* navigation, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)navigation);
          if (!_obj)
          {
            auto _klass = cast(GstNavigationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)navigation), gid.gstvideo1.navigation.Navigation._getGType);
            if (_klass && _klass.sendEventSimple)
              return (cast(typeof(&_vfuncSendEventSimpleTramp))_klass.sendEventSimple)(navigation, event);
            return;
          }

          try
          {
            _obj.vfuncSendEventSimple(event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.navigation.Navigation.vfuncSendEventSimple");
          }
        }

        _klass.sendEventSimple = cast(typeof(_klass.sendEventSimple))&_vfuncSendEventSimpleTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.navigation.Navigation]
template NavigationGidBuilderT()
{
}
