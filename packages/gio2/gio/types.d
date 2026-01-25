/// D types for gio2 library
module gio.types;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.datagram_based;
import gio.dbus_connection;
import gio.dbus_interface_info;
import gio.dbus_message;
import gio.dbus_method_invocation;
import gio.dbus_object_manager_client;
import gio.desktop_app_info;
import gio.file;
import gio.ioscheduler_job;
import gio.simple_async_result;
import gio.socket;
import gio.task;
import gio.vfs;
import glib.error;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.object;
import gobject.types;
import gobject.value;


// Enums

/** */
alias AppInfoCreateFlags = GAppInfoCreateFlags;

/** */
alias ApplicationFlags = GApplicationFlags;

/** */
alias AskPasswordFlags = GAskPasswordFlags;

/** */
alias BusNameOwnerFlags = GBusNameOwnerFlags;

/** */
alias BusNameWatcherFlags = GBusNameWatcherFlags;

/** */
alias BusType = GBusType;

/** */
alias ConverterFlags = GConverterFlags;

/** */
alias ConverterResult = GConverterResult;

/** */
alias CredentialsType = GCredentialsType;

/** */
alias DBusCallFlags = GDBusCallFlags;

/** */
alias DBusCapabilityFlags = GDBusCapabilityFlags;

/** */
alias DBusConnectionFlags = GDBusConnectionFlags;

/** */
alias DBusError = GDBusError;

/** */
alias DBusInterfaceSkeletonFlags = GDBusInterfaceSkeletonFlags;

/** */
alias DBusMessageByteOrder = GDBusMessageByteOrder;

/** */
alias DBusMessageFlags = GDBusMessageFlags;

/** */
alias DBusMessageHeaderField = GDBusMessageHeaderField;

/** */
alias DBusMessageType = GDBusMessageType;

/** */
alias DBusObjectManagerClientFlags = GDBusObjectManagerClientFlags;

/** */
alias DBusPropertyInfoFlags = GDBusPropertyInfoFlags;

/** */
alias DBusProxyFlags = GDBusProxyFlags;

/** */
alias DBusSendMessageFlags = GDBusSendMessageFlags;

/** */
alias DBusServerFlags = GDBusServerFlags;

/** */
alias DBusSignalFlags = GDBusSignalFlags;

/** */
alias DBusSubtreeFlags = GDBusSubtreeFlags;

/** */
alias DataStreamByteOrder = GDataStreamByteOrder;

/** */
alias DataStreamNewlineType = GDataStreamNewlineType;

/** */
alias DriveStartFlags = GDriveStartFlags;

/** */
alias DriveStartStopType = GDriveStartStopType;

/** */
alias EmblemOrigin = GEmblemOrigin;

/** */
alias FileAttributeInfoFlags = GFileAttributeInfoFlags;

/** */
alias FileAttributeStatus = GFileAttributeStatus;

/** */
alias FileAttributeType = GFileAttributeType;

/** */
alias FileCopyFlags = GFileCopyFlags;

/** */
alias FileCreateFlags = GFileCreateFlags;

/** */
alias FileMeasureFlags = GFileMeasureFlags;

/** */
alias FileMonitorEvent = GFileMonitorEvent;

/** */
alias FileMonitorFlags = GFileMonitorFlags;

/** */
alias FileQueryInfoFlags = GFileQueryInfoFlags;

/** */
alias FileType = GFileType;

/** */
alias FilesystemPreviewType = GFilesystemPreviewType;

/** */
alias IOErrorEnum = GIOErrorEnum;

/** */
alias IOModuleScopeFlags = GIOModuleScopeFlags;

/** */
alias IOStreamSpliceFlags = GIOStreamSpliceFlags;

/** */
alias MemoryMonitorWarningLevel = GMemoryMonitorWarningLevel;

/** */
alias MountMountFlags = GMountMountFlags;

/** */
alias MountOperationResult = GMountOperationResult;

/** */
alias MountUnmountFlags = GMountUnmountFlags;

/** */
alias NetworkConnectivity = GNetworkConnectivity;

/** */
alias NotificationPriority = GNotificationPriority;

/** */
alias OutputStreamSpliceFlags = GOutputStreamSpliceFlags;

/** */
alias PasswordSave = GPasswordSave;

/** */
alias PollableReturn = GPollableReturn;

/** */
alias ResolverError = GResolverError;

/** */
alias ResolverNameLookupFlags = GResolverNameLookupFlags;

/** */
alias ResolverRecordType = GResolverRecordType;

/** */
alias ResourceError = GResourceError;

/** */
alias ResourceFlags = GResourceFlags;

/** */
alias ResourceLookupFlags = GResourceLookupFlags;

/** */
alias SettingsBindFlags = GSettingsBindFlags;

/** */
alias SocketClientEvent = GSocketClientEvent;

/** */
alias SocketFamily = GSocketFamily;

/** */
alias SocketListenerEvent = GSocketListenerEvent;

/** */
alias SocketMsgFlags = GSocketMsgFlags;

/** */
alias SocketProtocol = GSocketProtocol;

/** */
alias SocketType = GSocketType;

/** */
alias SubprocessFlags = GSubprocessFlags;

/** */
alias TestDBusFlags = GTestDBusFlags;

/** */
alias TlsAuthenticationMode = GTlsAuthenticationMode;

/** */
alias TlsCertificateFlags = GTlsCertificateFlags;

/** */
alias TlsCertificateRequestFlags = GTlsCertificateRequestFlags;

/** */
alias TlsChannelBindingError = GTlsChannelBindingError;

/** */
alias TlsChannelBindingType = GTlsChannelBindingType;

/** */
alias TlsDatabaseLookupFlags = GTlsDatabaseLookupFlags;

/** */
alias TlsDatabaseVerifyFlags = GTlsDatabaseVerifyFlags;

/** */
alias TlsError = GTlsError;

/** */
alias TlsInteractionResult = GTlsInteractionResult;

/** */
alias TlsPasswordFlags = GTlsPasswordFlags;

