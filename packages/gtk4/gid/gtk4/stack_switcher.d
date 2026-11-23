/// Module for [StackSwitcher] class
module gid.gtk4.stack_switcher;

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
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.stack;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a row of buttons to switch between [gid.gtk4.stack.Stack] pages.
    
    <picture>
      <source srcset="stackswitcher-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkStackSwitcher" src="stackswitcher.png">
    </picture>
    
    It acts as a controller for the associated [gid.gtk4.stack.Stack].
    
    All the content for the buttons comes from the properties of the stacks
    [gid.gtk4.stack_page.StackPage] objects; the button visibility in a [gid.gtk4.stack_switcher.StackSwitcher]
    widget is controlled by the visibility of the child in the [gid.gtk4.stack.Stack].
    
    It is possible to associate multiple [gid.gtk4.stack_switcher.StackSwitcher] widgets
    with the same [gid.gtk4.stack.Stack] widget.
    
    # CSS nodes
    
    [gid.gtk4.stack_switcher.StackSwitcher] has a single CSS node named stackswitcher and
    style class .stack-switcher.
    
    When circumstances require it, [gid.gtk4.stack_switcher.StackSwitcher] adds the
    .needs-attention style class to the widgets representing the
    stack pages.
    
    # Accessibility
    
    [gid.gtk4.stack_switcher.StackSwitcher] uses the [gid.gtk4.types.AccessibleRole.TabList] role
    and uses the [gid.gtk4.types.AccessibleRole.Tab] role for its buttons.
    
    # Orientable
    
    Since GTK 4.4, [gid.gtk4.stack_switcher.StackSwitcher] implements [gid.gtk4.orientable.Orientable] allowing
    the stack switcher to be made vertical with
    `[gid.gtk4.orientable.Orientable.setOrientation]`.
*/
class StackSwitcher : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_stack_switcher_get_type != &gidSymbolNotFound ? gtk_stack_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStackSwitcher";
  }

  /** Returns `this`, for use in `with` statements. */
  override StackSwitcher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.stack_switcher.StackSwitcher]
      Returns: New builder object
  */
  static StackSwitcherGidBuilder builder() nothrow
  {
    return new StackSwitcherGidBuilder;
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

  mixin OrientableT!();

  /**
      Create a new [gid.gtk4.stack_switcher.StackSwitcher].
      Returns: a new [gid.gtk4.stack_switcher.StackSwitcher].
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
      _cretval = gtk_stack_switcher_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the stack.
      Returns: the stack
  */
  gid.gtk4.stack.Stack getStack() nothrow
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a [gid.gtk4.stack.Stack]
  */
  void setStack(gid.gtk4.stack.Stack stack = null) nothrow
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.stack_switcher.StackSwitcher]
class StackSwitcherGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

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

/// Fluent builder for [gid.gtk4.stack_switcher.StackSwitcher]
final class StackSwitcherGidBuilder : StackSwitcherGidBuilderImpl!StackSwitcherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StackSwitcher build() nothrow
  {
    return new StackSwitcher(cast(void*)createGObject(StackSwitcher._getGType), Yes.Take);
  }
}
