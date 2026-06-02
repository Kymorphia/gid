/// Module for [CheckMenuItem] class
module gtk.check_menu_item;

public import gid.basictypes;
import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item;
import gtk.types;

/**
    A #GtkCheckMenuItem is a menu item that maintains the state of a boolean
    value in addition to a #GtkMenuItem usual role in activating application
    code.
    
    A check box indicating the state of the boolean value is displayed
    at the left side of the #GtkMenuItem.  Activating the #GtkMenuItem
    toggles the value.
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── check.left
    ╰── <child>
    ```
    
    GtkCheckMenuItem has a main CSS node with name menuitem, and a subnode
    with name check, which gets the .left or .right style class.
*/
class CheckMenuItem : gtk.menu_item.MenuItem
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_check_menu_item_get_type != &gidSymbolNotFound ? gtk_check_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckMenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.check_menu_item.CheckMenuItem]
      Returns: New builder object
  */
  static CheckMenuItemGidBuilder builder() nothrow
  {
    return new CheckMenuItemGidBuilder;
  }

  /** */
  @property bool active() nothrow
  {
    return getActive();
  }

  /** */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /** */
  @property bool drawAsRadio() nothrow
  {
    return getDrawAsRadio();
  }

  /** */
  @property void drawAsRadio(bool propval) nothrow
  {
    setDrawAsRadio(propval);
  }

  /** */
  @property bool inconsistent() nothrow
  {
    return getInconsistent();
  }

  /** */
  @property void inconsistent(bool propval) nothrow
  {
    setInconsistent(propval);
  }

  /**
      Creates a new #GtkCheckMenuItem.
      Returns: a new #GtkCheckMenuItem.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_menu_item_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkCheckMenuItem with a label.
  
      Params:
        label = the string to use for the label.
      Returns: a new #GtkCheckMenuItem.
  */
  static gtk.check_menu_item.CheckMenuItem newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_menu_item_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.check_menu_item.CheckMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCheckMenuItem containing a label. The label
      will be created using [gtk.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the menu item.
  
      Params:
        label = The text of the button, with an underscore in front of the
              character
      Returns: a new #GtkCheckMenuItem
  */
  static gtk.check_menu_item.CheckMenuItem newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_menu_item_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.check_menu_item.CheckMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the check menu item is active. See
      gtk_check_menu_item_set_active ().
      Returns: true if the menu item is checked.
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_menu_item_get_active(cast(GtkCheckMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether check_menu_item looks like a #GtkRadioMenuItem
      Returns: Whether check_menu_item looks like a #GtkRadioMenuItem
  */
  bool getDrawAsRadio() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_menu_item_get_draw_as_radio(cast(GtkCheckMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value set by [gtk.check_menu_item.CheckMenuItem.setInconsistent].
      Returns: true if inconsistent
  */
  bool getInconsistent() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_menu_item_get_inconsistent(cast(GtkCheckMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Sets the active state of the menu item’s check box.
  
      Params:
        isActive = boolean value indicating whether the check box is active.
  */
  void setActive(bool isActive) nothrow
  {
    gtk_check_menu_item_set_active(cast(GtkCheckMenuItem*)this._cPtr, isActive);
  }

  /**
      Sets whether check_menu_item is drawn like a #GtkRadioMenuItem
  
      Params:
        drawAsRadio = whether check_menu_item is drawn like a #GtkRadioMenuItem
  */
  void setDrawAsRadio(bool drawAsRadio) nothrow
  {
    gtk_check_menu_item_set_draw_as_radio(cast(GtkCheckMenuItem*)this._cPtr, drawAsRadio);
  }

  /**
      If the user has selected a range of elements (such as some text or
      spreadsheet cells) that are affected by a boolean setting, and the
      current values in that range are inconsistent, you may want to
      display the check in an “in between” state. This function turns on
      “in between” display.  Normally you would turn off the inconsistent
      state again if the user explicitly selects a setting. This has to be
      done manually, [gtk.check_menu_item.CheckMenuItem.setInconsistent] only affects
      visual appearance, it doesn’t affect the semantics of the widget.
  
      Params:
        setting = true to display an “inconsistent” third state check
  */
  void setInconsistent(bool setting) nothrow
  {
    gtk_check_menu_item_set_inconsistent(cast(GtkCheckMenuItem*)this._cPtr, setting);
  }

  /**
      Emits the #GtkCheckMenuItem::toggled signal.
  */
  void toggled() nothrow
  {
    gtk_check_menu_item_toggled(cast(GtkCheckMenuItem*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      This signal is emitted when the state of the check box is changed.
        
        A signal handler can use [gtk.check_menu_item.CheckMenuItem.getActive]
        to discover the new state.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.check_menu_item.CheckMenuItem checkMenuItem)`
  
          `checkMenuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.check_menu_item.CheckMenuItem)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.check_menu_item.CheckMenuItem.toggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.check_menu_item.CheckMenuItem]
class CheckMenuItemGidBuilderImpl(T) : gtk.menu_item.MenuItemGidBuilderImpl!T
{


  /** */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /** */
  T drawAsRadio(bool propval) nothrow
  {
    return setProperty("draw-as-radio", propval);
  }

  /** */
  T inconsistent(bool propval) nothrow
  {
    return setProperty("inconsistent", propval);
  }
}

/// Fluent builder for [gtk.check_menu_item.CheckMenuItem]
final class CheckMenuItemGidBuilder : CheckMenuItemGidBuilderImpl!CheckMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckMenuItem build() nothrow
  {
    return new CheckMenuItem(cast(void*)createGObject(CheckMenuItem._getGType), No.Take);
  }
}
