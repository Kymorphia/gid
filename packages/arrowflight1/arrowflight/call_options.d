/// Module for [CallOptions] class
module arrowflight.call_options;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class CallOptions : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_call_options_get_type != &gidSymbolNotFound ? gaflight_call_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallOptions self()
  {
    return this;
  }

  /**
      Get `timeout` property.
      Returns: An optional timeout for this call. Negative durations mean an
        implementation-defined default behavior will be used
        instead. This is the default value.
  */
  @property double timeout()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("timeout");
  }

  /**
      Set `timeout` property.
      Params:
        propval = An optional timeout for this call. Negative durations mean an
          implementation-defined default behavior will be used
          instead. This is the default value.
  */
  @property void timeout(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("timeout", propval);
  }

  /** */
  this()
  {
    GAFlightCallOptions* _cretval;
    _cretval = gaflight_call_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a header.
  
      Params:
        name = A header name.
        value = A header value.
  */
  void addHeader(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gaflight_call_options_add_header(cast(GAFlightCallOptions*)this._cPtr, _name, _value);
  }

  /**
      Clear all headers.
  */
  void clearHeaders()
  {
    gaflight_call_options_clear_headers(cast(GAFlightCallOptions*)this._cPtr);
  }

  /**
      Iterates over all headers in the options.
  
      Params:
        func = The user's callback function.
  */
  void foreachHeader(arrowflight.types.HeaderFunc func)
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData)
    {
      auto _dlg = cast(arrowflight.types.HeaderFunc*)userData;
      string _name = name.fromCString(No.Free);
      string _value = value.fromCString(No.Free);

      (*_dlg)(_name, _value);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gaflight_call_options_foreach_header(cast(GAFlightCallOptions*)this._cPtr, _funcCB, _func);
  }
}
