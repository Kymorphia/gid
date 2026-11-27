/// Module for [ColorBalanceChannel] class
module gid.gstvideo1.color_balance_channel;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    The #GstColorBalanceChannel object represents a parameter
    for modifying the color balance implemented by an element providing the
    #GstColorBalance interface. For example, Hue or Saturation.
*/
@gidGir("ColorBalanceChannel", "ColorBalanceChannelClass")
class ColorBalanceChannel : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_color_balance_channel_get_type != &gidSymbolNotFound ? gst_color_balance_channel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstColorBalanceChannel";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorBalanceChannel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.color_balance_channel.ColorBalanceChannel]
      Returns: New builder object
  */
  static ColorBalanceChannelGidBuilder builder() nothrow
  {
    return new ColorBalanceChannelGidBuilder;
  }

  /**
      default handler for value changed notification
  
      Params:
        value = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncValueChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncValueChanged(int value)
  {
    auto _klass = cast(GstColorBalanceChannelClass*)_vfuncClass;
    if (!_klass.valueChanged)
      return;

    _klass.valueChanged(cast(GstColorBalanceChannel*)this._cPtr, value);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Fired when the value of the indicated channel has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int value, gid.gstvideo1.color_balance_channel.ColorBalanceChannel colorBalanceChannel)`
  
          `value` The new value (optional)
  
          `colorBalanceChannel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstvideo1.color_balance_channel.ColorBalanceChannel)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance_channel.ColorBalanceChannel.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ColorBalanceChannel
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.color_balance_channel.ColorBalanceChannel), T.stringof ~ " is not derived from gid.gstvideo1.color_balance_channel.ColorBalanceChannel");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncValueChanged", true)[0]) == gid.gstvideo1.color_balance_channel.ColorBalanceChannel))
      _installVfunc(klass, "value_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstColorBalanceChannelClass*)klass;

    switch (vfunc)
    {
      case "value_changed":
      {
        static extern(C) void _vfuncValueChangedTramp(GstColorBalanceChannel* channel, int value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.color_balance_channel.ColorBalanceChannel)(cast(void*)channel);
          if (!_obj)
          {
            auto _klass = cast(GstColorBalanceChannelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)channel);
            if (_klass.valueChanged)
              return (cast(typeof(&_vfuncValueChangedTramp))_klass.valueChanged)(channel, value);
            return;
          }

          try
          {
            _obj.vfuncValueChanged(value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.color_balance_channel.ColorBalanceChannel.vfuncValueChanged");
          }
        }

        _klass.valueChanged = cast(typeof(_klass.valueChanged))&_vfuncValueChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.color_balance_channel.ColorBalanceChannel]
class ColorBalanceChannelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.color_balance_channel.ColorBalanceChannel]
final class ColorBalanceChannelGidBuilder : ColorBalanceChannelGidBuilderImpl!ColorBalanceChannelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorBalanceChannel build() nothrow
  {
    return new ColorBalanceChannel(cast(void*)createGObject(ColorBalanceChannel._getGType), Yes.Take);
  }
}
