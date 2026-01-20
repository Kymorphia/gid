/// Module for [KeyEventStruct] class
module atk.key_event_struct;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
    Encapsulates information about a key event.
*/
class KeyEventStruct
{
  AtkKeyEventStruct _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for atk.key_event_struct.KeyEventStruct");

    _cInstance = *cast(AtkKeyEventStruct*)ptr;

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
      Returns: An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  @property int type()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  @property void type(int propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).type = propval;
  }

  /**
      Get `state` field.
      Returns: A bitmask representing the state of the modifier keys immediately after the event takes place.
        The meaning of the bits is currently defined to match the bitmask used by GDK in
        GdkEventType.state, see
        http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html#GdkEventKey
  */
  @property uint state()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = A bitmask representing the state of the modifier keys immediately after the event takes place.
          The meaning of the bits is currently defined to match the bitmask used by GDK in
          GdkEventType.state, see
          http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html#GdkEventKey
  */
  @property void state(uint propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).state = propval;
  }

  /**
      Get `keyval` field.
      Returns: A guint representing a keysym value corresponding to those used by GDK and X11: see
        /usr/X11/include/keysymdef.h.
  */
  @property uint keyval()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).keyval;
  }

  /**
      Set `keyval` field.
      Params:
        propval = A guint representing a keysym value corresponding to those used by GDK and X11: see
          /usr/X11/include/keysymdef.h.
  */
  @property void keyval(uint propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).keyval = propval;
  }

  /**
      Get `length` field.
      Returns: The length of member #string.
  */
  @property int length()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = The length of member #string.
  */
  @property void length(int propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).length = propval;
  }

  /**
      Get `string_` field.
      Returns: A string containing one of the following: either a string approximating the text that would
        result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress.
        Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0",
        "semicolon", "aacute".  Keypad keys have the prefix "KP".
  */
  @property string string_()
  {
    return cToD!(string)(cast(void*)(cast(AtkKeyEventStruct*)this._cPtr).string_);
  }

  /**
      Set `string_` field.
      Params:
        propval = A string containing one of the following: either a string approximating the text that would
          result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress.
          Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0",
          "semicolon", "aacute".  Keypad keys have the prefix "KP".
  */
  @property void string_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkKeyEventStruct*)this._cPtr).string_);
    dToC(propval, cast(void*)&(cast(AtkKeyEventStruct*)this._cPtr).string_);
  }

  /**
      Get `keycode` field.
      Returns: The raw hardware code that generated the key event.  This field is raraly useful.
  */
  @property ushort keycode()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).keycode;
  }

  /**
      Set `keycode` field.
      Params:
        propval = The raw hardware code that generated the key event.  This field is raraly useful.
  */
  @property void keycode(ushort propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).keycode = propval;
  }

  /**
      Get `timestamp` field.
      Returns: A timestamp in milliseconds indicating when the event occurred.
        These timestamps are relative to a starting point which should be considered arbitrary,
        and only used to compare the dispatch times of events to one another.
  */
  @property uint timestamp()
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = A timestamp in milliseconds indicating when the event occurred.
          These timestamps are relative to a starting point which should be considered arbitrary,
          and only used to compare the dispatch times of events to one another.
  */
  @property void timestamp(uint propval)
  {
    (cast(AtkKeyEventStruct*)this._cPtr).timestamp = propval;
  }
}
