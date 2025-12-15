/// Module for [Stack] class
module gtk.stack;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    The GtkStack widget is a container which only shows
    one of its children at a time. In contrast to GtkNotebook,
    GtkStack does not provide a means for users to change the
    visible child. Instead, the #GtkStackSwitcher widget can be
    used with GtkStack to provide this functionality.
    
    Transitions between pages can be animated as slides or
    fades. This can be controlled with [gtk.stack.Stack.setTransitionType].
    These animations respect the #GtkSettings:gtk-enable-animations
    setting.
    
    The GtkStack widget was added in GTK+ 3.10.
    
    # CSS nodes
    
    GtkStack has a single CSS node named stack.
*/
class Stack : gtk.container.Container
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

  /** */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /** */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /** */
  @property bool interpolateSize()
  {
    return getInterpolateSize();
  }

  /** */
  @property void interpolateSize(bool propval)
  {
    return setInterpolateSize(propval);
  }

  /** */
  @property uint transitionDuration()
  {
    return getTransitionDuration();
  }

  /** */
  @property void transitionDuration(uint propval)
  {
    return setTransitionDuration(propval);
  }

  /** */
  @property bool transitionRunning()
  {
    return getTransitionRunning();
  }

  /** */
  @property gtk.types.StackTransitionType transitionType()
  {
    return getTransitionType();
  }

  /** */
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

  /** */
  @property gtk.widget.Widget visibleChild()
  {
    return getVisibleChild();
  }

  /** */
  @property void visibleChild(gtk.widget.Widget propval)
  {
    return setVisibleChild(propval);
  }

  /** */
  @property string visibleChildName()
  {
    return getVisibleChildName();
  }

  /** */
  @property void visibleChildName(string propval)
  {
    return setVisibleChildName(propval);
  }

  /**
      Creates a new #GtkStack container.
      Returns: a new #GtkStack
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to stack.
      The child is identified by the name.
  
      Params:
        child = the widget to add
        name = the name for child
  */
  void addNamed(gtk.widget.Widget child, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_stack_add_named(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name);
  }

  /**
      Adds a child to stack.
      The child is identified by the name. The title
      will be used by #GtkStackSwitcher to represent
      child in a tab bar, so it should be short.
  
      Params:
        child = the widget to add
        name = the name for child
        title = a human-readable title for child
  */
  void addTitled(gtk.widget.Widget child, string name, string title)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    gtk_stack_add_titled(cast(GtkStack*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _name, _title);
  }

  /**
      Finds the child of the #GtkStack with the name given as
      the argument. Returns null if there is no child with this
      name.
  
      Params:
        name = the name of the child to find
      Returns: the requested child of the #GtkStack
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
      See [gtk.stack.Stack.setHhomogeneous].
      Returns: whether stack is horizontally homogeneous.
  */
  bool getHhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_hhomogeneous(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether stack is homogeneous.
      See [gtk.stack.Stack.setHomogeneous].
      Returns: whether stack is homogeneous.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_homogeneous(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Returns wether the #GtkStack is set up to interpolate between
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
      See [gtk.stack.Stack.setVhomogeneous].
      Returns: whether stack is vertically homogeneous.
  */
  bool getVhomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_get_vhomogeneous(cast(GtkStack*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible child of stack, or null if
      there are no visible children.
      Returns: the visible child of the #GtkStack
  */
  gtk.widget.Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_get_visible_child(cast(GtkStack*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the currently visible child of stack, or
      null if there is no visible child.
      Returns: the name of the visible child of the #GtkStack
  */
  string getVisibleChildName()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_get_visible_child_name(cast(GtkStack*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the #GtkStack to be horizontally homogeneous or not.
      If it is homogeneous, the #GtkStack will request the same
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
      Sets the #GtkStack to be homogeneous or not. If it
      is homogeneous, the #GtkStack will request the same
      size for all its children. If it isn't, the stack
      may change size when a different child becomes visible.
      
      Since 3.16, homogeneity can be controlled separately
      for horizontal and vertical size, with the
      #GtkStack:hhomogeneous and #GtkStack:vhomogeneous.
  
      Params:
        homogeneous = true to make stack homogeneous
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_stack_set_homogeneous(cast(GtkStack*)this._cPtr, homogeneous);
  }

  /**
      Sets whether or not stack will interpolate its size when
      changing the visible child. If the #GtkStack:interpolate-size
      property is set to true, stack will interpolate its size between
      the current one and the one it'll take after changing the
      visible child, according to the set transition duration.
  
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
      transitions between pages in stack. Available
      types include various kinds of fades and slides.
      
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
      Sets the #GtkStack to be vertically homogeneous or not.
      If it is homogeneous, the #GtkStack will request the same
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
      
      If child is different from the currently
      visible child, the transition between the
      two will be animated with the current
      transition type of stack.
      
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
      
      If child is different from the currently
      visible child, the transition between the
      two will be animated with the current
      transition type of stack.
      
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
