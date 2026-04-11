/// Module for [NamedAction] class
module gtk.named_action;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;

/**
    A [gtk.shortcut_action.ShortcutAction] that activates an action by name.
*/
class NamedAction : gtk.shortcut_action.ShortcutAction
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
    return cast(void function())gtk_named_action_get_type != &gidSymbolNotFound ? gtk_named_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NamedAction self()
  {
    return this;
  }

  /**
      Get builder for [gtk.named_action.NamedAction]
      Returns: New builder object
  */
  static NamedActionGidBuilder builder()
  {
    return new NamedActionGidBuilder;
  }

  /**
      Get `actionName` property.
      Returns: The name of the action to activate.
  */
  @property string actionName()
  {
    return getActionName();
  }

  /**
      Creates an action that when activated, activates
      the named action on the widget.
      
      It also passes the given arguments to it.
      
      See [gtk.widget.Widget.insertActionGroup] for
      how to add actions to widgets.
  
      Params:
        name = the detailed name of the action
      Returns: a new [gtk.shortcut_action.ShortcutAction]
  */
  this(string name)
  {
    GtkShortcutAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_named_action_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the name of the action that will be activated.
      Returns: the name of the action to activate
  */
  string getActionName()
  {
    const(char)* _cretval;
    _cretval = gtk_named_action_get_action_name(cast(GtkNamedAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.named_action.NamedAction]
class NamedActionGidBuilderImpl(T) : gtk.shortcut_action.ShortcutActionGidBuilderImpl!T
{

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action to activate.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval)
  {
    return setProperty("action-name", propval);
  }
}

/// Fluent builder for [gtk.named_action.NamedAction]
final class NamedActionGidBuilder : NamedActionGidBuilderImpl!NamedActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NamedAction build()
  {
    return new NamedAction(cast(void*)createGObject(NamedAction._getGType), Yes.Take);
  }
}
