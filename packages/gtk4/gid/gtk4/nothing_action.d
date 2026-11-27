/// Module for [NothingAction] class
module gid.gtk4.nothing_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;

/**
    Does nothing.
*/
@gidGir("NothingAction", "NothingActionClass")
class NothingAction : gid.gtk4.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_nothing_action_get_type != &gidSymbolNotFound ? gtk_nothing_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNothingAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override NothingAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.nothing_action.NothingAction]
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
  static gid.gtk4.nothing_action.NothingAction get() nothrow
  {
    GtkShortcutAction* _cretval;
    _cretval = gtk_nothing_action_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.nothing_action.NothingAction)(cast(GtkShortcutAction*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.nothing_action.NothingAction]
class NothingActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.nothing_action.NothingAction]
final class NothingActionGidBuilder : NothingActionGidBuilderImpl!NothingActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NothingAction build() nothrow
  {
    return new NothingAction(cast(void*)createGObject(NothingAction._getGType), Yes.Take);
  }
}
