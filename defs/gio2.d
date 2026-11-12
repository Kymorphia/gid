//!gir Gio-2.0
//!info description "D binding for the Gio library - General purpose I/O library which is part of glib"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gio2/
//!info capi https://docs.gtk.org/gio/

//!kind InputVector StructAlias
//!kind OutputVector StructAlias

//# Ignore APIs which aren't useful to D binding
//!set record[IOExtension][ignore] 1
//!set record[IOExtensionPoint][ignore] 1
//!set class[IOModule][ignore] 1
//!set class[SettingsBackend].method[changed_tree][ignore] 1
//!set function[io_modules_load_all_in_directory][ignore] 1
//!set function[io_modules_load_all_in_directory_with_scope][ignore] 1

//# DataInputStream.read_byte() conflicts with parent BufferedInputStream.read_byte()
//!set class[DataInputStream].method[read_byte][name] read_byte_data

//# Add missing closure designation
//!set callback[AsyncReadyCallback].parameters.parameter[data][closure] 2

//# DBus interface property callbacks have an explicit GError** parameter, convert it to throws
//!del callback[DBusInterfaceGetPropertyFunc].parameters.parameter[error]
//!set callback[DBusInterfaceGetPropertyFunc][throws] 1
//!del callback[DBusInterfaceSetPropertyFunc].parameters.parameter[error]
//!set callback[DBusInterfaceSetPropertyFunc][throws] 1

//# Set return/param arrays to be zero-terminated=1
//!set callback[DBusSubtreeIntrospectFunc].return-value.array[][zero-terminated] 1
//!set class[Application].method[add_main_option_entries].parameters.parameter[entries].array[][zero-terminated] 1
//!set record[DBusAnnotationInfo].function[lookup].parameters.parameter[annotations].array[][zero-terminated] 1
//!set class[DBusMessage].method[get_header_fields].return-value.array[][zero-terminated] 1
//!set class[DataInputStream].method[read_line].return-value.array[][zero-terminated] 1
//!set class[DataInputStream].method[read_line_finish].return-value.array[][zero-terminated] 1
//!set class[InetAddress].constructor[new_from_bytes].parameters.parameter[bytes].array[][zero-terminated] 1
//!set class[InetAddress].constructor[new_from_bytes_with_ipv6_info].parameters.parameter[bytes].array[][zero-terminated] 1
//!set function[dbus_escape_object_path_bytestring].parameters.parameter[bytes].array[][zero-terminated] 1
//!set function[dbus_unescape_object_path].return-value.array[][zero-terminated] 1

//# Newer GIR types read_line return as a guint8 array without element c:type, restore char element type so it is returned as a string
//!set class[DataInputStream].method[read_line].return-value.array.type '<type name="gchar" c:type="char"/>'
//!set class[DataInputStream].method[read_line_finish].return-value.array.type '<type name="gchar" c:type="char"/>'


//# Set field arrays to be zero-terminated=1
//!set record[DBusAnnotationInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusArgInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[methods].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[signals].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[properties].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[in_args].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[out_args].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[interfaces].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[nodes].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusPropertyInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusSignalInfo].field[args].array[][zero-terminated] 1
//!set record[DBusSignalInfo].field[annotations].array[][zero-terminated] 1

//# Set parameters to out
//!set callback[DBusSubtreeDispatchFunc].parameters.parameter[out_user_data][direction] out

//# string-length-param (Strings with array length parameters)
//!set class[DataInputStream].method[read_upto].parameters.parameter[stop_chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[DataInputStream].method[read_upto_async].parameters.parameter[stop_chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TlsCertificate].constructor[new_from_pem].parameters.parameter[data].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# string-array-null-term (Null terminated string arrays)
//!set function[file_new_build_filenamev].parameters.parameter[args].array[][zero-terminated] 1
//!set class[IOModule].function[query].return-value.array[][zero-terminated] 1
//!set class[SettingsBackend].function[flatten_tree].parameters.parameter[keys].array[][zero-terminated] 1
//!set class[SettingsBackend].function[flatten_tree].parameters.parameter[values].array[][zero-terminated] 1