/** */
alias TlsProtocolVersion = GTlsProtocolVersion;

/** */
alias TlsRehandshakeMode = GTlsRehandshakeMode;

/** */
alias UnixSocketAddressType = GUnixSocketAddressType;

/** */
alias ZlibCompressorFormat = GZlibCompressorFormat;

// Structs

/** */
alias DBusInterfaceVTable = GDBusInterfaceVTable;

/** */
alias DBusSubtreeVTable = GDBusSubtreeVTable;

/** */
alias IOStreamAdapter = GIOStreamAdapter*;

/** */
alias InputVector = GInputVector;

/** */
alias OutputVector = GOutputVector;

// Callbacks

/**
    Type definition for a function that will be called back when an asynchronous
    operation within GIO has been completed. #GAsyncReadyCallback
    callbacks from #GTask are guaranteed to be invoked in a later
    iteration of the
    [thread-default main context][g-main-context-push-thread-default]
    where the #GTask was created. All other users of
    #GAsyncReadyCallback must likewise call it asynchronously in a
    later iteration of the main context.
    
    The asynchronous operation is guaranteed to have held a reference to
    source_object from the time when the `*_async()` function was called, until
    after this callback returns.

    Params:
      sourceObject = the object the asynchronous operation was started with.
      res = a #GAsyncResult.
*/
alias AsyncReadyCallback = void delegate(gobject.object.ObjectWrap sourceObject, gio.async_result.AsyncResult res);

/**
    Invoked when a connection to a message bus has been obtained.

    Params:
      connection = The #GDBusConnection to a message bus.
      name = The name that is requested to be owned.
*/
alias BusAcquiredCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name is acquired.

    Params:
      connection = The #GDBusConnection on which to acquired the name.
      name = The name being owned.
*/
alias BusNameAcquiredCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name being watched is known to have to have an owner.

    Params:
      connection = The #GDBusConnection the name is being watched on.
      name = The name being watched.
      nameOwner = Unique name of the owner of the name being watched.
*/
alias BusNameAppearedCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name, string nameOwner);

/**
    Invoked when the name is lost or connection has been closed.

    Params:
      connection = The #GDBusConnection on which to acquire the name or null if
        the connection was disconnected.
      name = The name being owned.
*/
alias BusNameLostCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name being watched is known not to have to have an owner.
    
    This is also invoked when the #GDBusConnection on which the watch was
    established has been closed.  In that case, connection will be
    null.

    Params:
      connection = The #GDBusConnection the name is being watched on, or
            null.
      name = The name being watched.
*/
alias BusNameVanishedCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    This is the function type of the callback used for the #GSource
    returned by [gio.cancellable.Cancellable.sourceNew].

    Params:
      cancellable = the #GCancellable
    Returns: it should return false if the source should be removed.
*/
alias CancellableSourceFunc = bool delegate(gio.cancellable.Cancellable cancellable);

/**
    The type of the get_property function in #GDBusInterfaceVTable.

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that the method was invoked on.
      interfaceName = The D-Bus interface name for the property.
      propertyName = The name of the property to get the value of.
      error = Return location for error.
    Returns: A #GVariant with the value for property_name or null if
          error is set. If the returned #GVariant is floating, it is
          consumed - otherwise its reference count is decreased by one.
*/
alias DBusInterfaceGetPropertyFunc = glib.variant.Variant delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string propertyName, glib.error.ErrorWrap error);

/**
    The type of the method_call function in #GDBusInterfaceVTable.

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that the method was invoked on.
      interfaceName = The D-Bus interface name the method was invoked on.
      methodName = The name of the method that was invoked.
      parameters = A #GVariant tuple with parameters.
      invocation = A #GDBusMethodInvocation object that must be used to return a value or error.
*/
alias DBusInterfaceMethodCallFunc = void delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string methodName, glib.variant.Variant parameters, gio.dbus_method_invocation.DBusMethodInvocation invocation);

/**
    The type of the set_property function in #GDBusInterfaceVTable.

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that the method was invoked on.
      interfaceName = The D-Bus interface name for the property.
      propertyName = The name of the property to get the value of.
      value = The value to set the property to.
      error = Return location for error.
    Returns: true if the property was set to value, false if error is set.
*/
alias DBusInterfaceSetPropertyFunc = bool delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string propertyName, glib.variant.Variant value, glib.error.ErrorWrap error);

/**
    Signature for function used in [gio.dbus_connection.DBusConnection.addFilter].
    
    A filter function is passed a #GDBusMessage and expected to return
    a #GDBusMessage too. Passive filter functions that don't modify the
    message can simply return the message object:
    ```
    static GDBusMessage *
    passive_filter (GDBusConnection *connection
                    GDBusMessage    *message,
                    gboolean         incoming,
                    gpointer         user_data)
    {
      // inspect message
      return message;
    }
    ```
    Filter functions that wants to drop a message can simply return null:
    ```
    static GDBusMessage *
    drop_filter (GDBusConnection *connection
                 GDBusMessage    *message,
                 gboolean         incoming,
                 gpointer         user_data)
    {
      if (should_drop_message)
        {
          g_object_unref (message);
          message = NULL;
        }
      return message;
    }
    ```
    Finally, a filter function may modify a message by copying it:
    ```
    static GDBusMessage *
    modifying_filter (GDBusConnection *connection
                      GDBusMessage    *message,
                      gboolean         incoming,
                      gpointer         user_data)
    {
      GDBusMessage *copy;
      GError *error;
    
      error = NULL;
      copy = g_dbus_message_copy (message, &error);
      // handle error being set
      g_object_unref (message);
    
      // modify copy
    
      return copy;
    }
    ```
    If the returned #GDBusMessage is different from message and cannot
    be sent on connection (it could use features, such as file
    descriptors, not compatible with connection), then a warning is
    logged to standard error. Applications can
    check this ahead of time using [gio.dbus_message.DBusMessage.toBlob] passing a
    #GDBusCapabilityFlags value obtained from connection.

    Params:
      connection = A #GDBusConnection.
      message = A locked #GDBusMessage that the filter function takes ownership of.
      incoming = true if it is a message received from the other peer, false if it is
        a message to be sent to the other peer.
    Returns: A #GDBusMessage that will be freed with
      [gobject.object.ObjectWrap.unref] or null to drop the message. Passive filter
      functions can simply return the passed message object.
*/
alias DBusMessageFilterFunction = gio.dbus_message.DBusMessage delegate(gio.dbus_connection.DBusConnection connection, gio.dbus_message.DBusMessage message, bool incoming);

