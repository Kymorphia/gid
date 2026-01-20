/// Module for [DBusMessage] class
module gio.dbus_message;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import glib.variant;
import gobject.object;

/**
    A type for representing D-Bus messages that can be sent or received
    on a [gio.dbus_connection.DBusConnection].
*/
class DBusMessage : gobject.object.ObjectWrap
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
    return cast(void function())g_dbus_message_get_type != &gidSymbolNotFound ? g_dbus_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusMessage self()
  {
    return this;
  }

  /** */
  @property bool locked()
  {
    return getLocked();
  }

  /**
      Creates a new empty #GDBusMessage.
      Returns: A #GDBusMessage. Free with [gobject.object.ObjectWrap.unref].
  */
  this()
  {
    GDBusMessage* _cretval;
    _cretval = g_dbus_message_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GDBusMessage from the data stored at blob. The byte
      order that the message was in can be retrieved using
      [gio.dbus_message.DBusMessage.getByteOrder].
      
      If the blob cannot be parsed, contains invalid fields, or contains invalid
      headers, [gio.types.IOErrorEnum.InvalidArgument] will be returned.
  
      Params:
        blob = A blob representing a binary D-Bus message.
        capabilities = A #GDBusCapabilityFlags describing what protocol features are supported.
      Returns: A new #GDBusMessage or null if error is set. Free with
        [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_message.DBusMessage newFromBlob(ubyte[] blob, gio.types.DBusCapabilityFlags capabilities)
  {
    GDBusMessage* _cretval;
    size_t _blobLen;
    if (blob)
      _blobLen = cast(size_t)blob.length;

    auto _blob = cast(ubyte*)blob.ptr;
    GError *_err;
    _cretval = g_dbus_message_new_from_blob(_blob, _blobLen, capabilities, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDBusMessage for a method call.
  
      Params:
        name = A valid D-Bus name or null.
        path = A valid object path.
        interface_ = A valid D-Bus interface name or null.
        method = A valid method name.
      Returns: A #GDBusMessage. Free with [gobject.object.ObjectWrap.unref].
  */
  static gio.dbus_message.DBusMessage newMethodCall(string name, string path, string interface_, string method)
  {
    GDBusMessage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _interface_ = interface_.toCString(No.Alloc);
    const(char)* _method = method.toCString(No.Alloc);
    _cretval = g_dbus_message_new_method_call(_name, _path, _interface_, _method);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDBusMessage for a signal emission.
  
      Params:
        path = A valid object path.
        interface_ = A valid D-Bus interface name.
        signal = A valid signal name.
      Returns: A #GDBusMessage. Free with [gobject.object.ObjectWrap.unref].
  */
  static gio.dbus_message.DBusMessage newSignal(string path, string interface_, string signal)
  {
    GDBusMessage* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _interface_ = interface_.toCString(No.Alloc);
    const(char)* _signal = signal.toCString(No.Alloc);
    _cretval = g_dbus_message_new_signal(_path, _interface_, _signal);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Utility function to calculate how many bytes are needed to
      completely deserialize the D-Bus message stored at blob.
  
      Params:
        blob = A blob representing a binary D-Bus message.
      Returns: Number of bytes needed or -1 if error is set (e.g. if
        blob contains invalid data or not enough data is available to
        determine the size).
      Throws: [ErrorWrap]
  */
  static ptrdiff_t bytesNeeded(ubyte[] blob)
  {
    ptrdiff_t _retval;
    size_t _blobLen;
    if (blob)
      _blobLen = cast(size_t)blob.length;

    auto _blob = cast(ubyte*)blob.ptr;
    GError *_err;
    _retval = g_dbus_message_bytes_needed(_blob, _blobLen, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Copies message. The copy is a deep copy and the returned
      #GDBusMessage is completely identical except that it is guaranteed
      to not be locked.
      
      This operation can fail if e.g. message contains file descriptors
      and the per-process or system-wide open files limit is reached.
      Returns: A new #GDBusMessage or null if error is set.
            Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gio.dbus_message.DBusMessage copy()
  {
    GDBusMessage* _cretval;
    GError *_err;
    _cretval = g_dbus_message_copy(cast(GDBusMessage*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Convenience to get the first item in the body of message.
      
      See [gio.dbus_message.DBusMessage.getArg0Path] for returning object-path-typed
      arg0 values.
      Returns: The string item or null if the first item in the body of
        message is not a string.
  */
  string getArg0()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_arg0(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Convenience to get the first item in the body of message.
      
      See [gio.dbus_message.DBusMessage.getArg0] for returning string-typed arg0 values.
      Returns: The object path item or `NULL` if the first item in the
          body of message is not an object path.
  */
  string getArg0Path()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_arg0_path(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the body of a message.
      Returns: A #GVariant or null if the body is
        empty. Do not free, it is owned by message.
  */
  glib.variant.Variant getBody()
  {
    GVariant* _cretval;
    _cretval = g_dbus_message_get_body(cast(GDBusMessage*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the byte order of message.
      Returns: The byte order.
  */
  gio.types.DBusMessageByteOrder getByteOrder()
  {
    GDBusMessageByteOrder _cretval;
    _cretval = g_dbus_message_get_byte_order(cast(GDBusMessage*)this._cPtr);
    gio.types.DBusMessageByteOrder _retval = cast(gio.types.DBusMessageByteOrder)_cretval;
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Destination] header field.
      Returns: The value.
  */
  string getDestination()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_destination(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.ErrorName] header field.
      Returns: The value.
  */
  string getErrorName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_error_name(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the flags for message.
      Returns: Flags that are set (typically values from the #GDBusMessageFlags enumeration bitwise ORed together).
  */
  gio.types.DBusMessageFlags getFlags()
  {
    GDBusMessageFlags _cretval;
    _cretval = g_dbus_message_get_flags(cast(GDBusMessage*)this._cPtr);
    gio.types.DBusMessageFlags _retval = cast(gio.types.DBusMessageFlags)_cretval;
    return _retval;
  }

  /**
      Gets a header field on message.
      
      The caller is responsible for checking the type of the returned #GVariant
      matches what is expected.
  
      Params:
        headerField = A 8-bit unsigned integer (typically a value from the #GDBusMessageHeaderField enumeration)
      Returns: A #GVariant with the value if the header was found, null
        otherwise. Do not free, it is owned by message.
  */
  glib.variant.Variant getHeader(gio.types.DBusMessageHeaderField headerField)
  {
    GVariant* _cretval;
    _cretval = g_dbus_message_get_header(cast(GDBusMessage*)this._cPtr, headerField);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets an array of all header fields on message that are set.
      Returns: An array of header fields
        terminated by [gio.types.DBusMessageHeaderField.Invalid].  Each element
        is a #guchar. Free with [glib.global.gfree].
  */
  ubyte[] getHeaderFields()
  {
    ubyte* _cretval;
    _cretval = g_dbus_message_get_header_fields(cast(GDBusMessage*)this._cPtr);
    ubyte[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] != 0)
        _cretlength++;
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Interface] header field.
      Returns: The value.
  */
  string getInterface()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_interface(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks whether message is locked. To monitor changes to this
      value, conncet to the #GObject::notify signal to listen for changes
      on the #GDBusMessage:locked property.
      Returns: true if message is locked, false otherwise.
  */
  bool getLocked()
  {
    bool _retval;
    _retval = cast(bool)g_dbus_message_get_locked(cast(GDBusMessage*)this._cPtr);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Member] header field.
      Returns: The value.
  */
  string getMember()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_member(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the type of message.
      Returns: A 8-bit unsigned integer (typically a value from the #GDBusMessageType enumeration).
  */
  gio.types.DBusMessageType getMessageType()
  {
    GDBusMessageType _cretval;
    _cretval = g_dbus_message_get_message_type(cast(GDBusMessage*)this._cPtr);
    gio.types.DBusMessageType _retval = cast(gio.types.DBusMessageType)_cretval;
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.NumUnixFds] header field.
      Returns: The value.
  */
  uint getNumUnixFds()
  {
    uint _retval;
    _retval = g_dbus_message_get_num_unix_fds(cast(GDBusMessage*)this._cPtr);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Path] header field.
      Returns: The value.
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_path(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.ReplySerial] header field.
      Returns: The value.
  */
  uint getReplySerial()
  {
    uint _retval;
    _retval = g_dbus_message_get_reply_serial(cast(GDBusMessage*)this._cPtr);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Sender] header field.
      Returns: The value.
  */
  string getSender()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_sender(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the serial for message.
      Returns: A #guint32.
  */
  uint getSerial()
  {
    uint _retval;
    _retval = g_dbus_message_get_serial(cast(GDBusMessage*)this._cPtr);
    return _retval;
  }

  /**
      Convenience getter for the [gio.types.DBusMessageHeaderField.Signature] header field.
      
      This will always be non-null, but may be an empty string.
      Returns: The value.
  */
  string getSignature()
  {
    const(char)* _cretval;
    _cretval = g_dbus_message_get_signature(cast(GDBusMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the UNIX file descriptors associated with message, if any.
      
      This method is only available on UNIX.
      
      The file descriptors normally correspond to `G_VARIANT_TYPE_HANDLE`
      values in the body of the message. For example,
      if [glib.variant.Variant.getHandle] returns 5, that is intended to be a reference
      to the file descriptor that can be accessed by
      `g_unix_fd_list_get (list, 5, ...)`.
      Returns: A #GUnixFDList or null if no file descriptors are
        associated. Do not free, this object is owned by message.
  */
  gio.unix_fdlist.UnixFDList getUnixFdList()
  {
    GUnixFDList* _cretval;
    _cretval = g_dbus_message_get_unix_fd_list(cast(GDBusMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_fdlist.UnixFDList)(cast(GUnixFDList*)_cretval, No.Take);
    return _retval;
  }

  /**
      If message is locked, does nothing. Otherwise locks the message.
  */
  void lock()
  {
    g_dbus_message_lock(cast(GDBusMessage*)this._cPtr);
  }

  /**
      Creates a new #GDBusMessage that is an error reply to method_call_message.
  
      Params:
        errorName = A valid D-Bus error name.
        errorMessage = The D-Bus error message.
      Returns: A #GDBusMessage. Free with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_message.DBusMessage newMethodErrorLiteral(string errorName, string errorMessage)
  {
    GDBusMessage* _cretval;
    const(char)* _errorName = errorName.toCString(No.Alloc);
    const(char)* _errorMessage = errorMessage.toCString(No.Alloc);
    _cretval = g_dbus_message_new_method_error_literal(cast(GDBusMessage*)this._cPtr, _errorName, _errorMessage);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDBusMessage that is a reply to method_call_message.
      Returns: #GDBusMessage. Free with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_message.DBusMessage newMethodReply()
  {
    GDBusMessage* _cretval;
    _cretval = g_dbus_message_new_method_reply(cast(GDBusMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Produces a human-readable multi-line description of message.
      
      The contents of the description has no ABI guarantees, the contents
      and formatting is subject to change at any time. Typical output
      looks something like this:
      ```
      Flags:   none
      Version: 0
      Serial:  4
      Headers:
        path -> objectpath '/org/gtk/GDBus/TestObject'
        interface -> 'org.gtk.GDBus.TestInterface'
        member -> 'GimmeStdout'
        destination -> ':1.146'
      Body: ()
      UNIX File Descriptors:
        (none)
      ```
      or
      ```
      Flags:   no-reply-expected
      Version: 0
      Serial:  477
      Headers:
        reply-serial -> uint32 4
        destination -> ':1.159'
        sender -> ':1.146'
        num-unix-fds -> uint32 1
      Body: ()
      UNIX File Descriptors:
        fd 12: dev=0:10,mode=020620,ino=5,uid=500,gid=5,rdev=136:2,size=0,atime=1273085037,mtime=1273085851,ctime=1272982635
      ```
  
      Params:
        indent = Indentation level.
      Returns: A string that should be freed with `funcGLib.free`.
  */
  string print(uint indent)
  {
    char* _cretval;
    _cretval = g_dbus_message_print(cast(GDBusMessage*)this._cPtr, indent);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the body message. As a side-effect the
      [gio.types.DBusMessageHeaderField.Signature] header field is set to the
      type string of body (or cleared if body is null).
      
      If body is floating, message assumes ownership of body.
  
      Params:
        body_ = Either null or a #GVariant that is a tuple.
  */
  void setBody(glib.variant.Variant body_)
  {
    g_dbus_message_set_body(cast(GDBusMessage*)this._cPtr, body_ ? cast(GVariant*)body_._cPtr(No.Dup) : null);
  }

  /**
      Sets the byte order of message.
  
      Params:
        byteOrder = The byte order.
  */
  void setByteOrder(gio.types.DBusMessageByteOrder byteOrder)
  {
    g_dbus_message_set_byte_order(cast(GDBusMessage*)this._cPtr, byteOrder);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Destination] header field.
  
      Params:
        value = The value to set.
  */
  void setDestination(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_destination(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.ErrorName] header field.
  
      Params:
        value = The value to set.
  */
  void setErrorName(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_error_name(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Sets the flags to set on message.
  
      Params:
        flags = Flags for message that are set (typically values from the #GDBusMessageFlags
          enumeration bitwise ORed together).
  */
  void setFlags(gio.types.DBusMessageFlags flags)
  {
    g_dbus_message_set_flags(cast(GDBusMessage*)this._cPtr, flags);
  }

  /**
      Sets a header field on message.
      
      If value is floating, message assumes ownership of value.
  
      Params:
        headerField = A 8-bit unsigned integer (typically a value from the #GDBusMessageHeaderField enumeration)
        value = A #GVariant to set the header field or null to clear the header field.
  */
  void setHeader(gio.types.DBusMessageHeaderField headerField, glib.variant.Variant value = null)
  {
    g_dbus_message_set_header(cast(GDBusMessage*)this._cPtr, headerField, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Interface] header field.
  
      Params:
        value = The value to set.
  */
  void setInterface(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_interface(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Member] header field.
  
      Params:
        value = The value to set.
  */
  void setMember(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_member(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Sets message to be of type.
  
      Params:
        type = A 8-bit unsigned integer (typically a value from the #GDBusMessageType enumeration).
  */
  void setMessageType(gio.types.DBusMessageType type)
  {
    g_dbus_message_set_message_type(cast(GDBusMessage*)this._cPtr, type);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.NumUnixFds] header field.
  
      Params:
        value = The value to set.
  */
  void setNumUnixFds(uint value)
  {
    g_dbus_message_set_num_unix_fds(cast(GDBusMessage*)this._cPtr, value);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Path] header field.
  
      Params:
        value = The value to set.
  */
  void setPath(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_path(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.ReplySerial] header field.
  
      Params:
        value = The value to set.
  */
  void setReplySerial(uint value)
  {
    g_dbus_message_set_reply_serial(cast(GDBusMessage*)this._cPtr, value);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Sender] header field.
  
      Params:
        value = The value to set.
  */
  void setSender(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_sender(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Sets the serial for message.
  
      Params:
        serial = A #guint32.
  */
  void setSerial(uint serial)
  {
    g_dbus_message_set_serial(cast(GDBusMessage*)this._cPtr, serial);
  }

  /**
      Convenience setter for the [gio.types.DBusMessageHeaderField.Signature] header field.
  
      Params:
        value = The value to set.
  */
  void setSignature(string value = null)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_dbus_message_set_signature(cast(GDBusMessage*)this._cPtr, _value);
  }

  /**
      Sets the UNIX file descriptors associated with message. As a
      side-effect the [gio.types.DBusMessageHeaderField.NumUnixFds] header
      field is set to the number of fds in fd_list (or cleared if
      fd_list is null).
      
      This method is only available on UNIX.
      
      When designing D-Bus APIs that are intended to be interoperable,
      please note that non-GDBus implementations of D-Bus can usually only
      access file descriptors if they are referenced by a value of type
      `G_VARIANT_TYPE_HANDLE` in the body of the message.
  
      Params:
        fdList = A #GUnixFDList or null.
  */
  void setUnixFdList(gio.unix_fdlist.UnixFDList fdList = null)
  {
    g_dbus_message_set_unix_fd_list(cast(GDBusMessage*)this._cPtr, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
  }

  /**
      Serializes message to a blob. The byte order returned by
      [gio.dbus_message.DBusMessage.getByteOrder] will be used.
  
      Params:
        capabilities = A #GDBusCapabilityFlags describing what protocol features are supported.
      Returns: A pointer to a
        valid binary D-Bus message of out_size bytes generated by message
        or null if error is set. Free with [glib.global.gfree].
      Throws: [ErrorWrap]
  */
  ubyte[] toBlob(gio.types.DBusCapabilityFlags capabilities)
  {
    ubyte* _cretval;
    size_t _cretlength;
    GError *_err;
    _cretval = g_dbus_message_to_blob(cast(GDBusMessage*)this._cPtr, &_cretlength, capabilities, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      If message is not of type [gio.types.DBusMessageType.Error] does
      nothing and returns false.
      
      Otherwise this method encodes the error in message as a #GError
      using [gio.dbus_error.DBusError.setDbusError] using the information in the
      [gio.types.DBusMessageHeaderField.ErrorName] header field of message as
      well as the first string item in message's body.
      Returns: true if error was set, false otherwise.
      Throws: [ErrorWrap]
  */
  bool toGerror()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_dbus_message_to_gerror(cast(GDBusMessage*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
