/// Module for [StackSwitcher] class
module gtk.stack_switcher;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.stack;
import gtk.types;

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
class StackSwitcher : gtk.box.Box
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
    return cast(void function())gtk_stack_switcher_get_type != &gidSymbolNotFound ? gtk_stack_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StackSwitcher self()
  {
    return this;
  }

  /**
      Get `iconSize` property.
      Returns: Use the "icon-size" property to change the size of the image displayed
        when a #GtkStackSwitcher is displaying icons.
  */
  @property int iconSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("icon-size");
  }

  /**
      Set `iconSize` property.
      Params:
        propval = Use the "icon-size" property to change the size of the image displayed
          when a #GtkStackSwitcher is displaying icons.
  */
  @property void iconSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("icon-size", propval);
  }

  /** */
  @property gtk.stack.Stack stack()
  {
    return getStack();
  }

  /** */
  @property void stack(gtk.stack.Stack propval)
  {
    return setStack(propval);
  }

  /**
      Create a new #GtkStackSwitcher.
      Returns: a new #GtkStackSwitcher.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the stack.
      See [gtk.stack_switcher.StackSwitcher.setStack].
      Returns: the stack, or null if
           none has been set explicitly.
  */
  gtk.stack.Stack getStack()
  {
    GtkStack* _cretval;
    _cretval = gtk_stack_switcher_get_stack(cast(GtkStackSwitcher*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.stack.Stack)(cast(GtkStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a #GtkStack
  */
  void setStack(gtk.stack.Stack stack = null)
  {
    gtk_stack_switcher_set_stack(cast(GtkStackSwitcher*)this._cPtr, stack ? cast(GtkStack*)stack._cPtr(No.Dup) : null);
  }
}
