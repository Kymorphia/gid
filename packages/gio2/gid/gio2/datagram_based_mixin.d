/// Module for [DatagramBased] interface mixin
module gid.gio2.datagram_based_mixin;

public import gid.core.basictypes;
public import gid.gio2.datagram_based;
public import gid.gio2.datagram_based_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.input_message;
public import gid.gio2.output_message;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.source;
public import gid.glib2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;


// Public import for the interface mixin template (resolved where it is mixed in), receiveMessages is hand-written
public import gid.gio2.input_message;
import gid.gobject2.object;

/**
    Interface for socket-like objects with datagram semantics.
    
    A [gid.gio2.datagram_based.DatagramBased] is a networking interface for representing datagram-based
    communications. It is a more or less direct mapping of the core parts of the
    BSD socket API in a portable GObject interface. It is implemented by
    [gid.gio2.socket.Socket], which wraps the UNIX socket API on UNIX and winsock2 on Windows.
    
    [gid.gio2.datagram_based.DatagramBased] is entirely platform independent, and is intended to be used
    alongside higher-level networking APIs such as [gid.gio2.iostream.IOStream].
    
    It uses vectored scatter/gather I/O by default, allowing for many messages
    to be sent or received in a single call. Where possible, implementations of
    the interface should take advantage of vectored I/O to minimise processing
    or system calls. For example, [gid.gio2.socket.Socket] uses `recvmmsg()` and `sendmmsg()`
    where possible. Callers should take advantage of scatter/gather I/O (the use of
    multiple buffers per message) to avoid unnecessary copying of data to
    assemble or disassemble a message.
    
    Each [gid.gio2.datagram_based.DatagramBased] operation has a timeout parameter which may be negative
    for blocking behaviour, zero for non-blocking behaviour, or positive for
    timeout behaviour. A blocking operation blocks until finished or there is an
    error. A non-blocking operation will return immediately with a
    [gid.gio2.types.IOErrorEnum.WouldBlock] error if it cannot make progress. A timeout operation
    will block until the operation is complete or the timeout expires; if the
    timeout expires it will return what progress it made, or
    [gid.gio2.types.IOErrorEnum.TimedOut] if no progress was made. To know when a call would
    successfully run you can call [gid.gio2.datagram_based.DatagramBased.conditionCheck] or
    [gid.gio2.datagram_based.DatagramBased.conditionWait]. You can also use
    [gid.gio2.datagram_based.DatagramBased.createSource] and attach it to a [gid.glib2.main_context.MainContext]
    to get callbacks when I/O is possible.
    
    When running a non-blocking operation applications should always be able to
    handle getting a [gid.gio2.types.IOErrorEnum.WouldBlock] error even when some other function
    said that I/O was possible. This can easily happen in case of a race
    condition in the application, but it can also happen for other reasons. For
    instance, on Windows a socket is always seen as writable until a write
    returns [gid.gio2.types.IOErrorEnum.WouldBlock].
    
    As with [gid.gio2.socket.Socket], [gid.gio2.datagram_based.DatagramBased]s can be either connection oriented (for
    example, SCTP) or connectionless (for example, UDP). [gid.gio2.datagram_based.DatagramBased]s must be
    datagram-based, not stream-based. The interface does not cover connection
    establishment — use methods on the underlying type to establish a connection
    before sending and receiving data through the [gid.gio2.datagram_based.DatagramBased] API. For
    connectionless socket types the target/source address is specified or
    received in each I/O operation.
    
    Like most other APIs in GLib, [gid.gio2.datagram_based.DatagramBased] is not inherently thread safe.
    To use a [gid.gio2.datagram_based.DatagramBased] concurrently from multiple threads, you must
    implement your own locking.
*/
template DatagramBasedT()
{

  /**
  Receive one or more data messages from datagram_based in one go.
  
  messages must be an array of [gid.gio2.input_message.InputMessage] objects, each of which receives data into its
  buffers (see [gid.gio2.input_message.InputMessage.buffers]) and is updated with the number of bytes received, the
  message flags, and the source address and control messages if requested (see
  [gid.gio2.input_message.InputMessage.receiveAddress] and [gid.gio2.input_message.InputMessage.receiveControlMessages]).
  
  flags modify how all messages are received. The commonly available arguments for this are available in the
  #GSocketMsgFlags enum, but the values there are the same as the system values, and the flags are passed in as-is,
  so you can pass in system-specific flags too. These flags affect the overall receive operation. Flags affecting
  individual messages are returned in [gid.gio2.input_message.InputMessage.flags].
  
  If timeout is negative the call will block until at least one message is received, cancellable is cancelled, or
  an error occurs. If timeout is 0 the call will return up to the number of messages without blocking, or
  [gid.gio2.types.IOErrorEnum.WouldBlock] if no messages are queued. If timeout is positive the call will block on the
  same conditions as if timeout were negative, or until the timeout elapses ([gid.gio2.types.IOErrorEnum.TimedOut]).
  
  Params:
  messages = an array of input messages
  flags = an int containing #GSocketMsgFlags flags for the overall operation
  timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1 to block indefinitely
  cancellable = a [gid.gio2.cancellable.Cancellable] or null
  Returns: number of messages received, which may be less than the number of messages if timeout is zero or
  positive, if the peer closed the connection, or if the number of messages was larger than `UIO_MAXIOV` (1024)
  Throws: [ErrorWrap]
  */
  int receiveMessages()(gid.gio2.input_message.InputMessage[] messages, int flags, long timeout,
  gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GError* _err;
    auto _retval = gid.gio2.input_message.InputMessage._receiveMessages(messages,
    "gid.gio2.datagram_based.DatagramBased.receiveMessages", (GInputMessage* cMessages, uint numMessages) =>
    g_datagram_based_receive_messages(cast(GDatagramBased*)(cast(gid.gobject2.object.ObjectWrap)this)._cPtr, cMessages,
    numMessages, flags, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err));

    if (_err)
      throw new ErrorWrap(_err, Yes.Take);

    return _retval;
  }


  /**
      Checks on the readiness of datagram_based to perform operations. The
      operations specified in condition are checked for and masked against the
      currently-satisfied conditions on datagram_based. The result is returned.
      
      [gid.glib2.types.IOCondition.In] will be set in the return value if data is available to read with
      [gid.gio2.datagram_based.DatagramBased.receiveMessages], or if the connection is closed remotely
      (EOS); and if the datagram_based has not been closed locally using some
      implementation-specific method (such as [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket).
      
      If the connection is shut down or closed (by calling [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket, for
      example), all calls to this function will return [gid.gio2.types.IOErrorEnum.Closed].
      
      [gid.glib2.types.IOCondition.Out] will be set if it is expected that at least one byte can be sent
      using [gid.gio2.datagram_based.DatagramBased.sendMessages] without blocking. It will not be set
      if the datagram_based has been closed locally.
      
      [gid.glib2.types.IOCondition.Hup] will be set if the connection has been closed locally.
      
      [gid.glib2.types.IOCondition.Err] will be set if there was an asynchronous error in transmitting data
      previously enqueued using [gid.gio2.datagram_based.DatagramBased.sendMessages].
      
      Note that on Windows, it is possible for an operation to return
      [gid.gio2.types.IOErrorEnum.WouldBlock] even immediately after
      [gid.gio2.datagram_based.DatagramBased.conditionCheck] has claimed that the #GDatagramBased is
      ready for writing. Rather than calling [gid.gio2.datagram_based.DatagramBased.conditionCheck] and
      then writing to the #GDatagramBased if it succeeds, it is generally better to
      simply try writing right away, and try again later if the initial attempt
      returns [gid.gio2.types.IOErrorEnum.WouldBlock].
      
      It is meaningless to specify [gid.glib2.types.IOCondition.Err] or [gid.glib2.types.IOCondition.Hup] in condition; these
      conditions will always be set in the output if they are true. Apart from
      these flags, the output is guaranteed to be masked by condition.
      
      This call never blocks.
  
      Params:
        condition = a #GIOCondition mask to check
      Returns: the #GIOCondition mask of the current state
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConditionCheck`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.types.IOCondition vfuncConditionCheck(gid.glib2.types.IOCondition condition)
  {
    auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.datagram_based.DatagramBased._getGType);
    if (!_klass || !_klass.conditionCheck)
      return typeof(return).init;

    GIOCondition _cretval;
    _cretval = _klass.conditionCheck(cast(GDatagramBased*)this._cPtr, condition);
    gid.glib2.types.IOCondition _retval = cast(gid.glib2.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Waits for up to timeout microseconds for condition to become true on
      datagram_based. If the condition is met, true is returned.
      
      If cancellable is cancelled before the condition is met, or if timeout is
      reached before the condition is met, then false is returned and error is
      set appropriately ([gid.gio2.types.IOErrorEnum.Cancelled] or [gid.gio2.types.IOErrorEnum.TimedOut]).
  
      Params:
        condition = a #GIOCondition mask to wait for
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1
            to block indefinitely
        cancellable = a #GCancellable
      Returns: true if the condition was met, false otherwise
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConditionWait`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncConditionWait(gid.glib2.types.IOCondition condition, long timeout, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.datagram_based.DatagramBased._getGType);
    if (!_klass || !_klass.conditionWait)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.conditionWait(cast(GDatagramBased*)this._cPtr, condition, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GSource that can be attached to a #GMainContext to monitor for
      the availability of the specified condition on the #GDatagramBased. The
      #GSource keeps a reference to the datagram_based.
      
      The callback on the source is of the #GDatagramBasedSourceFunc type.
      
      It is meaningless to specify [gid.glib2.types.IOCondition.Err] or [gid.glib2.types.IOCondition.Hup] in condition; these
      conditions will always be reported in the callback if they are true.
      
      If non-null, cancellable can be used to cancel the source, which will
      cause the source to trigger, reporting the current condition (which is
      likely 0 unless cancellation happened at the same time as a condition
      change). You can check for this in the callback using
      [gid.gio2.cancellable.Cancellable.isCancelled].
  
      Params:
        condition = a #GIOCondition mask to monitor
        cancellable = a #GCancellable
      Returns: a newly allocated #GSource
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateSource`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.source.Source vfuncCreateSource(gid.glib2.types.IOCondition condition, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.datagram_based.DatagramBased._getGType);
    if (!_klass || !_klass.createSource)
      return typeof(return).init;

    GSource* _cretval;
    _cretval = _klass.createSource(cast(GDatagramBased*)this._cPtr, condition, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Receive one or more data messages from datagram_based in one go.
      
      messages must point to an array of #GInputMessage structs and
      num_messages must be the length of this array. Each #GInputMessage
      contains a pointer to an array of #GInputVector structs describing the
      buffers that the data received in each message will be written to.
      
      flags modify how all messages are received. The commonly available
      arguments for this are available in the #GSocketMsgFlags enum, but the
      values there are the same as the system values, and the flags
      are passed in as-is, so you can pass in system-specific flags too. These
      flags affect the overall receive operation. Flags affecting individual
      messages are returned in #GInputMessage.flags.
      
      The other members of #GInputMessage are treated as described in its
      documentation.
      
      If timeout is negative the call will block until num_messages have been
      received, the connection is closed remotely (EOS), cancellable is cancelled,
      or an error occurs.
      
      If timeout is 0 the call will return up to num_messages without blocking,
      or [gid.gio2.types.IOErrorEnum.WouldBlock] if no messages are queued in the operating system
      to be received.
      
      If timeout is positive the call will block on the same conditions as if
      timeout were negative. If the timeout is reached
      before any messages are received, [gid.gio2.types.IOErrorEnum.TimedOut] is returned,
      otherwise it will return the number of messages received before timing out.
      (Note: This is effectively the behaviour of `MSG_WAITFORONE` with
      recvmmsg().)
      
      To be notified when messages are available, wait for the [gid.glib2.types.IOCondition.In] condition.
      Note though that you may still receive [gid.gio2.types.IOErrorEnum.WouldBlock] from
      [gid.gio2.datagram_based.DatagramBased.receiveMessages] even if you were previously notified of a
      [gid.glib2.types.IOCondition.In] condition.
      
      If the remote peer closes the connection, any messages queued in the
      underlying receive buffer will be returned, and subsequent calls to
      [gid.gio2.datagram_based.DatagramBased.receiveMessages] will return 0 (with no error set).
      
      If the connection is shut down or closed (by calling [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket, for
      example), all calls to this function will return [gid.gio2.types.IOErrorEnum.Closed].
      
      On error -1 is returned and error is set accordingly. An error will only
      be returned if zero messages could be received; otherwise the number of
      messages successfully received before the error will be returned. If
      cancellable is cancelled, [gid.gio2.types.IOErrorEnum.Cancelled] is returned as with any
      other error.
  
      Params:
        messages = an array of #GInputMessage structs (borrowed, only valid during the callback)
        flags = an int containing #GSocketMsgFlags flags for the overall operation
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1
            to block indefinitely
        cancellable = a [gid.gio2.cancellable.Cancellable]
      Returns: number of messages received, or -1 on error. Note that the number
            of messages received may be smaller than num_messages if timeout is
            zero or positive, if the peer closed the connection, or if num_messages
            was larger than `UIO_MAXIOV` (1024), in which case the caller may re-try
            to receive the remaining messages.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReceiveMessages`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncReceiveMessages(gid.gio2.input_message.InputMessage[] messages, int flags, long timeout, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.datagram_based.DatagramBased._getGType);
    if (!_klass || !_klass.receiveMessages)
      return typeof(return).init;

    int _retval;
    uint _numMessages;
    if (messages)
      _numMessages = cast(uint)messages.length;

    auto _messages_arr = new GInputMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = *cast(GInputMessage*)obj._cPtr;
    GError *_err;
    _retval = _klass.receiveMessages(cast(GDatagramBased*)this._cPtr, _messages, _numMessages, flags, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    foreach (i, obj; messages) *cast(GInputMessage*)obj._cPtr = _messages[i];
    return _retval;
  }

  /**
      Send one or more data messages from datagram_based in one go.
      
      messages must point to an array of #GOutputMessage structs and
      num_messages must be the length of this array. Each #GOutputMessage
      contains an address to send the data to, and a pointer to an array of
      #GOutputVector structs to describe the buffers that the data to be sent
      for each message will be gathered from.
      
      flags modify how the message is sent. The commonly available arguments
      for this are available in the #GSocketMsgFlags enum, but the
      values there are the same as the system values, and the flags
      are passed in as-is, so you can pass in system-specific flags too.
      
      The other members of #GOutputMessage are treated as described in its
      documentation.
      
      If timeout is negative the call will block until num_messages have been
      sent, cancellable is cancelled, or an error occurs.
      
      If timeout is 0 the call will send up to num_messages without blocking,
      or will return [gid.gio2.types.IOErrorEnum.WouldBlock] if there is no space to send messages.
      
      If timeout is positive the call will block on the same conditions as if
      timeout were negative. If the timeout is reached before any messages are
      sent, [gid.gio2.types.IOErrorEnum.TimedOut] is returned, otherwise it will return the number
      of messages sent before timing out.
      
      To be notified when messages can be sent, wait for the [gid.glib2.types.IOCondition.Out] condition.
      Note though that you may still receive [gid.gio2.types.IOErrorEnum.WouldBlock] from
      [gid.gio2.datagram_based.DatagramBased.sendMessages] even if you were previously notified of a
      [gid.glib2.types.IOCondition.Out] condition. (On Windows in particular, this is very common due to
      the way the underlying APIs work.)
      
      If the connection is shut down or closed (by calling [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_write set, if it’s a #GSocket, for
      example), all calls to this function will return [gid.gio2.types.IOErrorEnum.Closed].
      
      On error -1 is returned and error is set accordingly. An error will only
      be returned if zero messages could be sent; otherwise the number of messages
      successfully sent before the error will be returned. If cancellable is
      cancelled, [gid.gio2.types.IOErrorEnum.Cancelled] is returned as with any other error.
  
      Params:
        messages = an array of #GOutputMessage structs (borrowed, only valid during the callback)
        flags = an int containing #GSocketMsgFlags flags
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1
            to block indefinitely
        cancellable = a [gid.gio2.cancellable.Cancellable]
      Returns: number of messages sent, or -1 on error. Note that the number of
            messages sent may be smaller than num_messages if timeout is zero
            or positive, or if num_messages was larger than `UIO_MAXIOV` (1024), in
            which case the caller may re-try to send the remaining messages.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSendMessages`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncSendMessages(gid.gio2.output_message.OutputMessage[] messages, int flags, long timeout, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.datagram_based.DatagramBased._getGType);
    if (!_klass || !_klass.sendMessages)
      return typeof(return).init;

    int _retval;
    uint _numMessages;
    if (messages)
      _numMessages = cast(uint)messages.length;

    auto _messages_arr = new GOutputMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = *cast(GOutputMessage*)obj._cPtr;
    GError *_err;
    _retval = _klass.sendMessages(cast(GDatagramBased*)this._cPtr, _messages, _numMessages, flags, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    foreach (i, obj; messages) *cast(GOutputMessage*)obj._cPtr = _messages[i];
    return _retval;
  }

  /**
      Checks on the readiness of datagram_based to perform operations. The
      operations specified in condition are checked for and masked against the
      currently-satisfied conditions on datagram_based. The result is returned.
      
      [gid.glib2.types.IOCondition.In] will be set in the return value if data is available to read with
      [gid.gio2.datagram_based.DatagramBased.receiveMessages], or if the connection is closed remotely
      (EOS); and if the datagram_based has not been closed locally using some
      implementation-specific method (such as [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket).
      
      If the connection is shut down or closed (by calling [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket, for
      example), all calls to this function will return [gid.gio2.types.IOErrorEnum.Closed].
      
      [gid.glib2.types.IOCondition.Out] will be set if it is expected that at least one byte can be sent
      using [gid.gio2.datagram_based.DatagramBased.sendMessages] without blocking. It will not be set
      if the datagram_based has been closed locally.
      
      [gid.glib2.types.IOCondition.Hup] will be set if the connection has been closed locally.
      
      [gid.glib2.types.IOCondition.Err] will be set if there was an asynchronous error in transmitting data
      previously enqueued using [gid.gio2.datagram_based.DatagramBased.sendMessages].
      
      Note that on Windows, it is possible for an operation to return
      [gid.gio2.types.IOErrorEnum.WouldBlock] even immediately after
      [gid.gio2.datagram_based.DatagramBased.conditionCheck] has claimed that the #GDatagramBased is
      ready for writing. Rather than calling [gid.gio2.datagram_based.DatagramBased.conditionCheck] and
      then writing to the #GDatagramBased if it succeeds, it is generally better to
      simply try writing right away, and try again later if the initial attempt
      returns [gid.gio2.types.IOErrorEnum.WouldBlock].
      
      It is meaningless to specify [gid.glib2.types.IOCondition.Err] or [gid.glib2.types.IOCondition.Hup] in condition; these
      conditions will always be set in the output if they are true. Apart from
      these flags, the output is guaranteed to be masked by condition.
      
      This call never blocks.
  
      Params:
        condition = a #GIOCondition mask to check
      Returns: the #GIOCondition mask of the current state
  */
  override gid.glib2.types.IOCondition conditionCheck(gid.glib2.types.IOCondition condition) nothrow
  {
    GIOCondition _cretval;
    _cretval = g_datagram_based_condition_check(cast(GDatagramBased*)this._cPtr, condition);
    gid.glib2.types.IOCondition _retval = cast(gid.glib2.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Waits for up to timeout microseconds for condition to become true on
      datagram_based. If the condition is met, true is returned.
      
      If cancellable is cancelled before the condition is met, or if timeout is
      reached before the condition is met, then false is returned and error is
      set appropriately ([gid.gio2.types.IOErrorEnum.Cancelled] or [gid.gio2.types.IOErrorEnum.TimedOut]).
  
      Params:
        condition = a #GIOCondition mask to wait for
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1
            to block indefinitely
        cancellable = a #GCancellable
      Returns: true if the condition was met, false otherwise
      Throws: [ErrorWrap]
  */
  override bool conditionWait(gid.glib2.types.IOCondition condition, long timeout, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_datagram_based_condition_wait(cast(GDatagramBased*)this._cPtr, condition, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GSource that can be attached to a #GMainContext to monitor for
      the availability of the specified condition on the #GDatagramBased. The
      #GSource keeps a reference to the datagram_based.
      
      The callback on the source is of the #GDatagramBasedSourceFunc type.
      
      It is meaningless to specify [gid.glib2.types.IOCondition.Err] or [gid.glib2.types.IOCondition.Hup] in condition; these
      conditions will always be reported in the callback if they are true.
      
      If non-null, cancellable can be used to cancel the source, which will
      cause the source to trigger, reporting the current condition (which is
      likely 0 unless cancellation happened at the same time as a condition
      change). You can check for this in the callback using
      [gid.gio2.cancellable.Cancellable.isCancelled].
  
      Params:
        condition = a #GIOCondition mask to monitor
        cancellable = a #GCancellable
      Returns: a newly allocated #GSource
  */
  override gid.glib2.source.Source createSource(gid.glib2.types.IOCondition condition, gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    GSource* _cretval;
    _cretval = g_datagram_based_create_source(cast(GDatagramBased*)this._cPtr, condition, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Send one or more data messages from datagram_based in one go.
      
      messages must point to an array of #GOutputMessage structs and
      num_messages must be the length of this array. Each #GOutputMessage
      contains an address to send the data to, and a pointer to an array of
      #GOutputVector structs to describe the buffers that the data to be sent
      for each message will be gathered from.
      
      flags modify how the message is sent. The commonly available arguments
      for this are available in the #GSocketMsgFlags enum, but the
      values there are the same as the system values, and the flags
      are passed in as-is, so you can pass in system-specific flags too.
      
      The other members of #GOutputMessage are treated as described in its
      documentation.
      
      If timeout is negative the call will block until num_messages have been
      sent, cancellable is cancelled, or an error occurs.
      
      If timeout is 0 the call will send up to num_messages without blocking,
      or will return [gid.gio2.types.IOErrorEnum.WouldBlock] if there is no space to send messages.
      
      If timeout is positive the call will block on the same conditions as if
      timeout were negative. If the timeout is reached before any messages are
      sent, [gid.gio2.types.IOErrorEnum.TimedOut] is returned, otherwise it will return the number
      of messages sent before timing out.
      
      To be notified when messages can be sent, wait for the [gid.glib2.types.IOCondition.Out] condition.
      Note though that you may still receive [gid.gio2.types.IOErrorEnum.WouldBlock] from
      [gid.gio2.datagram_based.DatagramBased.sendMessages] even if you were previously notified of a
      [gid.glib2.types.IOCondition.Out] condition. (On Windows in particular, this is very common due to
      the way the underlying APIs work.)
      
      If the connection is shut down or closed (by calling [gid.gio2.socket.Socket.close] or
      [gid.gio2.socket.Socket.shutdown] with shutdown_write set, if it’s a #GSocket, for
      example), all calls to this function will return [gid.gio2.types.IOErrorEnum.Closed].
      
      On error -1 is returned and error is set accordingly. An error will only
      be returned if zero messages could be sent; otherwise the number of messages
      successfully sent before the error will be returned. If cancellable is
      cancelled, [gid.gio2.types.IOErrorEnum.Cancelled] is returned as with any other error.
  
      Params:
        messages = an array of #GOutputMessage structs
        flags = an int containing #GSocketMsgFlags flags
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1
            to block indefinitely
        cancellable = a [gid.gio2.cancellable.Cancellable]
      Returns: number of messages sent, or -1 on error. Note that the number of
            messages sent may be smaller than num_messages if timeout is zero
            or positive, or if num_messages was larger than `UIO_MAXIOV` (1024), in
            which case the caller may re-try to send the remaining messages.
      Throws: [ErrorWrap]
  */
  override int sendMessages(gid.gio2.output_message.OutputMessage[] messages, int flags, long timeout, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    int _retval;
    uint _numMessages;
    if (messages)
      _numMessages = cast(uint)messages.length;

    auto _messages_arr = new GOutputMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = *cast(GOutputMessage*)obj._cPtr;
    GError *_err;
    _retval = g_datagram_based_send_messages(cast(GDatagramBased*)this._cPtr, _messages, _numMessages, flags, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    foreach (i, obj; messages) *cast(GOutputMessage*)obj._cPtr = _messages[i];
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.datagram_based.DatagramBased (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_datagram_based_DatagramBased(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConditionCheck", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConditionWait", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReceiveMessages", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendMessages", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.datagram_based.DatagramBased vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_datagram_based_DatagramBased(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConditionCheck", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(iface, "condition_check");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConditionWait", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(iface, "condition_wait");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(iface, "create_source");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReceiveMessages", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(iface, "receive_messages");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSendMessages", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(iface, "send_messages");
  }

  private static void _installIfaceVfunc_gid_gio2_datagram_based_DatagramBased(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDatagramBasedInterface*)iface;

    switch (vfunc)
    {
      case "condition_check":
      {
        static extern(C) GIOCondition _vfuncConditionCheckTramp(GDatagramBased* datagramBased, GIOCondition condition) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)datagramBased);
          if (!_obj)
          {
            auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)datagramBased), gid.gio2.datagram_based.DatagramBased._getGType);
            if (_klass && _klass.conditionCheck)
              return (cast(typeof(&_vfuncConditionCheckTramp))_klass.conditionCheck)(datagramBased, condition);
            return typeof(return).init;
          }

          gid.glib2.types.IOCondition _dretval;

          try
          {
            _dretval = _obj.vfuncConditionCheck(condition);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.datagram_based.DatagramBased.vfuncConditionCheck");
          }
          auto _retval = cast(GIOCondition)_dretval;

          return _retval;
        }

        _klass.conditionCheck = cast(typeof(_klass.conditionCheck))&_vfuncConditionCheckTramp;
        break;
      }
      case "condition_wait":
      {
        static extern(C) gboolean _vfuncConditionWaitTramp(GDatagramBased* datagramBased, GIOCondition condition, long timeout, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)datagramBased);
          if (!_obj)
          {
            auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)datagramBased), gid.gio2.datagram_based.DatagramBased._getGType);
            if (_klass && _klass.conditionWait)
              return (cast(typeof(&_vfuncConditionWaitTramp))_klass.conditionWait)(datagramBased, condition, timeout, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncConditionWait(condition, timeout, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.conditionWait = cast(typeof(_klass.conditionWait))&_vfuncConditionWaitTramp;
        break;
      }
      case "create_source":
      {
        static extern(C) GSource* _vfuncCreateSourceTramp(GDatagramBased* datagramBased, GIOCondition condition, GCancellable* cancellable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)datagramBased);
          if (!_obj)
          {
            auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)datagramBased), gid.gio2.datagram_based.DatagramBased._getGType);
            if (_klass && _klass.createSource)
              return (cast(typeof(&_vfuncCreateSourceTramp))_klass.createSource)(datagramBased, condition, cancellable);
            return typeof(return).init;
          }

          gid.glib2.source.Source _dretval;

          try
          {
            _dretval = _obj.vfuncCreateSource(condition, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.datagram_based.DatagramBased.vfuncCreateSource");
          }
          auto _retval = _dretval ? cast(GSource*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createSource = cast(typeof(_klass.createSource))&_vfuncCreateSourceTramp;
        break;
      }
      case "receive_messages":
      {
        static extern(C) int _vfuncReceiveMessagesTramp(GDatagramBased* datagramBased, GInputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)datagramBased);
          if (!_obj)
          {
            auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)datagramBased), gid.gio2.datagram_based.DatagramBased._getGType);
            if (_klass && _klass.receiveMessages)
              return (cast(typeof(&_vfuncReceiveMessagesTramp))_klass.receiveMessages)(datagramBased, messages, numMessages, flags, timeout, cancellable, _err);
            return typeof(return).init;
          }

          int _retval;
          gid.gio2.input_message.InputMessage[] _messages;
          _messages.length = numMessages;
          foreach (i; 0 .. numMessages)
            _messages[i] = new gid.gio2.input_message.InputMessage(cast(void*)&messages[i], null);

          try
          {
            _retval = _obj.vfuncReceiveMessages(_messages, flags, timeout, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.receiveMessages = cast(typeof(_klass.receiveMessages))&_vfuncReceiveMessagesTramp;
        break;
      }
      case "send_messages":
      {
        static extern(C) int _vfuncSendMessagesTramp(GDatagramBased* datagramBased, GOutputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)datagramBased);
          if (!_obj)
          {
            auto _klass = cast(GDatagramBasedInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)datagramBased), gid.gio2.datagram_based.DatagramBased._getGType);
            if (_klass && _klass.sendMessages)
              return (cast(typeof(&_vfuncSendMessagesTramp))_klass.sendMessages)(datagramBased, messages, numMessages, flags, timeout, cancellable, _err);
            return typeof(return).init;
          }

          int _retval;
          gid.gio2.output_message.OutputMessage[] _messages;
          _messages.length = numMessages;
          foreach (i; 0 .. numMessages)
            _messages[i] = new gid.gio2.output_message.OutputMessage(cast(void*)&messages[i], null);

          try
          {
            _retval = _obj.vfuncSendMessages(_messages, flags, timeout, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.sendMessages = cast(typeof(_klass.sendMessages))&_vfuncSendMessagesTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.datagram_based.DatagramBased]
template DatagramBasedGidBuilderT()
{
}
