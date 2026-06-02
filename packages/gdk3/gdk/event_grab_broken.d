/// Module for [EventGrabBroken] class
module gdk.event_grab_broken;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a pointer or keyboard grab is broken. On X11, this happens
    when the grab window becomes unviewable (i.e. it or one of its ancestors
    is unmapped), or if the same application grabs the pointer or keyboard
    again. Note that implicit grabs (which are initiated by button presses)
    can also cause #GdkEventGrabBroken events.
*/
class EventGrabBroken
{
  GdkEventGrabBroken _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventGrabBroken*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.GrabBroken])
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventGrabBroken*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.GrabBroken])
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventGrabBroken*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event, i.e. the window
          that previously owned the grab
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event, i.e. the window
            that previously owned the grab
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventGrabBroken*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventGrabBroken*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventGrabBroken*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `keyboard` field.
      Returns: true if a keyboard grab was broken, false if a pointer
          grab was broken
  */
  @property bool keyboard() nothrow
  {
    return cast(bool)(cast(GdkEventGrabBroken*)this._cPtr).keyboard;
  }

  /**
      Set `keyboard` field.
      Params:
        propval = true if a keyboard grab was broken, false if a pointer
            grab was broken
  */
  @property void keyboard(bool propval) nothrow
  {
    (cast(GdkEventGrabBroken*)this._cPtr).keyboard = propval;
  }

  /**
      Get `implicit` field.
      Returns: true if the broken grab was implicit
  */
  @property bool implicit() nothrow
  {
    return cast(bool)(cast(GdkEventGrabBroken*)this._cPtr).implicit;
  }

  /**
      Set `implicit` field.
      Params:
        propval = true if the broken grab was implicit
  */
  @property void implicit(bool propval) nothrow
  {
    (cast(GdkEventGrabBroken*)this._cPtr).implicit = propval;
  }

  /**
      Get `grabWindow` field.
      Returns: If this event is caused by another grab in the same
          application, @grab_window contains the new grab window. Otherwise
          @grab_window is null.
  */
  @property gdk.window.Window grabWindow() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)this._cPtr).grabWindow);
  }

  /**
      Set `grabWindow` field.
      Params:
        propval = If this event is caused by another grab in the same
            application, @grab_window contains the new grab window. Otherwise
            @grab_window is null.
  */
  @property void grabWindow(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventGrabBroken*)this._cPtr).grabWindow);
    dToC(propval, cast(void*)&(cast(GdkEventGrabBroken*)this._cPtr).grabWindow);
  }
}
