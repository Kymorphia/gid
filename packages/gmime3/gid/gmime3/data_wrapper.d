/// Module for [DataWrapper] class
module gid.gmime3.data_wrapper;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A wrapper for a stream which may be encoded.
*/
@gidGir("DataWrapper", "DataWrapperClass")
class DataWrapper : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_data_wrapper_get_type != &gidSymbolNotFound ? g_mime_data_wrapper_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeDataWrapper";
  }

  /** Returns `this`, for use in `with` statements. */
  override DataWrapper self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.data_wrapper.DataWrapper]
      Returns: New builder object
  */
  static DataWrapperGidBuilder builder() nothrow
  {
    return new DataWrapperGidBuilder;
  }

  /**
      Creates a new #GMimeDataWrapper object.
      Returns: a new data wrapper object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeDataWrapper* _cretval;
      _cretval = g_mime_data_wrapper_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #GMimeDataWrapper object around stream.
  
      Params:
        stream = a #GMimeStream
        encoding = stream's encoding
      Returns: a data wrapper around stream. Since the wrapper owns its
        own reference on the stream, caller is responsible for unrefing
        its own copy.
  */
  static gid.gmime3.data_wrapper.DataWrapper newWithStream(gid.gmime3.stream.Stream stream, gid.gmime3.types.ContentEncoding encoding) nothrow
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_data_wrapper_new_with_stream(stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null, encoding);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.data_wrapper.DataWrapper)(cast(GMimeDataWrapper*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Writes the raw (decoded) data to the output stream.
  
      Params:
        stream = output stream
      Returns: the number of bytes written or %-1 on failure.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteToStream` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncWriteToStream(gid.gmime3.stream.Stream stream)
  {
    auto _klass = cast(GMimeDataWrapperClass*)_vfuncClass;
    if (!_klass.writeToStream)
      return typeof(return).init;

    ptrdiff_t _retval;
    _retval = _klass.writeToStream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the encoding type of the stream wrapped by wrapper.
      Returns: the encoding type of the internal stream.
  */
  gid.gmime3.types.ContentEncoding getEncoding() nothrow
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_data_wrapper_get_encoding(cast(GMimeDataWrapper*)this._cPtr);
    gid.gmime3.types.ContentEncoding _retval = cast(gid.gmime3.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets a reference to the stream wrapped by wrapper.
      Returns: a reference to the internal stream.
  */
  gid.gmime3.stream.Stream getStream() nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_data_wrapper_get_stream(cast(GMimeDataWrapper*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the encoding type of the internal stream.
  
      Params:
        encoding = encoding
  */
  void setEncoding(gid.gmime3.types.ContentEncoding encoding) nothrow
  {
    g_mime_data_wrapper_set_encoding(cast(GMimeDataWrapper*)this._cPtr, encoding);
  }

  /**
      Replaces the wrapper's internal stream with stream. Don't forget,
      if stream is not of the same encoding as the old stream, you'll
      want to call [gid.gmime3.data_wrapper.DataWrapper.setEncoding] as well.
      
      Note: caller is responsible for its own reference on
      stream.
  
      Params:
        stream = a #GMimeStream
  */
  void setStream(gid.gmime3.stream.Stream stream) nothrow
  {
    g_mime_data_wrapper_set_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Writes the raw (decoded) data to the output stream.
  
      Params:
        stream = output stream
      Returns: the number of bytes written or %-1 on failure.
  */
  ptrdiff_t writeToStream(gid.gmime3.stream.Stream stream) nothrow
  {
    ptrdiff_t _retval;
    _retval = g_mime_data_wrapper_write_to_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DataWrapper
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gmime3.data_wrapper.DataWrapper), T.stringof ~ " is not derived from gid.gmime3.data_wrapper.DataWrapper");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteToStream", true)[0]) == gid.gmime3.data_wrapper.DataWrapper))
      _installVfunc(klass, "write_to_stream");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMimeDataWrapperClass*)klass;

    switch (vfunc)
    {
      case "write_to_stream":
      {
        static extern(C) ptrdiff_t _vfuncWriteToStreamTramp(GMimeDataWrapper* wrapper, GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gmime3.data_wrapper.DataWrapper)(cast(void*)wrapper);
          if (!_obj)
          {
            auto _klass = cast(GMimeDataWrapperClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)wrapper);
            if (_klass.writeToStream)
              return (cast(typeof(&_vfuncWriteToStreamTramp))_klass.writeToStream)(wrapper, stream);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncWriteToStream(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(void*)stream, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.data_wrapper.DataWrapper.vfuncWriteToStream");
          }
          return _retval;
        }

        _klass.writeToStream = cast(typeof(_klass.writeToStream))&_vfuncWriteToStreamTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.data_wrapper.DataWrapper]
class DataWrapperGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.data_wrapper.DataWrapper]
final class DataWrapperGidBuilder : DataWrapperGidBuilderImpl!DataWrapperGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataWrapper build() nothrow
  {
    return new DataWrapper(cast(void*)createGObject(DataWrapper._getGType), Yes.Take);
  }
}
