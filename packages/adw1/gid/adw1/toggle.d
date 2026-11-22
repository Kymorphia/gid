/// Module for [Toggle] class
module gid.adw1.toggle;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.widget;

/**
    A toggle within [gid.adw1.toggle_group.ToggleGroup].
    
    [gid.adw1.toggle.Toggle] can optionally have a name, set with [gid.adw1.toggle.Toggle.name].
    If the name is set, [gid.adw1.toggle_group.ToggleGroup.activeName] can be used to access
    toggles instead of index.
*/
class Toggle : gid.gobject2.object.ObjectWrap
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
    return cast(void function())adw_toggle_get_type != &gidSymbolNotFound ? adw_toggle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwToggle";
  }

  /** Returns `this`, for use in `with` statements. */
  override Toggle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.toggle.Toggle]
      Returns: New builder object
  */
  static ToggleGidBuilder builder() nothrow
  {
    return new ToggleGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The toggle child.
        
        When the child is set, icon and label are not displayed.
        
        It's recommended to still set the label, as it can still be used by the
        screen reader.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The toggle child.
          
          When the child is set, icon and label are not displayed.
          
          It's recommended to still set the label, as it can still be used by the
          screen reader.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `description` property.
      Returns: The description of the toggle.
        
        The description will be read out when using screen reader. If not set,
        [gid.adw1.toggle.Toggle.tooltip] will be used instead.
        
        See [gid.gtk4.types.AccessibleProperty.Description].
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description of the toggle.
          
          The description will be read out when using screen reader. If not set,
          [gid.adw1.toggle.Toggle.tooltip] will be used instead.
          
          See [gid.gtk4.types.AccessibleProperty.Description].
  */
  @property void description(string propval) nothrow
  {
    setDescription(propval);
  }

  /**
      Get `enabled` property.
      Returns: Whether this toggle is enabled.
  */
  @property bool enabled() nothrow
  {
    return getEnabled();
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether this toggle is enabled.
  */
  @property void enabled(bool propval) nothrow
  {
    setEnabled(propval);
  }

  /**
      Get `iconName` property.
      Returns: The toggle icon name.
        
        The icon will be displayed alone or next to the label, unless
        [gid.adw1.toggle.Toggle.child] is set.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The toggle icon name.
          
          The icon will be displayed alone or next to the label, unless
          [gid.adw1.toggle.Toggle.child] is set.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: The toggle label.
        
        The label will be displayed alone or next to the icon, unless
        [gid.adw1.toggle.Toggle.child] is set, but will still be read out by the screen
        reader.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The toggle label.
          
          The label will be displayed alone or next to the icon, unless
          [gid.adw1.toggle.Toggle.child] is set, but will still be read out by the screen
          reader.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `name` property.
      Returns: The toggle name.
        
        Allows accessing the toggle by its name instead of index.
        
        See [gid.adw1.toggle_group.ToggleGroup.activeName].
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The toggle name.
          
          Allows accessing the toggle by its name instead of index.
          
          See [gid.adw1.toggle_group.ToggleGroup.activeName].
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `tooltip` property.
      Returns: The tooltip of the toggle.
        
        The tooltip can be marked up with the Pango text markup language.
        
        Tooltip text will also be used as accessible description. Use
        [gid.adw1.toggle.Toggle.description] to set it separately.
  */
  @property string tooltip() nothrow
  {
    return getTooltip();
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip of the toggle.
          
          The tooltip can be marked up with the Pango text markup language.
          
          Tooltip text will also be used as accessible description. Use
          [gid.adw1.toggle.Toggle.description] to set it separately.
  */
  @property void tooltip(string propval) nothrow
  {
    setTooltip(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an embedded underline in the label indicates a mnemonic.
        
        See [gid.adw1.toggle.Toggle.label].
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the label indicates a mnemonic.
          
          See [gid.adw1.toggle.Toggle.label].
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Creates a new [gid.adw1.toggle.Toggle].
      Returns: the newly created [gid.adw1.toggle.Toggle]
  */
  this() nothrow
  {
    AdwToggle* _cretval;
    _cretval = adw_toggle_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the toggle child
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toggle_get_child(cast(AdwToggle*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the description of self.
      Returns: the toggle description
  */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_get_description(cast(AdwToggle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether self is enabled.
      Returns: whether the toggle is enabled
  */
  bool getEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_toggle_get_enabled(cast(AdwToggle*)this._cPtr);
    return _retval;
  }

  /**
      Gets the icon name of self.
      Returns: the toggle icon name
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_get_icon_name(cast(AdwToggle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the index of self within its toggle group.
      Returns: the index, or [gid.gtk4.types.INVALID_LIST_POSITION] if it's not in a group
  */
  uint getIndex() nothrow
  {
    uint _retval;
    _retval = adw_toggle_get_index(cast(AdwToggle*)this._cPtr);
    return _retval;
  }

  /**
      Gets the label of self.
      Returns: the toggle label
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_get_label(cast(AdwToggle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the name of self.
      Returns: the toggle name
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_get_name(cast(AdwToggle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip of self.
      Returns: the toggle tooltip
  */
  string getTooltip() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_toggle_get_tooltip(cast(AdwToggle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether self uses underlines.
      Returns: whether the toggle uses underlines
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_toggle_get_use_underline(cast(AdwToggle*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child of self to child.
      
      When the child is set, icon and label are not displayed.
      
      It's recommended to still set the label, as it can still be used by the
      screen reader.
  
      Params:
        child = a child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_toggle_set_child(cast(AdwToggle*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description of self to description.
      
      The description will be read out when using screen reader. If not set,
      [gid.adw1.toggle.Toggle.tooltip] will be used instead.
      
      See [gid.gtk4.types.AccessibleProperty.Description].
  
      Params:
        description = the description
  */
  void setDescription(string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    adw_toggle_set_description(cast(AdwToggle*)this._cPtr, _description);
  }

  /**
      Sets whether self is enabled.
  
      Params:
        enabled = whether the toggle should be enbled
  */
  void setEnabled(bool enabled) nothrow
  {
    adw_toggle_set_enabled(cast(AdwToggle*)this._cPtr, enabled);
  }

  /**
      Sets the icon name of self to icon_name.
      
      The icon will be displayed alone or next to the label, unless
      [gid.adw1.toggle.Toggle.child] is set.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_toggle_set_icon_name(cast(AdwToggle*)this._cPtr, _iconName);
  }

  /**
      Sets the label of self to label.
      
      The label will be displayed alone or next to the icon, unless
      [gid.adw1.toggle.Toggle.child] is set, but will still be read out by the screen
      reader.
  
      Params:
        label = a label
  */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    adw_toggle_set_label(cast(AdwToggle*)this._cPtr, _label);
  }

  /**
      Sets the name of self to name.
      
      Allows accessing self by its name instead of index.
      
      See [gid.adw1.toggle_group.ToggleGroup.activeName].
  
      Params:
        name = a name
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    adw_toggle_set_name(cast(AdwToggle*)this._cPtr, _name);
  }

  /**
      Sets the tooltip of self to tooltip.
      
      tooltip can be marked up with the Pango text markup language.
      
      Tooltip text will also be used as accessible description. Use
      [gid.adw1.toggle.Toggle.description] to set it separately.
  
      Params:
        tooltip = the tooltip
  */
  void setTooltip(string tooltip) nothrow
  {
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, No.Nullable);
    adw_toggle_set_tooltip(cast(AdwToggle*)this._cPtr, _tooltip);
  }

  /**
      Sets whether an embedded underline in the label indicates a mnemonic.
      
      See [gid.adw1.toggle.Toggle.label].
  
      Params:
        useUnderline = whether an underline in the label indicates a mnemonic
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    adw_toggle_set_use_underline(cast(AdwToggle*)this._cPtr, useUnderline);
  }
}

/// Fluent builder implementation template for [gid.adw1.toggle.Toggle]
class ToggleGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The toggle child.
          
          When the child is set, icon and label are not displayed.
          
          It's recommended to still set the label, as it can still be used by the
          screen reader.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `description` property.
      Params:
        propval = The description of the toggle.
          
          The description will be read out when using screen reader. If not set,
          [gid.adw1.toggle.Toggle.tooltip] will be used instead.
          
          See [gid.gtk4.types.AccessibleProperty.Description].
      Returns: Builder instance for fluent chaining
  */
  T description(string propval) nothrow
  {
    return setProperty("description", propval);
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether this toggle is enabled.
      Returns: Builder instance for fluent chaining
  */
  T enabled(bool propval) nothrow
  {
    return setProperty("enabled", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The toggle icon name.
          
          The icon will be displayed alone or next to the label, unless
          [gid.adw1.toggle.Toggle.child] is set.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The toggle label.
          
          The label will be displayed alone or next to the icon, unless
          [gid.adw1.toggle.Toggle.child] is set, but will still be read out by the screen
          reader.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The toggle name.
          
          Allows accessing the toggle by its name instead of index.
          
          See [gid.adw1.toggle_group.ToggleGroup.activeName].
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip of the toggle.
          
          The tooltip can be marked up with the Pango text markup language.
          
          Tooltip text will also be used as accessible description. Use
          [gid.adw1.toggle.Toggle.description] to set it separately.
      Returns: Builder instance for fluent chaining
  */
  T tooltip(string propval) nothrow
  {
    return setProperty("tooltip", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the label indicates a mnemonic.
          
          See [gid.adw1.toggle.Toggle.label].
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [gid.adw1.toggle.Toggle]
final class ToggleGidBuilder : ToggleGidBuilderImpl!ToggleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Toggle build() nothrow
  {
    return new Toggle(cast(void*)createGObject(Toggle._getGType), Yes.Take);
  }
}
