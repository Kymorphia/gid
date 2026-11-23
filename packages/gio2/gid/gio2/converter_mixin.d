/// Module for [Converter] interface mixin
module gid.gio2.converter_mixin;

public import gid.core.basictypes;
public import gid.gio2.converter_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.bytes;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.converter.Converter] is an interface for streaming conversions.
    
    [gid.gio2.converter.Converter] is implemented by objects that convert
    binary data in various ways. The conversion can be
    stateful and may fail at any place.
    
    Some example conversions are: character set conversion,
    compression, decompression and regular expression
    replace.
*/
template ConverterT()
{

  /**
      This is the main operation used when converting data. It is to be called
      multiple times in a loop, and each time it will do some work, i.e.
      producing some output (in outbuf) or consuming some input (from inbuf) or
      both. If its not possible to do any work an error is returned.
      
      Note that a single call may not consume all input (or any input at all).
      Also a call may produce output even if given no input, due to state stored
      in the converter producing output.
      
      If any data was either produced or consumed, and then an error happens, then
      only the successful conversion is reported and the error is returned on the
      next call.
      
      A full conversion loop involves calling this method repeatedly, each time
      giving it new input and space output space. When there is no more input
      data after the data in inbuf, the flag [gid.gio2.types.ConverterFlags.InputAtEnd] must be set.
      The loop will be (unless some error happens) returning [gid.gio2.types.ConverterResult.Converted]
      each time until all data is consumed and all output is produced, then
      [gid.gio2.types.ConverterResult.Finished] is returned instead. Note, that [gid.gio2.types.ConverterResult.Finished]
      may be returned even if [gid.gio2.types.ConverterFlags.InputAtEnd] is not set, for instance
      in a decompression converter where the end of data is detectable from the
      data (and there might even be other data after the end of the compressed data).
      
      When some data has successfully been converted bytes_read and is set to
      the number of bytes read from inbuf, and bytes_written is set to indicate
      how many bytes was written to outbuf. If there are more data to output
      or consume (i.e. unless the [gid.gio2.types.ConverterFlags.InputAtEnd] is specified) then
      [gid.gio2.types.ConverterResult.Converted] is returned, and if no more data is to be output
      then [gid.gio2.types.ConverterResult.Finished] is returned.
      
      On error [gid.gio2.types.ConverterResult.Error] is returned and error is set accordingly.
      Some errors need special handling:
      
      [gid.gio2.types.IOErrorEnum.NoSpace] is returned if there is not enough space
      to write the resulting converted data, the application should
      call the function again with a larger outbuf to continue.
      
      [gid.gio2.types.IOErrorEnum.PartialInput] is returned if there is not enough
      input to fully determine what the conversion should produce,
      and the [gid.gio2.types.ConverterFlags.InputAtEnd] flag is not set. This happens for
      example with an incomplete multibyte sequence when converting text,
      or when a regexp matches up to the end of the input (and may match
      further input). It may also happen when inbuf_size is zero and
      there is no more data to produce.
      
      When this happens the application should read more input and then
      call the function again. If further input shows that there is no
      more data call the function again with the same data but with
      the [gid.gio2.types.ConverterFlags.InputAtEnd] flag set. This may cause the conversion
      to finish as e.g. in the regexp match case (or, to fail again with
      [gid.gio2.types.IOErrorEnum.PartialInput] in e.g. a charset conversion where the
      input is actually partial).
      
      After [gid.gio2.converter.Converter.convert] has returned [gid.gio2.types.ConverterResult.Finished] the
      converter object is in an invalid state where its not allowed
      to call [gid.gio2.converter.Converter.convert] anymore. At this time you can only
      free the object or call [gid.gio2.converter.Converter.reset] to reset it to the
      initial state.
      
      If the flag [gid.gio2.types.ConverterFlags.Flush] is set then conversion is modified
      to try to write out all internal state to the output. The application
      has to call the function multiple times with the flag set, and when
      the available input has been consumed and all internal state has
      been produced then [gid.gio2.types.ConverterResult.Flushed] (or [gid.gio2.types.ConverterResult.Finished] if
      really at the end) is returned instead of [gid.gio2.types.ConverterResult.Converted].
      This is somewhat similar to what happens at the end of the input stream,
      but done in the middle of the data.
      
      This has different meanings for different conversions. For instance
      in a compression converter it would mean that we flush all the
      compression state into output such that if you uncompress the
      compressed data you get back all the input data. Doing this may
      make the final file larger due to padding though. Another example
      is a regexp conversion, where if you at the end of the flushed data
      have a match, but there is also a potential longer match. In the
      non-flushed case we would ask for more input, but when flushing we
      treat this as the end of input and do the match.
      
      Flushing is not always possible (like if a charset converter flushes
      at a partial multibyte sequence). Converters are supposed to try
      to produce as much output as possible and then return an error
      (typically [gid.gio2.types.IOErrorEnum.PartialInput]).
  
      Params:
        inbuf = the buffer
                  containing the data to convert.
        outbuf = a
             buffer to write converted data in.
        flags = a #GConverterFlags controlling the conversion details
        bytesRead = will be set to the number of bytes read
             from inbuf on success
        bytesWritten = will be set to the number of bytes
             written to outbuf on success
      Returns: a #GConverterResult, [gid.gio2.types.ConverterResult.Error] on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConvert`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.types.ConverterResult vfuncConvert(ubyte[] inbuf, ubyte[] outbuf, gid.gio2.types.ConverterFlags flags, out size_t bytesRead, out size_t bytesWritten)
  {
    auto _klass = cast(GConverterIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.converter.Converter._getGType);
    if (!_klass || !_klass.convert)
      return typeof(return).init;

    GConverterResult _cretval;
    size_t _inbufSize;
    if (inbuf)
      _inbufSize = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outbufSize;
    if (outbuf)
      _outbufSize = cast(size_t)outbuf.length;

    auto _outbuf = cast(ubyte*)outbuf.ptr;
    GError *_err;
    _cretval = _klass.convert(cast(GConverter*)this._cPtr, _inbuf, _inbufSize, _outbuf, _outbufSize, flags, cast(size_t*)&bytesRead, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.ConverterResult _retval = cast(gid.gio2.types.ConverterResult)_cretval;
    return _retval;
  }

  /**
      Resets all internal state in the converter, making it behave
      as if it was just created. If the converter has any internal
      state that would produce output then that output is lost.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReset()
  {
    auto _klass = cast(GConverterIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.converter.Converter._getGType);
    if (!_klass || !_klass.reset)
      return;

    _klass.reset(cast(GConverter*)this._cPtr);
  }

  /**
      This is the main operation used when converting data. It is to be called
      multiple times in a loop, and each time it will do some work, i.e.
      producing some output (in outbuf) or consuming some input (from inbuf) or
      both. If its not possible to do any work an error is returned.
      
      Note that a single call may not consume all input (or any input at all).
      Also a call may produce output even if given no input, due to state stored
      in the converter producing output.
      
      If any data was either produced or consumed, and then an error happens, then
      only the successful conversion is reported and the error is returned on the
      next call.
      
      A full conversion loop involves calling this method repeatedly, each time
      giving it new input and space output space. When there is no more input
      data after the data in inbuf, the flag [gid.gio2.types.ConverterFlags.InputAtEnd] must be set.
      The loop will be (unless some error happens) returning [gid.gio2.types.ConverterResult.Converted]
      each time until all data is consumed and all output is produced, then
      [gid.gio2.types.ConverterResult.Finished] is returned instead. Note, that [gid.gio2.types.ConverterResult.Finished]
      may be returned even if [gid.gio2.types.ConverterFlags.InputAtEnd] is not set, for instance
      in a decompression converter where the end of data is detectable from the
      data (and there might even be other data after the end of the compressed data).
      
      When some data has successfully been converted bytes_read and is set to
      the number of bytes read from inbuf, and bytes_written is set to indicate
      how many bytes was written to outbuf. If there are more data to output
      or consume (i.e. unless the [gid.gio2.types.ConverterFlags.InputAtEnd] is specified) then
      [gid.gio2.types.ConverterResult.Converted] is returned, and if no more data is to be output
      then [gid.gio2.types.ConverterResult.Finished] is returned.
      
      On error [gid.gio2.types.ConverterResult.Error] is returned and error is set accordingly.
      Some errors need special handling:
      
      [gid.gio2.types.IOErrorEnum.NoSpace] is returned if there is not enough space
      to write the resulting converted data, the application should
      call the function again with a larger outbuf to continue.
      
      [gid.gio2.types.IOErrorEnum.PartialInput] is returned if there is not enough
      input to fully determine what the conversion should produce,
      and the [gid.gio2.types.ConverterFlags.InputAtEnd] flag is not set. This happens for
      example with an incomplete multibyte sequence when converting text,
      or when a regexp matches up to the end of the input (and may match
      further input). It may also happen when inbuf_size is zero and
      there is no more data to produce.
      
      When this happens the application should read more input and then
      call the function again. If further input shows that there is no
      more data call the function again with the same data but with
      the [gid.gio2.types.ConverterFlags.InputAtEnd] flag set. This may cause the conversion
      to finish as e.g. in the regexp match case (or, to fail again with
      [gid.gio2.types.IOErrorEnum.PartialInput] in e.g. a charset conversion where the
      input is actually partial).
      
      After [gid.gio2.converter.Converter.convert] has returned [gid.gio2.types.ConverterResult.Finished] the
      converter object is in an invalid state where its not allowed
      to call [gid.gio2.converter.Converter.convert] anymore. At this time you can only
      free the object or call [gid.gio2.converter.Converter.reset] to reset it to the
      initial state.
      
      If the flag [gid.gio2.types.ConverterFlags.Flush] is set then conversion is modified
      to try to write out all internal state to the output. The application
      has to call the function multiple times with the flag set, and when
      the available input has been consumed and all internal state has
      been produced then [gid.gio2.types.ConverterResult.Flushed] (or [gid.gio2.types.ConverterResult.Finished] if
      really at the end) is returned instead of [gid.gio2.types.ConverterResult.Converted].
      This is somewhat similar to what happens at the end of the input stream,
      but done in the middle of the data.
      
      This has different meanings for different conversions. For instance
      in a compression converter it would mean that we flush all the
      compression state into output such that if you uncompress the
      compressed data you get back all the input data. Doing this may
      make the final file larger due to padding though. Another example
      is a regexp conversion, where if you at the end of the flushed data
      have a match, but there is also a potential longer match. In the
      non-flushed case we would ask for more input, but when flushing we
      treat this as the end of input and do the match.
      
      Flushing is not always possible (like if a charset converter flushes
      at a partial multibyte sequence). Converters are supposed to try
      to produce as much output as possible and then return an error
      (typically [gid.gio2.types.IOErrorEnum.PartialInput]).
  
      Params:
        inbuf = the buffer
                  containing the data to convert.
        outbuf = a
             buffer to write converted data in.
        flags = a #GConverterFlags controlling the conversion details
        bytesRead = will be set to the number of bytes read
             from inbuf on success
        bytesWritten = will be set to the number of bytes
             written to outbuf on success
      Returns: a #GConverterResult, [gid.gio2.types.ConverterResult.Error] on error.
      Throws: [ErrorWrap]
  */
  override gid.gio2.types.ConverterResult convert(ubyte[] inbuf, ubyte[] outbuf, gid.gio2.types.ConverterFlags flags, out size_t bytesRead, out size_t bytesWritten)
  {
    GConverterResult _cretval;
    size_t _inbufSize;
    if (inbuf)
      _inbufSize = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outbufSize;
    if (outbuf)
      _outbufSize = cast(size_t)outbuf.length;

    auto _outbuf = cast(ubyte*)outbuf.ptr;
    GError *_err;
    _cretval = g_converter_convert(cast(GConverter*)this._cPtr, _inbuf, _inbufSize, _outbuf, _outbufSize, flags, cast(size_t*)&bytesRead, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.ConverterResult _retval = cast(gid.gio2.types.ConverterResult)_cretval;
    return _retval;
  }

  /**
      Applies converter to the data in bytes.
  
      Params:
        bytes = the data to convert
      Returns: A newly-allocated
          [gid.glib2.bytes.Bytes] with the converted data, or `NULL` if an error
          occurred
      Throws: [ErrorWrap]
  */
  override gid.glib2.bytes.Bytes convertBytes(gid.glib2.bytes.Bytes bytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = g_converter_convert_bytes(cast(GConverter*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Resets all internal state in the converter, making it behave
      as if it was just created. If the converter has any internal
      state that would produce output then that output is lost.
  */
  override void reset() nothrow
  {
    g_converter_reset(cast(GConverter*)this._cPtr);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.converter.Converter (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_converter_Converter(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConvert", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReset", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.converter.Converter vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_converter_Converter(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConvert", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_converter_Converter(iface, "convert");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_converter_Converter(iface, "reset");
  }

  private static void _installIfaceVfunc_gid_gio2_converter_Converter(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GConverterIface*)iface;

    switch (vfunc)
    {
      case "convert":
      {
        static extern(C) GConverterResult _vfuncConvertTramp(GConverter* converter, void* inbuf, size_t inbufSize, void* outbuf, size_t outbufSize, GConverterFlags flags, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)converter);
          if (!_obj)
          {
            auto _klass = cast(GConverterIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)converter), gid.gio2.converter.Converter._getGType);
            if (_klass && _klass.convert)
              return (cast(typeof(&_vfuncConvertTramp))_klass.convert)(converter, inbuf, inbufSize, outbuf, outbufSize, flags, bytesRead, bytesWritten, _err);
            return typeof(return).init;
          }

          gid.gio2.types.ConverterResult _dretval;
          ubyte[] _inbuf;
          _inbuf.length = inbufSize;
          _inbuf[0 .. inbufSize] = (cast(const(ubyte)*)inbuf)[0 .. inbufSize];
          ubyte[] _outbuf;
          _outbuf.length = outbufSize;
          _outbuf[0 .. outbufSize] = (cast(const(ubyte)*)outbuf)[0 .. outbufSize];

          try
          {
            _dretval = _obj.vfuncConvert(_inbuf, _outbuf, flags, *bytesRead, *bytesWritten);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GConverterResult)_dretval;

          return _retval;
        }

        _klass.convert = cast(typeof(_klass.convert))&_vfuncConvertTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GConverter* converter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)converter);
          if (!_obj)
          {
            auto _klass = cast(GConverterIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)converter), gid.gio2.converter.Converter._getGType);
            if (_klass && _klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(converter);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.converter.Converter.vfuncReset");
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

/// Fluent builder implementation template for [gid.gio2.converter.Converter]
template ConverterGidBuilderT()
{
}
