/// Module for [Filter] class
module gid.gmime3.filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base class for filters used by #GMimeStreamFilter.
*/
@gidGir("Filter", "FilterClass")
class Filter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_filter_get_type != &gidSymbolNotFound ? g_mime_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override Filter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter.Filter]
      Returns: New builder object
  */
  static FilterGidBuilder builder() nothrow
  {
    return new FilterGidBuilder;
  }

  /**
      Completes the filtering.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncComplete` to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'outbuf' in callback with ownership 'None' is not supported).
  */
  protected void vfuncComplete(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace)
  {
    auto _klass = cast(GMimeFilterClass*)_vfuncClass;
    if (!_klass.complete)
      return;

    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    _klass.complete(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Copies filter into a new #GMimeFilter object.
      Returns: a duplicate of filter.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopy` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gmime3.filter.Filter vfuncCopy()
  {
    auto _klass = cast(GMimeFilterClass*)_vfuncClass;
    if (!_klass.copy)
      return typeof(return).init;

    GMimeFilter* _cretval;
    _cretval = _klass.copy(cast(GMimeFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.filter.Filter)(cast(GMimeFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Filters the input data and writes it to out.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilter` to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'outbuf' in callback with ownership 'None' is not supported).
  */
  protected void vfuncFilter(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace)
  {
    auto _klass = cast(GMimeFilterClass*)_vfuncClass;
    if (!_klass.filter)
      return;

    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    _klass.filter(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Resets the filter.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(GMimeFilterClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(GMimeFilter*)this._cPtr);
  }

  /**
      Sets number of bytes backed up on the input, new calls replace
      previous ones
  
      Params:
        data = data to backup
  */
  void backup(ubyte[] data) nothrow
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    g_mime_filter_backup(cast(GMimeFilter*)this._cPtr, _data, _length);
  }

  /**
      Completes the filtering.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  */
  void complete(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace) nothrow
  {
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    g_mime_filter_complete(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Copies filter into a new #GMimeFilter object.
      Returns: a duplicate of filter.
  */
  gid.gmime3.filter.Filter copy() nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_copy(cast(GMimeFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.filter.Filter)(cast(GMimeFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Filters the input data and writes it to out.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  */
  void filter(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace) nothrow
  {
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    g_mime_filter_filter(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Resets the filter.
  */
  void reset() nothrow
  {
    g_mime_filter_reset(cast(GMimeFilter*)this._cPtr);
  }

  /**
      Ensure this much size is available for filter output (if required)
  
      Params:
        size = requested size for the output buffer
        keep = true if existing data in the output buffer should be kept
  */
  void setSize(size_t size, bool keep) nothrow
  {
    g_mime_filter_set_size(cast(GMimeFilter*)this._cPtr, size, keep);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Filter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gmime3.filter.Filter), T.stringof ~ " is not derived from gid.gmime3.filter.Filter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncComplete", true)[0]) == gid.gmime3.filter.Filter))
      static assert(0, "Overriding gid.gmime3.filter.Filter.vfuncComplete is not supported: Out array parameter 'outbuf' in callback with ownership 'None' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopy", true)[0]) == gid.gmime3.filter.Filter))
      _installVfunc(klass, "copy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilter", true)[0]) == gid.gmime3.filter.Filter))
      static assert(0, "Overriding gid.gmime3.filter.Filter.vfuncFilter is not supported: Out array parameter 'outbuf' in callback with ownership 'None' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gmime3.filter.Filter))
      _installVfunc(klass, "reset");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMimeFilterClass*)klass;

    switch (vfunc)
    {
      case "copy":
      {
        static extern(C) GMimeFilter* _vfuncCopyTramp(GMimeFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.filter.Filter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GMimeFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.copy)
              return (cast(typeof(&_vfuncCopyTramp))_klass.copy)(filter);
            return typeof(return).init;
          }

          gid.gmime3.filter.Filter _dretval;

          try
          {
            _dretval = _obj.vfuncCopy();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.filter.Filter.vfuncCopy");
          }
          auto _retval = _dretval ? cast(GMimeFilter*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.copy = cast(typeof(_klass.copy))&_vfuncCopyTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GMimeFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.filter.Filter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GMimeFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(filter);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.filter.Filter.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter.Filter]
class FilterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter.Filter]
final class FilterGidBuilder : FilterGidBuilderImpl!FilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Filter build() nothrow
  {
    return new Filter(cast(void*)createGObject(Filter._getGType), Yes.Take);
  }
}