/**
    Function signature for a function used to determine the #GType to
    use for an interface proxy (if interface_name is not null) or
    object proxy (if interface_name is null).
    
    This function is called in the
    [thread-default main loop][g-main-context-push-thread-default]
    that manager was constructed in.

    Params:
      manager = A #GDBusObjectManagerClient.
      objectPath = The object path of the remote object.
      interfaceName = The interface name of the remote object or null if a #GDBusObjectProxy #GType is requested.
    Returns: A #GType to use for the remote object. The returned type
        must be a #GDBusProxy or #GDBusObjectProxy -derived
        type.
*/
alias DBusProxyTypeFunc = gobject.types.GType delegate(gio.dbus_object_manager_client.DBusObjectManagerClient manager, string objectPath, string interfaceName);

/**
    Signature for callback function used in [gio.dbus_connection.DBusConnection.signalSubscribe].

    Params:
      connection = A #GDBusConnection.
      senderName = The unique bus name of the sender of the signal,
           or null on a peer-to-peer D-Bus connection.
      objectPath = The object path that the signal was emitted on.
      interfaceName = The name of the interface.
      signalName = The name of the signal.
      parameters = A #GVariant tuple with parameters for the signal.
*/
alias DBusSignalCallback = void delegate(gio.dbus_connection.DBusConnection connection, string senderName, string objectPath, string interfaceName, string signalName, glib.variant.Variant parameters);

/**
    The type of the dispatch function in #GDBusSubtreeVTable.
    
    Subtrees are flat.  node, if non-null, is always exactly one
    segment of the object path (ie: it never contains a slash).

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
      interfaceName = The D-Bus interface name that the method call or property access is for.
      node = A node that is a child of object_path (relative to object_path) or null for the root of the subtree.
      outUserData = Return location for user data to pass to functions in the returned #GDBusInterfaceVTable.
    Returns: A #GDBusInterfaceVTable or null if you don't want to handle the methods.
*/
alias DBusSubtreeDispatchFunc = gio.types.DBusInterfaceVTable delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string node, out void* outUserData);

/**
    The type of the enumerate function in #GDBusSubtreeVTable.
    
    This function is called when generating introspection data and also
    when preparing to dispatch incoming messages in the event that the
    [gio.types.DBusSubtreeFlags.DispatchToUnenumeratedNodes] flag is not
    specified (ie: to verify that the object path is valid).
    
    Hierarchies are not supported; the items that you return should not
    contain the `/` character.
    
    The return value will be freed with [glib.global.strfreev].

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
    Returns: A newly allocated array of strings for node names that are children of object_path.
*/
alias DBusSubtreeEnumerateFunc = string[] delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath);

/**
    The type of the introspect function in #GDBusSubtreeVTable.
    
    Subtrees are flat.  node, if non-null, is always exactly one
    segment of the object path (ie: it never contains a slash).
    
    This function should return null to indicate that there is no object
    at this node.
    
    If this function returns non-null, the return value is expected to
    be a null-terminated array of pointers to #GDBusInterfaceInfo
    structures describing the interfaces implemented by node.  This
    array will have [gio.dbus_interface_info.DBusInterfaceInfo.unref] called on each item
    before being freed with [glib.global.gfree].
    
    The difference between returning null and an array containing zero
    items is that the standard DBus interfaces will returned to the
    remote introspector in the empty array case, but not in the null
    case.

    Params:
      connection = A #GDBusConnection.
      sender = The unique bus name of the remote caller.
      objectPath = The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
      node = A node that is a child of object_path (relative to object_path) or null for the root of the subtree.
    Returns: A null-terminated array of pointers to #GDBusInterfaceInfo, or null.
*/
alias DBusSubtreeIntrospectFunc = gio.dbus_interface_info.DBusInterfaceInfo[] delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string node);

/**
    This is the function type of the callback used for the #GSource
    returned by [gio.datagram_based.DatagramBased.createSource].

    Params:
      datagramBased = the #GDatagramBased
      condition = the current condition at the source fired
    Returns: [glib.types.SOURCE_REMOVE] if the source should be removed,
        [glib.types.SOURCE_CONTINUE] otherwise
*/
alias DatagramBasedSourceFunc = bool delegate(gio.datagram_based.DatagramBased datagramBased, glib.types.IOCondition condition);

/**
    During invocation, [gio.desktop_app_info.DesktopAppInfo.launchUrisAsManager] may
    create one or more child processes.  This callback is invoked once
    for each, providing the process ID.

    Params:
      appinfo = a #GDesktopAppInfo
      pid = Process identifier
*/
alias DesktopAppLaunchCallback = void delegate(gio.desktop_app_info.DesktopAppInfo appinfo, glib.types.Pid pid);

/**
    This callback type is used by [gio.file.File.measureDiskUsage] to make
    periodic progress reports when measuring the amount of disk spaced
    used by a directory.
    
    These calls are made on a best-effort basis and not all types of
    #GFile will support them.  At the minimum, however, one call will
    always be made immediately.
    
    In the case that there is no support, reporting will be set to
    false (and the other values undefined) and no further calls will be
    made.  Otherwise, the reporting will be true and the other values
    all-zeros during the first (immediate) call.  In this way, you can
    know which type of progress UI to show without a delay.
    
    For [gio.file.File.measureDiskUsage] the callback is made directly.  For
    [gio.file.File.measureDiskUsageAsync] the callback is made via the
    default main context of the calling thread (ie: the same way that the
    final async result would be reported).
    
    current_size is in the same units as requested by the operation (see
    [gio.types.FileMeasureFlags.ApparentSize]).
    
    The frequency of the updates is implementation defined, but is
    ideally about once every 200ms.
    
    The last progress callback may or may not be equal to the final
    result.  Always check the async result to get the final value.

    Params:
      reporting = true if more reports will come
      currentSize = the current cumulative size measurement
      numDirs = the number of directories visited so far
      numFiles = the number of non-directory files encountered
*/
alias FileMeasureProgressCallback = void delegate(bool reporting, ulong currentSize, ulong numDirs, ulong numFiles);

