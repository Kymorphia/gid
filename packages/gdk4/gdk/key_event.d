/// Module for [KeyEvent] class
module gdk.key_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a key-based device.
*/
class KeyEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.key_event.KeyEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts the consumed modifiers from a key event.
      Returns: the consumed modifiers or event
  */
  gdk.types.ModifierType getConsumedModifiers()
  {
    GdkModifierType _cretval;
    _cretval = gdk_key_event_get_consumed_modifiers(cast(GdkEvent*)this._cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Extracts the keycode from a key event.
      Returns: the keycode of event
  */
  uint getKeycode()
  {
    uint _retval;
    _retval = gdk_key_event_get_keycode(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the keyval from a key event.
      Returns: the keyval of event
  */
  uint getKeyval()
  {
    uint _retval;
    _retval = gdk_key_event_get_keyval(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the layout from a key event.
      Returns: the layout of event
  */
  uint getLayout()
  {
    uint _retval;
    _retval = gdk_key_event_get_layout(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the shift level from a key event.
      Returns: the shift level of event
  */
  uint getLevel()
  {
    uint _retval;
    _retval = gdk_key_event_get_level(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Gets a keyval and modifier combination that will match
      the event.
      
      See [gdk.key_event.KeyEvent.matches].
  
      Params:
        keyval = return location for a keyval
        modifiers = return location for modifiers
      Returns: true on success
  */
  bool getMatch(out uint keyval, out gdk.types.ModifierType modifiers)
  {
    bool _retval;
    _retval = cast(bool)gdk_key_event_get_match(cast(GdkEvent*)this._cPtr, cast(uint*)&keyval, &modifiers);
    return _retval;
  }

  /**
      Extracts whether the key event is for a modifier key.
      Returns: true if the event is for a modifier key
  */
  bool isModifier()
  {
    bool _retval;
    _retval = cast(bool)gdk_key_event_is_modifier(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Matches a key event against a keyval and modifiers.
      
      This is typically used to trigger keyboard shortcuts such as Ctrl-C.
      
      Partial matches are possible where the combination matches
      if the currently active group is ignored.
      
      Note that we ignore Caps Lock for matching.
  
      Params:
        keyval = the keyval to match
        modifiers = the modifiers to match
      Returns: a [gdk.types.KeyMatch] value describing whether event matches
  */
  gdk.types.KeyMatch matches(uint keyval, gdk.types.ModifierType modifiers)
  {
    GdkKeyMatch _cretval;
    _cretval = gdk_key_event_matches(cast(GdkEvent*)this._cPtr, keyval, modifiers);
    gdk.types.KeyMatch _retval = cast(gdk.types.KeyMatch)_cretval;
    return _retval;
  }
}
