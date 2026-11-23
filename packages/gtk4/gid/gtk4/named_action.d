/// Module for [NamedAction] class
module gid.gtk4.named_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;

/**
    Activates a named action.
    
    See [gid.gtk4.widget_class.WidgetClass.installAction] and
    [gid.gtk4.widget.Widget.insertActionGroup] for ways
    to associate named actions with widgets.
*/
class NamedAction : gid.gtk4.shortcut_action.ShortcutAction
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_named_action_get_type != &gidSymbolNotFound ? gtk_named_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNamedAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override NamedAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.named_action.NamedAction]
      Returns: New builder object
  */
  static NamedActionGidBuilder builder() nothrow
  {
    return new NamedActionGidBuilder;
  }

  /**
      Get `actionName` property.
      Returns: The name of the action to activate.
  */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /**
      Creates an action that when activated, activates
      the named action on the widget.
      
      It also passes the given arguments to it.
      
      See [gid.gtk4.widget.Widget.insertActionGroup] for
      how to add actions to widgets.
  
      Params:
        name = the detailed name of the action
      Returns: a new [gid.gtk4.shortcut_action.ShortcutAction]
  */
  this(string name) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkShortcutAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_named_action_new(_name);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the name of the action that will be activated.
      Returns: the name of the action to activate
  */
  string getActionName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_named_action_get_action_name(cast(GtkNamedAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.named_action.NamedAction]
class NamedActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action to activate.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }
}

/// Fluent builder for [gid.gtk4.named_action.NamedAction]
final class NamedActionGidBuilder : NamedActionGidBuilderImpl!NamedActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NamedAction build() nothrow
  {
    return new NamedAction(cast(void*)createGObject(NamedAction._getGType), Yes.Take);
  }
}
