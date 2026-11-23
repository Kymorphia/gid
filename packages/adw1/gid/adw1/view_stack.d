/// Module for [ViewStack] class
module gid.adw1.view_stack;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.adw1.view_stack_page;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.widget;

/**
    A view container for [gid.adw1.view_switcher.ViewSwitcher].
    
    [gid.adw1.view_stack.ViewStack] is a container which only shows one page at a time.
    It is typically used to hold an application's main views.
    
    It doesn't provide a way to transition between pages.
    Instead, a separate widget such as [gid.adw1.view_switcher.ViewSwitcher],
    [gid.adw1.inline_view_switcher.InlineViewSwitcher] or [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] can be used with
    [gid.adw1.view_stack.ViewStack] to provide this functionality.
    
    [gid.adw1.view_stack.ViewStack] pages can have a title, an icon, an attention request, and a
    numbered badge that [gid.adw1.view_switcher.ViewSwitcher] will use to let users identify which
    page is which. Set them using the [gid.adw1.view_stack_page.ViewStackPage.title],
    [gid.adw1.view_stack_page.ViewStackPage.iconName],
    [gid.adw1.view_stack_page.ViewStackPage.needsAttention], and
    [gid.adw1.view_stack_page.ViewStackPage.badgeNumber] properties.
    
    [gid.adw1.view_stack.ViewStack] pages can also be grouped into sections, using the
    [gid.adw1.view_stack_page.ViewStackPage.startsSection] and
    [gid.adw1.view_stack_page.ViewStackPage.sectionTitle] properties. Currently, only
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] displays groups.
    
    Unlike [gid.gtk4.stack.Stack], transitions between views can only be animated via
    a crossfade and size changes are always interpolated. Animations are disabled
    by default. Use [gid.adw1.view_stack.ViewStack.enableTransitions] to enable them.
    
    [gid.adw1.view_stack.ViewStack] maintains a [gid.adw1.view_stack_page.ViewStackPage] object for each added child,
    which holds additional per-child properties. You obtain the
    [gid.adw1.view_stack_page.ViewStackPage] for a child with [gid.adw1.view_stack.ViewStack.getPage] and you
    can obtain a [gid.gtk4.selection_model.SelectionModel] containing all the pages with
    [gid.adw1.view_stack.ViewStack.getPages].
    
    ## AdwViewStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create
    [gid.adw1.view_stack_page.ViewStackPage] objects explicitly, and set the child widget as a
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
    
    [gid.adw1.view_stack.ViewStack] has a single CSS node named `stack`.
    
    ## Accessibility
    
    [gid.adw1.view_stack.ViewStack] uses the `enum@Gtk.AccessibleRole.tab-panel` for the stack
    pages which are the accessible parent objects of the child widgets.
*/
class ViewStack : gid.gtk4.widget.Widget
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
    return cast(void function())adw_view_stack_get_type != &gidSymbolNotFound ? adw_view_stack_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwViewStack";
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewStack self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.view_stack.ViewStack]
      Returns: New builder object
  */
  static ViewStackGidBuilder builder() nothrow
  {
    return new ViewStackGidBuilder;
  }

  /**
      Get `enableTransitions` property.
      Returns: Whether the stack uses a crossfade transition between pages.
        
        Use [gid.adw1.view_stack.ViewStack.transitionDuration] to control the duration, and
        [gid.adw1.view_stack.ViewStack.transitionRunning] to know when the transition is
        running.
  */
  @property bool enableTransitions() nothrow
  {
    return getEnableTransitions();
  }

  /**
      Set `enableTransitions` property.
      Params:
        propval = Whether the stack uses a crossfade transition between pages.
          
          Use [gid.adw1.view_stack.ViewStack.transitionDuration] to control the duration, and
          [gid.adw1.view_stack.ViewStack.transitionRunning] to know when the transition is
          running.
  */
  @property void enableTransitions(bool propval) nothrow
  {
    setEnableTransitions(propval);
  }

  /**
      Get `hhomogeneous` property.
      Returns: Whether the stack is horizontally homogeneous.
        
        If the stack is horizontally homogeneous, it allocates the same width for
        all children.
        
        If it's `FALSE`, the stack may change width when a different child becomes
        visible.
  */
  @property bool hhomogeneous() nothrow
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
  @property void hhomogeneous(bool propval) nothrow
  {
    setHhomogeneous(propval);
  }

  /**
      Get `pages` property.
      Returns: A selection model with the stack's pages.
        
        This can be used to keep an up-to-date view.
        
        The model implements [gid.gtk4.section_model.SectionModel] and creates sections based on
        [gid.adw1.view_stack_page.ViewStackPage.startsSection] values.
        
        The model also implements [gid.gtk4.selection_model.SelectionModel] and can be used to
        track and change the visible page.
  */
  @property gid.gtk4.selection_model.SelectionModel pages() nothrow
  {
    return getPages();
  }

  /**
      Get `transitionDuration` property.
      Returns: The transition animation duration, in milliseconds.
        
        Only used when [gid.adw1.view_stack.ViewStack.enableTransitions] is set to `TRUE`.
  */
  @property uint transitionDuration() nothrow
  {
    return getTransitionDuration();
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The transition animation duration, in milliseconds.
          
          Only used when [gid.adw1.view_stack.ViewStack.enableTransitions] is set to `TRUE`.
  */
  @property void transitionDuration(uint propval) nothrow
  {
    setTransitionDuration(propval);
  }

  /**
      Get `transitionRunning` property.
      Returns: Whether a transition is currently running.
        
        If a transition is impossible, the property value will be set to `TRUE` and
        then immediately to `FALSE`, so it's possible to rely on its notifications
        to know that a transition has happened.
  */
  @property bool transitionRunning() nothrow
  {
    return getTransitionRunning();
  }

  /**
      Get `vhomogeneous` property.
      Returns: Whether the stack is vertically homogeneous.
        
        If the stack is vertically homogeneous, it allocates the same height for
        all children.
        
        If it's `FALSE`, the stack may change height when a different child becomes
        visible.
  */
  @property bool vhomogeneous() nothrow
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
  @property void vhomogeneous(bool propval) nothrow
  {
    setVhomogeneous(propval);
  }

  /**
      Get `visibleChild` property.
      Returns: The widget currently visible in the stack.
  */
  @property gid.gtk4.widget.Widget visibleChild() nothrow
  {
    return getVisibleChild();
  }

  /**
      Set `visibleChild` property.
      Params:
        propval = The widget currently visible in the stack.
  */
  @property void visibleChild(gid.gtk4.widget.Widget propval) nothrow
  {
    setVisibleChild(propval);
  }

  /**
      Get `visibleChildName` property.
      Returns: The name of the widget currently visible in the stack.
        
        See [gid.adw1.view_stack.ViewStack.visibleChild].
  */
  @property string visibleChildName() nothrow
  {
    return getVisibleChildName();
  }

  /**
      Set `visibleChildName` property.
      Params:
        propval = The name of the widget currently visible in the stack.
          
          See [gid.adw1.view_stack.ViewStack.visibleChild].
  */
  @property void visibleChildName(string propval) nothrow
  {
    setVisibleChildName(propval);
  }

  /**
      Creates a new [gid.adw1.view_stack.ViewStack].
      Returns: the newly created [gid.adw1.view_stack.ViewStack]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_view_stack_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
      Returns: the [gid.adw1.view_stack_page.ViewStackPage] for child
  */
  gid.adw1.view_stack_page.ViewStackPage add(gid.gtk4.widget.Widget child) nothrow
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_add(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name.
  
      Params:
        child = the widget to add
        name = the name for child
      Returns: the [gid.adw1.view_stack_page.ViewStackPage] for child
  */
  gid.adw1.view_stack_page.ViewStackPage addNamed(gid.gtk4.widget.Widget child, string name = null) nothrow
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = adw_view_stack_add_named(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name. The title will be used by
      [gid.adw1.view_switcher.ViewSwitcher] to represent child, so it should be short.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
      Returns: the [gid.adw1.view_stack_page.ViewStackPage] for child
  */
  gid.adw1.view_stack_page.ViewStackPage addTitled(gid.gtk4.widget.Widget child, string name, string title) nothrow
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_view_stack_add_titled(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to self.
      
      The child is identified by the name. The title and icon_name will be used
      by [gid.adw1.view_switcher.ViewSwitcher] to represent child.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
        iconName = an icon name for child
      Returns: the [gid.adw1.view_stack_page.ViewStackPage] for child
  */
  gid.adw1.view_stack_page.ViewStackPage addTitledWithIcon(gid.gtk4.widget.Widget child, string name, string title, string iconName) nothrow
  {
    AdwViewStackPage* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_view_stack_add_titled_with_icon(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title, _iconName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the child with name in self.
  
      Params:
        name = the name of the child to find
      Returns: the requested child
  */
  gid.gtk4.widget.Widget getChildByName(string name) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_view_stack_get_child_by_name(cast(AdwViewStack*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self uses a crossfade transition between pages.
      
      Use [gid.adw1.view_stack.ViewStack.transitionDuration] to control the duration, and
      [gid.adw1.view_stack.ViewStack.transitionRunning] to know when the transition is
      running.
      Returns: whether to enable page transitions
  */
  bool getEnableTransitions() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_enable_transitions(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is horizontally homogeneous.
      Returns: whether self is horizontally homogeneous
  */
  bool getHhomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_hhomogeneous(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.adw1.view_stack_page.ViewStackPage] object for child.
  
      Params:
        child = a child of self
      Returns: the page object for child
  */
  gid.adw1.view_stack_page.ViewStackPage getPage(gid.gtk4.widget.Widget child) nothrow
  {
    AdwViewStackPage* _cretval;
    _cretval = adw_view_stack_get_page(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack_page.ViewStackPage)(cast(AdwViewStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gid.gio2.list_model.ListModel] that contains the pages of the stack.
      
      This can be used to keep an up-to-date view.
      
      The model implements [gid.gtk4.section_model.SectionModel] and creates sections based on
      [gid.adw1.view_stack_page.ViewStackPage.startsSection] values.
      
      The model also implements [gid.gtk4.selection_model.SelectionModel] and can be used to track
      and change the visible page.
      Returns: a [gid.gtk4.selection_model.SelectionModel] for the stack's children
  */
  gid.gtk4.selection_model.SelectionModel getPages() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_view_stack_get_pages(cast(AdwViewStack*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the transition animation duration for self.
      Returns: the transition duration, in milliseconds
  */
  uint getTransitionDuration() nothrow
  {
    uint _retval;
    _retval = adw_view_stack_get_transition_duration(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a transition is currently running for self.
      
      If a transition is impossible, the property value will be set to `TRUE` and
      then immediately to `FALSE`, so it's possible to rely on its notifications
      to know that a transition has happened.
      Returns: whether a transition is currently running
  */
  bool getTransitionRunning() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_transition_running(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is vertically homogeneous.
      Returns: whether self is vertically homogeneous
  */
  bool getVhomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_get_vhomogeneous(cast(AdwViewStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible child of self.
      Returns: the visible child
  */
  gid.gtk4.widget.Widget getVisibleChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_stack_get_visible_child(cast(AdwViewStack*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the currently visible child of self.
      Returns: the name of the visible child
  */
  string getVisibleChildName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_get_visible_child_name(cast(AdwViewStack*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Removes a child widget from self.
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    adw_view_stack_remove(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self uses a crossfade transition between pages.
  
      Params:
        enableTransitions = whether to enable page transitions
  */
  void setEnableTransitions(bool enableTransitions) nothrow
  {
    adw_view_stack_set_enable_transitions(cast(AdwViewStack*)this._cPtr, enableTransitions);
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
  void setHhomogeneous(bool hhomogeneous) nothrow
  {
    adw_view_stack_set_hhomogeneous(cast(AdwViewStack*)this._cPtr, hhomogeneous);
  }

  /**
      Sets the transition animation duration for self.
      
      Only used when [gid.adw1.view_stack.ViewStack.enableTransitions] is set to `TRUE`.
  
      Params:
        duration = the new duration, in milliseconds
  */
  void setTransitionDuration(uint duration) nothrow
  {
    adw_view_stack_set_transition_duration(cast(AdwViewStack*)this._cPtr, duration);
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
  void setVhomogeneous(bool vhomogeneous) nothrow
  {
    adw_view_stack_set_vhomogeneous(cast(AdwViewStack*)this._cPtr, vhomogeneous);
  }

  /**
      Makes child the visible child of self.
  
      Params:
        child = a child of self
  */
  void setVisibleChild(gid.gtk4.widget.Widget child) nothrow
  {
    adw_view_stack_set_visible_child(cast(AdwViewStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Makes the child with name visible.
      
      See [gid.adw1.view_stack.ViewStack.visibleChild].
  
      Params:
        name = the name of the child
  */
  void setVisibleChildName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    adw_view_stack_set_visible_child_name(cast(AdwViewStack*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.adw1.view_stack.ViewStack]
class ViewStackGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `enableTransitions` property.
      Params:
        propval = Whether the stack uses a crossfade transition between pages.
          
          Use [gid.adw1.view_stack.ViewStack.transitionDuration] to control the duration, and
          [gid.adw1.view_stack.ViewStack.transitionRunning] to know when the transition is
          running.
      Returns: Builder instance for fluent chaining
  */
  T enableTransitions(bool propval) nothrow
  {
    return setProperty("enable-transitions", propval);
  }

  /**
      Set `hhomogeneous` property.
      Params:
        propval = Whether the stack is horizontally homogeneous.
          
          If the stack is horizontally homogeneous, it allocates the same width for
          all children.
          
          If it's `FALSE`, the stack may change width when a different child becomes
          visible.
      Returns: Builder instance for fluent chaining
  */
  T hhomogeneous(bool propval) nothrow
  {
    return setProperty("hhomogeneous", propval);
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The transition animation duration, in milliseconds.
          
          Only used when [gid.adw1.view_stack.ViewStack.enableTransitions] is set to `TRUE`.
      Returns: Builder instance for fluent chaining
  */
  T transitionDuration(uint propval) nothrow
  {
    return setProperty("transition-duration", propval);
  }

  /**
      Set `vhomogeneous` property.
      Params:
        propval = Whether the stack is vertically homogeneous.
          
          If the stack is vertically homogeneous, it allocates the same height for
          all children.
          
          If it's `FALSE`, the stack may change height when a different child becomes
          visible.
      Returns: Builder instance for fluent chaining
  */
  T vhomogeneous(bool propval) nothrow
  {
    return setProperty("vhomogeneous", propval);
  }

  /**
      Set `visibleChild` property.
      Params:
        propval = The widget currently visible in the stack.
      Returns: Builder instance for fluent chaining
  */
  T visibleChild(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("visible-child", propval);
  }

  /**
      Set `visibleChildName` property.
      Params:
        propval = The name of the widget currently visible in the stack.
          
          See [gid.adw1.view_stack.ViewStack.visibleChild].
      Returns: Builder instance for fluent chaining
  */
  T visibleChildName(string propval) nothrow
  {
    return setProperty("visible-child-name", propval);
  }
}

/// Fluent builder for [gid.adw1.view_stack.ViewStack]
final class ViewStackGidBuilder : ViewStackGidBuilderImpl!ViewStackGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewStack build() nothrow
  {
    return new ViewStack(cast(void*)createGObject(ViewStack._getGType), Yes.Take);
  }
}
