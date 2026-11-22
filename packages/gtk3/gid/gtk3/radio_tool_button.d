/// Module for [RadioToolButton] class
module gid.gtk3.radio_tool_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.radio_button;
import gid.gtk3.toggle_tool_button;
import gid.gtk3.types;

/**
    A #GtkRadioToolButton is a #GtkToolItem that contains a radio button,
    that is, a button that is part of a group of toggle buttons where only
    one button can be active at a time.
    
    Use [gid.gtk3.radio_tool_button.RadioToolButton.new_] to create a new GtkRadioToolButton. Use
    [gid.gtk3.radio_tool_button.RadioToolButton.newFromWidget] to create a new GtkRadioToolButton
    that is part of the same group as an existing GtkRadioToolButton.
    
    # CSS nodes
    
    GtkRadioToolButton has a single CSS node with name toolbutton.
*/
class RadioToolButton : gid.gtk3.toggle_tool_button.ToggleToolButton
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
    return cast(void function())gtk_radio_tool_button_get_type != &gidSymbolNotFound ? gtk_radio_tool_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioToolButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioToolButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_tool_button.RadioToolButton]
      Returns: New builder object
  */
  static RadioToolButtonGidBuilder builder() nothrow
  {
    return new RadioToolButtonGidBuilder;
  }

  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio tool button.
  */
  @property void group(gid.gtk3.radio_tool_button.RadioToolButton propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.radio_tool_button.RadioToolButton)("group", propval);
  }

  /**
      Creates a new #GtkRadioToolButton, adding it to group.
  
      Params:
        group = An
            existing radio button group, or null if you are creating a new group
      Returns: The new #GtkRadioToolButton
  */
  this(gid.gtk3.radio_button.RadioButton[] group = null) nothrow
  {
    GtkToolItem* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    _cretval = gtk_radio_tool_button_new(_group);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkRadioToolButton, adding it to group.
      The new #GtkRadioToolButton will contain an icon and label from the
      stock item indicated by stock_id.
  
      Params:
        group = an existing radio button
            group, or null if you are creating a new group
        stockId = the name of a stock item
      Returns: The new #GtkRadioToolButton
  
      Deprecated: Use [gid.gtk3.radio_tool_button.RadioToolButton.new_] instead.
  */
  static gid.gtk3.radio_tool_button.RadioToolButton newFromStock(gid.gtk3.radio_button.RadioButton[] group, string stockId) nothrow
  {
    GtkToolItem* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_tool_button_new_from_stock(_group, _stockId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioToolButton adding it to the same group as gruup
  
      Params:
        group = An existing #GtkRadioToolButton, or null
      Returns: The new #GtkRadioToolButton
  */
  static gid.gtk3.radio_tool_button.RadioToolButton newFromWidget(gid.gtk3.radio_tool_button.RadioToolButton group = null) nothrow
  {
    GtkToolItem* _cretval;
    _cretval = gtk_radio_tool_button_new_from_widget(group ? cast(GtkRadioToolButton*)group._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioToolButton adding it to the same group as group.
      The new #GtkRadioToolButton will contain an icon and label from the
      stock item indicated by stock_id.
  
      Params:
        group = An existing #GtkRadioToolButton.
        stockId = the name of a stock item
      Returns: A new #GtkRadioToolButton
  
      Deprecated: gtk_radio_tool_button_new_from_widget
  */
  static gid.gtk3.radio_tool_button.RadioToolButton newWithStockFromWidget(gid.gtk3.radio_tool_button.RadioToolButton group, string stockId) nothrow
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_tool_button_new_with_stock_from_widget(group ? cast(GtkRadioToolButton*)group._cPtr(No.Dup) : null, _stockId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the radio button group button belongs to.
      Returns: The group button belongs to.
  */
  gid.gtk3.radio_button.RadioButton[] getGroup() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_radio_tool_button_get_group(cast(GtkRadioToolButton*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.radio_button.RadioButton, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Adds button to group, removing it from the group it belonged to before.
  
      Params:
        group = an existing radio button group, or null
  */
  void setGroup(gid.gtk3.radio_button.RadioButton[] group = null) nothrow
  {
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    gtk_radio_tool_button_set_group(cast(GtkRadioToolButton*)this._cPtr, _group);
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_tool_button.RadioToolButton]
class RadioToolButtonGidBuilderImpl(T) : gid.gtk3.toggle_tool_button.ToggleToolButtonGidBuilderImpl!T
{


  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio tool button.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk3.radio_tool_button.RadioToolButton propval) nothrow
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gid.gtk3.radio_tool_button.RadioToolButton]
final class RadioToolButtonGidBuilder : RadioToolButtonGidBuilderImpl!RadioToolButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioToolButton build() nothrow
  {
    return new RadioToolButton(cast(void*)createGObject(RadioToolButton._getGType), Yes.Take);
  }
}
