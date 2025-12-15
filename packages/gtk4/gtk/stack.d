/// Module for [Stack] class
module gtk.stack;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.selection_model;
import gtk.stack_page;
import gtk.types;
import gtk.widget;

/**
    [gtk.stack.Stack] is a container which only shows one of its children
    at a time.
    
    In contrast to [gtk.notebook.Notebook], [gtk.stack.Stack] does not provide a means
    for users to change the visible child. Instead, a separate widget
    such as [gtk.stack_switcher.StackSwitcher] or [gtk.stack_sidebar.StackSidebar] can
    be used with [gtk.stack.Stack] to provide this functionality.
    
    Transitions between pages can be animated as slides or fades. This
    can be controlled with [gtk.stack.Stack.setTransitionType].
    These animations respect the `property@Gtk.Settings:gtk-enable-animations`
    setting.
    
    [gtk.stack.Stack] maintains a [gtk.stack_page.StackPage] object for each added
    child, which holds additional per-child properties. You
    obtain the [gtk.stack_page.StackPage] for a child with [gtk.stack.Stack.getPage]
    and you can obtain a [gtk.selection_model.SelectionModel] containing all the pages
    with [gtk.stack.Stack.getPages].
    
    # GtkStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create [gtk.stack_page.StackPage]
    objects explicitly, and set the child widget as a property on it:
    
    ```xml
      <object class="GtkStack" id="stack">
        <child>
          <object class="GtkStackPage">
            <property name="name">page1</property>
            <property name="title">In the beginning…</property>
            <property name="child">
              <object class="GtkLabel">
                <property name="label">It was dark</property>
              </object>
            </property>
          </object>
        </child>
    ```
    
    # CSS nodes
    
    [gtk.stack.Stack] has a single CSS node named stack.
    
    # Accessibility
    
    [gtk.stack.Stack] uses the [gtk.types.AccessibleRole.TabPanel] for the stack
    pages, which are the accessible parent objects of the child widgets.
*/
class Stack : gtk.widget.Widget
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
    return cast(void function())gtk_stack_get_type != &gidSymbolNotFound ? gtk_stack_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Stack self()
  {
    return this;
  }

  /**
      Get `hhomogeneous` property.
      Returns: true if the stack allocates the same width for all children.
  */
  @property bool hhomogeneous()
  {
    return getHhomogeneous();
  }

  /**
      Set `hhomogeneous` property.
      Params:
        propval = true if the stack allocates the same width for all children.
  */
  @property void hhomogeneous(bool propval)
  {
    return setHhomogeneous(propval);
  }

  /**
      Get `interpolateSize` property.
      Returns: Whether or not the size should smoothly change during the transition.
  */
  @property bool interpolateSize()
  {
    return getInterpolateSize();
  }

  /**
      Set `interpolateSize` property.
      Params:
        propval = Whether or not the size should smoothly change during the transition.
  */
  @property void interpolateSize(bool propval)
  {
    return setInterpolateSize(propval);
  }

  /**
      Get `pages` property.
      Returns: A selection model with the stack pages.
  */
  @property gtk.selection_model.SelectionModel pages()
  {
    return getPages();
  }

  /**
      Get `transitionDuration` property.
      Returns: The animation duration, in milliseconds.
  */
  @property uint transitionDuration()
  {
    return getTransitionDuration();
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The animation duration, in milliseconds.
  */
  @property void transitionDuration(uint propval)
  {
    return setTransitionDuration(propval);
  }

  /**
      Get `transitionRunning` property.
      Returns: Whether or not the transition is currently running.
  */
  @property bool transitionRunning()
  {
    return getTransitionRunning();
  }

  /**
      Get `transitionType` property.
      Returns: The type of animation used to transition.
  */
  @property gtk.types.StackTransitionType transitionType()
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used to transition.
  */
  @property void transitionType(gtk.types.StackTransitionType propval)
  {
    return setTransitionType(propval);
  }

  /**
      Get `vhomogeneous` property.
      Returns: true if the stack allocates the same height for all children.
  */
  @property bool vhomogeneous()
  {
    return getVhomogeneous();
  }

  /**
      Set `vhomogeneous` property.
      Params:
        propval = true if the stack allocates the same height for all children.
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
  */
  @property string visibleChildName()
  {
    return getVisibleChildName();
  }

  /**
      Set `visibleChildName` property.
      Params:
        propval = The name of the widget currently visible in the stack.
  */
  @property void visibleChildName(string propval)
  {
    return setVisibleChildName(propval);
  }

  /**
      Creates a new [gtk.stack.Stack].
      Returns: a new [gtk.stack.Stack]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to stack.
  
      Params:
        child = the widget to add
      Returns: the [gtk.stack_page.StackPage] for child
  */
  gtk.stack_page.StackPage addChild(gtk.widget.Widget child)
  {
    GtkStackPage* _cretval;
    _cretval = gtk_stack_add_child(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack_page.StackPage)(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to stack.
      
      The child is identified by the name.
  
      Params:
        child = the widget to add
        name = the name for child
      Returns: the [gtk.stack_page.StackPage] for child
  */
  gtk.stack_page.StackPage addNamed(gtk.widget.Widget child, string name = null)
  {
    GtkStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_stack_add_named(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack_page.StackPage)(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child to stack.
      
      The child is identified by the name. The title
      will be used by [gtk.stack_switcher.StackSwitcher] to represent
      child in a tab bar, so it should be short.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
      Returns: the [gtk.stack_page.StackPage] for child
  */
  gtk.stack_page.StackPage addTitled(gtk.widget.Widget child, string name, string title)
  {
    GtkStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_stack_add_titled(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack_page.StackPage)(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the child with the name given as the argument.
      
      Returns null if there is no child with this name.
  
      Params:
        name = the name of the child to find
      Returns: the requested child
          of the [gtk.stack.Stack]
  */
  gtk.widget.Widget getChildByName(string name)
  {
    GtkWidget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_stack_get_child_by_name(cast(GtkStack*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether stack is horizontally homogeneous.
      Returns: whether stack is horizontally homogeneous.
  */
  bool getHhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_hhomogeneous(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gtk.stack.Stack] is set up to interpolate between
      the sizes of children on page switch.
      Returns: true if child sizes are interpolated
  */
  bool getInterpolateSize()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_interpolate_size(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gtk.stack_page.StackPage] object for child.
  
      Params:
        child = a child of stack
      Returns: the [gtk.stack_page.StackPage] for child
  */
  gtk.stack_page.StackPage getPage(gtk.widget.Widget child)
  {
    GtkStackPage* _cretval;
    _cretval = gtk_stack_get_page(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack_page.StackPage)(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages of the stack.
      
      This can be used to keep an up-to-date view. The model also
      implements [gtk.selection_model.SelectionModel] and can be used to track
      and modify the visible page.
      Returns: a [gtk.selection_model.SelectionModel] for the stack's children
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_stack_get_pages(cast(GtkStack*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the amount of time (in milliseconds) that
      transitions between pages in stack will take.
      Returns: the transition duration
  */
  uint getTransitionDuration()
  {
    uint _retval;
    _retval = gtk_stack_get_transition_duration(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the stack is currently in a transition from one page to
      another.
      Returns: true if the transition is currently running, false otherwise.
  */
  bool getTransitionRunning()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_transition_running(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of animation that will be used
      for transitions between pages in stack.
      Returns: the current transition type of stack
  */
  gtk.types.StackTransitionType getTransitionType()
  {
    GtkStackTransitionType _cretval;
    _cretval = gtk_stack_get_transition_type(cast(GtkStack*)this._cPtr);
    gtk.types.StackTransitionType _retval = cast(gtk.types.StackTransitionType)_cretval;
    return _retval;
  }

  /**
      Gets whether stack is vertically homogeneous.
      Returns: whether stack is vertically homogeneous.
  */
  bool getVhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_vhomogeneous(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible child of stack.
      
      Returns null if there are no visible children.
      Returns: the visible child of the [gtk.stack.Stack]
  */
  gtk.widget.Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_get_visible_child(cast(GtkStack*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the currently visible child of stack.
      
      Returns null if there is no visible child.
      Returns: the name of the visible child
          of the [gtk.stack.Stack]
  */
  string getVisibleChildName()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_get_visible_child_name(cast(GtkStack*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes a child widget from stack.
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    gtk_stack_remove(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.stack.Stack] to be horizontally homogeneous or not.
      
      If it is homogeneous, the [gtk.stack.Stack] will request the same
      width for all its children. If it isn't, the stack
      may change width when a different child becomes visible.
  
      Params:
        hhomogeneous = true to make stack horizontally homogeneous
  */
  void setHhomogeneous(bool hhomogeneous)
  {
    gtk_stack_set_hhomogeneous(cast(GtkStack*)this._cPtr, hhomogeneous);
  }

  /**
      Sets whether or not stack will interpolate its size when
      changing the visible child.
      
      If the `propertyGtk.Stack:interpolate-size` property is set
      to true, stack will interpolate its size between the current
      one and the one it'll take after changing the visible child,
      according to the set transition duration.
  
      Params:
        interpolateSize = the new value
  */
  void setInterpolateSize(bool interpolateSize)
  {
    gtk_stack_set_interpolate_size(cast(GtkStack*)this._cPtr, interpolateSize);
  }

  /**
      Sets the duration that transitions between pages in stack
      will take.
  
      Params:
        duration = the new duration, in milliseconds
  */
  void setTransitionDuration(uint duration)
  {
    gtk_stack_set_transition_duration(cast(GtkStack*)this._cPtr, duration);
  }

  /**
      Sets the type of animation that will be used for
      transitions between pages in stack.
      
      Available types include various kinds of fades and slides.
      
      The transition type can be changed without problems
      at runtime, so it is possible to change the animation
      based on the page that is about to become current.
  
      Params:
        transition = the new transition type
  */
  void setTransitionType(gtk.types.StackTransitionType transition)
  {
    gtk_stack_set_transition_type(cast(GtkStack*)this._cPtr, transition);
  }

  /**
      Sets the [gtk.stack.Stack] to be vertically homogeneous or not.
      
      If it is homogeneous, the [gtk.stack.Stack] will request the same
      height for all its children. If it isn't, the stack
      may change height when a different child becomes visible.
  
      Params:
        vhomogeneous = true to make stack vertically homogeneous
  */
  void setVhomogeneous(bool vhomogeneous)
  {
    gtk_stack_set_vhomogeneous(cast(GtkStack*)this._cPtr, vhomogeneous);
  }

  /**
      Makes child the visible child of stack.
      
      If child is different from the currently visible child,
      the transition between the two will be animated with the
      current transition type of stack.
      
      Note that the child widget has to be visible itself
      (see [gtk.widget.Widget.show]) in order to become the visible
      child of stack.
  
      Params:
        child = a child of stack
  */
  void setVisibleChild(gtk.widget.Widget child)
  {
    gtk_stack_set_visible_child(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Makes the child with the given name visible.
      
      Note that the child widget has to be visible itself
      (see [gtk.widget.Widget.show]) in order to become the visible
      child of stack.
  
      Params:
        name = the name of the child to make visible
        transition = the transition type to use
  */
  void setVisibleChildFull(string name, gtk.types.StackTransitionType transition)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_stack_set_visible_child_full(cast(GtkStack*)this._cPtr, _name, transition);
  }

  /**
      Makes the child with the given name visible.
      
      If child is different from the currently visible child,
      the transition between the two will be animated with the
      current transition type of stack.
      
      Note that the child widget has to be visible itself
      (see [gtk.widget.Widget.show]) in order to become the visible
      child of stack.
  
      Params:
        name = the name of the child to make visible
  */
  void setVisibleChildName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_stack_set_visible_child_name(cast(GtkStack*)this._cPtr, _name);
  }
}
