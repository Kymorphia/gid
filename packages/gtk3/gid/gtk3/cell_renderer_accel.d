/// Module for [CellRendererAccel] class
module gid.gtk3.cell_renderer_accel;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_renderer_text;
import gid.gtk3.types;

/**
    #GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
    combination like `Control + a`). If the cell renderer is editable,
    the accelerator can be changed by simply typing the new combination.
    
    The #GtkCellRendererAccel cell renderer was added in GTK+ 2.10.
*/
class CellRendererAccel : gid.gtk3.cell_renderer_text.CellRendererText
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
    return cast(void function())gtk_cell_renderer_accel_get_type != &gidSymbolNotFound ? gtk_cell_renderer_accel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererAccel";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererAccel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_renderer_accel.CellRendererAccel]
      Returns: New builder object
  */
  static CellRendererAccelGidBuilder builder() nothrow
  {
    return new CellRendererAccelGidBuilder;
  }

  /**
      Get `accelKey` property.
      Returns: The keyval of the accelerator.
  */
  @property uint accelKey() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("accel-key");
  }

  /**
      Set `accelKey` property.
      Params:
        propval = The keyval of the accelerator.
  */
  @property void accelKey(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("accel-key", propval);
  }

  /**
      Get `accelMode` property.
      Returns: Determines if the edited accelerators are GTK+ accelerators. If
        they are, consumed modifiers are suppressed, only accelerators
        accepted by GTK+ are allowed, and the accelerators are rendered
        in the same way as they are in menus.
        
        If the mode is set to [gid.gtk3.types.CellRendererAccelMode.ModifierTap]
        then bare modifiers can be set as accelerators by tapping (ie:
        pressing and immediately releasing) them.
  */
  @property gid.gtk3.types.CellRendererAccelMode accelMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.CellRendererAccelMode)("accel-mode");
  }

  /**
      Set `accelMode` property.
      Params:
        propval = Determines if the edited accelerators are GTK+ accelerators. If
          they are, consumed modifiers are suppressed, only accelerators
          accepted by GTK+ are allowed, and the accelerators are rendered
          in the same way as they are in menus.
          
          If the mode is set to [gid.gtk3.types.CellRendererAccelMode.ModifierTap]
          then bare modifiers can be set as accelerators by tapping (ie:
          pressing and immediately releasing) them.
  */
  @property void accelMode(gid.gtk3.types.CellRendererAccelMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.CellRendererAccelMode)("accel-mode", propval);
  }

  /**
      Get `accelMods` property.
      Returns: The modifier mask of the accelerator.
  */
  @property gid.gdk3.types.ModifierType accelMods() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.ModifierType)("accel-mods");
  }

  /**
      Set `accelMods` property.
      Params:
        propval = The modifier mask of the accelerator.
  */
  @property void accelMods(gid.gdk3.types.ModifierType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.types.ModifierType)("accel-mods", propval);
  }

  /**
      Get `keycode` property.
      Returns: The hardware keycode of the accelerator. Note that the hardware keycode is
        only relevant if the key does not have a keyval. Normally, the keyboard
        configuration should assign keyvals to all keys.
  */
  @property uint keycode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("keycode");
  }

  /**
      Set `keycode` property.
      Params:
        propval = The hardware keycode of the accelerator. Note that the hardware keycode is
          only relevant if the key does not have a keyval. Normally, the keyboard
          configuration should assign keyvals to all keys.
  */
  @property void keycode(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("keycode", propval);
  }

  /**
      Creates a new #GtkCellRendererAccel.
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_accel_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncAccelCleared(string pathString)
  {
    auto _klass = cast(GtkCellRendererAccelClass*)_vfuncClass;
    if (!_klass.accelCleared)
      return;

    const(char)* _pathString = pathString.toCString!(No.Malloc, No.Nullable);
    _klass.accelCleared(cast(GtkCellRendererAccel*)this._cPtr, _pathString);
  }

  /** */
  protected void vfuncAccelEdited(string pathString, uint accelKey, gid.gdk3.types.ModifierType accelMods, uint hardwareKeycode)
  {
    auto _klass = cast(GtkCellRendererAccelClass*)_vfuncClass;
    if (!_klass.accelEdited)
      return;

    const(char)* _pathString = pathString.toCString!(No.Malloc, No.Nullable);
    _klass.accelEdited(cast(GtkCellRendererAccel*)this._cPtr, _pathString, accelKey, accelMods, hardwareKeycode);
  }

  /**
      Connect to `AccelCleared` signal.
  
      Gets emitted when the user has removed the accelerator.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string pathString, gid.gtk3.cell_renderer_accel.CellRendererAccel cellRendererAccel)`
  
          `pathString` the path identifying the row of the edited cell (optional)
  
          `cellRendererAccel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAccelCleared(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.cell_renderer_accel.CellRendererAccel)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_accel.CellRendererAccel.accelCleared");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-cleared", closure, after);
  }

  /**
      Connect to `AccelEdited` signal.
  
      Gets emitted when the user has selected a new accelerator.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string pathString, uint accelKey, gid.gdk3.types.ModifierType accelMods, uint hardwareKeycode, gid.gtk3.cell_renderer_accel.CellRendererAccel cellRendererAccel)`
  
          `pathString` the path identifying the row of the edited cell (optional)
  
          `accelKey` the new accelerator keyval (optional)
  
          `accelMods` the new acclerator modifier mask (optional)
  
          `hardwareKeycode` the keycode of the new accelerator (optional)
  
          `cellRendererAccel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAccelEdited(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk3.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.cell_renderer_accel.CellRendererAccel)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_accel.CellRendererAccel.accelEdited");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-edited", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellRendererAccel
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.cell_renderer_accel.CellRendererAccel), T.stringof ~ " is not derived from gid.gtk3.cell_renderer_accel.CellRendererAccel");

    gid.gtk3.cell_renderer_text.CellRendererText._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAccelCleared", true)[0]) == gid.gtk3.cell_renderer_accel.CellRendererAccel))
      _installVfunc(klass, "accel_cleared");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAccelEdited", true)[0]) == gid.gtk3.cell_renderer_accel.CellRendererAccel))
      _installVfunc(klass, "accel_edited");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellRendererAccelClass*)klass;

    switch (vfunc)
    {
      case "accel_cleared":
      {
        static extern(C) void _vfuncAccelClearedTramp(GtkCellRendererAccel* accel, const(char)* pathString) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer_accel.CellRendererAccel)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)accel);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererAccelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)accel);
            if (_klass.accelCleared)
              return (cast(typeof(&_vfuncAccelClearedTramp))_klass.accelCleared)(accel, pathString);
            return;
          }

          string _pathString = pathString.fromCString!(No.Free);

          try
          {
            _obj.vfuncAccelCleared(_pathString);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_accel.CellRendererAccel.vfuncAccelCleared");
          }
        }

        _klass.accelCleared = cast(typeof(_klass.accelCleared))&_vfuncAccelClearedTramp;
        break;
      }
      case "accel_edited":
      {
        static extern(C) void _vfuncAccelEditedTramp(GtkCellRendererAccel* accel, const(char)* pathString, uint accelKey, GdkModifierType accelMods, uint hardwareKeycode) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer_accel.CellRendererAccel)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)accel);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererAccelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)accel);
            if (_klass.accelEdited)
              return (cast(typeof(&_vfuncAccelEditedTramp))_klass.accelEdited)(accel, pathString, accelKey, accelMods, hardwareKeycode);
            return;
          }

          string _pathString = pathString.fromCString!(No.Free);

          try
          {
            _obj.vfuncAccelEdited(_pathString, accelKey, accelMods, hardwareKeycode);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer_accel.CellRendererAccel.vfuncAccelEdited");
          }
        }

        _klass.accelEdited = cast(typeof(_klass.accelEdited))&_vfuncAccelEditedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_renderer_accel.CellRendererAccel]
class CellRendererAccelGidBuilderImpl(T) : gid.gtk3.cell_renderer_text.CellRendererTextGidBuilderImpl!T
{

  /**
      Set `accelKey` property.
      Params:
        propval = The keyval of the accelerator.
      Returns: Builder instance for fluent chaining
  */
  T accelKey(uint propval) nothrow
  {
    return setProperty("accel-key", propval);
  }

  /**
      Set `accelMode` property.
      Params:
        propval = Determines if the edited accelerators are GTK+ accelerators. If
          they are, consumed modifiers are suppressed, only accelerators
          accepted by GTK+ are allowed, and the accelerators are rendered
          in the same way as they are in menus.
          
          If the mode is set to [gid.gtk3.types.CellRendererAccelMode.ModifierTap]
          then bare modifiers can be set as accelerators by tapping (ie:
          pressing and immediately releasing) them.
      Returns: Builder instance for fluent chaining
  */
  T accelMode(gid.gtk3.types.CellRendererAccelMode propval) nothrow
  {
    return setProperty("accel-mode", propval);
  }

  /**
      Set `accelMods` property.
      Params:
        propval = The modifier mask of the accelerator.
      Returns: Builder instance for fluent chaining
  */
  T accelMods(gid.gdk3.types.ModifierType propval) nothrow
  {
    return setProperty("accel-mods", propval);
  }

  /**
      Set `keycode` property.
      Params:
        propval = The hardware keycode of the accelerator. Note that the hardware keycode is
          only relevant if the key does not have a keyval. Normally, the keyboard
          configuration should assign keyvals to all keys.
      Returns: Builder instance for fluent chaining
  */
  T keycode(uint propval) nothrow
  {
    return setProperty("keycode", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_renderer_accel.CellRendererAccel]
final class CellRendererAccelGidBuilder : CellRendererAccelGidBuilderImpl!CellRendererAccelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererAccel build() nothrow
  {
    return new CellRendererAccel(cast(void*)createGObject(CellRendererAccel._getGType), Yes.Take);
  }
}
