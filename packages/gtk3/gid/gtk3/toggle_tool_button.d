/// Module for [ToggleToolButton] class
module gid.gtk3.toggle_tool_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.tool_button;
import gid.gtk3.types;

/**
    A #GtkToggleToolButton is a #GtkToolItem that contains a toggle
    button.
    
    Use [gid.gtk3.toggle_tool_button.ToggleToolButton.new_] to create a new GtkToggleToolButton.
    
    # CSS nodes
    
    GtkToggleToolButton has a single CSS node with name togglebutton.
*/
class ToggleToolButton : gid.gtk3.tool_button.ToolButton
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
    return cast(void function())gtk_toggle_tool_button_get_type != &gidSymbolNotFound ? gtk_toggle_tool_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToggleToolButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleToolButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.toggle_tool_button.ToggleToolButton]
      Returns: New builder object
  */
  static ToggleToolButtonGidBuilder builder() nothrow
  {
    return new ToggleToolButtonGidBuilder;
  }

  /**
      Get `active` property.
      Returns: If the toggle tool button should be pressed in.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = If the toggle tool button should be pressed in.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Returns a new #GtkToggleToolButton
      Returns: a newly created #GtkToggleToolButton
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkToolItem* _cretval;
      _cretval = gtk_toggle_tool_button_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkToggleToolButton containing the image and text from a
      stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
      and #GTK_STOCK_APPLY.
      
      It is an error if stock_id is not a name of a stock item.
  
      Params:
        stockId = the name of the stock item
      Returns: A new #GtkToggleToolButton
  
      Deprecated: Use [gid.gtk3.toggle_tool_button.ToggleToolButton.new_] instead.
  */
  static gid.gtk3.toggle_tool_button.ToggleToolButton newFromStock(string stockId) nothrow
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_toggle_tool_button_new_from_stock(_stockId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.toggle_tool_button.ToggleToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Signal emitted whenever the toggle tool button changes state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggled` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncToggled()
  {
    auto _klass = cast(GtkToggleToolButtonClass*)_vfuncClass;
    if (!_klass.toggled)
      return;

    _klass.toggled(cast(GtkToggleToolButton*)this._cPtr);
  }

  /**
      Queries a #GtkToggleToolButton and returns its current state.
      Returns true if the toggle button is pressed in and false if it is raised.
      Returns: true if the toggle tool button is pressed in, false if not
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_tool_button_get_active(cast(GtkToggleToolButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the status of the toggle tool button. Set to true if you
      want the GtkToggleButton to be “pressed in”, and false to raise it.
      This action causes the toggled signal to be emitted.
  
      Params:
        isActive = whether button should be active
  */
  void setActive(bool isActive) nothrow
  {
    gtk_toggle_tool_button_set_active(cast(GtkToggleToolButton*)this._cPtr, isActive);
  }

  /**
      Connect to `Toggled` signal.
  
      Emitted whenever the toggle tool button changes state.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.toggle_tool_button.ToggleToolButton toggleToolButton)`
  
          `toggleToolButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.toggle_tool_button.ToggleToolButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toggle_tool_button.ToggleToolButton.toggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ToggleToolButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.toggle_tool_button.ToggleToolButton), T.stringof ~ " is not derived from gid.gtk3.toggle_tool_button.ToggleToolButton");

    gid.gtk3.tool_button.ToolButton._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggled", true)[0]) == gid.gtk3.toggle_tool_button.ToggleToolButton))
      _installVfunc(klass, "toggled");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkToggleToolButtonClass*)klass;

    switch (vfunc)
    {
      case "toggled":
      {
        static extern(C) void _vfuncToggledTramp(GtkToggleToolButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.toggle_tool_button.ToggleToolButton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkToggleToolButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.toggled)
              return (cast(typeof(&_vfuncToggledTramp))_klass.toggled)(button);
            return;
          }

          try
          {
            _obj.vfuncToggled();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toggle_tool_button.ToggleToolButton.vfuncToggled");
          }
        }

        _klass.toggled = cast(typeof(_klass.toggled))&_vfuncToggledTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.toggle_tool_button.ToggleToolButton]
class ToggleToolButtonGidBuilderImpl(T) : gid.gtk3.tool_button.ToolButtonGidBuilderImpl!T
{


  /**
      Set `active` property.
      Params:
        propval = If the toggle tool button should be pressed in.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }
}

/// Fluent builder for [gid.gtk3.toggle_tool_button.ToggleToolButton]
final class ToggleToolButtonGidBuilder : ToggleToolButtonGidBuilderImpl!ToggleToolButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleToolButton build() nothrow
  {
    return new ToggleToolButton(cast(void*)createGObject(ToggleToolButton._getGType), Yes.Take);
  }
}
