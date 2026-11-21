/// Module for [SidebarSection] class
module gid.adw1.sidebar_section;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.sidebar;
import gid.adw1.sidebar_item;
import gid.adw1.types;
import gid.core.gid;
import gid.gio2.list_model;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;

/**
    A section within [gid.adw1.sidebar.Sidebar].
    
    [gid.adw1.sidebar_section.SidebarSection] contains [gid.adw1.sidebar_item.SidebarItem] objects.
    
    Section can optionally have a title, set with the
    [gid.adw1.sidebar_section.SidebarSection.title] property. If a title is not set, the section
    will have a separator in front of it, or just spacing in the
    [gid.adw1.types.SidebarMode.Page] mode.
    
    To add items, use [gid.adw1.sidebar_section.SidebarSection.append],
    [gid.adw1.sidebar_section.SidebarSection.prepend] or [gid.adw1.sidebar_section.SidebarSection.insert].
    
    To remove items, use [gid.adw1.sidebar_section.SidebarSection.remove] or
    [gid.adw1.sidebar_section.SidebarSection.removeAll].
    
    To inspect the items, use [gid.adw1.sidebar_section.SidebarSection.getItem] or
    [gid.adw1.sidebar_section.SidebarSection.items].
    
    To get the sidebar the section is in, use[gid.adw1.sidebar_section.SidebarSection.sidebar].
    
    ## Binding models
    
    [gid.adw1.sidebar_section.SidebarSection] can show items from a provided [gid.gio2.list_model.ListModel],
    using [gid.adw1.sidebar_section.SidebarSection.bindModel]. It works the same way as
    [gid.gtk4.list_box.ListBox.bindModel], except the provided function creates an
    [gid.adw1.sidebar_item.SidebarItem] rather than a [gid.gtk4.list_box_row.ListBoxRow].
    
    While a model is bound, adding or removing items manually is not allowed.
    Inspecting them is still allowed, but discouraged.
    
    ## [gid.adw1.sidebar_section.SidebarSection] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.sidebar_section.SidebarSection] allows adding items as children.
    
    Example of an [gid.adw1.sidebar_section.SidebarSection] UI definition:
    
    ```xml
    <object class="AdwSidebarSection">
      <property name="title" translatable="yes">Places</property>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Music</property>
          <property name="icon-name">folder-music-symbolic</property>
        </object>
      </child>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Pictures</property>
          <property name="icon-name">folder-pictures-symbolic</property>
        </object>
      </child>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Videos</property>
          <property name="icon-name">folder-videos-symbolic</property>
        </object>
      </child>
    </object>
    ```
    
    Result:
    
    <picture>
      <source srcset="sidebar-section-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar-section.png" alt="sidebar-section">
    </picture>
*/
class SidebarSection : gid.gobject2.object.ObjectWrap, gid.gtk4.buildable.Buildable
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
    return cast(void function())adw_sidebar_section_get_type != &gidSymbolNotFound ? adw_sidebar_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSidebarSection";
  }

  /** Returns `this`, for use in `with` statements. */
  override SidebarSection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.sidebar_section.SidebarSection]
      Returns: New builder object
  */
  static SidebarSectionGidBuilder builder() nothrow
  {
    return new SidebarSectionGidBuilder;
  }

  /**
      Get `items` property.
      Returns: A list model with the section's items.
        
        This can be used to keep an up-to-date view.
  */
  @property gid.gio2.list_model.ListModel items() nothrow
  {
    return getItems();
  }

  /**
      Get `menuModel` property.
      Returns: Context menu model for the section items.
        
        When a context menu is shown for an item, it will be constructed from the
        provided menu model. Use the [gid.adw1.sidebar.Sidebar.setupMenu] signal to set up
        the menu actions for the particular item.
        
        If not set, [gid.adw1.sidebar.Sidebar.menuModel] will be used instead.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = Context menu model for the section items.
          
          When a context menu is shown for an item, it will be constructed from the
          provided menu model. Use the [gid.adw1.sidebar.Sidebar.setupMenu] signal to set up
          the menu actions for the particular item.
          
          If not set, [gid.adw1.sidebar.Sidebar.menuModel] will be used instead.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `sidebar` property.
      Returns: The sidebar the section is in.
  */
  @property gid.adw1.sidebar.Sidebar sidebar() nothrow
  {
    return getSidebar();
  }

  /**
      Get `title` property.
      Returns: Title of the section.
        
        If set, it will be displayed instead of the separator before the section.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = Title of the section.
          
          If set, it will be displayed instead of the separator before the section.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new [gid.adw1.sidebar_section.SidebarSection].
      Returns: the newly created [gid.adw1.sidebar_section.SidebarSection]
  */
  this() nothrow
  {
    AdwSidebarSection* _cretval;
    _cretval = adw_sidebar_section_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends item to self.
      
      Cannot be used while a model is bound via [gid.adw1.sidebar_section.SidebarSection.bindModel].
  
      Params:
        item = an item to append
  */
  void append(gid.adw1.sidebar_item.SidebarItem item) nothrow
  {
    adw_sidebar_section_append(cast(AdwSidebarSection*)this._cPtr, item ? cast(AdwSidebarItem*)item._cPtr(Yes.Dup) : null);
  }

  /**
      Binds model to self.
      
      If self was already bound to a model, that previous binding is
      destroyed.
      
      The contents of self are cleared and then filled with items that
      represent items from model. self is updated whenever model changes.
      
      If model is `NULL`, self is left empty.
      
      Calling [gid.adw1.sidebar_section.SidebarSection.prepend], [gid.adw1.sidebar_section.SidebarSection.insert],
      [gid.adw1.sidebar_section.SidebarSection.append], [gid.adw1.sidebar_section.SidebarSection.remove] or
      [gid.adw1.sidebar_section.SidebarSection.removeAll] while a model is bound is not allowed.
      
      Accessing items and modifying them is allowed, but the changes will be erased
      whenever that part of the model changes, so it's not recommended.
  
      Params:
        model = the model to be bound
        createItemFunc = a function that creates [gid.adw1.sidebar_item.SidebarItem] for model items, or `NULL` in
              case model is also `NULL`
  */
  void bindModel(gid.gio2.list_model.ListModel model = null, gid.adw1.types.SidebarSectionCreateItemFunc createItemFunc = null) nothrow
  {
    extern(C) AdwSidebarItem* _createItemFuncCallback(GObject* item, void* userData) nothrow
    {
      gid.adw1.sidebar_item.SidebarItem _dretval;
      auto _dlg = cast(gid.adw1.types.SidebarSectionCreateItemFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.types.SidebarSectionCreateItemFunc");
      }
      auto _retval = _dretval ? cast(AdwSidebarItem*)_dretval._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _createItemFuncCB = createItemFunc ? &_createItemFuncCallback : null;
    auto _createItemFunc = createItemFunc ? freezeDelegate(cast(void*)&createItemFunc) : null;
    GDestroyNotify _createItemFuncDestroyCB = createItemFunc ? &thawDelegate : null;
    adw_sidebar_section_bind_model(cast(AdwSidebarSection*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null, _createItemFuncCB, _createItemFunc, _createItemFuncDestroyCB);
  }

  /**
      Gets the item at index within self.
      
      The index starts from 0 at the top of the section, and is same as the one
      returned by [gid.adw1.sidebar_item.SidebarItem.getSectionIndex].
      
      Can return `NULL` if index is larger or equal to the number of items.
  
      Params:
        index = index of the item
      Returns: the item at index
  */
  gid.adw1.sidebar_item.SidebarItem getItem(uint index) nothrow
  {
    AdwSidebarItem* _cretval;
    _cretval = adw_sidebar_section_get_item(cast(AdwSidebarSection*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.sidebar_item.SidebarItem)(cast(AdwSidebarItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list model with self's items.
      
      This can be used to keep an up-to-date view.
      Returns: a model containing the items
  */
  gid.gio2.list_model.ListModel getItems() nothrow
  {
    GListModel* _cretval;
    _cretval = adw_sidebar_section_get_items(cast(AdwSidebarSection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the context menu model for self's items.
      Returns: the context menu model
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = adw_sidebar_section_get_menu_model(cast(AdwSidebarSection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the sidebar self is in.
      Returns: the sidebar of self
  */
  gid.adw1.sidebar.Sidebar getSidebar() nothrow
  {
    AdwSidebar* _cretval;
    _cretval = adw_sidebar_section_get_sidebar(cast(AdwSidebarSection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.sidebar.Sidebar)(cast(AdwSidebar*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_sidebar_section_get_title(cast(AdwSidebarSection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Inserts item at position to self.
      
      If position is -1, or larger than the total number of items in self,
      the item will be appended to the end.
      
      Cannot be used while a model is bound via [gid.adw1.sidebar_section.SidebarSection.bindModel].
  
      Params:
        item = an item to insert
        position = position to insert item at
  */
  void insert(gid.adw1.sidebar_item.SidebarItem item, int position) nothrow
  {
    adw_sidebar_section_insert(cast(AdwSidebarSection*)this._cPtr, item ? cast(AdwSidebarItem*)item._cPtr(Yes.Dup) : null, position);
  }

  /**
      Prepends item to self.
      
      Cannot be used while a model is bound via [gid.adw1.sidebar_section.SidebarSection.bindModel].
  
      Params:
        item = an item to prepend
  */
  void prepend(gid.adw1.sidebar_item.SidebarItem item) nothrow
  {
    adw_sidebar_section_prepend(cast(AdwSidebarSection*)this._cPtr, item ? cast(AdwSidebarItem*)item._cPtr(Yes.Dup) : null);
  }

  /**
      Removes item from self.
      
      Cannot be used while a model is bound via [gid.adw1.sidebar_section.SidebarSection.bindModel].
  
      Params:
        item = an item to remove
  */
  void remove(gid.adw1.sidebar_item.SidebarItem item) nothrow
  {
    adw_sidebar_section_remove(cast(AdwSidebarSection*)this._cPtr, item ? cast(AdwSidebarItem*)item._cPtr(No.Dup) : null);
  }

  /**
      Removes all items from self.
      
      Cannot be used while a model is bound via [gid.adw1.sidebar_section.SidebarSection.bindModel].
  */
  void removeAll() nothrow
  {
    adw_sidebar_section_remove_all(cast(AdwSidebarSection*)this._cPtr);
  }

  /**
      Sets the context menu model for self's items.
      
      When a context menu is shown for an item, it will be constructed from the
      provided menu model. Use the [gid.adw1.sidebar.Sidebar.setupMenu] signal to set up
      the menu actions for the particular item.
      
      If not set, [gid.adw1.sidebar.Sidebar.menuModel] will be used instead.
  
      Params:
        menuModel = a menu model
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel menuModel = null) nothrow
  {
    adw_sidebar_section_set_menu_model(cast(AdwSidebarSection*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets the title of self.
      
      If set, it will be displayed instead of the separator before the section.
  
      Params:
        title = the title
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    adw_sidebar_section_set_title(cast(AdwSidebarSection*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [gid.adw1.sidebar_section.SidebarSection]
class SidebarSectionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `menuModel` property.
      Params:
        propval = Context menu model for the section items.
          
          When a context menu is shown for an item, it will be constructed from the
          provided menu model. Use the [gid.adw1.sidebar.Sidebar.setupMenu] signal to set up
          the menu actions for the particular item.
          
          If not set, [gid.adw1.sidebar.Sidebar.menuModel] will be used instead.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = Title of the section.
          
          If set, it will be displayed instead of the separator before the section.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.adw1.sidebar_section.SidebarSection]
final class SidebarSectionGidBuilder : SidebarSectionGidBuilderImpl!SidebarSectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SidebarSection build() nothrow
  {
    return new SidebarSection(cast(void*)createGObject(SidebarSection._getGType), Yes.Take);
  }
}
