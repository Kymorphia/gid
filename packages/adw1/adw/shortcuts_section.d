/// Module for [ShortcutsSection] class
module adw.shortcuts_section;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.shortcuts_item;
import adw.types;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.buildable;
import gtk.buildable_mixin;

/**
    An object representing a section in [adw.shortcuts_dialog.ShortcutsDialog].
    
    It contains [adw.shortcuts_item.ShortcutsItem] objects, use [adw.shortcuts_section.ShortcutsSection.add] to
    add them.
    
    [adw.shortcuts_section.ShortcutsSection] implements the [gio.list_model.ListModel] interface and
    allows to access the added shortcut items through it.
    
    ## [adw.shortcuts_section.ShortcutsSection] as [gtk.buildable.Buildable]
    
    [adw.shortcuts_section.ShortcutsSection] allows adding [adw.shortcuts_item.ShortcutsItem] objects as children.
*/
class ShortcutsSection : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.buildable.Buildable
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
    return cast(void function())adw_shortcuts_section_get_type != &gidSymbolNotFound ? adw_shortcuts_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsSection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.shortcuts_section.ShortcutsSection]
      Returns: New builder object
  */
  static ShortcutsSectionGidBuilder builder() nothrow
  {
    return new ShortcutsSectionGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of the items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
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
      Creates a new [adw.shortcuts_section.ShortcutsSection] with title as its title if provided.
  
      Params:
        title = the section title
      Returns: the newly created [adw.shortcuts_section.ShortcutsSection]
  */
  this(string title = null) nothrow
  {
    AdwShortcutsSection* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    _cretval = adw_shortcuts_section_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
      Adds item to self.
  
      Params:
        item = the item to add
  */
  void add(adw.shortcuts_item.ShortcutsItem item) nothrow
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

/// Fluent builder implementation template for [adw.shortcuts_section.ShortcutsSection]
class ShortcutsSectionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
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

/// Fluent builder for [adw.shortcuts_section.ShortcutsSection]
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