/**
    When doing file operations that may take a while, such as moving
    a file or copying a file, a progress callback is used to pass how
    far along that operation is to the application.

    Params:
      currentNumBytes = the current number of bytes in the operation.
      totalNumBytes = the total number of bytes in the operation.
*/
alias FileProgressCallback = void delegate(long currentNumBytes, long totalNumBytes);

/**
    When loading the partial contents of a file with [gio.file.File.loadPartialContentsAsync],
    it may become necessary to determine if any more data from the file should be loaded.
    A #GFileReadMoreCallback function facilitates this by returning true if more data
    should be read, or false otherwise.

    Params:
      fileContents = the data as currently read.
      fileSize = the size of the data currently read.
    Returns: true if more data should be read back. false otherwise.
*/
alias FileReadMoreCallback = bool delegate(string fileContents, long fileSize);

/**
    I/O Job function.
    
    Long-running jobs should periodically check the cancellable
    to see if they have been cancelled.

    Params:
      job = a #GIOSchedulerJob.
      cancellable = optional #GCancellable object, null to ignore.
    Returns: true if this function should be called again to
         complete the job, false if the job is complete (or cancelled)

    Deprecated: Use [glib.thread_pool.ThreadPool] or
        [gio.task.Task.runInThread]
*/
alias IOSchedulerJobFunc = bool delegate(gio.ioscheduler_job.IOSchedulerJob job, gio.cancellable.Cancellable cancellable);

/**
    This is the function type of the callback used for the #GSource
    returned by [gio.pollable_input_stream.PollableInputStream.createSource] and
    [gio.pollable_output_stream.PollableOutputStream.createSource].

    Params:
      pollableStream = the #GPollableInputStream or #GPollableOutputStream
    Returns: it should return false if the source should be removed.
*/
alias PollableSourceFunc = bool delegate(gobject.object.ObjectWrap pollableStream);

/**
    Changes the size of the memory block pointed to by data to
    size bytes.
    
    The function should have the same semantics as realloc().

    Params:
      size = size to reallocate data to
    Returns: a pointer to the reallocated memory
*/
alias ReallocFunc = void* delegate(size_t size);

/**
    The type for the function that is used to convert from #GSettings to
    an object property. The value is already initialized to hold values
    of the appropriate type.

    Params:
      value = return location for the property value
      variant = the #GVariant
    Returns: true if the conversion succeeded, false in case of an error
*/
alias SettingsBindGetMapping = bool delegate(gobject.value.Value value, glib.variant.Variant variant);

/**
    The type for the function that is used to convert an object property
    value to a #GVariant for storing it in #GSettings.

    Params:
      value = a #GValue containing the property value to map
      expectedType = the #GVariantType to create
    Returns: a new #GVariant holding the data from value,
          or null in case of an error
*/
alias SettingsBindSetMapping = glib.variant.Variant delegate(gobject.value.Value value, glib.variant_type.VariantType expectedType);

/**
    The type of the function that is used to convert from a value stored
    in a #GSettings to a value that is useful to the application.
    
    If the value is successfully mapped, the result should be stored at
    result and true returned.  If mapping fails (for example, if value
    is not in the right format) then false should be returned.
    
    If value is null then it means that the mapping function is being
    given a "last chance" to successfully return a valid value.  true
    must be returned in this case.

    Params:
      value = the #GVariant to map, or null
      result = the result of the mapping
    Returns: true if the conversion succeeded, false in case of an error
*/
alias SettingsGetMapping = bool delegate(glib.variant.Variant value, out void* result);

/**
    Simple thread function that runs an asynchronous operation and
    checks for cancellation.

    Params:
      res = a #GSimpleAsyncResult.
      object = a #GObject.
      cancellable = optional #GCancellable object, null to ignore.
*/
alias SimpleAsyncThreadFunc = void delegate(gio.simple_async_result.SimpleAsyncResult res, gobject.object.ObjectWrap object, gio.cancellable.Cancellable cancellable);

/**
    This is the function type of the callback used for the #GSource
    returned by [gio.socket.Socket.createSource].

    Params:
      socket = the #GSocket
      condition = the current condition at the source fired.
    Returns: it should return false if the source should be removed.
*/
alias SocketSourceFunc = bool delegate(gio.socket.Socket socket, glib.types.IOCondition condition);

/**
    The prototype for a task function to be run in a thread via
    [gio.task.Task.runInThread] or [gio.task.Task.runInThreadSync].
    
    If the return-on-cancel flag is set on task, and cancellable gets
    cancelled, then the #GTask will be completed immediately (as though
    [gio.task.Task.returnErrorIfCancelled] had been called), without
    waiting for the task function to complete. However, the task
    function will continue running in its thread in the background. The
    function therefore needs to be careful about how it uses
    externally-visible state in this case. See
    [gio.task.Task.setReturnOnCancel] for more details.
    
    Other than in that case, task will be completed when the
    #GTaskThreadFunc returns, not when it calls a
    `g_task_return_` function.

    Params:
      task = the #GTask
      sourceObject = task's source object
      cancellable = task's #GCancellable, or null
*/
alias TaskThreadFunc = void delegate(gio.task.Task task, gobject.object.ObjectWrap sourceObject, gio.cancellable.Cancellable cancellable);

