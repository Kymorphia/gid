/// Module for [PopoverBin] class
module gtk.popover_bin;

public import gid.basictypes;
import gid.gid;
import gio.menu_model;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.popover;
import gtk.types;
import gtk.widget;

/**
    A single child container with a popover.
    
    You should use [gtk.popover_bin.PopoverBin] whenever you need to present a [gtk.popover.Popover]
    to the user.
    
    ## Actions
    
    [gtk.popover_bin.PopoverBin] defines the `menu.popup` action, which can be activated
    to present the popover to the user.
    
    ## CSS nodes
    
    [gtk.popover_bin.PopoverBin] has a single CSS node with the name `popoverbin`.
*/
class PopoverBin : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_bin_get_type != &gidSymbolNotFound ? gtk_popover_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverBin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.popover_bin.PopoverBin]
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
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget of the popover bin.
  */
  @property void child(gtk.widget.Widget propval) nothrow
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
      Returns: The [gio.menu_model.MenuModel] from which the popup will be created.
        
        See [gtk.popover_bin.PopoverBin.setMenuModel] for the interaction
        with the [gtk.popover_bin.PopoverBin.popover] property.
  */
  @property gio.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gio.menu_model.MenuModel] from which the popup will be created.
          
          See [gtk.popover_bin.PopoverBin.setMenuModel] for the interaction
          with the [gtk.popover_bin.PopoverBin.popover] property.
  */
  @property void menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `popover` property.
      Returns: The [gtk.popover.Popover] that will be popped up when calling
        [gtk.popover_bin.PopoverBin.popup].
  */
  @property gtk.popover.Popover popover() nothrow
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gtk.popover.Popover] that will be popped up when calling
          [gtk.popover_bin.PopoverBin.popup].
  */
  @property void popover(gtk.popover.Popover propval) nothrow
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
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_bin_get_child(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
      Retrieves the menu model set using [gtk.popover_bin.PopoverBin.setMenuModel].
      Returns: the menu model for the popover
  */
  gio.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_bin_get_menu_model(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gtk.popover.Popover] set using [gtk.popover_bin.PopoverBin.setPopover].
      Returns: a popover widget
  */
  gtk.popover.Popover getPopover() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_bin_get_popover(cast(GtkPopoverBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover.Popover)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Hides the popover from the user.
      
      See: [gtk.popover_bin.PopoverBin.popup]
  */
  void popdown() nothrow
  {
    gtk_popover_bin_popdown(cast(GtkPopoverBin*)this._cPtr);
  }

  /**
      Presents the popover to the user.
      
      Use [gtk.popover_bin.PopoverBin.setPopover] or
      [gtk.popover_bin.PopoverBin.setMenuModel] to define the popover.
      
      See: [gtk.popover_bin.PopoverBin.popdown]
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
  void setChild(gtk.widget.Widget child = null) nothrow
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
      presented when calling [gtk.popover_bin.PopoverBin.popup].
      
      If model is `NULL`, the popover will be unset.
      
      A [gtk.popover.Popover] will be created from the menu model with
      [gtk.popover_menu.PopoverMenu.newFromModel]. Actions will be connected
      as documented for this function.
      
      If [gtk.popover_bin.PopoverBin.popover] is already set, it will be
      dissociated from the popover bin, and the property is set to `NULL`.
      
      See: [gtk.popover_bin.PopoverBin.setPopover]
  
      Params:
        model = a menu model
  */
  void setMenuModel(gio.menu_model.MenuModel model = null) nothrow
  {
    gtk_popover_bin_set_menu_model(cast(GtkPopoverBin*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.popover.Popover] that will be presented when calling
      [gtk.popover_bin.PopoverBin.popup].
      
      If popover is `NULL`, the popover will be unset.
      
      If [gtk.popover_bin.PopoverBin.menuModel] is set before calling
      this function, then the menu model property will be unset.
      
      See: [gtk.popover_bin.PopoverBin.setMenuModel]
  
      Params:
        popover = a [gtk.popover.Popover]
  */
  void setPopover(gtk.popover.Popover popover = null) nothrow
  {
    gtk_popover_bin_set_popover(cast(GtkPopoverBin*)this._cPtr, popover ? cast(GtkWidget*)popover._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.popover_bin.PopoverBin]
class PopoverBinGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget of the popover bin.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
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
        propval = The [gio.menu_model.MenuModel] from which the popup will be created.
          
          See [gtk.popover_bin.PopoverBin.setMenuModel] for the interaction
          with the [gtk.popover_bin.PopoverBin.popover] property.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gtk.popover.Popover] that will be popped up when calling
          [gtk.popover_bin.PopoverBin.popup].
      Returns: Builder instance for fluent chaining
  */
  T popover(gtk.popover.Popover propval) nothrow
  {
    return setProperty("popover", propval);
  }
}

/// Fluent builder for [gtk.popover_bin.PopoverBin]
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
