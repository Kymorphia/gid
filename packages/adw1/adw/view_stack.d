/// Module for [ViewStack] class
module adw.view_stack;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack_page;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.selection_model;
import gtk.widget;

/**
    A view container for `class@ViewSwitcher`.
    
    [adw.view_stack.ViewStack] is a container which only shows one page at a time.
    It is typically used to hold an application's main views.
    
    It doesn't provide a way to transition between pages.
    Instead, a separate widget such as `class@ViewSwitcher` can be used with
    [adw.view_stack.ViewStack] to provide this functionality.
    
    [adw.view_stack.ViewStack] pages can have a title, an icon, an attention request, and a
    numbered badge that `class@ViewSwitcher` will use to let users identify which
    page is which. Set them using the `property@ViewStackPage:title`,
    `property@ViewStackPage:icon-name`,
    `property@ViewStackPage:needs-attention`, and
    `property@ViewStackPage:badge-number` properties.
    
    Unlike [gtk.stack.Stack], transitions between views are not animated.
    
    [adw.view_stack.ViewStack] maintains a `class@ViewStackPage` object for each added child,
    which holds additional per-child properties. You obtain the
    `class@ViewStackPage` for a child with [adw.view_stack.ViewStack.getPage] and you
    can obtain a [gtk.selection_model.SelectionModel] containing all the pages with
    [adw.view_stack.ViewStack.getPages].
    
    ## AdwViewStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create
    `class@ViewStackPage` objects explicitly, and set the child widget as a
    property on it:
    
    ```xml
      <object class="AdwViewStack" id="stack">
        <child>
          <object class="AdwViewStackPage">
            <property name="name">overview</property>
            <property name="title">Overview</property>
            <property name="child">
              <object class="AdwStatusPage">
                <property name="title">Welcome!</property>
              </object>
            </property>
          </object>
        </child>
      </object>
    ```
    
    ## CSS nodes
    
    [adw.view_stack.ViewStack] has a single CSS node named `stack`.
    
    ## Accessibility
    
    [adw.view_stack.ViewStack] uses the [gtk.types.AccessibleRole.TabPanel] for the stack pages
    which are the accessible parent objects of the child widgets.
*/
class ViewStack : gtk.widget.Widget
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
    return cast(void function())adw_view_stack_get_type != &gidSymbolNotFound ? adw_view_stack_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewStack self()
  {
    return this;
  }

  /**
      Get `hhomogeneous` property.
      Returns: Whether the stack is horizontally homogeneous.
      
      If the stack is horizontally homogeneous, it allocates the same width for
      all children.
      
      If it's `FALSE`, the stack may change width when a different child becomes
      visible.
  */
  @property bool hhomogeneous()
  {
    return getHhomogeneous();
  }

  /**
      Set `hhomogeneous` property.
      Params:
        propval = Whether the stack is horizontally homogeneous.
        
        If the stack is horizontally homogeneous, it allocates the same width for
        all children.
        
        If it's `FALSE`, the stack may change width when a different child becomes
        visible.
  */
  @property void hhomogeneous(bool propval)
  {
    return setHhomogeneous(propval);
  }

  /**
      Get `pages` property.
      Returns: A selection model with the stack's pages.
      
      This can be used to keep an up-to-date view. The model also implements
      [gtk.selection_model.SelectionModel] and can be used to track and change the visible
      page.
  */
  @property gtk.selection_model.SelectionModel pages()
  {
    return getPages();
  }

  /**
      Get `vhomogeneous` property.
      Returns: Whether the stack is vertically homogeneous.
      
      If the stack is vertically homogeneous, it allocates the same height for
      all children.
      
      If it's `FALSE`, the stack may change height when a different child becomes
      visible.
  */
  @property bool vhomogeneous()
  {
    return getVhomogeneous();
  }

  /**
      Set `vhomogeneous` property.
      Params:
        propval = Whether the stack is vertically homogeneous.
        
        If the stack is vertically homogeneous, it allocates the same height for
        all children.
        
        If it's `FALSE`, the stack may change height when a different child becomes
        visible.
  */
  @property void vhomogeneous(bool propval)
  {
    return setVhomogeneous(propval);
  }

  /**
      Get `visibleChild` property.
      Returns: The widget currently visible in the stack.
  */
  @property gtk.widget.Widget visibleChild()
  {
    return getVisibleChild();
  }

  /**
      Set `visibleChild` property.
      Params:
        propval = The widget currently visible in the stack.
  */
  @property void visibleChild(gtk.widget.Widget propval)
  {
    return setVisibleChild(propval);
  }

  /**
      Get `visibleChildName` property.
      Returns: The name of the widget currently visible in the stack.
      
      See `property@ViewStack:visible-child`.
  */
  @property string visibleChildName()
  {
    return getVisibleChildName();
  }

  /**
      Set `visibleChildName` property.
      Params:
        propval = The name of the widget currently visible in the stack.
        
        See `property@ViewStack:visible-child`.
  */
  @property void visibleChildName(string propval)
  {
    return setVisibleChildName(propval);
  }

  /**
      Creates a new [adw.view_stack.ViewStack].
      Returns: the newly created [adw.view_stack.ViewStack]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_stack_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
      Returns: the `classViewStackPage` for child
  */
  adw.view_stack_page.ViewStackPage add(gtk.widget.Widget child)
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_add(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name.
  
      Params:
        child = the widget to add
        name = the name for child
      Returns: the [adw.view_stack_page.ViewStackPage] for child
  */
  adw.view_stack_page.ViewStackPage addNamed(gtk.widget.Widget child, string name = null)
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = adw_view_stack_add_named(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name. The title will be used by
      `classViewSwitcher` to represent child, so it should be short.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
      Returns: the [adw.view_stack_page.ViewStackPage] for child
  */
  adw.view_stack_page.ViewStackPage addTitled(gtk.widget.Widget child, string name, string title)
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = adw_view_stack_add_titled(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name. The title and icon_name will be used
      by `classViewSwitcher` to represent child.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
        iconName = an icon name for child
      Returns: the [adw.view_stack_page.ViewStackPage] for child
  */
  adw.view_stack_page.ViewStackPage addTitledWithIcon(gtk.widget.Widget child, string name, string title, string iconName)
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = adw_view_stack_add_titled_with_icon(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title, _iconName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the child with name in self.
  
      Params:
        name = the name of the child to find
      Returns: the requested child
  */
  gtk.widget.Widget getChildByName(string name)
  {
    GtkWidget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = adw_view_stack_get_child_by_name(cast(AdwViewStack*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self is horizontally homogeneous.
      Returns: whether self is horizontally homogeneous
  */
  bool getHhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_hhomogeneous(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `classViewStackPage` object for child.
  
      Params:
        child = a child of self
      Returns: the page object for child
  */
  adw.view_stack_page.ViewStackPage getPage(gtk.widget.Widget child)
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_get_page(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages of the stack.
      
      This can be used to keep an up-to-date view. The model also implements
      [gtk.selection_model.SelectionModel] and can be used to track and change the visible
      page.
      Returns: a [gtk.selection_model.SelectionModel] for the stack's children
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_view_stack_get_pages(cast(AdwViewStack*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether self is vertically homogeneous.
      Returns: whether self is vertically homogeneous
  */
  bool getVhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_vhomogeneous(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible child of self.
      Returns: the visible child
  */
  gtk.widget.Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_stack_get_visible_child(cast(AdwViewStack*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the currently visible child of self.
      Returns: the name of the visible child
  */
  string getVisibleChildName()
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_get_visible_child_name(cast(AdwViewStack*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes a child widget from self.
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    adw_view_stack_remove(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets self to be horizontally homogeneous or not.
      
      If the stack is horizontally homogeneous, it allocates the same width for
      all children.
      
      If it's `FALSE`, the stack may change width when a different child becomes
      visible.
  
      Params:
        hhomogeneous = whether to make self horizontally homogeneous
  */
  void setHhomogeneous(bool hhomogeneous)
  {
    adw_view_stack_set_hhomogeneous(cast(AdwViewStack*)this._cPtr, hhomogeneous);
  }

  /**
      Sets self to be vertically homogeneous or not.
      
      If the stack is vertically homogeneous, it allocates the same height for
      all children.
      
      If it's `FALSE`, the stack may change height when a different child becomes
      visible.
  
      Params:
        vhomogeneous = whether to make self vertically homogeneous
  */
  void setVhomogeneous(bool vhomogeneous)
  {
    adw_view_stack_set_vhomogeneous(cast(AdwViewStack*)this._cPtr, vhomogeneous);
  }

  /**
      Makes child the visible child of self.
  
      Params:
        child = a child of self
  */
  void setVisibleChild(gtk.widget.Widget child)
  {
    adw_view_stack_set_visible_child(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Makes the child with name visible.
      
      See `propertyViewStack:visible-child`.
  
      Params:
        name = the name of the child
  */
  void setVisibleChildName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_view_stack_set_visible_child_name(cast(AdwViewStack*)this._cPtr, _name);
  }
}
