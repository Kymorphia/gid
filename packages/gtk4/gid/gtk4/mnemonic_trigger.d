/// Module for [MnemonicTrigger] class
module gid.gtk4.mnemonic_trigger;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_trigger;
import gid.gtk4.types;

/**
    Triggers when a specific mnemonic is pressed.
    
    Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.
*/
class MnemonicTrigger : gid.gtk4.shortcut_trigger.ShortcutTrigger
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
    return cast(void function())gtk_mnemonic_trigger_get_type != &gidSymbolNotFound ? gtk_mnemonic_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMnemonicTrigger";
  }

  /** Returns `this`, for use in `with` statements. */
  override MnemonicTrigger self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.mnemonic_trigger.MnemonicTrigger]
      Returns: New builder object
  */
  static MnemonicTriggerGidBuilder builder() nothrow
  {
    return new MnemonicTriggerGidBuilder;
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
      Creates a [gid.gtk4.shortcut_trigger.ShortcutTrigger] that will trigger whenever the key with
      the given keyval is pressed and mnemonics have been activated.
      
      Mnemonics are activated by calling code when a key event with the right
      modifiers is detected.
  
      Params:
        keyval = The keyval to trigger for
      Returns: A new [gid.gtk4.shortcut_trigger.ShortcutTrigger]
  */
  this(uint keyval) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkShortcutTrigger* _cretval;
      _cretval = gtk_mnemonic_trigger_new(keyval);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the keyval that must be pressed to succeed triggering self.
      Returns: the keyval
  */
  uint getKeyval() nothrow
  {
    uint _retval;
    _retval = gtk_mnemonic_trigger_get_keyval(cast(GtkMnemonicTrigger*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.mnemonic_trigger.MnemonicTrigger]
class MnemonicTriggerGidBuilderImpl(T) : gid.gtk4.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
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
}

/// Fluent builder for [gid.gtk4.mnemonic_trigger.MnemonicTrigger]
final class MnemonicTriggerGidBuilder : MnemonicTriggerGidBuilderImpl!MnemonicTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MnemonicTrigger build() nothrow
  {
    return new MnemonicTrigger(cast(void*)createGObject(MnemonicTrigger._getGType), Yes.Take);
  }
}
