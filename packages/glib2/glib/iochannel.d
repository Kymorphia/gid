/// Module for [IOChannel] class
module glib.iochannel;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.string_;
import glib.types;
import gobject.boxed;

/**
    The [glib.iochannel.IOChannel] data type aims to provide a portable method for
    using file descriptors, pipes, and sockets, and integrating them
    into the main event loop (see [glib.main_context.MainContext]). Currently,
    full support is available on UNIX platforms; support for Windows
    is only partially complete.
    
    To create a new [glib.iochannel.IOChannel] on UNIX systems use
    [glib.iochannel.IOChannel.unixNew]. This works for plain file descriptors,
    pipes and sockets. Alternatively, a channel can be created for a
    file in a system independent manner using [glib.iochannel.IOChannel.newFile].
    
    Once a [glib.iochannel.IOChannel] has been created, it can be used in a generic
    manner with the functions [glib.iochannel.IOChannel.readChars],
    [glib.iochannel.IOChannel.writeChars], [glib.iochannel.IOChannel.seekPosition],
    and [glib.iochannel.IOChannel.shutdown].
    
    To add a [glib.iochannel.IOChannel] to the main event loop, use `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full`. Here you specify which events you are
    interested in on the [glib.iochannel.IOChannel], and provide a function to be called
    whenever these events occur.
    
    [glib.iochannel.IOChannel] instances are created with an initial reference count of 1.
    [glib.iochannel.IOChannel.ref_] and [glib.iochannel.IOChannel.unref] can be used to
    increment or decrement the reference count respectively. When the
    reference count falls to 0, the [glib.iochannel.IOChannel] is freed. (Though it
    isn’t closed automatically, unless it was created using
    [glib.iochannel.IOChannel.newFile].) Using `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full` increments a channel’s reference count.
    
    The new functions [glib.iochannel.IOChannel.readChars],
    [glib.iochannel.IOChannel.readLine], [glib.iochannel.IOChannel.readLineString],
    [glib.iochannel.IOChannel.readToEnd], [glib.iochannel.IOChannel.writeChars],
    [glib.iochannel.IOChannel.seekPosition], and [glib.iochannel.IOChannel.flush]
    should not be mixed with the deprecated functions
    [glib.iochannel.IOChannel.read], [glib.iochannel.IOChannel.write], and
    [glib.iochannel.IOChannel.seek] on the same channel.
*/
class IOChannel : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_io_channel_get_type != &gidSymbolNotFound ? g_io_channel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IOChannel self()
  {
    return this;
  }

  /**
      Open a file filename as a #GIOChannel using mode mode. This
      channel will be closed when the last reference to it is dropped,
      so there is no need to call [glib.iochannel.IOChannel.close] (though doing
      so will not cause problems, as long as no attempt is made to
      access the channel after it is closed).
  
      Params:
        filename = A string containing the name of a file
        mode = One of "r", "w", "a", "r+", "w+", "a+". These have
                 the same meaning as in fopen()
      Returns: A #GIOChannel on success, null on failure.
      Throws: [IOChannelException]
  */
  static glib.iochannel.IOChannel newFile(string filename, string mode)
  {
    GIOChannel* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _mode = mode.toCString(No.Alloc);
    GError *_err;
    _cretval = g_io_channel_new_file(_filename, _mode, &_err);
    if (_err)
      throw new IOChannelException(_err);
    auto _retval = _cretval ? new glib.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GIOChannel given a file descriptor. On UNIX systems
      this works for plain files, pipes, and sockets.
      
      The returned #GIOChannel has a reference count of 1.
      
      The default encoding for #GIOChannel is UTF-8. If your application
      is reading output from a command using via pipe, you may need to set
      the encoding to the encoding of the current locale (see
      [glib.global.getCharset]) with the [glib.iochannel.IOChannel.setEncoding] function.
      By default, the fd passed will not be closed when the final reference
      to the #GIOChannel data structure is dropped.
      
      If you want to read raw binary data without interpretation, then
      call the [glib.iochannel.IOChannel.setEncoding] function with null for the
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
  static glib.iochannel.IOChannel unixNew(int fd)
  {
    GIOChannel* _cretval;
    _cretval = g_io_channel_unix_new(fd);
    auto _retval = _cretval ? new glib.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Close an IO channel. Any pending data to be written will be
      flushed, ignoring errors. The channel will not be freed until the
      last reference is dropped using [glib.iochannel.IOChannel.unref].
  
      Deprecated: Use [glib.iochannel.IOChannel.shutdown] instead.
  */
  void close()
  {
    g_io_channel_close(cast(GIOChannel*)this._cPtr);
  }

  /**
      Flushes the write buffer for the GIOChannel.
      Returns: the status of the operation: One of
          `G_IO_STATUS_NORMAL`, `G_IO_STATUS_AGAIN`, or
          `G_IO_STATUS_ERROR`.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus flush()
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_flush(cast(GIOChannel*)this._cPtr, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      This function returns a #GIOCondition depending on whether there
      is data to be read/space to write data in the internal buffers in
      the #GIOChannel. Only the flags [glib.types.IOCondition.In] and [glib.types.IOCondition.Out] may be set.
      Returns: A #GIOCondition
  */
  glib.types.IOCondition getBufferCondition()
  {
    GIOCondition _cretval;
    _cretval = g_io_channel_get_buffer_condition(cast(GIOChannel*)this._cPtr);
    glib.types.IOCondition _retval = cast(glib.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Gets the buffer size.
      Returns: the size of the buffer.
  */
  size_t getBufferSize()
  {
    size_t _retval;
    _retval = g_io_channel_get_buffer_size(cast(GIOChannel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether channel is buffered.
      Returns: true if the channel is buffered.
  */
  bool getBuffered()
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
  bool getCloseOnUnref()
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
  string getEncoding()
  {
    const(char)* _cretval;
    _cretval = g_io_channel_get_encoding(cast(GIOChannel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the current flags for a #GIOChannel, including read-only
      flags such as `G_IO_FLAG_IS_READABLE`.
      
      The values of the flags `G_IO_FLAG_IS_READABLE` and `G_IO_FLAG_IS_WRITABLE`
      are cached for internal use by the channel when it is created.
      If they should change at some later point (e.g. partial shutdown
      of a socket with the UNIX shutdown() function), the user
      should immediately call [glib.iochannel.IOChannel.getFlags] to update
      the internal values of these flags.
      Returns: the flags which are set on the channel
  */
  glib.types.IOFlags getFlags()
  {
    GIOFlags _cretval;
    _cretval = g_io_channel_get_flags(cast(GIOChannel*)this._cPtr);
    glib.types.IOFlags _retval = cast(glib.types.IOFlags)_cretval;
    return _retval;
  }

  /**
      This returns the string that #GIOChannel uses to determine
      where in the file a line break occurs. A value of null
      indicates autodetection.
  
      Params:
        length = a location to return the length of the line terminator
      Returns: The line termination string. This value
          is owned by GLib and must not be freed.
  */
  string getLineTerm(out int length)
  {
    const(char)* _cretval;
    _cretval = g_io_channel_get_line_term(cast(GIOChannel*)this._cPtr, cast(int*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Initializes a #GIOChannel struct.
      
      This is called by each of the above functions when creating a
      #GIOChannel, and so is not often needed by the application
      programmer (unless you are creating a new type of #GIOChannel).
  */
  void init_()
  {
    g_io_channel_init(cast(GIOChannel*)this._cPtr);
  }

  /**
      Reads data from a #GIOChannel.
  
      Params:
        buf = a buffer to read the data into (which should be at least
                count bytes long)
        bytesRead = returns the number of bytes actually read
      Returns: `G_IO_ERROR_NONE` if the operation was successful.
  
      Deprecated: Use [glib.iochannel.IOChannel.readChars] instead.
  */
  glib.types.IOError read(ref ubyte[] buf, out size_t bytesRead)
  {
    GIOError _cretval;
    size_t _count;
    _count = cast(size_t)buf.length;
    _cretval = g_io_channel_read(cast(GIOChannel*)this._cPtr, buf.ptr, _count, cast(size_t*)&bytesRead);
    glib.types.IOError _retval = cast(glib.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [glib.iochannel.IOChannel.read] with the new API.
  
      Params:
        buf = a buffer to read data into
        bytesRead = The number of bytes read. This may be
              zero even on success if count < 6 and the channel's encoding
              is non-null. This indicates that the next UTF-8 character is
              too wide for the buffer.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus readChars(ref ubyte[] buf, out size_t bytesRead)
  {
    GIOStatus _cretval;
    size_t _count;
    _count = cast(size_t)buf.length;
    GError *_err;
    _cretval = g_io_channel_read_chars(cast(GIOChannel*)this._cPtr, buf.ptr, _count, cast(size_t*)&bytesRead, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Reads a line, including the terminating character(s),
      from a #GIOChannel into a newly-allocated string.
      str_return will contain allocated memory if the return
      is `G_IO_STATUS_NORMAL`.
  
      Params:
        strReturn = The line read from the #GIOChannel, including the
                       line terminator. This data should be freed with [glib.global.gfree]
                       when no longer needed. This is a nul-terminated string.
                       If a length of zero is returned, this will be null instead.
        length = location to store length of the read data, or null
        terminatorPos = location to store position of line terminator, or null
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus readLine(out string strReturn, out size_t length, out size_t terminatorPos)
  {
    GIOStatus _cretval;
    char* _strReturn;
    GError *_err;
    _cretval = g_io_channel_read_line(cast(GIOChannel*)this._cPtr, &_strReturn, cast(size_t*)&length, cast(size_t*)&terminatorPos, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    strReturn = _strReturn.fromCString(Yes.Free);
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
  glib.types.IOStatus readLineString(glib.string_.String buffer, out size_t terminatorPos)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_read_line_string(cast(GIOChannel*)this._cPtr, buffer ? cast(GString*)buffer._cPtr(No.Dup) : null, cast(size_t*)&terminatorPos, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Reads all the remaining data from the file.
  
      Params:
        strReturn = Location to
                       store a pointer to a string holding the remaining data in the
                       #GIOChannel. This data should be freed with [glib.global.gfree] when no
                       longer needed. This data is terminated by an extra nul
                       character, but there may be other nuls in the intervening data.
      Returns: `G_IO_STATUS_NORMAL` on success.
            This function never returns `G_IO_STATUS_EOF`.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus readToEnd(out ubyte[] strReturn)
  {
    GIOStatus _cretval;
    size_t _length;
    ubyte* _strReturn;
    GError *_err;
    _cretval = g_io_channel_read_to_end(cast(GIOChannel*)this._cPtr, &_strReturn, &_length, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
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
  glib.types.IOStatus readUnichar(out dchar thechar)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_read_unichar(cast(GIOChannel*)this._cPtr, cast(dchar*)&thechar, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the current position in the #GIOChannel, similar to the standard
      library function fseek().
  
      Params:
        offset = an offset, in bytes, which is added to the position specified
                   by type
        type = the position in the file, which can be `G_SEEK_CUR` (the current
                 position), `G_SEEK_SET` (the start of the file), or `G_SEEK_END`
                 (the end of the file)
      Returns: `G_IO_ERROR_NONE` if the operation was successful.
  
      Deprecated: Use [glib.iochannel.IOChannel.seekPosition] instead.
  */
  glib.types.IOError seek(long offset, glib.types.SeekType type)
  {
    GIOError _cretval;
    _cretval = g_io_channel_seek(cast(GIOChannel*)this._cPtr, offset, type);
    glib.types.IOError _retval = cast(glib.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [glib.iochannel.IOChannel.seek] with the new API.
  
      Params:
        offset = The offset in bytes from the position specified by type
        type = a #GSeekType. The type `G_SEEK_CUR` is only allowed in those
                               cases where a call to g_io_channel_set_encoding ()
                               is allowed. See the documentation for
                               g_io_channel_set_encoding () for details.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus seekPosition(long offset, glib.types.SeekType type)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_seek_position(cast(GIOChannel*)this._cPtr, offset, type, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the buffer size.
  
      Params:
        size = the size of the buffer, or 0 to let GLib pick a good size
  */
  void setBufferSize(size_t size)
  {
    g_io_channel_set_buffer_size(cast(GIOChannel*)this._cPtr, size);
  }

  /**
      The buffering state can only be set if the channel's encoding
      is null. For any other encoding, the channel must be buffered.
      
      A buffered channel can only be set unbuffered if the channel's
      internal buffers have been flushed. Newly created channels or
      channels which have returned `G_IO_STATUS_EOF`
      not require such a flush. For write-only channels, a call to
      g_io_channel_flush () is sufficient. For all other channels,
      the buffers may be flushed by a call to g_io_channel_seek_position ().
      This includes the possibility of seeking with seek type `G_SEEK_CUR`
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
  void setBuffered(bool buffered)
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
  void setCloseOnUnref(bool doClose)
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
      
      $(LIST
        * The channel was just created, and has not been written to or read from yet.
        
        * The channel is write-only.
        
        * The channel is a file, and the file pointer was just repositioned
          by a call to [glib.iochannel.IOChannel.seekPosition]. (This flushes all the
          internal buffers.)
        
        * The current encoding is null or UTF-8.
        
        * One of the (new API) read functions has just returned `G_IO_STATUS_EOF`
          (or, in the case of [glib.iochannel.IOChannel.readToEnd], `G_IO_STATUS_NORMAL`).
        
        *  One of the functions [glib.iochannel.IOChannel.readChars] or
           [glib.iochannel.IOChannel.readUnichar] has returned `G_IO_STATUS_AGAIN` or
           `G_IO_STATUS_ERROR`. This may be useful in the case of
           `G_CONVERT_ERROR_ILLEGAL_SEQUENCE`.
           Returning one of these statuses from [glib.iochannel.IOChannel.readLine],
           [glib.iochannel.IOChannel.readLineString], or [glib.iochannel.IOChannel.readToEnd]
           does not guarantee that the encoding can be changed.
      )
        
      Channels which do not meet one of the above conditions cannot call
      [glib.iochannel.IOChannel.seekPosition] with an offset of `G_SEEK_CUR`, and, if
      they are "seekable", cannot call [glib.iochannel.IOChannel.writeChars] after
      calling one of the API "read" functions.
  
      Params:
        encoding = the encoding type
      Returns: `G_IO_STATUS_NORMAL` if the encoding was successfully set
      Throws: [IOChannelException]
  */
  glib.types.IOStatus setEncoding(string encoding = null)
  {
    GIOStatus _cretval;
    const(char)* _encoding = encoding.toCString(No.Alloc);
    GError *_err;
    _cretval = g_io_channel_set_encoding(cast(GIOChannel*)this._cPtr, _encoding, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Sets the (writeable) flags in channel to (flags & `G_IO_FLAG_SET_MASK`).
  
      Params:
        flags = the flags to set on the IO channel
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus setFlags(glib.types.IOFlags flags)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_set_flags(cast(GIOChannel*)this._cPtr, flags, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
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
  void setLineTerm(string lineTerm = null)
  {
    int _length;
    if (lineTerm)
      _length = cast(int)lineTerm.length;

    auto _lineTerm = cast(const(char)*)lineTerm.ptr;
    g_io_channel_set_line_term(cast(GIOChannel*)this._cPtr, _lineTerm, _length);
  }

  /**
      Close an IO channel. Any pending data to be written will be
      flushed if flush is true. The channel will not be freed until the
      last reference is dropped using [glib.iochannel.IOChannel.unref].
  
      Params:
        flush = if true, flush pending
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus shutdown(bool flush)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_shutdown(cast(GIOChannel*)this._cPtr, flush, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Returns the file descriptor of the #GIOChannel.
      
      On Windows this function returns the file descriptor or socket of
      the #GIOChannel.
      Returns: the file descriptor of the #GIOChannel.
  */
  int unixGetFd()
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
      Returns: `G_IO_ERROR_NONE` if the operation was successful.
  
      Deprecated: Use [glib.iochannel.IOChannel.writeChars] instead.
  */
  glib.types.IOError write(string buf, out size_t bytesWritten)
  {
    GIOError _cretval;
    size_t _count;
    if (buf)
      _count = cast(size_t)buf.length;

    auto _buf = cast(const(char)*)buf.ptr;
    _cretval = g_io_channel_write(cast(GIOChannel*)this._cPtr, _buf, _count, cast(size_t*)&bytesWritten);
    glib.types.IOError _retval = cast(glib.types.IOError)_cretval;
    return _retval;
  }

  /**
      Replacement for [glib.iochannel.IOChannel.write] with the new API.
      
      On seekable channels with encodings other than null or UTF-8, generic
      mixing of reading and writing is not allowed. A call to g_io_channel_write_chars ()
      may only be made on a channel from which data has been read in the
      cases described in the documentation for g_io_channel_set_encoding ().
  
      Params:
        buf = a buffer to write data from
        bytesWritten = The number of bytes written. This can be nonzero
                          even if the return value is not `G_IO_STATUS_NORMAL`.
                          If the return value is `G_IO_STATUS_NORMAL` and the
                          channel is blocking, this will always be equal
                          to count if count >= 0.
      Returns: the status of the operation.
      Throws: [IOChannelException]
  */
  glib.types.IOStatus writeChars(ubyte[] buf, out size_t bytesWritten)
  {
    GIOStatus _cretval;
    ptrdiff_t _count;
    if (buf)
      _count = cast(ptrdiff_t)buf.length;

    auto _buf = cast(const(ubyte)*)buf.ptr;
    GError *_err;
    _cretval = g_io_channel_write_chars(cast(GIOChannel*)this._cPtr, _buf, _count, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
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
  glib.types.IOStatus writeUnichar(dchar thechar)
  {
    GIOStatus _cretval;
    GError *_err;
    _cretval = g_io_channel_write_unichar(cast(GIOChannel*)this._cPtr, thechar, &_err);
    if (_err)
      throw new IOChannelException(_err);
    glib.types.IOStatus _retval = cast(glib.types.IOStatus)_cretval;
    return _retval;
  }

  /**
      Converts an `errno` error number to a #GIOChannelError.
  
      Params:
        en = an `errno` error number, e.g. `EINVAL`
      Returns: a #GIOChannelError error number, e.g.
             `G_IO_CHANNEL_ERROR_INVAL`.
  */
  static glib.types.IOChannelError errorFromErrno(int en)
  {
    GIOChannelError _cretval;
    _cretval = g_io_channel_error_from_errno(en);
    glib.types.IOChannelError _retval = cast(glib.types.IOChannelError)_cretval;
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_io_channel_error_quark();
    return _retval;
  }
}

class IOChannelException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.iochannel.IOChannel.errorQuark, cast(int)code, msg);
  }

  alias Code = IOChannelError;
}
