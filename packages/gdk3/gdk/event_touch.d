/// Module for [EventTouch] class
module gdk.event_touch;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.event_sequence;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Used for touch events.
    @type field will be one of [gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
    [gdk.types.EventType.TouchEnd] or [gdk.types.EventType.TouchCancel].
    
    Touch events are grouped into sequences by means of the @sequence
    field, which can also be obtained with [gdk.event.Event.getEventSequence].
    Each sequence begins with a [gdk.types.EventType.TouchBegin] event, followed by
    any number of [gdk.types.EventType.TouchUpdate] events, and ends with a [gdk.types.EventType.TouchEnd]
    (or [gdk.types.EventType.TouchCancel]) event. With multitouch devices, there may be
    several active sequences at the same time.
*/
class EventTouch
{
  GdkEventTouch _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventTouch*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
          [gdk.types.EventType.TouchEnd], [gdk.types.EventType.TouchCancel])
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouch*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
            [gdk.types.EventType.TouchEnd], [gdk.types.EventType.TouchCancel])
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouch*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouch*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouch*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window
  */
  @property double x() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window
  */
  @property double y() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType
  */
  @property gdk.types.ModifierType state() nothrow
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouch*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType
  */
  @property void state(gdk.types.ModifierType propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `sequence` field.
      Returns: the event sequence that the event belongs to
  */
  @property gdk.event_sequence.EventSequence sequence() nothrow
  {
    return cToD!(gdk.event_sequence.EventSequence)(cast(void*)(cast(GdkEventTouch*)this._cPtr).sequence);
  }

  /**
      Set `sequence` field.
      Params:
        propval = the event sequence that the event belongs to
  */
  @property void sequence(gdk.event_sequence.EventSequence propval) nothrow
  {
    cValueFree!(gdk.event_sequence.EventSequence)(cast(void*)(cast(GdkEventTouch*)this._cPtr).sequence);
    dToC(propval, cast(void*)&(cast(GdkEventTouch*)this._cPtr).sequence);
  }

  /**
      Get `emulatingPointer` field.
      Returns: whether the event should be used for emulating
          pointer event
  */
  @property bool emulatingPointer() nothrow
  {
    return cast(bool)(cast(GdkEventTouch*)this._cPtr).emulatingPointer;
  }

  /**
      Set `emulatingPointer` field.
      Params:
        propval = whether the event should be used for emulating
            pointer event
  */
  @property void emulatingPointer(bool propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).emulatingPointer = propval;
  }

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property gdk.device.Device device() nothrow
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventTouch*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gdk.device.Device propval) nothrow
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventTouch*)this._cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventTouch*)this._cPtr).device);
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventTouch*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).yRoot = propval;
  }
}
