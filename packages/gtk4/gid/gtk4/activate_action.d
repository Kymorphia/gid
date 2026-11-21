/// Module for [ActivateAction] class
module gid.gtk4.activate_action;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;

/**
    Activates a widget.
    
    Widgets are activated by calling [gid.gtk4.widget.Widget.activate].
*/
class ActivateAction : gid.gtk4.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_activate_action_get_type != &gidSymbolNotFound ? gtk_activate_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkActivateAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override ActivateAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.activate_action.ActivateAction]
      Returns: New builder object
  */
  static ActivateActionGidBuilder builder() nothrow
  {
    return new ActivateActionGidBuilder;
  }

  /**
      Gets the activate action.
      
      This is an action that calls [gid.gtk4.widget.Widget.activate]
      on the given widget upon activation.
      Returns: The activate action
  */
  static gid.gtk4.activate_action.ActivateAction get() nothrow
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_activate_action_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.activate_action.ActivateAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.activate_action.ActivateAction]
class ActivateActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.activate_action.ActivateAction]
final class ActivateActionGidBuilder : ActivateActionGidBuilderImpl!ActivateActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ActivateAction build() nothrow
  {
    return new ActivateAction(cast(void*)createGObject(ActivateAction._getGType), Yes.Take);
  }
}
