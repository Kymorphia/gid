/// Module for [Converter] interface mixin
module gio.converter_mixin;

public import gio.converter_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import gobject.gid_builder;

/**
    [gio.converter.Converter] is an interface for streaming conversions.
    
    [gio.converter.Converter] is implemented by objects that convert
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
      data after the data in inbuf, the flag [gio.types.ConverterFlags.InputAtEnd] must be set.
      The loop will be (unless some error happens) returning [gio.types.ConverterResult.Converted]
      each time until all data is consumed and all output is produced, then
      [gio.types.ConverterResult.Finished] is returned instead. Note, that [gio.types.ConverterResult.Finished]
      may be returned even if [gio.types.ConverterFlags.InputAtEnd] is not set, for instance
      in a decompression converter where the end of data is detectable from the
      data (and there might even be other data after the end of the compressed data).
      
      When some data has successfully been converted bytes_read and is set to
      the number of bytes read from inbuf, and bytes_written is set to indicate
      how many bytes was written to outbuf. If there are more data to output
      or consume (i.e. unless the [gio.types.ConverterFlags.InputAtEnd] is specified) then
      [gio.types.ConverterResult.Converted] is returned, and if no more data is to be output
      then [gio.types.ConverterResult.Finished] is returned.
      
      On error [gio.types.ConverterResult.Error] is returned and error is set accordingly.
      Some errors need special handling:
      
      [gio.types.IOErrorEnum.NoSpace] is returned if there is not enough space
      to write the resulting converted data, the application should
      call the function again with a larger outbuf to continue.
      
      [gio.types.IOErrorEnum.PartialInput] is returned if there is not enough
      input to fully determine what the conversion should produce,
      and the [gio.types.ConverterFlags.InputAtEnd] flag is not set. This happens for
      example with an incomplete multibyte sequence when converting text,
      or when a regexp matches up to the end of the input (and may match
      further input). It may also happen when inbuf_size is zero and
      there is no more data to produce.
      
      When this happens the application should read more input and then
      call the function again. If further input shows that there is no
      more data call the function again with the same data but with
      the [gio.types.ConverterFlags.InputAtEnd] flag set. This may cause the conversion
      to finish as e.g. in the regexp match case (or, to fail again with
      [gio.types.IOErrorEnum.PartialInput] in e.g. a charset conversion where the
      input is actually partial).
      
      After [gio.converter.Converter.convert] has returned [gio.types.ConverterResult.Finished] the
      converter object is in an invalid state where its not allowed
      to call [gio.converter.Converter.convert] anymore. At this time you can only
      free the object or call [gio.converter.Converter.reset] to reset it to the
      initial state.
      
      If the flag [gio.types.ConverterFlags.Flush] is set then conversion is modified
      to try to write out all internal state to the output. The application
      has to call the function multiple times with the flag set, and when
      the available input has been consumed and all internal state has
      been produced then [gio.types.ConverterResult.Flushed] (or [gio.types.ConverterResult.Finished] if
      really at the end) is returned instead of [gio.types.ConverterResult.Converted].
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
      (typically [gio.types.IOErrorEnum.PartialInput]).
  
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
      Returns: a #GConverterResult, [gio.types.ConverterResult.Error] on error.
      Throws: [ErrorWrap]
  */
  override gio.types.ConverterResult convert(ubyte[] inbuf, ubyte[] outbuf, gio.types.ConverterFlags flags, out size_t bytesRead, out size_t bytesWritten)
  {
    GConverterResult _cretval;
    size_t _inbufSize;
    if (inbuf)
      _inbufSize = cast(size_t)inbuf.length;

    auto _inbuf = cast(void*)inbuf.ptr;
    size_t _outbufSize;
    if (outbuf)
      _outbufSize = cast(size_t)outbuf.length;

    auto _outbuf = cast(void*)outbuf.ptr;
    GError *_err;
    _cretval = g_converter_convert(cast(GConverter*)this._cPtr, _inbuf, _inbufSize, _outbuf, _outbufSize, flags, cast(size_t*)&bytesRead, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.ConverterResult _retval = cast(gio.types.ConverterResult)_cretval;
    return _retval;
  }

  /**
      Resets all internal state in the converter, making it behave
      as if it was just created. If the converter has any internal
      state that would produce output then that output is lost.
  */
  override void reset()
  {
    g_converter_reset(cast(GConverter*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gio.converter.Converter]
template ConverterGidBuilderT()
{
}
