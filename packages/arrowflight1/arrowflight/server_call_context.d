/// Module for [ServerCallContext] class
module arrowflight.server_call_context;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ServerCallContext : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_server_call_context_get_type != &gidSymbolNotFound ? gaflight_server_call_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerCallContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.server_call_context.ServerCallContext]
      Returns: New builder object
  */
  static ServerCallContextGidBuilder builder() nothrow
  {
    return new ServerCallContextGidBuilder;
  }

  /**
      Iterates over all incoming headers.
  
      Params:
        func = The user's callback function.
  */
  void foreachIncomingHeader(arrowflight.types.HeaderFunc func) nothrow
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData) nothrow
    {
      auto _dlg = cast(arrowflight.types.HeaderFunc*)userData;
      string _name = name.fromCString!(No.Free);
      string _value = value.fromCString!(No.Free);

      try
      {
        (*_dlg)(_name, _value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "arrowflight.types.HeaderFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gaflight_server_call_context_foreach_incoming_header(cast(GAFlightServerCallContext*)this._cPtr, _funcCB, _func);
  }
}

/// Fluent builder implementation template for [arrowflight.server_call_context.ServerCallContext]
class ServerCallContextGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T callContext(void* propval) nothrow
  {
    return setProperty("call-context", propval);
  }
}

/// Fluent builder for [arrowflight.server_call_context.ServerCallContext]
final class ServerCallContextGidBuilder : ServerCallContextGidBuilderImpl!ServerCallContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ServerCallContext build() nothrow
  {
    return new ServerCallContext(cast(void*)createGObject(ServerCallContext._getGType), No.Take);
  }
}