//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[DBusAnnotationInfo].field[annotations][writable] 0
//!set record[DBusArgInfo].field[annotations][writable] 0
//!set record[DBusInterfaceInfo].field[methods][writable] 0
//!set record[DBusInterfaceInfo].field[signals][writable] 0
//!set record[DBusInterfaceInfo].field[properties][writable] 0
//!set record[DBusInterfaceInfo].field[annotations][writable] 0
//!set record[DBusMethodInfo].field[in_args][writable] 0
//!set record[DBusMethodInfo].field[out_args][writable] 0
//!set record[DBusMethodInfo].field[annotations][writable] 0
//!set record[DBusNodeInfo].field[interfaces][writable] 0
//!set record[DBusNodeInfo].field[nodes][writable] 0
//!set record[DBusNodeInfo].field[annotations][writable] 0
//!set record[DBusPropertyInfo].field[annotations][writable] 0
//!set record[DBusSignalInfo].field[args][writable] 0
//!set record[DBusSignalInfo].field[annotations][writable] 0
//!set record[FileAttributeInfoList].field[infos][writable] 0
//!set record[InputMessage].field[vectors][writable] 0
//!set record[OutputMessage].field[vectors][writable] 0
//!set record[OutputMessage].field[control_messages][writable] 0

//# Ignore: Internal/implementation-only API, not useful from D
//!set class[SettingsBackend].function[flatten_tree][ignore] 1
//!set class[Task].method[set_task_data][ignore] 1

//# Ignore: Redundant with another API (e.g. GBytes variant, simpler setter or accessor methods)
//!set interface[DtlsClientConnection].property[accepted-cas][ignore] 1
//!set class[MemoryInputStream].constructor[new_from_data][ignore] 1
//!set class[MemoryInputStream].method[add_data][ignore] 1
//!set class[TlsCertificate].property[certificate][ignore] 1
//!set class[TlsCertificate].property[dns-names][ignore] 1
//!set class[TlsCertificate].property[ip-addresses][ignore] 1
//!set class[TlsCertificate].property[pkcs12-data][ignore] 1
//!set class[TlsCertificate].property[private-key][ignore] 1
//!set interface[TlsClientConnection].property[accepted-cas][ignore] 1
//!set class[TlsPassword].method[set_value_full][ignore] 1
//!set class[UnixSocketAddress].property[path-as-array][ignore] 1

//# Ignore: Generic gpointer result with destroy notify, use Task.returnValue or the typed return methods instead
//!set class[Task].method[return_pointer][ignore] 1

//# Cancellable.connect takes a generic GCallback, add a callback type with the 'cancelled' signal signature
//!add repository.namespace '<callback name="CancellableConnectFunc" c:type="GCancellableConnectFunc"><return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value><parameters><parameter name="cancellable" transfer-ownership="none"><type name="Cancellable" c:type="GCancellable*"/></parameter><parameter name="data" transfer-ownership="none" nullable="1" allow-none="1" closure="1"><type name="gpointer" c:type="gpointer"/></parameter></parameters></callback>'
//!set class[Cancellable].method[connect].parameters.parameter[callback].type '<type name="CancellableConnectFunc" c:type="GCancellableConnectFunc"/>'

//# Ignore: Thread function callbacks without closure data, use D threads or async APIs instead
//!set class[Task].method[run_in_thread][ignore] 1
//!set class[Task].method[run_in_thread_sync][ignore] 1

//# Disable: Callback returns structure pointer with transfer none (no D owner to keep it alive for C)
//!set callback[DBusSubtreeDispatchFunc][disable] 1
//!set record[DBusSubtreeVTable].field[dispatch][disable] 1

//# Disable: Notified callback without closure data
//!set class[DBusConnection].method[register_subtree][disable] 1

//# Hand-written below: Receive return location fields, set to temporary locations by receiveMessages (the received
//# address and control messages are owned by the InputMessage), vectors set from D buffers
//!set record[InputMessage].field[address][ignore] 1
//!set record[InputMessage].field[control_messages][ignore] 1
//!set record[InputMessage].field[num_control_messages][ignore] 1
//!set class[Socket].method[receive_messages][ignore] 1
//!set interface[DatagramBased].method[receive_messages][ignore] 1

//# Hand-written below: Returns a list of byte arrays
//!set interface[DtlsClientConnection].method[get_accepted_cas][ignore] 1
//!set interface[TlsClientConnection].method[get_accepted_cas][ignore] 1

//!class InputMessage pre

import gio.socket_address;
import gio.socket_control_message;
import gobject.object;

