/// Module for [MnemonicAction] class
module gid.gtk4.mnemonic_action;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;

/**
    Activates a widget with a mnemonic.
    
    This means that [gid.gtk4.widget.Widget.mnemonicActivate] is called.
*/
class MnemonicAction : gid.gtk4.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_mnemonic_action_get_type != &gidSymbolNotFound ? gtk_mnemonic_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMnemonicAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override MnemonicAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.mnemonic_action.MnemonicAction]
      Returns: New builder object
  */
  static MnemonicActionGidBuilder builder() nothrow
  {
    return new MnemonicActionGidBuilder;
  }

  /**
      Gets the mnemonic action.
      
      This is an action that calls [gid.gtk4.widget.Widget.mnemonicActivate]
      on the given widget upon activation.
      Returns: The mnemonic action
  */
  static gid.gtk4.mnemonic_action.MnemonicAction get() nothrow
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_mnemonic_action_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.mnemonic_action.MnemonicAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.mnemonic_action.MnemonicAction]
class MnemonicActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.mnemonic_action.MnemonicAction]
final class MnemonicActionGidBuilder : MnemonicActionGidBuilderImpl!MnemonicActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MnemonicAction build() nothrow
  {
    return new MnemonicAction(cast(void*)createGObject(MnemonicAction._getGType), Yes.Take);
  }
}
