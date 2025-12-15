/// Module for [CellRendererToggle] class
module gtk.cell_renderer_toggle;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    #GtkCellRendererToggle renders a toggle button in a cell. The
    button is drawn as a radio or a checkbutton, depending on the
    #GtkCellRendererToggle:radio property.
    When activated, it emits the #GtkCellRendererToggle::toggled signal.
*/
class CellRendererToggle : gtk.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_toggle_get_type != &gidSymbolNotFound ? gtk_cell_renderer_toggle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererToggle self()
  {
    return this;
  }

  /** */
  @property bool activatable()
  {
    return getActivatable();
  }

  /** */
  @property void activatable(bool propval)
  {
    return setActivatable(propval);
  }

  /** */
  @property bool active()
  {
    return getActive();
  }

  /** */
  @property void active(bool propval)
  {
    return setActive(propval);
  }

  /** */
  @property bool inconsistent()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("inconsistent");
  }

  /** */
  @property void inconsistent(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("inconsistent", propval);
  }

  /** */
  @property int indicatorSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("indicator-size");
  }

  /** */
  @property void indicatorSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("indicator-size", propval);
  }

  /** */
  @property bool radio()
  {
    return getRadio();
  }

  /** */
  @property void radio(bool propval)
  {
    return setRadio(propval);
  }

  /**
      Creates a new #GtkCellRendererToggle. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gobject.object.ObjectWrap.set]). Also, with #GtkTreeViewColumn, you
      can bind a property to a value in a #GtkTreeModel. For example, you
      can bind the “active” property on the cell renderer to a boolean value
      in the model, thus causing the check button to reflect the state of
      the model.
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_toggle_new();
    this(_cretval, No.Take);
  }

  /**
      Returns whether the cell renderer is activatable. See
      [gtk.cell_renderer_toggle.CellRendererToggle.setActivatable].
      Returns: true if the cell renderer is activatable.
  */
  bool getActivatable()
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_toggle_get_activatable(cast(GtkCellRendererToggle*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the cell renderer is active. See
      [gtk.cell_renderer_toggle.CellRendererToggle.setActive].
      Returns: true if the cell renderer is active.
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_toggle_get_active(cast(GtkCellRendererToggle*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether we’re rendering radio toggles rather than checkboxes.
      Returns: true if we’re rendering radio toggles rather than checkboxes
  */
  bool getRadio()
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
  void setActivatable(bool setting)
  {
    gtk_cell_renderer_toggle_set_activatable(cast(GtkCellRendererToggle*)this._cPtr, setting);
  }

  /**
      Activates or deactivates a cell renderer.
  
      Params:
        setting = the value to set.
  */
  void setActive(bool setting)
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
  void setRadio(bool radio)
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
  
          $(D void callback(string path, gtk.cell_renderer_toggle.CellRendererToggle cellRendererToggle))
  
          `path` string representation of #GtkTreePath describing the
                 event location (optional)
  
          `cellRendererToggle` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.cell_renderer_toggle.CellRendererToggle)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}
