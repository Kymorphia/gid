/// Module for [EventKey] class
module gid.gdk3.event_key;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Describes a key press or key release event.
*/
@gidGir("EventKey")
class EventKey : StructWrap!(GdkEventKey, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_key.EventKey` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.KeyPress] or [gid.gdk4.types.EventType.KeyRelease]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
        keyval = the key that was pressed or released. See the
            `gdk/gdkkeysyms.h` header file for a
            complete list of GDK key codes.
        length = the length of @string.
        string_ = a string containing an approximation of the text that
            would result from this keypress. The only correct way to handle text
            input of text is using input methods (see #GtkIMContext), so this
            field is deprecated and should never be used.
            ([gid.gdk4.global.unicodeToKeyval] provides a non-deprecated way of getting
            an approximate translation for a key.) The string is encoded in the
            encoding of the current locale (Note: this for backwards compatibility:
            strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
            In some cases, the translation of the key code will be a single
            NUL byte, in which case looking at @length is necessary to distinguish
            it from the an empty translation.
        hardwareKeycode = the raw code of the key that was pressed or released.
        group = the keyboard group.
        isModifier = a flag that indicates if @hardware_keycode is mapped to a
            modifier. Since 2.10
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, gid.gdk3.types.ModifierType state = gid.gdk3.types.ModifierType.init, uint keyval = uint.init, int length = int.init, string string_ = string.init, ushort hardwareKeycode = ushort.init, ubyte group = ubyte.init, uint isModifier = uint.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.state = state;
    this.keyval = keyval;
    this.length = length;
    this.string_ = string_;
    this.hardwareKeycode = hardwareKeycode;
    this.group = group;
    this.isModifier = isModifier;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.KeyPress] or [gid.gdk4.types.EventType.KeyRelease]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventKey*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.KeyPress] or [gid.gdk4.types.EventType.KeyRelease]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventKey*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("window"))
      return;

    _windowRef = propval;
    (cast(GdkEventKey*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).time = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gid.gdk3.types.ModifierType state() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GdkEventKey*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  @property void state(gid.gdk3.types.ModifierType propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `keyval` field.
      Returns: the key that was pressed or released. See the
          `gdk/gdkkeysyms.h` header file for a
          complete list of GDK key codes.
  */
  @property uint keyval() nothrow
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
  @property void keyval(uint propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).keyval = propval;
  }

  /**
      Get `length` field.
      Returns: the length of @string.
  */
  @property int length() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = the length of @string.
  */
  @property void length(int propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).length = propval;
  }

  private const(char)* _string_Ref; // Keeps borrowed GC string alive

  /**
      Get `string_` field.
      Returns: a string containing an approximation of the text that
          would result from this keypress. The only correct way to handle text
          input of text is using input methods (see #GtkIMContext), so this
          field is deprecated and should never be used.
          ([gid.gdk4.global.unicodeToKeyval] provides a non-deprecated way of getting
          an approximate translation for a key.) The string is encoded in the
          encoding of the current locale (Note: this for backwards compatibility:
          strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
          In some cases, the translation of the key code will be a single
          NUL byte, in which case looking at @length is necessary to distinguish
          it from the an empty translation.
  */
  @property string string_() nothrow
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
            ([gid.gdk4.global.unicodeToKeyval] provides a non-deprecated way of getting
            an approximate translation for a key.) The string is encoded in the
            encoding of the current locale (Note: this for backwards compatibility:
            strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
            In some cases, the translation of the key code will be a single
            NUL byte, in which case looking at @length is necessary to distinguish
            it from the an empty translation.
  */
  @property void string_(string propval) nothrow
  {
    if (_refuseBorrowedStore("string_"))
      return;

    _string_Ref = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GdkEventKey*)this._cPtr).string_ = cast(char*)_string_Ref;
  }

  /**
      Get `hardwareKeycode` field.
      Returns: the raw code of the key that was pressed or released.
  */
  @property ushort hardwareKeycode() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).hardwareKeycode;
  }

  /**
      Set `hardwareKeycode` field.
      Params:
        propval = the raw code of the key that was pressed or released.
  */
  @property void hardwareKeycode(ushort propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).hardwareKeycode = propval;
  }

  /**
      Get `group` field.
      Returns: the keyboard group.
  */
  @property ubyte group() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the keyboard group.
  */
  @property void group(ubyte propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).group = propval;
  }

  /**
      Get `isModifier` field.
      Returns: a flag that indicates if @hardware_keycode is mapped to a
          modifier. Since 2.10
  */
  @property uint isModifier() nothrow
  {
    return (cast(GdkEventKey*)this._cPtr).isModifier;
  }

  /**
      Set `isModifier` field.
      Params:
        propval = a flag that indicates if @hardware_keycode is mapped to a
            modifier. Since 2.10
  */
  @property void isModifier(uint propval) nothrow
  {
    (cast(GdkEventKey*)this._cPtr).isModifier = propval;
  }
}
