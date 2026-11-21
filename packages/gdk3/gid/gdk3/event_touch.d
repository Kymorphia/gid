/// Module for [EventTouch] class
module gid.gdk3.event_touch;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.device;
import gid.gdk3.event_sequence;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Used for touch events.
    @type field will be one of [gid.gdk4.types.EventType.TouchBegin], [gid.gdk4.types.EventType.TouchUpdate],
    [gid.gdk4.types.EventType.TouchEnd] or [gid.gdk4.types.EventType.TouchCancel].
    
    Touch events are grouped into sequences by means of the @sequence
    field, which can also be obtained with [gid.gdk4.event.Event.getEventSequence].
    Each sequence begins with a [gid.gdk4.types.EventType.TouchBegin] event, followed by
    any number of [gid.gdk4.types.EventType.TouchUpdate] events, and ends with a [gid.gdk4.types.EventType.TouchEnd]
    (or [gid.gdk4.types.EventType.TouchCancel]) event. With multitouch devices, there may be
    several active sequences at the same time.
*/
class EventTouch : StructWrap!(GdkEventTouch, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_touch.EventTouch` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.TouchBegin], [gid.gdk4.types.EventType.TouchUpdate],
            [gid.gdk4.types.EventType.TouchEnd], [gid.gdk4.types.EventType.TouchCancel])
        window = the window which received the event
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        x = the x coordinate of the pointer relative to the window
        y = the y coordinate of the pointer relative to the window
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType
        sequence = the event sequence that the event belongs to
        emulatingPointer = whether the event should be used for emulating
            pointer event
        device = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
        xRoot = the x coordinate of the pointer relative to the root of the
            screen
        yRoot = the y coordinate of the pointer relative to the root of the
            screen
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, double x = 0.0, double y = 0.0, gid.gdk3.types.ModifierType state = gid.gdk3.types.ModifierType.init, gid.gdk3.event_sequence.EventSequence sequence = gid.gdk3.event_sequence.EventSequence.init, bool emulatingPointer = bool.init, gid.gdk3.device.Device device = gid.gdk3.device.Device.init, double xRoot = 0.0, double yRoot = 0.0) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.x = x;
    this.y = y;
    this.state = state;
    this.sequence = sequence;
    this.emulatingPointer = emulatingPointer;
    this.device = device;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gid.gdk4.types.EventType.TouchBegin], [gid.gdk4.types.EventType.TouchUpdate],
          [gid.gdk4.types.EventType.TouchEnd], [gid.gdk4.types.EventType.TouchCancel])
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventTouch*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.TouchBegin], [gid.gdk4.types.EventType.TouchUpdate],
            [gid.gdk4.types.EventType.TouchEnd], [gid.gdk4.types.EventType.TouchCancel])
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventTouch*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("window"))
      return;

    _windowRef = propval;
    (cast(GdkEventTouch*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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
  @property gid.gdk3.types.ModifierType state() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GdkEventTouch*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType
  */
  @property void state(gid.gdk3.types.ModifierType propval) nothrow
  {
    (cast(GdkEventTouch*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  private gid.gdk3.event_sequence.EventSequence _sequenceRef; // Keeps borrowed field value alive

  /**
      Get `sequence` field.
      Returns: the event sequence that the event belongs to
  */
  @property gid.gdk3.event_sequence.EventSequence sequence() nothrow
  {
    return cToD!(gid.gdk3.event_sequence.EventSequence)(cast(void*)(cast(GdkEventTouch*)this._cPtr).sequence);
  }

  /**
      Set `sequence` field.
      Params:
        propval = the event sequence that the event belongs to
  */
  @property void sequence(gid.gdk3.event_sequence.EventSequence propval) nothrow
  {
    if (_refuseBorrowedStore("sequence"))
      return;

    _sequenceRef = propval;
    (cast(GdkEventTouch*)this._cPtr).sequence = propval ? cast(GdkEventSequence*)propval._cPtr(No.Dup) : null;
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

  private gid.gdk3.device.Device _deviceRef; // Keeps borrowed field value alive

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property gid.gdk3.device.Device device() nothrow
  {
    return cToD!(gid.gdk3.device.Device)(cast(void*)(cast(GdkEventTouch*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gid.gdk3.device.Device propval) nothrow
  {
    if (_refuseBorrowedStore("device"))
      return;

    _deviceRef = propval;
    (cast(GdkEventTouch*)this._cPtr).device = propval ? cast(GdkDevice*)propval._cPtr(No.Dup) : null;
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
