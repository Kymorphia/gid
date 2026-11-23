/// Module for [CellRendererToggle] class
module gid.gtk3.cell_renderer_toggle;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_renderer;
import gid.gtk3.types;

/**
    #GtkCellRendererToggle renders a toggle button in a cell. The
    button is drawn as a radio or a checkbutton, depending on the
    #GtkCellRendererToggle:radio property.
    When activated, it emits the #GtkCellRendererToggle::toggled signal.
*/
class CellRendererToggle : gid.gtk3.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_toggle_get_type != &gidSymbolNotFound ? gtk_cell_renderer_toggle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererToggle";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererToggle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_renderer_toggle.CellRendererToggle]
      Returns: New builder object
  */
  static CellRendererToggleGidBuilder builder() nothrow
  {
    return new CellRendererToggleGidBuilder;
  }

  /** */
  @property bool activatable() nothrow
  {
    return getActivatable();
  }

  /** */
  @property void activatable(bool propval) nothrow
  {
    setActivatable(propval);
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
  @property bool inconsistent() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("inconsistent");
  }

  /** */
  @property void inconsistent(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("inconsistent", propval);
  }

  /** */
  @property int indicatorSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("indicator-size");
  }

  /** */
  @property void indicatorSize(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("indicator-size", propval);
  }

  /** */
  @property bool radio() nothrow
  {
    return getRadio();
  }

  /** */
  @property void radio(bool propval) nothrow
  {
    setRadio(propval);
  }

  /**
      Creates a new #GtkCellRendererToggle. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gid.gobject2.object.ObjectWrap.set]). Also, with #GtkTreeViewColumn, you
      can bind a property to a value in a #GtkTreeModel. For example, you
      can bind the “active” property on the cell renderer to a boolean value
      in the model, thus causing the check button to reflect the state of
      the model.
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_toggle_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncToggled(string path)
  {
    auto _klass = cast(GtkCellRendererToggleClass*)_vfuncClass;
    if (!_klass.toggled)
      return;

    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _klass.toggled(cast(GtkCellRendererToggle*)this._cPtr, _path);
  }

  /**
      Returns whether the cell renderer is activatable. See
      [gid.gtk4.cell_renderer_toggle.CellRendererToggle.setActivatable].
      Returns: true if the cell renderer is activatable.
  */
  bool getActivatable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_toggle_get_activatable(cast(GtkCellRendererToggle*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the cell renderer is active. See
      [gid.gtk4.cell_renderer_toggle.CellRendererToggle.setActive].
      Returns: true if the cell renderer is active.
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_toggle_get_active(cast(GtkCellRendererToggle*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether we’re rendering radio toggles rather than checkboxes.
      Returns: true if we’re rendering radio toggles rather than checkboxes
  */
  bool getRadio() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_toggle_get_radio(cast(GtkCellRendererToggle*)this._cPtr);
    return _retval;
  }

  /**
      Makes the cell renderer activatable.
  
      Params:
        setting = the value to set.
  */
  void setActivatable(bool setting) nothrow
  {
    gtk_cell_renderer_toggle_set_activatable(cast(GtkCellRendererToggle*)this._cPtr, setting);
  }

  /**
      Activates or deactivates a cell renderer.
  
      Params:
        setting = the value to set.
  */
  void setActive(bool setting) nothrow
  {
    gtk_cell_renderer_toggle_set_active(cast(GtkCellRendererToggle*)this._cPtr, setting);
  }

  /**
      If radio is true, the cell renderer renders a radio toggle
      (i.e. a toggle in a group of mutually-exclusive toggles).
      If false, it renders a check toggle (a standalone boolean option).
      This can be set globally for the cell renderer, or changed just
      before rendering each cell in the model (for #GtkTreeView, you set
      up a per-row setting using #GtkTreeViewColumn to associate model
      columns with cell renderer properties).
  
      Params:
        radio = true to make the toggle look like a radio button
  */
  void setRadio(bool radio) nothrow
  {
    gtk_cell_renderer_toggle_set_radio(cast(GtkCellRendererToggle*)this._cPtr, radio);
  }

  /**
      Connect to `Toggled` signal.
  
      The ::toggled signal is emitted when the cell is toggled.
        
        It is the responsibility of the application to update the model
        with the correct value to store at path.  Often this is simply the
        opposite of the value currently stored at path.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string path, gid.gtk3.cell_renderer_toggle.CellRendererToggle cellRendererToggle)`
  
          `path` string representation of #GtkTreePath describing the
                   event location (optional)
  
          `cellRendererToggle` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.cell_renderer_toggle.CellRendererToggle)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_toggle.CellRendererToggle.toggled");
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
        T = D class derived from CellRendererToggle
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.cell_renderer_toggle.CellRendererToggle), T.stringof ~ " is not derived from gid.gtk3.cell_renderer_toggle.CellRendererToggle");

    gid.gtk3.cell_renderer.CellRenderer._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggled", true)[0]) == gid.gtk3.cell_renderer_toggle.CellRendererToggle))
      _installVfunc(klass, "toggled");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellRendererToggleClass*)klass;

    switch (vfunc)
    {
      case "toggled":
      {
        static extern(C) void _vfuncToggledTramp(GtkCellRendererToggle* cellRendererToggle, const(char)* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer_toggle.CellRendererToggle)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellRendererToggle);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererToggleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellRendererToggle);
            if (_klass.toggled)
              return (cast(typeof(&_vfuncToggledTramp))_klass.toggled)(cellRendererToggle, path);
            return;
          }

          string _path = path.fromCString!(No.Free);

          try
          {
            _obj.vfuncToggled(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_toggle.CellRendererToggle.vfuncToggled");
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

/// Fluent builder implementation template for [gid.gtk3.cell_renderer_toggle.CellRendererToggle]
class CellRendererToggleGidBuilderImpl(T) : gid.gtk3.cell_renderer.CellRendererGidBuilderImpl!T
{

  /** */
  T activatable(bool propval) nothrow
  {
    return setProperty("activatable", propval);
  }

  /** */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /** */
  T inconsistent(bool propval) nothrow
  {
    return setProperty("inconsistent", propval);
  }

  /** */
  T indicatorSize(int propval) nothrow
  {
    return setProperty("indicator-size", propval);
  }

  /** */
  T radio(bool propval) nothrow
  {
    return setProperty("radio", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_renderer_toggle.CellRendererToggle]
final class CellRendererToggleGidBuilder : CellRendererToggleGidBuilderImpl!CellRendererToggleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererToggle build() nothrow
  {
    return new CellRendererToggle(cast(void*)createGObject(CellRendererToggle._getGType), Yes.Take);
  }
}
