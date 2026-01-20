/// Module for [EventKey] class
module gdk.event_key;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a key press or key release event.
*/
class EventKey
{
  GdkEventKey _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_key.EventKey");

    _cInstance = *cast(GdkEventKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.KeyPress] or [gdk.types.EventType.KeyRelease]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventKey*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.KeyPress] or [gdk.types.EventType.KeyRelease]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventKey*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventKey*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventKey*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventKey*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventKey*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventKey*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventKey*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventKey*)this._cPtr).time = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventKey*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventKey*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `keyval` field.
      Returns: the key that was pressed or released. See the
          `gdk/gdkkeysyms.h` header file for a
          complete list of GDK key codes.
  */
  @property uint keyval()
  {
    return (cast(GdkEventKey*)this._cPtr).keyval;
  }

  /**
      Set `keyval` field.
      Params:
        propval = the key that was pressed or released. See the
            `gdk/gdkkeysyms.h` header file for a
            complete list of GDK key codes.
  */
  @property void keyval(uint propval)
  {
    (cast(GdkEventKey*)this._cPtr).keyval = propval;
  }

  /**
      Get `length` field.
      Returns: the length of @string.
  */
  @property int length()
  {
    return (cast(GdkEventKey*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = the length of @string.
  */
  @property void length(int propval)
  {
    (cast(GdkEventKey*)this._cPtr).length = propval;
  }

  /**
      Get `string_` field.
      Returns: a string containing an approximation of the text that
          would result from this keypress. The only correct way to handle text
          input of text is using input methods (see #GtkIMContext), so this
          field is deprecated and should never be used.
          ([gdk.global.unicodeToKeyval] provides a non-deprecated way of getting
          an approximate translation for a key.) The string is encoded in the
          encoding of the current locale (Note: this for backwards compatibility:
          strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
          In some cases, the translation of the key code will be a single
          NUL byte, in which case looking at @length is necessary to distinguish
          it from the an empty translation.
  */
  @property string string_()
  {
    return cToD!(string)(cast(void*)(cast(GdkEventKey*)this._cPtr).string_);
  }

  /**
      Set `string_` field.
      Params:
        propval = a string containing an approximation of the text that
            would result from this keypress. The only correct way to handle text
            input of text is using input methods (see #GtkIMContext), so this
            field is deprecated and should never be used.
            ([gdk.global.unicodeToKeyval] provides a non-deprecated way of getting
            an approximate translation for a key.) The string is encoded in the
            encoding of the current locale (Note: this for backwards compatibility:
            strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
            In some cases, the translation of the key code will be a single
            NUL byte, in which case looking at @length is necessary to distinguish
            it from the an empty translation.
  */
  @property void string_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkEventKey*)this._cPtr).string_);
    dToC(propval, cast(void*)&(cast(GdkEventKey*)this._cPtr).string_);
  }

  /**
      Get `hardwareKeycode` field.
      Returns: the raw code of the key that was pressed or released.
  */
  @property ushort hardwareKeycode()
  {
    return (cast(GdkEventKey*)this._cPtr).hardwareKeycode;
  }

  /**
      Set `hardwareKeycode` field.
      Params:
        propval = the raw code of the key that was pressed or released.
  */
  @property void hardwareKeycode(ushort propval)
  {
    (cast(GdkEventKey*)this._cPtr).hardwareKeycode = propval;
  }

  /**
      Get `group` field.
      Returns: the keyboard group.
  */
  @property ubyte group()
  {
    return (cast(GdkEventKey*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the keyboard group.
  */
  @property void group(ubyte propval)
  {
    (cast(GdkEventKey*)this._cPtr).group = propval;
  }

  /**
      Get `isModifier` field.
      Returns: a flag that indicates if @hardware_keycode is mapped to a
          modifier. Since 2.10
  */
  @property uint isModifier()
  {
    return (cast(GdkEventKey*)this._cPtr).isModifier;
  }

  /**
      Set `isModifier` field.
      Params:
        propval = a flag that indicates if @hardware_keycode is mapped to a
            modifier. Since 2.10
  */
  @property void isModifier(uint propval)
  {
    (cast(GdkEventKey*)this._cPtr).isModifier = propval;
  }
}
