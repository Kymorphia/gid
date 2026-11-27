/// Module for [ShortcutsSection] class
module gid.adw1.shortcuts_section;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.shortcuts_item;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;

/**
    An object representing a section in [gid.adw1.shortcuts_dialog.ShortcutsDialog].
    
    It contains [gid.adw1.shortcuts_item.ShortcutsItem] objects, use [gid.adw1.shortcuts_section.ShortcutsSection.add] to
    add them.
    
    [gid.adw1.shortcuts_section.ShortcutsSection] implements the [gid.gio2.list_model.ListModel] interface and
    allows to access the added shortcut items through it.
    
    ## [gid.adw1.shortcuts_section.ShortcutsSection] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.shortcuts_section.ShortcutsSection] allows adding [gid.adw1.shortcuts_item.ShortcutsItem] objects as children.
*/
@gidGir("ShortcutsSection", "ShortcutsSectionClass")
class ShortcutsSection : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.buildable.Buildable
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
    return cast(void function())adw_shortcuts_section_get_type != &gidSymbolNotFound ? adw_shortcuts_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwShortcutsSection";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsSection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.shortcuts_section.ShortcutsSection]
      Returns: New builder object
  */
  static ShortcutsSectionGidBuilder builder() nothrow
  {
    return new ShortcutsSectionGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of the items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `title` property.
      Returns: The title of the section, can be `NULL`.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the section, can be `NULL`.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new [gid.adw1.shortcuts_section.ShortcutsSection] with title as its title if provided.
  
      Params:
        title = the section title
      Returns: the newly created [gid.adw1.shortcuts_section.ShortcutsSection]
  */
  this(string title = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, title !is null), Yes.Take);
    }
    else
    {
      AdwShortcutsSection* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
      _cretval = adw_shortcuts_section_new(_title);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds item to self.
  
      Params:
        item = the item to add
  */
  void add(gid.adw1.shortcuts_item.ShortcutsItem item) nothrow
  {
    adw_shortcuts_section_add(cast(AdwShortcutsSection*)this._cPtr, item ? cast(AdwShortcutsItem*)item._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcuts_section_get_title(cast(AdwShortcutsSection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the title of self.
  
      Params:
        title = the title to use
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    adw_shortcuts_section_set_title(cast(AdwShortcutsSection*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [gid.adw1.shortcuts_section.ShortcutsSection]
class ShortcutsSectionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();

  /**
      Set `title` property.
      Params:
        propval = The title of the section, can be `NULL`.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.adw1.shortcuts_section.ShortcutsSection]
final class ShortcutsSectionGidBuilder : ShortcutsSectionGidBuilderImpl!ShortcutsSectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsSection build() nothrow
  {
    return new ShortcutsSection(cast(void*)createGObject(ShortcutsSection._getGType), Yes.Take);
  }
}
