/// Module for [MenuManager] class
module panel.menu_manager;

import gid.gid;
import gio.menu;
import gio.menu_model;
import glib.error;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/**
    The goal of #PanelMenuManager is to simplify the process of merging multiple
    GtkBuilder .ui files containing menus into a single representation of the
    application menus. Additionally, it provides the ability to "unmerge"
    previously merged menus.
    
    This allows for an application to have plugins which seemlessly extends
    the core application menus.
    
    Implementation notes:
    
    To make this work, we don't use the GMenu instances created by a GtkBuilder
    instance. Instead, we create the menus ourself and recreate section and
    submenu links. This allows the #PanelMenuManager to be in full control of
    the generated menus.
    
    [panel.menu_manager.MenuManager.getMenuById] will always return a #GMenu, however
    that menu may contain no children until something has extended it later
    on during the application process.
*/
class MenuManager : gobject.object.ObjectWrap
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
    return cast(void function())panel_menu_manager_get_type != &gidSymbolNotFound ? panel_menu_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuManager self()
  {
    return this;
  }

  /** */
  this()
  {
    PanelMenuManager* _cretval;
    _cretval = panel_menu_manager_new();
    this(_cretval, Yes.Take);
  }

  /** */
  uint addFilename(string filename)
  {
    uint _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = panel_menu_manager_add_filename(cast(PanelMenuManager*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  uint addResource(string resource)
  {
    uint _retval;
    const(char)* _resource = resource.toCString(No.Alloc);
    GError *_err;
    _retval = panel_menu_manager_add_resource(cast(PanelMenuManager*)this._cPtr, _resource, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Locates a menu item that matches id and sets the position within
      the resulting #GMenu to position.
      
      If no match is found, null is returned.
  
      Params:
        id = the identifier of the menu item
        position = the position within the resulting menu
      Returns: a #GMenu if successful; otherwise
          null and position is unset.
  */
  gio.menu.Menu findItemById(string id, out uint position)
  {
    GMenu* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = panel_menu_manager_find_item_by_id(cast(PanelMenuManager*)this._cPtr, _id, cast(uint*)&position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu.Menu)(cast(GMenu*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gio.menu.Menu getMenuById(string menuId)
  {
    GMenu* _cretval;
    const(char)* _menuId = menuId.toCString(No.Alloc);
    _cretval = panel_menu_manager_get_menu_by_id(cast(PanelMenuManager*)this._cPtr, _menuId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu.Menu)(cast(GMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the known menu ids as a string array.
      Returns: 
  */
  string[] getMenuIds()
  {
    const(char*)* _cretval;
    _cretval = panel_menu_manager_get_menu_ids(cast(PanelMenuManager*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Note that menu_model is not retained, a copy of it is made.
  
      Params:
        menuId = the identifier of the menu
        menuModel = the menu model to merge
      Returns: the merge-id which can be used with [panel.menu_manager.MenuManager.remove]
  */
  uint merge(string menuId, gio.menu_model.MenuModel menuModel)
  {
    uint _retval;
    const(char)* _menuId = menuId.toCString(No.Alloc);
    _retval = panel_menu_manager_merge(cast(PanelMenuManager*)this._cPtr, _menuId, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This removes items from menus that were added as part of a previous
      menu merge. Use the value returned from [panel.menu_manager.MenuManager.merge] as
      the merge_id.
  
      Params:
        mergeId = A previously registered merge id
  */
  void remove(uint mergeId)
  {
    panel_menu_manager_remove(cast(PanelMenuManager*)this._cPtr, mergeId);
  }

  /**
      Overwrites an attribute for a menu that was created by
      #PanelMenuManager.
      
      This can be useful when you want to update an attribute such as
      "accel" when an accelerator has changed due to user mappings.
  
      Params:
        menu = the menu that was retreived with [panel.menu_manager.MenuManager.getMenuById]
        position = the index of the item in the menu
        attribute = the attribute to change
        value = the new value for the attribute
  */
  void setAttributeString(gio.menu.Menu menu, uint position, string attribute, string value)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    panel_menu_manager_set_attribute_string(cast(PanelMenuManager*)this._cPtr, menu ? cast(GMenu*)menu._cPtr(No.Dup) : null, position, _attribute, _value);
  }
}
