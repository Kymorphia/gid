/// Module for [IOChannel] class
module gid.glib2.iochannel;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.error;
import gid.glib2.string_;
import gid.glib2.types;
import gid.gobject2.boxed;

/**
    The [gid.glib2.iochannel.IOChannel] data type aims to provide a portable method for
    using file descriptors, pipes, and sockets, and integrating them
    into the main event loop (see [gid.glib2.main_context.MainContext]). Currently,
    full support is available on UNIX platforms; support for Windows
    is only partially complete.
    
    To create a new [gid.glib2.iochannel.IOChannel] on UNIX systems use
    [gid.glib2.iochannel.IOChannel.unixNew]. This works for plain file descriptors,
    pipes and sockets. Alternatively, a channel can be created for a
    file in a system independent manner using [gid.glib2.iochannel.IOChannel.newFile].
    
    Once a [gid.glib2.iochannel.IOChannel] has been created, it can be used in a generic
    manner with the functions [gid.glib2.iochannel.IOChannel.readChars],
    [gid.glib2.iochannel.IOChannel.writeChars], [gid.glib2.iochannel.IOChannel.seekPosition],
    and [gid.glib2.iochannel.IOChannel.shutdown].
    
    To add a [gid.glib2.iochannel.IOChannel] to the main event loop, use `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full`. Here you specify which events you are
    interested in on the [gid.glib2.iochannel.IOChannel], and provide a function to be called
    whenever these events occur.
    
    [gid.glib2.iochannel.IOChannel] instances are created with an initial reference count of 1.
    [gid.glib2.iochannel.IOChannel.ref_] and [gid.glib2.iochannel.IOChannel.unref] can be used to
    increment or decrement the reference count respectively. When the
    reference count falls to 0, the [gid.glib2.iochannel.IOChannel] is freed. (Though it
    isn’t closed automatically, unless it was created using
    [gid.glib2.iochannel.IOChannel.newFile].) Using `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full` increments a channel’s reference count.
    
    The new functions [gid.glib2.iochannel.IOChannel.readChars],
    [gid.glib2.iochannel.IOChannel.readLine], [gid.glib2.iochannel.IOChannel.readLineString],
    [gid.glib2.iochannel.IOChannel.readToEnd], [gid.glib2.iochannel.IOChannel.writeChars],
    [gid.glib2.iochannel.IOChannel.seekPosition], and [gid.glib2.iochannel.IOChannel.flush]
    should not be mixed with the deprecated functions
    [gid.glib2.iochannel.IOChannel.read], [gid.glib2.iochannel.IOChannel.write], and
    [gid.glib2.iochannel.IOChannel.seek] on the same channel.
*/
class IOChannel : gid.gobject2.boxed.BoxedWrap!(g_io_channel_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override IOChannel self() nothrow
  {
    return this;
  }

  /**
      Open a file filename as a #GIOChannel using mode mode. This
      channel will be closed when the last reference to it is dropped,
      so there is no need to call [gid.glib2.iochannel.IOChannel.close] (though doing
      so will not cause problems, as long as no attempt is made to
      access the channel after it is closed).
  
      Params:
        filename = A string containing the name of a file
        mode = One of "r", "w", "a", "r+", "w+", "a+". These have
                 the same meaning as in fopen()
      Returns: A #GIOChannel on success, null on failure.
      Throws: [IOChannelException]
  */
  static gid.glib2.iochannel.IOChannel newFile(string filename, string mode)
  {
    GIOChannel* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    const(char)* _mode = mode.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_io_channel_new_file(_filename, _mode, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GIOChannel given a file descriptor. On UNIX systems
      this works for plain files, pipes, and sockets.
      
      The returned #GIOChannel has a reference count of 1.
      
      The default encoding for #GIOChannel is UTF-8. If your application
      is reading output from a command using via pipe, you may need to set
      the encoding to the encoding of the current locale (see
      [gid.glib2.global.getCharset]) with the [gid.glib2.iochannel.IOChannel.setEncoding] function.
      By default, the fd passed will not be closed when the final reference
      to the #GIOChannel data structure is dropped.
      
      If you want to read raw binary data without interpretation, then
      call the [gid.glib2.iochannel.IOChannel.setEncoding] function with null for the
      encoding argument.
      
      This function is available in GLib on Windows, too, but you should
      avoid using it on Windows. The domain of file descriptors and
      sockets overlap. There is no way for GLib to know which one you mean
      in case the argument you pass to this function happens to be both a
      valid file descriptor and socket. If that happens a warning is
      issued, and GLib assumes that it is the file descriptor you mean.
  
      Params:
        fd = a file descriptor.
      Returns: a new #GIOChannel.
  */
  static gid.glib2.iochannel.IOChannel unixNew(int fd) nothrow
  {
    GIOChannel* _cretval;
    _cretval = g_io_channel_unix_new(fd);
    auto _retval = _cretval ? new gid.glib2.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Close an IO channel. Any pending data to be written will be
      flushed, ignoring errors. The channel will not be freed until the
      last reference is dropped using [gid.glib2.iochannel.IOChannel.unref].
  
      Deprecated: Use [gid.glib2.iochannel.IOChannel.shutdown] instead.
  */
  void close() nothrow
  {
    g_io_channel_close(cast(GIOChannel*)this._cPtr);
  }

  /**
      Flushes the write buffer for the GIOChannel.
      Returns: the status of the operation: One of
          [gid.glib2.types.IOStatus.Normal], [gid.glib2.types.IOStatus.Again], or
          [gid.glib2.types.IOStatus.Error].
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus flush()
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_flush(cast(GIOChannel*)this._cPtr, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      This function returns a #GIOCondition depending on whether there
      is data to be read/space to write data in the internal buffers in
      the #GIOChannel. Only the flags [gid.glib2.types.IOCondition.In] and [gid.glib2.types.IOCondition.Out] may be set.
      Returns: A #GIOCondition
  */
  gid.glib2.types.IOCondition getBufferCondition() nothrow
  {
    GIOCondition _cretval;
    _cretval = g_io_channel_get_buffer_condition(cast(GIOChannel*)this._cPtr);
    gid.glib2.types.IOCondition _retval = cast(gid.glib2.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Gets the buffer size.
      Returns: the size of the buffer.
  */
  size_t getBufferSize() nothrow
  {
    size_t _retval;
    _retval = g_io_channel_get_buffer_size(cast(GIOChannel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether channel is buffered.
      Returns: true if the channel is buffered.
  */
  bool getBuffered() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_io_channel_get_buffered(cast(GIOChannel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the file/socket/whatever associated with channel
      will be closed when channel receives its final unref and is
      destroyed. The default value of this is true for channels created
      by g_io_channel_new_file (), and false for all other channels.
      Returns: true if the channel will be closed, false otherwise.
  */
  bool getCloseOnUnref() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_io_channel_get_close_on_unref(cast(GIOChannel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the encoding for the input/output of the channel.
      The internal encoding is always UTF-8. The encoding null
      makes the channel safe for binary data.
      Returns: A string containing the encoding, this string is
          owned by GLib and must not be freed.
  */
  string getEncoding() nothrow
  {
    const(char)* _cretval;
    _cretval = g_io_channel_get_encoding(cast(GIOChannel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the current flags for a #GIOChannel, including read-only
      flags such as [gid.glib2.types.IOFlags.IsReadable].
      
      The values of the flags [gid.glib2.types.IOFlags.IsReadable] and [gid.glib2.types.IOFlags.IsWritable]
      are cached for internal use by the channel when it is created.
      If they should change at some later point (e.g. partial shutdown
      of a socket with the UNIX shutdown() function), the user
      should immediately call [gid.glib2.iochannel.IOChannel.getFlags] to update
      the internal values of these flags.
      Returns: the flags which are set on the channel
  */
  gid.glib2.types.IOFlags getFlags() nothrow
  {
    GIOFlags _cretval;
    _cretval = g_io_channel_get_flags(cast(GIOChannel*)this._cPtr);
    gid.glib2.types.IOFlags _retval = cast(gid.glib2.types.IOFlags)_cretval;
    return _retval;
  }

  /**
      This returns the string that #GIOChannel uses to determine
      where in the file a line break occurs. A value of null
      indicates autodetection. Since 2.84, the return value is always
      nul-terminated.
  
      Params:
        length = a location to return the length of the line terminator
      Returns: The line termination string. This value
          is owned by GLib and must not be freed.
  */
  string getLineTerm(out int length) nothrow
  {
    const(char)* _cretval;
    _cretval = g_io_channel_get_line_term(cast(GIOChannel*)this._cPtr, cast(int*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Initializes a #GIOChannel struct.
      
      This is called by each of the above functions when creating a
      #GIOChannel, and so is not often needed by the application
      programmer (unless you are creating a new type of #GIOChannel).
  */
  void init_() nothrow
  {
    g_io_channel_init(cast(GIOChannel*)this._cPtr);
  }

  /**
      Reads data from a #GIOChannel.
  
      Params:
        buf = a buffer to read the data into (which should be at least
                count bytes long)
        bytesRead = returns the number of bytes actually read
      Returns: [gid.glib2.types.IOError.None] if the operation was successful.
  
      Deprecated: Use [gid.glib2.iochannel.IOChannel.readChars] instead.
  */
  gid.glib2.types.IOError read(ref ubyte[] buf, out size_t bytesRead) nothrow
  {
    GIOError _cretval;
    size_t _count;
    _count = cast(size_t)buf.length;
    _cretval = g_io_channel_read(cast(GIOChannel*)this._cPtr, buf.ptr, _count, cast(size_t*)&bytesRead);
    gid.glib2.types.IOError _retval = cast(gid.glib2.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [gid.glib2.iochannel.IOChannel.read] with the new API.
  
      Params:
        buf = a buffer to read data into
        bytesRead = The number of bytes read. This may be
              zero even on success if count < 6 and the channel's encoding
              is non-null. This indicates that the next UTF-8 character is
              too wide for the buffer.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus readChars(ref ubyte[] buf, out size_t bytesRead)
  {
    GIOStatus _cretval;
    size_t _count;
    _count = cast(size_t)buf.length;
    GError *_err;
    _cretval = g_io_channel_read_chars(cast(GIOChannel*)this._cPtr, buf.ptr, _count, cast(size_t*)&bytesRead, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Reads a line, including the terminating character(s),
      from a #GIOChannel into a newly-allocated string.
      str_return will contain allocated memory if the return
      is [gid.glib2.types.IOStatus.Normal].
  
      Params:
        strReturn = The line read from the #GIOChannel, including the
                       line terminator. This data should be freed with [gid.glib2.global.gfree]
                       when no longer needed. This is a nul-terminated string.
                       If a length of zero is returned, this will be null instead.
        length = location to store length of the read data, or null
        terminatorPos = location to store position of line terminator, or null
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus readLine(out string strReturn, out size_t length, out size_t terminatorPos)
  {
    GIOStatus _cretval;
    char* _strReturn;
    GError *_err;
    _cretval = g_io_channel_read_line(cast(GIOChannel*)this._cPtr, &_strReturn, cast(size_t*)&length, cast(size_t*)&terminatorPos, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    strReturn = _strReturn.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Reads a line from a #GIOChannel, using a #GString as a buffer.
  
      Params:
        buffer = a #GString into which the line will be written.
                   If buffer already contains data, the old data will
                   be overwritten.
        terminatorPos = location to store position of line terminator, or null
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus readLineString(gid.glib2.string_.String buffer, out size_t terminatorPos)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_read_line_string(cast(GIOChannel*)this._cPtr, buffer ? cast(GString*)buffer._cPtr(No.Dup) : null, cast(size_t*)&terminatorPos, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Reads all the remaining data from the file.
  
      Params:
        strReturn = Location to
                       store a pointer to a string holding the remaining data in the
                       #GIOChannel. This data should be freed with [gid.glib2.global.gfree] when no
                       longer needed. This data is terminated by an extra nul
                       character, but there may be other nuls in the intervening data.
      Returns: [gid.glib2.types.IOStatus.Normal] on success.
            This function never returns [gid.glib2.types.IOStatus.Eof].
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus readToEnd(out ubyte[] strReturn)
  {
    GIOStatus _cretval;
    size_t _length;
    ubyte* _strReturn;
    GError *_err;
    _cretval = g_io_channel_read_to_end(cast(GIOChannel*)this._cPtr, &_strReturn, &_length, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    strReturn.length = _length;
    strReturn[0 .. $] = (cast(ubyte*)_strReturn)[0 .. _length];
    gFree(cast(void*)_strReturn);
    return _retval;
  }

  /**
      Reads a Unicode character from channel.
      This function cannot be called on a channel with null encoding.
  
      Params:
        thechar = a location to return a character
      Returns: a #GIOStatus
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus readUnichar(out dchar thechar)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_read_unichar(cast(GIOChannel*)this._cPtr, cast(dchar*)&thechar, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the current position in the #GIOChannel, similar to the standard
      library function fseek().
  
      Params:
        offset = an offset, in bytes, which is added to the position specified
                   by type
        type = the position in the file, which can be [gid.glib2.types.SeekType.Cur] (the current
                 position), [gid.glib2.types.SeekType.Set] (the start of the file), or [gid.glib2.types.SeekType.End]
                 (the end of the file)
      Returns: [gid.glib2.types.IOError.None] if the operation was successful.
  
      Deprecated: Use [gid.glib2.iochannel.IOChannel.seekPosition] instead.
  */
  gid.glib2.types.IOError seek(long offset, gid.glib2.types.SeekType type) nothrow
  {
    GIOError _cretval;
    _cretval = g_io_channel_seek(cast(GIOChannel*)this._cPtr, offset, type);
    gid.glib2.types.IOError _retval = cast(gid.glib2.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [gid.glib2.iochannel.IOChannel.seek] with the new API.
  
      Params:
        offset = The offset in bytes from the position specified by type
        type = a #GSeekType. The type [gid.glib2.types.SeekType.Cur] is only allowed in those
                               cases where a call to g_io_channel_set_encoding ()
                               is allowed. See the documentation for
                               g_io_channel_set_encoding () for details.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus seekPosition(long offset, gid.glib2.types.SeekType type)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_seek_position(cast(GIOChannel*)this._cPtr, offset, type, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the buffer size.
  
      Params:
        size = the size of the buffer, or 0 to let GLib pick a good size
  */
  void setBufferSize(size_t size) nothrow
  {
    g_io_channel_set_buffer_size(cast(GIOChannel*)this._cPtr, size);
  }

  /**
      The buffering state can only be set if the channel's encoding
      is null. For any other encoding, the channel must be buffered.
      
      A buffered channel can only be set unbuffered if the channel's
      internal buffers have been flushed. Newly created channels or
      channels which have returned [gid.glib2.types.IOStatus.Eof]
      not require such a flush. For write-only channels, a call to
      g_io_channel_flush () is sufficient. For all other channels,
      the buffers may be flushed by a call to g_io_channel_seek_position ().
      This includes the possibility of seeking with seek type [gid.glib2.types.SeekType.Cur]
      and an offset of zero. Note that this means that socket-based
      channels cannot be set unbuffered once they have had data
      read from them.
      
      On unbuffered channels, it is safe to mix read and write
      calls from the new and old APIs, if this is necessary for
      maintaining old code.
      
      The default state of the channel is buffered.
  
      Params:
        buffered = whether to set the channel buffered or unbuffered
  */
  void setBuffered(bool buffered) nothrow
  {
    g_io_channel_set_buffered(cast(GIOChannel*)this._cPtr, buffered);
  }

  /**
      Whether to close the channel on the final unref of the #GIOChannel
      data structure. The default value of this is true for channels
      created by g_io_channel_new_file (), and false for all other channels.
      
      Setting this flag to true for a channel you have already closed
      can cause problems when the final reference to the #GIOChannel is dropped.
  
      Params:
        doClose = Whether to close the channel on the final unref of
                     the GIOChannel data structure.
  */
  void setCloseOnUnref(bool doClose) nothrow
  {
    g_io_channel_set_close_on_unref(cast(GIOChannel*)this._cPtr, doClose);
  }

  /**
      Sets the encoding for the input/output of the channel.
      The internal encoding is always UTF-8. The default encoding
      for the external file is UTF-8.
      
      The encoding null is safe to use with binary data.
      
      The encoding can only be set if one of the following conditions
      is true:
      
      - The channel was just created, and has not been written to or read from yet.
      
      - The channel is write-only.
      
      - The channel is a file, and the file pointer was just repositioned
        by a call to [gid.glib2.iochannel.IOChannel.seekPosition]. (This flushes all the
        internal buffers.)
      
      - The current encoding is null or UTF-8.
      
      - One of the (new API) read functions has just returned [gid.glib2.types.IOStatus.Eof]
        (or, in the case of [gid.glib2.iochannel.IOChannel.readToEnd], [gid.glib2.types.IOStatus.Normal]).
      
      -  One of the functions [gid.glib2.iochannel.IOChannel.readChars] or
         [gid.glib2.iochannel.IOChannel.readUnichar] has returned [gid.glib2.types.IOStatus.Again] or
         [gid.glib2.types.IOStatus.Error]. This may be useful in the case of
         [gid.glib2.types.ConvertError.IllegalSequence].
         Returning one of these statuses from [gid.glib2.iochannel.IOChannel.readLine],
         [gid.glib2.iochannel.IOChannel.readLineString], or [gid.glib2.iochannel.IOChannel.readToEnd]
         does not guarantee that the encoding can be changed.
      
      Channels which do not meet one of the above conditions cannot call
      [gid.glib2.iochannel.IOChannel.seekPosition] with an offset of [gid.glib2.types.SeekType.Cur], and, if
      they are "seekable", cannot call [gid.glib2.iochannel.IOChannel.writeChars] after
      calling one of the API "read" functions.
  
      Params:
        encoding = the encoding type
      Returns: [gid.glib2.types.IOStatus.Normal] if the encoding was successfully set
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus setEncoding(string encoding = null)
  {
    GIOStatus _cretval;
    const(char)* _encoding = encoding.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_io_channel_set_encoding(cast(GIOChannel*)this._cPtr, _encoding, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the (writeable) flags in channel to (flags & [gid.glib2.types.IOFlags.SetMask]).
  
      Params:
        flags = the flags to set on the IO channel
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus setFlags(gid.glib2.types.IOFlags flags)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_set_flags(cast(GIOChannel*)this._cPtr, flags, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      This sets the string that #GIOChannel uses to determine
      where in the file a line break occurs.
  
      Params:
        lineTerm = The line termination string. Use null for
                      autodetect.  Autodetection breaks on "\n", "\r\n", "\r", "\0",
                      and the Unicode paragraph separator. Autodetection should not be
                      used for anything other than file-based channels.
  */
  void setLineTerm(string lineTerm = null) nothrow
  {
    int _length;
    if (lineTerm)
      _length = cast(int)lineTerm.length;

    auto _lineTerm = cast(char*)lineTerm.ptr;
    g_io_channel_set_line_term(cast(GIOChannel*)this._cPtr, _lineTerm, _length);
  }

  /**
      Close an IO channel. Any pending data to be written will be
      flushed if flush is true. The channel will not be freed until the
      last reference is dropped using [gid.glib2.iochannel.IOChannel.unref].
  
      Params:
        flush = if true, flush pending
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus shutdown(bool flush)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_shutdown(cast(GIOChannel*)this._cPtr, flush, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Returns the file descriptor of the #GIOChannel.
      
      On Windows this function returns the file descriptor or socket of
      the #GIOChannel.
      Returns: the file descriptor of the #GIOChannel.
  */
  int unixGetFd() nothrow
  {
    int _retval;
    _retval = g_io_channel_unix_get_fd(cast(GIOChannel*)this._cPtr);
    return _retval;
  }

  /**
      Writes data to a #GIOChannel.
  
      Params:
        buf = the buffer containing the data to write
        bytesWritten = the number of bytes actually written
      Returns: [gid.glib2.types.IOError.None] if the operation was successful.
  
      Deprecated: Use [gid.glib2.iochannel.IOChannel.writeChars] instead.
  */
  gid.glib2.types.IOError write(string buf, out size_t bytesWritten) nothrow
  {
    GIOError _cretval;
    size_t _count;
    if (buf)
      _count = cast(size_t)buf.length;

    auto _buf = cast(char*)buf.ptr;
    _cretval = g_io_channel_write(cast(GIOChannel*)this._cPtr, _buf, _count, cast(size_t*)&bytesWritten);
    gid.glib2.types.IOError _retval = cast(gid.glib2.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [gid.glib2.iochannel.IOChannel.write] with the new API.
      
      On seekable channels with encodings other than null or UTF-8, generic
      mixing of reading and writing is not allowed. A call to g_io_channel_write_chars ()
      may only be made on a channel from which data has been read in the
      cases described in the documentation for g_io_channel_set_encoding ().
  
      Params:
        buf = a buffer to write data from
        bytesWritten = The number of bytes written. This can be nonzero
                          even if the return value is not [gid.glib2.types.IOStatus.Normal].
                          If the return value is [gid.glib2.types.IOStatus.Normal] and the
                          channel is blocking, this will always be equal
                          to count if count >= 0.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus writeChars(ubyte[] buf, out size_t bytesWritten)
  {
    GIOStatus _cretval;
    ptrdiff_t _count;
    if (buf)
      _count = cast(ptrdiff_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    GError *_err;
    _cretval = g_io_channel_write_chars(cast(GIOChannel*)this._cPtr, _buf, _count, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Writes a Unicode character to channel.
      This function cannot be called on a channel with null encoding.
  
      Params:
        thechar = a character
      Returns: a #GIOStatus
      Throws: [IOChannelException]
  */
  gid.glib2.types.IOStatus writeUnichar(dchar thechar)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_write_unichar(cast(GIOChannel*)this._cPtr, thechar, &_err);
    if (_err)
      throw new IOChannelException(_err, Yes.Take);
    gid.glib2.types.IOStatus _retval = cast(gid.glib2.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Converts an `errno` error number to a #GIOChannelError.
  
      Params:
        en = an `errno` error number, e.g. `EINVAL`
      Returns: a #GIOChannelError error number, e.g.
             [gid.glib2.types.IOChannelError.Inval].
  */
  static gid.glib2.types.IOChannelError errorFromErrno(int en) nothrow
  {
    GIOChannelError _cretval;
    _cretval = g_io_channel_error_from_errno(en);
    gid.glib2.types.IOChannelError _retval = cast(gid.glib2.types.IOChannelError)_cretval;
    return _retval;
  }

  /** */
  static gid.glib2.types.Quark errorQuark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_io_channel_error_quark();
    return _retval;
  }
}

class IOChannelException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.glib2.iochannel.IOChannel.errorQuark, cast(int)code, msg);
  }

  alias Code = IOChannelError;
}
