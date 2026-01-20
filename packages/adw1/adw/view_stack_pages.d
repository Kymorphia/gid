/// Module for [ViewStackPages] class
module adw.view_stack_pages;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack_page;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.selection_model;
import gtk.selection_model_mixin;

/**
    An auxiliary class used by `class@ViewStack`.
    
    See `property@ViewStack:pages`.
*/
class ViewStackPages : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.selection_model.SelectionModel
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
    return cast(void function())adw_view_stack_pages_get_type != &gidSymbolNotFound ? adw_view_stack_pages_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewStackPages self()
  {
    return this;
  }

  /**
      Get `selectedPage` property.
      Returns: The selected `class@ViewStackPage` within the `class@ViewStackPages`.
        
        This can be used to keep an up-to-date view of the `class@ViewStackPage` for
        The visible `class@ViewStackPage` within the associated `class@ViewStackPages`.
        
        This can be used to keep an up-to-date view of the visible child.
  */
  @property adw.view_stack_page.ViewStackPage selectedPage()
  {
    return getSelectedPage();
  }

  /**
      Set `selectedPage` property.
      Params:
        propval = The selected `class@ViewStackPage` within the `class@ViewStackPages`.
          
          This can be used to keep an up-to-date view of the `class@ViewStackPage` for
          The visible `class@ViewStackPage` within the associated `class@ViewStackPages`.
          
          This can be used to keep an up-to-date view of the visible child.
  */
  @property void selectedPage(adw.view_stack_page.ViewStackPage propval)
  {
    return setSelectedPage(propval);
  }

  mixin ListModelT!();
  mixin SelectionModelT!();

  /**
      Gets the `classViewStackPage` for the visible child of a view stack
      
      Gets the `classViewStackPage` for the visible child of the associated stack.
      
      Returns `NULL` if there's no selected page.
      Returns: the stack page
  */
  adw.view_stack_page.ViewStackPage getSelectedPage()
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_pages_get_selected_page(cast(AdwViewStackPages*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the visible child in the associated `classViewStack`.
      
      See `propertyViewStack:visible-child`.
  
      Params:
        page = a stack page within the associated stack
  */
  void setSelectedPage(adw.view_stack_page.ViewStackPage page)
  {
    adw_view_stack_pages_set_selected_page(cast(AdwViewStackPages*)this._cPtr, page ? cast(AdwViewStackPage*)page._cPtr(No.Dup) : null);
  }
}
