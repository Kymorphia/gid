/// Module for [KeyEvent] class
module gid.gdk4.key_event;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.types;

/**
    An event related to a key-based device.
*/
class KeyEvent : gid.gdk4.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_key_event_get_type != &gidSymbolNotFound ? gdk_key_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts the consumed modifiers from a key event.
      Returns: the consumed modifiers or event
  */
  gid.gdk4.types.ModifierType getConsumedModifiers() nothrow
  {
    GdkModifierType _cretval;
    _cretval = gdk_key_event_get_consumed_modifiers(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.ModifierType _retval = cast(gid.gdk4.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Extracts the keycode from a key event.
      Returns: the keycode of event
  */
  uint getKeycode() nothrow
  {
    uint _retval;
    _retval = gdk_key_event_get_keycode(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the keyval from a key event.
      Returns: the keyval of event
  */
  uint getKeyval() nothrow
  {
    uint _retval;
    _retval = gdk_key_event_get_keyval(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the layout from a key event.
      Returns: the layout of event
  */
  uint getLayout() nothrow
  {
    uint _retval;
    _retval = gdk_key_event_get_layout(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the shift level from a key event.
      Returns: the shift level of event
  */
  uint getLevel() nothrow
  {
    uint _retval;
    _retval = gdk_key_event_get_level(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Gets a keyval and modifier combination that will match
      the event.
      
      See [gid.gdk4.key_event.KeyEvent.matches].
  
      Params:
        keyval = return location for a keyval
        modifiers = return location for modifiers
      Returns: true on success
  */
  bool getMatch(out uint keyval, out gid.gdk4.types.ModifierType modifiers) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_key_event_get_match(cast(GdkEvent*)this._cPtr, cast(uint*)&keyval, &modifiers);
    return _retval;
  }

  /**
      Extracts whether the key event is for a modifier key.
      Returns: true if the event is for a modifier key
  */
  bool isModifier() nothrow
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
      Returns: a [gid.gdk4.types.KeyMatch] value describing whether event matches
  */
  gid.gdk4.types.KeyMatch matches(uint keyval, gid.gdk4.types.ModifierType modifiers) nothrow
  {
    GdkKeyMatch _cretval;
    _cretval = gdk_key_event_matches(cast(GdkEvent*)this._cPtr, keyval, modifiers);
    gid.gdk4.types.KeyMatch _retval = cast(gid.gdk4.types.KeyMatch)_cretval;
    return _retval;
  }
}
