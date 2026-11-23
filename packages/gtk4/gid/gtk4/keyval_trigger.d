/// Module for [KeyvalTrigger] class
module gid.gtk4.keyval_trigger;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_trigger;
import gid.gtk4.types;

/**
    Triggers when a specific keyval and modifiers are pressed.
*/
class KeyvalTrigger : gid.gtk4.shortcut_trigger.ShortcutTrigger
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_keyval_trigger_get_type != &gidSymbolNotFound ? gtk_keyval_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkKeyvalTrigger";
  }

  /** Returns `this`, for use in `with` statements. */
  override KeyvalTrigger self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.keyval_trigger.KeyvalTrigger]
      Returns: New builder object
  */
  static KeyvalTriggerGidBuilder builder() nothrow
  {
    return new KeyvalTriggerGidBuilder;
  }

  /**
      Get `keyval` property.
      Returns: The key value for the trigger.
  */
  @property uint keyval() nothrow
  {
    return getKeyval();
  }

  /**
      Get `modifiers` property.
      Returns: The key modifiers for the trigger.
  */
  @property gid.gdk4.types.ModifierType modifiers() nothrow
  {
    return getModifiers();
  }

  /**
      Creates a [gid.gtk4.shortcut_trigger.ShortcutTrigger] that will trigger whenever
      the key with the given keyval and modifiers is pressed.
  
      Params:
        keyval = The keyval to trigger for
        modifiers = the modifiers that need to be present
      Returns: A new [gid.gtk4.shortcut_trigger.ShortcutTrigger]
  */
  this(uint keyval, gid.gdk4.types.ModifierType modifiers) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkShortcutTrigger* _cretval;
      _cretval = gtk_keyval_trigger_new(keyval, modifiers);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the keyval that must be pressed to succeed
      triggering self.
      Returns: the keyval
  */
  uint getKeyval() nothrow
  {
    uint _retval;
    _retval = gtk_keyval_trigger_get_keyval(cast(GtkKeyvalTrigger*)this._cPtr);
    return _retval;
  }

  /**
      Gets the modifiers that must be present to succeed
      triggering self.
      Returns: the modifiers
  */
  gid.gdk4.types.ModifierType getModifiers() nothrow
  {
    GdkModifierType _cretval;
    _cretval = gtk_keyval_trigger_get_modifiers(cast(GtkKeyvalTrigger*)this._cPtr);
    gid.gdk4.types.ModifierType _retval = cast(gid.gdk4.types.ModifierType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.keyval_trigger.KeyvalTrigger]
class KeyvalTriggerGidBuilderImpl(T) : gid.gtk4.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
{

  /**
      Set `keyval` property.
      Params:
        propval = The key value for the trigger.
      Returns: Builder instance for fluent chaining
  */
  T keyval(uint propval) nothrow
  {
    return setProperty("keyval", propval);
  }

  /**
      Set `modifiers` property.
      Params:
        propval = The key modifiers for the trigger.
      Returns: Builder instance for fluent chaining
  */
  T modifiers(gid.gdk4.types.ModifierType propval) nothrow
  {
    return setProperty("modifiers", propval);
  }
}

/// Fluent builder for [gid.gtk4.keyval_trigger.KeyvalTrigger]
final class KeyvalTriggerGidBuilder : KeyvalTriggerGidBuilderImpl!KeyvalTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  KeyvalTrigger build() nothrow
  {
    return new KeyvalTrigger(cast(void*)createGObject(KeyvalTrigger._getGType), Yes.Take);
  }
}