/**
    This function type is used by [gio.vfs.Vfs.registerUriScheme] to make it
    possible for a client to associate an URI scheme to a different #GFile
    implementation.
    
    The client should return a reference to the new file that has been
    created for uri, or null to continue with the default implementation.

    Params:
      vfs = a #GVfs
      identifier = the identifier to look up a #GFile for. This can either
            be an URI or a parse name as returned by [gio.file.File.getParseName]
    Returns: a #GFile for identifier.
*/
alias VfsFileLookupFunc = gio.file.File delegate(gio.vfs.Vfs vfs, string identifier);

/**
    The value returned by handlers of the signals generated by
    the `gdbus-codegen` tool to indicate that a method call has been
    handled by an implementation. It is equal to true, but using
    this macro is sometimes more readable.
    
    In code that needs to be backwards-compatible with older GLib,
    use true instead, often written like this:
    
    ```
      g_dbus_method_invocation_return_error (invocation, ...);
      return TRUE;    // handled
    ```
*/
enum DBUS_METHOD_INVOCATION_HANDLED = true;

/**
    The value returned by handlers of the signals generated by
    the `gdbus-codegen` tool to indicate that a method call has not been
    handled by an implementation. It is equal to false, but using
    this macro is sometimes more readable.
    
    In code that needs to be backwards-compatible with older GLib,
    use false instead.
*/
enum DBUS_METHOD_INVOCATION_UNHANDLED = false;

/**
    Extension point for debug control functionality.
    See [Extending GIO][extending-gio].
*/
enum DEBUG_CONTROLLER_EXTENSION_POINT_NAME = "gio-debug-controller";

/**
    Extension point for default handler to URI association. See
    [Extending GIO][extending-gio].

    Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
         unused by GIO.
*/
enum DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup";

/**
    The string used to obtain a Unix device path with [gio.drive.Drive.getIdentifier].
*/
enum DRIVE_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";

/**
    A key in the "access" namespace for checking deletion privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to delete the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_DELETE = "access::can-delete";

/**
    A key in the "access" namespace for getting execution privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to execute the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = "access::can-execute";

/**
    A key in the "access" namespace for getting read privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to read the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_READ = "access::can-read";

/**
    A key in the "access" namespace for checking renaming privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to rename the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_RENAME = "access::can-rename";

/**
    A key in the "access" namespace for checking trashing privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to move the file to
    the trash.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_TRASH = "access::can-trash";

/**
    A key in the "access" namespace for getting write privileges.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
    
    This attribute will be true if the user is able to write to the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_WRITE = "access::can-write";

/**
    A key in the "dos" namespace for checking if the file's archive flag
    is set.
    
    This attribute is true if the archive flag is set.
    
    This attribute is only available for DOS file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_ARCHIVE = "dos::is-archive";

/**
    A key in the "dos" namespace for checking if the file is a NTFS mount point
    (a volume mount or a junction point).
    
    This attribute is true if file is a reparse point of type
    [IO_REPARSE_TAG_MOUNT_POINT](https://msdn.microsoft.com/en-us/library/dd541667.aspx).
    
    This attribute is only available for DOS file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = "dos::is-mountpoint";

/**
    A key in the "dos" namespace for checking if the file's backup flag
    is set.
    
    This attribute is true if the backup flag is set.
    
    This attribute is only available for DOS file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_SYSTEM = "dos::is-system";

/**
    A key in the "dos" namespace for getting the file NTFS reparse tag.
    
    This value is 0 for files that are not reparse points.
    
    See the [Reparse Tags](https://msdn.microsoft.com/en-us/library/dd541667.aspx)
    page for possible reparse tag values.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = "dos::reparse-point-tag";

/**
    A key in the "etag" namespace for getting the value of the file's
    entity tag.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_ETAG_VALUE = "etag::value";

/**
    A key in the "filesystem" namespace for getting the number of bytes
    of free space left on the file system.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_FREE = "filesystem::free";

/**
    A key in the "filesystem" namespace for checking if the file system
    is read only.
    
    Is set to true if the file system is read only.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_READONLY = "filesystem::readonly";

/**
    A key in the "filesystem" namespace for checking if the file system
    is remote.
    
    Is set to true if the file system is remote.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_REMOTE = "filesystem::remote";

/**
    A key in the "filesystem" namespace for getting the total size (in
    bytes) of the file system, used in [gio.file.File.queryFilesystemInfo].
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size";

/**
    A key in the "filesystem" namespace for getting the file system's type.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type";

/**
    A key in the "filesystem" namespace for getting the number of bytes
    used by data on the file system.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_USED = "filesystem::used";

/**
    A key in the "filesystem" namespace for hinting a file manager
    application whether it should preview (e.g. thumbnail) files on the
    file system.
    
    The value for this key contain a #GFilesystemPreviewType.
*/
enum FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = "filesystem::use-preview";

/**
    A key in the "gvfs" namespace that gets the name of the current
    GVFS backend in use.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_GVFS_BACKEND = "gvfs::backend";

/**
    A key in the "id" namespace for getting a file identifier.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
    
    An example use would be during listing files, to avoid recursive
    directory scanning.
*/
enum FILE_ATTRIBUTE_ID_FILE = "id::file";

/**
    A key in the "id" namespace for getting the file system identifier.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
    
    An example use would be during drag and drop to see if the source
    and target are on the same filesystem (default to move) or not (default
    to copy).
*/
enum FILE_ATTRIBUTE_ID_FILESYSTEM = "id::filesystem";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) can be ejected.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = "mountable::can-eject";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) is mountable.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = "mountable::can-mount";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) can be polled.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = "mountable::can-poll";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) can be started.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_START = "mountable::can-start";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) can be started degraded.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = "mountable::can-start-degraded";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) can be stopped.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = "mountable::can-stop";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE)  is unmountable.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = "mountable::can-unmount";

