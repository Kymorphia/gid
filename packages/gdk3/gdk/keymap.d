/// Module for [Keymap] class
module gdk.keymap;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import pango.types;

/**
    A #GdkKeymap defines the translation from keyboard state
    (including a hardware key, a modifier mask, and active keyboard group)
    to a keyval. This translation has two phases. The first phase is
    to determine the effective keyboard group and level for the keyboard
    state; the second phase is to look up the keycode/group/level triplet
    in the keymap and see what keyval it corresponds to.
*/
class Keymap : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_keymap_get_type != &gidSymbolNotFound ? gdk_keymap_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Keymap self()
  {
    return this;
  }

  /**
      Returns the #GdkKeymap attached to the default display.
      Returns: the #GdkKeymap attached to the default display.
  
      Deprecated: Use [gdk.keymap.Keymap.getForDisplay] instead
  */
  static gdk.keymap.Keymap getDefault()
  {
    GdkKeymap* _cretval;
    _cretval = gdk_keymap_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.keymap.Keymap)(cast(GdkKeymap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkKeymap attached to display.
  
      Params:
        display = the #GdkDisplay.
      Returns: the #GdkKeymap attached to display.
  */
  static gdk.keymap.Keymap getForDisplay(gdk.display.Display display)
  {
    GdkKeymap* _cretval;
    _cretval = gdk_keymap_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.keymap.Keymap)(cast(GdkKeymap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Maps the non-virtual modifiers (i.e Mod2, Mod3, ...) which are set
      in state to the virtual modifiers (i.e. Super, Hyper and Meta) and
      set the corresponding bits in state.
      
      GDK already does this before delivering key events, but for
      compatibility reasons, it only sets the first virtual modifier
      it finds, whereas this function sets all matching virtual modifiers.
      
      This function is useful when matching key events against
      accelerators.
  
      Params:
        state = pointer to the modifier mask to change
  */
  void addVirtualModifiers(ref gdk.types.ModifierType state)
  {
    gdk_keymap_add_virtual_modifiers(cast(GdkKeymap*)this._cPtr, &state);
  }

  /**
      Returns whether the Caps Lock modifer is locked.
      Returns: true if Caps Lock is on
  */
  bool getCapsLockState()
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_get_caps_lock_state(cast(GdkKeymap*)this._cPtr);
    return _retval;
  }

  /**
      Returns the direction of effective layout of the keymap.
      Returns: [pango.types.Direction.Ltr] or [pango.types.Direction.Rtl]
          if it can determine the direction. [pango.types.Direction.Neutral]
          otherwise.
  */
  pango.types.Direction getDirection()
  {
    PangoDirection _cretval;
    _cretval = gdk_keymap_get_direction(cast(GdkKeymap*)this._cPtr);
    pango.types.Direction _retval = cast(pango.types.Direction)_cretval;
    return _retval;
  }

  /**
      Returns the keyvals bound to hardware_keycode.
      The Nth #GdkKeymapKey in keys is bound to the Nth
      keyval in keyvals. Free the returned arrays with [glib.global.gfree].
      When a keycode is pressed by the user, the keyval from
      this list of entries is selected by considering the effective
      keyboard group and level. See [gdk.keymap.Keymap.translateKeyboardState].
  
      Params:
        hardwareKeycode = a keycode
        keys = return
              location for array of #GdkKeymapKey, or null
        keyvals = return
              location for array of keyvals, or null
      Returns: true if there were any entries
  */
  bool getEntriesForKeycode(uint hardwareKeycode, out gdk.types.KeymapKey[] keys, out uint[] keyvals)
  {
    bool _retval;
    int _nEntries;
    GdkKeymapKey* _keys;
    uint* _keyvals;
    _retval = cast(bool)gdk_keymap_get_entries_for_keycode(cast(GdkKeymap*)this._cPtr, hardwareKeycode, &_keys, &_keyvals, &_nEntries);
    keys.length = _nEntries;
    keys[0 .. $] = (cast(gdk.types.KeymapKey*)_keys)[0 .. _nEntries];
    gFree(cast(void*)_keys);
    keyvals.length = _nEntries;
    keyvals[0 .. $] = (cast(uint*)_keyvals)[0 .. _nEntries];
    gFree(cast(void*)_keyvals);
    return _retval;
  }

  /**
      Obtains a list of keycode/group/level combinations that will
      generate keyval. Groups and levels are two kinds of keyboard mode;
      in general, the level determines whether the top or bottom symbol
      on a key is used, and the group determines whether the left or
      right symbol is used. On US keyboards, the shift key changes the
      keyboard level, and there are no groups. A group switch key might
      convert a keyboard between Hebrew to English modes, for example.
      #GdkEventKey contains a `group` field that indicates the active
      keyboard group. The level is computed from the modifier mask.
      The returned array should be freed
      with [glib.global.gfree].
  
      Params:
        keyval = a keyval, such as `GDK_KEY_a`, `GDK_KEY_Up`, `GDK_KEY_Return`, etc.
        keys = return location
              for an array of #GdkKeymapKey
      Returns: true if keys were found and returned
  */
  bool getEntriesForKeyval(uint keyval, out gdk.types.KeymapKey[] keys)
  {
    bool _retval;
    int _nKeys;
    GdkKeymapKey* _keys;
    _retval = cast(bool)gdk_keymap_get_entries_for_keyval(cast(GdkKeymap*)this._cPtr, keyval, &_keys, &_nKeys);
    keys.length = _nKeys;
    keys[0 .. $] = (cast(gdk.types.KeymapKey*)_keys)[0 .. _nKeys];
    gFree(cast(void*)_keys);
    return _retval;
  }

  /**
      Returns the modifier mask the keymap’s windowing system backend
      uses for a particular purpose.
      
      Note that this function always returns real hardware modifiers, not
      virtual ones (e.g. it will return #GDK_MOD1_MASK rather than
      #GDK_META_MASK if the backend maps MOD1 to META), so there are use
      cases where the return value of this function has to be transformed
      by [gdk.keymap.Keymap.addVirtualModifiers] in order to contain the
      expected result.
  
      Params:
        intent = the use case for the modifier mask
      Returns: the modifier mask used for intent.
  */
  gdk.types.ModifierType getModifierMask(gdk.types.ModifierIntent intent)
  {
    GdkModifierType _cretval;
    _cretval = gdk_keymap_get_modifier_mask(cast(GdkKeymap*)this._cPtr, intent);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns the current modifier state.
      Returns: the current modifier state.
  */
  uint getModifierState()
  {
    uint _retval;
    _retval = gdk_keymap_get_modifier_state(cast(GdkKeymap*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the Num Lock modifer is locked.
      Returns: true if Num Lock is on
  */
  bool getNumLockState()
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_get_num_lock_state(cast(GdkKeymap*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the Scroll Lock modifer is locked.
      Returns: true if Scroll Lock is on
  */
  bool getScrollLockState()
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_get_scroll_lock_state(cast(GdkKeymap*)this._cPtr);
    return _retval;
  }

  /**
      Determines if keyboard layouts for both right-to-left and left-to-right
      languages are in use.
      Returns: true if there are layouts in both directions, false otherwise
  */
  bool haveBidiLayouts()
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_have_bidi_layouts(cast(GdkKeymap*)this._cPtr);
    return _retval;
  }

  /**
      Looks up the keyval mapped to a keycode/group/level triplet.
      If no keyval is bound to key, returns 0. For normal user input,
      you want to use [gdk.keymap.Keymap.translateKeyboardState] instead of
      this function, since the effective group/level may not be
      the same as the current keyboard state.
  
      Params:
        key = a #GdkKeymapKey with keycode, group, and level initialized
      Returns: a keyval, or 0 if none was mapped to the given key
  */
  uint lookupKey(gdk.types.KeymapKey key)
  {
    uint _retval;
    _retval = gdk_keymap_lookup_key(cast(GdkKeymap*)this._cPtr, &key);
    return _retval;
  }

  /**
      Maps the virtual modifiers (i.e. Super, Hyper and Meta) which
      are set in state to their non-virtual counterparts (i.e. Mod2,
      Mod3,...) and set the corresponding bits in state.
      
      This function is useful when matching key events against
      accelerators.
  
      Params:
        state = pointer to the modifier state to map
      Returns: false if two virtual modifiers were mapped to the
            same non-virtual modifier. Note that false is also returned
            if a virtual modifier is mapped to a non-virtual modifier that
            was already set in state.
  */
  bool mapVirtualModifiers(ref gdk.types.ModifierType state)
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_map_virtual_modifiers(cast(GdkKeymap*)this._cPtr, &state);
    return _retval;
  }

  /**
      Translates the contents of a #GdkEventKey into a keyval, effective
      group, and level. Modifiers that affected the translation and
      are thus unavailable for application use are returned in
      consumed_modifiers.
      See [Groups][key-group-explanation] for an explanation of
      groups and levels. The effective_group is the group that was
      actually used for the translation; some keys such as Enter are not
      affected by the active keyboard group. The level is derived from
      state. For convenience, #GdkEventKey already contains the translated
      keyval, so this function isn’t as useful as you might think.
      
      consumed_modifiers gives modifiers that should be masked outfrom state
      when comparing this key press to a hot key. For instance, on a US keyboard,
      the `plus` symbol is shifted, so when comparing a key press to a
      `<Control>plus` accelerator `<Shift>` should be masked out.
      
      ```c
      // We want to ignore irrelevant modifiers like ScrollLock
      #define ALL_ACCELS_MASK (GDK_CONTROL_MASK | GDK_SHIFT_MASK | GDK_MOD1_MASK)
      gdk_keymap_translate_keyboard_state (keymap, event->hardware_keycode,
                                           event->state, event->group,
                                           &keyval, NULL, NULL, &consumed);
      if (keyval == GDK_PLUS &&
          (event->state & ~consumed & ALL_ACCELS_MASK) == GDK_CONTROL_MASK)
        // Control was pressed
      ```
      
      An older interpretation consumed_modifiers was that it contained
      all modifiers that might affect the translation of the key;
      this allowed accelerators to be stored with irrelevant consumed
      modifiers, by doing:
      ```c
      // XXX Don’t do this XXX
      if (keyval == accel_keyval &&
          (event->state & ~consumed & ALL_ACCELS_MASK) == (accel_mods & ~consumed))
        // Accelerator was pressed
      ```
      
      However, this did not work if multi-modifier combinations were
      used in the keymap, since, for instance, `<Control>` would be
      masked out even if only `<Control><Alt>` was used in the keymap.
      To support this usage as well as well as possible, all single
      modifier combinations that could affect the key for any combination
      of modifiers will be returned in consumed_modifiers; multi-modifier
      combinations are returned only when actually found in state. When
      you store accelerators, you should always store them with consumed
      modifiers removed. Store `<Control>plus`, not `<Control><Shift>plus`,
  
      Params:
        hardwareKeycode = a keycode
        state = a modifier state
        group = active keyboard group
        keyval = return location for keyval, or null
        effectiveGroup = return location for effective
              group, or null
        level = return location for level, or null
        consumedModifiers = return location for modifiers
              that were used to determine the group or level, or null
      Returns: true if there was a keyval bound to the keycode/state/group
  */
  bool translateKeyboardState(uint hardwareKeycode, gdk.types.ModifierType state, int group, out uint keyval, out int effectiveGroup, out int level, out gdk.types.ModifierType consumedModifiers)
  {
    bool _retval;
    _retval = cast(bool)gdk_keymap_translate_keyboard_state(cast(GdkKeymap*)this._cPtr, hardwareKeycode, state, group, cast(uint*)&keyval, cast(int*)&effectiveGroup, cast(int*)&level, &consumedModifiers);
    return _retval;
  }

  /**
      Connect to `DirectionChanged` signal.
  
      The ::direction-changed signal gets emitted when the direction of
      the keymap changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.keymap.Keymap keymap))
  
          `keymap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDirectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.keymap.Keymap)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("direction-changed", closure, after);
  }

  /**
      Connect to `KeysChanged` signal.
  
      The ::keys-changed signal is emitted when the mapping represented by
      keymap changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.keymap.Keymap keymap))
  
          `keymap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeysChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.keymap.Keymap)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keys-changed", closure, after);
  }

  /**
      Connect to `StateChanged` signal.
  
      The ::state-changed signal is emitted when the state of the
      keyboard changes, e.g when Caps Lock is turned on or off.
      See [gdk.keymap.Keymap.getCapsLockState].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.keymap.Keymap keymap))
  
          `keymap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStateChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.keymap.Keymap)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-changed", closure, after);
  }
}
