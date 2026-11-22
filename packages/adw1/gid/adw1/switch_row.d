/// Module for [SwitchRow] class
module gid.adw1.switch_row;

public import gid.core.basictypes;
import gid.adw1.action_row;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to represent two states.
    
    <picture>
      <source srcset="switch-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="switch-row.png" alt="switch-row">
    </picture>
    
    The [gid.adw1.switch_row.SwitchRow] widget contains a [gid.gtk4.switch_.Switch] that allows the user
    to select between two states: "on" or "off". When activated, the row will
    invert its active state.
    
    The user can control the switch by activating the row or by dragging on the
    switch handle.
    
    See [gid.gtk4.switch_.Switch] for details.
    
    Example of an [gid.adw1.switch_row.SwitchRow] UI definition:
    ```xml
    <object class="AdwSwitchRow">
      <property name="title" translatable="yes">Switch Row</property>
      <signal name="notify::active" handler="switch_row_notify_active_cb"/>
    </object>
    ```
    
    The [gid.adw1.switch_row.SwitchRow.active] property should be connected to in order to
    monitor changes to the active state.
    
    ## Accessibility
    
    [gid.adw1.switch_row.SwitchRow] uses the [gid.gtk4.types.AccessibleRole.Switch] role.
*/
class SwitchRow : gid.adw1.action_row.ActionRow
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
    return cast(void function())adw_switch_row_get_type != &gidSymbolNotFound ? adw_switch_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSwitchRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override SwitchRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.switch_row.SwitchRow]
      Returns: New builder object
  */
  static SwitchRowGidBuilder builder() nothrow
  {
    return new SwitchRowGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the switch row is in the "on" or "off" position.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the switch row is in the "on" or "off" position.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Creates a new [gid.adw1.switch_row.SwitchRow].
      Returns: the newly created [gid.adw1.switch_row.SwitchRow]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_switch_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is in its "on" or "off" position.
      Returns: whether self is active or not
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_switch_row_get_active(cast(AdwSwitchRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self is in its "on" or "off" position
  
      Params:
        isActive = whether self should be active
  */
  void setActive(bool isActive) nothrow
  {
    adw_switch_row_set_active(cast(AdwSwitchRow*)this._cPtr, isActive);
  }
}

/// Fluent builder implementation template for [gid.adw1.switch_row.SwitchRow]
class SwitchRowGidBuilderImpl(T) : gid.adw1.action_row.ActionRowGidBuilderImpl!T
{


  /**
      Set `active` property.
      Params:
        propval = Whether the switch row is in the "on" or "off" position.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }
}

/// Fluent builder for [gid.adw1.switch_row.SwitchRow]
final class SwitchRowGidBuilder : SwitchRowGidBuilderImpl!SwitchRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SwitchRow build() nothrow
  {
    return new SwitchRow(cast(void*)createGObject(SwitchRow._getGType), Yes.Take);
  }
}
