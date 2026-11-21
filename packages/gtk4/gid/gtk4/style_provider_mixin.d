/// Module for [StyleProvider] interface mixin
module gid.gtk4.style_provider_mixin;

public import gid.core.basictypes;
public import gid.gtk4.style_provider_iface_proxy;
public import gid.core.gid;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for style information used by [gid.gtk4.style_context.StyleContext].
    
    See [gid.gtk4.style_context.StyleContext.addProvider] and
    [gid.gtk4.style_context.StyleContext.addProviderForDisplay] for
    adding `GtkStyleProviders`.
    
    GTK uses the [gid.gtk4.style_provider.StyleProvider] implementation for CSS in
    [gid.gtk4.css_provider.CssProvider].
*/
template StyleProviderT()
{

  /**
      Connect to `GtkPrivateChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.style_provider.StyleProvider styleProvider)`
  
          `styleProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGtkPrivateChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.style_provider.StyleProvider)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.style_provider.StyleProvider.gtkPrivateChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("gtk-private-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.style_provider.StyleProvider]
template StyleProviderGidBuilderT()
{
}
