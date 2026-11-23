/// Module for [StackSidebar] class
module gid.gtk3.stack_sidebar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.stack;
import gid.gtk3.types;

/**
    A GtkStackSidebar enables you to quickly and easily provide a
    consistent "sidebar" object for your user interface.
    
    In order to use a GtkStackSidebar, you simply use a GtkStack to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gid.gtk4.stack_sidebar.StackSidebar.setStack] to connect the #GtkStackSidebar
    to the #GtkStack.
    
    # CSS nodes
    
    GtkStackSidebar has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, GtkStackSidebar adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
class StackSidebar : gid.gtk3.bin.Bin
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
      Get builder for [gid.gtk3.stack_sidebar.StackSidebar]
      Returns: New builder object
  */
  static StackSidebarGidBuilder builder() nothrow
  {
    return new StackSidebarGidBuilder;
  }

  /** */
  @property gid.gtk3.stack.Stack stack() nothrow
  {
    return getStack();
  }

  /** */
  @property void stack(gid.gtk3.stack.Stack propval) nothrow
  {
    setStack(propval);
  }

  /**
      Creates a new sidebar.
      Returns: the new #GtkStackSidebar
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
      See [gid.gtk4.stack_sidebar.StackSidebar.setStack].
      Returns: the associated #GtkStack or
            null if none has been set explicitly
  */
  gid.gtk3.stack.Stack getStack() nothrow
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_sidebar_get_stack(cast(GtkStackSidebar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the #GtkStack associated with this #GtkStackSidebar.
      
      The sidebar widget will automatically update according to the order
      (packing) and items within the given #GtkStack.
  
      Params:
        stack = a #GtkStack
  */
  void setStack(gid.gtk3.stack.Stack stack) nothrow
  {
    gtk_stack_sidebar_set_stack(cast(GtkStackSidebar*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.stack_sidebar.StackSidebar]
class StackSidebarGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{


  /** */
  T stack(gid.gtk3.stack.Stack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gid.gtk3.stack_sidebar.StackSidebar]
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