//!class InputMessage

  private gio.types.InputVector[] _vectorsRef; // Vectors array referenced by the C structure (references the buffers)
  private bool _receiveAddress; // Receive the source address of the message
  private bool _receiveControlMessages; // Receive the control messages of the message
  private gio.socket_address.SocketAddress _address; // Source address of the last receive
  private gio.socket_control_message.SocketControlMessage[] _controlMessages; // Control messages of the last receive

  /**
      Create an input message which receives data into buffers.
      Params:
        buffers = the buffers to receive the message data into (scatter input, in order), kept alive by the message
        receiveAddress = true to receive the source address of the message (see [gio.input_message.InputMessage.address])
        receiveControlMessages = true to receive the control messages of the message (see
          [gio.input_message.InputMessage.controlMessages])
  */
  this(ubyte[][] buffers, bool receiveAddress = false, bool receiveControlMessages = false) nothrow
  {
    this.buffers = buffers;
    _receiveAddress = receiveAddress;
    _receiveControlMessages = receiveControlMessages;
  }

  /**
      Set the buffers to receive the message data into (sets the `vectors` and `numVectors` fields).
      Params:
        propval = the buffers to receive the message data into (scatter input, in order), kept alive by the message
  */
  @property void buffers(ubyte[][] propval) nothrow
  {
    if (_refuseBorrowedStore("vectors"))
      return;

    _vectorsRef = new gio.types.InputVector[](propval.length);

    foreach (i, buf; propval)
    {
      _vectorsRef[i].buffer = buf.ptr;
      _vectorsRef[i].size = buf.length;
    }

    (cast(GInputMessage*)this._cPtr).vectors = _vectorsRef.length > 0 ? _vectorsRef.ptr : null;
    (cast(GInputMessage*)this._cPtr).numVectors = cast(uint)_vectorsRef.length;
  }

  /**
      Get whether the source address of the message is received.
      Returns: true if the source address is received
  */
  @property bool receiveAddress() nothrow
  {
    return _receiveAddress;
  }

  /**
      Set whether the source address of the message is received (see [gio.input_message.InputMessage.address]).
      Params:
        propval = true to receive the source address
  */
  @property void receiveAddress(bool propval) nothrow
  {
    _receiveAddress = propval;
  }

  /**
      Get whether the control messages of the message are received.
      Returns: true if the control messages are received
  */
  @property bool receiveControlMessages() nothrow
  {
    return _receiveControlMessages;
  }

  /**
      Set whether the control messages of the message are received (see
      [gio.input_message.InputMessage.controlMessages]).
      Params:
        propval = true to receive the control messages
  */
  @property void receiveControlMessages(bool propval) nothrow
  {
    _receiveControlMessages = propval;
  }

  /**
      Get the source address of the message received by the last receive operation.
      Returns: the source address or null if not received (see [gio.input_message.InputMessage.receiveAddress])
  */
  @property gio.socket_address.SocketAddress address() nothrow
  {
    return _address;
  }

  /**
      Get the control messages received with the message by the last receive operation.
      Returns: the control messages, empty if none were received (see
        [gio.input_message.InputMessage.receiveControlMessages])
  */
  @property gio.socket_control_message.SocketControlMessage[] controlMessages() nothrow
  {
    return _controlMessages;
  }

  /**
      Receive messages with a C receive function (used by [gio.socket.Socket.receiveMessages] and
      [gio.datagram_based.DatagramBased.receiveMessages]). The C messages are temporary copies, with the address and
      control messages return locations set as requested by the messages, which take ownership of the received
      addresses and control messages afterwards.
      Params:
        messages = the messages
        context = API name for critical messages
        receive = delegate which calls the C receive function with the C messages and their count
      Returns: the receive function result, -1 if a message is null
  */
  package static int _receiveMessages(gio.input_message.InputMessage[] messages, string context,
    scope int delegate(GInputMessage* cMessages, uint numMessages) nothrow receive) nothrow
  {
    import glib.c.functions : g_free, g_log;
    import glib.c.types : GLogLevelFlags;

    foreach (i, msg; messages)
    {
      if (!msg)
      {
        g_log("Gid", GLogLevelFlags.LevelCritical, "%.*s messages[%d] is null", cast(int)context.length, context.ptr,
          cast(int)i);
        return -1;
      }
    }

    auto cMessages = new GInputMessage[](messages.length);
    auto addresses = new GSocketAddress*[](messages.length);
    auto controlArrays = new GSocketControlMessage**[](messages.length);
    auto numControls = new uint[](messages.length);

    foreach (i, msg; messages)
    {
      cMessages[i] = *cast(GInputMessage*)msg._cPtr;
      cMessages[i].address = msg._receiveAddress ? &addresses[i] : null;
      cMessages[i].controlMessages = msg._receiveControlMessages ? &controlArrays[i] : null;
      cMessages[i].numControlMessages = msg._receiveControlMessages ? &numControls[i] : null;
    }

    auto retval = receive(cMessages.length > 0 ? cMessages.ptr : null, cast(uint)cMessages.length);

    foreach (i, msg; messages)
    {
      auto cMsg = cast(GInputMessage*)msg._cPtr;
      cMsg.bytesReceived = cMessages[i].bytesReceived;
      cMsg.flags = cMessages[i].flags;

      msg._address = addresses[i]
        ? gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(addresses[i], Yes.Take) : null;
      msg._controlMessages = null;

      if (controlArrays[i])
      {
        msg._controlMessages = new gio.socket_control_message.SocketControlMessage[](numControls[i]);

        foreach (j; 0 .. numControls[i])
          msg._controlMessages[j] = gobject.object.ObjectWrap._getDObject!(
            gio.socket_control_message.SocketControlMessage)(controlArrays[i][j], Yes.Take);

        g_free(controlArrays[i]);
      }
    }

    return retval;
  }