/**
    A key in the "mountable" namespace for getting the HAL UDI for the mountable
    file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = "mountable::hal-udi";

/**
    A key in the "mountable" namespace for checking if a file (of
    type G_FILE_TYPE_MOUNTABLE) is automatically polled for media.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic";

/**
    A key in the "mountable" namespace for getting the #GDriveStartStopType.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = "mountable::start-stop-type";

/**
    A key in the "mountable" namespace for getting the unix device.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = "mountable::unix-device";

/**
    A key in the "mountable" namespace for getting the unix device file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = "mountable::unix-device-file";

/**
    A key in the "owner" namespace for getting the file owner's group.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_GROUP = "owner::group";

/**
    A key in the "owner" namespace for getting the user name of the
    file's owner.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_USER = "owner::user";

/**
    A key in the "owner" namespace for getting the real name of the
    user that owns the file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_USER_REAL = "owner::user-real";

/**
    A key in the "preview" namespace for getting a #GIcon that can be
    used to get preview of the file.
    
    For example, it may be a low resolution thumbnail without metadata.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
    
    The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_PREVIEW_ICON = "preview::icon";

/**
    A key in the "recent" namespace for getting time, when the metadata for the
    file in `recent:///` was last changed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Int64].
*/
enum FILE_ATTRIBUTE_RECENT_MODIFIED = "recent::modified";

/**
    A key in the "selinux" namespace for getting the file's SELinux
    context.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
    
    Note that this attribute is only available if GLib has been built
    with SELinux support.
*/
enum FILE_ATTRIBUTE_SELINUX_CONTEXT = "selinux::context";

/**
    A key in the "standard" namespace for getting the amount of disk space
    that is consumed by the file (in bytes).
    
    This will generally be larger than the file size (due to block size
    overhead) but can occasionally be smaller (for example, for sparse files).
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = "standard::allocated-size";

/**
    A key in the "standard" namespace for getting the content type of the file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
    
    The value for this key should contain a valid content type.
*/
enum FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = "standard::content-type";

/**
    A key in the "standard" namespace for getting the copy name of the file.
    
    The copy name is an optional version of the name. If available it's always
    in UTF8, and corresponds directly to the original filename (only transcoded to
    UTF8). This is useful if you want to copy the file to another filesystem that
    might have a different encoding. If the filename is not a valid string in the
    encoding selected for the filesystem it is in then the copy name will not be set.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_COPY_NAME = "standard::copy-name";

/**
    A key in the "standard" namespace for getting the description of the file.
    
    The description is a utf8 string that describes the file, generally containing
    the filename, but can also contain further information. Example descriptions
    could be "filename (on hostname)" for a remote file or "filename (in trash)"
    for a file in the trash. This is useful for instance as the window title
    when displaying a directory or for a bookmarks menu.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_DESCRIPTION = "standard::description";

/**
    A key in the "standard" namespace for getting the display name of the file.
    
    A display name is guaranteed to be in UTF-8 and can thus be displayed in
    the UI. It is guaranteed to be set on every file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = "standard::display-name";

/**
    A key in the "standard" namespace for edit name of the file.
    
    An edit name is similar to the display name, but it is meant to be
    used when you want to rename the file in the UI. The display name
    might contain information you don't want in the new filename (such as
    "(invalid unicode)" if the filename was in an invalid encoding).
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_EDIT_NAME = "standard::edit-name";

/**
    A key in the "standard" namespace for getting the fast content type.
    
    The fast content type isn't as reliable as the regular one, as it
    only uses the filename to guess it, but it is faster to calculate than the
    regular content type.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = "standard::fast-content-type";

/**
    A key in the "standard" namespace for getting the icon for the file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
    
    The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_STANDARD_ICON = "standard::icon";

/**
    A key in the "standard" namespace for checking if a file is a backup file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_BACKUP = "standard::is-backup";

/**
    A key in the "standard" namespace for checking if a file is hidden.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = "standard::is-hidden";

/**
    A key in the "standard" namespace for checking if the file is a symlink.
    Typically the actual type is something else, if we followed the symlink
    to get the type.
    
    On Windows NTFS mountpoints are considered to be symlinks as well.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = "standard::is-symlink";

/**
    A key in the "standard" namespace for checking if a file is virtual.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = "standard::is-virtual";

/**
    A key in the "standard" namespace for checking if a file is
    volatile. This is meant for opaque, non-POSIX-like backends to
    indicate that the URI is not persistent. Applications should look
    at [gio.types.FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET] for the persistent URI.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = "standard::is-volatile";

/**
    A key in the "standard" namespace for getting the name of the file.
    
    The name is the on-disk filename which may not be in any known encoding,
    and can thus not be generally displayed as is. It is guaranteed to be set on
    every file.
    
    Use [gio.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] if you need to display the
    name in a user interface.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_STANDARD_NAME = "standard::name";

/**
    A key in the "standard" namespace for getting the file's size (in bytes).
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size";

/**
    A key in the "standard" namespace for setting the sort order of a file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Int32].
    
    An example use would be in file managers, which would use this key
    to set the order files are displayed. Files with smaller sort order
    should be sorted first, and files without sort order as if sort order
    was zero.
*/
enum FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order";

/**
    A key in the "standard" namespace for getting the symbolic icon for the file.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
    
    The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = "standard::symbolic-icon";

/**
    A key in the "standard" namespace for getting the symlink target, if the file
    is a symlink.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target";

/**
    A key in the "standard" namespace for getting the target URI for the file, in
    the case of [gio.types.FileType.Shortcut] or [gio.types.FileType.Mountable] files.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri";

/**
    A key in the "standard" namespace for storing file types.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
    
    The value for this key should contain a #GFileType.
*/
enum FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed.
    
    This attribute is true if thumbnailing failed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
    for the large image.
    
    This attribute is true if thumbnailing failed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE = "thumbnail::failed-large";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
    for the normal image.
    
    This attribute is true if thumbnailing failed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL = "thumbnail::failed-normal";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
    for the x-large image.
    
    This attribute is true if thumbnailing failed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE = "thumbnail::failed-xlarge";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
    for the xx-large image.
    
    This attribute is true if thumbnailing failed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE = "thumbnail::failed-xxlarge";

