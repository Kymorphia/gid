/// Module for [ToggleGroup] class
module adw.toggle_group;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.toggle;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.selection_model;
import gtk.widget;

/**
    A group of exclusive toggles.
    
    <picture>
      <source srcset="toggle-group-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group.png" alt="toggle-group">
    </picture>
    
    [adw.toggle_group.ToggleGroup] presents a set of exclusive toggles, represented as
    [adw.toggle.Toggle] objects. Each toggle can display an icon, a label, an icon
    and a label, or a custom child.
    
    Toggles are indexed by their position, with the first toggle being equivalent
    to 0, and so on. Use the [adw.toggle_group.ToggleGroup.active] to get that position.
    
    Toggles can also have optional names, set via the [adw.toggle.Toggle.name]
    property. The name of the active toggle can be accessed via the
    [adw.toggle_group.ToggleGroup.activeName] property.
    
    [adw.toggle.Toggle] objects can be retrieved via their index or name, using
    [adw.toggle_group.ToggleGroup.getToggle] or [adw.toggle_group.ToggleGroup.getToggleByName]
    respectively. [adw.toggle_group.ToggleGroup] also provides a [gtk.selection_model.SelectionModel] of
    its toggles via the [adw.toggle_group.ToggleGroup.toggles] property.
    
    [adw.toggle_group.ToggleGroup] is orientable, and the toggles can be displayed horizontally
    or vertically. This is mostly useful for icon-only toggles.
    
    Use the [adw.toggle_group.ToggleGroup.homogeneous] property to make the toggles take
    the same size, and the [adw.toggle_group.ToggleGroup.canShrink] to control whether
    the toggles can ellipsize.
    
    Example of an [adw.toggle_group.ToggleGroup] UI definition:
    
    ```xml
     <object class="AdwToggleGroup">
       <property name="active-name">picture</property>
       <child>
         <object class="AdwToggle">
           <property name="icon-name">camera-photo-symbolic</property>
           <property name="tooltip" translatable="yes">Picture Mode</property>
           <property name="name">picture</property>
         </object>
       </child>
       <child>
         <object class="AdwToggle">
           <property name="icon-name">camera-video-symbolic</property>
           <property name="tooltip" translatable="yes">Recording Mode</property>
           <property name="name">recording</property>
         </object>
       </child>
     </object>
    ```
    
    See also: [adw.inline_view_switcher.InlineViewSwitcher].
    
    ## CSS nodes
    
    [adw.toggle_group.ToggleGroup] has a main CSS node with the name `toggle-group`.
    
    Its toggles have CSS nodes with the name `toggle`, and its separators have nodes
    with the name `separator`.
    
    Toggle nodes will have a different style classes depending on their content:
    `.text-button` for labels, `.image-button` for icons, `.image-text-button`
    for both or no style class for custom children.
    
    The hidden separators use the `.hidden` style class.
    
    ## Style classes
    
    [adw.toggle_group.ToggleGroup] can use the [`.flat`](style-classes.html#flat_1) style class
    to remove its background and make it look like a group of buttons.
    
    <picture>
      <source srcset="toggle-group-flat-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-flat.png" alt="toggle-group-flat">
    </picture>
    
    It can also use the [`.round`](style-classes.html#round) style class to make
    its toggles and the group itself rounded.
    
    <picture>
      <source srcset="toggle-group-round-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-round.png" alt="toggle-group-round">
    </picture>
    
    They can also be combined with each other.
    
    <picture>
      <source srcset="toggle-group-flat-round-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-flat-round.png" alt="toggle-group-flat-round">
    </picture>
    
    ## Accessibility
    
    [adw.toggle_group.ToggleGroup] uses the `enum@Gtk.AccessibleRole.radio-group` role. Its
    toggles use the [gtk.types.AccessibleRole.Radio] role.
*/
class ToggleGroup : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())adw_toggle_group_get_type != &gidSymbolNotFound ? adw_toggle_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.toggle_group.ToggleGroup]
      Returns: New builder object
  */
  static ToggleGroupGidBuilder builder() nothrow
  {
    return new ToggleGroupGidBuilder;
  }

  /**
      Get `active` property.
      Returns: The index of the active toggle.
        
        Setting the index to a larger value than the number of toggles in the group
        unsets the current active toggle.
        
        If no toggle is active, the property will be set to
        [gtk.types.INVALID_LIST_POSITION].
  */
  @property uint active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = The index of the active toggle.
          
          Setting the index to a larger value than the number of toggles in the group
          unsets the current active toggle.
          
          If no toggle is active, the property will be set to
          [gtk.types.INVALID_LIST_POSITION].
  */
  @property void active(uint propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `activeName` property.
      Returns: The name of the active toggle.
        
        The name can be set via [adw.toggle.Toggle.name]. If the currently active
        toggle doesn't have a name, the property will be set to `NULL`.
        
        Set it to `NULL` to unset the current active toggle.
  */
  @property string activeName() nothrow
  {
    return getActiveName();
  }

  /**
      Set `activeName` property.
      Params:
        propval = The name of the active toggle.
          
          The name can be set via [adw.toggle.Toggle.name]. If the currently active
          toggle doesn't have a name, the property will be set to `NULL`.
          
          Set it to `NULL` to unset the current active toggle.
  */
  @property void activeName(string propval) nothrow
  {
    setActiveName(propval);
  }

  /**
      Get `canShrink` property.
      Returns: Whether the toggles can be smaller than the natural size of their contents.
        
        If set to `TRUE`, the toggle labels will ellipsize.
        
        See [gtk.button.Button.canShrink].
  */
  @property bool canShrink() nothrow
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the toggles can be smaller than the natural size of their contents.
          
          If set to `TRUE`, the toggle labels will ellipsize.
          
          See [gtk.button.Button.canShrink].
  */
  @property void canShrink(bool propval) nothrow
  {
    setCanShrink(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether all toggles take the same size.
  */
  @property bool homogeneous() nothrow
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all toggles take the same size.
  */
  @property void homogeneous(bool propval) nothrow
  {
    setHomogeneous(propval);
  }

  /**
      Get `nToggles` property.
      Returns: The number of toggles within the group.
  */
  @property uint nToggles() nothrow
  {
    return getNToggles();
  }

  /**
      Get `toggles` property.
      Returns: A selection model with the groups's toggles.
        
        This can be used to keep an up-to-date view. The model also implements
        [gtk.selection_model.SelectionModel] and can be used to track and change the active
        toggle.
  */
  @property gtk.selection_model.SelectionModel toggles() nothrow
  {
    return getToggles();
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.toggle_group.ToggleGroup].
      Returns: the newly created [adw.toggle_group.ToggleGroup]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toggle_group_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a toggle to self.
  
      Params:
        toggle = the toggle to add
  */
  void add(adw.toggle.Toggle toggle) nothrow
  {
    adw_toggle_group_add(cast(AdwToggleGroup*)this._cPtr, toggle ? cast(AdwToggle*)toggle._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the index of the active toggle in self.
      
      Returns [gtk.types.INVALID_LIST_POSITION] if no toggle is active.
      Returns: the active toggle index
  */
  uint getActive() nothrow
  {
    uint _retval;
    _retval = adw_toggle_group_get_active(cast(AdwToggleGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the active toggle in self.
      
      Can be `NULL` if the currently active toggle doesn't have a name.
      
      See [adw.toggle.Toggle.name].
      Returns: the active toggle name
  */
  string getActiveName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_group_get_active_name(cast(AdwToggleGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the toggles can be smaller than the natural size of their
      contents.
      Returns: whether the toggles can shrink
  */
  bool getCanShrink() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_toggle_group_get_can_shrink(cast(AdwToggleGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether all toggles take the same size.
      Returns: whether all toggles take the same size
  */
  bool getHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_toggle_group_get_homogeneous(cast(AdwToggleGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of toggles within self.
      Returns: the number of toggles
  */
  uint getNToggles() nothrow
  {
    uint _retval;
    _retval = adw_toggle_group_get_n_toggles(cast(AdwToggleGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the toggle with index from self.
  
      Params:
        index = toggle's index
      Returns: the toggle
  */
  adw.toggle.Toggle getToggle(uint index) nothrow
  {
    AdwToggle* _cretval;
    _cretval = adw_toggle_group_get_toggle(cast(AdwToggleGroup*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.toggle.Toggle)(cast(AdwToggle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the toggle with the name name from self.
  
      Params:
        name = toggle name
      Returns: the toggle
  */
  adw.toggle.Toggle getToggleByName(string name) nothrow
  {
    AdwToggle* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_toggle_group_get_toggle_by_name(cast(AdwToggleGroup*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.toggle.Toggle)(cast(AdwToggle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the toggles of the group.
      
      This can be used to keep an up-to-date view. The model also implements
      [gtk.selection_model.SelectionModel] and can be used to track and change the active
      toggle.
      Returns: a [gtk.selection_model.SelectionModel] for the group's toggles
  */
  gtk.selection_model.SelectionModel getToggles() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_toggle_group_get_toggles(cast(AdwToggleGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes toggle from self.
  
      Params:
        toggle = a toggle to remove
  */
  void remove(adw.toggle.Toggle toggle) nothrow
  {
    adw_toggle_group_remove(cast(AdwToggleGroup*)this._cPtr, toggle ? cast(AdwToggle*)toggle._cPtr(No.Dup) : null);
  }

  /**
      Removes all toggles from self.
  */
  void removeAll() nothrow
  {
    adw_toggle_group_remove_all(cast(AdwToggleGroup*)this._cPtr);
  }

  /**
      Sets the active toggle for self.
      
      If the index is larger than the number of toggles in self, unsets the
      current active toggle.
  
      Params:
        active = toggle index
  */
  void setActive(uint active) nothrow
  {
    adw_toggle_group_set_active(cast(AdwToggleGroup*)this._cPtr, active);
  }

  /**
      Sets the active toggle for self.
      
      The name can be set via [adw.toggle.Toggle.name].
      
      If name is `NULL`, unset the current active toggle instead.
  
      Params:
        name = toggle name
  */
  void setActiveName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    adw_toggle_group_set_active_name(cast(AdwToggleGroup*)this._cPtr, _name);
  }

  /**
      Sets whether the toggles can be smaller than the natural size of their
      contents.
      
      If can_shrink is `TRUE`, the toggle labels will ellipsize.
      
      See [gtk.button.Button.canShrink].
  
      Params:
        canShrink = whether the toggles can shrink
  */
  void setCanShrink(bool canShrink) nothrow
  {
    adw_toggle_group_set_can_shrink(cast(AdwToggleGroup*)this._cPtr, canShrink);
  }

  /**
      Sets whether all toggles take the same size.
  
      Params:
        homogeneous = whether all toggles should take the same size
  */
  void setHomogeneous(bool homogeneous) nothrow
  {
    adw_toggle_group_set_homogeneous(cast(AdwToggleGroup*)this._cPtr, homogeneous);
  }
}

/// Fluent builder implementation template for [adw.toggle_group.ToggleGroup]
class ToggleGroupGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `active` property.
      Params:
        propval = The index of the active toggle.
          
          Setting the index to a larger value than the number of toggles in the group
          unsets the current active toggle.
          
          If no toggle is active, the property will be set to
          [gtk.types.INVALID_LIST_POSITION].
      Returns: Builder instance for fluent chaining
  */
  T active(uint propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `activeName` property.
      Params:
        propval = The name of the active toggle.
          
          The name can be set via [adw.toggle.Toggle.name]. If the currently active
          toggle doesn't have a name, the property will be set to `NULL`.
          
          Set it to `NULL` to unset the current active toggle.
      Returns: Builder instance for fluent chaining
  */
  T activeName(string propval) nothrow
  {
    return setProperty("active-name", propval);
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the toggles can be smaller than the natural size of their contents.
          
          If set to `TRUE`, the toggle labels will ellipsize.
          
          See [gtk.button.Button.canShrink].
      Returns: Builder instance for fluent chaining
  */
  T canShrink(bool propval) nothrow
  {
    return setProperty("can-shrink", propval);
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all toggles take the same size.
      Returns: Builder instance for fluent chaining
  */
  T homogeneous(bool propval) nothrow
  {
    return setProperty("homogeneous", propval);
  }
}

/// Fluent builder for [adw.toggle_group.ToggleGroup]
final class ToggleGroupGidBuilder : ToggleGroupGidBuilderImpl!ToggleGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleGroup build() nothrow
  {
    return new ToggleGroup(cast(void*)createGObject(ToggleGroup._getGType), Yes.Take);
  }
}
