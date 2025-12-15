/// Module for [RecentAction] class
module gtk.recent_action;

import gid.gid;
import gobject.object;
import gtk.action;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;
import gtk.recent_manager;
import gtk.types;

/**
    A #GtkRecentAction represents a list of recently used files, which
    can be shown by widgets such as #GtkRecentChooserDialog or
    #GtkRecentChooserMenu.
    
    To construct a submenu showing recently used files, use a #GtkRecentAction
    as the action for a `<menuitem>`. To construct a menu toolbutton showing
    the recently used files in the popup menu, use a #GtkRecentAction as the
    action for a `<toolitem>` element.
*/
class RecentAction : gtk.action.Action, gtk.recent_chooser.RecentChooser
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
    return cast(void function())gtk_recent_action_get_type != &gidSymbolNotFound ? gtk_recent_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentAction self()
  {
    return this;
  }

  /**
      Get `showNumbers` property.
      Returns: Whether the items should be displayed with a number.
  */
  @property bool showNumbers()
  {
    return getShowNumbers();
  }

  /**
      Set `showNumbers` property.
      Params:
        propval = Whether the items should be displayed with a number.
  */
  @property void showNumbers(bool propval)
  {
    return setShowNumbers(propval);
  }

  mixin RecentChooserT!();

  /**
      Creates a new #GtkRecentAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gtk.action_group.ActionGroup.addActionWithAccel].
  
      Params:
        name = a unique name for the action
        label = the label displayed in menu items and on buttons,
            or null
        tooltip = a tooltip for the action, or null
        stockId = the stock icon to display in widgets representing
            the action, or null
      Returns: the newly created #GtkRecentAction.
  */
  this(string name, string label = null, string tooltip = null, string stockId = null)
  {
    GtkAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_recent_action_new(_name, _label, _tooltip, _stockId);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkRecentAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gtk.action_group.ActionGroup.addActionWithAccel].
  
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
  static gtk.recent_action.RecentAction newForManager(string name, string label = null, string tooltip = null, string stockId = null, gtk.recent_manager.RecentManager manager = null)
  {
    GtkAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_recent_action_new_for_manager(_name, _label, _tooltip, _stockId, manager ? cast(GtkRecentManager*)manager._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.recent_action.RecentAction)(cast(GtkAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the value set by [gtk.recent_chooser_menu.RecentChooserMenu.setShowNumbers].
      Returns: true if numbers should be shown.
  */
  bool getShowNumbers()
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
  void setShowNumbers(bool showNumbers)
  {
    gtk_recent_action_set_show_numbers(cast(GtkRecentAction*)this._cPtr, showNumbers);
  }
}
