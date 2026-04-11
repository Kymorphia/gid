/// Module for [MnemonicTrigger] class
module gtk.mnemonic_trigger;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_trigger;
import gtk.types;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that triggers when a specific mnemonic is pressed.
    
    Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.
*/
class MnemonicTrigger : gtk.shortcut_trigger.ShortcutTrigger
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
    return cast(void function())gtk_mnemonic_trigger_get_type != &gidSymbolNotFound ? gtk_mnemonic_trigger_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MnemonicTrigger self()
  {
    return this;
  }

  /**
      Get builder for [gtk.mnemonic_trigger.MnemonicTrigger]
      Returns: New builder object
  */
  static MnemonicTriggerGidBuilder builder()
  {
    return new MnemonicTriggerGidBuilder;
  }

  /**
      Get `keyval` property.
      Returns: The key value for the trigger.
  */
  @property uint keyval()
  {
    return getKeyval();
  }

  /**
      Creates a [gtk.shortcut_trigger.ShortcutTrigger] that will trigger whenever the key with
      the given keyval is pressed and mnemonics have been activated.
      
      Mnemonics are activated by calling code when a key event with the right
      modifiers is detected.
  
      Params:
        keyval = The keyval to trigger for
      Returns: A new [gtk.shortcut_trigger.ShortcutTrigger]
  */
  this(uint keyval)
  {
    GtkShortcutTrigger* _cretval;
    _cretval = gtk_mnemonic_trigger_new(keyval);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the keyval that must be pressed to succeed triggering self.
      Returns: the keyval
  */
  uint getKeyval()
  {
    uint _retval;
    _retval = gtk_mnemonic_trigger_get_keyval(cast(GtkMnemonicTrigger*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.mnemonic_trigger.MnemonicTrigger]
class MnemonicTriggerGidBuilderImpl(T) : gtk.shortcut_trigger.ShortcutTriggerGidBuilderImpl!T
{

  /**
      Set `keyval` property.
      Params:
        propval = The key value for the trigger.
      Returns: Builder instance for fluent chaining
  */
  T keyval(uint propval)
  {
    return setProperty("keyval", propval);
  }
}

/// Fluent builder for [gtk.mnemonic_trigger.MnemonicTrigger]
final class MnemonicTriggerGidBuilder : MnemonicTriggerGidBuilderImpl!MnemonicTriggerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MnemonicTrigger build()
  {
    return new MnemonicTrigger(cast(void*)createGObject(MnemonicTrigger._getGType), Yes.Take);
  }
}