/**
    A key in the "thumbnail" namespace for checking whether the thumbnail is outdated.
    
    This attribute is true if the thumbnail is up-to-date with the file it represents,
    and false if the file has been modified since the thumbnail was generated.
    
    If [gio.types.FILE_ATTRIBUTE_THUMBNAILING_FAILED] is true and this attribute is false,
    it indicates that thumbnailing may be attempted again and may succeed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = "thumbnail::is-valid";

/**
    A key in the "thumbnail" namespace for checking whether the large
    thumbnail is outdated.
    
    This attribute is true if the large thumbnail is up-to-date with the file
    it represents, and false if the file has been modified since the thumbnail
    was generated.
    
    If [gio.types.FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE] is true and this attribute
    is false, it indicates that thumbnailing may be attempted again and may
    succeed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE = "thumbnail::is-valid-large";

/**
    A key in the "thumbnail" namespace for checking whether the normal
    thumbnail is outdated.
    
    This attribute is true if the normal thumbnail is up-to-date with the file
    it represents, and false if the file has been modified since the thumbnail
    was generated.
    
    If [gio.types.FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL] is true and this attribute
    is false, it indicates that thumbnailing may be attempted again and may
    succeed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL = "thumbnail::is-valid-normal";

/**
    A key in the "thumbnail" namespace for checking whether the x-large
    thumbnail is outdated.
    
    This attribute is true if the x-large thumbnail is up-to-date with the file
    it represents, and false if the file has been modified since the thumbnail
    was generated.
    
    If [gio.types.FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE] is true and this attribute
    is false, it indicates that thumbnailing may be attempted again and may
    succeed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE = "thumbnail::is-valid-xlarge";

/**
    A key in the "thumbnail" namespace for checking whether the xx-large
    thumbnail is outdated.
    
    This attribute is true if the x-large thumbnail is up-to-date with the file
    it represents, and false if the file has been modified since the thumbnail
    was generated.
    
    If [gio.types.FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE] is true and this attribute
    is false, it indicates that thumbnailing may be attempted again and may
    succeed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE = "thumbnail::is-valid-xxlarge";

/**
    A key in the "thumbnail" namespace for getting the path to the thumbnail
    image with the biggest size available.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH = "thumbnail::path";

/**
    A key in the "thumbnail" namespace for getting the path to the large
    thumbnail image.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE = "thumbnail::path-large";

/**
    A key in the "thumbnail" namespace for getting the path to the normal
    thumbnail image.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL = "thumbnail::path-normal";

/**
    A key in the "thumbnail" namespace for getting the path to the x-large
    thumbnail image.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE = "thumbnail::path-xlarge";

/**
    A key in the "thumbnail" namespace for getting the path to the xx-large
    thumbnail image.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE = "thumbnail::path-xxlarge";

/**
    A key in the "time" namespace for getting the time the file was last
    accessed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64], and
    contains the time since the file was last accessed, in seconds since the
    UNIX epoch.
*/
enum FILE_ATTRIBUTE_TIME_ACCESS = "time::access";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
    the file was last accessed. This should be used in conjunction with
    #G_FILE_ATTRIBUTE_TIME_ACCESS. Corresponding #GFileAttributeType is
    [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_ACCESS_NSEC = "time::access-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
    the file was last accessed.
    
    This should be used in conjunction with [gio.types.FILE_ATTRIBUTE_TIME_ACCESS].
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_ACCESS_USEC = "time::access-usec";

/**
    A key in the "time" namespace for getting the time the file was last
    changed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64],
    and contains the time since the file was last changed, in seconds since
    the UNIX epoch.
    
    This corresponds to the traditional UNIX ctime.
*/
enum FILE_ATTRIBUTE_TIME_CHANGED = "time::changed";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
    the file was last changed. This should be used in conjunction with
    #G_FILE_ATTRIBUTE_TIME_CHANGED. Corresponding #GFileAttributeType is
    [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CHANGED_NSEC = "time::changed-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
    the file was last changed.
    
    This should be used in conjunction with [gio.types.FILE_ATTRIBUTE_TIME_CHANGED].
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CHANGED_USEC = "time::changed-usec";

/**
    A key in the "time" namespace for getting the time the file was created.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64],
    and contains the time since the file was created, in seconds since the UNIX
    epoch.
    
    This may correspond to Linux `stx_btime`, FreeBSD `st_birthtim`, NetBSD
    `st_birthtime` or NTFS `ctime`.
*/
enum FILE_ATTRIBUTE_TIME_CREATED = "time::created";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
    the file was created. This should be used in conjunction with
    #G_FILE_ATTRIBUTE_TIME_CREATED. Corresponding #GFileAttributeType is
    [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CREATED_NSEC = "time::created-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
    the file was created.
    
    This should be used in conjunction with [gio.types.FILE_ATTRIBUTE_TIME_CREATED].
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CREATED_USEC = "time::created-usec";

/**
    A key in the "time" namespace for getting the time the file was last
    modified.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64], and
    contains the time since the file was modified, in seconds since the UNIX
    epoch.
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED = "time::modified";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
    the file was last modified. This should be used in conjunction with
    #G_FILE_ATTRIBUTE_TIME_MODIFIED. Corresponding #GFileAttributeType is
    [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED_NSEC = "time::modified-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
    the file was last modified.
    
    This should be used in conjunction with [gio.types.FILE_ATTRIBUTE_TIME_MODIFIED].
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED_USEC = "time::modified-usec";

/**
    A key in the "trash" namespace for getting the deletion date and time
    of a file inside the `trash:///` folder.
    
    The format of the returned string is `YYYY-MM-DDThh:mm:ss`.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_TRASH_DELETION_DATE = "trash::deletion-date";

/**
    A key in the "trash" namespace for getting the number of (toplevel) items
    that are present in the `trash:///` folder.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TRASH_ITEM_COUNT = "trash::item-count";

/**
    A key in the "trash" namespace for getting the original path of a file
    inside the `trash:///` folder before it was trashed.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_TRASH_ORIG_PATH = "trash::orig-path";

/**
    A key in the "unix" namespace for getting the number of blocks allocated
    for the file.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_UNIX_BLOCKS = "unix::blocks";

/**
    A key in the "unix" namespace for getting the block size for the file
    system.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = "unix::block-size";

/**
    A key in the "unix" namespace for getting the device id of the device the
    file is located on (see stat() documentation).
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_DEVICE = "unix::device";

/**
    A key in the "unix" namespace for getting the group ID for the file.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_GID = "unix::gid";

/**
    A key in the "unix" namespace for getting the inode of the file.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_UNIX_INODE = "unix::inode";

/**
    A key in the "unix" namespace for checking if the file represents a
    UNIX mount point.
    
    This attribute is true if the file is a UNIX mount point.
    
    Since 2.58, `/` is considered to be a mount point.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = "unix::is-mountpoint";

/**
    A key in the "unix" namespace for getting the mode of the file
    (e.g. whether the file is a regular file, symlink, etc).
    
    See the documentation for `lstat()`: this attribute is equivalent to
    the `st_mode` member of `struct stat`, and includes both the file type
    and permissions.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_MODE = "unix::mode";

/**
    A key in the "unix" namespace for getting the number of hard links
    for a file.
    
    See the documentation for `lstat()`.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_NLINK = "unix::nlink";

/**
    A key in the "unix" namespace for getting the device ID for the file
    (if it is a special file).
    
    See the documentation for `lstat()`.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_RDEV = "unix::rdev";

/**
    A key in the "unix" namespace for getting the user ID for the file.
    
    This attribute is only available for UNIX file systems.
    
    Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_UID = "unix::uid";

/**
    Extension point for memory usage monitoring functionality.
    See [Extending GIO][extending-gio].
*/
enum MEMORY_MONITOR_EXTENSION_POINT_NAME = "gio-memory-monitor";

/**
    The menu item attribute which holds the action name of the item.  Action
    names are namespaced with an identifier for the action group in which the
    action resides. For example, "win." for window-specific actions and "app."
    for application-wide actions.
    
    See also [gio.menu_model.MenuModel.getItemAttribute] and [gio.menu_item.MenuItem.setAttribute].
*/
enum MENU_ATTRIBUTE_ACTION = "action";

/**
    The menu item attribute that holds the namespace for all action names in
    menus that are linked from this item.
*/
enum MENU_ATTRIBUTE_ACTION_NAMESPACE = "action-namespace";

/**
    The menu item attribute which holds the icon of the item.
    
    The icon is stored in the format returned by [gio.icon.Icon.serialize].
    
    This attribute is intended only to represent 'noun' icons such as
    favicons for a webpage, or application icons.  It should not be used
    for 'verbs' (ie: stock icons).
*/
enum MENU_ATTRIBUTE_ICON = "icon";

/**
    The menu item attribute which holds the label of the item.
*/
enum MENU_ATTRIBUTE_LABEL = "label";

/**
    The menu item attribute which holds the target with which the item's action
    will be activated.
    
    See also [gio.menu_item.MenuItem.setActionAndTarget]
*/
enum MENU_ATTRIBUTE_TARGET = "target";

/**
    The maximum number of entries in a menu section supported by
    [gio.dbus_connection.DBusConnection.exportMenuModel].
    
    The exact value of the limit may change in future GLib versions.
*/
enum MENU_EXPORTER_MAX_SECTION_SIZE = 1000;

/**
    The name of the link that associates a menu item with a section.  The linked
    menu will usually be shown in place of the menu item, using the item's label
    as a header.
    
    See also [gio.menu_item.MenuItem.setLink].
*/
enum MENU_LINK_SECTION = "section";

/**
    The name of the link that associates a menu item with a submenu.
    
    See also [gio.menu_item.MenuItem.setLink].
*/
enum MENU_LINK_SUBMENU = "submenu";

/** */
enum NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor";

/**
    Extension point for network status monitoring functionality.
    See [Extending GIO][extending-gio].
*/
enum NETWORK_MONITOR_EXTENSION_POINT_NAME = "gio-network-monitor";

/**
    Extension point for power profile usage monitoring functionality.
    See [Extending GIO][extending-gio].
*/
enum POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = "gio-power-profile-monitor";

/**
    Extension point for proxy functionality.
    See [Extending GIO][extending-gio].
*/
enum PROXY_EXTENSION_POINT_NAME = "gio-proxy";

/**
    Extension point for proxy resolving functionality.
    See [Extending GIO][extending-gio].
*/
enum PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver";

/**
    Extension point for #GSettingsBackend functionality.
*/
enum SETTINGS_BACKEND_EXTENSION_POINT_NAME = "gsettings-backend";

/**
    Extension point for TLS functionality via #GTlsBackend.
    See [Extending GIO][extending-gio].
*/
enum TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend";

/**
    The purpose used to verify the client certificate in a TLS connection.
    Used by TLS servers.
*/
enum TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2";

/**
    The purpose used to verify the server certificate in a TLS connection. This
    is the most common purpose in use. Used by TLS clients.
*/
enum TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1";

/**
    Extension point for #GVfs functionality.
    See [Extending GIO][extending-gio].
*/
enum VFS_EXTENSION_POINT_NAME = "gio-vfs";

/**
    The string used to obtain the volume class with [gio.volume.Volume.getIdentifier].
    
    Known volume classes include `device`, `network`, and `loop`. Other
    classes may be added in the future.
    
    This is intended to be used by applications to classify #GVolume
    instances into different sections - for example a file manager or
    file chooser can use this information to show `network` volumes under
    a "Network" heading and `device` volumes under a "Devices" heading.
*/
enum VOLUME_IDENTIFIER_KIND_CLASS = "class";

/**
    The string used to obtain a Hal UDI with [gio.volume.Volume.getIdentifier].

    Deprecated: Do not use, HAL is deprecated.
*/
enum VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi";

/**
    The string used to obtain a filesystem label with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_LABEL = "label";

/**
    The string used to obtain a NFS mount with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount";

/**
    The string used to obtain a Unix device path with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";

/**
    The string used to obtain a UUID with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_UUID = "uuid";

/**
    Extension point for volume monitor functionality.
    See [Extending GIO][extending-gio].
*/
enum VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor";
