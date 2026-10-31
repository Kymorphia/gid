/// Module for [Toggle] class
module adw.toggle;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.widget;

/**
    A toggle within [adw.toggle_group.ToggleGroup].
    
    [adw.toggle.Toggle] can optionally have a name, set with [adw.toggle.Toggle.name].
    If the name is set, [adw.toggle_group.ToggleGroup.activeName] can be used to access
    toggles instead of index.
*/
class Toggle : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_toggle_get_type != &gidSymbolNotFound ? adw_toggle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Toggle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.toggle.Toggle]
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
  @property gtk.widget.Widget child() nothrow
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
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `description` property.
      Returns: The description of the toggle.
        
        The description will be read out when using screen reader. If not set,
        [adw.toggle.Toggle.tooltip] will be used instead.
        
        See [gtk.types.AccessibleProperty.Description].
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
          [adw.toggle.Toggle.tooltip] will be used instead.
          
          See [gtk.types.AccessibleProperty.Description].
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
        [adw.toggle.Toggle.child] is set.
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
          [adw.toggle.Toggle.child] is set.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: The toggle label.
        
        The label will be displayed alone or next to the icon, unless
        [adw.toggle.Toggle.child] is set, but will still be read out by the screen
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
          [adw.toggle.Toggle.child] is set, but will still be read out by the screen
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
        
        See [adw.toggle_group.ToggleGroup.activeName].
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
          
          See [adw.toggle_group.ToggleGroup.activeName].
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
        [adw.toggle.Toggle.description] to set it separately.
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
          [adw.toggle.Toggle.description] to set it separately.
  */
  @property void tooltip(string propval) nothrow
  {
    setTooltip(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an embedded underline in the label indicates a mnemonic.
        
        See [adw.toggle.Toggle.label].
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the label indicates a mnemonic.
          
          See [adw.toggle.Toggle.label].
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Creates a new [adw.toggle.Toggle].
      Returns: the newly created [adw.toggle.Toggle]
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
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toggle_get_child(cast(AdwToggle*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
      Returns: the index, or [gtk.types.INVALID_LIST_POSITION] if it's not in a group
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
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    adw_toggle_set_child(cast(AdwToggle*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description of self to description.
      
      The description will be read out when using screen reader. If not set,
      [adw.toggle.Toggle.tooltip] will be used instead.
      
      See [gtk.types.AccessibleProperty.Description].
  
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
      [adw.toggle.Toggle.child] is set.
  
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
      [adw.toggle.Toggle.child] is set, but will still be read out by the screen
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
      
      See [adw.toggle_group.ToggleGroup.activeName].
  
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
      [adw.toggle.Toggle.description] to set it separately.
  
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
      
      See [adw.toggle.Toggle.label].
  
      Params:
        useUnderline = whether an underline in the label indicates a mnemonic
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    adw_toggle_set_use_underline(cast(AdwToggle*)this._cPtr, useUnderline);
  }
}

/// Fluent builder implementation template for [adw.toggle.Toggle]
class ToggleGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
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
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `description` property.
      Params:
        propval = The description of the toggle.
          
          The description will be read out when using screen reader. If not set,
          [adw.toggle.Toggle.tooltip] will be used instead.
          
          See [gtk.types.AccessibleProperty.Description].
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
          [adw.toggle.Toggle.child] is set.
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
          [adw.toggle.Toggle.child] is set, but will still be read out by the screen
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
          
          See [adw.toggle_group.ToggleGroup.activeName].
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
          [adw.toggle.Toggle.description] to set it separately.
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
          
          See [adw.toggle.Toggle.label].
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [adw.toggle.Toggle]
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
