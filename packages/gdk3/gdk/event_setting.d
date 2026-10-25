/// Module for [EventSetting] class
module gdk.event_setting;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a setting is modified.
*/
class EventSetting
{
  GdkEventSetting _cInstance;

  /**
      Create a `event_setting.EventSetting` wrap type.
      Params:
        type = the type of the event ([gdk.types.EventType.Setting]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        action = what happened to the setting ([gdk.types.SettingAction.New],
            [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
        name = the name of the setting.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init, gdk.types.SettingAction action = gdk.types.SettingAction.init, string name = string.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.action = action;
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventSetting*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.Setting]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventSetting*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Setting]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventSetting*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSetting*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventSetting*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventSetting*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `action` field.
      Returns: what happened to the setting ([gdk.types.SettingAction.New],
          [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  @property gdk.types.SettingAction action() nothrow
  {
    return cast(gdk.types.SettingAction)(cast(GdkEventSetting*)this._cPtr).action;
  }

  /**
      Set `action` field.
      Params:
        propval = what happened to the setting ([gdk.types.SettingAction.New],
            [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  @property void action(gdk.types.SettingAction propval) nothrow
  {
    (cast(GdkEventSetting*)this._cPtr).action = cast(GdkSettingAction)propval;
  }

  /**
      Get `name` field.
      Returns: the name of the setting.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdkEventSetting*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the setting.
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdkEventSetting*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GdkEventSetting*)this._cPtr).name);
  }
}
