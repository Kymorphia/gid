/// Module for [ViewStackPages] class
module gid.adw1.view_stack_pages;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.adw1.view_stack_page;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.section_model;
import gid.gtk4.section_model_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.selection_model_mixin;

/**
    An auxiliary class used by [gid.adw1.view_stack.ViewStack].
    
    See [gid.adw1.view_stack.ViewStack.pages].
*/
@gidGir("ViewStackPages", "ViewStackPagesClass")
class ViewStackPages : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel, gid.gtk4.selection_model.SelectionModel
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
    return cast(void function())adw_view_stack_pages_get_type != &gidSymbolNotFound ? adw_view_stack_pages_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwViewStackPages";
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewStackPages self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.view_stack_pages.ViewStackPages]
      Returns: New builder object
  */
  static ViewStackPagesGidBuilder builder() nothrow
  {
    return new ViewStackPagesGidBuilder;
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
      Get `selectedPage` property.
      Returns: The selected [gid.adw1.view_stack_page.ViewStackPage] within the [gid.adw1.view_stack_pages.ViewStackPages].
        
        This can be used to keep an up-to-date view of the [gid.adw1.view_stack_page.ViewStackPage] for
        The visible [gid.adw1.view_stack_page.ViewStackPage] within the associated [gid.adw1.view_stack_pages.ViewStackPages].
        
        This can be used to keep an up-to-date view of the visible child.
  */
  @property gid.adw1.view_stack_page.ViewStackPage selectedPage() nothrow
  {
    return getSelectedPage();
  }

  /**
      Set `selectedPage` property.
      Params:
        propval = The selected [gid.adw1.view_stack_page.ViewStackPage] within the [gid.adw1.view_stack_pages.ViewStackPages].
          
          This can be used to keep an up-to-date view of the [gid.adw1.view_stack_page.ViewStackPage] for
          The visible [gid.adw1.view_stack_page.ViewStackPage] within the associated [gid.adw1.view_stack_pages.ViewStackPages].
          
          This can be used to keep an up-to-date view of the visible child.
  */
  @property void selectedPage(gid.adw1.view_stack_page.ViewStackPage propval) nothrow
  {
    setSelectedPage(propval);
  }

  mixin ListModelT!();
  mixin SectionModelT!();
  mixin SelectionModelT!();

  /**
      Gets the [gid.adw1.view_stack_page.ViewStackPage] for the visible child of a view stack
      
      Gets the [gid.adw1.view_stack_page.ViewStackPage] for the visible child of the associated stack.
      
      Returns `NULL` if there's no selected page.
      Returns: the stack page
  */
  gid.adw1.view_stack_page.ViewStackPage getSelectedPage() nothrow
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_pages_get_selected_page(cast(AdwViewStackPages*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the visible child in the associated [gid.adw1.view_stack.ViewStack].
      
      See [gid.adw1.view_stack.ViewStack.visibleChild].
  
      Params:
        page = a stack page within the associated stack
  */
  void setSelectedPage(gid.adw1.view_stack_page.ViewStackPage page) nothrow
  {
    adw_view_stack_pages_set_selected_page(cast(AdwViewStackPages*)this._cPtr, page ? cast(AdwViewStackPage*)page._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.view_stack_pages.ViewStackPages]
class ViewStackPagesGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T, gid.gtk4.selection_model.SelectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();
  mixin SelectionModelGidBuilderT!();

  /**
      Set `selectedPage` property.
      Params:
        propval = The selected [gid.adw1.view_stack_page.ViewStackPage] within the [gid.adw1.view_stack_pages.ViewStackPages].
          
          This can be used to keep an up-to-date view of the [gid.adw1.view_stack_page.ViewStackPage] for
          The visible [gid.adw1.view_stack_page.ViewStackPage] within the associated [gid.adw1.view_stack_pages.ViewStackPages].
          
          This can be used to keep an up-to-date view of the visible child.
      Returns: Builder instance for fluent chaining
  */
  T selectedPage(gid.adw1.view_stack_page.ViewStackPage propval) nothrow
  {
    return setProperty("selected-page", propval);
  }
}

/// Fluent builder for [gid.adw1.view_stack_pages.ViewStackPages]
final class ViewStackPagesGidBuilder : ViewStackPagesGidBuilderImpl!ViewStackPagesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewStackPages build() nothrow
  {
    return new ViewStackPages(cast(void*)createGObject(ViewStackPages._getGType), Yes.Take);
  }
}
