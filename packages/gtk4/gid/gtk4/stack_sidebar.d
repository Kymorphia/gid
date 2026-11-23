/// Module for [StackSidebar] class
module gid.gtk4.stack_sidebar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.stack;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Uses a sidebar to switch between [gid.gtk4.stack.Stack] pages.
    
    <picture>
      <source srcset="sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkStackSidebar" src="sidebar.png">
    </picture>
    
    In order to use a [gid.gtk4.stack_sidebar.StackSidebar], you simply use a [gid.gtk4.stack.Stack] to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gid.gtk4.stack_sidebar.StackSidebar.setStack] to connect the [gid.gtk4.stack_sidebar.StackSidebar]
    to the [gid.gtk4.stack.Stack].
    
    # CSS nodes
    
    [gid.gtk4.stack_sidebar.StackSidebar] has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, [gid.gtk4.stack_sidebar.StackSidebar] adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
class StackSidebar : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_stack_sidebar_get_type != &gidSymbolNotFound ? gtk_stack_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStackSidebar";
  }

  /** Returns `this`, for use in `with` statements. */
  override StackSidebar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.stack_sidebar.StackSidebar]
      Returns: New builder object
  */
  static StackSidebarGidBuilder builder() nothrow
  {
    return new StackSidebarGidBuilder;
  }

  /**
      Get `stack` property.
      Returns: The stack.
  */
  @property gid.gtk4.stack.Stack stack() nothrow
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack.
  */
  @property void stack(gid.gtk4.stack.Stack propval) nothrow
  {
    setStack(propval);
  }

  /**
      Creates a new [gid.gtk4.stack_sidebar.StackSidebar].
      Returns: the new [gid.gtk4.stack_sidebar.StackSidebar]
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
      _cretval = gtk_stack_sidebar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the stack.
      Returns: the associated [gid.gtk4.stack.Stack] or
          null if none has been set explicitly
  */
  gid.gtk4.stack.Stack getStack() nothrow
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_sidebar_get_stack(cast(GtkStackSidebar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the [gid.gtk4.stack.Stack] associated with this [gid.gtk4.stack_sidebar.StackSidebar].
      
      The sidebar widget will automatically update according to
      the order and items within the given [gid.gtk4.stack.Stack].
  
      Params:
        stack = a [gid.gtk4.stack.Stack]
  */
  void setStack(gid.gtk4.stack.Stack stack) nothrow
  {
    gtk_stack_sidebar_set_stack(cast(GtkStackSidebar*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.stack_sidebar.StackSidebar]
class StackSidebarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `stack` property.
      Params:
        propval = The stack.
      Returns: Builder instance for fluent chaining
  */
  T stack(gid.gtk4.stack.Stack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gid.gtk4.stack_sidebar.StackSidebar]
final class StackSidebarGidBuilder : StackSidebarGidBuilderImpl!StackSidebarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StackSidebar build() nothrow
  {
    return new StackSidebar(cast(void*)createGObject(StackSidebar._getGType), Yes.Take);
  }
}
