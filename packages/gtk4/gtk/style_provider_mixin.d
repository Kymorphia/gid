/// Module for [StyleProvider] interface mixin
module gtk.style_provider_mixin;

public import gtk.style_provider_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.style_provider.StyleProvider] is an interface for style information used by
    [gtk.style_context.StyleContext].
    
    See [gtk.style_context.StyleContext.addProvider] and
    [gtk.style_context.StyleContext.addProviderForDisplay] for
    adding `GtkStyleProviders`.
    
    GTK uses the [gtk.style_provider.StyleProvider] implementation for CSS in
    [gtk.css_provider.CssProvider].
*/
template StyleProviderT()
{

  /**
      Connect to `GtkPrivateChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.style_provider.StyleProvider styleProvider))
  
          `styleProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGtkPrivateChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.style_provider.StyleProvider)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("gtk-private-changed", closure, after);
  }
}

template StyleProviderGidBuilderT()
{
}
