/// Module for [StackSidebar] class
module gtk.stack_sidebar;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.stack;
import gtk.types;
import gtk.widget;

/**
    A [gtk.stack_sidebar.StackSidebar] uses a sidebar to switch between [gtk.stack.Stack] pages.
    
    In order to use a [gtk.stack_sidebar.StackSidebar], you simply use a [gtk.stack.Stack] to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gtk.stack_sidebar.StackSidebar.setStack] to connect the [gtk.stack_sidebar.StackSidebar]
    to the [gtk.stack.Stack].
    
    # CSS nodes
    
    [gtk.stack_sidebar.StackSidebar] has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, [gtk.stack_sidebar.StackSidebar] adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
class StackSidebar : gtk.widget.Widget
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
    return cast(void function())gtk_stack_sidebar_get_type != &gidSymbolNotFound ? gtk_stack_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StackSidebar self()
  {
    return this;
  }

  /**
  Get builder for [gtk.stack_sidebar.StackSidebar]
  Returns: New builder object
  */
  static StackSidebarGidBuilder builder()
  {
    return new StackSidebarGidBuilder;
  }

  /**
      Get `stack` property.
      Returns: The stack.
  */
  @property gtk.stack.Stack stack()
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack.
  */
  @property void stack(gtk.stack.Stack propval)
  {
    setStack(propval);
  }

  /**
      Creates a new [gtk.stack_sidebar.StackSidebar].
      Returns: the new [gtk.stack_sidebar.StackSidebar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
      Returns: the associated [gtk.stack.Stack] or
          null if none has been set explicitly
  */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_sidebar_get_stack(cast(GtkStackSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the [gtk.stack.Stack] associated with this [gtk.stack_sidebar.StackSidebar].
      
      The sidebar widget will automatically update according to
      the order and items within the given [gtk.stack.Stack].
  
      Params:
        stack = a [gtk.stack.Stack]
  */
  void setStack(gtk.stack.Stack stack)
  {
    gtk_stack_sidebar_set_stack(cast(GtkStackSidebar*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}

class StackSidebarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `stack` property.
      Params:
        propval = The stack.
      Returns: Builder instance for fluent chaining
  */
  T stack(gtk.stack.Stack propval)
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gtk.stack_sidebar.StackSidebar]
final class StackSidebarGidBuilder : StackSidebarGidBuilderImpl!StackSidebarGidBuilder
{
  StackSidebar build()
  {
    return new StackSidebar(cast(void*)createGObject(StackSidebar._getGType), No.Take);
  }
}
