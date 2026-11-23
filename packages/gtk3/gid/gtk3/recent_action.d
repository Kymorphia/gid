/// Module for [RecentAction] class
module gid.gtk3.recent_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.action;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.recent_chooser;
import gid.gtk3.recent_chooser_mixin;
import gid.gtk3.recent_manager;
import gid.gtk3.types;

/**
    A #GtkRecentAction represents a list of recently used files, which
    can be shown by widgets such as #GtkRecentChooserDialog or
    #GtkRecentChooserMenu.
    
    To construct a submenu showing recently used files, use a #GtkRecentAction
    as the action for a `<menuitem>`. To construct a menu toolbutton showing
    the recently used files in the popup menu, use a #GtkRecentAction as the
    action for a `<toolitem>` element.
*/
class RecentAction : gid.gtk3.action.Action, gid.gtk3.recent_chooser.RecentChooser
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
    return cast(void function())gtk_recent_action_get_type != &gidSymbolNotFound ? gtk_recent_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRecentAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.recent_action.RecentAction]
      Returns: New builder object
  */
  static RecentActionGidBuilder builder() nothrow
  {
    return new RecentActionGidBuilder;
  }

  /**
      Get `showNumbers` property.
      Returns: Whether the items should be displayed with a number.
  */
  @property bool showNumbers() nothrow
  {
    return getShowNumbers();
  }

  /**
      Set `showNumbers` property.
      Params:
        propval = Whether the items should be displayed with a number.
  */
  @property void showNumbers(bool propval) nothrow
  {
    setShowNumbers(propval);
  }

  mixin RecentChooserT!();

  /**
      Creates a new #GtkRecentAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gid.gtk3.action_group.ActionGroup.addActionWithAccel].
  
      Params:
        name = a unique name for the action
        label = the label displayed in menu items and on buttons,
            or null
        tooltip = a tooltip for the action, or null
        stockId = the stock icon to display in widgets representing
            the action, or null
      Returns: the newly created #GtkRecentAction.
  */
  this(string name, string label = null, string tooltip = null, string stockId = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_recent_action_new(_name, _label, _tooltip, _stockId);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #GtkRecentAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gid.gtk3.action_group.ActionGroup.addActionWithAccel].
  
      Params:
        name = a unique name for the action
        label = the label displayed in menu items and on buttons,
            or null
        tooltip = a tooltip for the action, or null
        stockId = the stock icon to display in widgets representing
            the action, or null
        manager = a #GtkRecentManager, or null for using the default
            #GtkRecentManager
      Returns: the newly created #GtkRecentAction
  */
  static gid.gtk3.recent_action.RecentAction newForManager(string name, string label = null, string tooltip = null, string stockId = null, gid.gtk3.recent_manager.RecentManager manager = null) nothrow
  {
    GtkAction* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_recent_action_new_for_manager(_name, _label, _tooltip, _stockId, manager ? cast(GtkRecentManager*)manager._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.recent_action.RecentAction)(cast(GtkAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the value set by [gid.gtk3.recent_chooser_menu.RecentChooserMenu.setShowNumbers].
      Returns: true if numbers should be shown.
  */
  bool getShowNumbers() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_action_get_show_numbers(cast(GtkRecentAction*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether a number should be added to the items shown by the
      widgets representing action. The numbers are shown to provide
      a unique character for a mnemonic to be used inside the menu item's
      label. Only the first ten items get a number to avoid clashes.
  
      Params:
        showNumbers = true if the shown items should be numbered
  */
  void setShowNumbers(bool showNumbers) nothrow
  {
    gtk_recent_action_set_show_numbers(cast(GtkRecentAction*)this._cPtr, showNumbers);
  }
}

/// Fluent builder implementation template for [gid.gtk3.recent_action.RecentAction]
class RecentActionGidBuilderImpl(T) : gid.gtk3.action.ActionGidBuilderImpl!T, gid.gtk3.recent_chooser.RecentChooserGidBuilderImpl!T
{

  mixin RecentChooserGidBuilderT!();

  /**
      Set `showNumbers` property.
      Params:
        propval = Whether the items should be displayed with a number.
      Returns: Builder instance for fluent chaining
  */
  T showNumbers(bool propval) nothrow
  {
    return setProperty("show-numbers", propval);
  }
}

/// Fluent builder for [gid.gtk3.recent_action.RecentAction]
final class RecentActionGidBuilder : RecentActionGidBuilderImpl!RecentActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecentAction build() nothrow
  {
    return new RecentAction(cast(void*)createGObject(RecentAction._getGType), Yes.Take);
  }
}
