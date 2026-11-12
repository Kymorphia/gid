/// Module for [StyleProvider] interface
module gtk.style_provider;

public import gid.basictypes;
public import gtk.style_provider_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An interface for style information used by [gtk.style_context.StyleContext].
    
    See [gtk.style_context.StyleContext.addProvider] and
    [gtk.style_context.StyleContext.addProviderForDisplay] for
    adding `GtkStyleProviders`.
    
    GTK uses the [gtk.style_provider.StyleProvider] implementation for CSS in
    [gtk.css_provider.CssProvider].
*/
interface StyleProvider : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_style_provider_get_type != &gidSymbolNotFound ? gtk_style_provider_get_type() : cast(GType)0;
  }

  /**
      Connect to `GtkPrivateChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.style_provider.StyleProvider styleProvider)`
  
          `styleProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGtkPrivateChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.style_provider.StyleProvider)))
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
        gidInvokeCallbackExceptionHandler(e, "gtk.style_provider.StyleProvider.gtkPrivateChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("gtk-private-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.style_provider.StyleProvider]
interface StyleProviderGidBuilderImpl(T)
{
}