//!class Socket pre

import gio.input_message;

//!class Socket

  /**
      Receive multiple data messages from socket in one go. This is the most complicated and fully-featured version of
      this call. For easier use, see [gio.socket.Socket.receive], [gio.socket.Socket.receiveFrom], and
      [gio.socket.Socket.receiveMessage].

      messages must be an array of [gio.input_message.InputMessage] objects, each of which receives data into its
      buffers (see [gio.input_message.InputMessage.buffers]) and is updated with the number of bytes received, the
      message flags, and the source address and control messages if requested (see
      [gio.input_message.InputMessage.receiveAddress] and [gio.input_message.InputMessage.receiveControlMessages]).

      flags modify how all messages are received. The commonly available arguments for this are available in the
      #GSocketMsgFlags enum, but the values there are the same as the system values, and the flags are passed in as-is,
      so you can pass in system-specific flags too. These flags affect the overall receive operation. Flags affecting
      individual messages are returned in [gio.input_message.InputMessage.flags].

      If the socket is blocking then the call will block until one or more messages are received (or an error or
      cancellation occurs), otherwise [gio.types.IOErrorEnum.WouldBlock] is thrown if no messages are available.

      Params:
        messages = an array of input messages
        flags = an int containing #GSocketMsgFlags flags for the overall operation, which may additionally contain
          [MSG_WAITFORONE](https://man7.org/linux/man-pages/man2/recvmmsg.2.html) to request blocking only until the
          first message is received
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: number of messages received, which may be less than the number of messages
      Throws: [ErrorWrap]
  */
  int receiveMessages(gio.input_message.InputMessage[] messages, int flags, gio.cancellable.Cancellable cancellable = null)
  {
    GError* _err;
    auto _retval = gio.input_message.InputMessage._receiveMessages(messages, "gio.socket.Socket.receiveMessages",
      (GInputMessage* cMessages, uint numMessages) => g_socket_receive_messages(cast(GSocket*)this._cPtr, cMessages,
        numMessages, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err));

    if (_err)
      throw new ErrorWrap(_err, Yes.Take);

    return _retval;
  }

//!class DatagramBased pre

// Public import for the interface mixin template (resolved where it is mixed in), receiveMessages is hand-written
public import gio.input_message;
import gobject.object;

