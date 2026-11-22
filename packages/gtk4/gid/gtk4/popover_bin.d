/// Module for [PopoverBin] class
module gid.gtk4.popover_bin;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.popover;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A single child container with a popover.
    
    You should use [gid.gtk4.popover_bin.PopoverBin] whenever you need to present a [gid.gtk4.popover.Popover]
    to the user.
    
    ## Actions
    
    [gid.gtk4.popover_bin.PopoverBin] defines the `menu.popup` action, which can be activated
    to present the popover to the user.
    
    ## CSS nodes
    
    [gid.gtk4.popover_bin.PopoverBin] has a single CSS node with the name `popoverbin`.
*/
class PopoverBin : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_popover_bin_get_type != &gidSymbolNotFound ? gtk_popover_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPopoverBin";
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverBin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.popover_bin.PopoverBin]
      Returns: New builder object
  */
  static PopoverBinGidBuilder builder() nothrow
  {
    return new PopoverBinGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget of the popover bin.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the popover bin.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `handleInput` property.
      Returns: Whether the popover bin will handle input
        to trigger the popup.
  */
  @property bool handleInput() nothrow
  {
    return getHandleInput();
  }

  /**
      Set `handleInput` property.
      Params:
        propval = Whether the popover bin will handle input
          to trigger the popup.
  */
  @property void handleInput(bool propval) nothrow
  {
    setHandleInput(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
        
        See [gid.gtk4.popover_bin.PopoverBin.setMenuModel] for the interaction
        with the [gid.gtk4.popover_bin.PopoverBin.popover] property.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
          
          See [gid.gtk4.popover_bin.PopoverBin.setMenuModel] for the interaction
          with the [gid.gtk4.popover_bin.PopoverBin.popover] property.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `popover` property.
      Returns: The [gid.gtk4.popover.Popover] that will be popped up when calling
        [gid.gtk4.popover_bin.PopoverBin.popup].
  */
  @property gid.gtk4.popover.Popover popover() nothrow
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gid.gtk4.popover.Popover] that will be popped up when calling
          [gid.gtk4.popover_bin.PopoverBin.popup].
  */
  @property void popover(gid.gtk4.popover.Popover propval) nothrow
  {
    setPopover(propval);
  }

  /**
      Creates a new popover bin widget.
      Returns: the newly created popover bin
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_bin_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the child widget of the popover bin.
      Returns: the child widget
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_bin_get_child(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getHandleInput() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_bin_get_handle_input(cast(GtkPopoverBin*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the menu model set using [gid.gtk4.popover_bin.PopoverBin.setMenuModel].
      Returns: the menu model for the popover
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_bin_get_menu_model(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.popover.Popover] set using [gid.gtk4.popover_bin.PopoverBin.setPopover].
      Returns: a popover widget
  */
  gid.gtk4.popover.Popover getPopover() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_bin_get_popover(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover.Popover)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Hides the popover from the user.
      
      See: [gid.gtk4.popover_bin.PopoverBin.popup]
  */
  void popdown() nothrow
  {
    gtk_popover_bin_popdown(cast(GtkPopoverBin*)this._cPtr);
  }

  /**
      Presents the popover to the user.
      
      Use [gid.gtk4.popover_bin.PopoverBin.setPopover] or
      [gid.gtk4.popover_bin.PopoverBin.setMenuModel] to define the popover.
      
      See: [gid.gtk4.popover_bin.PopoverBin.popdown]
  */
  void popup() nothrow
  {
    gtk_popover_bin_popup(cast(GtkPopoverBin*)this._cPtr);
  }

  /**
      Sets the child of the popover bin.
  
      Params:
        child = the child of the popover bin
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_popover_bin_set_child(cast(GtkPopoverBin*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Enables or disables input handling.
      
      If enabled, the popover bin will pop up the
      popover on right-click or long press, as expected
      for a context menu.
  
      Params:
        handleInput = whether to handle input
  */
  void setHandleInput(bool handleInput) nothrow
  {
    gtk_popover_bin_set_handle_input(cast(GtkPopoverBin*)this._cPtr, handleInput);
  }

  /**
      Sets the menu model used to create the popover that will be
      presented when calling [gid.gtk4.popover_bin.PopoverBin.popup].
      
      If model is `NULL`, the popover will be unset.
      
      A [gid.gtk4.popover.Popover] will be created from the menu model with
      [gid.gtk4.popover_menu.PopoverMenu.newFromModel]. Actions will be connected
      as documented for this function.
      
      If [gid.gtk4.popover_bin.PopoverBin.popover] is already set, it will be
      dissociated from the popover bin, and the property is set to `NULL`.
      
      See: [gid.gtk4.popover_bin.PopoverBin.setPopover]
  
      Params:
        model = a menu model
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    gtk_popover_bin_set_menu_model(cast(GtkPopoverBin*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.popover.Popover] that will be presented when calling
      [gid.gtk4.popover_bin.PopoverBin.popup].
      
      If popover is `NULL`, the popover will be unset.
      
      If [gid.gtk4.popover_bin.PopoverBin.menuModel] is set before calling
      this function, then the menu model property will be unset.
      
      See: [gid.gtk4.popover_bin.PopoverBin.setMenuModel]
  
      Params:
        popover = a [gid.gtk4.popover.Popover]
  */
  void setPopover(gid.gtk4.popover.Popover popover = null) nothrow
  {
    gtk_popover_bin_set_popover(cast(GtkPopoverBin*)this._cPtr, popover ? cast(GtkWidget*)popover._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.popover_bin.PopoverBin]
class PopoverBinGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget of the popover bin.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `handleInput` property.
      Params:
        propval = Whether the popover bin will handle input
          to trigger the popup.
      Returns: Builder instance for fluent chaining
  */
  T handleInput(bool propval) nothrow
  {
    return setProperty("handle-input", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
          
          See [gid.gtk4.popover_bin.PopoverBin.setMenuModel] for the interaction
          with the [gid.gtk4.popover_bin.PopoverBin.popover] property.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gid.gtk4.popover.Popover] that will be popped up when calling
          [gid.gtk4.popover_bin.PopoverBin.popup].
      Returns: Builder instance for fluent chaining
  */
  T popover(gid.gtk4.popover.Popover propval) nothrow
  {
    return setProperty("popover", propval);
  }
}

/// Fluent builder for [gid.gtk4.popover_bin.PopoverBin]
final class PopoverBinGidBuilder : PopoverBinGidBuilderImpl!PopoverBinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverBin build() nothrow
  {
    return new PopoverBin(cast(void*)createGObject(PopoverBin._getGType), Yes.Take);
  }
}
