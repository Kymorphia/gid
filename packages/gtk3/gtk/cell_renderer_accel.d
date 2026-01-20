/// Module for [CellRendererAccel] class
module gtk.cell_renderer_accel;

import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.types;

/**
    #GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
    combination like `Control + a`). If the cell renderer is editable,
    the accelerator can be changed by simply typing the new combination.
    
    The #GtkCellRendererAccel cell renderer was added in GTK+ 2.10.
*/
class CellRendererAccel : gtk.cell_renderer_text.CellRendererText
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
    return cast(void function())gtk_cell_renderer_accel_get_type != &gidSymbolNotFound ? gtk_cell_renderer_accel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererAccel self()
  {
    return this;
  }

  /**
      Get `accelKey` property.
      Returns: The keyval of the accelerator.
  */
  @property uint accelKey()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("accel-key");
  }

  /**
      Set `accelKey` property.
      Params:
        propval = The keyval of the accelerator.
  */
  @property void accelKey(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("accel-key", propval);
  }

  /**
      Get `accelMode` property.
      Returns: Determines if the edited accelerators are GTK+ accelerators. If
        they are, consumed modifiers are suppressed, only accelerators
        accepted by GTK+ are allowed, and the accelerators are rendered
        in the same way as they are in menus.
        
        If the mode is set to [gtk.types.CellRendererAccelMode.ModifierTap]
        then bare modifiers can be set as accelerators by tapping (ie:
        pressing and immediately releasing) them.
  */
  @property gtk.types.CellRendererAccelMode accelMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.CellRendererAccelMode)("accel-mode");
  }

  /**
      Set `accelMode` property.
      Params:
        propval = Determines if the edited accelerators are GTK+ accelerators. If
          they are, consumed modifiers are suppressed, only accelerators
          accepted by GTK+ are allowed, and the accelerators are rendered
          in the same way as they are in menus.
          
          If the mode is set to [gtk.types.CellRendererAccelMode.ModifierTap]
          then bare modifiers can be set as accelerators by tapping (ie:
          pressing and immediately releasing) them.
  */
  @property void accelMode(gtk.types.CellRendererAccelMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.CellRendererAccelMode)("accel-mode", propval);
  }

  /**
      Get `accelMods` property.
      Returns: The modifier mask of the accelerator.
  */
  @property gdk.types.ModifierType accelMods()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.types.ModifierType)("accel-mods");
  }

  /**
      Set `accelMods` property.
      Params:
        propval = The modifier mask of the accelerator.
  */
  @property void accelMods(gdk.types.ModifierType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.types.ModifierType)("accel-mods", propval);
  }

  /**
      Get `keycode` property.
      Returns: The hardware keycode of the accelerator. Note that the hardware keycode is
        only relevant if the key does not have a keyval. Normally, the keyboard
        configuration should assign keyvals to all keys.
  */
  @property uint keycode()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("keycode");
  }

  /**
      Set `keycode` property.
      Params:
        propval = The hardware keycode of the accelerator. Note that the hardware keycode is
          only relevant if the key does not have a keyval. Normally, the keyboard
          configuration should assign keyvals to all keys.
  */
  @property void keycode(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("keycode", propval);
  }

  /**
      Creates a new #GtkCellRendererAccel.
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_accel_new();
    this(_cretval, No.Take);
  }

  /**
      Connect to `AccelCleared` signal.
  
      Gets emitted when the user has removed the accelerator.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string pathString, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel))
  
          `pathString` the path identifying the row of the edited cell (optional)
  
          `cellRendererAccel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAccelCleared(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.cell_renderer_accel.CellRendererAccel)))
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
    return connectSignalClosure("accel-cleared", closure, after);
  }

  /**
      Connect to `AccelEdited` signal.
  
      Gets emitted when the user has selected a new accelerator.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string pathString, uint accelKey, gdk.types.ModifierType accelMods, uint hardwareKeycode, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel))
  
          `pathString` the path identifying the row of the edited cell (optional)
  
          `accelKey` the new accelerator keyval (optional)
  
          `accelMods` the new acclerator modifier mask (optional)
  
          `hardwareKeycode` the keycode of the new accelerator (optional)
  
          `cellRendererAccel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAccelEdited(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.cell_renderer_accel.CellRendererAccel)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-edited", closure, after);
  }
}