//!class DatagramBased

  /**
      Receive one or more data messages from datagram_based in one go.

      messages must be an array of [gio.input_message.InputMessage] objects, each of which receives data into its
      buffers (see [gio.input_message.InputMessage.buffers]) and is updated with the number of bytes received, the
      message flags, and the source address and control messages if requested (see
      [gio.input_message.InputMessage.receiveAddress] and [gio.input_message.InputMessage.receiveControlMessages]).

      flags modify how all messages are received. The commonly available arguments for this are available in the
      #GSocketMsgFlags enum, but the values there are the same as the system values, and the flags are passed in as-is,
      so you can pass in system-specific flags too. These flags affect the overall receive operation. Flags affecting
      individual messages are returned in [gio.input_message.InputMessage.flags].

      If timeout is negative the call will block until at least one message is received, cancellable is cancelled, or
      an error occurs. If timeout is 0 the call will return up to the number of messages without blocking, or
      [gio.types.IOErrorEnum.WouldBlock] if no messages are queued. If timeout is positive the call will block on the
      same conditions as if timeout were negative, or until the timeout elapses ([gio.types.IOErrorEnum.TimedOut]).

      Params:
        messages = an array of input messages
        flags = an int containing #GSocketMsgFlags flags for the overall operation
        timeout = the maximum time (in microseconds) to wait, 0 to not block, or -1 to block indefinitely
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: number of messages received, which may be less than the number of messages if timeout is zero or
        positive, if the peer closed the connection, or if the number of messages was larger than `UIO_MAXIOV` (1024)
      Throws: [ErrorWrap]
  */
  int receiveMessages()(gio.input_message.InputMessage[] messages, int flags, long timeout,
    gio.cancellable.Cancellable cancellable = null)
  {
    GError* _err;
    auto _retval = gio.input_message.InputMessage._receiveMessages(messages,
      "gio.datagram_based.DatagramBased.receiveMessages", (GInputMessage* cMessages, uint numMessages) =>
      g_datagram_based_receive_messages(cast(GDatagramBased*)(cast(gobject.object.ObjectWrap)this)._cPtr, cMessages,
        numMessages, flags, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err));

    if (_err)
      throw new ErrorWrap(_err, Yes.Take);

    return _retval;
  }

//!class TlsClientConnection

  /**
      Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates
      from. This will be set during the TLS handshake if the server requests a certificate. Otherwise, it will be
      empty.
      Returns: the DER encoded distinguished names, one for each accepted CA
  */
  ubyte[][] getAcceptedCas()() nothrow
  {
    import glib.c.functions : g_byte_array_unref, g_list_free;
    import glib.c.types : GByteArray, GList;

    auto _list = g_tls_client_connection_get_accepted_cas(cast(GTlsClientConnection*)(cast(gobject.object.ObjectWrap)this)._cPtr);
    ubyte[][] _retval;

    for (auto n = _list; n; n = n.next) // List and GByteArray items owned by the caller (transfer full)
    {
      auto ba = cast(GByteArray*)n.data;
      _retval ~= ba && ba.len > 0 ? ba.data[0 .. ba.len].dup : null;

      if (ba)
        g_byte_array_unref(ba);
    }

    g_list_free(_list);
    return _retval;
  }

//!class DtlsClientConnection

  /**
      Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates
      from. This will be set during the DTLS handshake if the server requests a certificate. Otherwise, it will be
      empty.
      Returns: the DER encoded distinguished names, one for each accepted CA
  */
  ubyte[][] getAcceptedCas()() nothrow
  {
    import glib.c.functions : g_byte_array_unref, g_list_free;
    import glib.c.types : GByteArray, GList;

    auto _list = g_dtls_client_connection_get_accepted_cas(cast(GDtlsClientConnection*)(cast(gobject.object.ObjectWrap)this)._cPtr);
    ubyte[][] _retval;

    for (auto n = _list; n; n = n.next) // List and GByteArray items owned by the caller (transfer full)
    {
      auto ba = cast(GByteArray*)n.data;
      _retval ~= ba && ba.len > 0 ? ba.data[0 .. ba.len].dup : null;

      if (ba)
        g_byte_array_unref(ba);
    }

    g_list_free(_list);
    return _retval;
  }

//!class ListModel

  /**
   * Get the item at position and cast to the template type.
   * NOTE: If type is an interface and no known D object is found that the object conforms to,
   * the interface IfaceProxy object will be used.
   * If position is greater than the number of items in list, %NULL is
   * returned.
   * %NULL may be returned if index is smaller than the length
   * of the list, but the object does not conform to the template type.
   * This function is meant to be used by language bindings in place
   * of [Gio.ListModel.getItem].
   * See also: [Gio.ListModel.getNItems]
   * Params:
   *   T = type to cast the resulting object to (can be an interface type)
   *   position = the position of the item to fetch
   * Returns: the object at position.
   */
  T getItem(T)(uint position) nothrow
  {
    auto gobj = cast(GObject*)g_list_model_get_object(cast(GListModel*)(cast(gobject.object.ObjectWrap)this)._cPtr, position);
    return gobject.object.ObjectWrap._getDObject!T(gobj, Yes.Take);
  }

