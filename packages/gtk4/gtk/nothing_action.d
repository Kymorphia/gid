/// Module for [NothingAction] class
module gtk.nothing_action;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that does nothing.
*/
class NothingAction : gtk.shortcut_action.ShortcutAction
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_nothing_action_get_type != &gidSymbolNotFound ? gtk_nothing_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NothingAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.nothing_action.NothingAction]
      Returns: New builder object
  */
  static NothingActionGidBuilder builder() nothrow
  {
    return new NothingActionGidBuilder;
  }

  /**
      Gets the nothing action.
      
      This is an action that does nothing and where
      activating it always fails.
      Returns: The nothing action
  */
  static gtk.nothing_action.NothingAction get() nothrow
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_nothing_action_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.nothing_action.NothingAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.nothing_action.NothingAction]
class NothingActionGidBuilderImpl(T) : gtk.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.nothing_action.NothingAction]
final class NothingActionGidBuilder : NothingActionGidBuilderImpl!NothingActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NothingAction build() nothrow
  {
    return new NothingAction(cast(void*)createGObject(NothingAction._getGType), No.Take);
  }
}
