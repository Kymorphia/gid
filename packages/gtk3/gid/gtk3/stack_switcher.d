/// Module for [StackSwitcher] class
module gid.gtk3.stack_switcher;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.stack;
import gid.gtk3.types;

/**
    The GtkStackSwitcher widget acts as a controller for a
    #GtkStack; it shows a row of buttons to switch between
    the various pages of the associated stack widget.
    
    All the content for the buttons comes from the child properties
    of the #GtkStack; the button visibility in a #GtkStackSwitcher
    widget is controlled by the visibility of the child in the
    #GtkStack.
    
    It is possible to associate multiple #GtkStackSwitcher widgets
    with the same #GtkStack widget.
    
    The GtkStackSwitcher widget was added in 3.10.
    
    # CSS nodes
    
    GtkStackSwitcher has a single CSS node named stackswitcher and
    style class .stack-switcher.
    
    When circumstances require it, GtkStackSwitcher adds the
    .needs-attention style class to the widgets representing the
    stack pages.
*/
class StackSwitcher : gid.gtk3.box.Box
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
      Get builder for [gid.gtk3.stack_switcher.StackSwitcher]
      Returns: New builder object
  */
  static StackSwitcherGidBuilder builder() nothrow
  {
    return new StackSwitcherGidBuilder;
  }

  /**
      Get `iconSize` property.
      Returns: Use the "icon-size" property to change the size of the image displayed
        when a #GtkStackSwitcher is displaying icons.
  */
  @property int iconSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("icon-size");
  }

  /**
      Set `iconSize` property.
      Params:
        propval = Use the "icon-size" property to change the size of the image displayed
          when a #GtkStackSwitcher is displaying icons.
  */
  @property void iconSize(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("icon-size", propval);
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
      Create a new #GtkStackSwitcher.
      Returns: a new #GtkStackSwitcher.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
      See [gid.gtk4.stack_switcher.StackSwitcher.setStack].
      Returns: the stack, or null if
           none has been set explicitly.
  */
  gid.gtk3.stack.Stack getStack() nothrow
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a #GtkStack
  */
  void setStack(gid.gtk3.stack.Stack stack = null) nothrow
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.stack_switcher.StackSwitcher]
class StackSwitcherGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /**
      Set `iconSize` property.
      Params:
        propval = Use the "icon-size" property to change the size of the image displayed
          when a #GtkStackSwitcher is displaying icons.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(int propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /** */
  T stack(gid.gtk3.stack.Stack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gid.gtk3.stack_switcher.StackSwitcher]
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
