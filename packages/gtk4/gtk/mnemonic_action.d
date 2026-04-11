/// Module for [MnemonicAction] class
module gtk.mnemonic_action;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.mnemonicActivate].
*/
class MnemonicAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_mnemonic_action_get_type != &gidSymbolNotFound ? gtk_mnemonic_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MnemonicAction self()
  {
    return this;
  }

  /**
      Get builder for [gtk.mnemonic_action.MnemonicAction]
      Returns: New builder object
  */
  static MnemonicActionGidBuilder builder()
  {
    return new MnemonicActionGidBuilder;
  }

  /**
      Gets the mnemonic action.
      
      This is an action that calls [gtk.widget.Widget.mnemonicActivate]
      on the given widget upon activation.
      Returns: The mnemonic action
  */
  static gtk.mnemonic_action.MnemonicAction get()
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_mnemonic_action_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.mnemonic_action.MnemonicAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.mnemonic_action.MnemonicAction]
class MnemonicActionGidBuilderImpl(T) : gtk.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.mnemonic_action.MnemonicAction]
final class MnemonicActionGidBuilder : MnemonicActionGidBuilderImpl!MnemonicActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MnemonicAction build()
  {
    return new MnemonicAction(cast(void*)createGObject(MnemonicAction._getGType), No.Take);
  }
}
