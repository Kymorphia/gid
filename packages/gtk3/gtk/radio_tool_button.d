/// Module for [RadioToolButton] class
module gtk.radio_tool_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.radio_button;
import gtk.toggle_tool_button;
import gtk.types;

/**
    A #GtkRadioToolButton is a #GtkToolItem that contains a radio button,
    that is, a button that is part of a group of toggle buttons where only
    one button can be active at a time.
    
    Use [gtk.radio_tool_button.RadioToolButton.new_] to create a new GtkRadioToolButton. Use
    [gtk.radio_tool_button.RadioToolButton.newFromWidget] to create a new GtkRadioToolButton
    that is part of the same group as an existing GtkRadioToolButton.
    
    # CSS nodes
    
    GtkRadioToolButton has a single CSS node with name toolbutton.
*/
class RadioToolButton : gtk.toggle_tool_button.ToggleToolButton
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
    return cast(void function())gtk_radio_tool_button_get_type != &gidSymbolNotFound ? gtk_radio_tool_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioToolButton self()
  {
    return this;
  }

  /**
  Get builder for [gtk.radio_tool_button.RadioToolButton]
  Returns: New builder object
  */
  static RadioToolButtonGidBuilder builder()
  {
    return new RadioToolButtonGidBuilder;
  }

  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio tool button.
  */
  @property void group(gtk.radio_tool_button.RadioToolButton propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.radio_tool_button.RadioToolButton)("group", propval);
  }

  /**
      Creates a new #GtkRadioToolButton, adding it to group.
  
      Params:
        group = An
            existing radio button group, or null if you are creating a new group
      Returns: The new #GtkRadioToolButton
  */
  this(gtk.radio_button.RadioButton[] group = null)
  {
    GtkToolItem* _cretval;
    auto _group = gSListFromD!(gtk.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_button.RadioButton, GidOwnership.None)(_group);
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
  
      Deprecated: Use [gtk.radio_tool_button.RadioToolButton.new_] instead.
  */
  static gtk.radio_tool_button.RadioToolButton newFromStock(gtk.radio_button.RadioButton[] group, string stockId)
  {
    GtkToolItem* _cretval;
    auto _group = gSListFromD!(gtk.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_button.RadioButton, GidOwnership.None)(_group);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_radio_tool_button_new_from_stock(_group, _stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioToolButton adding it to the same group as gruup
  
      Params:
        group = An existing #GtkRadioToolButton, or null
      Returns: The new #GtkRadioToolButton
  */
  static gtk.radio_tool_button.RadioToolButton newFromWidget(gtk.radio_tool_button.RadioToolButton group = null)
  {
    GtkToolItem* _cretval;
    _cretval = gtk_radio_tool_button_new_from_widget(group ? cast(GtkRadioToolButton*)group._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
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
  static gtk.radio_tool_button.RadioToolButton newWithStockFromWidget(gtk.radio_tool_button.RadioToolButton group, string stockId)
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_radio_tool_button_new_with_stock_from_widget(group ? cast(GtkRadioToolButton*)group._cPtr(No.Dup) : null, _stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_tool_button.RadioToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the radio button group button belongs to.
      Returns: The group button belongs to.
  */
  gtk.radio_button.RadioButton[] getGroup()
  {
    GSList* _cretval;
    _cretval = gtk_radio_tool_button_get_group(cast(GtkRadioToolButton*)this._cPtr);
    auto _retval = gSListToD!(gtk.radio_button.RadioButton, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Adds button to group, removing it from the group it belonged to before.
  
      Params:
        group = an existing radio button group, or null
  */
  void setGroup(gtk.radio_button.RadioButton[] group = null)
  {
    auto _group = gSListFromD!(gtk.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_button.RadioButton, GidOwnership.None)(_group);
    gtk_radio_tool_button_set_group(cast(GtkRadioToolButton*)this._cPtr, _group);
  }
}

class RadioToolButtonGidBuilderImpl(T) : gtk.toggle_tool_button.ToggleToolButtonGidBuilderImpl!T
{


  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio tool button.
      Returns: Builder instance for fluent chaining
  */
  T group(gtk.radio_tool_button.RadioToolButton propval)
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gtk.radio_tool_button.RadioToolButton]
final class RadioToolButtonGidBuilder : RadioToolButtonGidBuilderImpl!RadioToolButtonGidBuilder
{
  RadioToolButton build()
  {
    return new RadioToolButton(cast(void*)createGObject(RadioToolButton._getGType), No.Take);
  }
}
