/// Module for [ShortcutsItem] class
module adw.shortcuts_item;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.types;

/**
    An object representing an individual shortcut in [adw.shortcuts_section.ShortcutsSection].
    
    A shortcut has a title, an optional subtitle, and an accelerator.
    
    Accelerator must be specified in the format [adw.shortcut_label.ShortcutLabel] accepts.
    
    Alternatively, the [adw.shortcuts_item.ShortcutsItem.actionName] property can be used
    to automatically get accelerator associated with the specified action, as set
    via [gtk.application.Application.setAccelsForAction].
    
    If both are specified, the accelerator will be used if the action couldn't
    be found or doesn't have an accelerator associated for it.
    
    If [adw.shortcuts_item.ShortcutsItem.direction] is set, the shortcut will only be
    displayed for the specified text direction. This allows to display different
    shortcuts for different text directions.
*/
class ShortcutsItem : gobject.object.ObjectWrap
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
    return cast(void function())adw_shortcuts_item_get_type != &gidSymbolNotFound ? adw_shortcuts_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwShortcutsItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.shortcuts_item.ShortcutsItem]
      Returns: New builder object
  */
  static ShortcutsItemGidBuilder builder() nothrow
  {
    return new ShortcutsItemGidBuilder;
  }

  /**
      Get `accelerator` property.
      Returns: The shortcut accelerator.
        
        Accelerator must be in the format [adw.shortcut_label.ShortcutLabel] accepts.
  */
  @property string accelerator() nothrow
  {
    return getAccelerator();
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The shortcut accelerator.
          
          Accelerator must be in the format [adw.shortcut_label.ShortcutLabel] accepts.
  */
  @property void accelerator(string propval) nothrow
  {
    setAccelerator(propval);
  }

  /**
      Get `actionName` property.
      Returns: Fully qualified action name to get the accelerator from.
  */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /**
      Set `actionName` property.
      Params:
        propval = Fully qualified action name to get the accelerator from.
  */
  @property void actionName(string propval) nothrow
  {
    setActionName(propval);
  }

  /**
      Get `direction` property.
      Returns: The shortcut direction.
        
        If set to `enum@Gtk.TextDirection.LTR` or [gtk.types.TextDirection.Rtl], the
        shortcut will only be displayed for this direction.
  */
  @property gtk.types.TextDirection direction() nothrow
  {
    return getDirection();
  }

  /**
      Set `direction` property.
      Params:
        propval = The shortcut direction.
          
          If set to `enum@Gtk.TextDirection.LTR` or [gtk.types.TextDirection.Rtl], the
          shortcut will only be displayed for this direction.
  */
  @property void direction(gtk.types.TextDirection propval) nothrow
  {
    setDirection(propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle of the shortcut.
  */
  @property string subtitle() nothrow
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle of the shortcut.
  */
  @property void subtitle(string propval) nothrow
  {
    setSubtitle(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the shortcut.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the shortcut.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [adw.shortcuts_item.ShortcutsItem] with title and accelerator.
  
      Params:
        title = the shortcut title
        accelerator = the shortcut accelerator
      Returns: the newly created [adw.shortcuts_item.ShortcutsItem]
  */
  this(string title, string accelerator) nothrow
  {
    AdwShortcutsItem* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_shortcuts_item_new(_title, _accelerator);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [adw.shortcuts_item.ShortcutsItem] with title and action_name.
  
      Params:
        title = the shortcut title
        actionName = the shortcut action name
      Returns: the newly created [adw.shortcuts_item.ShortcutsItem]
  */
  static adw.shortcuts_item.ShortcutsItem newFromAction(string title, string actionName) nothrow
  {
    AdwShortcutsItem* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_shortcuts_item_new_from_action(_title, _actionName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.shortcuts_item.ShortcutsItem)(cast(AdwShortcutsItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the accelerator of self.
      Returns: the accelerator
  */
  string getAccelerator() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcuts_item_get_accelerator(cast(AdwShortcutsItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the action name to get the accelerator from.
      Returns: the action name
  */
  string getActionName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcuts_item_get_action_name(cast(AdwShortcutsItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the direction of self.
      Returns: the shortcut direction
  */
  gtk.types.TextDirection getDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = adw_shortcuts_item_get_direction(cast(AdwShortcutsItem*)this._cPtr);
    gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Gets the subtitle of self.
      Returns: the subtitle
  */
  string getSubtitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcuts_item_get_subtitle(cast(AdwShortcutsItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcuts_item_get_title(cast(AdwShortcutsItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the accelerator of self.
      
      accelerator must be in the format [adw.shortcut_label.ShortcutLabel] accepts.
  
      Params:
        accelerator = the accelerator to use
  */
  void setAccelerator(string accelerator) nothrow
  {
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    adw_shortcuts_item_set_accelerator(cast(AdwShortcutsItem*)this._cPtr, _accelerator);
  }

  /**
      Sets the action name to get the accelerator from.
  
      Params:
        actionName = the action name to use
  */
  void setActionName(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    adw_shortcuts_item_set_action_name(cast(AdwShortcutsItem*)this._cPtr, _actionName);
  }

  /**
      Sets the direction of self.
      
      If set to [gtk.types.TextDirection.Ltr] or [gtk.types.TextDirection.Rtl], the
      shortcut will only be displayed for this direction.
  
      Params:
        direction = the shortcut direction
  */
  void setDirection(gtk.types.TextDirection direction) nothrow
  {
    adw_shortcuts_item_set_direction(cast(AdwShortcutsItem*)this._cPtr, direction);
  }

  /**
      Sets the subtitle of self.
  
      Params:
        subtitle = the subtitle to use
  */
  void setSubtitle(string subtitle) nothrow
  {
    const(char)* _subtitle = subtitle.toCString!(No.Malloc, No.Nullable);
    adw_shortcuts_item_set_subtitle(cast(AdwShortcutsItem*)this._cPtr, _subtitle);
  }

  /**
      Sets the title of self.
  
      Params:
        title = the title to use
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_shortcuts_item_set_title(cast(AdwShortcutsItem*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [adw.shortcuts_item.ShortcutsItem]
class ShortcutsItemGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `accelerator` property.
      Params:
        propval = The shortcut accelerator.
          
          Accelerator must be in the format [adw.shortcut_label.ShortcutLabel] accepts.
      Returns: Builder instance for fluent chaining
  */
  T accelerator(string propval) nothrow
  {
    return setProperty("accelerator", propval);
  }

  /**
      Set `actionName` property.
      Params:
        propval = Fully qualified action name to get the accelerator from.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The shortcut direction.
          
          If set to `enum@Gtk.TextDirection.LTR` or [gtk.types.TextDirection.Rtl], the
          shortcut will only be displayed for this direction.
      Returns: Builder instance for fluent chaining
  */
  T direction(gtk.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle of the shortcut.
      Returns: Builder instance for fluent chaining
  */
  T subtitle(string propval) nothrow
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the shortcut.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [adw.shortcuts_item.ShortcutsItem]
final class ShortcutsItemGidBuilder : ShortcutsItemGidBuilderImpl!ShortcutsItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsItem build() nothrow
  {
    return new ShortcutsItem(cast(void*)createGObject(ShortcutsItem._getGType), Yes.Take);
  }
}