//# Ignore: ListStore.findWithEqualFuncFull with unnecessary additional user_data
//!set class[ListStore].method[find_with_equal_func_full][ignore] 1

//# Override to use delegates with ObjectWrap arguments
//!set class[ListStore].method[find_with_equal_func][ignore] 1
//!set class[ListStore].method[insert_sorted][ignore] 1
//!set class[ListStore].method[sort][ignore] 1

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[DBusAnnotationInfo].field[key][owned] 1
//!set record[DBusAnnotationInfo].field[value][owned] 1
//!set record[DBusArgInfo].field[name][owned] 1
//!set record[DBusArgInfo].field[signature][owned] 1
//!set record[DBusMethodInfo].field[name][owned] 1
//!set record[DBusSignalInfo].field[name][owned] 1
//!set record[DBusPropertyInfo].field[name][owned] 1
//!set record[DBusPropertyInfo].field[signature][owned] 1
//!set record[DBusInterfaceInfo].field[name][owned] 1
//!set record[DBusNodeInfo].field[path][owned] 1

//!class ListStore

  //# Override findWithEqualFunc to handle ObjectWrap parameters instead of GObject pointers
  /**
   * Looks up the given item in the list store by looping over the items and
   * comparing them with equal_func until the first occurrence of item which
   * matches. If item was not found, then position will not be set, and this
   * method will return %FALSE.
   * item is always passed as second parameter to equal_func.
   * Since GLib 2.76 it is possible to pass `NULL` for item.
   * Params:
   *   item = an item
   *   equalFunc = A custom equality check function
   *   position = the first position of item, if it was found.
   * Returns: Whether store contains item. If it was found, position will be
   *   set to the position where item occurred for the first time.
   */
  bool findWithEqualFunc(gobject.object.ObjectWrap item, bool delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) equalFunc, out uint position) nothrow
  {
    static bool delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) _static_equalFunc;

    extern(C) gboolean _equalFuncCallback(const(void)* a, const(void)* b) nothrow
    {
      gboolean _retval;

      try
      {
        _retval = _static_equalFunc(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)a, No.Take),
          gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
        gidInvokeCallbackExceptionHandler(e, "gio.list_store.ListStore.findWithEqualFunc");

      return _retval;
    }

    _static_equalFunc = equalFunc;
    gboolean _retval;
    _retval = g_list_store_find_with_equal_func(cast(GListStore*)_cPtr, item ? cast(GObject*)item._cPtr : null, &_equalFuncCallback, cast(uint*)&position);
    _static_equalFunc = null;
    return cast(bool)_retval;
  }

  /**
   * Inserts item into store at a position to be determined by the
   * compare_func.
   * The list must already be sorted before calling this function or the
   * result is undefined.  Usually you would approach this by only ever
   * inserting items by way of this function.
   * This function takes a ref on item.
   * Params:
   *   item = the new item
   *   compareFunc = pairwise comparison function for sorting
   * Returns: the position at which item was inserted
   */
  uint insertSorted(gobject.object.ObjectWrap item, int delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) compareFunc) nothrow
  {
    static int delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      int _retval;

      try
      {
        _retval = _static_compareFunc(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)a, No.Take),
          gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
        gidInvokeCallbackExceptionHandler(e, "gio.list_store.ListStore.insertSorted");

      return _retval;
    }

    _static_compareFunc = compareFunc;
    uint _retval;
    _retval = g_list_store_insert_sorted(cast(GListStore*)_cPtr, item ? cast(GObject*)item._cPtr : null, &_compareFuncCallback, null);
    _static_compareFunc = null;
    return _retval;
  }

  /**
   * Sort the items in store according to compare_func.
   * Params:
   *   compareFunc = pairwise comparison function for sorting
   */
  void sort(int delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) compareFunc) nothrow
  {
    static int delegate(gobject.object.ObjectWrap, gobject.object.ObjectWrap) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      int _retval;

      try
      {
        _retval = _static_compareFunc(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)a, No.Take),
          gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
        gidInvokeCallbackExceptionHandler(e, "gio.list_store.ListStore.sort");

      return _retval;
    }

    _static_compareFunc = compareFunc;
    g_list_store_sort(cast(GListStore*)_cPtr, &_compareFuncCallback, null);
    _static_compareFunc = null;
  }
