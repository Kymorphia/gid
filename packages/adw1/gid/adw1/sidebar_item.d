/// Module for [SidebarItem] class
module gid.adw1.sidebar_item;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.sidebar_section;
import gid.adw1.types;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.widget;

/**
    An item within [gid.adw1.sidebar_section.SidebarSection].
    
    Sidebar items must have a title, set via [gid.adw1.sidebar_item.SidebarItem.title].
    
    Sidebar items should, but are not required to, have an icon. Icons can be set
    from an icon name, via [gid.adw1.sidebar_item.SidebarItem.iconName], or a
    [gid.gdk4.paintable.Paintable], via [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
    
    Items can also have subtitles, set with the [gid.adw1.sidebar_item.SidebarItem.subtitle]
    property. Subtitles should be used sparingly.
    
    To add a tooltip, use [gid.adw1.sidebar_item.SidebarItem.tooltip]. Tooltips always use
    Pango markup.
    
    Items can have an arbitrary suffix widget, set with the
    [gid.adw1.sidebar_item.SidebarItem.suffix] properties. It will be displayed at the end of
    its row, or before the arrow in the [gid.adw1.types.SidebarMode.Page] mode.
    
    To hide or disable the item, use the [gid.adw1.sidebar_item.SidebarItem.visible] and
    [gid.adw1.sidebar_item.SidebarItem.enabled] properties respectively.
    
    To access the items's section, use [gid.adw1.sidebar_item.SidebarItem.section].
    
    It's also possible to access the index of the item in both the section and
    the sidebar, using [gid.adw1.sidebar_item.SidebarItem.getSectionIndex] and
    [gid.adw1.sidebar_item.SidebarItem.getIndex] respectively.
    
    Dragging content over sidebar items activates them by default. To disable
    this behavior, set [gid.adw1.sidebar_item.SidebarItem.dragMotionActivate] to `FALSE`.
    
    [gid.adw1.sidebar_item.SidebarItem] is derivable, and applications that need to associate each
    page with data can store it in the items themselves  this way.
*/
@gidGir("SidebarItem", "SidebarItemClass")
class SidebarItem : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_sidebar_item_get_type != &gidSymbolNotFound ? adw_sidebar_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSidebarItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override SidebarItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.sidebar_item.SidebarItem]
      Returns: New builder object
  */
  static SidebarItemGidBuilder builder() nothrow
  {
    return new SidebarItemGidBuilder;
  }

  /**
      Get `dragMotionActivate` property.
      Returns: Whether to activate the item on pointer motion during Drag-and-Drop.
        
        This is needed to be able to drag content into the page the item
        represents, when the sidebar is used as a page switcher. However, it may be
        unwanted when dropping content onto the item itself, so it can be disabled.
  */
  @property bool dragMotionActivate() nothrow
  {
    return getDragMotionActivate();
  }

  /**
      Set `dragMotionActivate` property.
      Params:
        propval = Whether to activate the item on pointer motion during Drag-and-Drop.
          
          This is needed to be able to drag content into the page the item
          represents, when the sidebar is used as a page switcher. However, it may be
          unwanted when dropping content onto the item itself, so it can be disabled.
  */
  @property void dragMotionActivate(bool propval) nothrow
  {
    setDragMotionActivate(propval);
  }

  /**
      Get `enabled` property.
      Returns: Whether the item is enabled.
        
        See [gid.gtk4.widget.Widget.sensitive].
  */
  @property bool enabled() nothrow
  {
    return getEnabled();
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether the item is enabled.
          
          See [gid.gtk4.widget.Widget.sensitive].
  */
  @property void enabled(bool propval) nothrow
  {
    setEnabled(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this item.
        
        Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this item.
          
          Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `iconPaintable` property.
      Returns: The paintable to use as the icon for this item.
        
        Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconName].
  */
  @property gid.gdk4.paintable.Paintable iconPaintable() nothrow
  {
    return getIconPaintable();
  }

  /**
      Set `iconPaintable` property.
      Params:
        propval = The paintable to use as the icon for this item.
          
          Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconName].
  */
  @property void iconPaintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    setIconPaintable(propval);
  }

  /**
      Get `section` property.
      Returns: The section the item is in.
  */
  @property gid.adw1.sidebar_section.SidebarSection section() nothrow
  {
    return getSection();
  }

  /**
      Get `subtitle` property.
      Returns: Subtitle of the item.
  */
  @property string subtitle() nothrow
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = Subtitle of the item.
  */
  @property void subtitle(string propval) nothrow
  {
    setSubtitle(propval);
  }

  /**
      Get `suffix` property.
      Returns: The suffix widget for this item.
        
        Suffix will be shown at the end of the item's row, or before the arrow in
        the [gid.adw1.types.SidebarMode.Page] mode.
  */
  @property gid.gtk4.widget.Widget suffix() nothrow
  {
    return getSuffix();
  }

  /**
      Set `suffix` property.
      Params:
        propval = The suffix widget for this item.
          
          Suffix will be shown at the end of the item's row, or before the arrow in
          the [gid.adw1.types.SidebarMode.Page] mode.
  */
  @property void suffix(gid.gtk4.widget.Widget propval) nothrow
  {
    setSuffix(propval);
  }

  /**
      Get `title` property.
      Returns: Title of the item.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = Title of the item.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `tooltip` property.
      Returns: The tooltip of the item.
        
        The tooltip can be marked up with the Pango text markup language.
  */
  @property string tooltip() nothrow
  {
    return getTooltip();
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip of the item.
          
          The tooltip can be marked up with the Pango text markup language.
  */
  @property void tooltip(string propval) nothrow
  {
    setTooltip(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an underline in the title indicates a mnemonic.
        
        The mnemonic can be used to activate the item.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an underline in the title indicates a mnemonic.
          
          The mnemonic can be used to activate the item.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the item is visible.
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the item is visible.
  */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /**
      Creates a new [gid.adw1.sidebar_item.SidebarItem] with title as its title.
  
      Params:
        title = the item title
      Returns: the newly created [gid.adw1.sidebar_item.SidebarItem]
  */
  this(string title) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      AdwSidebarItem* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
      _cretval = adw_sidebar_item_new(_title);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets whether self will be activated on pointer motion during Drag-and-Drop.
      Returns: whether to enable the item on drag motion
  */
  bool getDragMotionActivate() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_sidebar_item_get_drag_motion_activate(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is enabled.
      Returns: whether the item is enabled
  */
  bool getEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_sidebar_item_get_enabled(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the icon name for item.
      Returns: the icon name
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_sidebar_item_get_icon_name(cast(AdwSidebarItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the paintable used as the icon for item.
      Returns: the icon paintable
  */
  gid.gdk4.paintable.Paintable getIconPaintable() nothrow
  {
    GdkPaintable* _cretval;
    _cretval = adw_sidebar_item_get_icon_paintable(cast(AdwSidebarItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets index of self within its [gid.adw1.sidebar.Sidebar].
      
      If self is within a section, but that section is not in a sidebar, index
      will be within the section only.
      
      If self is not within a section, the index will be 0.
      
      The item can later be retrieved by passing this index into
      [gid.adw1.sidebar.Sidebar.getItem].
      Returns: the index of self
  */
  uint getIndex() nothrow
  {
    uint _retval;
    _retval = adw_sidebar_item_get_index(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the section self is in.
      Returns: the section of self
  */
  gid.adw1.sidebar_section.SidebarSection getSection() nothrow
  {
    AdwSidebarSection* _cretval;
    _cretval = adw_sidebar_item_get_section(cast(AdwSidebarItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.sidebar_section.SidebarSection)(cast(AdwSidebarSection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets index of self within its [gid.adw1.sidebar_section.SidebarSection].
      
      If self is not within a section, the index will be 0.
      
      The item can later be retrieved by passing this index into
      [gid.adw1.sidebar_section.SidebarSection.getItem].
      Returns: the index of self
  */
  uint getSectionIndex() nothrow
  {
    uint _retval;
    _retval = adw_sidebar_item_get_section_index(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the subtitle of self.
      Returns: the subtitle
  */
  string getSubtitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_sidebar_item_get_subtitle(cast(AdwSidebarItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the suffix widget for self.
      Returns: the suffix widget
  */
  gid.gtk4.widget.Widget getSuffix() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_sidebar_item_get_suffix(cast(AdwSidebarItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_sidebar_item_get_title(cast(AdwSidebarItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip of self.
      Returns: the tooltip
  */
  string getTooltip() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_sidebar_item_get_tooltip(cast(AdwSidebarItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether an underline in the title indicates a mnemonic.
      Returns: whether an underline in the text indicates a mnemonic
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_sidebar_item_get_use_underline(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is visible.
      Returns: whether the item is visible
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_sidebar_item_get_visible(cast(AdwSidebarItem*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether to activate self on pointer motion during Drag-and-Drop.
      
      This is needed to be able to drag content into the page the item
      represents, when the sidebar is used as a page switcher. However, it may be
      unwanted when dropping content onto the item itself, so it can be disabled.
  
      Params:
        dragMotionActivate = whether to enable the item on drag motion
  */
  void setDragMotionActivate(bool dragMotionActivate) nothrow
  {
    adw_sidebar_item_set_drag_motion_activate(cast(AdwSidebarItem*)this._cPtr, dragMotionActivate);
  }

  /**
      Sets whether self is enabled.
      
      See [gid.gtk4.widget.Widget.sensitive].
  
      Params:
        enabled = whether to enable the item
  */
  void setEnabled(bool enabled) nothrow
  {
    adw_sidebar_item_set_enabled(cast(AdwSidebarItem*)this._cPtr, enabled);
  }

  /**
      Sets the icon name for item.
      
      Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_sidebar_item_set_icon_name(cast(AdwSidebarItem*)this._cPtr, _iconName);
  }

  /**
      Sets the paintable to use as the icon for item.
      
      Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconName].
  
      Params:
        paintable = the icon paintable
  */
  void setIconPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    adw_sidebar_item_set_icon_paintable(cast(AdwSidebarItem*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the subtitle of self.
  
      Params:
        subtitle = the subtitle
  */
  void setSubtitle(string subtitle = null) nothrow
  {
    const(char)* _subtitle = subtitle.toCString!(No.Malloc, Yes.Nullable);
    adw_sidebar_item_set_subtitle(cast(AdwSidebarItem*)this._cPtr, _subtitle);
  }

  /**
      Sets the suffix widget for self.
      
      Suffix will be shown at the end of the item's row, or before the arrow in
      the [gid.adw1.types.SidebarMode.Page] mode.
  
      Params:
        suffix = the suffix widget
  */
  void setSuffix(gid.gtk4.widget.Widget suffix = null) nothrow
  {
    adw_sidebar_item_set_suffix(cast(AdwSidebarItem*)this._cPtr, suffix ? cast(GtkWidget*)suffix._cPtr(No.Dup) : null);
  }

  /**
      Sets the title of self.
  
      Params:
        title = the title
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    adw_sidebar_item_set_title(cast(AdwSidebarItem*)this._cPtr, _title);
  }

  /**
      Sets the tooltip of self.
      
      The tooltip can be marked up with the Pango text markup language.
  
      Params:
        tooltip = the tooltip
  */
  void setTooltip(string tooltip = null) nothrow
  {
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
    adw_sidebar_item_set_tooltip(cast(AdwSidebarItem*)this._cPtr, _tooltip);
  }

  /**
      Sets whether an underline in the title indicates a mnemonic.
      
      The mnemonic can be used to activate the item.
  
      Params:
        useUnderline = whether an underline in the text indicates a mnemonic
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    adw_sidebar_item_set_use_underline(cast(AdwSidebarItem*)this._cPtr, useUnderline);
  }

  /**
      Sets whether self is visible.
  
      Params:
        visible = whether the item is visible
  */
  void setVisible(bool visible) nothrow
  {
    adw_sidebar_item_set_visible(cast(AdwSidebarItem*)this._cPtr, visible);
  }
}

/// Fluent builder implementation template for [gid.adw1.sidebar_item.SidebarItem]
class SidebarItemGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `dragMotionActivate` property.
      Params:
        propval = Whether to activate the item on pointer motion during Drag-and-Drop.
          
          This is needed to be able to drag content into the page the item
          represents, when the sidebar is used as a page switcher. However, it may be
          unwanted when dropping content onto the item itself, so it can be disabled.
      Returns: Builder instance for fluent chaining
  */
  T dragMotionActivate(bool propval) nothrow
  {
    return setProperty("drag-motion-activate", propval);
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether the item is enabled.
          
          See [gid.gtk4.widget.Widget.sensitive].
      Returns: Builder instance for fluent chaining
  */
  T enabled(bool propval) nothrow
  {
    return setProperty("enabled", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this item.
          
          Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `iconPaintable` property.
      Params:
        propval = The paintable to use as the icon for this item.
          
          Mutually exclusive with [gid.adw1.sidebar_item.SidebarItem.iconName].
      Returns: Builder instance for fluent chaining
  */
  T iconPaintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    return setProperty("icon-paintable", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = Subtitle of the item.
      Returns: Builder instance for fluent chaining
  */
  T subtitle(string propval) nothrow
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `suffix` property.
      Params:
        propval = The suffix widget for this item.
          
          Suffix will be shown at the end of the item's row, or before the arrow in
          the [gid.adw1.types.SidebarMode.Page] mode.
      Returns: Builder instance for fluent chaining
  */
  T suffix(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("suffix", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = Title of the item.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `tooltip` property.
      Params:
        propval = The tooltip of the item.
          
          The tooltip can be marked up with the Pango text markup language.
      Returns: Builder instance for fluent chaining
  */
  T tooltip(string propval) nothrow
  {
    return setProperty("tooltip", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an underline in the title indicates a mnemonic.
          
          The mnemonic can be used to activate the item.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the item is visible.
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }
}

/// Fluent builder for [gid.adw1.sidebar_item.SidebarItem]
final class SidebarItemGidBuilder : SidebarItemGidBuilderImpl!SidebarItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SidebarItem build() nothrow
  {
    return new SidebarItem(cast(void*)createGObject(SidebarItem._getGType), Yes.Take);
  }
}
