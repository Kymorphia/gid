/// Module for [KeyEventStruct] class
module atk.key_event_struct;

public import gid.basictypes;
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

  /**
      Create a `key_event_struct.KeyEventStruct` wrap type.
      Params:
        type = An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
        state = A bitmask representing the state of the modifier keys immediately after the event takes place.
          The meaning of the bits is currently defined to match the bitmask used by GDK in
          GdkEventType.state, see
          http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html#GdkEventKey
        keyval = A guint representing a keysym value corresponding to those used by GDK and X11: see
          /usr/X11/include/keysymdef.h.
        length = The length of member #string.
        string_ = A string containing one of the following: either a string approximating the text that would
          result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress.
          Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0",
          "semicolon", "aacute".  Keypad keys have the prefix "KP".
        keycode = The raw hardware code that generated the key event.  This field is raraly useful.
        timestamp = A timestamp in milliseconds indicating when the event occurred.
          These timestamps are relative to a starting point which should be considered arbitrary,
          and only used to compare the dispatch times of events to one another.
  */
  this(int type = int.init, uint state = uint.init, uint keyval = uint.init, int length = int.init, string string_ = string.init, ushort keycode = ushort.init, uint timestamp = uint.init) nothrow
  {
    this.type = type;
    this.state = state;
    this.keyval = keyval;
    this.length = length;
    this.string_ = string_;
    this.keycode = keycode;
    this.timestamp = timestamp;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(AtkKeyEventStruct*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `type` field.
      Returns: An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  @property int type() nothrow
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  @property void type(int propval) nothrow
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
  @property uint state() nothrow
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
  @property void state(uint propval) nothrow
  {
    (cast(AtkKeyEventStruct*)this._cPtr).state = propval;
  }

  /**
      Get `keyval` field.
      Returns: A guint representing a keysym value corresponding to those used by GDK and X11: see
        /usr/X11/include/keysymdef.h.
  */
  @property uint keyval() nothrow
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).keyval;
  }

  /**
      Set `keyval` field.
      Params:
        propval = A guint representing a keysym value corresponding to those used by GDK and X11: see
          /usr/X11/include/keysymdef.h.
  */
  @property void keyval(uint propval) nothrow
  {
    (cast(AtkKeyEventStruct*)this._cPtr).keyval = propval;
  }

  /**
      Get `length` field.
      Returns: The length of member #string.
  */
  @property int length() nothrow
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = The length of member #string.
  */
  @property void length(int propval) nothrow
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
  @property string string_() nothrow
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
  @property void string_(string propval) nothrow
  {
    (cast(AtkKeyEventStruct*)this._cPtr).string_ = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `keycode` field.
      Returns: The raw hardware code that generated the key event.  This field is raraly useful.
  */
  @property ushort keycode() nothrow
  {
    return (cast(AtkKeyEventStruct*)this._cPtr).keycode;
  }

  /**
      Set `keycode` field.
      Params:
        propval = The raw hardware code that generated the key event.  This field is raraly useful.
  */
  @property void keycode(ushort propval) nothrow
  {
    (cast(AtkKeyEventStruct*)this._cPtr).keycode = propval;
  }

  /**
      Get `timestamp` field.
      Returns: A timestamp in milliseconds indicating when the event occurred.
        These timestamps are relative to a starting point which should be considered arbitrary,
        and only used to compare the dispatch times of events to one another.
  */
  @property uint timestamp() nothrow
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
  @property void timestamp(uint propval) nothrow
  {
    (cast(AtkKeyEventStruct*)this._cPtr).timestamp = propval;
  }
}
