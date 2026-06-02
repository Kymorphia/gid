/// Module for [ActivateAction] class
module gtk.activate_action;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.activate].
*/
class ActivateAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_activate_action_get_type != &gidSymbolNotFound ? gtk_activate_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ActivateAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.activate_action.ActivateAction]
      Returns: New builder object
  */
  static ActivateActionGidBuilder builder() nothrow
  {
    return new ActivateActionGidBuilder;
  }

  /**
      Gets the activate action.
      
      This is an action that calls [gtk.widget.Widget.activate]
      on the given widget upon activation.
      Returns: The activate action
  */
  static gtk.activate_action.ActivateAction get() nothrow
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_activate_action_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.activate_action.ActivateAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.activate_action.ActivateAction]
class ActivateActionGidBuilderImpl(T) : gtk.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.activate_action.ActivateAction]
final class ActivateActionGidBuilder : ActivateActionGidBuilderImpl!ActivateActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ActivateAction build() nothrow
  {
    return new ActivateAction(cast(void*)createGObject(ActivateAction._getGType), No.Take);
  }
}
