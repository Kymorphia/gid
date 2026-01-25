/// C types for gio2 library
module gio.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;

/**
    Flags used when creating a #GAppInfo.
*/
enum GAppInfoCreateFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Application opens in a terminal window.
  */
  NeedsTerminal = 1,

  /**
      Application supports URI arguments.
  */
  SupportsUris = 2,

  /**
      Application supports startup notification. Since 2.26
  */
  SupportsStartupNotification = 4,
}

/**
    Flags used to define the behaviour of a #GApplication.
*/
enum GApplicationFlags : uint
{
  /**
      Default. Deprecated in 2.74, use
        [gio.types.ApplicationFlags.DefaultFlags] instead
  */
  FlagsNone = 0,

  /**
      Default flags. Since: 2.74
  */
  DefaultFlags = 0,

  /**
      Run as a service. In this mode, registration
           fails if the service is already running, and the application
           will initially wait up to 10 seconds for an initial activation
           message to arrive.
  */
  IsService = 1,

  /**
      Don't try to become the primary instance.
  */
  IsLauncher = 2,

  /**
      This application handles opening files (in
          the primary instance). Note that this flag only affects the default
          implementation of local_command_line(), and has no effect if
          [gio.types.ApplicationFlags.HandlesCommandLine] is given.
          See [gio.application.Application.run] for details.
  */
  HandlesOpen = 4,

  /**
      This application handles command line
          arguments (in the primary instance). Note that this flag only affect
          the default implementation of local_command_line().
          See [gio.application.Application.run] for details.
  */
  HandlesCommandLine = 8,

  /**
      Send the environment of the
          launching process to the primary instance. Set this flag if your
          application is expected to behave differently depending on certain
          environment variables. For instance, an editor might be expected
          to use the `GIT_COMMITTER_NAME` environment variable
          when editing a git commit message. The environment is available
          to the #GApplication::command-line signal handler, via
          [gio.application_command_line.ApplicationCommandLine.getenv].
  */
  SendEnvironment = 16,

  /**
      Make no attempts to do any of the typical
          single-instance application negotiation, even if the application
          ID is given.  The application neither attempts to become the
          owner of the application ID nor does it check if an existing
          owner already exists.  Everything occurs in the local process.
          Since: 2.30.
  */
  NonUnique = 32,

  /**
      Allow users to override the
          application ID from the command line with `--gapplication-app-id`.
          Since: 2.48
  */
  CanOverrideAppId = 64,

  /**
      Allow another instance to take over
          the bus name. Since: 2.60
  */
  AllowReplacement = 128,

  /**
      Take over from another instance. This flag is
          usually set by passing `--gapplication-replace` on the commandline.
          Since: 2.60
  */
  Replace = 256,
}

/**
    #GAskPasswordFlags are used to request specific information from the
    user, or to notify the user of their choices in an authentication
    situation.
*/
enum GAskPasswordFlags : uint
{
  /**
      operation requires a password.
  */
  NeedPassword = 1,

  /**
      operation requires a username.
  */
  NeedUsername = 2,

  /**
      operation requires a domain.
  */
  NeedDomain = 4,

  /**
      operation supports saving settings.
  */
  SavingSupported = 8,

  /**
      operation supports anonymous users.
  */
  AnonymousSupported = 16,

  /**
      operation takes TCRYPT parameters (Since: 2.58)
  */
  Tcrypt = 32,
}

/**
    Flags used in [gio.global.busOwnName].
*/
enum GBusNameOwnerFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Allow another message bus connection to claim the name.
  */
  AllowReplacement = 1,

  /**
      If another message bus connection owns the name and have
      specified [gio.types.BusNameOwnerFlags.AllowReplacement], then take the name from the other connection.
  */
  Replace = 2,

  /**
      If another message bus connection owns the name, immediately
      return an error from [gio.global.busOwnName] rather than entering the waiting queue for that name. (Since 2.54)
  */
  DoNotQueue = 4,
}

/**
    Flags used in [gio.global.busWatchName].
*/
enum GBusNameWatcherFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      If no-one owns the name when
      beginning to watch the name, ask the bus to launch an owner for the
      name.
  */
  AutoStart = 1,
}

/**
    An enumeration for well-known message buses.
*/
enum GBusType
{
  /**
      An alias for the message bus that activated the process, if any.
  */
  Starter = -1,

  /**
      Not a message bus.
  */
  None = 0,

  /**
      The system-wide message bus.
  */
  System = 1,

  /**
      The login session message bus.
  */
  Session = 2,
}

/**
    Flags used when calling a [gio.converter.Converter.convert].
*/
enum GConverterFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      At end of input data
  */
  InputAtEnd = 1,

  /**
      Flush data
  */
  Flush = 2,
}

/**
    Results returned from [gio.converter.Converter.convert].
*/
enum GConverterResult
{
  /**
      There was an error during conversion.
  */
  Error = 0,

  /**
      Some data was consumed or produced
  */
  Converted = 1,

  /**
      The conversion is finished
  */
  Finished = 2,

  /**
      Flushing is finished
  */
  Flushed = 3,
}

/**
    Enumeration describing different kinds of native credential types.
*/
enum GCredentialsType
{
  /**
      Indicates an invalid native credential type.
  */
  Invalid = 0,

  /**
      The native credentials type is a `struct ucred`.
  */
  LinuxUcred = 1,

  /**
      The native credentials type is a `struct cmsgcred`.
  */
  FreebsdCmsgcred = 2,

  /**
      The native credentials type is a `struct sockpeercred`. Added in 2.30.
  */
  OpenbsdSockpeercred = 3,

  /**
      The native credentials type is a `ucred_t`. Added in 2.40.
  */
  SolarisUcred = 4,

  /**
      The native credentials type is a `struct unpcbid`. Added in 2.42.
  */
  NetbsdUnpcbid = 5,

  /**
      The native credentials type is a `struct xucred`. Added in 2.66.
  */
  AppleXucred = 6,

  /**
      The native credentials type is a PID `DWORD`. Added in 2.72.
  */
  Win32Pid = 7,
}

/**
    Flags used in [gio.dbus_connection.DBusConnection.call] and similar APIs.
*/
enum GDBusCallFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The bus must not launch
      an owner for the destination name in response to this method
      invocation.
  */
  NoAutoStart = 1,

  /**
      the caller is prepared to
      wait for interactive authorization. Since 2.46.
  */
  AllowInteractiveAuthorization = 2,
}

/**
    Capabilities negotiated with the remote peer.
*/
enum GDBusCapabilityFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The connection
      supports exchanging UNIX file descriptors with the remote peer.
  */
  UnixFdPassing = 1,
}

/**
    Flags used when creating a new #GDBusConnection.
*/
enum GDBusConnectionFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Perform authentication against server.
  */
  AuthenticationClient = 1,

  /**
      Perform authentication against client.
  */
  AuthenticationServer = 2,

  /**
      When
      authenticating as a server, allow the anonymous authentication
      method.
  */
  AuthenticationAllowAnonymous = 4,

  /**
      Pass this flag if connecting to a peer that is a
      message bus. This means that the Hello() method will be invoked as part of the connection setup.
  */
  MessageBusConnection = 8,

  /**
      If set, processing of D-Bus messages is
      delayed until [gio.dbus_connection.DBusConnection.startMessageProcessing] is called.
  */
  DelayMessageProcessing = 16,

  /**
      When authenticating
      as a server, require the UID of the peer to be the same as the UID of the server. (Since: 2.68)
  */
  AuthenticationRequireSameUser = 32,

  /**
      When authenticating, try to use
       protocols that work across a Linux user namespace boundary, even if this
       reduces interoperability with older D-Bus implementations. This currently
       affects client-side `EXTERNAL` authentication, for which this flag makes
       connections to a server in another user namespace succeed, but causes
       a deadlock when connecting to a GDBus server older than 2.73.3. Since: 2.74
  */
  CrossNamespace = 64,
}

/**
    Error codes for the `G_DBUS_ERROR` error domain.
*/
enum GDBusError
{
  /**
      A generic error; "something went wrong" - see the error message for
      more.
  */
  Failed = 0,

  /**
      There was not enough memory to complete an operation.
  */
  NoMemory = 1,

  /**
      The bus doesn't know how to launch a service to supply the bus name
      you wanted.
  */
  ServiceUnknown = 2,

  /**
      The bus name you referenced doesn't exist (i.e. no application owns
      it).
  */
  NameHasNoOwner = 3,

  /**
      No reply to a message expecting one, usually means a timeout occurred.
  */
  NoReply = 4,

  /**
      Something went wrong reading or writing to a socket, for example.
  */
  IoError = 5,

  /**
      A D-Bus bus address was malformed.
  */
  BadAddress = 6,

  /**
      Requested operation isn't supported (like ENOSYS on UNIX).
  */
  NotSupported = 7,

  /**
      Some limited resource is exhausted.
  */
  LimitsExceeded = 8,

  /**
      Security restrictions don't allow doing what you're trying to do.
  */
  AccessDenied = 9,

  /**
      Authentication didn't work.
  */
  AuthFailed = 10,

  /**
      Unable to connect to server (probably caused by ECONNREFUSED on a
      socket).
  */
  NoServer = 11,

  /**
      Certain timeout errors, possibly ETIMEDOUT on a socket.  Note that
      [gio.types.DBusError.NoReply] is used for message reply timeouts. Warning:
      this is confusingly-named given that [gio.types.DBusError.TimedOut] also
      exists. We can't fix it for compatibility reasons so just be
      careful.
  */
  Timeout = 12,

  /**
      No network access (probably ENETUNREACH on a socket).
  */
  NoNetwork = 13,

  /**
      Can't bind a socket since its address is in use (i.e. EADDRINUSE).
  */
  AddressInUse = 14,

  /**
      The connection is disconnected and you're trying to use it.
  */
  Disconnected = 15,

  /**
      Invalid arguments passed to a method call.
  */
  InvalidArgs = 16,

  /**
      Missing file.
  */
  FileNotFound = 17,

  /**
      Existing file and the operation you're using does not silently overwrite.
  */
  FileExists = 18,

  /**
      Method name you invoked isn't known by the object you invoked it on.
  */
  UnknownMethod = 19,

  /**
      Certain timeout errors, e.g. while starting a service. Warning: this is
      confusingly-named given that [gio.types.DBusError.Timeout] also exists. We
      can't fix it for compatibility reasons so just be careful.
  */
  TimedOut = 20,

  /**
      Tried to remove or modify a match rule that didn't exist.
  */
  MatchRuleNotFound = 21,

  /**
      The match rule isn't syntactically valid.
  */
  MatchRuleInvalid = 22,

  /**
      While starting a new process, the exec() call failed.
  */
  SpawnExecFailed = 23,

  /**
      While starting a new process, the fork() call failed.
  */
  SpawnForkFailed = 24,

  /**
      While starting a new process, the child exited with a status code.
  */
  SpawnChildExited = 25,

  /**
      While starting a new process, the child exited on a signal.
  */
  SpawnChildSignaled = 26,

  /**
      While starting a new process, something went wrong.
  */
  SpawnFailed = 27,

  /**
      We failed to setup the environment correctly.
  */
  SpawnSetupFailed = 28,

  /**
      We failed to setup the config parser correctly.
  */
  SpawnConfigInvalid = 29,

  /**
      Bus name was not valid.
  */
  SpawnServiceInvalid = 30,

  /**
      Service file not found in system-services directory.
  */
  SpawnServiceNotFound = 31,

  /**
      Permissions are incorrect on the setuid helper.
  */
  SpawnPermissionsInvalid = 32,

  /**
      Service file invalid (Name, User or Exec missing).
  */
  SpawnFileInvalid = 33,

  /**
      Tried to get a UNIX process ID and it wasn't available.
  */
  SpawnNoMemory = 34,

  /**
      Tried to get a UNIX process ID and it wasn't available.
  */
  UnixProcessIdUnknown = 35,

  /**
      A type signature is not valid.
  */
  InvalidSignature = 36,

  /**
      A file contains invalid syntax or is otherwise broken.
  */
  InvalidFileContent = 37,

  /**
      Asked for SELinux security context and it wasn't available.
  */
  SelinuxSecurityContextUnknown = 38,

  /**
      Asked for ADT audit data and it wasn't available.
  */
  AdtAuditDataUnknown = 39,

  /**
      There's already an object with the requested object path.
  */
  ObjectPathInUse = 40,

  /**
      Object you invoked a method on isn't known. Since 2.42
  */
  UnknownObject = 41,

  /**
      Interface you invoked a method on isn't known by the object. Since 2.42
  */
  UnknownInterface = 42,

  /**
      Property you tried to access isn't known by the object. Since 2.42
  */
  UnknownProperty = 43,

  /**
      Property you tried to set is read-only. Since 2.42
  */
  PropertyReadOnly = 44,
}

/**
    Flags describing the behavior of a #GDBusInterfaceSkeleton instance.
*/
enum GDBusInterfaceSkeletonFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Each method invocation is handled in
        a thread dedicated to the invocation. This means that the method implementation can use blocking IO
        without blocking any other part of the process. It also means that the method implementation must
        use locking to access data structures used by other threads.
  */
  HandleMethodInvocationsInThread = 1,
}

/**
    Enumeration used to describe the byte order of a D-Bus message.
*/
enum GDBusMessageByteOrder
{
  /**
      The byte order is big endian.
  */
  BigEndian = 66,

  /**
      The byte order is little endian.
  */
  LittleEndian = 108,
}

/**
    Message flags used in #GDBusMessage.
*/
enum GDBusMessageFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      A reply is not expected.
  */
  NoReplyExpected = 1,

  /**
      The bus must not launch an
      owner for the destination name in response to this message.
  */
  NoAutoStart = 2,

  /**
      If set on a method
      call, this flag means that the caller is prepared to wait for interactive
      authorization. Since 2.46.
  */
  AllowInteractiveAuthorization = 4,
}

/**
    Header fields used in #GDBusMessage.
*/
enum GDBusMessageHeaderField
{
  /**
      Not a valid header field.
  */
  Invalid = 0,

  /**
      The object path.
  */
  Path = 1,

  /**
      The interface name.
  */
  Interface = 2,

  /**
      The method or signal name.
  */
  Member = 3,

  /**
      The name of the error that occurred.
  */
  ErrorName = 4,

  /**
      The serial number the message is a reply to.
  */
  ReplySerial = 5,

  /**
      The name the message is intended for.
  */
  Destination = 6,

  /**
      Unique name of the sender of the message (filled in by the bus).
  */
  Sender = 7,

  /**
      The signature of the message body.
  */
  Signature = 8,

  /**
      The number of UNIX file descriptors that accompany the message.
  */
  NumUnixFds = 9,
}

/**
    Message types used in #GDBusMessage.
*/
enum GDBusMessageType
{
  /**
      Message is of invalid type.
  */
  Invalid = 0,

  /**
      Method call.
  */
  MethodCall = 1,

  /**
      Method reply.
  */
  MethodReturn = 2,

  /**
      Error reply.
  */
  Error = 3,

  /**
      Signal emission.
  */
  Signal = 4,
}

/**
    Flags used when constructing a #GDBusObjectManagerClient.
*/
enum GDBusObjectManagerClientFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      If not set and the
        manager is for a well-known name, then request the bus to launch
        an owner for the name if no-one owns the name. This flag can only
        be used in managers for well-known names.
  */
  DoNotAutoStart = 1,
}

/**
    Flags describing the access control of a D-Bus property.
*/
enum GDBusPropertyInfoFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Property is readable.
  */
  Readable = 1,

  /**
      Property is writable.
  */
  Writable = 2,
}

/**
    Flags used when constructing an instance of a #GDBusProxy derived class.
*/
enum GDBusProxyFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't load properties.
  */
  DoNotLoadProperties = 1,

  /**
      Don't connect to signals on the remote object.
  */
  DoNotConnectSignals = 2,

  /**
      If the proxy is for a well-known name,
      do not ask the bus to launch an owner during proxy initialization or a method call.
      This flag is only meaningful in proxies for well-known names.
  */
  DoNotAutoStart = 4,

  /**
      If set, the property value for any __invalidated property__ will be (asynchronously) retrieved upon receiving the [`PropertiesChanged`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties) D-Bus signal and the property will not cause emission of the #GDBusProxy::g-properties-changed signal. When the value is received the #GDBusProxy::g-properties-changed signal is emitted for the property along with the retrieved value. Since 2.32.
  */
  GetInvalidatedProperties = 8,

  /**
      If the proxy is for a well-known name,
      do not ask the bus to launch an owner during proxy initialization, but allow it to be
      autostarted by a method call. This flag is only meaningful in proxies for well-known names,
      and only if [gio.types.DBusProxyFlags.DoNotAutoStart] is not also specified.
  */
  DoNotAutoStartAtConstruction = 16,

  /**
      Don't actually send the AddMatch D-Bus
         call for this signal subscription. This gives you more control
         over which match rules you add (but you must add them manually). (Since: 2.72)
  */
  NoMatchRule = 32,
}

/**
    Flags used when sending #GDBusMessages on a #GDBusConnection.
*/
enum GDBusSendMessageFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Do not automatically
      assign a serial number from the #GDBusConnection object when
      sending a message.
  */
  PreserveSerial = 1,
}

/**
    Flags used when creating a #GDBusServer.
*/
enum GDBusServerFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      All #GDBusServer::new-connection
      signals will run in separated dedicated threads (see signal for
      details).
  */
  RunInThread = 1,

  /**
      Allow the anonymous
      authentication method.
  */
  AuthenticationAllowAnonymous = 2,

  /**
      Require the UID of the
      peer to be the same as the UID of the server when authenticating. (Since: 2.68)
  */
  AuthenticationRequireSameUser = 4,
}

/**
    Flags used when subscribing to signals via [gio.dbus_connection.DBusConnection.signalSubscribe].
*/
enum GDBusSignalFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't actually send the AddMatch
      D-Bus call for this signal subscription.  This gives you more control
      over which match rules you add (but you must add them manually).
  */
  NoMatchRule = 1,

  /**
      Match first arguments that
      contain a bus or interface name with the given namespace.
  */
  MatchArg0Namespace = 2,

  /**
      Match first arguments that
      contain an object path that is either equivalent to the given path,
      or one of the paths is a subpath of the other.
  */
  MatchArg0Path = 4,
}

/**
    Flags passed to [gio.dbus_connection.DBusConnection.registerSubtree].
*/
enum GDBusSubtreeFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Method calls to objects not in the enumerated range
                                                            will still be dispatched. This is useful if you want
                                                            to dynamically spawn objects in the subtree.
  */
  DispatchToUnenumeratedNodes = 1,
}

/**
    #GDataStreamByteOrder is used to ensure proper endianness of streaming data sources
    across various machine architectures.
*/
enum GDataStreamByteOrder
{
  /**
      Selects Big Endian byte order.
  */
  BigEndian = 0,

  /**
      Selects Little Endian byte order.
  */
  LittleEndian = 1,

  /**
      Selects endianness based on host machine's architecture.
  */
  HostEndian = 2,
}

/**
    #GDataStreamNewlineType is used when checking for or setting the line endings for a given file.
*/
enum GDataStreamNewlineType
{
  /**
      Selects "LF" line endings, common on most modern UNIX platforms.
  */
  Lf = 0,

  /**
      Selects "CR" line endings.
  */
  Cr = 1,

  /**
      Selects "CR, LF" line ending, common on Microsoft Windows.
  */
  CrLf = 2,

  /**
      Automatically try to handle any line ending type.
  */
  Any = 3,
}

/**
    Flags used when starting a drive.
*/
enum GDriveStartFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    Enumeration describing how a drive can be started/stopped.
*/
enum GDriveStartStopType
{
  /**
      Unknown or drive doesn't support
         start/stop.
  */
  Unknown = 0,

  /**
      The stop method will physically
         shut down the drive and e.g. power down the port the drive is
         attached to.
  */
  Shutdown = 1,

  /**
      The start/stop methods are used
         for connecting/disconnect to the drive over the network.
  */
  Network = 2,

  /**
      The start/stop methods will
         assemble/disassemble a virtual drive from several physical
         drives.
  */
  Multidisk = 3,

  /**
      The start/stop methods will
         unlock/lock the disk (for example using the ATA <quote>SECURITY
         UNLOCK DEVICE</quote> command)
  */
  Password = 4,
}

/**
    GEmblemOrigin is used to add information about the origin of the emblem
    to #GEmblem.
*/
enum GEmblemOrigin
{
  /**
      Emblem of unknown origin
  */
  Unknown = 0,

  /**
      Emblem adds device-specific information
  */
  Device = 1,

  /**
      Emblem depicts live metadata, such as "readonly"
  */
  Livemetadata = 2,

  /**
      Emblem comes from a user-defined tag, e.g. set by nautilus (in the future)
  */
  Tag = 3,
}

/**
    Flags specifying the behaviour of an attribute.
*/
enum GFileAttributeInfoFlags : uint
{
  /**
      no flags set.
  */
  None = 0,

  /**
      copy the attribute values when the file is copied.
  */
  CopyWithFile = 1,

  /**
      copy the attribute values when the file is moved.
  */
  CopyWhenMoved = 2,
}

/**
    Used by [gio.file.File.setAttributesFromInfo] when setting file attributes.
*/
enum GFileAttributeStatus
{
  /**
      Attribute value is unset (empty).
  */
  Unset = 0,

  /**
      Attribute value is set.
  */
  Set = 1,

  /**
      Indicates an error in setting the value.
  */
  ErrorSetting = 2,
}

/**
    The data types for file attributes.
*/
enum GFileAttributeType
{
  /**
      indicates an invalid or uninitialized type.
  */
  Invalid = 0,

  /**
      a null terminated UTF8 string.
  */
  String = 1,

  /**
      a zero terminated string of non-zero bytes.
  */
  ByteString = 2,

  /**
      a boolean value.
  */
  Boolean = 3,

  /**
      an unsigned 4-byte/32-bit integer.
  */
  Uint32 = 4,

  /**
      a signed 4-byte/32-bit integer.
  */
  Int32 = 5,

  /**
      an unsigned 8-byte/64-bit integer.
  */
  Uint64 = 6,

  /**
      a signed 8-byte/64-bit integer.
  */
  Int64 = 7,

  /**
      a #GObject.
  */
  Object = 8,

  /**
      a null terminated char **. Since 2.22
  */
  Stringv = 9,
}

/**
    Flags used when copying or moving files.
*/
enum GFileCopyFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Overwrite any existing files
  */
  Overwrite = 1,

  /**
      Make a backup of any existing files.
  */
  Backup = 2,

  /**
      Don't follow symlinks.
  */
  NofollowSymlinks = 4,

  /**
      Copy all file metadata instead of just default set used for copy (see #GFileInfo).
  */
  AllMetadata = 8,

  /**
      Don't use copy and delete fallback if native move not supported.
  */
  NoFallbackForMove = 16,

  /**
      Leaves target file with default perms, instead of setting the source file perms.
  */
  TargetDefaultPerms = 32,

  /**
      Use default modification
          timestamps instead of copying them from the source file. Since 2.80
  */
  TargetDefaultModifiedTime = 64,
}

/**
    Flags used when an operation may create a file.
*/
enum GFileCreateFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Create a file that can only be
         accessed by the current user.
  */
  Private = 1,

  /**
      Replace the destination
         as if it didn't exist before. Don't try to keep any old
         permissions, replace instead of following links. This
         is generally useful if you're doing a "copy over"
         rather than a "save new version of" replace operation.
         You can think of it as "unlink destination" before
         writing to it, although the implementation may not
         be exactly like that. This flag can only be used with
         [gio.file.File.replace] and its variants, including [gio.file.File.replaceContents].
         Since 2.20
  */
  ReplaceDestination = 2,
}

/**
    Flags that can be used with [gio.file.File.measureDiskUsage].
*/
enum GFileMeasureFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Report any error encountered
        while traversing the directory tree.  Normally errors are only
        reported for the toplevel file.
  */
  ReportAnyError = 2,

  /**
      Tally usage based on apparent file
        sizes.  Normally, the block-size is used, if available, as this is a
        more accurate representation of disk space used.
        Compare with `du --apparent-size`.
        Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
        ignore the sizes of file types other than regular files and links, as the
        sizes of other file types are not specified in a standard way.
  */
  ApparentSize = 4,

  /**
      Do not cross mount point boundaries.
        Compare with `du -x`.
  */
  NoXdev = 8,
}

/**
    Specifies what type of event a monitor event is.
*/
enum GFileMonitorEvent
{
  /**
      a file changed.
  */
  Changed = 0,

  /**
      a hint that this was probably the last change in a set of changes.
  */
  ChangesDoneHint = 1,

  /**
      a file was deleted.
  */
  Deleted = 2,

  /**
      a file was created.
  */
  Created = 3,

  /**
      a file attribute was changed.
  */
  AttributeChanged = 4,

  /**
      the file location will soon be unmounted.
  */
  PreUnmount = 5,

  /**
      the file location was unmounted.
  */
  Unmounted = 6,

  /**
      the file was moved -- only sent if the
        (deprecated) [gio.types.FileMonitorFlags.SendMoved] flag is set
  */
  Moved = 7,

  /**
      the file was renamed within the
        current directory -- only sent if the [gio.types.FileMonitorFlags.WatchMoves]
        flag is set.  Since: 2.46.
  */
  Renamed = 8,

  /**
      the file was moved into the
        monitored directory from another location -- only sent if the
        [gio.types.FileMonitorFlags.WatchMoves] flag is set.  Since: 2.46.
  */
  MovedIn = 9,

  /**
      the file was moved out of the
        monitored directory to another location -- only sent if the
        [gio.types.FileMonitorFlags.WatchMoves] flag is set.  Since: 2.46
  */
  MovedOut = 10,
}

/**
    Flags used to set what a #GFileMonitor will watch for.
*/
enum GFileMonitorFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Watch for mount events.
  */
  WatchMounts = 1,

  /**
      Pair DELETED and CREATED events caused
        by file renames (moves) and send a single G_FILE_MONITOR_EVENT_MOVED
        event instead (NB: not supported on all backends; the default
        behaviour -without specifying this flag- is to send single DELETED
        and CREATED events).  Deprecated since 2.46: use
        [gio.types.FileMonitorFlags.WatchMoves] instead.
  */
  SendMoved = 2,

  /**
      Watch for changes to the file made
        via another hard link. Since 2.36.
  */
  WatchHardLinks = 4,

  /**
      Watch for rename operations on a
        monitored directory.  This causes [gio.types.FileMonitorEvent.Renamed],
        [gio.types.FileMonitorEvent.MovedIn] and [gio.types.FileMonitorEvent.MovedOut]
        events to be emitted when possible.  Since: 2.46.
  */
  WatchMoves = 8,
}

/**
    Flags used when querying a #GFileInfo.
*/
enum GFileQueryInfoFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't follow symlinks.
  */
  NofollowSymlinks = 1,
}

/**
    Indicates the file's on-disk type.
    
    On Windows systems a file will never have [gio.types.FileType.SymbolicLink] type;
    use #GFileInfo and [gio.types.FILE_ATTRIBUTE_STANDARD_IS_SYMLINK] to determine
    whether a file is a symlink or not. This is due to the fact that NTFS does
    not have a single filesystem object type for symbolic links - it has
    files that symlink to files, and directories that symlink to directories.
    #GFileType enumeration cannot precisely represent this important distinction,
    which is why all Windows symlinks will continue to be reported as
    [gio.types.FileType.Regular] or [gio.types.FileType.Directory].
*/
enum GFileType
{
  /**
      File's type is unknown.
  */
  Unknown = 0,

  /**
      File handle represents a regular file.
  */
  Regular = 1,

  /**
      File handle represents a directory.
  */
  Directory = 2,

  /**
      File handle represents a symbolic link
         (Unix systems).
  */
  SymbolicLink = 3,

  /**
      File is a "special" file, such as a socket, fifo,
         block device, or character device.
  */
  Special = 4,

  /**
      File is a shortcut (Windows systems).
  */
  Shortcut = 5,

  /**
      File is a mountable location.
  */
  Mountable = 6,
}

/**
    Indicates a hint from the file system whether files should be
    previewed in a file manager. Returned as the value of the key
    [gio.types.FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW].
*/
enum GFilesystemPreviewType
{
  /**
      Only preview files if user has explicitly requested it.
  */
  IfAlways = 0,

  /**
      Preview files if user has requested preview of "local" files.
  */
  IfLocal = 1,

  /**
      Never preview files.
  */
  Never = 2,
}

/**
    Error codes returned by GIO functions.
    
    Note that this domain may be extended in future GLib releases. In
    general, new error codes either only apply to new APIs, or else
    replace [gio.types.IOErrorEnum.Failed] in cases that were not explicitly
    distinguished before. You should therefore avoid writing code like
    ```c
    if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_FAILED))
      {
        // Assume that this is EPRINTERONFIRE
        ...
      }
    ```
    but should instead treat all unrecognized error codes the same as
    [gio.types.IOErrorEnum.Failed].
    
    See also #GPollableReturn for a cheaper way of returning
    [gio.types.IOErrorEnum.WouldBlock] to callers without allocating a #GError.
*/
enum GIOErrorEnum
{
  /**
      Generic error condition for when an operation fails
          and no more specific #GIOErrorEnum value is defined.
  */
  Failed = 0,

  /**
      File not found.
  */
  NotFound = 1,

  /**
      File already exists.
  */
  Exists = 2,

  /**
      File is a directory.
  */
  IsDirectory = 3,

  /**
      File is not a directory.
  */
  NotDirectory = 4,

  /**
      File is a directory that isn't empty.
  */
  NotEmpty = 5,

  /**
      File is not a regular file.
  */
  NotRegularFile = 6,

  /**
      File is not a symbolic link.
  */
  NotSymbolicLink = 7,

  /**
      File cannot be mounted.
  */
  NotMountableFile = 8,

  /**
      Filename is too many characters.
  */
  FilenameTooLong = 9,

  /**
      Filename is invalid or contains invalid characters.
  */
  InvalidFilename = 10,

  /**
      File contains too many symbolic links.
  */
  TooManyLinks = 11,

  /**
      No space left on drive.
  */
  NoSpace = 12,

  /**
      Invalid argument.
  */
  InvalidArgument = 13,

  /**
      Permission denied.
  */
  PermissionDenied = 14,

  /**
      Operation (or one of its parameters) not supported
  */
  NotSupported = 15,

  /**
      File isn't mounted.
  */
  NotMounted = 16,

  /**
      File is already mounted.
  */
  AlreadyMounted = 17,

  /**
      File was closed.
  */
  Closed = 18,

  /**
      Operation was cancelled. See #GCancellable.
  */
  Cancelled = 19,

  /**
      Operations are still pending.
  */
  Pending = 20,

  /**
      File is read only.
  */
  ReadOnly = 21,

  /**
      Backup couldn't be created.
  */
  CantCreateBackup = 22,

  /**
      File's Entity Tag was incorrect.
  */
  WrongEtag = 23,

  /**
      Operation timed out.
  */
  TimedOut = 24,

  /**
      Operation would be recursive.
  */
  WouldRecurse = 25,

  /**
      File is busy.
  */
  Busy = 26,

  /**
      Operation would block.
  */
  WouldBlock = 27,

  /**
      Host couldn't be found (remote operations).
  */
  HostNotFound = 28,

  /**
      Operation would merge files.
  */
  WouldMerge = 29,

  /**
      Operation failed and a helper program has
          already interacted with the user. Do not display any error dialog.
  */
  FailedHandled = 30,

  /**
      The current process has too many files
          open and can't open any more. Duplicate descriptors do count toward
          this limit. Since 2.20
  */
  TooManyOpenFiles = 31,

  /**
      The object has not been initialized. Since 2.22
  */
  NotInitialized = 32,

  /**
      The requested address is already in use. Since 2.22
  */
  AddressInUse = 33,

  /**
      Need more input to finish operation. Since 2.24
  */
  PartialInput = 34,

  /**
      The input data was invalid. Since 2.24
  */
  InvalidData = 35,

  /**
      A remote object generated an error that
          doesn't correspond to a locally registered #GError error
          domain. Use [gio.global.dbusErrorGetRemoteError] to extract the D-Bus
          error name and [gio.global.dbusErrorStripRemoteError] to fix up the
          message so it matches what was received on the wire. Since 2.26.
  */
  DbusError = 36,

  /**
      Host unreachable. Since 2.26
  */
  HostUnreachable = 37,

  /**
      Network unreachable. Since 2.26
  */
  NetworkUnreachable = 38,

  /**
      Connection refused. Since 2.26
  */
  ConnectionRefused = 39,

  /**
      Connection to proxy server failed. Since 2.26
  */
  ProxyFailed = 40,

  /**
      Proxy authentication failed. Since 2.26
  */
  ProxyAuthFailed = 41,

  /**
      Proxy server needs authentication. Since 2.26
  */
  ProxyNeedAuth = 42,

  /**
      Proxy connection is not allowed by ruleset.
          Since 2.26
  */
  ProxyNotAllowed = 43,

  /**
      Broken pipe. Since 2.36
  */
  BrokenPipe = 44,

  /**
      Connection closed by peer. Note that this
          is the same code as [gio.types.IOErrorEnum.BrokenPipe]; before 2.44 some
          "connection closed" errors returned [gio.types.IOErrorEnum.BrokenPipe], but others
          returned [gio.types.IOErrorEnum.Failed]. Now they should all return the same
          value, which has this more logical name. Since 2.44.
  */
  ConnectionClosed = 44,

  /**
      Transport endpoint is not connected. Since 2.44
  */
  NotConnected = 45,

  /**
      Message too large. Since 2.48.
  */
  MessageTooLarge = 46,

  /**
      No such device found. Since 2.74
  */
  NoSuchDevice = 47,

  /**
      Destination address unset. Since 2.80
  */
  DestinationUnset = 48,
}

/**
    Flags for use with [gio.iomodule_scope.IOModuleScope.new_].
*/
enum GIOModuleScopeFlags
{
  /**
      No module scan flags
  */
  None = 0,

  /**
      When using this scope to load or
          scan modules, automatically block a modules which has the same base
          basename as previously loaded module.
  */
  BlockDuplicates = 1,
}

/**
    GIOStreamSpliceFlags determine how streams should be spliced.
*/
enum GIOStreamSpliceFlags : uint
{
  /**
      Do not close either stream.
  */
  None = 0,

  /**
      Close the first stream after
          the splice.
  */
  CloseStream1 = 1,

  /**
      Close the second stream after
          the splice.
  */
  CloseStream2 = 2,

  /**
      Wait for both splice operations to finish
          before calling the callback.
  */
  WaitForBoth = 4,
}

/**
    Memory availability warning levels.
    
    Note that because new values might be added, it is recommended that applications check
    #GMemoryMonitorWarningLevel as ranges, for example:
    ```c
    if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
      drop_caches ();
    ```
*/
enum GMemoryMonitorWarningLevel
{
  /**
      Memory on the device is low, processes
        should free up unneeded resources (for example, in-memory caches) so they can
        be used elsewhere.
  */
  Low = 50,

  /**
      Same as @G_MEMORY_MONITOR_WARNING_LEVEL_LOW
        but the device has even less free memory, so processes should try harder to free
        up unneeded resources. If your process does not need to stay running, it is a
        good time for it to quit.
  */
  Medium = 100,

  /**
      The system will soon start terminating
        processes to reclaim memory, including background processes.
  */
  Critical = 255,
}

/**
    Flags used when mounting a mount.
*/
enum GMountMountFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    #GMountOperationResult is returned as a result when a request for
    information is send by the mounting operation.
*/
enum GMountOperationResult
{
  /**
      The request was fulfilled and the
          user specified data is now available
  */
  Handled = 0,

  /**
      The user requested the mount operation
          to be aborted
  */
  Aborted = 1,

  /**
      The request was unhandled (i.e. not
          implemented)
  */
  Unhandled = 2,
}

/**
    Flags used when an unmounting a mount.
*/
enum GMountUnmountFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Unmount even if there are outstanding
       file operations on the mount.
  */
  Force = 1,
}

/**
    The host's network connectivity state, as reported by #GNetworkMonitor.
*/
enum GNetworkConnectivity
{
  /**
      The host is not configured with a
        route to the Internet; it may or may not be connected to a local
        network.
  */
  Local = 1,

  /**
      The host is connected to a network, but
        does not appear to be able to reach the full Internet, perhaps
        due to upstream network problems.
  */
  Limited = 2,

  /**
      The host is behind a captive portal and
        cannot reach the full Internet.
  */
  Portal = 3,

  /**
      The host is connected to a network, and
        appears to be able to reach the full Internet.
  */
  Full = 4,
}

/**
    Priority levels for #GNotifications.
*/
enum GNotificationPriority
{
  /**
      the default priority, to be used for the
        majority of notifications (for example email messages, software updates,
        completed download/sync operations)
  */
  Normal = 0,

  /**
      for notifications that do not require
        immediate attention - typically used for contextual background
        information, such as contact birthdays or local weather
  */
  Low = 1,

  /**
      for events that require more attention,
        usually because responses are time-sensitive (for example chat and SMS
        messages or alarms)
  */
  High = 2,

  /**
      for urgent notifications, or notifications
        that require a response in a short space of time (for example phone calls
        or emergency warnings)
  */
  Urgent = 3,
}

/**
    GOutputStreamSpliceFlags determine how streams should be spliced.
*/
enum GOutputStreamSpliceFlags : uint
{
  /**
      Do not close either stream.
  */
  None = 0,

  /**
      Close the source stream after
          the splice.
  */
  CloseSource = 1,

  /**
      Close the target stream after
          the splice.
  */
  CloseTarget = 2,
}

/**
    #GPasswordSave is used to indicate the lifespan of a saved password.
    
    #Gvfs stores passwords in the Gnome keyring when this flag allows it
    to, and later retrieves it again from there.
*/
enum GPasswordSave
{
  /**
      never save a password.
  */
  Never = 0,

  /**
      save a password for the session.
  */
  ForSession = 1,

  /**
      save a password permanently.
  */
  Permanently = 2,
}

/**
    Return value for various IO operations that signal errors via the
    return value and not necessarily via a #GError.
    
    This enum exists to be able to return errors to callers without having to
    allocate a #GError. Allocating #GErrors can be quite expensive for
    regularly happening errors like [gio.types.IOErrorEnum.WouldBlock].
    
    In case of [gio.types.PollableReturn.Failed] a #GError should be set for the
    operation to give details about the error that happened.
*/
enum GPollableReturn
{
  /**
      Generic error condition for when an operation fails.
  */
  Failed = 0,

  /**
      The operation was successfully finished.
  */
  Ok = 1,

  /**
      The operation would block.
  */
  WouldBlock = -27,
}

/**
    An error code used with `G_RESOLVER_ERROR` in a #GError returned
    from a #GResolver routine.
*/
enum GResolverError
{
  /**
      the requested name/address/service was not
          found
  */
  NotFound = 0,

  /**
      the requested information could not
          be looked up due to a network error or similar problem
  */
  TemporaryFailure = 1,

  /**
      unknown error
  */
  Internal = 2,
}

/**
    Flags to modify lookup behavior.
*/
enum GResolverNameLookupFlags : uint
{
  /**
      default behavior (same as [gio.resolver.Resolver.lookupByName])
  */
  Default = 0,

  /**
      only resolve ipv4 addresses
  */
  Ipv4Only = 1,

  /**
      only resolve ipv6 addresses
  */
  Ipv6Only = 2,
}

/**
    The type of record that [gio.resolver.Resolver.lookupRecords] or
    [gio.resolver.Resolver.lookupRecordsAsync] should retrieve. The records are returned
    as lists of #GVariant tuples. Each record type has different values in
    the variant tuples returned.
    
    [gio.types.ResolverRecordType.Srv] records are returned as variants with the signature
    `(qqqs)`, containing a [glib.types.ushort] with the priority, a [glib.types.ushort] with the
    weight, a [glib.types.ushort] with the port, and a string of the hostname.
    
    [gio.types.ResolverRecordType.Mx] records are returned as variants with the signature
    `(qs)`, representing a [glib.types.ushort] with the preference, and a string containing
    the mail exchanger hostname.
    
    [gio.types.ResolverRecordType.Txt] records are returned as variants with the signature
    `(as)`, representing an array of the strings in the text record. Note: Most TXT
    records only contain a single string, but
    [RFC 1035](https://tools.ietf.org/html/rfc1035#section-3.3.14) does allow a
    record to contain multiple strings. The RFC which defines the interpretation
    of a specific TXT record will likely require concatenation of multiple
    strings if they are present, as with
    [RFC 7208](https://tools.ietf.org/html/rfc7208#section-3.3).
    
    [gio.types.ResolverRecordType.Soa] records are returned as variants with the signature
    `(ssuuuuu)`, representing a string containing the primary name server, a
    string containing the administrator, the serial as a [pango.types.uint], the refresh
    interval as a [pango.types.uint], the retry interval as a [pango.types.uint], the expire timeout
    as a [pango.types.uint], and the TTL as a [pango.types.uint].
    
    [gio.types.ResolverRecordType.Ns] records are returned as variants with the signature
    `(s)`, representing a string of the hostname of the name server.
*/
enum GResolverRecordType
{
  /**
      look up DNS SRV records for a domain
  */
  Srv = 1,

  /**
      look up DNS MX records for a domain
  */
  Mx = 2,

  /**
      look up DNS TXT records for a name
  */
  Txt = 3,

  /**
      look up DNS SOA records for a zone
  */
  Soa = 4,

  /**
      look up DNS NS records for a domain
  */
  Ns = 5,
}

/**
    An error code used with `G_RESOURCE_ERROR` in a #GError returned
    from a #GResource routine.
*/
enum GResourceError
{
  /**
      no file was found at the requested path
  */
  NotFound = 0,

  /**
      unknown error
  */
  Internal = 1,
}

/**
    GResourceFlags give information about a particular file inside a resource
    bundle.
*/
enum GResourceFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The file is compressed.
  */
  Compressed = 1,
}

/**
    GResourceLookupFlags determine how resource path lookups are handled.
*/
enum GResourceLookupFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    Flags used when creating a binding. These flags determine in which
    direction the binding works. The default is to synchronize in both
    directions.
*/
enum GSettingsBindFlags : uint
{
  /**
      Equivalent to `G_SETTINGS_BIND_GET|G_SETTINGS_BIND_SET`
  */
  Default = 0,

  /**
      Update the #GObject property when the setting changes.
          It is an error to use this flag if the property is not writable.
  */
  Get = 1,

  /**
      Update the setting when the #GObject property changes.
          It is an error to use this flag if the property is not readable.
  */
  Set = 2,

  /**
      Do not try to bind a "sensitivity" property to the writability of the setting
  */
  NoSensitivity = 4,

  /**
      When set in addition to [gio.types.SettingsBindFlags.Get], set the #GObject property
          value initially from the setting, but do not listen for changes of the setting
  */
  GetNoChanges = 8,

  /**
      When passed to [gio.settings.Settings.bind], uses a pair of mapping functions that invert
          the boolean value when mapping between the setting and the property.  The setting and property must both
          be booleans.  You cannot pass this flag to [gio.settings.Settings.bindWithMapping].
  */
  InvertBoolean = 16,
}

/**
    Describes an event occurring on a #GSocketClient. See the
    #GSocketClient::event signal for more details.
    
    Additional values may be added to this type in the future.
*/
enum GSocketClientEvent
{
  /**
      The client is doing a DNS lookup.
  */
  Resolving = 0,

  /**
      The client has completed a DNS lookup.
  */
  Resolved = 1,

  /**
      The client is connecting to a remote
        host (either a proxy or the destination server).
  */
  Connecting = 2,

  /**
      The client has connected to a remote
        host.
  */
  Connected = 3,

  /**
      The client is negotiating
        with a proxy to connect to the destination server.
  */
  ProxyNegotiating = 4,

  /**
      The client has negotiated
        with the proxy server.
  */
  ProxyNegotiated = 5,

  /**
      The client is performing a
        TLS handshake.
  */
  TlsHandshaking = 6,

  /**
      The client has performed a
        TLS handshake.
  */
  TlsHandshaked = 7,

  /**
      The client is done with a particular
        #GSocketConnectable.
  */
  Complete = 8,
}

/**
    The protocol family of a #GSocketAddress. (These values are
    identical to the system defines `AF_INET`, `AF_INET6` and `AF_UNIX`,
    if available.)
*/
enum GSocketFamily
{
  /**
      no address family
  */
  Invalid = 0,

  /**
      the UNIX domain family
  */
  Unix = 1,

  /**
      the IPv4 family
  */
  Ipv4 = 2,

  /**
      the IPv6 family
  */
  Ipv6 = 10,
}

/**
    Describes an event occurring on a #GSocketListener. See the
    #GSocketListener::event signal for more details.
    
    Additional values may be added to this type in the future.
*/
enum GSocketListenerEvent
{
  /**
      The listener is about to bind a socket.
  */
  Binding = 0,

  /**
      The listener has bound a socket.
  */
  Bound = 1,

  /**
      The listener is about to start
         listening on this socket.
  */
  Listening = 2,

  /**
      The listener is now listening on
        this socket.
  */
  Listened = 3,
}

/**
    Flags used in [gio.socket.Socket.receiveMessage] and [gio.socket.Socket.sendMessage].
    The flags listed in the enum are some commonly available flags, but the
    values used for them are the same as on the platform, and any other flags
    are passed in/out as is. So to use a platform specific flag, just include
    the right system header and pass in the flag.
*/
enum GSocketMsgFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Request to send/receive out of band data.
  */
  Oob = 1,

  /**
      Read data from the socket without removing it from
          the queue.
  */
  Peek = 2,

  /**
      Don't use a gateway to send out the packet,
          only send to hosts on directly connected networks.
  */
  Dontroute = 4,
}

/**
    A protocol identifier is specified when creating a #GSocket, which is a
    family/type specific identifier, where 0 means the default protocol for
    the particular family/type.
    
    This enum contains a set of commonly available and used protocols. You
    can also pass any other identifiers handled by the platform in order to
    use protocols not listed here.
*/
enum GSocketProtocol
{
  /**
      The protocol type is unknown
  */
  Unknown = -1,

  /**
      The default protocol for the family/type
  */
  Default = 0,

  /**
      TCP over IP
  */
  Tcp = 6,

  /**
      UDP over IP
  */
  Udp = 17,

  /**
      SCTP over IP
  */
  Sctp = 132,
}

/**
    Flags used when creating a #GSocket. Some protocols may not implement
    all the socket types.
*/
enum GSocketType
{
  /**
      Type unknown or wrong
  */
  Invalid = 0,

  /**
      Reliable connection-based byte streams (e.g. TCP).
  */
  Stream = 1,

  /**
      Connectionless, unreliable datagram passing.
          (e.g. UDP)
  */
  Datagram = 2,

  /**
      Reliable connection-based passing of datagrams
          of fixed maximum length (e.g. SCTP).
  */
  Seqpacket = 3,
}

/**
    Flags to define the behaviour of a #GSubprocess.
    
    Note that the default for stdin is to redirect from `/dev/null`.  For
    stdout and stderr the default are for them to inherit the
    corresponding descriptor from the calling process.
    
    Note that it is a programmer error to mix 'incompatible' flags.  For
    example, you may not request both [gio.types.SubprocessFlags.StdoutPipe] and
    [gio.types.SubprocessFlags.StdoutSilence].
*/
enum GSubprocessFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      create a pipe for the stdin of the
        spawned process that can be accessed with
        [gio.subprocess.Subprocess.getStdinPipe].
  */
  StdinPipe = 1,

  /**
      stdin is inherited from the
        calling process.
  */
  StdinInherit = 2,

  /**
      create a pipe for the stdout of the
        spawned process that can be accessed with
        [gio.subprocess.Subprocess.getStdoutPipe].
  */
  StdoutPipe = 4,

  /**
      silence the stdout of the spawned
        process (ie: redirect to `/dev/null`).
  */
  StdoutSilence = 8,

  /**
      create a pipe for the stderr of the
        spawned process that can be accessed with
        [gio.subprocess.Subprocess.getStderrPipe].
  */
  StderrPipe = 16,

  /**
      silence the stderr of the spawned
        process (ie: redirect to `/dev/null`).
  */
  StderrSilence = 32,

  /**
      merge the stderr of the spawned
        process with whatever the stdout happens to be.  This is a good way
        of directing both streams to a common log file, for example.
  */
  StderrMerge = 64,

  /**
      spawned processes will inherit the
        file descriptors of their parent, unless those descriptors have
        been explicitly marked as close-on-exec.  This flag has no effect
        over the "standard" file descriptors (stdin, stdout, stderr).
  */
  InheritFds = 128,

  /**
      if path searching is
        needed when spawning the subprocess, use the `PATH` in the launcher
        environment. (Since: 2.72)
  */
  SearchPathFromEnvp = 256,
}

/**
    Flags to define future #GTestDBus behaviour.
*/
enum GTestDBusFlags : uint
{
  /**
      No flags.
  */
  None = 0,
}

/**
    The client authentication mode for a #GTlsServerConnection.
*/
enum GTlsAuthenticationMode
{
  /**
      client authentication not required
  */
  None = 0,

  /**
      client authentication is requested
  */
  Requested = 1,

  /**
      client authentication is required
  */
  Required = 2,
}

/**
    A set of flags describing TLS certification validation. This can be
    used to describe why a particular certificate was rejected (for
    example, in #GTlsConnection::accept-certificate).
    
    GLib guarantees that if certificate verification fails, at least one
    flag will be set, but it does not guarantee that all possible flags
    will be set. Accordingly, you may not safely decide to ignore any
    particular type of error. For example, it would be incorrect to mask
    [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
    because this could potentially be the only error flag set even if
    other problems exist with the certificate.
*/
enum GTlsCertificateFlags : uint
{
  /**
      No flags set. Since: 2.74
  */
  NoFlags = 0,

  /**
      The signing certificate authority is
        not known.
  */
  UnknownCa = 1,

  /**
      The certificate does not match the
        expected identity of the site that it was retrieved from.
  */
  BadIdentity = 2,

  /**
      The certificate's activation time
        is still in the future
  */
  NotActivated = 4,

  /**
      The certificate has expired
  */
  Expired = 8,

  /**
      The certificate has been revoked
        according to the #GTlsConnection's certificate revocation list.
  */
  Revoked = 16,

  /**
      The certificate's algorithm is
        considered insecure.
  */
  Insecure = 32,

  /**
      Some other error occurred validating
        the certificate
  */
  GenericError = 64,

  /**
      the combination of all of the above
        flags
  */
  ValidateAll = 127,
}

/**
    Flags for [gio.tls_interaction.TlsInteraction.requestCertificate],
    [gio.tls_interaction.TlsInteraction.requestCertificateAsync], and
    [gio.tls_interaction.TlsInteraction.invokeRequestCertificate].
*/
enum GTlsCertificateRequestFlags
{
  /**
      No flags
  */
  None = 0,
}

/**
    An error code used with `G_TLS_CHANNEL_BINDING_ERROR` in a #GError to
    indicate a TLS channel binding retrieval error.
*/
enum GTlsChannelBindingError
{
  /**
      Either entire binding
         retrieval facility or specific binding type is not implemented in the
         TLS backend.
  */
  NotImplemented = 0,

  /**
      The handshake is not yet
         complete on the connection which is a strong requirement for any existing
         binding type.
  */
  InvalidState = 1,

  /**
      Handshake is complete but
         binding data is not available. That normally indicates the TLS
         implementation failed to provide the binding data. For example, some
         implementations do not provide a peer certificate for resumed connections.
  */
  NotAvailable = 2,

  /**
      Binding type is not supported
         on the current connection. This error could be triggered when requesting
         `tls-server-end-point` binding data for a certificate which has no hash
         function or uses multiple hash functions.
  */
  NotSupported = 3,

  /**
      Any other backend error
         preventing binding data retrieval.
  */
  GeneralError = 4,
}

/**
    The type of TLS channel binding data to retrieve from #GTlsConnection
    or #GDtlsConnection, as documented by RFC 5929 or RFC 9266. The
    [`tls-unique-for-telnet`](https://tools.ietf.org/html/rfc5929#section-5)
    binding type is not currently implemented.
*/
enum GTlsChannelBindingType
{
  /**
      [`tls-unique`](https://tools.ietf.org/html/rfc5929#section-3) binding
         type
  */
  Unique = 0,

  /**
      [`tls-server-end-point`](https://tools.ietf.org/html/rfc5929#section-4)
         binding type
  */
  ServerEndPoint = 1,

  /**
      [`tls-exporter`](https://www.rfc-editor.org/rfc/rfc9266.html) binding
         type. Since: 2.74
  */
  Exporter = 2,
}

/**
    Flags for [gio.tls_database.TlsDatabase.lookupCertificateForHandle],
    [gio.tls_database.TlsDatabase.lookupCertificateIssuer],
    and [gio.tls_database.TlsDatabase.lookupCertificatesIssuedBy].
*/
enum GTlsDatabaseLookupFlags
{
  /**
      No lookup flags
  */
  None = 0,

  /**
      Restrict lookup to certificates that have
          a private key.
  */
  Keypair = 1,
}

/**
    Flags for [gio.tls_database.TlsDatabase.verifyChain].
*/
enum GTlsDatabaseVerifyFlags : uint
{
  /**
      No verification flags
  */
  None = 0,
}

/**
    An error code used with `G_TLS_ERROR` in a #GError returned from a
    TLS-related routine.
*/
enum GTlsError
{
  /**
      No TLS provider is available
  */
  Unavailable = 0,

  /**
      Miscellaneous TLS error
  */
  Misc = 1,

  /**
      The certificate presented could not
        be parsed or failed validation.
  */
  BadCertificate = 2,

  /**
      The TLS handshake failed because the
        peer does not seem to be a TLS server.
  */
  NotTls = 3,

  /**
      The TLS handshake failed because the
        peer's certificate was not acceptable.
  */
  Handshake = 4,

  /**
      The TLS handshake failed because
        the server requested a client-side certificate, but none was
        provided. See [gio.tls_connection.TlsConnection.setCertificate].
  */
  CertificateRequired = 5,

  /**
      The TLS connection was closed without proper
        notice, which may indicate an attack. See
        [gio.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  Eof = 6,

  /**
      The TLS handshake failed
        because the client sent the fallback SCSV, indicating a protocol
        downgrade attack. Since: 2.60
  */
  InappropriateFallback = 7,

  /**
      The certificate failed
        to load because a password was incorrect. Since: 2.72
  */
  BadCertificatePassword = 8,
}

/**
    #GTlsInteractionResult is returned by various functions in #GTlsInteraction
    when finishing an interaction request.
*/
enum GTlsInteractionResult
{
  /**
      The interaction was unhandled (i.e. not
          implemented).
  */
  Unhandled = 0,

  /**
      The interaction completed, and resulting data
          is available.
  */
  Handled = 1,

  /**
      The interaction has failed, or was cancelled.
          and the operation should be aborted.
  */
  Failed = 2,
}

/**
    Various flags for the password.
*/
enum GTlsPasswordFlags : uint
{
  /**
      No flags
  */
  None = 0,

  /**
      The password was wrong, and the user should retry.
  */
  Retry = 2,

  /**
      Hint to the user that the password has been
         wrong many times, and the user may not have many chances left.
  */
  ManyTries = 4,

  /**
      Hint to the user that this is the last try to get
         this password right.
  */
  FinalTry = 8,

  /**
      For PKCS #11, the user PIN is required.
         Since: 2.70.
  */
  Pkcs11User = 16,

  /**
      For PKCS #11, the security officer
         PIN is required. Since: 2.70.
  */
  Pkcs11SecurityOfficer = 32,

  /**
      For PKCS #11, the context-specific
         PIN is required. Since: 2.70.
  */
  Pkcs11ContextSpecific = 64,
}

/**
    The TLS or DTLS protocol version used by a #GTlsConnection or
    #GDtlsConnection. The integer values of these versions are sequential
    to ensure newer known protocol versions compare greater than older
    known versions. Any known DTLS protocol version will compare greater
    than any SSL or TLS protocol version. The protocol version may be
    [gio.types.TlsProtocolVersion.Unknown] if the TLS backend supports a newer
    protocol version that GLib does not yet know about. This means that
    it's possible for an unknown DTLS protocol version to compare less
    than the TLS protocol versions.
*/
enum GTlsProtocolVersion
{
  /**
      No protocol version or unknown protocol version
  */
  Unknown = 0,

  /**
      SSL 3.0, which is insecure and should not be used
  */
  Ssl30 = 1,

  /**
      TLS 1.0, which is insecure and should not be used
  */
  Tls10 = 2,

  /**
      TLS 1.1, which is insecure and should not be used
  */
  Tls11 = 3,

  /**
      TLS 1.2, defined by [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246)
  */
  Tls12 = 4,

  /**
      TLS 1.3, defined by [RFC 8446](https://datatracker.ietf.org/doc/html/rfc8446)
  */
  Tls13 = 5,

  /**
      DTLS 1.0, which is insecure and should not be used
  */
  Dtls10 = 201,

  /**
      DTLS 1.2, defined by [RFC 6347](https://datatracker.ietf.org/doc/html/rfc6347)
  */
  Dtls12 = 202,
}

/**
    When to allow rehandshaking. See
    [gio.tls_connection.TlsConnection.setRehandshakeMode].

    Deprecated: Changing the rehandshake mode is no longer
        required for compatibility. Also, rehandshaking has been removed
        from the TLS protocol in TLS 1.3.
*/
enum GTlsRehandshakeMode
{
  /**
      Never allow rehandshaking
  */
  Never = 0,

  /**
      Allow safe rehandshaking only
  */
  Safely = 1,

  /**
      Allow unsafe rehandshaking
  */
  Unsafely = 2,
}

/**
    The type of name used by a #GUnixSocketAddress.
    [gio.types.UnixSocketAddressType.Path] indicates a traditional unix domain
    socket bound to a filesystem path. [gio.types.UnixSocketAddressType.Anonymous]
    indicates a socket not bound to any name (eg, a client-side socket,
    or a socket created with socketpair()).
    
    For abstract sockets, there are two incompatible ways of naming
    them; the man pages suggest using the entire `struct sockaddr_un`
    as the name, padding the unused parts of the `sun_path` field with
    zeroes; this corresponds to [gio.types.UnixSocketAddressType.AbstractPadded].
    However, many programs instead just use a portion of `sun_path`, and
    pass an appropriate smaller length to bind() or connect(). This is
    [gio.types.UnixSocketAddressType.Abstract].
*/
enum GUnixSocketAddressType
{
  /**
      invalid
  */
  Invalid = 0,

  /**
      anonymous
  */
  Anonymous = 1,

  /**
      a filesystem path
  */
  Path = 2,

  /**
      an abstract name
  */
  Abstract = 3,

  /**
      an abstract name, 0-padded
        to the full length of a unix socket name
  */
  AbstractPadded = 4,
}

/**
    Used to select the type of data format to use for #GZlibDecompressor
    and #GZlibCompressor.
*/
enum GZlibCompressorFormat
{
  /**
      deflate compression with zlib header
  */
  Zlib = 0,

  /**
      gzip file format
  */
  Gzip = 1,

  /**
      deflate compression with no header
  */
  Raw = 2,
}

/**
    [gio.action.Action] represents a single named action.
    
    The main interface to an action is that it can be activated with
    [gio.action.Action.activate]. This results in the 'activate' signal being
    emitted. An activation has a [glib.variant.Variant] parameter (which may be
    `NULL`). The correct type for the parameter is determined by a static
    parameter type (which is given at construction time).
    
    An action may optionally have a state, in which case the state may be
    set with [gio.action.Action.changeState]. This call takes a #GVariant. The
    correct type for the state is determined by a static state type
    (which is given at construction time).
    
    The state may have a hint associated with it, specifying its valid
    range.
    
    [gio.action.Action] is merely the interface to the concept of an action, as
    described above.  Various implementations of actions exist, including
    [gio.simple_action.SimpleAction].
    
    In all cases, the implementing class is responsible for storing the
    name of the action, the parameter type, the enabled state, the optional
    state type and the state and emitting the appropriate signals when these
    change. The implementor is responsible for filtering calls to
    [gio.action.Action.activate] and [gio.action.Action.changeState]
    for type safety and for the state being enabled.
    
    Probably the only useful thing to do with a [gio.action.Action] is to put it
    inside of a [gio.simple_action_group.SimpleActionGroup].
*/
struct GAction;

/**
    This struct defines a single action.  It is for use with
    [gio.action_map.ActionMap.addActionEntries].
    
    The order of the items in the structure are intended to reflect
    frequency of use.  It is permissible to use an incomplete initialiser
    in order to leave some of the later values as null.  All values
    after @name are optional.  Additional optional fields may be added in
    the future.
    
    See [gio.action_map.ActionMap.addActionEntries] for an example.
*/
struct GActionEntry
{
  /**
      the name of the action
  */
  const(char)* name;

  /**
      the callback to connect to the "activate" signal of the
                 action.  Since GLib 2.40, this can be null for stateful
                 actions, in which case the default handler is used.  For
                 boolean-stated actions with no parameter, this is a
                 toggle.  For other state types (and parameter type equal
                 to the state type) this will be a function that
                 just calls @change_state (which you should provide).
  */
  extern(C) void function(GSimpleAction* action, GVariant* parameter, void* userData) activate;

  /**
      the type of the parameter that must be passed to the
                       activate function for this action, given as a single
                       GVariant type string (or null for no parameter)
  */
  const(char)* parameterType;

  /**
      the initial state for this action, given in
              [GVariant text format][gvariant-text].  The state is parsed
              with no extra type information, so type tags must be added to
              the string if they are necessary.  Stateless actions should
              give null here.
  */
  const(char)* state;

  /**
      the callback to connect to the "change-state" signal
                     of the action.  All stateful actions should provide a
                     handler here; stateless actions should not.
  */
  extern(C) void function(GSimpleAction* action, GVariant* value, void* userData) changeState;

  /** */
  size_t[3] padding;
}

/**
    [gio.action_group.ActionGroup] represents a group of actions.
    
    Actions can be used to expose functionality in a structured way, either
    from one part of a program to another, or to the outside world. Action
    groups are often used together with a [gio.menu_model.MenuModel] that provides additional
    representation data for displaying the actions to the user, e.g. in a menu.
    
    The main way to interact with the actions in a [gio.action_group.ActionGroup] is to
    activate them with [gio.action_group.ActionGroup.activateAction]. Activating an
    action may require a [glib.variant.Variant] parameter. The required type of the
    parameter can be inquired with [gio.action_group.ActionGroup.getActionParameterType].
    Actions may be disabled, see [gio.action_group.ActionGroup.getActionEnabled].
    Activating a disabled action has no effect.
    
    Actions may optionally have a state in the form of a #GVariant. The current
    state of an action can be inquired with [gio.action_group.ActionGroup.getActionState].
    Activating a stateful action may change its state, but it is also possible to
    set the state by calling [gio.action_group.ActionGroup.changeActionState].
    
    As typical example, consider a text editing application which has an
    option to change the current font to 'bold'. A good way to represent
    this would be a stateful action, with a boolean state. Activating the
    action would toggle the state.
    
    Each action in the group has a unique name (which is a string).  All
    method calls, except [gio.action_group.ActionGroup.listActions] take the name of
    an action as an argument.
    
    The [gio.action_group.ActionGroup] API is meant to be the 'public' API to the action
    group. The calls here are exactly the interaction that 'external
    forces' (eg: UI, incoming D-Bus messages, etc.) are supposed to have
    with actions. 'Internal' APIs (ie: ones meant only to be accessed by
    the action group implementation) are found on subclasses. This is
    why you will find - for example - [gio.action_group.ActionGroup.getActionEnabled]
    but not an equivalent set() call.
    
    Signals are emitted on the action group in response to state changes
    on individual actions.
    
    Implementations of [gio.action_group.ActionGroup] should provide implementations for
    the virtual functions [gio.action_group.ActionGroup.listActions] and
    [gio.action_group.ActionGroup.queryAction]. The other virtual functions should
    not be implemented - their "wrappers" are actually implemented with
    calls to [gio.action_group.ActionGroup.queryAction].
*/
struct GActionGroup;

/**
    The virtual function table for #GActionGroup.
*/
struct GActionGroupInterface
{
  /** */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.hasAction]
  */
  extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName) hasAction;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.listActions]
  */
  extern(C) char** function(GActionGroup* actionGroup) listActions;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.getActionEnabled]
  */
  extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName) getActionEnabled;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.getActionParameterType]
  */
  extern(C) const(GVariantType)* function(GActionGroup* actionGroup, const(char)* actionName) getActionParameterType;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.getActionStateType]
  */
  extern(C) const(GVariantType)* function(GActionGroup* actionGroup, const(char)* actionName) getActionStateType;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.getActionStateHint]
  */
  extern(C) GVariant* function(GActionGroup* actionGroup, const(char)* actionName) getActionStateHint;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.getActionState]
  */
  extern(C) GVariant* function(GActionGroup* actionGroup, const(char)* actionName) getActionState;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.changeActionState]
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* value) changeActionState;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.activateAction]
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* parameter) activateAction;

  /**
      the class closure for the #GActionGroup::action-added signal
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName) actionAdded;

  /**
      the class closure for the #GActionGroup::action-removed signal
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName) actionRemoved;

  /**
      the class closure for the #GActionGroup::action-enabled-changed signal
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, gboolean enabled) actionEnabledChanged;

  /**
      the class closure for the #GActionGroup::action-enabled-changed signal
  */
  extern(C) void function(GActionGroup* actionGroup, const(char)* actionName, GVariant* state) actionStateChanged;

  /**
      the virtual function pointer for [gio.action_group.ActionGroup.queryAction]
  */
  extern(C) gboolean function(GActionGroup* actionGroup, const(char)* actionName, gboolean* enabled, const(GVariantType*)* parameterType, const(GVariantType*)* stateType, GVariant** stateHint, GVariant** state) queryAction;
}

/**
    The virtual function table for #GAction.
*/
struct GActionInterface
{
  /** */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.action.Action.getName]
  */
  extern(C) const(char)* function(GAction* action) getName;

  /**
      the virtual function pointer for [gio.action.Action.getParameterType]
  */
  extern(C) const(GVariantType)* function(GAction* action) getParameterType;

  /**
      the virtual function pointer for [gio.action.Action.getStateType]
  */
  extern(C) const(GVariantType)* function(GAction* action) getStateType;

  /**
      the virtual function pointer for [gio.action.Action.getStateHint]
  */
  extern(C) GVariant* function(GAction* action) getStateHint;

  /**
      the virtual function pointer for [gio.action.Action.getEnabled]
  */
  extern(C) gboolean function(GAction* action) getEnabled;

  /**
      the virtual function pointer for [gio.action.Action.getState]
  */
  extern(C) GVariant* function(GAction* action) getState;

  /**
      the virtual function pointer for [gio.action.Action.changeState]
  */
  extern(C) void function(GAction* action, GVariant* value) changeState;

  /**
      the virtual function pointer for [gio.action.Action.activate].  Note that #GAction does not have an
                 'activate' signal but that implementations of it may have one.
  */
  extern(C) void function(GAction* action, GVariant* parameter) activate;
}

/**
    [gio.action_map.ActionMap] is an interface for action containers.
    
    The [gio.action_map.ActionMap] interface is implemented by [gio.action_group.ActionGroup]
    implementations that operate by containing a number of named
    [gio.action.Action] instances, such as [gio.simple_action_group.SimpleActionGroup].
    
    One useful application of this interface is to map the
    names of actions from various action groups to unique,
    prefixed names (e.g. by prepending "app." or "win.").
    This is the motivation for the 'Map' part of the interface
    name.
*/
struct GActionMap;

/**
    The virtual function table for #GActionMap.
*/
struct GActionMapInterface
{
  /** */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.action_map.ActionMap.lookupAction]
  */
  extern(C) GAction* function(GActionMap* actionMap, const(char)* actionName) lookupAction;

  /**
      the virtual function pointer for [gio.action_map.ActionMap.addAction]
  */
  extern(C) void function(GActionMap* actionMap, GAction* action) addAction;

  /**
      the virtual function pointer for [gio.action_map.ActionMap.removeAction]
  */
  extern(C) void function(GActionMap* actionMap, const(char)* actionName) removeAction;
}

/**
    Information about an installed application and methods to launch
    it (with file arguments).
    
    [gio.app_info.AppInfo] and [gio.app_launch_context.AppLaunchContext] are used for describing and launching
    applications installed on the system.
    
    As of GLib 2.20, URIs will always be converted to POSIX paths
    (using [gio.file.File.getPath]) when using [gio.app_info.AppInfo.launch]
    even if the application requested an URI and not a POSIX path. For example
    for a desktop-file based application with Exec key `totem
    `U`` and a single URI, `sftp://foo/file.avi`, then
    `/home/user/.gvfs/sftp on foo/file.avi` will be passed. This will
    only work if a set of suitable GIO extensions (such as GVfs 2.26
    compiled with FUSE support), is available and operational; if this
    is not the case, the URI will be passed unmodified to the application.
    Some URIs, such as `mailto:`, of course cannot be mapped to a POSIX
    path (in GVfs there's no FUSE mount for it); such URIs will be
    passed unmodified to the application.
    
    Specifically for GVfs 2.26 and later, the POSIX URI will be mapped
    back to the GIO URI in the [gio.file.File] constructors (since GVfs
    implements the GVfs extension point). As such, if the application
    needs to examine the URI, it needs to use [gio.file.File.getUri]
    or similar on [gio.file.File]. In other words, an application cannot
    assume that the URI passed to e.g. [gio.file.File.newForCommandlineArg]
    is equal to the result of [gio.file.File.getUri]. The following snippet
    illustrates this:
    
    ```c
    GFile *f;
    char *uri;
    
    file = g_file_new_for_commandline_arg (uri_from_commandline);
    
    uri = g_file_get_uri (file);
    strcmp (uri, uri_from_commandline) == 0;
    g_free (uri);
    
    if (g_file_has_uri_scheme (file, "cdda"))
      {
        // do something special with uri
      }
    g_object_unref (file);
    ```
    
    This code will work when both `cdda://sr0/Track 1.wav` and
    `/home/user/.gvfs/cdda on sr0/Track 1.wav` is passed to the
    application. It should be noted that it's generally not safe
    for applications to rely on the format of a particular URIs.
    Different launcher applications (e.g. file managers) may have
    different ideas of what a given URI means.
*/
struct GAppInfo;

/**
    Application Information interface, for operating system portability.
*/
struct GAppInfoIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Copies a #GAppInfo.
  */
  extern(C) GAppInfo* function(GAppInfo* appinfo) dup;

  /**
      Checks two #GAppInfos for equality.
  */
  extern(C) gboolean function(GAppInfo* appinfo1, GAppInfo* appinfo2) equal;

  /**
      Gets a string identifier for a #GAppInfo.
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getId;

  /**
      Gets the name of the application for a #GAppInfo.
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getName;

  /**
      Gets a short description for the application described by the #GAppInfo.
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getDescription;

  /**
      Gets the executable name for the #GAppInfo.
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getExecutable;

  /**
      Gets the #GIcon for the #GAppInfo.
  */
  extern(C) GIcon* function(GAppInfo* appinfo) getIcon;

  /**
      Launches an application specified by the #GAppInfo.
  */
  extern(C) gboolean function(GAppInfo* appinfo, GList* files, GAppLaunchContext* context, GError** _err) launch;

  /**
      Indicates whether the application specified supports launching URIs.
  */
  extern(C) gboolean function(GAppInfo* appinfo) supportsUris;

  /**
      Indicates whether the application specified accepts filename arguments.
  */
  extern(C) gboolean function(GAppInfo* appinfo) supportsFiles;

  /**
      Launches an application with a list of URIs.
  */
  extern(C) gboolean function(GAppInfo* appinfo, GList* uris, GAppLaunchContext* context, GError** _err) launchUris;

  /**
      Returns whether an application should be shown (e.g. when getting a list of installed applications).
      [FreeDesktop.Org Startup Notification Specification](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
  */
  extern(C) gboolean function(GAppInfo* appinfo) shouldShow;

  /**
      Sets an application as default for a given content type.
  */
  extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) setAsDefaultForType;

  /**
      Sets an application as default for a given file extension.
  */
  extern(C) gboolean function(GAppInfo* appinfo, const(char)* extension, GError** _err) setAsDefaultForExtension;

  /**
      Adds to the #GAppInfo information about supported file types.
  */
  extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) addSupportsType;

  /**
      Checks for support for removing supported file types from a #GAppInfo.
  */
  extern(C) gboolean function(GAppInfo* appinfo) canRemoveSupportsType;

  /**
      Removes a supported application type from a #GAppInfo.
  */
  extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) removeSupportsType;

  /**
      Checks if a #GAppInfo can be deleted. Since 2.20
  */
  extern(C) gboolean function(GAppInfo* appinfo) canDelete;

  /**
      Deletes a #GAppInfo. Since 2.20
  */
  extern(C) gboolean function(GAppInfo* appinfo) doDelete;

  /**
      Gets the commandline for the #GAppInfo. Since 2.20
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getCommandline;

  /**
      Gets the display name for the #GAppInfo. Since 2.24
  */
  extern(C) const(char)* function(GAppInfo* appinfo) getDisplayName;

  /**
      Sets the application as the last used. See [gio.app_info.AppInfo.setAsLastUsedForType].
  */
  extern(C) gboolean function(GAppInfo* appinfo, const(char)* contentType, GError** _err) setAsLastUsedForType;

  /**
      Retrieves the list of content types that @app_info claims to support.
  */
  extern(C) const(char*)* function(GAppInfo* appinfo) getSupportedTypes;

  /**
      Asynchronously launches an application with a list of URIs. (Since: 2.60)
  */
  extern(C) void function(GAppInfo* appinfo, GList* uris, GAppLaunchContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) launchUrisAsync;

  /**
      Finishes an operation started with @launch_uris_async. (Since: 2.60)
  */
  extern(C) gboolean function(GAppInfo* appinfo, GAsyncResult* result, GError** _err) launchUrisFinish;
}

/**
    [gio.app_info_monitor.AppInfoMonitor] monitors application information for changes.
    
    [gio.app_info_monitor.AppInfoMonitor] is a very simple object used for monitoring the app
    info database for changes (newly installed or removed applications).
    
    Call [gio.app_info_monitor.AppInfoMonitor.get] to get a [gio.app_info_monitor.AppInfoMonitor] and connect
    to the [gio.app_info_monitor.AppInfoMonitor.changed] signal. The signal will be emitted once when
    the app info database changes, and will not be emitted again until after the
    next call to [gio.app_info.AppInfo.getAll] or another `g_app_info_*()` function.
    This is because monitoring the app info database for changes is expensive.
    
    The following functions will re-arm the [gio.app_info_monitor.AppInfoMonitor.changed]
    signal so it can be emitted again:
    
     $(LIST
        * [gio.app_info.AppInfo.getAll]
        * [gio.app_info.AppInfo.getAllForType]
        * [gio.app_info.AppInfo.getDefaultForType]
        * [gio.app_info.AppInfo.getFallbackForType]
        * [gio.app_info.AppInfo.getRecommendedForType]
        * [`[gio.desktop_app_info.DesktopAppInfo.getImplementations]`](../gio-unix/type_func.DesktopAppInfo.get_implementation.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.new_]`](../gio-unix/ctor.DesktopAppInfo.new.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.newFromFilename]`](../gio-unix/ctor.DesktopAppInfo.new_from_filename.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.newFromKeyfile]`](../gio-unix/ctor.DesktopAppInfo.new_from_keyfile.html)
        * [`[gio.desktop_app_info.DesktopAppInfo.search]`](../gio-unix/type_func.DesktopAppInfo.search.html)
     )
       
    The latter functions are available if using
    [[gio.desktop_app_info.DesktopAppInfo]](../gio-unix/class.DesktopAppInfo.html) from
    `gio-unix-2.0.pc` (GIR namespace `GioUnix-2.0`).
    
    In the usual case, applications should try to make note of the change
    (doing things like invalidating caches) but not act on it. In
    particular, applications should avoid making calls to [gio.app_info.AppInfo] APIs
    in response to the change signal, deferring these until the time that
    the updated data is actually required. The exception to this case is when
    application information is actually being displayed on the screen
    (for example, during a search or when the list of all applications is shown).
    The reason for this is that changes to the list of installed applications
    often come in groups (like during system updates) and rescanning the list
    on every change is pointless and expensive.
*/
struct GAppInfoMonitor;

/**
    Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window.
*/
struct GAppLaunchContext
{
  /** */
  GObject parentInstance;

  /** */
  GAppLaunchContextPrivate* priv;
}

/** */
struct GAppLaunchContextClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) char* function(GAppLaunchContext* context, GAppInfo* info, GList* files) getDisplay;

  /** */
  extern(C) char* function(GAppLaunchContext* context, GAppInfo* info, GList* files) getStartupNotifyId;

  /** */
  extern(C) void function(GAppLaunchContext* context, const(char)* startupNotifyId) launchFailed;

  /** */
  extern(C) void function(GAppLaunchContext* context, GAppInfo* info, GVariant* platformData) launched;

  /** */
  extern(C) void function(GAppLaunchContext* context, GAppInfo* info, GVariant* platformData) launchStarted;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;
}

/** */
struct GAppLaunchContextPrivate;

/**
    [gio.application.Application] is the core class for application support.
    
    A [gio.application.Application] is the foundation of an application. It wraps some
    low-level platform-specific services and is intended to act as the
    foundation for higher-level application classes such as
    [gtk.application.Application] or `MxApplication`. In general, you should not use
    this class outside of a higher level framework.
    
    [gio.application.Application] provides convenient life-cycle management by maintaining
    a "use count" for the primary application instance. The use count can
    be changed using [gio.application.Application.hold] and
    [gio.application.Application.release]. If it drops to zero, the application
    exits. Higher-level classes such as [gtk.application.Application] employ the use count
    to ensure that the application stays alive as long as it has any opened
    windows.
    
    Another feature that [gio.application.Application] (optionally) provides is process
    uniqueness. Applications can make use of this functionality by
    providing a unique application ID. If given, only one application
    with this ID can be running at a time per session. The session
    concept is platform-dependent, but corresponds roughly to a graphical
    desktop login. When your application is launched again, its
    arguments are passed through platform communication to the already
    running program. The already running instance of the program is
    called the "primary instance"; for non-unique applications this is
    always the current instance. On Linux, the D-Bus session bus
    is used for communication.
    
    The use of [gio.application.Application] differs from some other commonly-used
    uniqueness libraries (such as libunique) in important ways. The
    application is not expected to manually register itself and check
    if it is the primary instance. Instead, the main() function of a
    [gio.application.Application] should do very little more than instantiating the
    application instance, possibly connecting signal handlers, then
    calling [gio.application.Application.run]. All checks for uniqueness are done
    internally. If the application is the primary instance then the
    startup signal is emitted and the mainloop runs. If the application
    is not the primary instance then a signal is sent to the primary
    instance and [gio.application.Application.run] promptly returns. See the code
    examples below.
    
    If used, the expected form of an application identifier is the
    same as that of a
    [D-Bus well-known bus name](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
    Examples include: `com.example.MyApp`, `org.example.internal_apps.Calculator`,
    `org._7_zip.Archiver`.
    For details on valid application identifiers, see [gio.application.Application.idIsValid].
    
    On Linux, the application identifier is claimed as a well-known bus name
    on the user's session bus. This means that the uniqueness of your
    application is scoped to the current session. It also means that your
    application may provide additional services (through registration of other
    object paths) at that bus name. The registration of these object paths
    should be done with the shared GDBus session bus. Note that due to the
    internal architecture of GDBus, method calls can be dispatched at any time
    (even if a main loop is not running). For this reason, you must ensure that
    any object paths that you wish to register are registered before #GApplication
    attempts to acquire the bus name of your application (which happens in
    [gio.application.Application.register]). Unfortunately, this means that you cannot
    use `property@Gio.Application:is-remote` to decide if you want to register
    object paths.
    
    [gio.application.Application] also implements the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap]
    interfaces and lets you easily export actions by adding them with
    [gio.action_map.ActionMap.addAction]. When invoking an action by calling
    [gio.action_group.ActionGroup.activateAction] on the application, it is always
    invoked in the primary instance. The actions are also exported on
    the session bus, and GIO provides the [gio.dbus_action_group.DBusActionGroup] wrapper to
    conveniently access them remotely. GIO provides a [gio.dbus_menu_model.DBusMenuModel] wrapper
    for remote access to exported [gio.menu_model.MenuModel]s.
    
    Note: Due to the fact that actions are exported on the session bus,
    using `maybe` parameters is not supported, since D-Bus does not support
    `maybe` types.
    
    There is a number of different entry points into a [gio.application.Application]:
    
    $(LIST
      * via 'Activate' (i.e. just starting the application)
      
      * via 'Open' (i.e. opening some files)
      
      * by handling a command-line
      
      * via activating an action
    )
      
    The [gio.application.Application.startup] signal lets you handle the application
    initialization for all of these in a single place.
    
    Regardless of which of these entry points is used to start the
    application, [gio.application.Application] passes some ‘platform data’ from the
    launching instance to the primary instance, in the form of a
    [glib.variant.Variant] dictionary mapping strings to variants. To use platform
    data, override the `vfunc@Gio.Application.before_emit` or
    `vfunc@Gio.Application.after_emit` virtual functions
    in your [gio.application.Application] subclass. When dealing with
    [gio.application_command_line.ApplicationCommandLine] objects, the platform data is
    directly available via [gio.application_command_line.ApplicationCommandLine.getCwd],
    [gio.application_command_line.ApplicationCommandLine.getEnviron] and
    [gio.application_command_line.ApplicationCommandLine.getPlatformData].
    
    As the name indicates, the platform data may vary depending on the
    operating system, but it always includes the current directory (key
    `cwd`), and optionally the environment (ie the set of environment
    variables and their values) of the calling process (key `environ`).
    The environment is only added to the platform data if the
    [gio.types.ApplicationFlags.SendEnvironment] flag is set. [gio.application.Application] subclasses
    can add their own platform data by overriding the
    `vfunc@Gio.Application.add_platform_data` virtual function. For instance,
    [gtk.application.Application] adds startup notification data in this way.
    
    To parse commandline arguments you may handle the
    `signal@Gio.Application::command-line` signal or override the
    `vfunc@Gio.Application.local_command_line` virtual funcion, to parse them in
    either the primary instance or the local instance, respectively.
    
    For an example of opening files with a [gio.application.Application], see
    [gapplication-example-open.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-open.c).
    
    For an example of using actions with [gio.application.Application], see
    [gapplication-example-actions.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-actions.c).
    
    For an example of using extra D-Bus hooks with [gio.application.Application], see
    [gapplication-example-dbushooks.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c).
*/
struct GApplication
{
  /** */
  GObject parentInstance;

  /** */
  GApplicationPrivate* priv;
}

/**
    Virtual function table for #GApplication.
*/
struct GApplicationClass
{
  /** */
  GObjectClass parentClass;

  /**
      invoked on the primary instance immediately after registration
  */
  extern(C) void function(GApplication* application) startup;

  /**
      invoked on the primary instance when an activation occurs
  */
  extern(C) void function(GApplication* application) activate;

  /**
      invoked on the primary instance when there are files to open
  */
  extern(C) void function(GApplication* application, GFile** files, int nFiles, const(char)* hint) open;

  /**
      invoked on the primary instance when a command-line is
        not handled locally
  */
  extern(C) int function(GApplication* application, GApplicationCommandLine* commandLine) commandLine;

  /**
      invoked (locally). The virtual function has the chance
          to inspect (and possibly replace) command line arguments. See
          [gio.application.Application.run] for more information. Also see the
          #GApplication::handle-local-options signal, which is a simpler
          alternative to handling some commandline options locally
  */
  extern(C) gboolean function(GApplication* application, char*** arguments, int* exitStatus) localCommandLine;

  /**
      invoked on the primary instance before 'activate', 'open',
          'command-line' or any action invocation, gets the 'platform data' from
          the calling instance
  */
  extern(C) void function(GApplication* application, GVariant* platformData) beforeEmit;

  /**
      invoked on the primary instance after 'activate', 'open',
          'command-line' or any action invocation, gets the 'platform data' from
          the calling instance
  */
  extern(C) void function(GApplication* application, GVariant* platformData) afterEmit;

  /**
      invoked (locally) to add 'platform data' to be sent to
          the primary instance when activating, opening or invoking actions
  */
  extern(C) void function(GApplication* application, GVariantBuilder* builder) addPlatformData;

  /**
      Used to be invoked on the primary instance when the use
          count of the application drops to zero (and after any inactivity
          timeout, if requested). Not used anymore since 2.32
  */
  extern(C) void function(GApplication* application) quitMainloop;

  /**
      Used to be invoked on the primary instance from
          [gio.application.Application.run] if the use-count is non-zero. Since 2.32,
          GApplication is iterating the main context directly and is not
          using @run_mainloop anymore
  */
  extern(C) void function(GApplication* application) runMainloop;

  /**
      invoked only on the registered primary instance immediately
           after the main loop terminates
  */
  extern(C) void function(GApplication* application) shutdown;

  /**
      invoked locally during registration, if the application is
          using its D-Bus backend. You can use this to export extra objects on the
          bus, that need to exist before the application tries to own the bus name.
          The function is passed the #GDBusConnection to to session bus, and the
          object path that #GApplication will use to export its D-Bus API.
          If this function returns true, registration will proceed; otherwise
          registration will abort. Since: 2.34
  */
  extern(C) gboolean function(GApplication* application, GDBusConnection* connection, const(char)* objectPath, GError** _err) dbusRegister;

  /**
      invoked locally during unregistration, if the application
          is using its D-Bus backend. Use this to undo anything done by
          the @dbus_register vfunc. Since: 2.34
  */
  extern(C) void function(GApplication* application, GDBusConnection* connection, const(char)* objectPath) dbusUnregister;

  /**
      invoked locally after the parsing of the commandline
       options has occurred. Since: 2.40
  */
  extern(C) int function(GApplication* application, GVariantDict* options) handleLocalOptions;

  /**
      invoked when another instance is taking over the name. Since: 2.60
  */
  extern(C) gboolean function(GApplication* application) nameLost;

  /** */
  void*[7] padding;
}

/**
    [gio.application_command_line.ApplicationCommandLine] represents a command-line invocation of
    an application.
    
    It is created by [gio.application.Application] and emitted
    in the `signal@Gio.Application::command-line` signal and virtual function.
    
    The class contains the list of arguments that the program was invoked
    with. It is also possible to query if the commandline invocation was
    local (ie: the current process is running in direct response to the
    invocation) or remote (ie: some other process forwarded the
    commandline to this process).
    
    The [gio.application_command_line.ApplicationCommandLine] object can provide the @argc and @argv
    parameters for use with the [glib.option_context.OptionContext] command-line parsing API,
    with the [gio.application_command_line.ApplicationCommandLine.getArguments] function. See
    [gapplication-example-cmdline3.c][gapplication-example-cmdline3]
    for an example.
    
    The exit status of the originally-invoked process may be set and
    messages can be printed to stdout or stderr of that process.
    
    For remote invocation, the originally-invoked process exits when
    [gio.application_command_line.ApplicationCommandLine.done] method is called. This method is
    also automatically called when the object is disposed.
    
    The main use for [gio.application_command_line.ApplicationCommandLine] (and the
    `signal@Gio.Application::command-line` signal) is 'Emacs server' like use cases:
    You can set the `EDITOR` environment variable to have e.g. git use
    your favourite editor to edit commit messages, and if you already
    have an instance of the editor running, the editing will happen
    in the running instance, instead of opening a new one. An important
    aspect of this use case is that the process that gets started by git
    does not return until the editing is done.
    
    Normally, the commandline is completely handled in the
    `signal@Gio.Application::command-line` handler. The launching instance exits
    once the signal handler in the primary instance has returned, and
    the return value of the signal handler becomes the exit status
    of the launching instance.
    
    ```c
    static int
    command_line (GApplication            *application,
                  GApplicationCommandLine *cmdline)
    {
      gchar **argv;
      gint argc;
      gint i;
    
      argv = g_application_command_line_get_arguments (cmdline, &argc);
    
      g_application_command_line_print (cmdline,
                                        "This text is written back\n"
                                        "to stdout of the caller\n");
    
      for (i = 0; i < argc; i++)
        g_print ("argument %d: %s\n", i, argv[i]);
    
      g_strfreev (argv);
    
      return 0;
    }
    ```
    
    The complete example can be found here:
    [gapplication-example-cmdline.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline.c)
    
    In more complicated cases, the handling of the commandline can be
    split between the launcher and the primary instance.
    
    ```c
    static gboolean
     test_local_cmdline (GApplication   *application,
                         gchar        ***arguments,
                         gint           *exit_status)
    {
      gint i, j;
      gchar **argv;
    
      argv = *arguments;
    
      if (argv[0] == NULL)
        {
          *exit_status = 0;
          return FALSE;
        }
    
      i = 1;
      while (argv[i])
        {
          if (g_str_has_prefix (argv[i], "--local-"))
            {
              g_print ("handling argument %s locally\n", argv[i]);
              g_free (argv[i]);
              for (j = i; argv[j]; j++)
                argv[j] = argv[j + 1];
            }
          else
            {
              g_print ("not handling argument %s locally\n", argv[i]);
              i++;
            }
        }
    
      *exit_status = 0;
    
      return FALSE;
    }
    
    static void
    test_application_class_init (TestApplicationClass *class)
    {
      G_APPLICATION_CLASS (class)->local_command_line = test_local_cmdline;
    
      ...
    }
    ```
    
    In this example of split commandline handling, options that start
    with `--local-` are handled locally, all other options are passed
    to the `signal@Gio.Application::command-line` handler which runs in the primary
    instance.
    
    The complete example can be found here:
    [gapplication-example-cmdline2.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c)
    
    If handling the commandline requires a lot of work, it may be better to defer it.
    
    ```c
    static gboolean
    my_cmdline_handler (gpointer data)
    {
      GApplicationCommandLine *cmdline = data;
    
      // do the heavy lifting in an idle
    
      g_application_command_line_set_exit_status (cmdline, 0);
      g_object_unref (cmdline); // this releases the application
    
      return G_SOURCE_REMOVE;
    }
    
    static int
    command_line (GApplication            *application,
                  GApplicationCommandLine *cmdline)
    {
      // keep the application running until we are done with this commandline
      g_application_hold (application);
    
      g_object_set_data_full (G_OBJECT (cmdline),
                              "application", application,
                              (GDestroyNotify)g_application_release);
    
      g_object_ref (cmdline);
      g_idle_add (my_cmdline_handler, cmdline);
    
      return 0;
    }
    ```
    
    In this example the commandline is not completely handled before
    the `signal@Gio.Application::command-line` handler returns. Instead, we keep
    a reference to the [gio.application_command_line.ApplicationCommandLine] object and handle it
    later (in this example, in an idle). Note that it is necessary to
    hold the application until you are done with the commandline.
    
    The complete example can be found here:
    [gapplication-example-cmdline3.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline3.c)
*/
struct GApplicationCommandLine
{
  /** */
  GObject parentInstance;

  /** */
  GApplicationCommandLinePrivate* priv;
}

/**
    The #GApplicationCommandLineClass-struct
    contains private data only.
*/
struct GApplicationCommandLineClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GApplicationCommandLine* cmdline, const(char)* message) printLiteral;

  /** */
  extern(C) void function(GApplicationCommandLine* cmdline, const(char)* message) printerrLiteral;

  /** */
  extern(C) GInputStream* function(GApplicationCommandLine* cmdline) getStdin;

  /** */
  extern(C) void function(GApplicationCommandLine* cmdline) done;

  /** */
  void*[10] padding;
}

/** */
struct GApplicationCommandLinePrivate;

/** */
struct GApplicationPrivate;

/**
    [gio.async_initable.AsyncInitable] is an interface for asynchronously initializable objects.
    
    This is the asynchronous version of [gio.initable.Initable]; it behaves the same
    in all ways except that initialization is asynchronous. For more details
    see the descriptions on [gio.initable.Initable].
    
    A class may implement both the [gio.initable.Initable] and [gio.async_initable.AsyncInitable] interfaces.
    
    Users of objects implementing this are not intended to use the interface
    method directly; instead it will be used automatically in various ways.
    For C applications you generally just call [gio.async_initable.AsyncInitable.newAsync]
    directly, or indirectly via a foo_thing_new_async() wrapper. This will call
    [gio.async_initable.AsyncInitable.initAsync] under the covers, calling back with `NULL`
    and a set [glib.error.ErrorWrap] on failure.
    
    A typical implementation might look something like this:
    
    ```c
    enum {
       NOT_INITIALIZED,
       INITIALIZING,
       INITIALIZED
    };
    
    static void
    _foo_ready_cb (Foo *self)
    {
      GList *l;
    
      self->priv->state = INITIALIZED;
    
      for (l = self->priv->init_results; l != NULL; l = l->next)
        {
          GTask *task = l->data;
    
          if (self->priv->success)
            g_task_return_boolean (task, TRUE);
          else
            g_task_return_new_error (task, ...);
          g_object_unref (task);
        }
    
      g_list_free (self->priv->init_results);
      self->priv->init_results = NULL;
    }
    
    static void
    foo_init_async (GAsyncInitable       *initable,
                    int                   io_priority,
                    GCancellable         *cancellable,
                    GAsyncReadyCallback   callback,
                    gpointer              user_data)
    {
      Foo *self = FOO (initable);
      GTask *task;
    
      task = g_task_new (initable, cancellable, callback, user_data);
      g_task_set_name (task, G_STRFUNC);
    
      switch (self->priv->state)
        {
          case NOT_INITIALIZED:
            _foo_get_ready (self);
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            self->priv->state = INITIALIZING;
            break;
          case INITIALIZING:
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            break;
          case INITIALIZED:
            if (!self->priv->success)
              g_task_return_new_error (task, ...);
            else
              g_task_return_boolean (task, TRUE);
            g_object_unref (task);
            break;
        }
    }
    
    static gboolean
    foo_init_finish (GAsyncInitable       *initable,
                     GAsyncResult         *result,
                     GError              **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, initable), FALSE);
    
      return g_task_propagate_boolean (G_TASK (result), error);
    }
    
    static void
    foo_async_initable_iface_init (gpointer g_iface,
                                   gpointer data)
    {
      GAsyncInitableIface *iface = g_iface;
    
      iface->init_async = foo_init_async;
      iface->init_finish = foo_init_finish;
    }
    ```
*/
struct GAsyncInitable;

/**
    Provides an interface for asynchronous initializing object such that
    initialization may fail.
*/
struct GAsyncInitableIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Starts initialization of the object.
  */
  extern(C) void function(GAsyncInitable* initable, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) initAsync;

  /**
      Finishes initialization of the object.
  */
  extern(C) gboolean function(GAsyncInitable* initable, GAsyncResult* res, GError** _err) initFinish;
}

/**
    [gio.async_result.AsyncResult] provides a base class for implementing asynchronous function results.
    
    Asynchronous operations are broken up into two separate operations
    which are chained together by a [gio.types.AsyncReadyCallback]. To begin
    an asynchronous operation, provide a [gio.types.AsyncReadyCallback] to the
    asynchronous function. This callback will be triggered when the
    operation has completed, and must be run in a later iteration of
    the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) from where the operation was
    initiated. It will be passed a [gio.async_result.AsyncResult] instance filled with the
    details of the operation's success or failure, the object the asynchronous
    function was started for and any error codes returned. The asynchronous
    callback function is then expected to call the corresponding `_finish()`
    function, passing the object the function was called for, the
    [gio.async_result.AsyncResult] instance, and (optionally) an @error to grab any
    error conditions that may have occurred.
    
    The `_finish()` function for an operation takes the generic result
    (of type [gio.async_result.AsyncResult]) and returns the specific result that the
    operation in question yields (e.g. a [gio.file_enumerator.FileEnumerator] for a
    "enumerate children" operation). If the result or error status of the
    operation is not needed, there is no need to call the `_finish()`
    function; GIO will take care of cleaning up the result and error
    information after the [gio.types.AsyncReadyCallback] returns. You can pass
    `NULL` for the [gio.types.AsyncReadyCallback] if you don't need to take any
    action at all after the operation completes. Applications may also
    take a reference to the [gio.async_result.AsyncResult] and call `_finish()` later;
    however, the `_finish()` function may be called at most once.
    
    Example of a typical asynchronous operation flow:
    
    ```c
    void _theoretical_frobnitz_async (Theoretical         *t,
                                      GCancellable        *c,
                                      GAsyncReadyCallback  cb,
                                      gpointer             u);
    
    gboolean _theoretical_frobnitz_finish (Theoretical   *t,
                                           GAsyncResult  *res,
                                           GError       **e);
    
    static void
    frobnitz_result_func (GObject      *source_object,
    		 GAsyncResult *res,
    		 gpointer      user_data)
    {
      gboolean success = FALSE;
    
      success = _theoretical_frobnitz_finish (source_object, res, NULL);
    
      if (success)
        g_printf ("Hurray!\n");
      else
        g_printf ("Uh oh!\n");
    
      ...
    
    }
    
    int main (int argc, void *argv[])
    {
       ...
    
       _theoretical_frobnitz_async (theoretical_data,
                                    NULL,
                                    frobnitz_result_func,
                                    NULL);
    
       ...
    }
    ```
    
    The callback for an asynchronous operation is called only once, and is
    always called, even in the case of a cancelled operation. On cancellation
    the result is a [gio.types.IOErrorEnum.Cancelled] error.
    
    ## I/O Priority
    
    Many I/O-related asynchronous operations have a priority parameter,
    which is used in certain cases to determine the order in which
    operations are executed. They are not used to determine system-wide
    I/O scheduling. Priorities are integers, with lower numbers indicating
    higher priority. It is recommended to choose priorities between
    [glib.types.PRIORITY_LOW] and [glib.types.PRIORITY_HIGH], with [glib.types.PRIORITY_DEFAULT]
    as a default.
*/
struct GAsyncResult;

/**
    Interface definition for #GAsyncResult.
*/
struct GAsyncResultIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Gets the user data passed to the callback.
  */
  extern(C) void* function(GAsyncResult* res) getUserData;

  /**
      Gets the source object that issued the asynchronous operation.
  */
  extern(C) GObject* function(GAsyncResult* res) getSourceObject;

  /**
      Checks if a result is tagged with a particular source.
  */
  extern(C) gboolean function(GAsyncResult* res, void* sourceTag) isTagged;
}

/**
    Buffered input stream implements #GFilterInputStream and provides
    for buffered reads.
    
    By default, [gio.buffered_input_stream.BufferedInputStream]'s buffer size is set at 4 kilobytes.
    
    To create a buffered input stream, use [gio.buffered_input_stream.BufferedInputStream.new_],
    or [gio.buffered_input_stream.BufferedInputStream.newSized] to specify the buffer's size at
    construction.
    
    To get the size of a buffer within a buffered input stream, use
    [gio.buffered_input_stream.BufferedInputStream.getBufferSize]. To change the size of a
    buffered input stream's buffer, use [gio.buffered_input_stream.BufferedInputStream.setBufferSize].
    Note that the buffer's size cannot be reduced below the size of the data within the buffer.
*/
struct GBufferedInputStream
{
  /** */
  GFilterInputStream parentInstance;

  /** */
  GBufferedInputStreamPrivate* priv;
}

/** */
struct GBufferedInputStreamClass
{
  /** */
  GFilterInputStreamClass parentClass;

  /** */
  extern(C) ptrdiff_t function(GBufferedInputStream* stream, ptrdiff_t count, GCancellable* cancellable, GError** _err) fill;

  /** */
  extern(C) void function(GBufferedInputStream* stream, ptrdiff_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) fillAsync;

  /** */
  extern(C) ptrdiff_t function(GBufferedInputStream* stream, GAsyncResult* result, GError** _err) fillFinish;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GBufferedInputStreamPrivate;

/**
    Buffered output stream implements [gio.filter_output_stream.FilterOutputStream] and provides
    for buffered writes.
    
    By default, [gio.buffered_output_stream.BufferedOutputStream]'s buffer size is set at 4 kilobytes.
    
    To create a buffered output stream, use [gio.buffered_output_stream.BufferedOutputStream.new_],
    or [gio.buffered_output_stream.BufferedOutputStream.newSized] to specify the buffer's size
    at construction.
    
    To get the size of a buffer within a buffered input stream, use
    [gio.buffered_output_stream.BufferedOutputStream.getBufferSize]. To change the size of a
    buffered output stream's buffer, use [gio.buffered_output_stream.BufferedOutputStream.setBufferSize].
    Note that the buffer's size cannot be reduced below the size of the data within the buffer.
*/
struct GBufferedOutputStream
{
  /** */
  GFilterOutputStream parentInstance;

  /** */
  GBufferedOutputStreamPrivate* priv;
}

/** */
struct GBufferedOutputStreamClass
{
  /** */
  GFilterOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;
}

/** */
struct GBufferedOutputStreamPrivate;

/**
    [gio.bytes_icon.BytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.
*/
struct GBytesIcon;

/**
    [gio.cancellable.Cancellable] allows operations to be cancelled.
    
    [gio.cancellable.Cancellable] is a thread-safe operation cancellation stack used
    throughout GIO to allow for cancellation of synchronous and
    asynchronous operations.
*/
struct GCancellable
{
  /** */
  GObject parentInstance;

  /** */
  GCancellablePrivate* priv;
}

/** */
struct GCancellableClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GCancellable* cancellable) cancelled;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GCancellablePrivate;

/**
    [gio.charset_converter.CharsetConverter] is an implementation of [gio.converter.Converter] based on
    [glib.types.void*].
*/
struct GCharsetConverter;

/** */
struct GCharsetConverterClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gio.converter.Converter] is an interface for streaming conversions.
    
    [gio.converter.Converter] is implemented by objects that convert
    binary data in various ways. The conversion can be
    stateful and may fail at any place.
    
    Some example conversions are: character set conversion,
    compression, decompression and regular expression
    replace.
*/
struct GConverter;

/**
    Provides an interface for converting data from one type
    to another type. The conversion can be stateful
    and may fail at any place.
*/
struct GConverterIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Converts data.
  */
  extern(C) GConverterResult function(GConverter* converter, void* inbuf, size_t inbufSize, void* outbuf, size_t outbufSize, GConverterFlags flags, size_t* bytesRead, size_t* bytesWritten, GError** _err) convert;

  /**
      Reverts the internal state of the converter to its initial state.
  */
  extern(C) void function(GConverter* converter) reset;
}

/**
    Converter input stream implements [gio.input_stream.InputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gio.converter_input_stream.ConverterInputStream] implements
    [gio.pollable_input_stream.PollableInputStream].
*/
struct GConverterInputStream
{
  /** */
  GFilterInputStream parentInstance;

  /** */
  GConverterInputStreamPrivate* priv;
}

/** */
struct GConverterInputStreamClass
{
  /** */
  GFilterInputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GConverterInputStreamPrivate;

/**
    Converter output stream implements [gio.output_stream.OutputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gio.converter_output_stream.ConverterOutputStream] implements
    [gio.pollable_output_stream.PollableOutputStream].
*/
struct GConverterOutputStream
{
  /** */
  GFilterOutputStream parentInstance;

  /** */
  GConverterOutputStreamPrivate* priv;
}

/** */
struct GConverterOutputStreamClass
{
  /** */
  GFilterOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GConverterOutputStreamPrivate;

/**
    The [gio.credentials.Credentials] type is a reference-counted wrapper for native
    credentials.
    
    The information in [gio.credentials.Credentials] is typically used for identifying,
    authenticating and authorizing other processes.
    
    Some operating systems supports looking up the credentials of the remote
    peer of a communication endpoint - see e.g. [gio.socket.Socket.getCredentials].
    
    Some operating systems supports securely sending and receiving
    credentials over a Unix Domain Socket, see [gio.unix_credentials_message.UnixCredentialsMessage],
    [gio.unix_connection.UnixConnection.sendCredentials] and
    [gio.unix_connection.UnixConnection.receiveCredentials] for details.
    
    On Linux, the native credential type is a `struct ucred` - see the
    [`unix(7)` man page](man:unix(7)) for details. This corresponds to
    [gio.types.CredentialsType.LinuxUcred].
    
    On Apple operating systems (including iOS, tvOS, and macOS), the native credential
    type is a `struct xucred`. This corresponds to [gio.types.CredentialsType.AppleXucred].
    
    On FreeBSD, Debian GNU/kFreeBSD, and GNU/Hurd, the native credential type is a
    `struct cmsgcred`. This corresponds to [gio.types.CredentialsType.FreebsdCmsgcred].
    
    On NetBSD, the native credential type is a `struct unpcbid`.
    This corresponds to [gio.types.CredentialsType.NetbsdUnpcbid].
    
    On OpenBSD, the native credential type is a `struct sockpeercred`.
    This corresponds to [gio.types.CredentialsType.OpenbsdSockpeercred].
    
    On Solaris (including OpenSolaris and its derivatives), the native credential type
    is a `ucred_t`. This corresponds to [gio.types.CredentialsType.SolarisUcred].
    
    Since GLib 2.72, on Windows, the native credentials may contain the PID of a
    process. This corresponds to [gio.types.CredentialsType.Win32Pid].
*/
struct GCredentials;

/**
    Class structure for #GCredentials.
*/
struct GCredentialsClass;

/**
    [gio.dbus_action_group.DBusActionGroup] is an implementation of the [gio.action_group.ActionGroup]
    interface.
    
    [gio.dbus_action_group.DBusActionGroup] can be used as a proxy for an action group
    that is exported over D-Bus with [gio.dbus_connection.DBusConnection.exportActionGroup].
*/
struct GDBusActionGroup;

/**
    Information about an annotation.
*/
struct GDBusAnnotationInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The name of the annotation, e.g. "org.freedesktop.DBus.Deprecated".
  */
  char* key;

  /**
      The value of the annotation.
  */
  char* value;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    Information about an argument for a method or a signal.
*/
struct GDBusArgInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      Name of the argument, e.g. @unix_user_id.
  */
  char* name;

  /**
      D-Bus signature of the argument (a single complete type).
  */
  char* signature;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    [gio.dbus_auth_observer.DBusAuthObserver] provides a mechanism for participating
    in how a [gio.dbus_server.DBusServer] (or a [gio.dbus_connection.DBusConnection])
    authenticates remote peers.
    
    Simply instantiate a [gio.dbus_auth_observer.DBusAuthObserver] and connect to the
    signals you are interested in. Note that new signals may be added
    in the future.
    
    ## Controlling Authentication Mechanisms
    
    By default, a [gio.dbus_server.DBusServer] or server-side [gio.dbus_connection.DBusConnection] will allow
    any authentication mechanism to be used. If you only want to allow D-Bus
    connections with the `EXTERNAL` mechanism, which makes use of credentials
    passing and is the recommended mechanism for modern Unix platforms such
    as Linux and the BSD family, you would use a signal handler like this:
    
    ```c
    static gboolean
    on_allow_mechanism (GDBusAuthObserver *observer,
                        const gchar       *mechanism,
                        gpointer           user_data)
    {
      if (g_strcmp0 (mechanism, "EXTERNAL") == 0)
        {
          return TRUE;
        }
    
      return FALSE;
    }
    ```
    
    ## Controlling Authorization
    
    By default, a [gio.dbus_server.DBusServer] or server-side [gio.dbus_connection.DBusConnection] will accept
    connections from any successfully authenticated user (but not from
    anonymous connections using the `ANONYMOUS` mechanism). If you only
    want to allow D-Bus connections from processes owned by the same uid
    as the server, since GLib 2.68, you should use the
    [gio.types.DBusServerFlags.AuthenticationRequireSameUser] flag. It’s equivalent
    to the following signal handler:
    
    ```c
    static gboolean
    on_authorize_authenticated_peer (GDBusAuthObserver *observer,
                                     GIOStream         *stream,
                                     GCredentials      *credentials,
                                     gpointer           user_data)
    {
      gboolean authorized;
    
      authorized = FALSE;
      if (credentials != NULL)
        {
          GCredentials *own_credentials;
          own_credentials = g_credentials_new ();
          if (g_credentials_is_same_user (credentials, own_credentials, NULL))
            authorized = TRUE;
          g_object_unref (own_credentials);
        }
    
      return authorized;
    }
    ```
*/
struct GDBusAuthObserver;

/**
    The [gio.dbus_connection.DBusConnection] type is used for D-Bus connections to remote
    peers such as a message buses.
    
    It is a low-level API that offers a lot of flexibility. For instance,
    it lets you establish a connection over any transport that can by represented
    as a [gio.iostream.IOStream].
    
    This class is rarely used directly in D-Bus clients. If you are writing
    a D-Bus client, it is often easier to use the `func@Gio.bus_own_name`,
    `func@Gio.bus_watch_name` or [gio.dbus_proxy.DBusProxy.newForBus] APIs.
    
    As an exception to the usual GLib rule that a particular object must not
    be used by two threads at the same time, [gio.dbus_connection.DBusConnection]s methods may be
    called from any thread. This is so that `func@Gio.bus_get` and
    `func@Gio.bus_get_sync` can safely return the same [gio.dbus_connection.DBusConnection] when
    called from any thread.
    
    Most of the ways to obtain a [gio.dbus_connection.DBusConnection] automatically initialize it
    (i.e. connect to D-Bus): for instance, [gio.dbus_connection.DBusConnection.new_] and
    `func@Gio.bus_get`, and the synchronous versions of those methods, give you
    an initialized connection. Language bindings for GIO should use
    [gio.initable.Initable.new_] or [gio.async_initable.AsyncInitable.newAsync], which also
    initialize the connection.
    
    If you construct an uninitialized [gio.dbus_connection.DBusConnection], such as via
    [gobject.object.ObjectWrap.new_], you must initialize it via [gio.initable.Initable.init_] or
    [gio.async_initable.AsyncInitable.initAsync] before using its methods or properties.
    Calling methods or accessing properties on a [gio.dbus_connection.DBusConnection] that has not
    completed initialization successfully is considered to be invalid, and leads
    to undefined behaviour. In particular, if initialization fails with a
    [glib.error.ErrorWrap], the only valid thing you can do with that [gio.dbus_connection.DBusConnection] is to
    free it with [gobject.object.ObjectWrap.unref].
    
    ## An example D-Bus server
    
    Here is an example for a D-Bus server:
    [gdbus-example-server.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-server.c)
    
    ## An example for exporting a subtree
    
    Here is an example for exporting a subtree:
    [gdbus-example-subtree.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-subtree.c)
    
    ## An example for file descriptor passing
    
    Here is an example for passing UNIX file descriptors:
    [gdbus-unix-fd-client.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-unix-fd-client.c)
    
    ## An example for exporting a GObject
    
    Here is an example for exporting a #GObject:
    [gdbus-example-export.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-export.c)
*/
struct GDBusConnection;

/**
    Struct used in [gio.global.dbusErrorRegisterErrorDomain].
*/
struct GDBusErrorEntry
{
  /**
      An error code.
  */
  int errorCode;

  /**
      The D-Bus error name to associate with @error_code.
  */
  const(char)* dbusErrorName;
}

/**
    Base type for D-Bus interfaces.
    
    The [gio.dbus_interface.DBusInterface] type is the base type for D-Bus interfaces both
    on the service side (see [gio.dbus_interface_skeleton.DBusInterfaceSkeleton]) and client side
    (see [gio.dbus_proxy.DBusProxy]).
*/
struct GDBusInterface;

/**
    Base type for D-Bus interfaces.
*/
struct GDBusInterfaceIface
{
  /**
      The parent interface.
  */
  GTypeInterface parentIface;

  /**
      Returns a #GDBusInterfaceInfo. See [gio.dbus_interface.DBusInterface.getInfo].
  */
  extern(C) GDBusInterfaceInfo* function(GDBusInterface* interface_) getInfo;

  /**
      Gets the enclosing #GDBusObject. See [gio.dbus_interface.DBusInterface.getObject].
  */
  extern(C) GDBusObject* function(GDBusInterface* interface_) getObject;

  /**
      Sets the enclosing #GDBusObject. See [gio.dbus_interface.DBusInterface.setObject].
  */
  extern(C) void function(GDBusInterface* interface_, GDBusObject* object) setObject;

  /**
      Gets a reference to the enclosing #GDBusObject. See [gio.dbus_interface.DBusInterface.dupObject]. Added in 2.32.
  */
  extern(C) GDBusObject* function(GDBusInterface* interface_) dupObject;
}

/**
    Information about a D-Bus interface.
*/
struct GDBusInterfaceInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The name of the D-Bus interface, e.g. "org.freedesktop.DBus.Properties".
  */
  char* name;

  /**
      A pointer to a null-terminated array of pointers to #GDBusMethodInfo structures or null if there are no methods.
  */
  GDBusMethodInfo** methods;

  /**
      A pointer to a null-terminated array of pointers to #GDBusSignalInfo structures or null if there are no signals.
  */
  GDBusSignalInfo** signals;

  /**
      A pointer to a null-terminated array of pointers to #GDBusPropertyInfo structures or null if there are no properties.
  */
  GDBusPropertyInfo** properties;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    Abstract base class for D-Bus interfaces on the service side.
*/
struct GDBusInterfaceSkeleton
{
  /** */
  GObject parentInstance;

  /** */
  GDBusInterfaceSkeletonPrivate* priv;
}

/**
    Class structure for #GDBusInterfaceSkeleton.
*/
struct GDBusInterfaceSkeletonClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Returns a #GDBusInterfaceInfo. See [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.getInfo] for details.
  */
  extern(C) GDBusInterfaceInfo* function(GDBusInterfaceSkeleton* interface_) getInfo;

  /**
      Returns a #GDBusInterfaceVTable. See [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.getVtable] for details.
  */
  extern(C) GDBusInterfaceVTable* function(GDBusInterfaceSkeleton* interface_) getVtable;

  /**
      Returns a #GVariant with all properties. See [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.getProperties].
  */
  extern(C) GVariant* function(GDBusInterfaceSkeleton* interface_) getProperties;

  /**
      Emits outstanding changes, if any. See [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.flush].
  */
  extern(C) void function(GDBusInterfaceSkeleton* interface_) flush;

  /** */
  void*[8] vfuncPadding;

  /**
      Signal class handler for the #GDBusInterfaceSkeleton::g-authorize-method signal.
  */
  extern(C) gboolean function(GDBusInterfaceSkeleton* interface_, GDBusMethodInvocation* invocation) gAuthorizeMethod;

  /** */
  void*[8] signalPadding;
}

/** */
struct GDBusInterfaceSkeletonPrivate;

/**
    Virtual table for handling properties and method calls for a D-Bus
    interface.
    
    Since 2.38, if you want to handle getting/setting D-Bus properties
    asynchronously, give null as your get_property() or set_property()
    function. The D-Bus call will be directed to your @method_call function,
    with the provided @interface_name set to "org.freedesktop.DBus.Properties".
    
    Ownership of the #GDBusMethodInvocation object passed to the
    method_call() function is transferred to your handler; you must
    call one of the methods of #GDBusMethodInvocation to return a reply
    (possibly empty), or an error. These functions also take ownership
    of the passed-in invocation object, so unless the invocation
    object has otherwise been referenced, it will be then be freed.
    Calling one of these functions may be done within your
    method_call() implementation but it also can be done at a later
    point to handle the method asynchronously.
    
    The usual checks on the validity of the calls is performed. For
    `Get` calls, an error is automatically returned if the property does
    not exist or the permissions do not allow access. The same checks are
    performed for `Set` calls, and the provided value is also checked for
    being the correct type.
    
    For both `Get` and `Set` calls, the #GDBusMethodInvocation
    passed to the @method_call handler can be queried with
    [gio.dbus_method_invocation.DBusMethodInvocation.getPropertyInfo] to get a pointer
    to the #GDBusPropertyInfo of the property.
    
    If you have readable properties specified in your interface info,
    you must ensure that you either provide a non-null @get_property()
    function or provide implementations of both the `Get` and `GetAll`
    methods on org.freedesktop.DBus.Properties interface in your @method_call
    function. Note that the required return type of the `Get` call is
    `(v)`, not the type of the property. `GetAll` expects a return value
    of type `a{sv}`.
    
    If you have writable properties specified in your interface info,
    you must ensure that you either provide a non-null @set_property()
    function or provide an implementation of the `Set` call. If implementing
    the call, you must return the value of type `G_VARIANT_TYPE_UNIT`.
*/
struct GDBusInterfaceVTable
{
  /**
      Function for handling incoming method calls.
  */
  GDBusInterfaceMethodCallFunc methodCall;

  /**
      Function for getting a property.
  */
  GDBusInterfaceGetPropertyFunc getProperty;

  /**
      Function for setting a property.
  */
  GDBusInterfaceSetPropertyFunc setProperty;

  /** */
  void*[8] padding;
}

/**
    [gio.dbus_menu_model.DBusMenuModel] is an implementation of [gio.menu_model.MenuModel] that can be
    used as a proxy for a menu model that is exported over D-Bus with
    [gio.dbus_connection.DBusConnection.exportMenuModel].
*/
struct GDBusMenuModel;

/**
    A type for representing D-Bus messages that can be sent or received
    on a [gio.dbus_connection.DBusConnection].
*/
struct GDBusMessage;

/**
    Information about a method on an D-Bus interface.
*/
struct GDBusMethodInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The name of the D-Bus method, e.g. @RequestName.
  */
  char* name;

  /**
      A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no in arguments.
  */
  GDBusArgInfo** inArgs;

  /**
      A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no out arguments.
  */
  GDBusArgInfo** outArgs;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    Instances of the [gio.dbus_method_invocation.DBusMethodInvocation] class are used when
    handling D-Bus method calls. It provides a way to asynchronously
    return results and errors.
    
    The normal way to obtain a [gio.dbus_method_invocation.DBusMethodInvocation] object is to receive
    it as an argument to the `handle_method_call()` function in a
    [gio.types.DBusInterfaceVTable] that was passed to
    [gio.dbus_connection.DBusConnection.registerObject].
*/
struct GDBusMethodInvocation;

/**
    Information about nodes in a remote object hierarchy.
*/
struct GDBusNodeInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The path of the node or null if omitted. Note that this may be a relative path. See the D-Bus specification for more details.
  */
  char* path;

  /**
      A pointer to a null-terminated array of pointers to #GDBusInterfaceInfo structures or null if there are no interfaces.
  */
  GDBusInterfaceInfo** interfaces;

  /**
      A pointer to a null-terminated array of pointers to #GDBusNodeInfo structures or null if there are no nodes.
  */
  GDBusNodeInfo** nodes;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    The [gio.dbus_object.DBusObject] type is the base type for D-Bus objects on both
    the service side (see [gio.dbus_object_skeleton.DBusObjectSkeleton]) and the client side
    (see [gio.dbus_object_proxy.DBusObjectProxy]). It is essentially just a container of
    interfaces.
*/
struct GDBusObject;

/**
    Base object type for D-Bus objects.
*/
struct GDBusObjectIface
{
  /**
      The parent interface.
  */
  GTypeInterface parentIface;

  /**
      Returns the object path. See [gio.dbus_object.DBusObject.getObjectPath].
  */
  extern(C) const(char)* function(GDBusObject* object) getObjectPath;

  /**
      Returns all interfaces. See [gio.dbus_object.DBusObject.getInterfaces].
  */
  extern(C) GList* function(GDBusObject* object) getInterfaces;

  /**
      Returns an interface by name. See [gio.dbus_object.DBusObject.getInterface].
  */
  extern(C) GDBusInterface* function(GDBusObject* object, const(char)* interfaceName) getInterface;

  /**
      Signal handler for the #GDBusObject::interface-added signal.
  */
  extern(C) void function(GDBusObject* object, GDBusInterface* interface_) interfaceAdded;

  /**
      Signal handler for the #GDBusObject::interface-removed signal.
  */
  extern(C) void function(GDBusObject* object, GDBusInterface* interface_) interfaceRemoved;
}

/**
    The [gio.dbus_object_manager.DBusObjectManager] type is the base type for service- and
    client-side implementations of the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface.
    
    See [gio.dbus_object_manager_client.DBusObjectManagerClient] for the client-side implementation
    and [gio.dbus_object_manager_server.DBusObjectManagerServer] for the service-side implementation.
*/
struct GDBusObjectManager;

/**
    [gio.dbus_object_manager_client.DBusObjectManagerClient] is used to create, monitor and delete object
    proxies for remote objects exported by a [gio.dbus_object_manager_server.DBusObjectManagerServer]
    (or any code implementing the
    [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface).
    
    Once an instance of this type has been created, you can connect to
    the `signal@Gio.DBusObjectManager::object-added` and
    `signal@Gio.DBusObjectManager::object-removed signals` and inspect the
    [gio.dbus_object_proxy.DBusObjectProxy] objects returned by
    [gio.dbus_object_manager.DBusObjectManager.getObjects].
    
    If the name for a [gio.dbus_object_manager_client.DBusObjectManagerClient] is not owned by anyone at
    object construction time, the default behavior is to request the
    message bus to launch an owner for the name. This behavior can be
    disabled using the [gio.types.DBusObjectManagerClientFlags.DoNotAutoStart]
    flag. It’s also worth noting that this only works if the name of
    interest is activatable in the first place. E.g. in some cases it
    is not possible to launch an owner for the requested name. In this
    case, [gio.dbus_object_manager_client.DBusObjectManagerClient] object construction still succeeds but
    there will be no object proxies
    (e.g. [gio.dbus_object_manager.DBusObjectManager.getObjects] returns the empty list) and
    the [gio.dbus_object_manager_client.DBusObjectManagerClient.name] property is `NULL`.
    
    The owner of the requested name can come and go (for example
    consider a system service being restarted) – [gio.dbus_object_manager_client.DBusObjectManagerClient]
    handles this case too; simply connect to the [gobject.object.ObjectWrap.notify]
    signal to watch for changes on the
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] property. When the name
    owner vanishes, the behavior is that
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is set to `NULL` (this
    includes emission of the [gobject.object.ObjectWrap.notify] signal) and then
    `signal@Gio.DBusObjectManager::object-removed` signals are synthesized
    for all currently existing object proxies. Since
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is `NULL` when this
    happens, you can use this information to disambiguate a synthesized signal
    from a genuine signal caused by object removal on the remote
    [gio.dbus_object_manager.DBusObjectManager]. Similarly, when a new name owner appears,
    `signal@Gio.DBusObjectManager::object-added` signals are synthesized
    while [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is still `NULL`. Only
    when all object proxies have been added, the
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is set to the new name
    owner (this includes emission of the [gobject.object.ObjectWrap.notify] signal).
    Furthermore, you are guaranteed that
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] will alternate between a
    name owner (e.g. `:1.42`) and `NULL` even in the case where
    the name of interest is atomically replaced
    
    Ultimately, [gio.dbus_object_manager_client.DBusObjectManagerClient] is used to obtain
    [gio.dbus_proxy.DBusProxy] instances. All signals (including the
    `org.freedesktop.DBus.Properties::PropertiesChanged` signal)
    delivered to [gio.dbus_proxy.DBusProxy] instances are guaranteed to originate
    from the name owner. This guarantee along with the behavior
    described above, means that certain race conditions including the
    “half the proxy is from the old owner and the other half is from
    the new owner” problem cannot happen.
    
    To avoid having the application connect to signals on the returned
    [gio.dbus_object_proxy.DBusObjectProxy] and [gio.dbus_proxy.DBusProxy] objects, the
    `signal@Gio.DBusObject::interface-added`,
    `signal@Gio.DBusObject::interface-removed`,
    `signal@Gio.DBusProxy::g-properties-changed` and
    `signal@Gio.DBusProxy::g-signal` signals
    are also emitted on the [gio.dbus_object_manager_client.DBusObjectManagerClient] instance managing these
    objects. The signals emitted are
    `signal@Gio.DBusObjectManager::interface-added`,
    `signal@Gio.DBusObjectManager::interface-removed`,
    `signal@Gio.DBusObjectManagerClient::interface-proxy-properties-changed` and
    `signal@Gio.DBusObjectManagerClient::interface-proxy-signal`.
    
    Note that all callbacks and signals are emitted in the
    thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) that the
    [gio.dbus_object_manager_client.DBusObjectManagerClient] object was constructed in. Additionally, the
    [gio.dbus_object_proxy.DBusObjectProxy] and [gio.dbus_proxy.DBusProxy] objects
    originating from the [gio.dbus_object_manager_client.DBusObjectManagerClient] object will be created in
    the same context and, consequently, will deliver signals in the
    same main loop.
*/
struct GDBusObjectManagerClient
{
  /** */
  GObject parentInstance;

  /** */
  GDBusObjectManagerClientPrivate* priv;
}

/**
    Class structure for #GDBusObjectManagerClient.
*/
struct GDBusObjectManagerClientClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal class handler for the #GDBusObjectManagerClient::interface-proxy-signal signal.
  */
  extern(C) void function(GDBusObjectManagerClient* manager, GDBusObjectProxy* objectProxy, GDBusProxy* interfaceProxy, const(char)* senderName, const(char)* signalName, GVariant* parameters) interfaceProxySignal;

  /**
      Signal class handler for the #GDBusObjectManagerClient::interface-proxy-properties-changed signal.
  */
  extern(C) void function(GDBusObjectManagerClient* manager, GDBusObjectProxy* objectProxy, GDBusProxy* interfaceProxy, GVariant* changedProperties, const(char*)* invalidatedProperties) interfaceProxyPropertiesChanged;

  /** */
  void*[8] padding;
}

/** */
struct GDBusObjectManagerClientPrivate;

/**
    Base type for D-Bus object managers.
*/
struct GDBusObjectManagerIface
{
  /**
      The parent interface.
  */
  GTypeInterface parentIface;

  /**
      Virtual function for [gio.dbus_object_manager.DBusObjectManager.getObjectPath].
  */
  extern(C) const(char)* function(GDBusObjectManager* manager) getObjectPath;

  /**
      Virtual function for [gio.dbus_object_manager.DBusObjectManager.getObjects].
  */
  extern(C) GList* function(GDBusObjectManager* manager) getObjects;

  /**
      Virtual function for [gio.dbus_object_manager.DBusObjectManager.getObject].
  */
  extern(C) GDBusObject* function(GDBusObjectManager* manager, const(char)* objectPath) getObject;

  /**
      Virtual function for [gio.dbus_object_manager.DBusObjectManager.getInterface].
  */
  extern(C) GDBusInterface* function(GDBusObjectManager* manager, const(char)* objectPath, const(char)* interfaceName) getInterface;

  /**
      Signal handler for the #GDBusObjectManager::object-added signal.
  */
  extern(C) void function(GDBusObjectManager* manager, GDBusObject* object) objectAdded;

  /**
      Signal handler for the #GDBusObjectManager::object-removed signal.
  */
  extern(C) void function(GDBusObjectManager* manager, GDBusObject* object) objectRemoved;

  /**
      Signal handler for the #GDBusObjectManager::interface-added signal.
  */
  extern(C) void function(GDBusObjectManager* manager, GDBusObject* object, GDBusInterface* interface_) interfaceAdded;

  /**
      Signal handler for the #GDBusObjectManager::interface-removed signal.
  */
  extern(C) void function(GDBusObjectManager* manager, GDBusObject* object, GDBusInterface* interface_) interfaceRemoved;
}

/**
    [gio.dbus_object_manager_server.DBusObjectManagerServer] is used to export [gio.dbus_object.DBusObject] instances
    using the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface. For example, remote D-Bus clients can get all objects
    and properties in a single call. Additionally, any change in the
    object hierarchy is broadcast using signals. This means that D-Bus
    clients can keep caches up to date by only listening to D-Bus
    signals.
    
    The recommended path to export an object manager at is the path form of the
    well-known name of a D-Bus service, or below. For example, if a D-Bus service
    is available at the well-known name `net.example.ExampleService1`, the object
    manager should typically be exported at `/net/example/ExampleService1`, or
    below (to allow for multiple object managers in a service).
    
    It is supported, but not recommended, to export an object manager at the root
    path, `/`.
    
    See [gio.dbus_object_manager_client.DBusObjectManagerClient] for the client-side code that is
    intended to be used with [gio.dbus_object_manager_server.DBusObjectManagerServer] or any D-Bus
    object implementing the `org.freedesktop.DBus.ObjectManager` interface.
*/
struct GDBusObjectManagerServer
{
  /** */
  GObject parentInstance;

  /** */
  GDBusObjectManagerServerPrivate* priv;
}

/**
    Class structure for #GDBusObjectManagerServer.
*/
struct GDBusObjectManagerServerClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /** */
  void*[8] padding;
}

/** */
struct GDBusObjectManagerServerPrivate;

/**
    A [gio.dbus_object_proxy.DBusObjectProxy] is an object used to represent a remote object
    with one or more D-Bus interfaces. Normally, you don’t instantiate
    a [gio.dbus_object_proxy.DBusObjectProxy] yourself — typically [gio.dbus_object_manager_client.DBusObjectManagerClient]
    is used to obtain it.
*/
struct GDBusObjectProxy
{
  /** */
  GObject parentInstance;

  /** */
  GDBusObjectProxyPrivate* priv;
}

/**
    Class structure for #GDBusObjectProxy.
*/
struct GDBusObjectProxyClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /** */
  void*[8] padding;
}

/** */
struct GDBusObjectProxyPrivate;

/**
    A [gio.dbus_object_skeleton.DBusObjectSkeleton] instance is essentially a group of D-Bus
    interfaces. The set of exported interfaces on the object may be
    dynamic and change at runtime.
    
    This type is intended to be used with [gio.dbus_object_manager.DBusObjectManager].
*/
struct GDBusObjectSkeleton
{
  /** */
  GObject parentInstance;

  /** */
  GDBusObjectSkeletonPrivate* priv;
}

/**
    Class structure for #GDBusObjectSkeleton.
*/
struct GDBusObjectSkeletonClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal class handler for the #GDBusObjectSkeleton::authorize-method signal.
  */
  extern(C) gboolean function(GDBusObjectSkeleton* object, GDBusInterfaceSkeleton* interface_, GDBusMethodInvocation* invocation) authorizeMethod;

  /** */
  void*[8] padding;
}

/** */
struct GDBusObjectSkeletonPrivate;

/**
    Information about a D-Bus property on a D-Bus interface.
*/
struct GDBusPropertyInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The name of the D-Bus property, e.g. "SupportedFilesystems".
  */
  char* name;

  /**
      The D-Bus signature of the property (a single complete type).
  */
  char* signature;

  /**
      Access control flags for the property.
  */
  GDBusPropertyInfoFlags flags;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    [gio.dbus_proxy.DBusProxy] is a base class used for proxies to access a D-Bus
    interface on a remote object. A [gio.dbus_proxy.DBusProxy] can be constructed for
    both well-known and unique names.
    
    By default, [gio.dbus_proxy.DBusProxy] will cache all properties (and listen to
    changes) of the remote object, and proxy all signals that get
    emitted. This behaviour can be changed by passing suitable
    [gio.types.DBusProxyFlags] when the proxy is created. If the proxy is for a
    well-known name, the property cache is flushed when the name owner
    vanishes and reloaded when a name owner appears.
    
    The unique name owner of the proxy’s name is tracked and can be read from
    `property@Gio.DBusProxy:g-name-owner`. Connect to the
    [gobject.object.ObjectWrap.notify] signal to get notified of changes.
    Additionally, only signals and property changes emitted from the current name
    owner are considered and calls are always sent to the current name owner.
    This avoids a number of race conditions when the name is lost by one owner
    and claimed by another. However, if no name owner currently exists,
    then calls will be sent to the well-known name which may result in
    the message bus launching an owner (unless
    [gio.types.DBusProxyFlags.DoNotAutoStart] is set).
    
    If the proxy is for a stateless D-Bus service, where the name owner may
    be started and stopped between calls, the
    `property@Gio.DBusProxy:g-name-owner` tracking of [gio.dbus_proxy.DBusProxy] will cause the
    proxy to drop signal and property changes from the service after it has
    restarted for the first time. When interacting with a stateless D-Bus
    service, do not use [gio.dbus_proxy.DBusProxy] — use direct D-Bus method calls and signal
    connections.
    
    The generic `signal@Gio.DBusProxy::g-properties-changed` and
    `signal@Gio.DBusProxy::g-signal` signals are not very convenient to work
    with. Therefore, the recommended way of working with proxies is to subclass
    [gio.dbus_proxy.DBusProxy], and have more natural properties and signals in your derived
    class. This [example](migrating-gdbus.html#using-gdbus-codegen) shows how
    this can easily be done using the [`gdbus-codegen`](gdbus-codegen.html) tool.
    
    A [gio.dbus_proxy.DBusProxy] instance can be used from multiple threads but note
    that all signals (e.g. `signal@Gio.DBusProxy::g-signal`,
    `signal@Gio.DBusProxy::g-properties-changed` and
    [gobject.object.ObjectWrap.notify]) are emitted in the thread-default main
    context (see [glib.main_context.MainContext.pushThreadDefault]) of the thread
    where the instance was constructed.
    
    An example using a proxy for a well-known name can be found in
    [`gdbus-example-watch-proxy.c`](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c).
*/
struct GDBusProxy
{
  /** */
  GObject parentInstance;

  /** */
  GDBusProxyPrivate* priv;
}

/**
    Class structure for #GDBusProxy.
*/
struct GDBusProxyClass
{
  /** */
  GObjectClass parentClass;

  /**
      Signal class handler for the #GDBusProxy::g-properties-changed signal.
  */
  extern(C) void function(GDBusProxy* proxy, GVariant* changedProperties, const(char*)* invalidatedProperties) gPropertiesChanged;

  /**
      Signal class handler for the #GDBusProxy::g-signal signal.
  */
  extern(C) void function(GDBusProxy* proxy, const(char)* senderName, const(char)* signalName, GVariant* parameters) gSignal;

  /** */
  void*[32] padding;
}

/** */
struct GDBusProxyPrivate;

/**
    [gio.dbus_server.DBusServer] is a helper for listening to and accepting D-Bus
    connections. This can be used to create a new D-Bus server, allowing two
    peers to use the D-Bus protocol for their own specialized communication.
    A server instance provided in this way will not perform message routing or
    implement the
    [`org.freedesktop.DBus` interface](https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-messages).
    
    To just export an object on a well-known name on a message bus, such as the
    session or system bus, you should instead use `func@Gio.bus_own_name`.
    
    An example of peer-to-peer communication with GDBus can be found
    in [gdbus-example-peer.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c).
    
    Note that a minimal [gio.dbus_server.DBusServer] will accept connections from any
    peer. In many use-cases it will be necessary to add a
    [gio.dbus_auth_observer.DBusAuthObserver] that only accepts connections that have
    successfully authenticated as the same user that is running the
    [gio.dbus_server.DBusServer]. Since GLib 2.68 this can be achieved more simply by passing
    the [gio.types.DBusServerFlags.AuthenticationRequireSameUser] flag to the
    server.
*/
struct GDBusServer;

/**
    Information about a signal on a D-Bus interface.
*/
struct GDBusSignalInfo
{
  /**
      The reference count or -1 if statically allocated.
  */
  int refCount;

  /**
      The name of the D-Bus signal, e.g. "NameOwnerChanged".
  */
  char* name;

  /**
      A pointer to a null-terminated array of pointers to #GDBusArgInfo structures or null if there are no arguments.
  */
  GDBusArgInfo** args;

  /**
      A pointer to a null-terminated array of pointers to #GDBusAnnotationInfo structures or null if there are no annotations.
  */
  GDBusAnnotationInfo** annotations;
}

/**
    Virtual table for handling subtrees registered with [gio.dbus_connection.DBusConnection.registerSubtree].
*/
struct GDBusSubtreeVTable
{
  /**
      Function for enumerating child nodes.
  */
  GDBusSubtreeEnumerateFunc enumerate;

  /**
      Function for introspecting a child node.
  */
  GDBusSubtreeIntrospectFunc introspect;

  /**
      Function for dispatching a remote call on a child node.
  */
  GDBusSubtreeDispatchFunc dispatch;

  /** */
  void*[8] padding;
}

/**
    Data input stream implements [gio.input_stream.InputStream] and includes functions
    for reading structured data directly from a binary input stream.
*/
struct GDataInputStream
{
  /** */
  GBufferedInputStream parentInstance;

  /** */
  GDataInputStreamPrivate* priv;
}

/** */
struct GDataInputStreamClass
{
  /** */
  GBufferedInputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GDataInputStreamPrivate;

/**
    Data output stream implements [gio.output_stream.OutputStream] and includes functions
    for writing data directly to an output stream.
*/
struct GDataOutputStream
{
  /** */
  GFilterOutputStream parentInstance;

  /** */
  GDataOutputStreamPrivate* priv;
}

/** */
struct GDataOutputStreamClass
{
  /** */
  GFilterOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GDataOutputStreamPrivate;

/**
    Interface for socket-like objects with datagram semantics.
    
    A [gio.datagram_based.DatagramBased] is a networking interface for representing datagram-based
    communications. It is a more or less direct mapping of the core parts of the
    BSD socket API in a portable GObject interface. It is implemented by
    [gio.socket.Socket], which wraps the UNIX socket API on UNIX and winsock2 on Windows.
    
    [gio.datagram_based.DatagramBased] is entirely platform independent, and is intended to be used
    alongside higher-level networking APIs such as [gio.iostream.IOStream].
    
    It uses vectored scatter/gather I/O by default, allowing for many messages
    to be sent or received in a single call. Where possible, implementations of
    the interface should take advantage of vectored I/O to minimise processing
    or system calls. For example, [gio.socket.Socket] uses `recvmmsg()` and `sendmmsg()`
    where possible. Callers should take advantage of scatter/gather I/O (the use of
    multiple buffers per message) to avoid unnecessary copying of data to
    assemble or disassemble a message.
    
    Each [gio.datagram_based.DatagramBased] operation has a timeout parameter which may be negative
    for blocking behaviour, zero for non-blocking behaviour, or positive for
    timeout behaviour. A blocking operation blocks until finished or there is an
    error. A non-blocking operation will return immediately with a
    [gio.types.IOErrorEnum.WouldBlock] error if it cannot make progress. A timeout operation
    will block until the operation is complete or the timeout expires; if the
    timeout expires it will return what progress it made, or
    [gio.types.IOErrorEnum.TimedOut] if no progress was made. To know when a call would
    successfully run you can call [gio.datagram_based.DatagramBased.conditionCheck] or
    [gio.datagram_based.DatagramBased.conditionWait]. You can also use
    [gio.datagram_based.DatagramBased.createSource] and attach it to a [glib.main_context.MainContext]
    to get callbacks when I/O is possible.
    
    When running a non-blocking operation applications should always be able to
    handle getting a [gio.types.IOErrorEnum.WouldBlock] error even when some other function
    said that I/O was possible. This can easily happen in case of a race
    condition in the application, but it can also happen for other reasons. For
    instance, on Windows a socket is always seen as writable until a write
    returns [gio.types.IOErrorEnum.WouldBlock].
    
    As with [gio.socket.Socket], [gio.datagram_based.DatagramBased]s can be either connection oriented (for
    example, SCTP) or connectionless (for example, UDP). [gio.datagram_based.DatagramBased]s must be
    datagram-based, not stream-based. The interface does not cover connection
    establishment — use methods on the underlying type to establish a connection
    before sending and receiving data through the [gio.datagram_based.DatagramBased] API. For
    connectionless socket types the target/source address is specified or
    received in each I/O operation.
    
    Like most other APIs in GLib, [gio.datagram_based.DatagramBased] is not inherently thread safe.
    To use a [gio.datagram_based.DatagramBased] concurrently from multiple threads, you must
    implement your own locking.
*/
struct GDatagramBased;

/**
    Provides an interface for socket-like objects which have datagram semantics,
    following the Berkeley sockets API. The interface methods are thin wrappers
    around the corresponding virtual methods, and no pre-processing of inputs is
    implemented — so implementations of this API must handle all functionality
    documented in the interface methods.
*/
struct GDatagramBasedInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Virtual method for [gio.datagram_based.DatagramBased.receiveMessages].
  */
  extern(C) int function(GDatagramBased* datagramBased, GInputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) receiveMessages;

  /**
      Virtual method for [gio.datagram_based.DatagramBased.sendMessages].
  */
  extern(C) int function(GDatagramBased* datagramBased, GOutputMessage* messages, uint numMessages, int flags, long timeout, GCancellable* cancellable, GError** _err) sendMessages;

  /**
      Virtual method for [gio.datagram_based.DatagramBased.createSource].
  */
  extern(C) GSource* function(GDatagramBased* datagramBased, GIOCondition condition, GCancellable* cancellable) createSource;

  /**
      Virtual method for [gio.datagram_based.DatagramBased.conditionCheck].
  */
  extern(C) GIOCondition function(GDatagramBased* datagramBased, GIOCondition condition) conditionCheck;

  /**
      Virtual method for
        [gio.datagram_based.DatagramBased.conditionWait].
  */
  extern(C) gboolean function(GDatagramBased* datagramBased, GIOCondition condition, long timeout, GCancellable* cancellable, GError** _err) conditionWait;
}

/**
    [gio.debug_controller.DebugController] is an interface to expose control of debugging features and
    debug output.
    
    It is implemented on Linux using [gio.debug_controller_dbus.DebugControllerDBus], which
    exposes a D-Bus interface to allow authenticated peers to control debug
    features in this process.
    
    Whether debug output is enabled is exposed as
    `property@Gio.DebugController:debug-enabled`. This controls
    `func@GLib.log_set_debug_enabled` by default. Application code may
    connect to the [gobject.object.ObjectWrap.notify] signal for it
    to control other parts of its debug infrastructure as necessary.
    
    If your application or service is using the default GLib log writer function,
    creating one of the built-in implementations of [gio.debug_controller.DebugController] should be
    all that’s needed to dynamically enable or disable debug output.
*/
struct GDebugController;

/**
    [gio.debug_controller_dbus.DebugControllerDBus] is an implementation of [gio.debug_controller.DebugController]
    which exposes debug settings as a D-Bus object.
    
    It is a [gio.initable.Initable] object, and will register an object at
    `/org/gtk/Debugging` on the bus given as
    [gio.debug_controller_dbus.DebugControllerDBus.connection] once it’s initialized. The
    object will be unregistered when the last reference to the
    [gio.debug_controller_dbus.DebugControllerDBus] is dropped.
    
    This D-Bus object can be used by remote processes to enable or disable debug
    output in this process. Remote processes calling
    `org.gtk.Debugging.SetDebugEnabled()` will affect the value of
    `property@Gio.DebugController:debug-enabled` and, by default,
    `func@GLib.log_get_debug_enabled`.
    
    By default, no processes are allowed to call `SetDebugEnabled()` unless a
    [gio.debug_controller_dbus.DebugControllerDBus.authorize] signal handler is installed. This
    is because the process may be privileged, or might expose sensitive
    information in its debug output. You may want to restrict the ability to
    enable debug output to privileged users or processes.
    
    One option is to install a D-Bus security policy which restricts access to
    `SetDebugEnabled()`, installing something like the following in
    `$datadir/dbus-1/system.d/`:
    
    ```xml
    <?xml version="1.0"?> <!--*-nxml-*-->
    <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
         "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
    <busconfig>
      <policy user="root">
        <allow send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
      </policy>
      <policy context="default">
        <deny send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
      </policy>
    </busconfig>
    ```
    
    This will prevent the `SetDebugEnabled()` method from being called by all
    except root. It will not prevent the `DebugEnabled` property from being read,
    as it’s accessed through the `org.freedesktop.DBus.Properties` interface.
    
    Another option is to use polkit to allow or deny requests on a case-by-case
    basis, allowing for the possibility of dynamic authorisation. To do this,
    connect to the [gio.debug_controller_dbus.DebugControllerDBus.authorize] signal and query
    polkit in it:
    
    ```c
      g_autoptr(GError) child_error = NULL;
      g_autoptr(GDBusConnection) connection = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, NULL);
      gulong debug_controller_authorize_id = 0;
    
      // Set up the debug controller.
      debug_controller = G_DEBUG_CONTROLLER (g_debug_controller_dbus_new (priv->connection, NULL, &child_error));
      if (debug_controller == NULL)
        {
          g_error ("Could not register debug controller on bus: %s"),
                   child_error->message);
        }
    
      debug_controller_authorize_id = g_signal_connect (debug_controller,
                                                        "authorize",
                                                        G_CALLBACK (debug_controller_authorize_cb),
                                                        self);
    
      static gboolean
      debug_controller_authorize_cb (GDebugControllerDBus  *debug_controller,
                                     GDBusMethodInvocation *invocation,
                                     gpointer               user_data)
      {
        g_autoptr(PolkitAuthority) authority = NULL;
        g_autoptr(PolkitSubject) subject = NULL;
        g_autoptr(PolkitAuthorizationResult) auth_result = NULL;
        g_autoptr(GError) local_error = NULL;
        GDBusMessage *message;
        GDBusMessageFlags message_flags;
        PolkitCheckAuthorizationFlags flags = POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE;
    
        message = g_dbus_method_invocation_get_message (invocation);
        message_flags = g_dbus_message_get_flags (message);
    
        authority = polkit_authority_get_sync (NULL, &local_error);
        if (authority == NULL)
          {
            g_warning ("Failed to get polkit authority: %s", local_error->message);
            return FALSE;
          }
    
        if (message_flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION)
          flags |= POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION;
    
        subject = polkit_system_bus_name_new (g_dbus_method_invocation_get_sender (invocation));
    
        auth_result = polkit_authority_check_authorization_sync (authority,
                                                                 subject,
                                                                 "com.example.MyService.set-debug-enabled",
                                                                 NULL,
                                                                 flags,
                                                                 NULL,
                                                                 &local_error);
        if (auth_result == NULL)
          {
            g_warning ("Failed to get check polkit authorization: %s", local_error->message);
            return FALSE;
          }
    
        return polkit_authorization_result_get_is_authorized (auth_result);
      }
    ```
*/
struct GDebugControllerDBus
{
  /** */
  GObject parentInstance;
}

/**
    The virtual function table for #GDebugControllerDBus.
*/
struct GDebugControllerDBusClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Default handler for the #GDebugControllerDBus::authorize signal.
  */
  extern(C) gboolean function(GDebugControllerDBus* controller, GDBusMethodInvocation* invocation) authorize;

  /** */
  void*[12] padding;
}

/**
    The virtual function table for #GDebugController.
*/
struct GDebugControllerInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;
}

/**
    [gio.desktop_app_info.DesktopAppInfo] is an implementation of [gio.app_info.AppInfo] based on
    desktop files.
    
    Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
struct GDesktopAppInfo;

/** */
struct GDesktopAppInfoClass
{
  /** */
  GObjectClass parentClass;
}

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
         unused by GIO.
*/
struct GDesktopAppInfoLookup;

/**
    Interface that is used by backends to associate default
    handlers with URI schemes.
*/
struct GDesktopAppInfoLookupIface
{
  /** */
  GTypeInterface gIface;

  /**
      Virtual method for
       [gio.desktop_app_info_lookup.DesktopAppInfoLookup.getDefaultForUriScheme].
  */
  extern(C) GAppInfo* function(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) getDefaultForUriScheme;
}

/**
    [gio.drive.Drive] represents a piece of hardware connected to the machine.
    It’s generally only created for removable hardware or hardware with
    removable media.
    
    [gio.drive.Drive] is a container class for [gio.volume.Volume] objects that stem from
    the same piece of media. As such, [gio.drive.Drive] abstracts a drive with
    (or without) removable media and provides operations for querying
    whether media is available, determining whether media change is
    automatically detected and ejecting the media.
    
    If the [gio.drive.Drive] reports that media isn’t automatically detected, one
    can poll for media; typically one should not do this periodically
    as a poll for media operation is potentially expensive and may
    spin up the drive creating noise.
    
    [gio.drive.Drive] supports starting and stopping drives with authentication
    support for the former. This can be used to support a diverse set
    of use cases including connecting/disconnecting iSCSI devices,
    powering down external disk enclosures and starting/stopping
    multi-disk devices such as RAID devices. Note that the actual
    semantics and side-effects of starting/stopping a [gio.drive.Drive] may vary
    according to implementation. To choose the correct verbs in e.g. a
    file manager, use [gio.drive.Drive.getStartStopType].
    
    For [porting from GnomeVFS](migrating-gnome-vfs.html) note that there is no
    equivalent of [gio.drive.Drive] in that API.
*/
struct GDrive;

/**
    Interface for creating #GDrive implementations.
*/
struct GDriveIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Signal emitted when the drive is changed.
  */
  extern(C) void function(GDrive* drive) changed;

  /**
      The removed signal that is emitted when the #GDrive have been disconnected. If the recipient is holding references to the object they should release them so the object can be finalized.
  */
  extern(C) void function(GDrive* drive) disconnected;

  /**
      Signal emitted when the physical eject button (if any) of a drive have been pressed.
  */
  extern(C) void function(GDrive* drive) ejectButton;

  /**
      Returns the name for the given #GDrive.
  */
  extern(C) char* function(GDrive* drive) getName;

  /**
      Returns a #GIcon for the given #GDrive.
  */
  extern(C) GIcon* function(GDrive* drive) getIcon;

  /**
      Returns true if the #GDrive has mountable volumes.
  */
  extern(C) gboolean function(GDrive* drive) hasVolumes;

  /**
      Returns a list #GList of #GVolume for the #GDrive.
  */
  extern(C) GList* function(GDrive* drive) getVolumes;

  /**
      Returns true if the #GDrive supports removal and insertion of media.
  */
  extern(C) gboolean function(GDrive* drive) isMediaRemovable;

  /**
      Returns true if the #GDrive has media inserted.
  */
  extern(C) gboolean function(GDrive* drive) hasMedia;

  /**
      Returns true if the #GDrive is capable of automatically detecting media changes.
  */
  extern(C) gboolean function(GDrive* drive) isMediaCheckAutomatic;

  /**
      Returns true if the #GDrive can eject media.
  */
  extern(C) gboolean function(GDrive* drive) canEject;

  /**
      Returns true if the #GDrive is capable of manually polling for media change.
  */
  extern(C) gboolean function(GDrive* drive) canPollForMedia;

  /**
      Ejects a #GDrive.
  */
  extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) eject;

  /**
      Finishes an eject operation.
  */
  extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) ejectFinish;

  /**
      Poll for media insertion/removal on a #GDrive.
  */
  extern(C) void function(GDrive* drive, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) pollForMedia;

  /**
      Finishes a media poll operation.
  */
  extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) pollForMediaFinish;

  /**
      Returns the identifier of the given kind, or null if
         the #GDrive doesn't have one.
  */
  extern(C) char* function(GDrive* drive, const(char)* kind) getIdentifier;

  /**
      Returns an array strings listing the kinds
         of identifiers which the #GDrive has.
  */
  extern(C) char** function(GDrive* drive) enumerateIdentifiers;

  /**
      Gets a #GDriveStartStopType with details about starting/stopping the drive. Since 2.22.
  */
  extern(C) GDriveStartStopType function(GDrive* drive) getStartStopType;

  /**
      Returns true if a #GDrive can be started. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive) canStart;

  /**
      Returns true if a #GDrive can be started degraded. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive) canStartDegraded;

  /**
      Starts a #GDrive. Since 2.22.
  */
  extern(C) void function(GDrive* drive, GDriveStartFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) start;

  /**
      Finishes a start operation. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) startFinish;

  /**
      Returns true if a #GDrive can be stopped. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive) canStop;

  /**
      Stops a #GDrive. Since 2.22.
  */
  extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) stop;

  /**
      Finishes a stop operation. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) stopFinish;

  /**
      Signal emitted when the physical stop button (if any) of a drive have been pressed. Since 2.22.
  */
  extern(C) void function(GDrive* drive) stopButton;

  /**
      Starts ejecting a #GDrive using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GDrive* drive, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ejectWithOperation;

  /**
      Finishes an eject operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GDrive* drive, GAsyncResult* result, GError** _err) ejectWithOperationFinish;

  /**
      Gets a key used for sorting #GDrive instances or null if no such key exists. Since 2.32.
  */
  extern(C) const(char)* function(GDrive* drive) getSortKey;

  /**
      Returns a symbolic #GIcon for the given #GDrive. Since 2.34.
  */
  extern(C) GIcon* function(GDrive* drive) getSymbolicIcon;

  /**
      Returns true if the #GDrive and/or its media is considered removable by the user. Since 2.50.
  */
  extern(C) gboolean function(GDrive* drive) isRemovable;
}

/**
    [gio.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
    [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
struct GDtlsClientConnection;

/**
    vtable for a #GDtlsClientConnection implementation.
*/
struct GDtlsClientConnectionInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;
}

/**
    [gio.dtls_connection.DtlsConnection] is the base DTLS connection class type, which wraps
    a [gio.datagram_based.DatagramBased] and provides DTLS encryption on top of it. Its
    subclasses, [gio.dtls_client_connection.DtlsClientConnection] and
    [gio.dtls_server_connection.DtlsServerConnection], implement client-side and server-side DTLS,
    respectively.
    
    For TLS support, see [gio.tls_connection.TlsConnection].
    
    As DTLS is datagram based, [gio.dtls_connection.DtlsConnection] implements
    [gio.datagram_based.DatagramBased], presenting a datagram-socket-like API for the
    encrypted connection. This operates over a base datagram connection, which is
    also a [gio.datagram_based.DatagramBased] (`property@Gio.DtlsConnection:base-socket`).
    
    To close a DTLS connection, use [gio.dtls_connection.DtlsConnection.close].
    
    Neither [gio.dtls_server_connection.DtlsServerConnection] or [gio.dtls_client_connection.DtlsClientConnection]
    set the peer address on their base [gio.datagram_based.DatagramBased] if it is a
    [gio.socket.Socket] — it is up to the caller to do that if they wish. If they
    do not, and [gio.socket.Socket.close] is called on the base socket, the
    [gio.dtls_connection.DtlsConnection] will not raise a [gio.types.IOErrorEnum.NotConnected] error on
    further I/O.
*/
struct GDtlsConnection;

/**
    Virtual method table for a #GDtlsConnection implementation.
*/
struct GDtlsConnectionInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Check whether to accept a certificate.
  */
  extern(C) gboolean function(GDtlsConnection* connection, GTlsCertificate* peerCert, GTlsCertificateFlags errors) acceptCertificate;

  /**
      Perform a handshake operation.
  */
  extern(C) gboolean function(GDtlsConnection* conn, GCancellable* cancellable, GError** _err) handshake;

  /**
      Start an asynchronous handshake operation.
  */
  extern(C) void function(GDtlsConnection* conn, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) handshakeAsync;

  /**
      Finish an asynchronous handshake operation.
  */
  extern(C) gboolean function(GDtlsConnection* conn, GAsyncResult* result, GError** _err) handshakeFinish;

  /**
      Shut down one or both directions of the connection.
  */
  extern(C) gboolean function(GDtlsConnection* conn, gboolean shutdownRead, gboolean shutdownWrite, GCancellable* cancellable, GError** _err) shutdown;

  /**
      Start an asynchronous shutdown operation.
  */
  extern(C) void function(GDtlsConnection* conn, gboolean shutdownRead, gboolean shutdownWrite, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) shutdownAsync;

  /**
      Finish an asynchronous shutdown operation.
  */
  extern(C) gboolean function(GDtlsConnection* conn, GAsyncResult* result, GError** _err) shutdownFinish;

  /**
      Set APLN protocol list (Since: 2.60)
  */
  extern(C) void function(GDtlsConnection* conn, const(char*)* protocols) setAdvertisedProtocols;

  /**
      Get ALPN-negotiated protocol (Since: 2.60)
  */
  extern(C) const(char)* function(GDtlsConnection* conn) getNegotiatedProtocol;

  /**
      Retrieve TLS channel binding data (Since: 2.66)
  */
  extern(C) gboolean function(GDtlsConnection* conn, GTlsChannelBindingType type, GByteArray* data, GError** _err) getBindingData;
}

/**
    [gio.dtls_server_connection.DtlsServerConnection] is the server-side subclass of
    [gio.dtls_connection.DtlsConnection], representing a server-side DTLS connection.
*/
struct GDtlsServerConnection;

/**
    vtable for a #GDtlsServerConnection implementation.
*/
struct GDtlsServerConnectionInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;
}

/**
    [gio.emblem.Emblem] is an implementation of [gio.icon.Icon] that supports
    having an emblem, which is an icon with additional properties.
    It can than be added to a [gio.emblemed_icon.EmblemedIcon].
    
    Currently, only metainformation about the emblem's origin is
    supported. More may be added in the future.
*/
struct GEmblem;

/** */
struct GEmblemClass;

/**
    [gio.emblemed_icon.EmblemedIcon] is an implementation of [gio.icon.Icon] that supports
    adding an emblem to an icon. Adding multiple emblems to an
    icon is ensured via [gio.emblemed_icon.EmblemedIcon.addEmblem].
    
    Note that [gio.emblemed_icon.EmblemedIcon] allows no control over the position
    of the emblems. See also [gio.emblem.Emblem] for more information.
*/
struct GEmblemedIcon
{
  /** */
  GObject parentInstance;

  /** */
  GEmblemedIconPrivate* priv;
}

/** */
struct GEmblemedIconClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GEmblemedIconPrivate;

/**
    [gio.file.File] is a high level abstraction for manipulating files on a
    virtual file system. [gio.file.File]s are lightweight, immutable objects
    that do no I/O upon creation. It is necessary to understand that
    [gio.file.File] objects do not represent files, merely an identifier for a
    file. All file content I/O is implemented as streaming operations
    (see [gio.input_stream.InputStream] and [gio.output_stream.OutputStream]).
    
    To construct a [gio.file.File], you can use:
    
    $(LIST
      * [gio.file.File.newForPath] if you have a path.
      * [gio.file.File.newForUri] if you have a URI.
      * [gio.file.File.newForCommandlineArg] or
        [gio.file.File.newForCommandlineArgAndCwd] for a command line
        argument.
      * [gio.file.File.newTmp] to create a temporary file from a template.
      * [gio.file.File.newTmpAsync] to asynchronously create a temporary file.
      * [gio.file.File.newTmpDirAsync] to asynchronously create a temporary
        directory.
      * [gio.file.File.parseName] from a UTF-8 string gotten from
        [gio.file.File.getParseName].
      * [gio.file.File.newBuildFilename] or [gio.file.File.newBuildFilenamev]
        to create a file from path elements.
    )
      
    One way to think of a [gio.file.File] is as an abstraction of a pathname. For
    normal files the system pathname is what is stored internally, but as
    [gio.file.File]s are extensible it could also be something else that corresponds
    to a pathname in a userspace implementation of a filesystem.
    
    [gio.file.File]s make up hierarchies of directories and files that correspond to
    the files on a filesystem. You can move through the file system with
    [gio.file.File] using [gio.file.File.getParent] to get an identifier for the
    parent directory, [gio.file.File.getChild] to get a child within a
    directory, and [gio.file.File.resolveRelativePath] to resolve a relative
    path between two [gio.file.File]s. There can be multiple hierarchies, so you may not
    end up at the same root if you repeatedly call [gio.file.File.getParent]
    on two different files.
    
    All [gio.file.File]s have a basename (get with [gio.file.File.getBasename]). These
    names are byte strings that are used to identify the file on the filesystem
    (relative to its parent directory) and there is no guarantees that they
    have any particular charset encoding or even make any sense at all. If
    you want to use filenames in a user interface you should use the display
    name that you can get by requesting the
    [gio.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] attribute with
    [gio.file.File.queryInfo]. This is guaranteed to be in UTF-8 and can be
    used in a user interface. But always store the real basename or the [gio.file.File]
    to use to actually access the file, because there is no way to go from a
    display name to the actual name.
    
    Using [gio.file.File] as an identifier has the same weaknesses as using a path
    in that there may be multiple aliases for the same file. For instance,
    hard or soft links may cause two different [gio.file.File]s to refer to the same
    file. Other possible causes for aliases are: case insensitive filesystems,
    short and long names on FAT/NTFS, or bind mounts in Linux. If you want to
    check if two [gio.file.File]s point to the same file you can query for the
    [gio.types.FILE_ATTRIBUTE_ID_FILE] attribute. Note that [gio.file.File] does some trivial
    canonicalization of pathnames passed in, so that trivial differences in
    the path string used at creation (duplicated slashes, slash at end of
    path, `.` or `..` path segments, etc) does not create different [gio.file.File]s.
    
    Many [gio.file.File] operations have both synchronous and asynchronous versions
    to suit your application. Asynchronous versions of synchronous functions
    simply have `_async()` appended to their function names. The asynchronous
    I/O functions call a [gio.types.AsyncReadyCallback] which is then used to
    finalize the operation, producing a [gio.async_result.AsyncResult] which is then
    passed to the function’s matching `_finish()` operation.
    
    It is highly recommended to use asynchronous calls when running within a
    shared main loop, such as in the main thread of an application. This avoids
    I/O operations blocking other sources on the main loop from being dispatched.
    Synchronous I/O operations should be performed from worker threads. See the
    [introduction to asynchronous programming section](overview.html#asynchronous-programming)
    for more.
    
    Some [gio.file.File] operations almost always take a noticeable amount of time, and
    so do not have synchronous analogs. Notable cases include:
    
    $(LIST
      * [gio.file.File.mountMountable] to mount a mountable file.
      * [gio.file.File.unmountMountableWithOperation] to unmount a mountable
        file.
      * [gio.file.File.ejectMountableWithOperation] to eject a mountable file.
    )
      
    ## Entity Tags
    
    One notable feature of [gio.file.File]s are entity tags, or ‘etags’ for
    short. Entity tags are somewhat like a more abstract version of the
    traditional mtime, and can be used to quickly determine if the file
    has been modified from the version on the file system. See the
    HTTP 1.1
    [specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
    for HTTP `ETag` headers, which are a very similar concept.
*/
struct GFile;

/**
    Information about a specific attribute.
*/
struct GFileAttributeInfo
{
  /**
      the name of the attribute.
  */
  char* name;

  /**
      the #GFileAttributeType type of the attribute.
  */
  GFileAttributeType type;

  /**
      a set of #GFileAttributeInfoFlags.
  */
  GFileAttributeInfoFlags flags;
}

/**
    Acts as a lightweight registry for possible valid file attributes.
    The registry stores Key-Value pair formats as #GFileAttributeInfos.
*/
struct GFileAttributeInfoList
{
  /**
      an array of #GFileAttributeInfos.
  */
  GFileAttributeInfo* infos;

  /**
      the number of values in the array.
  */
  int nInfos;
}

/**
    Determines if a string matches a file attribute.
*/
struct GFileAttributeMatcher;

/**
    [gio.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gio.input_stream.InputStream] or
    [gio.output_stream.OutputStream]) that are based on file descriptors.
    
    Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
struct GFileDescriptorBased;

/**
    An interface for file descriptor based io objects.
*/
struct GFileDescriptorBasedIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Gets the underlying file descriptor.
  */
  extern(C) int function(GFileDescriptorBased* fdBased) getFd;
}

/**
    [gio.file_enumerator.FileEnumerator] allows you to operate on a set of [gio.file.File] objects,
    returning a [gio.file_info.FileInfo] structure for each file enumerated (e.g.
    [gio.file.File.enumerateChildren] will return a [gio.file_enumerator.FileEnumerator] for each
    of the children within a directory).
    
    To get the next file's information from a [gio.file_enumerator.FileEnumerator], use
    [gio.file_enumerator.FileEnumerator.nextFile] or its asynchronous version,
    [gio.file_enumerator.FileEnumerator.nextFilesAsync]. Note that the asynchronous
    version will return a list of [gio.file_info.FileInfo] objects, whereas the
    synchronous will only return the next file in the enumerator.
    
    The ordering of returned files is unspecified for non-Unix
    platforms; for more information, see [glib.dir.Dir.readName].  On Unix,
    when operating on local files, returned files will be sorted by
    inode number.  Effectively you can assume that the ordering of
    returned files will be stable between successive calls (and
    applications) assuming the directory is unchanged.
    
    If your application needs a specific ordering, such as by name or
    modification time, you will have to implement that in your
    application code.
    
    To close a [gio.file_enumerator.FileEnumerator], use [gio.file_enumerator.FileEnumerator.close], or
    its asynchronous version, [gio.file_enumerator.FileEnumerator.closeAsync]. Once
    a [gio.file_enumerator.FileEnumerator] is closed, no further actions may be performed
    on it, and it should be freed with [gobject.object.ObjectWrap.unref].
*/
struct GFileEnumerator
{
  /** */
  GObject parentInstance;

  /** */
  GFileEnumeratorPrivate* priv;
}

/** */
struct GFileEnumeratorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GFileInfo* function(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) nextFile;

  /** */
  extern(C) gboolean function(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) closeFn;

  /** */
  extern(C) void function(GFileEnumerator* enumerator, int numFiles, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nextFilesAsync;

  /** */
  extern(C) GList* function(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) nextFilesFinish;

  /** */
  extern(C) void function(GFileEnumerator* enumerator, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) closeAsync;

  /** */
  extern(C) gboolean function(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) closeFinish;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;
}

/** */
struct GFileEnumeratorPrivate;

/**
    [gio.file_iostream.FileIOStream] provides I/O streams that both read and write to the same
    file handle.
    
    [gio.file_iostream.FileIOStream] implements [gio.seekable.Seekable], which allows the I/O
    stream to jump to arbitrary positions in the file and to truncate
    the file, provided the filesystem of the file supports these
    operations.
    
    To find the position of a file I/O stream, use [gio.seekable.Seekable.tell].
    
    To find out if a file I/O stream supports seeking, use
    [gio.seekable.Seekable.canSeek]. To position a file I/O stream, use
    [gio.seekable.Seekable.seek]. To find out if a file I/O stream supports
    truncating, use [gio.seekable.Seekable.canTruncate]. To truncate a file I/O
    stream, use [gio.seekable.Seekable.truncate].
    
    The default implementation of all the [gio.file_iostream.FileIOStream] operations
    and the implementation of [gio.seekable.Seekable] just call into the same
    operations on the output stream.
*/
struct GFileIOStream
{
  /** */
  GIOStream parentInstance;

  /** */
  GFileIOStreamPrivate* priv;
}

/** */
struct GFileIOStreamClass
{
  /** */
  GIOStreamClass parentClass;

  /** */
  extern(C) long function(GFileIOStream* stream) tell;

  /** */
  extern(C) gboolean function(GFileIOStream* stream) canSeek;

  /** */
  extern(C) gboolean function(GFileIOStream* stream, long offset, GSeekType type, GCancellable* cancellable, GError** _err) seek;

  /** */
  extern(C) gboolean function(GFileIOStream* stream) canTruncate;

  /** */
  extern(C) gboolean function(GFileIOStream* stream, long size, GCancellable* cancellable, GError** _err) truncateFn;

  /** */
  extern(C) GFileInfo* function(GFileIOStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) queryInfo;

  /** */
  extern(C) void function(GFileIOStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) queryInfoAsync;

  /** */
  extern(C) GFileInfo* function(GFileIOStream* stream, GAsyncResult* result, GError** _err) queryInfoFinish;

  /** */
  extern(C) char* function(GFileIOStream* stream) getEtag;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GFileIOStreamPrivate;

/**
    [gio.file_icon.FileIcon] specifies an icon by pointing to an image file
    to be used as icon.
    
    It implements [gio.loadable_icon.LoadableIcon].
*/
struct GFileIcon;

/** */
struct GFileIconClass;

/**
    An interface for writing VFS file handles.
*/
struct GFileIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Duplicates a #GFile.
  */
  extern(C) GFile* function(GFile* file) dup;

  /**
      Creates a hash of a #GFile.
  */
  extern(C) uint function(GFile* file) hash;

  /**
      Checks equality of two given #GFiles.
  */
  extern(C) gboolean function(GFile* file1, GFile* file2) equal;

  /**
      Checks to see if a file is native to the system.
  */
  extern(C) gboolean function(GFile* file) isNative;

  /**
      Checks to see if a #GFile has a given URI scheme.
  */
  extern(C) gboolean function(GFile* file, const(char)* uriScheme) hasUriScheme;

  /**
      Gets the URI scheme for a #GFile.
  */
  extern(C) char* function(GFile* file) getUriScheme;

  /**
      Gets the basename for a given #GFile.
  */
  extern(C) char* function(GFile* file) getBasename;

  /**
      Gets the current path within a #GFile.
  */
  extern(C) char* function(GFile* file) getPath;

  /**
      Gets a URI for the path within a #GFile.
  */
  extern(C) char* function(GFile* file) getUri;

  /**
      Gets the parsed name for the #GFile.
  */
  extern(C) char* function(GFile* file) getParseName;

  /**
      Gets the parent directory for the #GFile.
  */
  extern(C) GFile* function(GFile* file) getParent;

  /**
      Checks whether a #GFile contains a specified file.
  */
  extern(C) gboolean function(GFile* prefix, GFile* file) prefixMatches;

  /**
      Gets the path for a #GFile relative to a given path.
  */
  extern(C) char* function(GFile* parent, GFile* descendant) getRelativePath;

  /**
      Resolves a relative path for a #GFile to an absolute path.
  */
  extern(C) GFile* function(GFile* file, const(char)* relativePath) resolveRelativePath;

  /**
      Gets the child #GFile for a given display name.
  */
  extern(C) GFile* function(GFile* file, const(char)* displayName, GError** _err) getChildForDisplayName;

  /**
      Gets a #GFileEnumerator with the children of a #GFile.
  */
  extern(C) GFileEnumerator* function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) enumerateChildren;

  /**
      Asynchronously gets a #GFileEnumerator with the children of a #GFile.
  */
  extern(C) void function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) enumerateChildrenAsync;

  /**
      Finishes asynchronously enumerating the children.
  */
  extern(C) GFileEnumerator* function(GFile* file, GAsyncResult* res, GError** _err) enumerateChildrenFinish;

  /**
      Gets the #GFileInfo for a #GFile.
  */
  extern(C) GFileInfo* function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) queryInfo;

  /**
      Asynchronously gets the #GFileInfo for a #GFile.
  */
  extern(C) void function(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) queryInfoAsync;

  /**
      Finishes an asynchronous query info operation.
  */
  extern(C) GFileInfo* function(GFile* file, GAsyncResult* res, GError** _err) queryInfoFinish;

  /**
      Gets a #GFileInfo for the file system #GFile is on.
  */
  extern(C) GFileInfo* function(GFile* file, const(char)* attributes, GCancellable* cancellable, GError** _err) queryFilesystemInfo;

  /**
      Asynchronously gets a #GFileInfo for the file system #GFile is on.
  */
  extern(C) void function(GFile* file, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) queryFilesystemInfoAsync;

  /**
      Finishes asynchronously getting the file system info.
  */
  extern(C) GFileInfo* function(GFile* file, GAsyncResult* res, GError** _err) queryFilesystemInfoFinish;

  /**
      Gets a #GMount for the #GFile.
  */
  extern(C) GMount* function(GFile* file, GCancellable* cancellable, GError** _err) findEnclosingMount;

  /**
      Asynchronously gets the #GMount for a #GFile.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) findEnclosingMountAsync;

  /**
      Finishes asynchronously getting the volume.
  */
  extern(C) GMount* function(GFile* file, GAsyncResult* res, GError** _err) findEnclosingMountFinish;

  /**
      Sets the display name for a #GFile.
  */
  extern(C) GFile* function(GFile* file, const(char)* displayName, GCancellable* cancellable, GError** _err) setDisplayName;

  /**
      Asynchronously sets a #GFile's display name.
  */
  extern(C) void function(GFile* file, const(char)* displayName, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) setDisplayNameAsync;

  /**
      Finishes asynchronously setting a #GFile's display name.
  */
  extern(C) GFile* function(GFile* file, GAsyncResult* res, GError** _err) setDisplayNameFinish;

  /**
      Returns a list of #GFileAttributeInfos that can be set.
  */
  extern(C) GFileAttributeInfoList* function(GFile* file, GCancellable* cancellable, GError** _err) querySettableAttributes;

  /**
      Asynchronously gets a list of #GFileAttributeInfos that can be set.
  */
  extern(C) void function() QuerySettableAttributesAsync;

  /**
      Finishes asynchronously querying settable attributes.
  */
  extern(C) void function() QuerySettableAttributesFinish;

  /**
      Returns a list of #GFileAttributeInfo namespaces that are writable.
  */
  extern(C) GFileAttributeInfoList* function(GFile* file, GCancellable* cancellable, GError** _err) queryWritableNamespaces;

  /**
      Asynchronously gets a list of #GFileAttributeInfo namespaces that are writable.
  */
  extern(C) void function() QueryWritableNamespacesAsync;

  /**
      Finishes asynchronously querying the writable namespaces.
  */
  extern(C) void function() QueryWritableNamespacesFinish;

  /**
      Sets a #GFileAttributeInfo.
  */
  extern(C) gboolean function(GFile* file, const(char)* attribute, GFileAttributeType type, void* valueP, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) setAttribute;

  /**
      Sets a #GFileAttributeInfo with information from a #GFileInfo.
  */
  extern(C) gboolean function(GFile* file, GFileInfo* info, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) setAttributesFromInfo;

  /**
      Asynchronously sets a file's attributes.
  */
  extern(C) void function(GFile* file, GFileInfo* info, GFileQueryInfoFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) setAttributesAsync;

  /**
      Finishes setting a file's attributes asynchronously.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GFileInfo** info, GError** _err) setAttributesFinish;

  /**
      Reads a file asynchronously.
  */
  extern(C) GFileInputStream* function(GFile* file, GCancellable* cancellable, GError** _err) readFn;

  /**
      Asynchronously reads a file.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) readAsync;

  /**
      Finishes asynchronously reading a file.
  */
  extern(C) GFileInputStream* function(GFile* file, GAsyncResult* res, GError** _err) readFinish;

  /**
      Writes to the end of a file.
  */
  extern(C) GFileOutputStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) appendTo;

  /**
      Asynchronously writes to the end of a file.
  */
  extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) appendToAsync;

  /**
      Finishes an asynchronous file append operation.
  */
  extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) appendToFinish;

  /**
      Creates a new file.
  */
  extern(C) GFileOutputStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) create;

  /**
      Asynchronously creates a file.
  */
  extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) createAsync;

  /**
      Finishes asynchronously creating a file.
  */
  extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) createFinish;

  /**
      Replaces the contents of a file.
  */
  extern(C) GFileOutputStream* function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) replace;

  /**
      Asynchronously replaces the contents of a file.
  */
  extern(C) void function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) replaceAsync;

  /**
      Finishes asynchronously replacing a file.
  */
  extern(C) GFileOutputStream* function(GFile* file, GAsyncResult* res, GError** _err) replaceFinish;

  /**
      Deletes a file.
  */
  extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) deleteFile;

  /**
      Asynchronously deletes a file.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) deleteFileAsync;

  /**
      Finishes an asynchronous delete.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) deleteFileFinish;

  /**
      Sends a #GFile to the Trash location.
  */
  extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) trash;

  /**
      Asynchronously sends a #GFile to the Trash location.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) trashAsync;

  /**
      Finishes an asynchronous file trashing operation.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) trashFinish;

  /**
      Makes a directory.
  */
  extern(C) gboolean function(GFile* file, GCancellable* cancellable, GError** _err) makeDirectory;

  /**
      Asynchronously makes a directory.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) makeDirectoryAsync;

  /**
      Finishes making a directory asynchronously.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) makeDirectoryFinish;

  /**
      Makes a symbolic link. null if symbolic
         links are unsupported.
  */
  extern(C) gboolean function(GFile* file, const(char)* symlinkValue, GCancellable* cancellable, GError** _err) makeSymbolicLink;

  /**
      Asynchronously makes a symbolic link
  */
  extern(C) void function(GFile* file, const(char)* symlinkValue, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) makeSymbolicLinkAsync;

  /**
      Finishes making a symbolic link asynchronously.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) makeSymbolicLinkFinish;

  /**
      Copies a file. null if copying is unsupported, which will
          cause [gio.file.File] to use a fallback copy method where it reads from the
          source and writes to the destination.
  */
  extern(C) gboolean function(GFile* source, GFile* destination, GFileCopyFlags flags, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GError** _err) copy;

  /**
      Asynchronously copies a file.
  */
  extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GAsyncReadyCallback callback, void* userData) copyAsync;

  /**
      Finishes an asynchronous copy operation.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* res, GError** _err) copyFinish;

  /**
      Moves a file.
  */
  extern(C) gboolean function(GFile* source, GFile* destination, GFileCopyFlags flags, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GError** _err) move;

  /**
      Asynchronously moves a file. Since: 2.72
  */
  extern(C) void function(GFile* source, GFile* destination, GFileCopyFlags flags, int ioPriority, GCancellable* cancellable, GFileProgressCallback progressCallback, void* progressCallbackData, GAsyncReadyCallback callback, void* userData) moveAsync;

  /**
      Finishes an asynchronous move operation. Since: 2.72
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) moveFinish;

  /**
      Mounts a mountable object.
  */
  extern(C) void function(GFile* file, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) mountMountable;

  /**
      Finishes a mounting operation.
  */
  extern(C) GFile* function(GFile* file, GAsyncResult* result, GError** _err) mountMountableFinish;

  /**
      Unmounts a mountable object.
  */
  extern(C) void function(GFile* file, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) unmountMountable;

  /**
      Finishes an unmount operation.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) unmountMountableFinish;

  /**
      Ejects a mountable.
  */
  extern(C) void function(GFile* file, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ejectMountable;

  /**
      Finishes an eject operation.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) ejectMountableFinish;

  /**
      Mounts a specified location.
  */
  extern(C) void function(GFile* location, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) mountEnclosingVolume;

  /**
      Finishes mounting a specified location.
  */
  extern(C) gboolean function(GFile* location, GAsyncResult* result, GError** _err) mountEnclosingVolumeFinish;

  /**
      Creates a #GFileMonitor for the location.
  */
  extern(C) GFileMonitor* function(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) monitorDir;

  /**
      Creates a #GFileMonitor for the location.
  */
  extern(C) GFileMonitor* function(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) monitorFile;

  /**
      Open file read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, GCancellable* cancellable, GError** _err) openReadwrite;

  /**
      Asynchronously opens file read/write. Since 2.22.
  */
  extern(C) void function(GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) openReadwriteAsync;

  /**
      Finishes an asynchronous open read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) openReadwriteFinish;

  /**
      Creates file read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) createReadwrite;

  /**
      Asynchronously creates file read/write. Since 2.22.
  */
  extern(C) void function(GFile* file, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) createReadwriteAsync;

  /**
      Finishes an asynchronous creates read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) createReadwriteFinish;

  /**
      Replaces file read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) replaceReadwrite;

  /**
      Asynchronously replaces file read/write. Since 2.22.
  */
  extern(C) void function(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) replaceReadwriteAsync;

  /**
      Finishes an asynchronous replace read/write. Since 2.22.
  */
  extern(C) GFileIOStream* function(GFile* file, GAsyncResult* res, GError** _err) replaceReadwriteFinish;

  /**
      Starts a mountable object. Since 2.22.
  */
  extern(C) void function(GFile* file, GDriveStartFlags flags, GMountOperation* startOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) startMountable;

  /**
      Finishes a start operation. Since 2.22.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) startMountableFinish;

  /**
      Stops a mountable. Since 2.22.
  */
  extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) stopMountable;

  /**
      Finishes a stop operation. Since 2.22.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) stopMountableFinish;

  /**
      a boolean that indicates whether the #GFile implementation supports thread-default contexts. Since 2.22.
  */
  gboolean supportsThreadContexts;

  /**
      Unmounts a mountable object using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) unmountMountableWithOperation;

  /**
      Finishes an unmount operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) unmountMountableWithOperationFinish;

  /**
      Ejects a mountable object using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GFile* file, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ejectMountableWithOperation;

  /**
      Finishes an eject operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) ejectMountableWithOperationFinish;

  /**
      Polls a mountable object for media changes. Since 2.22.
  */
  extern(C) void function(GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) pollMountable;

  /**
      Finishes a poll operation for media changes. Since 2.22.
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, GError** _err) pollMountableFinish;

  /**
      Recursively measures the disk usage of @file. Since 2.38
  */
  extern(C) gboolean function(GFile* file, GFileMeasureFlags flags, GCancellable* cancellable, GFileMeasureProgressCallback progressCallback, void* progressData, ulong* diskUsage, ulong* numDirs, ulong* numFiles, GError** _err) measureDiskUsage;

  /**
      Asynchronously recursively measures the disk usage of @file. Since 2.38
  */
  extern(C) void function(GFile* file, GFileMeasureFlags flags, int ioPriority, GCancellable* cancellable, GFileMeasureProgressCallback progressCallback, void* progressData, GAsyncReadyCallback callback, void* userData) measureDiskUsageAsync;

  /**
      Finishes an asynchronous recursive measurement of the disk usage of @file. Since 2.38
  */
  extern(C) gboolean function(GFile* file, GAsyncResult* result, ulong* diskUsage, ulong* numDirs, ulong* numFiles, GError** _err) measureDiskUsageFinish;
}

/**
    Stores information about a file system object referenced by a [gio.file.File].
    
    Functionality for manipulating basic metadata for files. [gio.file_info.FileInfo]
    implements methods for getting information that all files should
    contain, and allows for manipulation of extended attributes.
    
    See [file-attributes.html](file attributes) for more information on how GIO
    handles file attributes.
    
    To obtain a [gio.file_info.FileInfo] for a [gio.file.File], use
    [gio.file.File.queryInfo] (or its async variant). To obtain a [gio.file_info.FileInfo]
    for a file input or output stream, use [gio.file_input_stream.FileInputStream.queryInfo]
    or [gio.file_output_stream.FileOutputStream.queryInfo] (or their async variants).
    
    To change the actual attributes of a file, you should then set the
    attribute in the [gio.file_info.FileInfo] and call [gio.file.File.setAttributesFromInfo]
    or [gio.file.File.setAttributesAsync] on a [gio.file.File].
    
    However, not all attributes can be changed in the file. For instance,
    the actual size of a file cannot be changed via [gio.file_info.FileInfo.setSize].
    You may call [gio.file.File.querySettableAttributes] and
    [gio.file.File.queryWritableNamespaces] to discover the settable attributes
    of a particular file at runtime.
    
    The direct accessors, such as [gio.file_info.FileInfo.getName], are slightly more
    optimized than the generic attribute accessors, such as
    [gio.file_info.FileInfo.getAttributeByteString].This optimization will matter
    only if calling the API in a tight loop.
    
    It is an error to call these accessors without specifying their required file
    attributes when creating the [gio.file_info.FileInfo]. Use
    [gio.file_info.FileInfo.hasAttribute] or [gio.file_info.FileInfo.listAttributes]
    to check what attributes are specified for a [gio.file_info.FileInfo].
    
    [gio.file_attribute_matcher.FileAttributeMatcher] allows for searching through a [gio.file_info.FileInfo]
    for attributes.
*/
struct GFileInfo;

/** */
struct GFileInfoClass;

/**
    [gio.file_input_stream.FileInputStream] provides input streams that take their
    content from a file.
    
    [gio.file_input_stream.FileInputStream] implements [gio.seekable.Seekable], which allows the input
    stream to jump to arbitrary positions in the file, provided the
    filesystem of the file allows it. To find the position of a file
    input stream, use [gio.seekable.Seekable.tell]. To find out if a file input
    stream supports seeking, use `vfunc@Gio.Seekable.can_seek`.
    To position a file input stream, use `vfunc@Gio.Seekable.seek`.
*/
struct GFileInputStream
{
  /** */
  GInputStream parentInstance;

  /** */
  GFileInputStreamPrivate* priv;
}

/** */
struct GFileInputStreamClass
{
  /** */
  GInputStreamClass parentClass;

  /** */
  extern(C) long function(GFileInputStream* stream) tell;

  /** */
  extern(C) gboolean function(GFileInputStream* stream) canSeek;

  /** */
  extern(C) gboolean function(GFileInputStream* stream, long offset, GSeekType type, GCancellable* cancellable, GError** _err) seek;

  /** */
  extern(C) GFileInfo* function(GFileInputStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) queryInfo;

  /** */
  extern(C) void function(GFileInputStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) queryInfoAsync;

  /** */
  extern(C) GFileInfo* function(GFileInputStream* stream, GAsyncResult* result, GError** _err) queryInfoFinish;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GFileInputStreamPrivate;

/**
    Monitors a file or directory for changes.
    
    To obtain a [gio.file_monitor.FileMonitor] for a file or directory, use
    [gio.file.File.monitor], [gio.file.File.monitorFile], or
    [gio.file.File.monitorDirectory].
    
    To get informed about changes to the file or directory you are
    monitoring, connect to the [gio.file_monitor.FileMonitor.changed] signal. The
    signal will be emitted in the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) of the thread that the monitor
    was created in (though if the global default main context is blocked, this
    may cause notifications to be blocked even if the thread-default
    context is still running).
*/
struct GFileMonitor
{
  /** */
  GObject parentInstance;

  /** */
  GFileMonitorPrivate* priv;
}

/** */
struct GFileMonitorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GFileMonitor* monitor, GFile* file, GFile* otherFile, GFileMonitorEvent eventType) changed;

  /** */
  extern(C) gboolean function(GFileMonitor* monitor) cancel;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GFileMonitorPrivate;

/**
    [gio.file_output_stream.FileOutputStream] provides output streams that write their
    content to a file.
    
    [gio.file_output_stream.FileOutputStream] implements [gio.seekable.Seekable], which allows the output
    stream to jump to arbitrary positions in the file and to truncate
    the file, provided the filesystem of the file supports these
    operations.
    
    To find the position of a file output stream, use [gio.seekable.Seekable.tell].
    To find out if a file output stream supports seeking, use
    [gio.seekable.Seekable.canSeek].To position a file output stream, use
    [gio.seekable.Seekable.seek]. To find out if a file output stream supports
    truncating, use [gio.seekable.Seekable.canTruncate]. To truncate a file output
    stream, use [gio.seekable.Seekable.truncate].
*/
struct GFileOutputStream
{
  /** */
  GOutputStream parentInstance;

  /** */
  GFileOutputStreamPrivate* priv;
}

/** */
struct GFileOutputStreamClass
{
  /** */
  GOutputStreamClass parentClass;

  /** */
  extern(C) long function(GFileOutputStream* stream) tell;

  /** */
  extern(C) gboolean function(GFileOutputStream* stream) canSeek;

  /** */
  extern(C) gboolean function(GFileOutputStream* stream, long offset, GSeekType type, GCancellable* cancellable, GError** _err) seek;

  /** */
  extern(C) gboolean function(GFileOutputStream* stream) canTruncate;

  /** */
  extern(C) gboolean function(GFileOutputStream* stream, long size, GCancellable* cancellable, GError** _err) truncateFn;

  /** */
  extern(C) GFileInfo* function(GFileOutputStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) queryInfo;

  /** */
  extern(C) void function(GFileOutputStream* stream, const(char)* attributes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) queryInfoAsync;

  /** */
  extern(C) GFileInfo* function(GFileOutputStream* stream, GAsyncResult* result, GError** _err) queryInfoFinish;

  /** */
  extern(C) char* function(GFileOutputStream* stream) getEtag;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GFileOutputStreamPrivate;

/**
    Completes partial file and directory names given a partial string by
    looking in the file system for clues. Can return a list of possible
    completion strings for widget implementations.
*/
struct GFilenameCompleter;

/** */
struct GFilenameCompleterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GFilenameCompleter* filenameCompleter) gotCompletionData;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;
}

/**
    Base class for input stream implementations that perform some
    kind of filtering operation on a base stream. Typical examples
    of filtering operations are character set conversion, compression
    and byte order flipping.
*/
struct GFilterInputStream
{
  /** */
  GInputStream parentInstance;

  /** */
  GInputStream* baseStream;
}

/** */
struct GFilterInputStreamClass
{
  /** */
  GInputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;
}

/**
    Base class for output stream implementations that perform some
    kind of filtering operation on a base stream. Typical examples
    of filtering operations are character set conversion, compression
    and byte order flipping.
*/
struct GFilterOutputStream
{
  /** */
  GOutputStream parentInstance;

  /** */
  GOutputStream* baseStream;
}

/** */
struct GFilterOutputStreamClass
{
  /** */
  GOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;
}

/**
    #GIOExtension is an opaque data structure and can only be accessed
    using the following functions.
*/
struct GIOExtension;

/**
    [gio.ioextension_point.IOExtensionPoint] provides a mechanism for modules to extend the
    functionality of the library or application that loaded it in an
    organized fashion.
    
    An extension point is identified by a name, and it may optionally
    require that any implementation must be of a certain type (or derived
    thereof). Use [gio.ioextension_point.IOExtensionPoint.register] to register an
    extension point, and [gio.ioextension_point.IOExtensionPoint.setRequiredType] to
    set a required type.
    
    A module can implement an extension point by specifying the
    [gobject.types.size_t] that implements the functionality. Additionally, each
    implementation of an extension point has a name, and a priority. Use
    [gio.ioextension_point.IOExtensionPoint.implement] to implement an extension point.
    
    ```c
    GIOExtensionPoint *ep;
    
    // Register an extension point
    ep = g_io_extension_point_register ("my-extension-point");
    g_io_extension_point_set_required_type (ep, MY_TYPE_EXAMPLE);
    ```
    
    ```c
    // Implement an extension point
    G_DEFINE_TYPE (MyExampleImpl, my_example_impl, MY_TYPE_EXAMPLE)
    g_io_extension_point_implement ("my-extension-point",
                                    my_example_impl_get_type (),
                                    "my-example",
                                    10);
    ```
    
     It is up to the code that registered the extension point how
     it uses the implementations that have been associated with it.
     Depending on the use case, it may use all implementations, or
     only the one with the highest priority, or pick a specific
     one by name.
    
     To avoid opening all modules just to find out what extension
     points they implement, GIO makes use of a caching mechanism,
     see [gio-querymodules](gio-querymodules.html).
     You are expected to run this command after installing a
     GIO module.
    
     The `GIO_EXTRA_MODULES` environment variable can be used to
     specify additional directories to automatically load modules
     from. This environment variable has the same syntax as the
     `PATH`. If two modules have the same base name in different
     directories, then the latter one will be ignored. If additional
     directories are specified GIO will load modules from the built-in
     directory last.
*/
struct GIOExtensionPoint;

/**
    Provides an interface and default functions for loading and unloading
    modules. This is used internally to make GIO extensible, but can also
    be used by others to implement module loading.
*/
struct GIOModule;

/** */
struct GIOModuleClass;

/**
    Represents a scope for loading IO modules. A scope can be used for blocking
    duplicate modules, or blocking a module you don't want to load.
    
    The scope can be used with [gio.global.ioModulesLoadAllInDirectoryWithScope]
    or [gio.global.ioModulesScanAllInDirectoryWithScope].
*/
struct GIOModuleScope;

/**
    Opaque class for defining and scheduling IO jobs.

    Deprecated: Use [glib.thread_pool.ThreadPool] or
        [gio.task.Task.runInThread]
*/
struct GIOSchedulerJob;

/**
    [gio.iostream.IOStream] represents an object that has both read and write streams.
    Generally the two streams act as separate input and output streams,
    but they share some common resources and state. For instance, for
    seekable streams, both streams may use the same position.
    
    Examples of [gio.iostream.IOStream] objects are [gio.socket_connection.SocketConnection], which represents
    a two-way network connection; and [gio.file_iostream.FileIOStream], which represents a
    file handle opened in read-write mode.
    
    To do the actual reading and writing you need to get the substreams
    with [gio.iostream.IOStream.getInputStream] and
    [gio.iostream.IOStream.getOutputStream].
    
    The [gio.iostream.IOStream] object owns the input and the output streams, not the other
    way around, so keeping the substreams alive will not keep the [gio.iostream.IOStream]
    object alive. If the [gio.iostream.IOStream] object is freed it will be closed, thus
    closing the substreams, so even if the substreams stay alive they will
    always return [gio.types.IOErrorEnum.Closed] for all operations.
    
    To close a stream use [gio.iostream.IOStream.close] which will close the common
    stream object and also the individual substreams. You can also close
    the substreams themselves. In most cases this only marks the
    substream as closed, so further I/O on it fails but common state in the
    [gio.iostream.IOStream] may still be open. However, some streams may support
    ‘half-closed’ states where one direction of the stream is actually shut down.
    
    Operations on [gio.iostream.IOStream]s cannot be started while another operation on the
    [gio.iostream.IOStream] or its substreams is in progress. Specifically, an application can
    read from the [gio.input_stream.InputStream] and write to the
    [gio.output_stream.OutputStream] simultaneously (either in separate threads, or as
    asynchronous operations in the same thread), but an application cannot start
    any [gio.iostream.IOStream] operation while there is a [gio.iostream.IOStream], [gio.input_stream.InputStream] or
    [gio.output_stream.OutputStream] operation in progress, and an application can’t start any
    [gio.input_stream.InputStream] or [gio.output_stream.OutputStream] operation while there is a [gio.iostream.IOStream]
    operation in progress.
    
    This is a product of individual stream operations being associated with a
    given [glib.main_context.MainContext] (the thread-default context at the time the
    operation was started), rather than entire streams being associated with a
    single [glib.main_context.MainContext].
    
    GIO may run operations on [gio.iostream.IOStream]s from other (worker) threads, and this
    may be exposed to application code in the behaviour of wrapper streams, such
    as [gio.buffered_input_stream.BufferedInputStream] or [gio.tls_connection.TlsConnection]. With such
    wrapper APIs, application code may only run operations on the base (wrapped)
    stream when the wrapper stream is idle. Note that the semantics of such
    operations may not be well-defined due to the state the wrapper stream leaves
    the base stream in (though they are guaranteed not to crash).
*/
struct GIOStream
{
  /** */
  GObject parentInstance;

  /** */
  GIOStreamPrivate* priv;
}

/** */
struct GIOStreamAdapter;

/** */
struct GIOStreamClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GInputStream* function(GIOStream* stream) getInputStream;

  /** */
  extern(C) GOutputStream* function(GIOStream* stream) getOutputStream;

  /** */
  extern(C) gboolean function(GIOStream* stream, GCancellable* cancellable, GError** _err) closeFn;

  /** */
  extern(C) void function(GIOStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) closeAsync;

  /** */
  extern(C) gboolean function(GIOStream* stream, GAsyncResult* result, GError** _err) closeFinish;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;

  /** */
  extern(C) void function() GReserved8;

  /** */
  extern(C) void function() GReserved9;

  /** */
  extern(C) void function() GReserved10;
}

/** */
struct GIOStreamPrivate;

/**
    [gio.icon.Icon] is a very minimal interface for icons. It provides functions
    for checking the equality of two icons, hashing of icons and
    serializing an icon to and from strings.
    
    [gio.icon.Icon] does not provide the actual pixmap for the icon as this is out
    of GIO's scope, however implementations of [gio.icon.Icon] may contain the name
    of an icon (see [gio.themed_icon.ThemedIcon]), or the path to an icon
    (see [gio.loadable_icon.LoadableIcon]).
    
    To obtain a hash of a [gio.icon.Icon], see [gio.icon.Icon.hash].
    
    To check if two [gio.icon.Icon]s are equal, see [gio.icon.Icon.equal].
    
    For serializing a [gio.icon.Icon], use [gio.icon.Icon.serialize] and
    [gio.icon.Icon.deserialize].
    
    If you want to consume [gio.icon.Icon] (for example, in a toolkit) you must
    be prepared to handle at least the three following cases:
    [gio.loadable_icon.LoadableIcon], [gio.themed_icon.ThemedIcon] and [gio.emblemed_icon.EmblemedIcon].
    It may also make sense to have fast-paths for other cases (like handling
    [[gdkpixbuf.pixbuf.Pixbuf]](https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html) directly,
    for example) but all compliant [gio.icon.Icon] implementations outside of GIO must
    implement [gio.loadable_icon.LoadableIcon].
    
    If your application or library provides one or more [gio.icon.Icon]
    implementations you need to ensure that your new implementation also
    implements [gio.loadable_icon.LoadableIcon].  Additionally, you must provide an
    implementation of [gio.icon.Icon.serialize] that gives a result that is
    understood by [gio.icon.Icon.deserialize], yielding one of the built-in
    icon types.
*/
struct GIcon;

/**
    GIconIface is used to implement GIcon types for various
    different systems. See #GThemedIcon and #GLoadableIcon for
    examples of how to implement this interface.
*/
struct GIconIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      A hash for a given #GIcon.
  */
  extern(C) uint function(GIcon* icon) hash;

  /**
      Checks if two #GIcons are equal.
  */
  extern(C) gboolean function(GIcon* icon1, GIcon* icon2) equal;

  /**
      Serializes a #GIcon into tokens. The tokens must not
      contain any whitespace. Don't implement if the #GIcon can't be
      serialized (Since 2.20).
  */
  extern(C) gboolean function(GIcon* icon, GPtrArray* tokens, int* outVersion) toTokens;

  /**
      Constructs a #GIcon from tokens. Set the #GError if
      the tokens are malformed. Don't implement if the #GIcon can't be
      serialized (Since 2.20).
  */
  extern(C) GIcon* function(char** tokens, int numTokens, int version_, GError** _err) fromTokens;

  /**
      Serializes a #GIcon into a #GVariant. Since: 2.38
  */
  extern(C) GVariant* function(GIcon* icon) serialize;
}

/**
    [gio.inet_address.InetAddress] represents an IPv4 or IPv6 internet address. Use
    [gio.resolver.Resolver.lookupByName] or
    [gio.resolver.Resolver.lookupByNameAsync] to look up the [gio.inet_address.InetAddress] for
    a hostname. Use [gio.resolver.Resolver.lookupByAddress] or
    [gio.resolver.Resolver.lookupByAddressAsync] to look up the hostname for a
    [gio.inet_address.InetAddress].
    
    To actually connect to a remote host, you will need a
    [gio.inet_socket_address.InetSocketAddress] (which includes a [gio.inet_address.InetAddress] as well as a
    port number).
*/
struct GInetAddress
{
  /** */
  GObject parentInstance;

  /** */
  GInetAddressPrivate* priv;
}

/** */
struct GInetAddressClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) char* function(GInetAddress* address) toString_;

  /** */
  extern(C) const(ubyte)* function(GInetAddress* address) toBytes;
}

/**
    [gio.inet_address_mask.InetAddressMask] represents a range of IPv4 or IPv6 addresses
    described by a base address and a length indicating how many bits
    of the base address are relevant for matching purposes. These are
    often given in string form. For example, `10.0.0.0/8`, or `fe80::/10`.
*/
struct GInetAddressMask
{
  /** */
  GObject parentInstance;

  /** */
  GInetAddressMaskPrivate* priv;
}

/** */
struct GInetAddressMaskClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GInetAddressMaskPrivate;

/** */
struct GInetAddressPrivate;

/**
    An IPv4 or IPv6 socket address. That is, the combination of a
    [gio.inet_address.InetAddress] and a port number.
    
    In UNIX terms, [gio.inet_socket_address.InetSocketAddress] corresponds to a
    [`struct sockaddr_in` or `struct sockaddr_in6`](man:sockaddr(3type)).
*/
struct GInetSocketAddress
{
  /** */
  GSocketAddress parentInstance;

  /** */
  GInetSocketAddressPrivate* priv;
}

/** */
struct GInetSocketAddressClass
{
  /** */
  GSocketAddressClass parentClass;
}

/** */
struct GInetSocketAddressPrivate;

/**
    [gio.initable.Initable] is implemented by objects that can fail during
    initialization. If an object implements this interface then
    it must be initialized as the first thing after construction,
    either via [gio.initable.Initable.init_] or [gio.async_initable.AsyncInitable.initAsync]
    (the latter is only available if it also implements [gio.async_initable.AsyncInitable]).
    
    If the object is not initialized, or initialization returns with an
    error, then all operations on the object except `[gobject.object.ObjectWrap.ref_]` and
    `[gobject.object.ObjectWrap.unref]` are considered to be invalid, and have undefined
    behaviour. They will often fail with `func@GLib.critical` or
    `func@GLib.warning`, but this must not be relied on.
    
    Users of objects implementing this are not intended to use
    the interface method directly, instead it will be used automatically
    in various ways. For C applications you generally just call
    [gio.initable.Initable.new_] directly, or indirectly via a `foo_thing_new()` wrapper.
    This will call [gio.initable.Initable.init_] under the cover, returning `NULL`
    and setting a [glib.error.ErrorWrap] on failure (at which point the instance is
    unreferenced).
    
    For bindings in languages where the native constructor supports
    exceptions the binding could check for objects implementing [gio.initable.Initable]
    during normal construction and automatically initialize them, throwing
    an exception on failure.
*/
struct GInitable;

/**
    Provides an interface for initializing object such that initialization
    may fail.
*/
struct GInitableIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Initializes the object.
  */
  extern(C) gboolean function(GInitable* initable, GCancellable* cancellable, GError** _err) init_;
}

/**
    Structure used for scatter/gather data input when receiving multiple
    messages or packets in one go. You generally pass in an array of empty
    #GInputVectors and the operation will use all the buffers as if they
    were one buffer, and will set @bytes_received to the total number of bytes
    received across all #GInputVectors.
    
    This structure closely mirrors `struct mmsghdr` and `struct msghdr` from
    the POSIX sockets API (see `man 2 recvmmsg`).
    
    If @address is non-null then it is set to the source address the message
    was received from, and the caller must free it afterwards.
    
    If @control_messages is non-null then it is set to an array of control
    messages received with the message (if any), and the caller must free it
    afterwards. @num_control_messages is set to the number of elements in
    this array, which may be zero.
    
    Flags relevant to this message will be returned in @flags. For example,
    `MSG_EOR` or `MSG_TRUNC`.
*/
struct GInputMessage
{
  /**
      return location
        for a #GSocketAddress, or null
  */
  GSocketAddress** address;

  /**
      pointer to an
        array of input vectors
  */
  GInputVector* vectors;

  /**
      the number of input vectors pointed to by @vectors
  */
  uint numVectors;

  /**
      will be set to the number of bytes that have been
        received
  */
  size_t bytesReceived;

  /**
      collection of #GSocketMsgFlags for the received message,
        outputted by the call
  */
  int flags;

  /**
      return location for a
        caller-allocated array of #GSocketControlMessages, or null
  */
  GSocketControlMessage*** controlMessages;

  /**
      return location for the number of
        elements in @control_messages
  */
  uint* numControlMessages;
}

/**
    [gio.input_stream.InputStream] is a base class for implementing streaming input.
    
    It has functions to read from a stream ([gio.input_stream.InputStream.read]),
    to close a stream ([gio.input_stream.InputStream.close]) and to skip some content
    ([gio.input_stream.InputStream.skip]).
    
    To copy the content of an input stream to an output stream without
    manually handling the reads and writes, use [gio.output_stream.OutputStream.splice].
    
    See the documentation for [gio.iostream.IOStream] for details of thread safety
    of streaming APIs.
    
    All of these functions have async variants too.
*/
struct GInputStream
{
  /** */
  GObject parentInstance;

  /** */
  GInputStreamPrivate* priv;
}

/** */
struct GInputStreamClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) ptrdiff_t function(GInputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) readFn;

  /** */
  extern(C) ptrdiff_t function(GInputStream* stream, size_t count, GCancellable* cancellable, GError** _err) skip;

  /** */
  extern(C) gboolean function(GInputStream* stream, GCancellable* cancellable, GError** _err) closeFn;

  /** */
  extern(C) void function(GInputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) readAsync;

  /** */
  extern(C) ptrdiff_t function(GInputStream* stream, GAsyncResult* result, GError** _err) readFinish;

  /** */
  extern(C) void function(GInputStream* stream, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) skipAsync;

  /** */
  extern(C) ptrdiff_t function(GInputStream* stream, GAsyncResult* result, GError** _err) skipFinish;

  /** */
  extern(C) void function(GInputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) closeAsync;

  /** */
  extern(C) gboolean function(GInputStream* stream, GAsyncResult* result, GError** _err) closeFinish;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GInputStreamPrivate;

/**
    Structure used for scatter/gather data input.
    You generally pass in an array of #GInputVectors
    and the operation will store the read data starting in the
    first buffer, switching to the next as needed.
*/
struct GInputVector
{
  /**
      Pointer to a buffer where data will be written.
  */
  void* buffer;

  /**
      the available size in @buffer.
  */
  size_t size;
}

/**
    [gio.list_model.ListModel] is an interface that represents a mutable list of
    [gobject.object.ObjectWrap]. Its main intention is as a model for various widgets
    in user interfaces, such as list views, but it can also be used as a
    convenient method of returning lists of data, with support for
    updates.
    
    Each object in the list may also report changes in itself via some
    mechanism (normally the [gobject.object.ObjectWrap.notify] signal).  Taken
    together with the `signal@Gio.ListModel::items-changed` signal, this provides
    for a list that can change its membership, and in which the members can
    change their individual properties.
    
    A good example would be the list of visible wireless network access
    points, where each access point can report dynamic properties such as
    signal strength.
    
    It is important to note that the [gio.list_model.ListModel] itself does not report
    changes to the individual items.  It only reports changes to the list
    membership.  If you want to observe changes to the objects themselves
    then you need to connect signals to the objects that you are
    interested in.
    
    All items in a [gio.list_model.ListModel] are of (or derived from) the same type.
    [gio.list_model.ListModel.getItemType] returns that type.  The type may be an
    interface, in which case all objects in the list must implement it.
    
    The semantics are close to that of an array:
    [gio.list_model.ListModel.getNItems] returns the number of items in the list
    and [gio.list_model.ListModel.getItem] returns an item at a (0-based) position.
    In order to allow implementations to calculate the list length lazily,
    you can also iterate over items: starting from 0, repeatedly call
    [gio.list_model.ListModel.getItem] until it returns `NULL`.
    
    An implementation may create objects lazily, but must take care to
    return the same object for a given position until all references to
    it are gone.
    
    On the other side, a consumer is expected only to hold references on
    objects that are currently ‘user visible’, in order to facilitate the
    maximum level of laziness in the implementation of the list and to
    reduce the required number of signal connections at a given time.
    
    This interface is intended only to be used from a single thread.  The
    thread in which it is appropriate to use it depends on the particular
    implementation, but typically it will be from the thread that owns
    the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) in effect at the time that the
    model was created.
    
    Over time, it has established itself as good practice for list model
    implementations to provide properties `item-type` and `n-items` to
    ease working with them. While it is not required, it is recommended
    that implementations provide these two properties. They should return
    the values of [gio.list_model.ListModel.getItemType] and
    [gio.list_model.ListModel.getNItems] respectively and be defined as such:
    
    ```c
    properties[PROP_ITEM_TYPE] =
      g_param_spec_gtype ("item-type", NULL, NULL, G_TYPE_OBJECT,
                          G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
    properties[PROP_N_ITEMS] =
      g_param_spec_uint ("n-items", NULL, NULL, 0, G_MAXUINT, 0,
                         G_PARAM_READABLE | G_PARAM_STATIC_STRINGS);
    ```
*/
struct GListModel;

/**
    The virtual function table for #GListModel.
*/
struct GListModelInterface
{
  /**
      parent #GTypeInterface
  */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.list_model.ListModel.getItemType]
  */
  extern(C) GType function(GListModel* list) getItemType;

  /**
      the virtual function pointer for [gio.list_model.ListModel.getNItems]
  */
  extern(C) uint function(GListModel* list) getNItems;

  /**
      the virtual function pointer for [gio.list_model.ListModel.getItem]
  */
  extern(C) GObject* function(GListModel* list, uint position) getItem;
}

/**
    [gio.list_store.ListStore] is a simple implementation of [gio.list_model.ListModel] that stores
    all items in memory.
    
    It provides insertions, deletions, and lookups in logarithmic time
    with a fast path for the common case of iterating the list linearly.
*/
struct GListStore;

/** */
struct GListStoreClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gio.loadable_icon.LoadableIcon] extends the [gio.icon.Icon] interface and adds the ability
    to load icons from streams.
*/
struct GLoadableIcon;

/**
    Interface for icons that can be loaded as a stream.
*/
struct GLoadableIconIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Loads an icon.
  */
  extern(C) GInputStream* function(GLoadableIcon* icon, int size, char** type, GCancellable* cancellable, GError** _err) load;

  /**
      Loads an icon asynchronously.
  */
  extern(C) void function(GLoadableIcon* icon, int size, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) loadAsync;

  /**
      Finishes an asynchronous icon load.
  */
  extern(C) GInputStream* function(GLoadableIcon* icon, GAsyncResult* res, char** type, GError** _err) loadFinish;
}

/**
    [gio.memory_input_stream.MemoryInputStream] is a class for using arbitrary
    memory chunks as input for GIO streaming input operations.
    
    As of GLib 2.34, [gio.memory_input_stream.MemoryInputStream] implements
    [gio.pollable_input_stream.PollableInputStream].
*/
struct GMemoryInputStream
{
  /** */
  GInputStream parentInstance;

  /** */
  GMemoryInputStreamPrivate* priv;
}

/** */
struct GMemoryInputStreamClass
{
  /** */
  GInputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GMemoryInputStreamPrivate;

/**
    [gio.memory_monitor.MemoryMonitor] will monitor system memory and suggest to the application
    when to free memory so as to leave more room for other applications.
    It is implemented on Linux using the
    [Low Memory Monitor](https://gitlab.freedesktop.org/hadess/low-memory-monitor/)
    ([API documentation](https://hadess.pages.freedesktop.org/low-memory-monitor/)).
    
    There is also an implementation for use inside Flatpak sandboxes.
    
    Possible actions to take when the signal is received are:
    
     $(LIST
        * Free caches
        * Save files that haven’t been looked at in a while to disk, ready to be reopened when needed
        * Run a garbage collection cycle
        * Try and compress fragmented allocations
        * Exit on idle if the process has no reason to stay around
        * Call [`malloc_trim(3)`](man:malloc_trim(3)) to return cached heap pages to
          the kernel (if supported by your libc)
     )
       
    Note that some actions may not always improve system performance, and so
    should be profiled for your application. `malloc_trim()`, for example, may
    make future heap allocations slower (due to releasing cached heap pages back
    to the kernel).
    
    See [gio.types.MemoryMonitorWarningLevel] for details on the various warning
    levels.
    
    ```c
    static void
    warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)
    {
      g_debug ("Warning level: %d", level);
      if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
        drop_caches ();
    }
    
    static GMemoryMonitor *
    monitor_low_memory (void)
    {
      GMemoryMonitor *m;
      m = g_memory_monitor_dup_default ();
      g_signal_connect (G_OBJECT (m), "low-memory-warning",
                        G_CALLBACK (warning_cb), NULL);
      return m;
    }
    ```
    
    Don’t forget to disconnect the `signal@Gio.MemoryMonitor::low-memory-warning`
    signal, and unref the [gio.memory_monitor.MemoryMonitor] itself when exiting.
*/
struct GMemoryMonitor;

/**
    The virtual function table for #GMemoryMonitor.
*/
struct GMemoryMonitorInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      the virtual function pointer for the
       #GMemoryMonitor::low-memory-warning signal.
  */
  extern(C) void function(GMemoryMonitor* monitor, GMemoryMonitorWarningLevel level) lowMemoryWarning;
}

/**
    [gio.memory_output_stream.MemoryOutputStream] is a class for using arbitrary
    memory chunks as output for GIO streaming output operations.
    
    As of GLib 2.34, [gio.memory_output_stream.MemoryOutputStream] trivially implements
    [gio.pollable_output_stream.PollableOutputStream]: it always polls as ready.
*/
struct GMemoryOutputStream
{
  /** */
  GOutputStream parentInstance;

  /** */
  GMemoryOutputStreamPrivate* priv;
}

/** */
struct GMemoryOutputStreamClass
{
  /** */
  GOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GMemoryOutputStreamPrivate;

/**
    [gio.menu.Menu] is a simple implementation of [gio.menu_model.MenuModel].
    You populate a [gio.menu.Menu] by adding [gio.menu_item.MenuItem] instances to it.
    
    There are some convenience functions to allow you to directly
    add items (avoiding [gio.menu_item.MenuItem]) for the common cases. To add
    a regular item, use [gio.menu.Menu.insert]. To add a section, use
    [gio.menu.Menu.insertSection]. To add a submenu, use
    [gio.menu.Menu.insertSubmenu].
*/
struct GMenu;

/**
    #GMenuAttributeIter is an opaque structure type.  You must access it
    using the functions below.
*/
struct GMenuAttributeIter
{
  /** */
  GObject parentInstance;

  /** */
  GMenuAttributeIterPrivate* priv;
}

/** */
struct GMenuAttributeIterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GMenuAttributeIter* iter, const(char*)* outName, GVariant** value) getNext;
}

/** */
struct GMenuAttributeIterPrivate;

/**
    #GMenuItem is an opaque structure type.  You must access it using the
    functions below.
*/
struct GMenuItem;

/**
    #GMenuLinkIter is an opaque structure type.  You must access it using
    the functions below.
*/
struct GMenuLinkIter
{
  /** */
  GObject parentInstance;

  /** */
  GMenuLinkIterPrivate* priv;
}

/** */
struct GMenuLinkIterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GMenuLinkIter* iter, const(char*)* outLink, GMenuModel** value) getNext;
}

/** */
struct GMenuLinkIterPrivate;

/**
    [gio.menu_model.MenuModel] represents the contents of a menu — an ordered list of
    menu items. The items are associated with actions, which can be
    activated through them. Items can be grouped in sections, and may
    have submenus associated with them. Both items and sections usually
    have some representation data, such as labels or icons. The type of
    the associated action (ie whether it is stateful, and what kind of
    state it has) can influence the representation of the item.
    
    The conceptual model of menus in [gio.menu_model.MenuModel] is hierarchical:
    sections and submenus are again represented by [gio.menu_model.MenuModel]s.
    Menus themselves do not define their own roles. Rather, the role
    of a particular [gio.menu_model.MenuModel] is defined by the item that references
    it (or, in the case of the ‘root’ menu, is defined by the context
    in which it is used).
    
    As an example, consider the visible portions of this menu:
    
    ## An example menu
    
    ![](menu-example.png)
    
    There are 8 ‘menus’ visible in the screenshot: one menubar, two
    submenus and 5 sections:
    
    $(LIST
      * the toplevel menubar (containing 4 items)
      * the View submenu (containing 3 sections)
      * the first section of the View submenu (containing 2 items)
      * the second section of the View submenu (containing 1 item)
      * the final section of the View submenu (containing 1 item)
      * the Highlight Mode submenu (containing 2 sections)
      * the Sources section (containing 2 items)
      * the Markup section (containing 2 items)
    )
      
    The [example](#a-menu-example) illustrates the conceptual connection between
    these 8 menus. Each large block in the figure represents a menu and the
    smaller blocks within the large block represent items in that menu. Some
    items contain references to other menus.
    
    ## A menu example
    
    ![](menu-model.png)
    
    Notice that the separators visible in the [example](#an-example-menu)
    appear nowhere in the [menu model](#a-menu-example). This is because
    separators are not explicitly represented in the menu model. Instead,
    a separator is inserted between any two non-empty sections of a menu.
    Section items can have labels just like any other item. In that case,
    a display system may show a section header instead of a separator.
    
    The motivation for this abstract model of application controls is
    that modern user interfaces tend to make these controls available
    outside the application. Examples include global menus, jumplists,
    dash boards, etc. To support such uses, it is necessary to ‘export’
    information about actions and their representation in menus, which
    is exactly what the action group exporter and the menu model exporter do for
    [gio.action_group.ActionGroup] and [gio.menu_model.MenuModel]. The client-side
    counterparts to make use of the exported information are
    [gio.dbus_action_group.DBusActionGroup] and [gio.dbus_menu_model.DBusMenuModel].
    
    The API of [gio.menu_model.MenuModel] is very generic, with iterators for the
    attributes and links of an item, see
    [gio.menu_model.MenuModel.iterateItemAttributes] and
    [gio.menu_model.MenuModel.iterateItemLinks]. The ‘standard’ attributes and
    link types have predefined names: [gio.types.MENU_ATTRIBUTE_LABEL],
    [gio.types.MENU_ATTRIBUTE_ACTION], [gio.types.MENU_ATTRIBUTE_TARGET], [gio.types.MENU_LINK_SECTION]
    and [gio.types.MENU_LINK_SUBMENU].
    
    Items in a [gio.menu_model.MenuModel] represent active controls if they refer to
    an action that can get activated when the user interacts with the
    menu item. The reference to the action is encoded by the string ID
    in the [gio.types.MENU_ATTRIBUTE_ACTION] attribute. An action ID uniquely
    identifies an action in an action group. Which action group(s) provide
    actions depends on the context in which the menu model is used.
    E.g. when the model is exported as the application menu of a
    [[gtk.application.Application]](https://docs.gtk.org/gtk4/class.Application.html),
    actions can be application-wide or window-specific (and thus come from
    two different action groups). By convention, the application-wide actions
    have names that start with `app.`, while the names of window-specific
    actions start with `win.`.
    
    While a wide variety of stateful actions is possible, the following
    is the minimum that is expected to be supported by all users of exported
    menu information:
    $(LIST
      * an action with no parameter type and no state
      * an action with no parameter type and boolean state
      * an action with string parameter type and string state
    )
      
    ## Stateless
    
    A stateless action typically corresponds to an ordinary menu item.
    
    Selecting such a menu item will activate the action (with no parameter).
    
    ## Boolean State
    
    An action with a boolean state will most typically be used with a ‘toggle’
    or ‘switch’ menu item. The state can be set directly, but activating the
    action (with no parameter) results in the state being toggled.
    
    Selecting a toggle menu item will activate the action. The menu item should
    be rendered as ‘checked’ when the state is true.
    
    ## String Parameter and State
    
    Actions with string parameters and state will most typically be used to
    represent an enumerated choice over the items available for a group of
    radio menu items. Activating the action with a string parameter is
    equivalent to setting that parameter as the state.
    
    Radio menu items, in addition to being associated with the action, will
    have a target value. Selecting that menu item will result in activation
    of the action with the target value as the parameter. The menu item should
    be rendered as ‘selected’ when the state of the action is equal to the
    target value of the menu item.
*/
struct GMenuModel
{
  /** */
  GObject parentInstance;

  /** */
  GMenuModelPrivate* priv;
}

/** */
struct GMenuModelClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GMenuModel* model) isMutable;

  /** */
  extern(C) int function(GMenuModel* model) getNItems;

  /** */
  extern(C) void function(GMenuModel* model, int itemIndex, GHashTable** attributes) getItemAttributes;

  /** */
  extern(C) GMenuAttributeIter* function(GMenuModel* model, int itemIndex) iterateItemAttributes;

  /** */
  extern(C) GVariant* function(GMenuModel* model, int itemIndex, const(char)* attribute, const(GVariantType)* expectedType) getItemAttributeValue;

  /** */
  extern(C) void function(GMenuModel* model, int itemIndex, GHashTable** links) getItemLinks;

  /** */
  extern(C) GMenuLinkIter* function(GMenuModel* model, int itemIndex) iterateItemLinks;

  /** */
  extern(C) GMenuModel* function(GMenuModel* model, int itemIndex, const(char)* link) getItemLink;
}

/** */
struct GMenuModelPrivate;

/**
    The [gio.mount.Mount] interface represents user-visible mounts. Note, when
    [porting from GnomeVFS](migrating-gnome-vfs.html), [gio.mount.Mount] is the moral
    equivalent of `GnomeVFSVolume`.
    
    [gio.mount.Mount] is a ‘mounted’ filesystem that you can access. Mounted is in
    quotes because it’s not the same as a UNIX mount, it might be a GVFS
    mount, but you can still access the files on it if you use GIO. Might or
    might not be related to a volume object.
    
    Unmounting a [gio.mount.Mount] instance is an asynchronous operation. For
    more information about asynchronous operations, see [gio.async_result.AsyncResult]
    and [gio.task.Task]. To unmount a [gio.mount.Mount] instance, first call
    [gio.mount.Mount.unmountWithOperation] with (at least) the [gio.mount.Mount]
    instance and a [gio.types.AsyncReadyCallback].  The callback will be fired
    when the operation has resolved (either with success or failure), and a
    [gio.async_result.AsyncResult] structure will be passed to the callback.  That
    callback should then call [gio.mount.Mount.unmountWithOperationFinish]
    with the [gio.mount.Mount] and the [gio.async_result.AsyncResult] data to see if the
    operation was completed successfully.  If an `error` is present when
    [gio.mount.Mount.unmountWithOperationFinish] is called, then it will be
    filled with any error information.
*/
struct GMount;

/**
    Interface for implementing operations for mounts.
*/
struct GMountIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Changed signal that is emitted when the mount's state has changed.
  */
  extern(C) void function(GMount* mount) changed;

  /**
      The unmounted signal that is emitted when the #GMount have been unmounted. If the recipient is holding references to the object they should release them so the object can be finalized.
  */
  extern(C) void function(GMount* mount) unmounted;

  /**
      Gets a #GFile to the root directory of the #GMount.
  */
  extern(C) GFile* function(GMount* mount) getRoot;

  /**
      Gets a string containing the name of the #GMount.
  */
  extern(C) char* function(GMount* mount) getName;

  /**
      Gets a #GIcon for the #GMount.
  */
  extern(C) GIcon* function(GMount* mount) getIcon;

  /**
      Gets the UUID for the #GMount. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque string. Returns null if there is no UUID available.
  */
  extern(C) char* function(GMount* mount) getUuid;

  /**
      Gets a #GVolume the mount is located on. Returns null if the #GMount is not associated with a #GVolume.
  */
  extern(C) GVolume* function(GMount* mount) getVolume;

  /**
      Gets a #GDrive the volume of the mount is located on. Returns null if the #GMount is not associated with a #GDrive or a #GVolume. This is convenience method for getting the #GVolume and using that to get the #GDrive.
  */
  extern(C) GDrive* function(GMount* mount) getDrive;

  /**
      Checks if a #GMount can be unmounted.
  */
  extern(C) gboolean function(GMount* mount) canUnmount;

  /**
      Checks if a #GMount can be ejected.
  */
  extern(C) gboolean function(GMount* mount) canEject;

  /**
      Starts unmounting a #GMount.
  */
  extern(C) void function(GMount* mount, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) unmount;

  /**
      Finishes an unmounting operation.
  */
  extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) unmountFinish;

  /**
      Starts ejecting a #GMount.
  */
  extern(C) void function(GMount* mount, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) eject;

  /**
      Finishes an eject operation.
  */
  extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) ejectFinish;

  /**
      Starts remounting a #GMount.
  */
  extern(C) void function(GMount* mount, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) remount;

  /**
      Finishes a remounting operation.
  */
  extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) remountFinish;

  /**
      Starts guessing the type of the content of a #GMount.
          See [gio.mount.Mount.guessContentType] for more information on content
          type guessing. This operation was added in 2.18.
  */
  extern(C) void function(GMount* mount, gboolean forceRescan, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) guessContentType;

  /**
      Finishes a content type guessing operation. Added in 2.18.
  */
  extern(C) char** function(GMount* mount, GAsyncResult* result, GError** _err) guessContentTypeFinish;

  /**
      Synchronous variant of @guess_content_type. Added in 2.18
  */
  extern(C) char** function(GMount* mount, gboolean forceRescan, GCancellable* cancellable, GError** _err) guessContentTypeSync;

  /**
      The ::pre-unmount signal that is emitted when the #GMount will soon be emitted. If the recipient is somehow holding the mount open by keeping an open file on it it should close the file.
  */
  extern(C) void function(GMount* mount) preUnmount;

  /**
      Starts unmounting a #GMount using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GMount* mount, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) unmountWithOperation;

  /**
      Finishes an unmounting operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) unmountWithOperationFinish;

  /**
      Starts ejecting a #GMount using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GMount* mount, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ejectWithOperation;

  /**
      Finishes an eject operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GMount* mount, GAsyncResult* result, GError** _err) ejectWithOperationFinish;

  /**
      Gets a #GFile indication a start location that can be use as the entry point for this mount. Since 2.24.
  */
  extern(C) GFile* function(GMount* mount) getDefaultLocation;

  /**
      Gets a key used for sorting #GMount instance or null if no such key exists. Since 2.32.
  */
  extern(C) const(char)* function(GMount* mount) getSortKey;

  /**
      Gets a symbolic #GIcon for the #GMount. Since 2.34.
  */
  extern(C) GIcon* function(GMount* mount) getSymbolicIcon;
}

/**
    [gio.mount_operation.MountOperation] provides a mechanism for interacting with the user.
    It can be used for authenticating mountable operations, such as loop
    mounting files, hard drive partitions or server locations. It can
    also be used to ask the user questions or show a list of applications
    preventing unmount or eject operations from completing.
    
    Note that [gio.mount_operation.MountOperation] is used for more than just [gio.mount.Mount]
    objects – for example it is also used in [gio.drive.Drive.start] and
    [gio.drive.Drive.stop].
    
    Users should instantiate a subclass of this that implements all the
    various callbacks to show the required dialogs, such as
    [[gtk.mount_operation.MountOperation]](https://docs.gtk.org/gtk4/class.MountOperation.html).
    If no user interaction is desired (for example when automounting
    filesystems at login time), usually `NULL` can be passed, see each method
    taking a [gio.mount_operation.MountOperation] for details.
    
    Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with TrueCrypt and VeraCrypt’.
    [TrueCrypt](https://en.wikipedia.org/wiki/TrueCrypt) is a discontinued system for
    encrypting file containers, partitions or whole disks, typically used with Windows.
    [VeraCrypt](https://www.veracrypt.fr/) is a maintained fork of TrueCrypt with various
    improvements and auditing fixes.
*/
struct GMountOperation
{
  /** */
  GObject parentInstance;

  /** */
  GMountOperationPrivate* priv;
}

/** */
struct GMountOperationClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GMountOperation* op, const(char)* message, const(char)* defaultUser, const(char)* defaultDomain, GAskPasswordFlags flags) askPassword;

  /** */
  extern(C) void function(GMountOperation* op, const(char)* message, const(char*)* choices) askQuestion;

  /** */
  extern(C) void function(GMountOperation* op, GMountOperationResult result) reply;

  /** */
  extern(C) void function(GMountOperation* op) aborted;

  /** */
  extern(C) void function(GMountOperation* op, const(char)* message, GArray* processes, const(char*)* choices) showProcesses;

  /** */
  extern(C) void function(GMountOperation* op, const(char)* message, long timeLeft, long bytesLeft) showUnmountProgress;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;

  /** */
  extern(C) void function() GReserved8;

  /** */
  extern(C) void function() GReserved9;
}

/** */
struct GMountOperationPrivate;

/**
    A socket address of some unknown native type.
    
    This corresponds to a general `struct sockaddr` of a type not otherwise
    handled by GLib.
*/
struct GNativeSocketAddress
{
  /** */
  GSocketAddress parentInstance;

  /** */
  GNativeSocketAddressPrivate* priv;
}

/** */
struct GNativeSocketAddressClass
{
  /** */
  GSocketAddressClass parentClass;
}

/** */
struct GNativeSocketAddressPrivate;

/** */
struct GNativeVolumeMonitor
{
  /** */
  GVolumeMonitor parentInstance;
}

/** */
struct GNativeVolumeMonitorClass
{
  /** */
  GVolumeMonitorClass parentClass;

  /** */
  extern(C) GMount* function(const(char)* mountPath, GCancellable* cancellable) getMountForMountPath;
}

/**
    [gio.network_address.NetworkAddress] provides an easy way to resolve a hostname and
    then attempt to connect to that host, handling the possibility of
    multiple IP addresses and multiple address families.
    
    The enumeration results of resolved addresses *may* be cached as long
    as this object is kept alive which may have unexpected results if
    alive for too long.
    
    See [gio.socket_connectable.SocketConnectable] for an example of using the connectable
    interface.
*/
struct GNetworkAddress
{
  /** */
  GObject parentInstance;

  /** */
  GNetworkAddressPrivate* priv;
}

/** */
struct GNetworkAddressClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GNetworkAddressPrivate;

/**
    [gio.network_monitor.NetworkMonitor] provides an easy-to-use cross-platform API
    for monitoring network connectivity. On Linux, the available
    implementations are based on the kernel's netlink interface and
    on NetworkManager.
    
    There is also an implementation for use inside Flatpak sandboxes.
*/
struct GNetworkMonitor;

/**
    The virtual function table for #GNetworkMonitor.
*/
struct GNetworkMonitorInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      the virtual function pointer for the
       GNetworkMonitor::network-changed signal.
  */
  extern(C) void function(GNetworkMonitor* monitor, gboolean networkAvailable) networkChanged;

  /**
      the virtual function pointer for [gio.network_monitor.NetworkMonitor.canReach]
  */
  extern(C) gboolean function(GNetworkMonitor* monitor, GSocketConnectable* connectable, GCancellable* cancellable, GError** _err) canReach;

  /**
      the virtual function pointer for
       [gio.network_monitor.NetworkMonitor.canReachAsync]
  */
  extern(C) void function(GNetworkMonitor* monitor, GSocketConnectable* connectable, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) canReachAsync;

  /**
      the virtual function pointer for
       [gio.network_monitor.NetworkMonitor.canReachFinish]
  */
  extern(C) gboolean function(GNetworkMonitor* monitor, GAsyncResult* result, GError** _err) canReachFinish;
}

/**
    Like [gio.network_address.NetworkAddress] does with hostnames, [gio.network_service.NetworkService]
    provides an easy way to resolve a SRV record, and then attempt to
    connect to one of the hosts that implements that service, handling
    service priority/weighting, multiple IP addresses, and multiple
    address families.
    
    See [gio.srv_target.SrvTarget] for more information about SRV records, and see
    [gio.socket_connectable.SocketConnectable] for an example of using the connectable
    interface.
*/
struct GNetworkService
{
  /** */
  GObject parentInstance;

  /** */
  GNetworkServicePrivate* priv;
}

/** */
struct GNetworkServiceClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GNetworkServicePrivate;

/**
    [gio.notification.Notification] is a mechanism for creating a notification to be shown
    to the user — typically as a pop-up notification presented by the
    desktop environment shell.
    
    The key difference between [gio.notification.Notification] and other similar APIs is
    that, if supported by the desktop environment, notifications sent
    with [gio.notification.Notification] will persist after the application has exited,
    and even across system reboots.
    
    Since the user may click on a notification while the application is
    not running, applications using [gio.notification.Notification] should be able to be
    started as a D-Bus service, using [gio.application.Application].
    
    In order for [gio.notification.Notification] to work, the application must have installed
    a `.desktop` file. For example:
    ```
    [Desktop Entry]
    Name=Test Application
    Comment=Description of what Test Application does
    Exec=gnome-test-application
    Icon=org.gnome.TestApplication
    Terminal=false
    Type=Application
    Categories=GNOME;GTK;TestApplication Category;
    StartupNotify=true
    DBusActivatable=true
    X-GNOME-UsesNotifications=true
    ```
    
    The `X-GNOME-UsesNotifications` key indicates to GNOME Control Center
    that this application uses notifications, so it can be listed in the
    Control Center’s ‘Notifications’ panel.
    
    The `.desktop` file must be named as `org.gnome.TestApplication.desktop`,
    where `org.gnome.TestApplication` is the ID passed to
    [gio.application.Application.new_].
    
    User interaction with a notification (either the default action, or
    buttons) must be associated with actions on the application (ie:
    `app.` actions).  It is not possible to route user interaction
    through the notification itself, because the object will not exist if
    the application is autostarted as a result of a notification being
    clicked.
    
    A notification can be sent with [gio.application.Application.sendNotification].
*/
struct GNotification;

/**
    Structure used for scatter/gather data output when sending multiple
    messages or packets in one go. You generally pass in an array of
    #GOutputVectors and the operation will use all the buffers as if they
    were one buffer.
    
    If @address is null then the message is sent to the default receiver
    (as previously set by [gio.socket.Socket.connect]).
*/
struct GOutputMessage
{
  /**
      a #GSocketAddress, or null
  */
  GSocketAddress* address;

  /**
      pointer to an array of output vectors
  */
  GOutputVector* vectors;

  /**
      the number of output vectors pointed to by @vectors.
  */
  uint numVectors;

  /**
      initialize to 0. Will be set to the number of bytes
          that have been sent
  */
  uint bytesSent;

  /**
      a pointer
        to an array of #GSocketControlMessages, or null.
  */
  GSocketControlMessage** controlMessages;

  /**
      number of elements in @control_messages.
  */
  uint numControlMessages;
}

/**
    [gio.output_stream.OutputStream] is a base class for implementing streaming output.
    
    It has functions to write to a stream ([gio.output_stream.OutputStream.write]),
    to close a stream ([gio.output_stream.OutputStream.close]) and to flush pending
    writes ([gio.output_stream.OutputStream.flush]).
    
    To copy the content of an input stream to an output stream without
    manually handling the reads and writes, use [gio.output_stream.OutputStream.splice].
    
    See the documentation for [gio.iostream.IOStream] for details of thread safety
    of streaming APIs.
    
    All of these functions have async variants too.
    
    All classes derived from [gio.output_stream.OutputStream] *should* implement synchronous
    writing, splicing, flushing and closing streams, but *may* implement
    asynchronous versions.
*/
struct GOutputStream
{
  /** */
  GObject parentInstance;

  /** */
  GOutputStreamPrivate* priv;
}

/** */
struct GOutputStreamClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) ptrdiff_t function(GOutputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) writeFn;

  /** */
  extern(C) ptrdiff_t function(GOutputStream* stream, GInputStream* source, GOutputStreamSpliceFlags flags, GCancellable* cancellable, GError** _err) splice;

  /** */
  extern(C) gboolean function(GOutputStream* stream, GCancellable* cancellable, GError** _err) flush;

  /** */
  extern(C) gboolean function(GOutputStream* stream, GCancellable* cancellable, GError** _err) closeFn;

  /** */
  extern(C) void function(GOutputStream* stream, void* buffer, size_t count, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) writeAsync;

  /** */
  extern(C) ptrdiff_t function(GOutputStream* stream, GAsyncResult* result, GError** _err) writeFinish;

  /** */
  extern(C) void function(GOutputStream* stream, GInputStream* source, GOutputStreamSpliceFlags flags, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) spliceAsync;

  /** */
  extern(C) ptrdiff_t function(GOutputStream* stream, GAsyncResult* result, GError** _err) spliceFinish;

  /** */
  extern(C) void function(GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) flushAsync;

  /** */
  extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, GError** _err) flushFinish;

  /** */
  extern(C) void function(GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) closeAsync;

  /** */
  extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, GError** _err) closeFinish;

  /** */
  extern(C) gboolean function(GOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GCancellable* cancellable, GError** _err) writevFn;

  /** */
  extern(C) void function(GOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) writevAsync;

  /** */
  extern(C) gboolean function(GOutputStream* stream, GAsyncResult* result, size_t* bytesWritten, GError** _err) writevFinish;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;

  /** */
  extern(C) void function() GReserved8;
}

/** */
struct GOutputStreamPrivate;

/**
    Structure used for scatter/gather data output.
    You generally pass in an array of #GOutputVectors
    and the operation will use all the buffers as if they were
    one buffer.
*/
struct GOutputVector
{
  /**
      Pointer to a buffer of data to read.
  */
  const(void)* buffer;

  /**
      the size of @buffer.
  */
  size_t size;
}

/**
    A [gio.permission.Permission] represents the status of the caller’s permission to
    perform a certain action.
    
    You can query if the action is currently allowed and if it is
    possible to acquire the permission so that the action will be allowed
    in the future.
    
    There is also an API to actually acquire the permission and one to
    release it.
    
    As an example, a [gio.permission.Permission] might represent the ability for the
    user to write to a [gio.settings.Settings] object.  This [gio.permission.Permission] object
    could then be used to decide if it is appropriate to show a “Click here to
    unlock” button in a dialog and to provide the mechanism to invoke
    when that button is clicked.
*/
struct GPermission
{
  /** */
  GObject parentInstance;

  /** */
  GPermissionPrivate* priv;
}

/** */
struct GPermissionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GPermission* permission, GCancellable* cancellable, GError** _err) acquire;

  /** */
  extern(C) void function(GPermission* permission, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) acquireAsync;

  /** */
  extern(C) gboolean function(GPermission* permission, GAsyncResult* result, GError** _err) acquireFinish;

  /** */
  extern(C) gboolean function(GPermission* permission, GCancellable* cancellable, GError** _err) release;

  /** */
  extern(C) void function(GPermission* permission, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) releaseAsync;

  /** */
  extern(C) gboolean function(GPermission* permission, GAsyncResult* result, GError** _err) releaseFinish;

  /** */
  void*[16] reserved;
}

/** */
struct GPermissionPrivate;

/**
    [gio.pollable_input_stream.PollableInputStream] is implemented by [gio.input_stream.InputStream]s that
    can be polled for readiness to read. This can be used when
    interfacing with a non-GIO API that expects
    UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
    
    Some classes may implement [gio.pollable_input_stream.PollableInputStream] but have only certain
    instances of that class be pollable. If [gio.pollable_input_stream.PollableInputStream.canPoll]
    returns false, then the behavior of other [gio.pollable_input_stream.PollableInputStream] methods is
    undefined.
*/
struct GPollableInputStream;

/**
    The interface for pollable input streams.
    
    The default implementation of @can_poll always returns true.
    
    The default implementation of @read_nonblocking calls
    [gio.pollable_input_stream.PollableInputStream.isReadable], and then calls
    [gio.input_stream.InputStream.read] if it returns true. This means you only need
    to override it if it is possible that your @is_readable
    implementation may return true when the stream is not actually
    readable.
*/
struct GPollableInputStreamInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Checks if the #GPollableInputStream instance is actually pollable
  */
  extern(C) gboolean function(GPollableInputStream* stream) canPoll;

  /**
      Checks if the stream is readable
  */
  extern(C) gboolean function(GPollableInputStream* stream) isReadable;

  /**
      Creates a #GSource to poll the stream
  */
  extern(C) GSource* function(GPollableInputStream* stream, GCancellable* cancellable) createSource;

  /**
      Does a non-blocking read or returns
        [gio.types.IOErrorEnum.WouldBlock]
  */
  extern(C) ptrdiff_t function(GPollableInputStream* stream, void* buffer, size_t count, GError** _err) readNonblocking;
}

/**
    [gio.pollable_output_stream.PollableOutputStream] is implemented by [gio.output_stream.OutputStream]s that
    can be polled for readiness to write. This can be used when
    interfacing with a non-GIO API that expects
    UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
    
    Some classes may implement [gio.pollable_output_stream.PollableOutputStream] but have only certain
    instances of that class be pollable. If [gio.pollable_output_stream.PollableOutputStream.canPoll]
    returns false, then the behavior of other [gio.pollable_output_stream.PollableOutputStream] methods is
    undefined.
*/
struct GPollableOutputStream;

/**
    The interface for pollable output streams.
    
    The default implementation of @can_poll always returns true.
    
    The default implementation of @write_nonblocking calls
    [gio.pollable_output_stream.PollableOutputStream.isWritable], and then calls
    [gio.output_stream.OutputStream.write] if it returns true. This means you only
    need to override it if it is possible that your @is_writable
    implementation may return true when the stream is not actually
    writable.
    
    The default implementation of @writev_nonblocking calls
    [gio.pollable_output_stream.PollableOutputStream.writeNonblocking] for each vector, and converts
    its return value and error (if set) to a #GPollableReturn. You should
    override this where possible to avoid having to allocate a #GError to return
    [gio.types.IOErrorEnum.WouldBlock].
*/
struct GPollableOutputStreamInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Checks if the #GPollableOutputStream instance is actually pollable
  */
  extern(C) gboolean function(GPollableOutputStream* stream) canPoll;

  /**
      Checks if the stream is writable
  */
  extern(C) gboolean function(GPollableOutputStream* stream) isWritable;

  /**
      Creates a #GSource to poll the stream
  */
  extern(C) GSource* function(GPollableOutputStream* stream, GCancellable* cancellable) createSource;

  /**
      Does a non-blocking write or returns
        [gio.types.IOErrorEnum.WouldBlock]
  */
  extern(C) ptrdiff_t function(GPollableOutputStream* stream, void* buffer, size_t count, GError** _err) writeNonblocking;

  /**
      Does a vectored non-blocking write, or returns
        [gio.types.PollableReturn.WouldBlock]
  */
  extern(C) GPollableReturn function(GPollableOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GError** _err) writevNonblocking;
}

/**
    [gio.power_profile_monitor.PowerProfileMonitor] makes it possible for applications as well as OS
    components to monitor system power profiles and act upon them. It currently
    only exports whether the system is in “Power Saver” mode (known as
    “Low Power” mode on some systems).
    
    When in “Low Power” mode, it is recommended that applications:
    $(LIST
      * disable automatic downloads;
      * reduce the rate of refresh from online sources such as calendar or
        email synchronisation;
      * reduce the use of expensive visual effects.
    )
      
    It is also likely that OS components providing services to applications will
    lower their own background activity, for the sake of the system.
    
    There are a variety of tools that exist for power consumption analysis, but those
    usually depend on the OS and hardware used. On Linux, one could use `upower` to
    monitor the battery discharge rate, `powertop` to check on the background activity
    or activity at all), `sysprof` to inspect CPU usage, and `intel_gpu_time` to
    profile GPU usage.
    
    Don’t forget to disconnect the [gobject.object.ObjectWrap.notify] signal for
    `property@Gio.PowerProfileMonitor:power-saver-enabled`, and unref the
    [gio.power_profile_monitor.PowerProfileMonitor] itself when exiting.
*/
struct GPowerProfileMonitor;

/**
    The virtual function table for #GPowerProfileMonitor.
*/
struct GPowerProfileMonitorInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;
}

/**
    A [gio.property_action.PropertyAction] is a way to get a [gio.action.Action] with a state value
    reflecting and controlling the value of a [gobject.object.ObjectWrap] property.
    
    The state of the action will correspond to the value of the property.
    Changing it will change the property (assuming the requested value
    matches the requirements as specified in the [gobject.param_spec.ParamSpec]).
    
    Only the most common types are presently supported.  Booleans are
    mapped to booleans, strings to strings, signed/unsigned integers to
    int32/uint32 and floats and doubles to doubles.
    
    If the property is an enum then the state will be string-typed and
    conversion will automatically be performed between the enum value and
    ‘nick’ string as per the [gobject.enum_value.EnumValue] table.
    
    Flags types are not currently supported.
    
    Properties of object types, boxed types and pointer types are not
    supported and probably never will be.
    
    Properties of [glib.variant.Variant] types are not currently supported.
    
    If the property is boolean-valued then the action will have a `NULL`
    parameter type, and activating the action (with no parameter) will
    toggle the value of the property.
    
    In all other cases, the parameter type will correspond to the type of
    the property.
    
    The general idea here is to reduce the number of locations where a
    particular piece of state is kept (and therefore has to be synchronised
    between). [gio.property_action.PropertyAction] does not have a separate state that is kept
    in sync with the property value — its state is the property value.
    
    For example, it might be useful to create a [gio.action.Action] corresponding
    to the `visible-child-name` property of a [[gtk.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html)
    so that the current page can be switched from a menu.  The active radio
    indication in the menu is then directly determined from the active page of
    the [gtk.stack.Stack].
    
    An anti-example would be binding the `active-id` property on a
    [[gtk.combo_box.ComboBox]](https://docs.gtk.org/gtk4/class.ComboBox.html). This is
    because the state of the combo box itself is probably uninteresting and is
    actually being used to control something else.
    
    Another anti-example would be to bind to the `visible-child-name`
    property of a [[gtk.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html) if
    this value is actually stored in [gio.settings.Settings].  In that case, the
    real source of the value is* [gio.settings.Settings].  If you want
    a [gio.action.Action] to control a setting stored in [gio.settings.Settings],
    see [gio.settings.Settings.createAction] instead, and possibly combine its
    use with [gio.settings.Settings.bind].
*/
struct GPropertyAction;

/**
    A [gio.proxy.Proxy] handles connecting to a remote host via a given type of
    proxy server. It is implemented by the `gio-proxy` extension point.
    The extensions are named after their proxy protocol name. As an
    example, a SOCKS5 proxy implementation can be retrieved with the
    name `socks5` using the function
    [gio.ioextension_point.IOExtensionPoint.getExtensionByName].
*/
struct GProxy;

/**
    A [gio.inet_socket_address.InetSocketAddress] representing a connection via a proxy server.
*/
struct GProxyAddress
{
  /** */
  GInetSocketAddress parentInstance;

  /** */
  GProxyAddressPrivate* priv;
}

/**
    Class structure for #GProxyAddress.
*/
struct GProxyAddressClass
{
  /** */
  GInetSocketAddressClass parentClass;
}

/**
    [gio.proxy_address_enumerator.ProxyAddressEnumerator] is a wrapper around
    [gio.socket_address_enumerator.SocketAddressEnumerator] which takes the [gio.socket_address.SocketAddress]
    instances returned by the [gio.socket_address_enumerator.SocketAddressEnumerator]
    and wraps them in [gio.proxy_address.ProxyAddress] instances, using the given
    `property@Gio.ProxyAddressEnumerator:proxy-resolver`.
    
    This enumerator will be returned (for example, by
    [gio.socket_connectable.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [gio.socket_address_enumerator.SocketAddressEnumerator] instance with one.
*/
struct GProxyAddressEnumerator
{
  /** */
  GSocketAddressEnumerator parentInstance;

  /** */
  GProxyAddressEnumeratorPrivate* priv;
}

/**
    Class structure for #GProxyAddressEnumerator.
*/
struct GProxyAddressEnumeratorClass
{
  /** */
  GSocketAddressEnumeratorClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;
}

/** */
struct GProxyAddressEnumeratorPrivate;

/** */
struct GProxyAddressPrivate;

/**
    Provides an interface for handling proxy connection and payload.
*/
struct GProxyInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Connect to proxy server and wrap (if required) the #connection
                to handle payload.
  */
  extern(C) GIOStream* function(GProxy* proxy, GIOStream* connection, GProxyAddress* proxyAddress, GCancellable* cancellable, GError** _err) connect;

  /**
      Same as connect() but asynchronous.
  */
  extern(C) void function(GProxy* proxy, GIOStream* connection, GProxyAddress* proxyAddress, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) connectAsync;

  /**
      Returns the result of connect_async()
  */
  extern(C) GIOStream* function(GProxy* proxy, GAsyncResult* result, GError** _err) connectFinish;

  /**
      Returns whether the proxy supports hostname lookups.
  */
  extern(C) gboolean function(GProxy* proxy) supportsHostname;
}

/**
    [gio.proxy_resolver.ProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [gio.proxy_resolver.ProxyResolver] is used within [gio.socket_client.SocketClient] through
    the method [gio.socket_connectable.SocketConnectable.proxyEnumerate].
    
    Implementations of [gio.proxy_resolver.ProxyResolver] based on
    [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
    found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
    GIO comes with an implementation for use inside Flatpak portals.
*/
struct GProxyResolver;

/**
    The virtual function table for #GProxyResolver.
*/
struct GProxyResolverInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.proxy_resolver.ProxyResolver.isSupported]
  */
  extern(C) gboolean function(GProxyResolver* resolver) isSupported;

  /**
      the virtual function pointer for [gio.proxy_resolver.ProxyResolver.lookup]
  */
  extern(C) char** function(GProxyResolver* resolver, const(char)* uri, GCancellable* cancellable, GError** _err) lookup;

  /**
      the virtual function pointer for
       [gio.proxy_resolver.ProxyResolver.lookupAsync]
  */
  extern(C) void function(GProxyResolver* resolver, const(char)* uri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupAsync;

  /**
      the virtual function pointer for
       [gio.proxy_resolver.ProxyResolver.lookupFinish]
  */
  extern(C) char** function(GProxyResolver* resolver, GAsyncResult* result, GError** _err) lookupFinish;
}

/**
    The [gio.remote_action_group.RemoteActionGroup] interface is implemented by [gio.action_group.ActionGroup]
    instances that either transmit action invocations to other processes
    or receive action invocations in the local process from other
    processes.
    
    The interface has `_full` variants of the two
    methods on [gio.action_group.ActionGroup] used to activate actions:
    [gio.action_group.ActionGroup.activateAction] and
    [gio.action_group.ActionGroup.changeActionState]. These variants allow a
    ‘platform data’ [glib.variant.Variant] to be specified: a dictionary providing
    context for the action invocation (for example: timestamps, startup
    notification IDs, etc).
    
    [gio.dbus_action_group.DBusActionGroup] implements [gio.remote_action_group.RemoteActionGroup].  This provides a
    mechanism to send platform data for action invocations over D-Bus.
    
    Additionally, [gio.dbus_connection.DBusConnection.exportActionGroup] will check if
    the exported [gio.action_group.ActionGroup] implements [gio.remote_action_group.RemoteActionGroup] and use
    the `_full` variants of the calls if available.  This
    provides a mechanism by which to receive platform data for action
    invocations that arrive by way of D-Bus.
*/
struct GRemoteActionGroup;

/**
    The virtual function table for #GRemoteActionGroup.
*/
struct GRemoteActionGroupInterface
{
  /** */
  GTypeInterface gIface;

  /**
      the virtual function pointer for [gio.remote_action_group.RemoteActionGroup.activateActionFull]
  */
  extern(C) void function(GRemoteActionGroup* remote, const(char)* actionName, GVariant* parameter, GVariant* platformData) activateActionFull;

  /**
      the virtual function pointer for [gio.remote_action_group.RemoteActionGroup.changeActionStateFull]
  */
  extern(C) void function(GRemoteActionGroup* remote, const(char)* actionName, GVariant* value, GVariant* platformData) changeActionStateFull;
}

/**
    The object that handles DNS resolution. Use [gio.resolver.Resolver.getDefault]
    to get the default resolver.
    
    [gio.resolver.Resolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames ([gio.resolver.Resolver.lookupByAddress],
    [gio.resolver.Resolver.lookupByName] and their async variants) and SRV
    (service) records ([gio.resolver.Resolver.lookupService]).
    
    [gio.network_address.NetworkAddress] and [gio.network_service.NetworkService] provide wrappers
    around [gio.resolver.Resolver] functionality that also implement
    [gio.socket_connectable.SocketConnectable], making it easy to connect to a remote
    host/service.
    
    The default resolver (see [gio.resolver.Resolver.getDefault]) has a timeout of
    30s set on it since GLib 2.78. Earlier versions of GLib did not support
    resolver timeouts.
    
    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations.
*/
struct GResolver
{
  /** */
  GObject parentInstance;

  /** */
  GResolverPrivate* priv;
}

/** */
struct GResolverClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GResolver* resolver) reload;

  /** */
  extern(C) GList* function(GResolver* resolver, const(char)* hostname, GCancellable* cancellable, GError** _err) lookupByName;

  /** */
  extern(C) void function(GResolver* resolver, const(char)* hostname, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupByNameAsync;

  /** */
  extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) lookupByNameFinish;

  /** */
  extern(C) char* function(GResolver* resolver, GInetAddress* address, GCancellable* cancellable, GError** _err) lookupByAddress;

  /** */
  extern(C) void function(GResolver* resolver, GInetAddress* address, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupByAddressAsync;

  /** */
  extern(C) char* function(GResolver* resolver, GAsyncResult* result, GError** _err) lookupByAddressFinish;

  /** */
  extern(C) GList* function(GResolver* resolver, const(char)* rrname, GCancellable* cancellable, GError** _err) lookupService;

  /** */
  extern(C) void function(GResolver* resolver, const(char)* rrname, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupServiceAsync;

  /** */
  extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) lookupServiceFinish;

  /** */
  extern(C) GList* function(GResolver* resolver, const(char)* rrname, GResolverRecordType recordType, GCancellable* cancellable, GError** _err) lookupRecords;

  /** */
  extern(C) void function(GResolver* resolver, const(char)* rrname, GResolverRecordType recordType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupRecordsAsync;

  /** */
  extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) lookupRecordsFinish;

  /** */
  extern(C) void function(GResolver* resolver, const(char)* hostname, GResolverNameLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupByNameWithFlagsAsync;

  /** */
  extern(C) GList* function(GResolver* resolver, GAsyncResult* result, GError** _err) lookupByNameWithFlagsFinish;

  /** */
  extern(C) GList* function(GResolver* resolver, const(char)* hostname, GResolverNameLookupFlags flags, GCancellable* cancellable, GError** _err) lookupByNameWithFlags;
}

/** */
struct GResolverPrivate;

/**
    Applications and libraries often contain binary or textual data that is
    really part of the application, rather than user data. For instance
    [[gtk.builder.Builder]](https://docs.gtk.org/gtk4/class.Builder.html) `.ui` files,
    splashscreen images, [gio.menu.Menu] markup XML, CSS files, icons, etc.
    These are often shipped as files in `$datadir/appname`, or manually
    included as literal strings in the code.
    
    The [gio.resource.Resource] API and the
    [`glib-compile-resources`](glib-compile-resources.html) program provide a
    convenient and efficient alternative to this which has some nice properties.
    You maintain the files as normal files, so it’s easy to edit them, but during
    the build the files are combined into a binary bundle that is linked into the
    executable. This means that loading the resource files are efficient (as they
    are already in memory, shared with other instances) and simple (no need to
    check for things like I/O errors or locate the files in the filesystem). It
    also makes it easier to create relocatable applications.
    
    Resource files can also be marked as compressed. Such files will be included
    in the resource bundle in a compressed form, but will be automatically
    uncompressed when the resource is used. This is very useful e.g. for larger
    text files that are parsed once (or rarely) and then thrown away.
    
    Resource files can also be marked to be preprocessed, by setting the value of the
    `preprocess` attribute to a comma-separated list of preprocessing options.
    The only options currently supported are:
    
     $(LIST
        * `xml-stripblanks` which will use the [`xmllint`](man:xmllint(1)) command
          to strip ignorable whitespace from the XML file. For this to work,
          the `XMLLINT` environment variable must be set to the full path to
          the xmllint executable, or xmllint must be in the `PATH`; otherwise
          the preprocessing step is skipped.
       
        * `to-pixdata` (deprecated since gdk-pixbuf 2.32) which will use the
          `gdk-pixbuf-pixdata` command to convert images to the [`GdkPixdata`](https://docs.gtk.org/gdk-pixbuf/class.Pixdata.html)
          format, which allows you to create pixbufs directly using the data inside
          the resource file, rather than an (uncompressed) copy of it. For this, the
          `gdk-pixbuf-pixdata` program must be in the `PATH`, or the
          `GDK_PIXBUF_PIXDATA` environment variable must be set to the full path to
          the `gdk-pixbuf-pixdata` executable; otherwise the resource compiler will
          abort. `to-pixdata` has been deprecated since gdk-pixbuf 2.32, as
          [gio.resource.Resource] supports embedding modern image formats just as well. Instead
          of using it, embed a PNG or SVG file in your [gio.resource.Resource].
       
        * `json-stripblanks` which will use the
          [`json-glib-format`](man:json-glib-format(1)) command to strip ignorable
          whitespace from the JSON file. For this to work, the `JSON_GLIB_FORMAT`
          environment variable must be set to the full path to the
          `json-glib-format` executable, or it must be in the `PATH`; otherwise the
          preprocessing step is skipped. In addition, at least version 1.6 of
          `json-glib-format` is required.
     )
       
    Resource files will be exported in the [gio.resource.Resource] namespace using the
    combination of the given `prefix` and the filename from the `file` element.
    The `alias` attribute can be used to alter the filename to expose them at a
    different location in the resource namespace. Typically, this is used to
    include files from a different source directory without exposing the source
    directory in the resource namespace, as in the example below.
    
    Resource bundles are created by the
    [`glib-compile-resources`](glib-compile-resources.html) program
    which takes an XML file that describes the bundle, and a set of files that
    the XML references. These are combined into a binary resource bundle.
    
    An example resource description:
    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <gresources>
      <gresource prefix="/org/gtk/Example">
        <file>data/splashscreen.png</file>
        <file compressed="true">dialog.ui</file>
        <file preprocess="xml-stripblanks">menumarkup.xml</file>
        <file alias="example.css">data/example.css</file>
      </gresource>
    </gresources>
    ```
    
    This will create a resource bundle with the following files:
    ```
    /org/gtk/Example/data/splashscreen.png
    /org/gtk/Example/dialog.ui
    /org/gtk/Example/menumarkup.xml
    /org/gtk/Example/example.css
    ```
    
    Note that all resources in the process share the same namespace, so use
    Java-style path prefixes (like in the above example) to avoid conflicts.
    
    You can then use [`glib-compile-resources`](glib-compile-resources.html) to
    compile the XML to a binary bundle that you can load with
    [gio.resource.Resource.load]. However, it’s more common to use the
    `--generate-source` and `--generate-header` arguments to create a source file
    and header to link directly into your application.
    This will generate `get_resource()`, `register_resource()` and
    `unregister_resource()` functions, prefixed by the `--c-name` argument passed
    to [`glib-compile-resources`](glib-compile-resources.html). `get_resource()`
    returns the generated [gio.resource.Resource] object. The register and unregister
    functions register the resource so its files can be accessed using
    `func@Gio.resources_lookup_data`.
    
    Once a [gio.resource.Resource] has been created and registered all the data in it can be
    accessed globally in the process by using API calls like
    `func@Gio.resources_open_stream` to stream the data or
    `func@Gio.resources_lookup_data` to get a direct pointer to the data. You can
    also use URIs like `resource:///org/gtk/Example/data/splashscreen.png` with
    [gio.file.File] to access the resource data.
    
    Some higher-level APIs, such as [[gtk.application.Application]](https://docs.gtk.org/gtk4/class.Application.html),
    will automatically load resources from certain well-known paths in the
    resource namespace as a convenience. See the documentation for those APIs
    for details.
    
    There are two forms of the generated source, the default version uses the
    compiler support for constructor and destructor functions (where available)
    to automatically create and register the [gio.resource.Resource] on startup or library
    load time. If you pass `--manual-register`, two functions to
    register/unregister the resource are created instead. This requires an
    explicit initialization call in your application/library, but it works on all
    platforms, even on the minor ones where constructors are not supported.
    (Constructor support is available for at least Win32, Mac OS and Linux.)
    
    Note that resource data can point directly into the data segment of e.g. a
    library, so if you are unloading libraries during runtime you need to be very
    careful with keeping around pointers to data from a resource, as this goes
    away when the library is unloaded. However, in practice this is not generally
    a problem, since most resource accesses are for your own resources, and
    resource data is often used once, during parsing, and then released.
    
    # Overlays
    
    When debugging a program or testing a change to an installed version, it is
    often useful to be able to replace resources in the program or library,
    without recompiling, for debugging or quick hacking and testing purposes.
    Since GLib 2.50, it is possible to use the `G_RESOURCE_OVERLAYS` environment
    variable to selectively overlay resources with replacements from the
    filesystem.  It is a [glib.types.SEARCHPATH_SEPARATOR]-separated list of substitutions
    to perform during resource lookups. It is ignored when running in a setuid
    process.
    
    A substitution has the form
    
    ```
    /org/gtk/libgtk=/home/desrt/gtk-overlay
    ```
    
    The part before the `=` is the resource subpath for which the overlay
    applies.  The part after is a filesystem path which contains files and
    subdirectories as you would like to be loaded as resources with the
    equivalent names.
    
    In the example above, if an application tried to load a resource with the
    resource path `/org/gtk/libgtk/ui/gtkdialog.ui` then [gio.resource.Resource] would check
    the filesystem path `/home/desrt/gtk-overlay/ui/gtkdialog.ui`.  If a file was
    found there, it would be used instead.  This is an overlay, not an outright
    replacement, which means that if a file is not found at that path, the
    built-in version will be used instead.  Whiteouts are not currently
    supported.
    
    Substitutions must start with a slash, and must not contain a trailing slash
    before the `=`.  The path after the slash should ideally be absolute, but
    this is not strictly required.  It is possible to overlay the location of a
    single resource with an individual file.
*/
struct GResource;

/**
    [gio.seekable.Seekable] is implemented by streams (implementations of
    [gio.input_stream.InputStream] or [gio.output_stream.OutputStream]) that support seeking.
    
    Seekable streams largely fall into two categories: resizable and
    fixed-size.
    
    [gio.seekable.Seekable] on fixed-sized streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a block device (for example: attempting to seek
    past the end of the device is an error).  Fixed streams typically cannot be
    truncated.
    
    [gio.seekable.Seekable] on resizable streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a normal file.  Seeking past the end and writing
    data will usually cause the stream to resize by introducing zero bytes.
*/
struct GSeekable;

/**
    Provides an interface for implementing seekable functionality on I/O Streams.
*/
struct GSeekableIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Tells the current location within a stream.
  */
  extern(C) long function(GSeekable* seekable) tell;

  /**
      Checks if seeking is supported by the stream.
  */
  extern(C) gboolean function(GSeekable* seekable) canSeek;

  /**
      Seeks to a location within a stream.
  */
  extern(C) gboolean function(GSeekable* seekable, long offset, GSeekType type, GCancellable* cancellable, GError** _err) seek;

  /**
      Checks if truncation is supported by the stream.
  */
  extern(C) gboolean function(GSeekable* seekable) canTruncate;

  /**
      Truncates a stream.
  */
  extern(C) gboolean function(GSeekable* seekable, long offset, GCancellable* cancellable, GError** _err) truncateFn;
}

/**
    The [gio.settings.Settings] class provides a convenient API for storing and retrieving
    application settings.
    
    Reads and writes can be considered to be non-blocking.  Reading
    settings with [gio.settings.Settings] is typically extremely fast: on
    approximately the same order of magnitude (but slower than) a
    [glib.hash_table.HashTable] lookup.  Writing settings is also extremely fast in
    terms of time to return to your application, but can be extremely expensive
    for other threads and other processes.  Many settings backends
    (including dconf) have lazy initialisation which means in the common
    case of the user using their computer without modifying any settings
    a lot of work can be avoided.  For dconf, the D-Bus service doesn’t
    even need to be started in this case.  For this reason, you should
    only ever modify [gio.settings.Settings] keys in response to explicit user action.
    Particular care should be paid to ensure that modifications are not
    made during startup — for example, when setting the initial value
    of preferences widgets.  The built-in [gio.settings.Settings.bind]
    functionality is careful not to write settings in response to notify signals
    as a result of modifications that it makes to widgets.
    
    When creating a [gio.settings.Settings] instance, you have to specify a schema
    that describes the keys in your settings and their types and default
    values, as well as some other information.
    
    Normally, a schema has a fixed path that determines where the settings
    are stored in the conceptual global tree of settings. However, schemas
    can also be ‘[relocatable](#relocatable-schemas)’, i.e. not equipped with
    a fixed path. This is
    useful e.g. when the schema describes an ‘account’, and you want to be
    able to store a arbitrary number of accounts.
    
    Paths must start with and end with a forward slash character (`/`)
    and must not contain two sequential slash characters.  Paths should
    be chosen based on a domain name associated with the program or
    library to which the settings belong.  Examples of paths are
    `/org/gtk/settings/file-chooser/` and `/ca/desrt/dconf-editor/`.
    Paths should not start with `/apps/`, `/desktop/` or `/system/` as
    they often did in GConf.
    
    Unlike other configuration systems (like GConf), GSettings does not
    restrict keys to basic types like strings and numbers. GSettings stores
    values as [glib.variant.Variant], and allows any [glib.variant_type.VariantType] for
    keys. Key names are restricted to lowercase characters, numbers and `-`.
    Furthermore, the names must begin with a lowercase character, must not end
    with a `-`, and must not contain consecutive dashes.
    
    Similar to GConf, the default values in GSettings schemas can be
    localized, but the localized values are stored in gettext catalogs
    and looked up with the domain that is specified in the
    `gettext-domain` attribute of the `<schemalist>` or `<schema>`
    elements and the category that is specified in the `l10n` attribute of
    the `<default>` element. The string which is translated includes all text in
    the `<default>` element, including any surrounding quotation marks.
    
    The `l10n` attribute must be set to `messages` or `time`, and sets the
    [locale category for
    translation](https://www.gnu.org/software/gettext/manual/html_node/Aspects.html#index-locale-categories-1).
    The `messages` category should be used by default; use `time` for
    translatable date or time formats. A translation comment can be added as an
    XML comment immediately above the `<default>` element — it is recommended to
    add these comments to aid translators understand the meaning and
    implications of the default value. An optional translation `context`
    attribute can be set on the `<default>` element to disambiguate multiple
    defaults which use the same string.
    
    For example:
    ```xml
     <!-- Translators: A list of words which are not allowed to be typed, in
          GVariant serialization syntax.
          See: https://developer.gnome.org/glib/stable/gvariant-text.html -->
     <default l10n='messages' context='Banned words'>['bad', 'words']</default>
    ```
    
    Translations of default values must remain syntactically valid serialized
    [glib.variant.Variant]s (e.g. retaining any surrounding quotation marks) or
    runtime errors will occur.
    
    GSettings uses schemas in a compact binary form that is created
    by the [`glib-compile-schemas`](glib-compile-schemas.html)
    utility. The input is a schema description in an XML format.
    
    A DTD for the gschema XML format can be found here:
    [gschema.dtd](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/gschema.dtd)
    
    The [`glib-compile-schemas`](glib-compile-schemas.html) tool expects schema
    files to have the extension `.gschema.xml`.
    
    At runtime, schemas are identified by their ID (as specified in the
    `id` attribute of the `<schema>` element). The convention for schema
    IDs is to use a dotted name, similar in style to a D-Bus bus name,
    e.g. `org.gnome.SessionManager`. In particular, if the settings are
    for a specific service that owns a D-Bus bus name, the D-Bus bus name
    and schema ID should match. For schemas which deal with settings not
    associated with one named application, the ID should not use
    StudlyCaps, e.g. `org.gnome.font-rendering`.
    
    In addition to [glib.variant.Variant] types, keys can have types that have
    enumerated types. These can be described by a `<choice>`,
    `<enum>` or `<flags>` element, as seen in the
    second example below. The underlying type of such a key
    is string, but you can use [gio.settings.Settings.getEnum],
    [gio.settings.Settings.setEnum], [gio.settings.Settings.getFlags],
    [gio.settings.Settings.setFlags] access the numeric values corresponding to
    the string value of enum and flags keys.
    
    An example for default value:
    ```xml
    <schemalist>
      <schema id="org.gtk.Test" path="/org/gtk/Test/" gettext-domain="test">
    
        <key name="greeting" type="s">
          <default l10n="messages">"Hello, earthlings"</default>
          <summary>A greeting</summary>
          <description>
            Greeting of the invading martians
          </description>
        </key>
    
        <key name="box" type="(ii)">
          <default>(20,30)</default>
        </key>
    
        <key name="empty-string" type="s">
          <default>""</default>
          <summary>Empty strings have to be provided in GVariant form</summary>
        </key>
    
      </schema>
    </schemalist>
    ```
    
    An example for ranges, choices and enumerated types:
    ```xml
    <schemalist>
    
      <enum id="org.gtk.Test.myenum">
        <value nick="first" value="1"/>
        <value nick="second" value="2"/>
      </enum>
    
      <flags id="org.gtk.Test.myflags">
        <value nick="flag1" value="1"/>
        <value nick="flag2" value="2"/>
        <value nick="flag3" value="4"/>
      </flags>
    
      <schema id="org.gtk.Test">
    
        <key name="key-with-range" type="i">
          <range min="1" max="100"/>
          <default>10</default>
        </key>
    
        <key name="key-with-choices" type="s">
          <choices>
            <choice value='Elisabeth'/>
            <choice value='Annabeth'/>
            <choice value='Joe'/>
          </choices>
          <aliases>
            <alias value='Anna' target='Annabeth'/>
            <alias value='Beth' target='Elisabeth'/>
          </aliases>
          <default>'Joe'</default>
        </key>
    
        <key name='enumerated-key' enum='org.gtk.Test.myenum'>
          <default>'first'</default>
        </key>
    
        <key name='flags-key' flags='org.gtk.Test.myflags'>
          <default>["flag1","flag2"]</default>
        </key>
      </schema>
    </schemalist>
    ```
    
    ## Vendor overrides
    
    Default values are defined in the schemas that get installed by
    an application. Sometimes, it is necessary for a vendor or distributor
    to adjust these defaults. Since patching the XML source for the schema
    is inconvenient and error-prone,
    [`glib-compile-schemas`](glib-compile-schemas.html) reads so-called ‘vendor
    override’ files. These are keyfiles in the same directory as the XML
    schema sources which can override default values. The schema ID serves
    as the group name in the key file, and the values are expected in
    serialized [glib.variant.Variant] form, as in the following example:
    ```
    [org.gtk.Example]
    key1='string'
    key2=1.5
    ```
    
    `glib-compile-schemas` expects schema files to have the extension
    `.gschema.override`.
    
    ## Binding
    
    A very convenient feature of GSettings lets you bind [gobject.object.ObjectWrap]
    properties directly to settings, using [gio.settings.Settings.bind]. Once a
    [gobject.object.ObjectWrap] property has been bound to a setting, changes on
    either side are automatically propagated to the other side. GSettings handles
    details like mapping between [gobject.object.ObjectWrap] and [glib.variant.Variant]
    types, and preventing infinite cycles.
    
    This makes it very easy to hook up a preferences dialog to the
    underlying settings. To make this even more convenient, GSettings
    looks for a boolean property with the name `sensitivity` and
    automatically binds it to the writability of the bound setting.
    If this ‘magic’ gets in the way, it can be suppressed with the
    [gio.types.SettingsBindFlags.NoSensitivity] flag.
    
    ## Relocatable schemas
    
    A relocatable schema is one with no `path` attribute specified on its
    `<schema>` element. By using [gio.settings.Settings.newWithPath], a [gio.settings.Settings]
    object can be instantiated for a relocatable schema, assigning a path to the
    instance. Paths passed to [gio.settings.Settings.newWithPath] will typically be
    constructed dynamically from a constant prefix plus some form of instance
    identifier; but they must still be valid GSettings paths. Paths could also
    be constant and used with a globally installed schema originating from a
    dependency library.
    
    For example, a relocatable schema could be used to store geometry information
    for different windows in an application. If the schema ID was
    `org.foo.MyApp.Window`, it could be instantiated for paths
    `/org/foo/MyApp/main/`, `/org/foo/MyApp/document-1/`,
    `/org/foo/MyApp/document-2/`, etc. If any of the paths are well-known
    they can be specified as `<child>` elements in the parent schema, e.g.:
    ```xml
    <schema id="org.foo.MyApp" path="/org/foo/MyApp/">
      <child name="main" schema="org.foo.MyApp.Window"/>
    </schema>
    ```
    
    ## Build system integration
    
    GSettings comes with autotools integration to simplify compiling and
    installing schemas. To add GSettings support to an application, add the
    following to your `configure.ac`:
    ```
    GLIB_GSETTINGS
    ```
    
    In the appropriate `Makefile.am`, use the following snippet to compile and
    install the named schema:
    ```
    gsettings_SCHEMAS = org.foo.MyApp.gschema.xml
    EXTRA_DIST = $(gsettings_SCHEMAS)
    
    @GSETTINGS_RULES@
    ```
    
    No changes are needed to the build system to mark a schema XML file for
    translation. Assuming it sets the `gettext-domain` attribute, a schema may
    be marked for translation by adding it to `POTFILES.in`, assuming gettext
    0.19 is in use (the preferred method for translation):
    ```
    data/org.foo.MyApp.gschema.xml
    ```
    
    Alternatively, if intltool 0.50.1 is in use:
    ```
    [type: gettext/gsettings]data/org.foo.MyApp.gschema.xml
    ```
    
    GSettings will use gettext to look up translations for the `<summary>` and
    `<description>` elements, and also any `<default>` elements which have a
    `l10n` attribute set. Translations must not be included in the `.gschema.xml`
    file by the build system, for example by using intltool XML rules with a
    `.gschema.xml.in` template.
    
    If an enumerated type defined in a C header file is to be used in a GSettings
    schema, it can either be defined manually using an `<enum>` element in the
    schema XML, or it can be extracted automatically from the C header. This
    approach is preferred, as it ensures the two representations are always
    synchronised. To do so, add the following to the relevant `Makefile.am`:
    ```
    gsettings_ENUM_NAMESPACE = org.foo.MyApp
    gsettings_ENUM_FILES = my-app-enums.h my-app-misc.h
    ```
    
    `gsettings_ENUM_NAMESPACE` specifies the schema namespace for the enum files,
    which are specified in `gsettings_ENUM_FILES`. This will generate a
    `org.foo.MyApp.enums.xml` file containing the extracted enums, which will be
    automatically included in the schema compilation, install and uninstall
    rules. It should not be committed to version control or included in
    `EXTRA_DIST`.
*/
struct GSettings
{
  /** */
  GObject parentInstance;

  /** */
  GSettingsPrivate* priv;
}

/**
    The [gio.settings_backend.SettingsBackend] interface defines a generic interface for
    non-strictly-typed data that is stored in a hierarchy. To implement
    an alternative storage backend for [gio.settings.Settings], you need to
    implement the [gio.settings_backend.SettingsBackend] interface and then make it implement the
    extension point [gio.types.SETTINGS_BACKEND_EXTENSION_POINT_NAME].
    
    The interface defines methods for reading and writing values, a
    method for determining if writing of certain values will fail
    (lockdown) and a change notification mechanism.
    
    The semantics of the interface are very precisely defined and
    implementations must carefully adhere to the expectations of
    callers that are documented on each of the interface methods.
    
    Some of the [gio.settings_backend.SettingsBackend] functions accept or return a
    [glib.tree.Tree]. These trees always have strings as keys and
    [glib.variant.Variant] as values.
    
    The [gio.settings_backend.SettingsBackend] API is exported to allow third-party
    implementations, but does not carry the same stability guarantees
    as the public GIO API. For this reason, you have to define the
    C preprocessor symbol `G_SETTINGS_ENABLE_BACKEND` before including
    `gio/gsettingsbackend.h`.
*/
struct GSettingsBackend
{
  /** */
  GObject parentInstance;

  /** */
  GSettingsBackendPrivate* priv;
}

/**
    Class structure for #GSettingsBackend.
*/
struct GSettingsBackendClass
{
  /** */
  GObjectClass parentClass;

  /**
      virtual method to read a key's value
  */
  extern(C) GVariant* function(GSettingsBackend* backend, const(char)* key, const(GVariantType)* expectedType, gboolean defaultValue) read;

  /**
      virtual method to get if a key is writable
  */
  extern(C) gboolean function(GSettingsBackend* backend, const(char)* key) getWritable;

  /**
      virtual method to change key's value
  */
  extern(C) gboolean function(GSettingsBackend* backend, const(char)* key, GVariant* value, void* originTag) write;

  /**
      virtual method to change a tree of keys
  */
  extern(C) gboolean function(GSettingsBackend* backend, GTree* tree, void* originTag) writeTree;

  /**
      virtual method to reset state
  */
  extern(C) void function(GSettingsBackend* backend, const(char)* key, void* originTag) reset;

  /**
      virtual method to subscribe to key changes
  */
  extern(C) void function(GSettingsBackend* backend, const(char)* name) subscribe;

  /**
      virtual method to unsubscribe to key changes
  */
  extern(C) void function(GSettingsBackend* backend, const(char)* name) unsubscribe;

  /**
      virtual method to sync state
  */
  extern(C) void function(GSettingsBackend* backend) sync;

  /**
      virtual method to get permission of a key
  */
  extern(C) GPermission* function(GSettingsBackend* backend, const(char)* path) getPermission;

  /**
      virtual method to read user's key value
  */
  extern(C) GVariant* function(GSettingsBackend* backend, const(char)* key, const(GVariantType)* expectedType) readUserValue;

  /** */
  void*[23] padding;
}

/** */
struct GSettingsBackendPrivate;

/** */
struct GSettingsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GSettings* settings, const(char)* key) writableChanged;

  /** */
  extern(C) void function(GSettings* settings, const(char)* key) changed;

  /** */
  extern(C) gboolean function(GSettings* settings, GQuark key) writableChangeEvent;

  /** */
  extern(C) gboolean function(GSettings* settings, const(GQuark)* keys, int nKeys) changeEvent;

  /** */
  void*[20] padding;
}

/** */
struct GSettingsPrivate;

/**
    The [gio.settings_schema_source.SettingsSchemaSource] and [gio.settings_schema.SettingsSchema] APIs provide a
    mechanism for advanced control over the loading of schemas and a
    mechanism for introspecting their content.
    
    Plugin loading systems that wish to provide plugins a way to access
    settings face the problem of how to make the schemas for these
    settings visible to GSettings.  Typically, a plugin will want to ship
    the schema along with itself and it won't be installed into the
    standard system directories for schemas.
    
    [gio.settings_schema_source.SettingsSchemaSource] provides a mechanism for dealing with this
    by allowing the creation of a new ‘schema source’ from which schemas can
    be acquired.  This schema source can then become part of the metadata
    associated with the plugin and queried whenever the plugin requires
    access to some settings.
    
    Consider the following example:
    
    ```c
    typedef struct
    {
       …
       GSettingsSchemaSource *schema_source;
       …
    } Plugin;
    
    Plugin *
    initialise_plugin (const gchar *dir)
    {
      Plugin *plugin;
    
      …
    
      plugin->schema_source =
        g_settings_schema_source_new_from_directory (dir,
          g_settings_schema_source_get_default (), FALSE, NULL);
    
      …
    
      return plugin;
    }
    
    …
    
    GSettings *
    plugin_get_settings (Plugin      *plugin,
                         const gchar *schema_id)
    {
      GSettingsSchema *schema;
    
      if (schema_id == NULL)
        schema_id = plugin->identifier;
    
      schema = g_settings_schema_source_lookup (plugin->schema_source,
                                                schema_id, FALSE);
    
      if (schema == NULL)
        {
          … disable the plugin or abort, etc …
        }
    
      return g_settings_new_full (schema, NULL, NULL);
    }
    ```
    
    The code above shows how hooks should be added to the code that
    initialises (or enables) the plugin to create the schema source and
    how an API can be added to the plugin system to provide a convenient
    way for the plugin to access its settings, using the schemas that it
    ships.
    
    From the standpoint of the plugin, it would need to ensure that it
    ships a gschemas.compiled file as part of itself, and then simply do
    the following:
    
    ```c
    {
      GSettings *settings;
      gint some_value;
    
      settings = plugin_get_settings (self, NULL);
      some_value = g_settings_get_int (settings, "some-value");
      …
    }
    ```
    
    It's also possible that the plugin system expects the schema source
    files (ie: `.gschema.xml` files) instead of a `gschemas.compiled` file.
    In that case, the plugin loading system must compile the schemas for
    itself before attempting to create the settings source.
*/
struct GSettingsSchema;

/**
    #GSettingsSchemaKey is an opaque data structure and can only be accessed
    using the following functions.
*/
struct GSettingsSchemaKey;

/**
    This is an opaque structure type.  You may not access it directly.
*/
struct GSettingsSchemaSource;

/**
    A [gio.simple_action.SimpleAction] is the obvious simple implementation of the
    [gio.action.Action] interface. This is the easiest way to create an action for
    purposes of adding it to a [gio.simple_action_group.SimpleActionGroup].
*/
struct GSimpleAction;

/**
    [gio.simple_action_group.SimpleActionGroup] is a hash table filled with [gio.action.Action] objects,
    implementing the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap]
    interfaces.
*/
struct GSimpleActionGroup
{
  /** */
  GObject parentInstance;

  /** */
  GSimpleActionGroupPrivate* priv;
}

/** */
struct GSimpleActionGroupClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[12] padding;
}

/** */
struct GSimpleActionGroupPrivate;

/**
    As of GLib 2.46, [gio.simple_async_result.SimpleAsyncResult] is deprecated in favor of
    [gio.task.Task], which provides a simpler API.
    
    [gio.simple_async_result.SimpleAsyncResult] implements [gio.async_result.AsyncResult].
    
    [gio.simple_async_result.SimpleAsyncResult] handles [gio.types.AsyncReadyCallback]s, error
    reporting, operation cancellation and the final state of an operation,
    completely transparent to the application. Results can be returned
    as a pointer e.g. for functions that return data that is collected
    asynchronously, a boolean value for checking the success or failure
    of an operation, or a `gssize` for operations which return the number
    of bytes modified by the operation; all of the simple return cases
    are covered.
    
    Most of the time, an application will not need to know of the details
    of this API; it is handled transparently, and any necessary operations
    are handled by [gio.async_result.AsyncResult]’s interface. However, if implementing
    a new GIO module, for writing language bindings, or for complex
    applications that need better control of how asynchronous operations
    are completed, it is important to understand this functionality.
    
    [gio.simple_async_result.SimpleAsyncResult]s are tagged with the calling function to ensure
    that asynchronous functions and their finishing functions are used
    together correctly.
    
    To create a new [gio.simple_async_result.SimpleAsyncResult], call [gio.simple_async_result.SimpleAsyncResult.new_].
    If the result needs to be created for a [glib.error.ErrorWrap], use
    [gio.simple_async_result.SimpleAsyncResult.newFromError] or
    [gio.simple_async_result.SimpleAsyncResult.newTakeError]. If a [glib.error.ErrorWrap] is not available
    (e.g. the asynchronous operation doesn’t take a [glib.error.ErrorWrap] argument),
    but the result still needs to be created for an error condition, use
    [gio.simple_async_result.SimpleAsyncResult.newError] (or
    [gio.simple_async_result.SimpleAsyncResult.setErrorVa] if your application or binding
    requires passing a variable argument list directly), and the error can then
    be propagated through the use of
    [gio.simple_async_result.SimpleAsyncResult.propagateError].
    
    An asynchronous operation can be made to ignore a cancellation event by
    calling [gio.simple_async_result.SimpleAsyncResult.setHandleCancellation] with a
    [gio.simple_async_result.SimpleAsyncResult] for the operation and `FALSE`. This is useful for
    operations that are dangerous to cancel, such as close (which would
    cause a leak if cancelled before being run).
    
    [gio.simple_async_result.SimpleAsyncResult] can integrate into GLib’s event loop,
    [glib.main_loop.MainLoop], or it can use [glib.thread.Thread]s.
    [gio.simple_async_result.SimpleAsyncResult.complete] will finish an I/O task directly
    from the point where it is called.
    [gio.simple_async_result.SimpleAsyncResult.completeInIdle] will finish it from an idle
    handler in the  thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) where the [gio.simple_async_result.SimpleAsyncResult]
    was created. [gio.simple_async_result.SimpleAsyncResult.runInThread] will run the job in
    a separate thread and then use
    [gio.simple_async_result.SimpleAsyncResult.completeInIdle] to deliver the result.
    
    To set the results of an asynchronous function,
    [gio.simple_async_result.SimpleAsyncResult.setOpResGpointer],
    [gio.simple_async_result.SimpleAsyncResult.setOpResGboolean], and
    [gio.simple_async_result.SimpleAsyncResult.setOpResGssize]
    are provided, setting the operation's result to a [xlib.types.void*], `gboolean`, or
    `gssize`, respectively.
    
    Likewise, to get the result of an asynchronous function,
    [gio.simple_async_result.SimpleAsyncResult.getOpResGpointer],
    [gio.simple_async_result.SimpleAsyncResult.getOpResGboolean], and
    [gio.simple_async_result.SimpleAsyncResult.getOpResGssize] are
    provided, getting the operation’s result as a [xlib.types.void*], `gboolean`, and
    `gssize`, respectively.
    
    For the details of the requirements implementations must respect, see
    [gio.async_result.AsyncResult].  A typical implementation of an asynchronous
    operation using [gio.simple_async_result.SimpleAsyncResult] looks something like this:
    
    ```c
    static void
    baked_cb (Cake    *cake,
              gpointer user_data)
    {
      // In this example, this callback is not given a reference to the cake,
      // so the GSimpleAsyncResult has to take a reference to it.
      GSimpleAsyncResult *result = user_data;
    
      if (cake == NULL)
        g_simple_async_result_set_error (result,
                                         BAKER_ERRORS,
                                         BAKER_ERROR_NO_FLOUR,
                                         "Go to the supermarket");
      else
        g_simple_async_result_set_op_res_gpointer (result,
                                                   g_object_ref (cake),
                                                   g_object_unref);
    
    
      // In this example, we assume that baked_cb is called as a callback from
      // the mainloop, so it's safe to complete the operation synchronously here.
      // If, however, _baker_prepare_cake () might call its callback without
      // first returning to the mainloop — inadvisable, but some APIs do so —
      // we would need to use g_simple_async_result_complete_in_idle().
      g_simple_async_result_complete (result);
      g_object_unref (result);
    }
    
    void
    baker_bake_cake_async (Baker              *self,
                           guint               radius,
                           GAsyncReadyCallback callback,
                           gpointer            user_data)
    {
      GSimpleAsyncResult *simple;
      Cake               *cake;
    
      if (radius < 3)
        {
          g_simple_async_report_error_in_idle (G_OBJECT (self),
                                               callback,
                                               user_data,
                                               BAKER_ERRORS,
                                               BAKER_ERROR_TOO_SMALL,
                                               "%ucm radius cakes are silly",
                                               radius);
          return;
        }
    
      simple = g_simple_async_result_new (G_OBJECT (self),
                                          callback,
                                          user_data,
                                          baker_bake_cake_async);
      cake = _baker_get_cached_cake (self, radius);
    
      if (cake != NULL)
        {
          g_simple_async_result_set_op_res_gpointer (simple,
                                                     g_object_ref (cake),
                                                     g_object_unref);
          g_simple_async_result_complete_in_idle (simple);
          g_object_unref (simple);
          // Drop the reference returned by _baker_get_cached_cake();
          // the GSimpleAsyncResult has taken its own reference.
          g_object_unref (cake);
          return;
        }
    
      _baker_prepare_cake (self, radius, baked_cb, simple);
    }
    
    Cake *
    baker_bake_cake_finish (Baker        *self,
                            GAsyncResult *result,
                            GError      **error)
    {
      GSimpleAsyncResult *simple;
      Cake               *cake;
    
      g_return_val_if_fail (g_simple_async_result_is_valid (result,
                                                            G_OBJECT (self),
                                                            baker_bake_cake_async),
                            NULL);
    
      simple = (GSimpleAsyncResult *) result;
    
      if (g_simple_async_result_propagate_error (simple, error))
        return NULL;
    
      cake = CAKE (g_simple_async_result_get_op_res_gpointer (simple));
      return g_object_ref (cake);
    }
    ```
*/
struct GSimpleAsyncResult;

/** */
struct GSimpleAsyncResultClass;

/**
    [gio.simple_iostream.SimpleIOStream] creates a [gio.iostream.IOStream] from an arbitrary
    [gio.input_stream.InputStream] and [gio.output_stream.OutputStream]. This allows any pair of
    input and output streams to be used with [gio.iostream.IOStream] methods.
    
    This is useful when you obtained a [gio.input_stream.InputStream] and a
    [gio.output_stream.OutputStream] by other means, for instance creating them with
    platform specific methods as
    [`[gio.unix_input_stream.UnixInputStream.new_]`](../gio-unix/ctor.UnixInputStream.new.html)
    (from `gio-unix-2.0.pc` / `GioUnix-2.0`), and you want to
    take advantage of the methods provided by [gio.iostream.IOStream].
*/
struct GSimpleIOStream;

/**
    [gio.simple_permission.SimplePermission] is a trivial implementation of [gio.permission.Permission]
    that represents a permission that is either always or never allowed.  The
    value is given at construction and doesn’t change.
    
    Calling [gio.permission.Permission.acquire] or [gio.permission.Permission.release]
    on a [gio.simple_permission.SimplePermission] will result in errors.
*/
struct GSimplePermission;

/**
    [gio.simple_proxy_resolver.SimpleProxyResolver] is a simple [gio.proxy_resolver.ProxyResolver] implementation
    that handles a single default proxy, multiple URI-scheme-specific
    proxies, and a list of hosts that proxies should not be used for.
    
    [gio.simple_proxy_resolver.SimpleProxyResolver] is never the default proxy resolver, but it
    can be used as the base class for another proxy resolver
    implementation, or it can be created and used manually, such as
    with [gio.socket_client.SocketClient.setProxyResolver].
*/
struct GSimpleProxyResolver
{
  /** */
  GObject parentInstance;

  /** */
  GSimpleProxyResolverPrivate* priv;
}

/** */
struct GSimpleProxyResolverClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GSimpleProxyResolverPrivate;

/**
    A [gio.socket.Socket] is a low-level networking primitive. It is a more or less
    direct mapping of the BSD socket API in a portable GObject based API.
    It supports both the UNIX socket implementations and winsock2 on Windows.
    
    [gio.socket.Socket] is the platform independent base upon which the higher level
    network primitives are based. Applications are not typically meant to
    use it directly, but rather through classes like [gio.socket_client.SocketClient],
    [gio.socket_service.SocketService] and [gio.socket_connection.SocketConnection]. However there may
    be cases where direct use of [gio.socket.Socket] is useful.
    
    [gio.socket.Socket] implements the [gio.initable.Initable] interface, so if it is manually
    constructed by e.g. [gobject.object.ObjectWrap.new_] you must call
    [gio.initable.Initable.init_] and check the results before using the object.
    This is done automatically in [gio.socket.Socket.new_] and
    [gio.socket.Socket.newFromFd], so these functions can return `NULL`.
    
    Sockets operate in two general modes, blocking or non-blocking. When
    in blocking mode all operations (which don’t take an explicit blocking
    parameter) block until the requested operation
    is finished or there is an error. In non-blocking mode all calls that
    would block return immediately with a [gio.types.IOErrorEnum.WouldBlock] error.
    To know when a call would successfully run you can call
    [gio.socket.Socket.conditionCheck], or [gio.socket.Socket.conditionWait].
    You can also use [gio.socket.Socket.createSource] and attach it to a
    [glib.main_context.MainContext] to get callbacks when I/O is possible.
    Note that all sockets are always set to non blocking mode in the system, and
    blocking mode is emulated in [gio.socket.Socket].
    
    When working in non-blocking mode applications should always be able to
    handle getting a [gio.types.IOErrorEnum.WouldBlock] error even when some other
    function said that I/O was possible. This can easily happen in case
    of a race condition in the application, but it can also happen for other
    reasons. For instance, on Windows a socket is always seen as writable
    until a write returns [gio.types.IOErrorEnum.WouldBlock].
    
    [gio.socket.Socket]s can be either connection oriented or datagram based.
    For connection oriented types you must first establish a connection by
    either connecting to an address or accepting a connection from another
    address. For connectionless socket types the target/source address is
    specified or received in each I/O operation.
    
    All socket file descriptors are set to be close-on-exec.
    
    Note that creating a [gio.socket.Socket] causes the signal `SIGPIPE` to be
    ignored for the remainder of the program. If you are writing a
    command-line utility that uses [gio.socket.Socket], you may need to take into
    account the fact that your program will not automatically be killed
    if it tries to write to `stdout` after it has been closed.
    
    Like most other APIs in GLib, [gio.socket.Socket] is not inherently thread safe. To use
    a [gio.socket.Socket] concurrently from multiple threads, you must implement your own
    locking.
    
    ## Nagle’s algorithm
    
    Since GLib 2.80, [gio.socket.Socket] will automatically set the `TCP_NODELAY` option on
    all [gio.types.SocketType.Stream] sockets. This disables
    [Nagle’s algorithm](https://en.wikipedia.org/wiki/Nagle`27s_algorithm`) as it
    typically does more harm than good on modern networks.
    
    If your application needs Nagle’s algorithm enabled, call
    [gio.socket.Socket.setOption] after constructing a [gio.socket.Socket] to enable it:
    ```c
    socket = g_socket_new (…, G_SOCKET_TYPE_STREAM, …);
    if (socket != NULL)
      {
        g_socket_set_option (socket, IPPROTO_TCP, TCP_NODELAY, FALSE, &local_error);
        // handle error if needed
      }
    ```
*/
struct GSocket
{
  /** */
  GObject parentInstance;

  /** */
  GSocketPrivate* priv;
}

/**
    [gio.socket_address.SocketAddress] is the equivalent of
    [`struct sockaddr`](man:sockaddr(3type)) and its subtypes in the BSD sockets
    API. This is an abstract class; use [gio.inet_socket_address.InetSocketAddress] for
    internet sockets, or [gio.unix_socket_address.UnixSocketAddress] for UNIX domain sockets.
*/
struct GSocketAddress
{
  /** */
  GObject parentInstance;
}

/** */
struct GSocketAddressClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GSocketFamily function(GSocketAddress* address) getFamily;

  /** */
  extern(C) ptrdiff_t function(GSocketAddress* address) getNativeSize;

  /** */
  extern(C) gboolean function(GSocketAddress* address, void* dest, size_t destlen, GError** _err) toNative;
}

/**
    [gio.socket_address_enumerator.SocketAddressEnumerator] is an enumerator type for
    [gio.socket_address.SocketAddress] instances. It is returned by enumeration functions
    such as [gio.socket_connectable.SocketConnectable.enumerate], which returns a
    [gio.socket_address_enumerator.SocketAddressEnumerator] to list each [gio.socket_address.SocketAddress] which could
    be used to connect to that [gio.socket_connectable.SocketConnectable].
    
    Enumeration is typically a blocking operation, so the asynchronous methods
    [gio.socket_address_enumerator.SocketAddressEnumerator.nextAsync] and
    [gio.socket_address_enumerator.SocketAddressEnumerator.nextFinish] should be used where
    possible.
    
    Each [gio.socket_address_enumerator.SocketAddressEnumerator] can only be enumerated once. Once
    [gio.socket_address_enumerator.SocketAddressEnumerator.next] has returned `NULL`, further
    enumeration with that [gio.socket_address_enumerator.SocketAddressEnumerator] is not possible, and it can
    be unreffed.
*/
struct GSocketAddressEnumerator
{
  /** */
  GObject parentInstance;
}

/**
    Class structure for #GSocketAddressEnumerator.
*/
struct GSocketAddressEnumeratorClass
{
  /** */
  GObjectClass parentClass;

  /**
      Virtual method for [gio.socket_address_enumerator.SocketAddressEnumerator.next].
  */
  extern(C) GSocketAddress* function(GSocketAddressEnumerator* enumerator, GCancellable* cancellable, GError** _err) next;

  /**
      Virtual method for [gio.socket_address_enumerator.SocketAddressEnumerator.nextAsync].
  */
  extern(C) void function(GSocketAddressEnumerator* enumerator, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nextAsync;

  /**
      Virtual method for [gio.socket_address_enumerator.SocketAddressEnumerator.nextFinish].
  */
  extern(C) GSocketAddress* function(GSocketAddressEnumerator* enumerator, GAsyncResult* result, GError** _err) nextFinish;
}

/** */
struct GSocketClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;

  /** */
  extern(C) void function() GReserved7;

  /** */
  extern(C) void function() GReserved8;

  /** */
  extern(C) void function() GReserved9;

  /** */
  extern(C) void function() GReserved10;
}

/**
    [gio.socket_client.SocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.
    
    You create a [gio.socket_client.SocketClient] object, set any options you want, and then
    call a sync or async connect operation, which returns a
    [gio.socket_connection.SocketConnection] subclass on success.
    
    The type of the [gio.socket_connection.SocketConnection] object returned depends on the
    type of the underlying socket that is in use. For instance, for a TCP/IP
    connection it will be a [gio.tcp_connection.TcpConnection].
    
    As [gio.socket_client.SocketClient] is a lightweight object, you don't need to cache it. You
    can just create a new one any time you need one.
*/
struct GSocketClient
{
  /** */
  GObject parentInstance;

  /** */
  GSocketClientPrivate* priv;
}

/** */
struct GSocketClientClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GSocketClient* client, GSocketClientEvent event, GSocketConnectable* connectable, GIOStream* connection) event;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;
}

/** */
struct GSocketClientPrivate;

/**
    Objects that describe one or more potential socket endpoints
    implement [gio.socket_connectable.SocketConnectable]. Callers can then use
    [gio.socket_connectable.SocketConnectable.enumerate] to get a
    [gio.socket_address_enumerator.SocketAddressEnumerator] to try out each socket address in turn
    until one succeeds, as shown in the sample code below.
    
    ```c
    MyConnectionType *
    connect_to_host (const char    *hostname,
                     guint16        port,
                     GCancellable  *cancellable,
                     GError       **error)
    {
      MyConnection *conn = NULL;
      GSocketConnectable *addr;
      GSocketAddressEnumerator *enumerator;
      GSocketAddress *sockaddr;
      GError *conn_error = NULL;
    
      addr = g_network_address_new (hostname, port);
      enumerator = g_socket_connectable_enumerate (addr);
      g_object_unref (addr);
    
      // Try each sockaddr until we succeed. Record the first connection error,
      // but not any further ones (since they'll probably be basically the same
      // as the first).
      while (!conn && (sockaddr = g_socket_address_enumerator_next (enumerator, cancellable, error))
        {
          conn = connect_to_sockaddr (sockaddr, conn_error ? NULL : &conn_error);
          g_object_unref (sockaddr);
        }
      g_object_unref (enumerator);
    
      if (conn)
        {
          if (conn_error)
            {
              // We couldn't connect to the first address, but we succeeded
              // in connecting to a later address.
              g_error_free (conn_error);
            }
          return conn;
        }
      else if (error)
        {
          /// Either initial lookup failed, or else the caller cancelled us.
          if (conn_error)
            g_error_free (conn_error);
          return NULL;
        }
      else
        {
          g_error_propagate (error, conn_error);
          return NULL;
        }
    }
    ```
*/
struct GSocketConnectable;

/**
    Provides an interface for returning a #GSocketAddressEnumerator
    and #GProxyAddressEnumerator
*/
struct GSocketConnectableIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Creates a #GSocketAddressEnumerator
  */
  extern(C) GSocketAddressEnumerator* function(GSocketConnectable* connectable) enumerate;

  /**
      Creates a #GProxyAddressEnumerator
  */
  extern(C) GSocketAddressEnumerator* function(GSocketConnectable* connectable) proxyEnumerate;

  /**
      Format the connectable’s address as a string for debugging.
         Implementing this is optional. (Since: 2.48)
  */
  extern(C) char* function(GSocketConnectable* connectable) toString_;
}

/**
    [gio.socket_connection.SocketConnection] is a [gio.iostream.IOStream] for a connected socket. They
    can be created either by [gio.socket_client.SocketClient] when connecting to a host,
    or by [gio.socket_listener.SocketListener] when accepting a new client.
    
    The type of the [gio.socket_connection.SocketConnection] object returned from these calls
    depends on the type of the underlying socket that is in use. For
    instance, for a TCP/IP connection it will be a [gio.tcp_connection.TcpConnection].
    
    Choosing what type of object to construct is done with the socket
    connection factory, and it is possible for third parties to register
    custom socket connection types for specific combination of socket
    family/type/protocol using [gio.socket_connection.SocketConnection.factoryRegisterType].
    
    To close a [gio.socket_connection.SocketConnection], use [gio.iostream.IOStream.close]. Closing both
    substreams of the [gio.iostream.IOStream] separately will not close the
    underlying [gio.socket.Socket].
*/
struct GSocketConnection
{
  /** */
  GIOStream parentInstance;

  /** */
  GSocketConnectionPrivate* priv;
}

/** */
struct GSocketConnectionClass
{
  /** */
  GIOStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;
}

/** */
struct GSocketConnectionPrivate;

/**
    A [gio.socket_control_message.SocketControlMessage] is a special-purpose utility message that
    can be sent to or received from a [gio.socket.Socket]. These types of
    messages are often called ‘ancillary data’.
    
    The message can represent some sort of special instruction to or
    information from the socket or can represent a special kind of
    transfer to the peer (for example, sending a file descriptor over
    a UNIX socket).
    
    These messages are sent with [gio.socket.Socket.sendMessage] and received
    with [gio.socket.Socket.receiveMessage].
    
    To extend the set of control message that can be sent, subclass this
    class and override the `get_size`, `get_level`, `get_type` and `serialize`
    methods.
    
    To extend the set of control messages that can be received, subclass
    this class and implement the `deserialize` method. Also, make sure your
    class is registered with the [gobject.types.size_t] type system before calling
    [gio.socket.Socket.receiveMessage] to read such a message.
*/
struct GSocketControlMessage
{
  /** */
  GObject parentInstance;

  /** */
  GSocketControlMessagePrivate* priv;
}

/**
    Class structure for #GSocketControlMessage.
*/
struct GSocketControlMessageClass
{
  /** */
  GObjectClass parentClass;

  /**
      gets the size of the message.
  */
  extern(C) size_t function(GSocketControlMessage* message) getSize;

  /**
      gets the protocol of the message.
  */
  extern(C) int function(GSocketControlMessage* message) getLevel;

  /**
      gets the protocol specific type of the message.
  */
  extern(C) int function(GSocketControlMessage* message) getType;

  /**
      Writes out the message data.
  */
  extern(C) void function(GSocketControlMessage* message, void* data) serialize;

  /**
      Tries to deserialize a message.
  */
  extern(C) GSocketControlMessage* function(int level, int type, size_t size, void* data) deserialize;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GSocketControlMessagePrivate;

/**
    A [gio.socket_listener.SocketListener] is an object that keeps track of a set
    of server sockets and helps you accept sockets from any of the
    socket, either sync or async.
    
    Add addresses and ports to listen on using
    [gio.socket_listener.SocketListener.addAddress] and
    [gio.socket_listener.SocketListener.addInetPort]. These will be listened on until
    [gio.socket_listener.SocketListener.close] is called. Dropping your final reference to
    the [gio.socket_listener.SocketListener] will not cause [gio.socket_listener.SocketListener.close] to be
    called implicitly, as some references to the [gio.socket_listener.SocketListener] may be held
    internally.
    
    If you want to implement a network server, also look at
    [gio.socket_service.SocketService] and [gio.threaded_socket_service.ThreadedSocketService] which are
    subclasses of [gio.socket_listener.SocketListener] that make this even easier.
*/
struct GSocketListener
{
  /** */
  GObject parentInstance;

  /** */
  GSocketListenerPrivate* priv;
}

/**
    Class structure for #GSocketListener.
*/
struct GSocketListenerClass
{
  /** */
  GObjectClass parentClass;

  /**
      virtual method called when the set of socket listened to changes
  */
  extern(C) void function(GSocketListener* listener) changed;

  /** */
  extern(C) void function(GSocketListener* listener, GSocketListenerEvent event, GSocket* socket) event;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;
}

/** */
struct GSocketListenerPrivate;

/** */
struct GSocketPrivate;

/**
    A [gio.socket_service.SocketService] is an object that represents a service that
    is provided to the network or over local sockets.  When a new
    connection is made to the service the [gio.socket_service.SocketService.incoming]
    signal is emitted.
    
    A [gio.socket_service.SocketService] is a subclass of [gio.socket_listener.SocketListener] and you need
    to add the addresses you want to accept connections on with the
    [gio.socket_listener.SocketListener] APIs.
    
    There are two options for implementing a network service based on
    [gio.socket_service.SocketService]. The first is to create the service using
    [gio.socket_service.SocketService.new_] and to connect to the
    [gio.socket_service.SocketService.incoming] signal. The second is to subclass
    [gio.socket_service.SocketService] and override the default signal handler implementation.
    
    In either case, the handler must immediately return, or else it
    will block additional incoming connections from being serviced.
    If you are interested in writing connection handlers that contain
    blocking code then see [gio.threaded_socket_service.ThreadedSocketService].
    
    The socket service runs on the main loop of the
    thread-default context (see
    [glib.main_context.MainContext.pushThreadDefault]) of the thread it is
    created in, and is not threadsafe in general. However, the calls to start and
    stop the service are thread-safe so these can be used from threads that
    handle incoming clients.
*/
struct GSocketService
{
  /** */
  GSocketListener parentInstance;

  /** */
  GSocketServicePrivate* priv;
}

/**
    Class structure for #GSocketService.
*/
struct GSocketServiceClass
{
  /** */
  GSocketListenerClass parentClass;

  /**
      signal emitted when new connections are accepted
  */
  extern(C) gboolean function(GSocketService* service, GSocketConnection* connection, GObject* sourceObject) incoming;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;
}

/** */
struct GSocketServicePrivate;

/**
    A single target host/port that a network service is running on.
    
    SRV (service) records are used by some network protocols to provide
    service-specific aliasing and load-balancing. For example, XMPP
    (Jabber) uses SRV records to locate the XMPP server for a domain;
    rather than connecting directly to ‘example.com’ or assuming a
    specific server hostname like ‘xmpp.example.com’, an XMPP client
    would look up the `xmpp-client` SRV record for ‘example.com’, and
    then connect to whatever host was pointed to by that record.
    
    You can use [gio.resolver.Resolver.lookupService] or
    [gio.resolver.Resolver.lookupServiceAsync] to find the [gio.srv_target.SrvTarget]s
    for a given service. However, if you are simply planning to connect
    to the remote service, you can use [gio.network_service.NetworkService]’s
    [gio.socket_connectable.SocketConnectable] interface and not need to worry about
    [gio.srv_target.SrvTarget] at all.
*/
struct GSrvTarget;

/**
    #GStaticResource is an opaque data structure and can only be accessed
    using the following functions.
*/
struct GStaticResource
{
  /** */
  const(ubyte)* data;

  /** */
  size_t dataLen;

  /** */
  GResource* resource;

  /** */
  GStaticResource* next;

  /** */
  void* padding;
}

/**
    [gio.subprocess.Subprocess] allows the creation of and interaction with child
    processes.
    
    Processes can be communicated with using standard GIO-style APIs (ie:
    [gio.input_stream.InputStream], [gio.output_stream.OutputStream]). There are GIO-style APIs
    to wait for process termination (ie: cancellable and with an asynchronous
    variant).
    
    There is an API to force a process to terminate, as well as a
    race-free API for sending UNIX signals to a subprocess.
    
    One major advantage that GIO brings over the core GLib library is
    comprehensive API for asynchronous I/O, such
    [gio.output_stream.OutputStream.spliceAsync].  This makes [gio.subprocess.Subprocess]
    significantly more powerful and flexible than equivalent APIs in
    some other languages such as the `subprocess.py`
    included with Python.  For example, using [gio.subprocess.Subprocess] one could
    create two child processes, reading standard output from the first,
    processing it, and writing to the input stream of the second, all
    without blocking the main loop.
    
    A powerful [gio.subprocess.Subprocess.communicate] API is provided similar to the
    `communicate()` method of `subprocess.py`. This enables very easy
    interaction with a subprocess that has been opened with pipes.
    
    [gio.subprocess.Subprocess] defaults to tight control over the file descriptors open
    in the child process, avoiding dangling-FD issues that are caused by
    a simple `fork()`/`exec()`.  The only open file descriptors in the
    spawned process are ones that were explicitly specified by the
    [gio.subprocess.Subprocess] API (unless [gio.types.SubprocessFlags.InheritFds] was
    specified).
    
    [gio.subprocess.Subprocess] will quickly reap all child processes as they exit,
    avoiding ‘zombie processes’ remaining around for long periods of
    time.  [gio.subprocess.Subprocess.wait] can be used to wait for this to happen,
    but it will happen even without the call being explicitly made.
    
    As a matter of principle, [gio.subprocess.Subprocess] has no API that accepts
    shell-style space-separated strings.  It will, however, match the
    typical shell behaviour of searching the `PATH` for executables that do
    not contain a directory separator in their name. By default, the `PATH`
    of the current process is used.  You can specify
    [gio.types.SubprocessFlags.SearchPathFromEnvp] to use the `PATH` of the
    launcher environment instead.
    
    [gio.subprocess.Subprocess] attempts to have a very simple API for most uses (ie:
    spawning a subprocess with arguments and support for most typical
    kinds of input and output redirection).  See [gio.subprocess.Subprocess.new_]. The
    [gio.subprocess_launcher.SubprocessLauncher] API is provided for more complicated cases
    (advanced types of redirection, environment variable manipulation,
    change of working directory, child setup functions, etc).
    
    A typical use of [gio.subprocess.Subprocess] will involve calling
    [gio.subprocess.Subprocess.new_], followed by [gio.subprocess.Subprocess.waitAsync] or
    [gio.subprocess.Subprocess.wait].  After the process exits, the status can be
    checked using functions such as [gio.subprocess.Subprocess.getIfExited] (which
    are similar to the familiar `WIFEXITED`-style POSIX macros).
*/
struct GSubprocess;

/**
    This class contains a set of options for launching child processes,
    such as where its standard input and output will be directed, the
    argument list, the environment, and more.
    
    While the [gio.subprocess.Subprocess] class has high level functions covering
    popular cases, use of this class allows access to more advanced
    options.  It can also be used to launch multiple subprocesses with
    a similar configuration.
*/
struct GSubprocessLauncher;

/**
    A [gio.task.Task] represents and manages a cancellable ‘task’.
    
    ## Asynchronous operations
    
    The most common usage of [gio.task.Task] is as a [gio.async_result.AsyncResult], to
    manage data during an asynchronous operation. You call
    [gio.task.Task.new_] in the ‘start’ method, followed by
    [gio.task.Task.setTaskData] and the like if you need to keep some
    additional data associated with the task, and then pass the
    task object around through your asynchronous operation.
    Eventually, you will call a method such as
    [gio.task.Task.returnPointer] or [gio.task.Task.returnError], which
    will save the value you give it and then invoke the task’s callback
    function in the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault])
    where it was created (waiting until the next iteration of the main
    loop first, if necessary). The caller will pass the [gio.task.Task] back to
    the operation’s finish function (as a [gio.async_result.AsyncResult]), and you can
    use [gio.task.Task.propagatePointer] or the like to extract the
    return value.
    
    Using [gio.task.Task] requires the thread-default [glib.main_context.MainContext] from when
    the [gio.task.Task] was constructed to be running at least until the task has
    completed and its data has been freed.
    
    If a [gio.task.Task] has been constructed and its callback set, it is an error to
    not call `g_task_return_*()` on it. GLib will warn at runtime if this happens
    (since 2.76).
    
    Here is an example for using [gio.task.Task] as a [gio.async_result.AsyncResult]:
    ```c
    typedef struct {
      CakeFrostingType frosting;
      char *message;
    } DecorationData;
    
    static void
    decoration_data_free (DecorationData *decoration)
    {
      g_free (decoration->message);
      g_slice_free (DecorationData, decoration);
    }
    
    static void
    baked_cb (Cake     *cake,
              gpointer  user_data)
    {
      GTask *task = user_data;
      DecorationData *decoration = g_task_get_task_data (task);
      GError *error = NULL;
    
      if (cake == NULL)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
                                   "Go to the supermarket");
          g_object_unref (task);
          return;
        }
    
      if (!cake_decorate (cake, decoration->frosting, decoration->message, &error))
        {
          g_object_unref (cake);
          // g_task_return_error() takes ownership of error
          g_task_return_error (task, error);
          g_object_unref (task);
          return;
        }
    
      g_task_return_pointer (task, cake, g_object_unref);
      g_object_unref (task);
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      GTask *task;
      DecorationData *decoration;
      Cake  *cake;
    
      task = g_task_new (self, cancellable, callback, user_data);
      if (radius < 3)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_TOO_SMALL,
                                   "%ucm radius cakes are silly",
                                   radius);
          g_object_unref (task);
          return;
        }
    
      cake = _baker_get_cached_cake (self, radius, flavor, frosting, message);
      if (cake != NULL)
        {
          // _baker_get_cached_cake() returns a reffed cake
          g_task_return_pointer (task, cake, g_object_unref);
          g_object_unref (task);
          return;
        }
    
      decoration = g_slice_new (DecorationData);
      decoration->frosting = frosting;
      decoration->message = g_strdup (message);
      g_task_set_task_data (task, decoration, (GDestroyNotify) decoration_data_free);
    
      _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Chained asynchronous operations
    
    [gio.task.Task] also tries to simplify asynchronous operations that
    internally chain together several smaller asynchronous
    operations. [gio.task.Task.getCancellable], [gio.task.Task.getContext],
    and [gio.task.Task.getPriority] allow you to get back the task’s
    [gio.cancellable.Cancellable], [glib.main_context.MainContext], and
    [I/O priority](iface.AsyncResult.html#io-priority)
    when starting a new subtask, so you don’t have to keep track
    of them yourself. [gio.task.Task.attachSource] simplifies the case
    of waiting for a source to fire (automatically using the correct
    [glib.main_context.MainContext] and priority).
    
    Here is an example for chained asynchronous operations:
    ```c
    typedef struct {
      Cake *cake;
      CakeFrostingType frosting;
      char *message;
    } BakingData;
    
    static void
    decoration_data_free (BakingData *bd)
    {
      if (bd->cake)
        g_object_unref (bd->cake);
      g_free (bd->message);
      g_slice_free (BakingData, bd);
    }
    
    static void
    decorated_cb (Cake         *cake,
                  GAsyncResult *result,
                  gpointer      user_data)
    {
      GTask *task = user_data;
      GError *error = NULL;
    
      if (!cake_decorate_finish (cake, result, &error))
        {
          g_object_unref (cake);
          g_task_return_error (task, error);
          g_object_unref (task);
          return;
        }
    
      // baking_data_free() will drop its ref on the cake, so we have to
      // take another here to give to the caller.
      g_task_return_pointer (task, g_object_ref (cake), g_object_unref);
      g_object_unref (task);
    }
    
    static gboolean
    decorator_ready (gpointer user_data)
    {
      GTask *task = user_data;
      BakingData *bd = g_task_get_task_data (task);
    
      cake_decorate_async (bd->cake, bd->frosting, bd->message,
                           g_task_get_cancellable (task),
                           decorated_cb, task);
    
      return G_SOURCE_REMOVE;
    }
    
    static void
    baked_cb (Cake     *cake,
              gpointer  user_data)
    {
      GTask *task = user_data;
      BakingData *bd = g_task_get_task_data (task);
      GError *error = NULL;
    
      if (cake == NULL)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
                                   "Go to the supermarket");
          g_object_unref (task);
          return;
        }
    
      bd->cake = cake;
    
      // Bail out now if the user has already cancelled
      if (g_task_return_error_if_cancelled (task))
        {
          g_object_unref (task);
          return;
        }
    
      if (cake_decorator_available (cake))
        decorator_ready (task);
      else
        {
          GSource *source;
    
          source = cake_decorator_wait_source_new (cake);
          // Attach @source to @task’s GMainContext and have it call
          // decorator_ready() when it is ready.
          g_task_attach_source (task, source, decorator_ready);
          g_source_unref (source);
        }
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           gint                 priority,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      GTask *task;
      BakingData *bd;
    
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_priority (task, priority);
    
      bd = g_slice_new0 (BakingData);
      bd->frosting = frosting;
      bd->message = g_strdup (message);
      g_task_set_task_data (task, bd, (GDestroyNotify) baking_data_free);
    
      _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Asynchronous operations from synchronous ones
    
    You can use [gio.task.Task.runInThread] to turn a synchronous
    operation into an asynchronous one, by running it in a thread.
    When it completes, the result will be dispatched to the thread-default main
    context (see [glib.main_context.MainContext.pushThreadDefault]) where the [gio.task.Task]
    was created.
    
    Running a task in a thread:
    ```c
    typedef struct {
      guint radius;
      CakeFlavor flavor;
      CakeFrostingType frosting;
      char *message;
    } CakeData;
    
    static void
    cake_data_free (CakeData *cake_data)
    {
      g_free (cake_data->message);
      g_slice_free (CakeData, cake_data);
    }
    
    static void
    bake_cake_thread (GTask         *task,
                      gpointer       source_object,
                      gpointer       task_data,
                      GCancellable  *cancellable)
    {
      Baker *self = source_object;
      CakeData *cake_data = task_data;
      Cake *cake;
      GError *error = NULL;
    
      cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
                        cake_data->frosting, cake_data->message,
                        cancellable, &error);
      if (cake)
        g_task_return_pointer (task, cake, g_object_unref);
      else
        g_task_return_error (task, error);
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      CakeData *cake_data;
      GTask *task;
    
      cake_data = g_slice_new (CakeData);
      cake_data->radius = radius;
      cake_data->flavor = flavor;
      cake_data->frosting = frosting;
      cake_data->message = g_strdup (message);
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_run_in_thread (task, bake_cake_thread);
      g_object_unref (task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Adding cancellability to uncancellable tasks
    
    Finally, [gio.task.Task.runInThread] and
    [gio.task.Task.runInThreadSync] can be used to turn an uncancellable
    operation into a cancellable one. If you call
    [gio.task.Task.setReturnOnCancel], passing `TRUE`, then if the task’s
    [gio.cancellable.Cancellable] is cancelled, it will return control back to the
    caller immediately, while allowing the task thread to continue running in the
    background (and simply discarding its result when it finally does finish).
    Provided that the task thread is careful about how it uses
    locks and other externally-visible resources, this allows you
    to make ‘GLib-friendly’ asynchronous and cancellable
    synchronous variants of blocking APIs.
    
    Cancelling a task:
    ```c
    static void
    bake_cake_thread (GTask         *task,
                      gpointer       source_object,
                      gpointer       task_data,
                      GCancellable  *cancellable)
    {
      Baker *self = source_object;
      CakeData *cake_data = task_data;
      Cake *cake;
      GError *error = NULL;
    
      cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
                        cake_data->frosting, cake_data->message,
                        &error);
      if (error)
        {
          g_task_return_error (task, error);
          return;
        }
    
      // If the task has already been cancelled, then we don’t want to add
      // the cake to the cake cache. Likewise, we don’t  want to have the
      // task get cancelled in the middle of updating the cache.
      // g_task_set_return_on_cancel() will return %TRUE here if it managed
      // to disable return-on-cancel, or %FALSE if the task was cancelled
      // before it could.
      if (g_task_set_return_on_cancel (task, FALSE))
        {
          // If the caller cancels at this point, their
          // GAsyncReadyCallback won’t be invoked until we return,
          // so we don’t have to worry that this code will run at
          // the same time as that code does. But if there were
          // other functions that might look at the cake cache,
          // then we’d probably need a GMutex here as well.
          baker_add_cake_to_cache (baker, cake);
          g_task_return_pointer (task, cake, g_object_unref);
        }
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      CakeData *cake_data;
      GTask *task;
    
      cake_data = g_slice_new (CakeData);
    
      ...
    
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_set_return_on_cancel (task, TRUE);
      g_task_run_in_thread (task, bake_cake_thread);
    }
    
    Cake *
    baker_bake_cake_sync (Baker               *self,
                          guint                radius,
                          CakeFlavor           flavor,
                          CakeFrostingType     frosting,
                          const char          *message,
                          GCancellable        *cancellable,
                          GError             **error)
    {
      CakeData *cake_data;
      GTask *task;
      Cake *cake;
    
      cake_data = g_slice_new (CakeData);
    
      ...
    
      task = g_task_new (self, cancellable, NULL, NULL);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_set_return_on_cancel (task, TRUE);
      g_task_run_in_thread_sync (task, bake_cake_thread);
    
      cake = g_task_propagate_pointer (task, error);
      g_object_unref (task);
      return cake;
    }
    ```
    
    ## Porting from [gio.simple_async_result.SimpleAsyncResult]
    
    [gio.task.Task]’s API attempts to be simpler than [gio.simple_async_result.SimpleAsyncResult]’s
    in several ways:
    
    $(LIST
      * You can save task-specific data with [gio.task.Task.setTaskData], and
        retrieve it later with [gio.task.Task.getTaskData]. This replaces the
        abuse of [gio.simple_async_result.SimpleAsyncResult.setOpResGpointer] for the same
        purpose with [gio.simple_async_result.SimpleAsyncResult].
      * In addition to the task data, [gio.task.Task] also keeps track of the
        [priority](iface.AsyncResult.html#io-priority), [gio.cancellable.Cancellable],
        and [glib.main_context.MainContext] associated with the task, so tasks that
        consist of a chain of simpler asynchronous operations will have easy access
        to those values when starting each sub-task.
      * [gio.task.Task.returnErrorIfCancelled] provides simplified
        handling for cancellation. In addition, cancellation
        overrides any other [gio.task.Task] return value by default, like
        [gio.simple_async_result.SimpleAsyncResult] does when
        [gio.simple_async_result.SimpleAsyncResult.setCheckCancellable] is called.
        (You can use [gio.task.Task.setCheckCancellable] to turn off that
        behavior.) On the other hand, [gio.task.Task.runInThread]
        guarantees that it will always run your
        `task_func`, even if the task’s [gio.cancellable.Cancellable]
        is already cancelled before the task gets a chance to run;
        you can start your `task_func` with a
        [gio.task.Task.returnErrorIfCancelled] check if you need the
        old behavior.
      * The ‘return’ methods (eg, [gio.task.Task.returnPointer])
        automatically cause the task to be ‘completed’ as well, and
        there is no need to worry about the ‘complete’ vs ‘complete in idle’
        distinction. ([gio.task.Task] automatically figures out
        whether the task’s callback can be invoked directly, or
        if it needs to be sent to another [glib.main_context.MainContext], or delayed
        until the next iteration of the current [glib.main_context.MainContext].)
      * The ‘finish’ functions for [gio.task.Task] based operations are generally
        much simpler than [gio.simple_async_result.SimpleAsyncResult] ones, normally consisting
        of only a single call to [gio.task.Task.propagatePointer] or the like.
        Since [gio.task.Task.propagatePointer] ‘steals’ the return value from
        the [gio.task.Task], it is not necessary to juggle pointers around to
        prevent it from being freed twice.
      * With [gio.simple_async_result.SimpleAsyncResult], it was common to call
        [gio.simple_async_result.SimpleAsyncResult.propagateError] from the
        `_finish()` wrapper function, and have
        virtual method implementations only deal with successful
        returns. This behavior is deprecated, because it makes it
        difficult for a subclass to chain to a parent class’s async
        methods. Instead, the wrapper function should just be a
        simple wrapper, and the virtual method should call an
        appropriate `g_task_propagate_` function.
        Note that wrapper methods can now use
        [gio.async_result.AsyncResult.legacyPropagateError] to do old-style
        [gio.simple_async_result.SimpleAsyncResult] error-returning behavior, and
        [gio.async_result.AsyncResult.isTagged] to check if a result is tagged as
        having come from the `_async()` wrapper
        function (for ‘short-circuit’ results, such as when passing
        `0` to [gio.input_stream.InputStream.readAsync]).
    )
      
    ## Thread-safety considerations
    
    Due to some infelicities in the API design, there is a
    thread-safety concern that users of [gio.task.Task] have to be aware of:
    
    If the `main` thread drops its last reference to the source object
    or the task data before the task is finalized, then the finalizers
    of these objects may be called on the worker thread.
    
    This is a problem if the finalizers use non-threadsafe API, and
    can lead to hard-to-debug crashes. Possible workarounds include:
    
    $(LIST
      * Clear task data in a signal handler for `notify::completed`
      * Keep iterating a main context in the main thread and defer
        dropping the reference to the source object to that main
        context when the task is finalized
    )
*/
struct GTask;

/** */
struct GTaskClass;

/**
    This is the subclass of [gio.socket_connection.SocketConnection] that is created
    for TCP/IP sockets.
*/
struct GTcpConnection
{
  /** */
  GSocketConnection parentInstance;

  /** */
  GTcpConnectionPrivate* priv;
}

/** */
struct GTcpConnectionClass
{
  /** */
  GSocketConnectionClass parentClass;
}

/** */
struct GTcpConnectionPrivate;

/**
    A [gio.tcp_wrapper_connection.TcpWrapperConnection] can be used to wrap a [gio.iostream.IOStream] that is
    based on a [gio.socket.Socket], but which is not actually a
    [gio.socket_connection.SocketConnection]. This is used by [gio.socket_client.SocketClient] so
    that it can always return a [gio.socket_connection.SocketConnection], even when the
    connection it has actually created is not directly a
    [gio.socket_connection.SocketConnection].
*/
struct GTcpWrapperConnection
{
  /** */
  GTcpConnection parentInstance;

  /** */
  GTcpWrapperConnectionPrivate* priv;
}

/** */
struct GTcpWrapperConnectionClass
{
  /** */
  GTcpConnectionClass parentClass;
}

/** */
struct GTcpWrapperConnectionPrivate;

/**
    A helper class for testing code which uses D-Bus without touching the user’s
    session bus.
    
    Note that [gio.test_dbus.TestDBus] modifies the user’s environment, calling
    [`setenv()`](man:setenv(3)). This is not thread-safe, so all [gio.test_dbus.TestDBus]
    calls should be completed before threads are spawned, or should have
    appropriate locking to ensure no access conflicts to environment variables
    shared between [gio.test_dbus.TestDBus] and other threads.
    
    ## Creating unit tests using [gio.test_dbus.TestDBus]
    
    Testing of D-Bus services can be tricky because normally we only ever run
    D-Bus services over an existing instance of the D-Bus daemon thus we
    usually don’t activate D-Bus services that are not yet installed into the
    target system. The [gio.test_dbus.TestDBus] object makes this easier for us by taking care
    of the lower level tasks such as running a private D-Bus daemon and looking
    up uninstalled services in customizable locations, typically in your source
    code tree.
    
    The first thing you will need is a separate service description file for the
    D-Bus daemon. Typically a `services` subdirectory of your `tests` directory
    is a good place to put this file.
    
    The service file should list your service along with an absolute path to the
    uninstalled service executable in your source tree. Using autotools we would
    achieve this by adding a file such as `my-server.service.in` in the services
    directory and have it processed by configure.
    
    ```
    [D-BUS Service]
    Name=org.gtk.GDBus.Examples.ObjectManager
    Exec=@abs_top_builddir@/gio/tests/gdbus-example-objectmanager-server
    ```
    
    You will also need to indicate this service directory in your test
    fixtures, so you will need to pass the path while compiling your
    test cases. Typically this is done with autotools with an added
    preprocessor flag specified to compile your tests such as:
    
    ```
    -DTEST_SERVICES=\""$(abs_top_builddir)/tests/services"\"
    ```
    
    Once you have a service definition file which is local to your source tree,
    you can proceed to set up a GTest fixture using the [gio.test_dbus.TestDBus] scaffolding.
    
    An example of a test fixture for D-Bus services can be found
    here:
    [gdbus-test-fixture.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-test-fixture.c)
    
    Note that these examples only deal with isolating the D-Bus aspect of your
    service. To successfully run isolated unit tests on your service you may need
    some additional modifications to your test case fixture. For example; if your
    service uses [gio.settings.Settings] and installs a schema then it is important
    that your test service not load the schema in the ordinary installed location
    (chances are that your service and schema files are not yet installed, or
    worse; there is an older version of the schema file sitting in the install
    location).
    
    Most of the time we can work around these obstacles using the
    environment. Since the environment is inherited by the D-Bus daemon
    created by [gio.test_dbus.TestDBus] and then in turn inherited by any services the
    D-Bus daemon activates, using the setup routine for your fixture is
    a practical place to help sandbox your runtime environment. For the
    rather typical GSettings case we can work around this by setting
    `GSETTINGS_SCHEMA_DIR` to the in tree directory holding your schemas
    in the above `fixture_setup()` routine.
    
    The GSettings schemas need to be locally pre-compiled for this to work. This
    can be achieved by compiling the schemas locally as a step before running
    test cases, an autotools setup might do the following in the directory
    holding schemas:
    
    ```
        all-am:
                $(GLIB_COMPILE_SCHEMAS) .
    
        CLEANFILES += gschemas.compiled
    ```
*/
struct GTestDBus;

/**
    [gio.themed_icon.ThemedIcon] is an implementation of [gio.icon.Icon] that supports icon
    themes.
    
    [gio.themed_icon.ThemedIcon] contains a list of all of the icons present in an icon
    theme, so that icons can be looked up quickly. [gio.themed_icon.ThemedIcon] does
    not provide actual pixmaps for icons, just the icon names.
    Ideally something like `method@Gtk.IconTheme.choose_icon` should be used to
    resolve the list of names so that fallback icons work nicely with
    themes that inherit other themes.
*/
struct GThemedIcon;

/** */
struct GThemedIconClass;

/**
    #GThreadedResolver is an implementation of #GResolver which calls the libc
    lookup functions in threads to allow them to run asynchronously.
*/
struct GThreadedResolver;

/** */
struct GThreadedResolverClass
{
  /** */
  GResolverClass parentClass;
}

/**
    A [gio.threaded_socket_service.ThreadedSocketService] is a simple subclass of [gio.socket_service.SocketService]
    that handles incoming connections by creating a worker thread and
    dispatching the connection to it by emitting the
    [gio.threaded_socket_service.ThreadedSocketService.run] in the new thread.
    
    The signal handler may perform blocking I/O and need not return
    until the connection is closed.
    
    The service is implemented using a thread pool, so there is a
    limited amount of threads available to serve incoming requests.
    The service automatically stops the [gio.socket_service.SocketService] from accepting
    new connections when all threads are busy.
    
    As with [gio.socket_service.SocketService], you may connect to
    [gio.threaded_socket_service.ThreadedSocketService.run], or subclass and override the default
    handler.
*/
struct GThreadedSocketService
{
  /** */
  GSocketService parentInstance;

  /** */
  GThreadedSocketServicePrivate* priv;
}

/** */
struct GThreadedSocketServiceClass
{
  /** */
  GSocketServiceClass parentClass;

  /** */
  extern(C) gboolean function(GThreadedSocketService* service, GSocketConnection* connection, GObject* sourceObject) run;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GThreadedSocketServicePrivate;

/**
    TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented
    by a TLS backend.
*/
struct GTlsBackend;

/**
    Provides an interface for describing TLS-related types.
*/
struct GTlsBackendInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      returns whether the backend supports TLS.
  */
  extern(C) gboolean function(GTlsBackend* backend) supportsTls;

  /**
      returns the #GTlsCertificate implementation type
  */
  extern(C) GType function() getCertificateType;

  /**
      returns the #GTlsClientConnection implementation type
  */
  extern(C) GType function() getClientConnectionType;

  /**
      returns the #GTlsServerConnection implementation type
  */
  extern(C) GType function() getServerConnectionType;

  /**
      returns the #GTlsFileDatabase implementation type.
  */
  extern(C) GType function() getFileDatabaseType;

  /**
      returns a default #GTlsDatabase instance.
  */
  extern(C) GTlsDatabase* function(GTlsBackend* backend) getDefaultDatabase;

  /**
      returns whether the backend supports DTLS
  */
  extern(C) gboolean function(GTlsBackend* backend) supportsDtls;

  /**
      returns the #GDtlsClientConnection implementation type
  */
  extern(C) GType function() getDtlsClientConnectionType;

  /**
      returns the #GDtlsServerConnection implementation type
  */
  extern(C) GType function() getDtlsServerConnectionType;
}

/**
    A certificate used for TLS authentication and encryption.
    This can represent either a certificate only (eg, the certificate
    received by a client from a server), or the combination of
    a certificate and a private key (which is needed when acting as a
    [gio.tls_server_connection.TlsServerConnection]).
*/
struct GTlsCertificate
{
  /** */
  GObject parentInstance;

  /** */
  GTlsCertificatePrivate* priv;
}

/** */
struct GTlsCertificateClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GTlsCertificateFlags function(GTlsCertificate* cert, GSocketConnectable* identity, GTlsCertificate* trustedCa) verify;

  /** */
  void*[8] padding;
}

/** */
struct GTlsCertificatePrivate;

/**
    [gio.tls_client_connection.TlsClientConnection] is the client-side subclass of
    [gio.tls_connection.TlsConnection], representing a client-side TLS connection.
*/
struct GTlsClientConnection;

/**
    vtable for a #GTlsClientConnection implementation.
*/
struct GTlsClientConnectionInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Copies session state from one #GTlsClientConnection to another.
  */
  extern(C) void function(GTlsClientConnection* conn, GTlsClientConnection* source) copySessionState;
}

/**
    [gio.tls_connection.TlsConnection] is the base TLS connection class type, which wraps
    a [gio.iostream.IOStream] and provides TLS encryption on top of it. Its
    subclasses, [gio.tls_client_connection.TlsClientConnection] and
    [gio.tls_server_connection.TlsServerConnection], implement client-side and server-side TLS,
    respectively.
    
    For DTLS (Datagram TLS) support, see [gio.dtls_connection.DtlsConnection].
*/
struct GTlsConnection
{
  /** */
  GIOStream parentInstance;

  /** */
  GTlsConnectionPrivate* priv;
}

/**
    The class structure for the #GTlsConnection type.
*/
struct GTlsConnectionClass
{
  /**
      The parent class.
  */
  GIOStreamClass parentClass;

  /**
      Check whether to accept a certificate.
  */
  extern(C) gboolean function(GTlsConnection* connection, GTlsCertificate* peerCert, GTlsCertificateFlags errors) acceptCertificate;

  /**
      Perform a handshake operation.
  */
  extern(C) gboolean function(GTlsConnection* conn, GCancellable* cancellable, GError** _err) handshake;

  /**
      Start an asynchronous handshake operation.
  */
  extern(C) void function(GTlsConnection* conn, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) handshakeAsync;

  /**
      Finish an asynchronous handshake operation.
  */
  extern(C) gboolean function(GTlsConnection* conn, GAsyncResult* result, GError** _err) handshakeFinish;

  /**
      Retrieve TLS channel binding data (Since: 2.66)
  */
  extern(C) gboolean function(GTlsConnection* conn, GTlsChannelBindingType type, GByteArray* data, GError** _err) getBindingData;

  /**
      Get ALPN-negotiated protocol (Since: 2.70)
  */
  extern(C) const(char)* function(GTlsConnection* conn) getNegotiatedProtocol;

  /** */
  void*[6] padding;
}

/** */
struct GTlsConnectionPrivate;

/**
    [gio.tls_database.TlsDatabase] is used to look up certificates and other information
    from a certificate or key store. It is an abstract base class which
    TLS library specific subtypes override.
    
    A [gio.tls_database.TlsDatabase] may be accessed from multiple threads by the TLS backend.
    All implementations are required to be fully thread-safe.
    
    Most common client applications will not directly interact with
    [gio.tls_database.TlsDatabase]. It is used internally by [gio.tls_connection.TlsConnection].
*/
struct GTlsDatabase
{
  /** */
  GObject parentInstance;

  /** */
  GTlsDatabasePrivate* priv;
}

/**
    The class for #GTlsDatabase. Derived classes should implement the various
    virtual methods. _async and _finish methods have a default
    implementation that runs the corresponding sync method in a thread.
*/
struct GTlsDatabaseClass
{
  /** */
  GObjectClass parentClass;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.verifyChain].
  */
  extern(C) GTlsCertificateFlags function(GTlsDatabase* self, GTlsCertificate* chain, const(char)* purpose, GSocketConnectable* identity, GTlsInteraction* interaction, GTlsDatabaseVerifyFlags flags, GCancellable* cancellable, GError** _err) verifyChain;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.verifyChainAsync].
  */
  extern(C) void function(GTlsDatabase* self, GTlsCertificate* chain, const(char)* purpose, GSocketConnectable* identity, GTlsInteraction* interaction, GTlsDatabaseVerifyFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) verifyChainAsync;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.verifyChainFinish].
  */
  extern(C) GTlsCertificateFlags function(GTlsDatabase* self, GAsyncResult* result, GError** _err) verifyChainFinish;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.createCertificateHandle].
  */
  extern(C) char* function(GTlsDatabase* self, GTlsCertificate* certificate) createCertificateHandle;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateForHandle].
  */
  extern(C) GTlsCertificate* function(GTlsDatabase* self, const(char)* handle, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) lookupCertificateForHandle;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateForHandleAsync].
  */
  extern(C) void function(GTlsDatabase* self, const(char)* handle, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupCertificateForHandleAsync;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateForHandleFinish].
  */
  extern(C) GTlsCertificate* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) lookupCertificateForHandleFinish;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateIssuer].
  */
  extern(C) GTlsCertificate* function(GTlsDatabase* self, GTlsCertificate* certificate, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) lookupCertificateIssuer;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateIssuerAsync].
  */
  extern(C) void function(GTlsDatabase* self, GTlsCertificate* certificate, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupCertificateIssuerAsync;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificateIssuerFinish].
  */
  extern(C) GTlsCertificate* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) lookupCertificateIssuerFinish;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificatesIssuedBy].
  */
  extern(C) GList* function(GTlsDatabase* self, GByteArray* issuerRawDn, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) lookupCertificatesIssuedBy;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificatesIssuedByAsync].
  */
  extern(C) void function(GTlsDatabase* self, GByteArray* issuerRawDn, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookupCertificatesIssuedByAsync;

  /**
      Virtual method implementing
       [gio.tls_database.TlsDatabase.lookupCertificatesIssuedByFinish].
  */
  extern(C) GList* function(GTlsDatabase* self, GAsyncResult* result, GError** _err) lookupCertificatesIssuedByFinish;

  /** */
  void*[16] padding;
}

/** */
struct GTlsDatabasePrivate;

/**
    [gio.tls_file_database.TlsFileDatabase] is implemented by [gio.tls_database.TlsDatabase] objects which
    load their certificate information from a file. It is an interface which
    TLS library specific subtypes implement.
*/
struct GTlsFileDatabase;

/**
    Provides an interface for #GTlsFileDatabase implementations.
*/
struct GTlsFileDatabaseInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /** */
  void*[8] padding;
}

/**
    [gio.tls_interaction.TlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for passwords.
    
    To use a [gio.tls_interaction.TlsInteraction] with a TLS connection use
    [gio.tls_connection.TlsConnection.setInteraction].
    
    Callers should instantiate a derived class that implements the various
    interaction methods to show the required dialogs.
    
    Callers should use the 'invoke' functions like
    [gio.tls_interaction.TlsInteraction.invokeAskPassword] to run interaction methods.
    These functions make sure that the interaction is invoked in the main loop
    and not in the current thread, if the current thread is not running the
    main loop.
    
    Derived classes can choose to implement whichever interactions methods they’d
    like to support by overriding those virtual methods in their class
    initialization function. Any interactions not implemented will return
    [gio.types.TlsInteractionResult.Unhandled]. If a derived class implements an async method,
    it must also implement the corresponding finish method.
*/
struct GTlsInteraction
{
  /** */
  GObject parentInstance;

  /** */
  GTlsInteractionPrivate* priv;
}

/**
    The class for #GTlsInteraction. Derived classes implement the various
    virtual interaction methods to handle TLS interactions.
    
    Derived classes can choose to implement whichever interactions methods they'd
    like to support by overriding those virtual methods in their class
    initialization function. If a derived class implements an async method,
    it must also implement the corresponding finish method.
    
    The synchronous interaction methods should implement to display modal dialogs,
    and the asynchronous methods to display modeless dialogs.
    
    If the user cancels an interaction, then the result should be
    [gio.types.TlsInteractionResult.Failed] and the error should be set with a domain of
    `G_IO_ERROR` and code of [gio.types.IOErrorEnum.Cancelled].
*/
struct GTlsInteractionClass
{
  /** */
  GObjectClass parentClass;

  /**
      ask for a password synchronously. If the implementation
          returns [gio.types.TlsInteractionResult.Handled], then the password argument should
          have been filled in by using [gio.tls_password.TlsPassword.setValue] or a similar
          function.
  */
  extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GError** _err) askPassword;

  /**
      ask for a password asynchronously.
  */
  extern(C) void function(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) askPasswordAsync;

  /**
      complete operation to ask for a password asynchronously.
          If the implementation returns [gio.types.TlsInteractionResult.Handled], then the
          password argument of the async method should have been filled in by using
          [gio.tls_password.TlsPassword.setValue] or a similar function.
  */
  extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) askPasswordFinish;

  /**
      ask for a certificate synchronously. If the
          implementation returns [gio.types.TlsInteractionResult.Handled], then the connection
          argument should have been filled in by using
          [gio.tls_connection.TlsConnection.setCertificate].
  */
  extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GError** _err) requestCertificate;

  /**
      ask for a certificate asynchronously.
  */
  extern(C) void function(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) requestCertificateAsync;

  /**
      complete operation to ask for a certificate
          asynchronously. If the implementation returns [gio.types.TlsInteractionResult.Handled],
          then the connection argument of the async method should have been
          filled in by using [gio.tls_connection.TlsConnection.setCertificate].
  */
  extern(C) GTlsInteractionResult function(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) requestCertificateFinish;

  /** */
  void*[21] padding;
}

/** */
struct GTlsInteractionPrivate;

/**
    An abstract interface representing a password used in TLS. Often used in
    user interaction such as unlocking a key storage token.
*/
struct GTlsPassword
{
  /** */
  GObject parentInstance;

  /** */
  GTlsPasswordPrivate* priv;
}

/**
    Class structure for #GTlsPassword.
*/
struct GTlsPasswordClass
{
  /** */
  GObjectClass parentClass;

  /**
      virtual method for [gio.tls_password.TlsPassword.getValue]
  */
  extern(C) const(ubyte)* function(GTlsPassword* password, size_t* length) getValue;

  /**
      virtual method for [gio.tls_password.TlsPassword.setValue]
  */
  extern(C) void function(GTlsPassword* password, ubyte* value, ptrdiff_t length, GDestroyNotify destroy) setValue;

  /**
      virtual method for [gio.tls_password.TlsPassword.getWarning] if no
       value has been set using [gio.tls_password.TlsPassword.setWarning]
  */
  extern(C) const(char)* function(GTlsPassword* password) getDefaultWarning;

  /** */
  void*[4] padding;
}

/** */
struct GTlsPasswordPrivate;

/**
    [gio.tls_server_connection.TlsServerConnection] is the server-side subclass of
    [gio.tls_connection.TlsConnection], representing a server-side TLS connection.
*/
struct GTlsServerConnection;

/**
    vtable for a #GTlsServerConnection implementation.
*/
struct GTlsServerConnectionInterface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;
}

/**
    This is the subclass of [gio.socket_connection.SocketConnection] that is created
    for UNIX domain sockets.
    
    It contains functions to do some of the UNIX socket specific
    functionality like passing file descriptors.
    
    Since GLib 2.72, [gio.unix_connection.UnixConnection] is available on all platforms. It requires
    underlying system support (such as Windows 10 with `AF_UNIX`) at run time.
    
    Before GLib 2.72, `<gio/gunixconnection.h>` belonged to the UNIX-specific GIO
    interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file when
    using it. This is no longer necessary since GLib 2.72.
*/
struct GUnixConnection
{
  /** */
  GSocketConnection parentInstance;

  /** */
  GUnixConnectionPrivate* priv;
}

/** */
struct GUnixConnectionClass
{
  /** */
  GSocketConnectionClass parentClass;
}

/** */
struct GUnixConnectionPrivate;

/**
    This [gio.socket_control_message.SocketControlMessage] contains a [gio.credentials.Credentials]
    instance.  It may be sent using [gio.socket.Socket.sendMessage] and received
    using [gio.socket.Socket.receiveMessage] over UNIX sockets (ie: sockets in
    the [gio.types.SocketFamily.Unix] family).
    
    For an easier way to send and receive credentials over
    stream-oriented UNIX sockets, see
    [gio.unix_connection.UnixConnection.sendCredentials] and
    [gio.unix_connection.UnixConnection.receiveCredentials]. To receive credentials of
    a foreign process connected to a socket, use
    [gio.socket.Socket.getCredentials].
    
    Since GLib 2.72, `GUnixCredentialMessage` is available on all platforms. It
    requires underlying system support (such as Windows 10 with `AF_UNIX`) at run
    time.
    
    Before GLib 2.72, `<gio/gunixcredentialsmessage.h>` belonged to the UNIX-specific
    GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
    when using it. This is no longer necessary since GLib 2.72.
*/
struct GUnixCredentialsMessage
{
  /** */
  GSocketControlMessage parentInstance;

  /** */
  GUnixCredentialsMessagePrivate* priv;
}

/**
    Class structure for #GUnixCredentialsMessage.
*/
struct GUnixCredentialsMessageClass
{
  /** */
  GSocketControlMessageClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;
}

/** */
struct GUnixCredentialsMessagePrivate;

/**
    A [gio.unix_fdlist.UnixFDList] contains a list of file descriptors.  It owns the file
    descriptors that it contains, closing them when finalized.
    
    It may be wrapped in a
    [[gio.unix_fdmessage.UnixFDMessage]](../gio-unix/class.UnixFDMessage.html) and sent over a
    [gio.socket.Socket] in the [gio.types.SocketFamily.Unix] family by using
    [gio.socket.Socket.sendMessage] and received using
    [gio.socket.Socket.receiveMessage].
    
    Before 2.74, `<gio/gunixfdlist.h>` belonged to the UNIX-specific GIO
    interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file when
    using it.
    
    Since 2.74, the API is available for Windows.
*/
struct GUnixFDList
{
  /** */
  GObject parentInstance;

  /** */
  GUnixFDListPrivate* priv;
}

/** */
struct GUnixFDListClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GUnixFDListPrivate;

/**
    This [gio.socket_control_message.SocketControlMessage] contains a [gio.unix_fdlist.UnixFDList].
    It may be sent using [gio.socket.Socket.sendMessage] and received using
    [gio.socket.Socket.receiveMessage] over UNIX sockets (ie: sockets in the
    [gio.types.SocketFamily.Unix] family). The file descriptors are copied
    between processes by the kernel.
    
    For an easier way to send and receive file descriptors over
    stream-oriented UNIX sockets, see [gio.unix_connection.UnixConnection.sendFd] and
    [gio.unix_connection.UnixConnection.receiveFd].
    
    Note that `<gio/gunixfdmessage.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
struct GUnixFDMessage
{
  /** */
  GSocketControlMessage parentInstance;

  /** */
  GUnixFDMessagePrivate* priv;
}

/** */
struct GUnixFDMessageClass
{
  /** */
  GSocketControlMessageClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;
}

/** */
struct GUnixFDMessagePrivate;

/**
    [gio.unix_input_stream.UnixInputStream] implements [gio.input_stream.InputStream] for reading from a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixinputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
struct GUnixInputStream
{
  /** */
  GInputStream parentInstance;

  /** */
  GUnixInputStreamPrivate* priv;
}

/** */
struct GUnixInputStreamClass
{
  /** */
  GInputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GUnixInputStreamPrivate;

/**
    Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>).
    This corresponds roughly to a mtab entry.
*/
struct GUnixMountEntry;

/**
    Watches #GUnixMounts for changes.
*/
struct GUnixMountMonitor;

/** */
struct GUnixMountMonitorClass;

/**
    Defines a Unix mount point (e.g. <filename>/dev</filename>).
    This corresponds roughly to a fstab entry.
*/
struct GUnixMountPoint;

/**
    [gio.unix_output_stream.UnixOutputStream] implements [gio.output_stream.OutputStream] for writing to a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixoutputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
struct GUnixOutputStream
{
  /** */
  GOutputStream parentInstance;

  /** */
  GUnixOutputStreamPrivate* priv;
}

/** */
struct GUnixOutputStreamClass
{
  /** */
  GOutputStreamClass parentClass;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;
}

/** */
struct GUnixOutputStreamPrivate;

/**
    Support for UNIX-domain (also known as local) sockets, corresponding to
    `struct sockaddr_un`.
    
    UNIX domain sockets are generally visible in the filesystem.
    However, some systems support abstract socket names which are not
    visible in the filesystem and not affected by the filesystem
    permissions, visibility, etc. Currently this is only supported
    under Linux. If you attempt to use abstract sockets on other
    systems, function calls may return [gio.types.IOErrorEnum.NotSupported]
    errors. You can use [gio.unix_socket_address.UnixSocketAddress.abstractNamesSupported]
    to see if abstract names are supported.
    
    Since GLib 2.72, [gio.unix_socket_address.UnixSocketAddress] is available on all platforms. It
    requires underlying system support (such as Windows 10 with `AF_UNIX`) at
    run time.
    
    Before GLib 2.72, `<gio/gunixsocketaddress.h>` belonged to the UNIX-specific
    GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
    when using it. This is no longer necessary since GLib 2.72.
*/
struct GUnixSocketAddress
{
  /** */
  GSocketAddress parentInstance;

  /** */
  GUnixSocketAddressPrivate* priv;
}

/** */
struct GUnixSocketAddressClass
{
  /** */
  GSocketAddressClass parentClass;
}

/** */
struct GUnixSocketAddressPrivate;

/**
    Entry point for using GIO functionality.
*/
struct GVfs
{
  /** */
  GObject parentInstance;
}

/** */
struct GVfsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GVfs* vfs) isActive;

  /** */
  extern(C) GFile* function(GVfs* vfs, const(char)* path) getFileForPath;

  /** */
  extern(C) GFile* function(GVfs* vfs, const(char)* uri) getFileForUri;

  /** */
  extern(C) const(char*)* function(GVfs* vfs) getSupportedUriSchemes;

  /** */
  extern(C) GFile* function(GVfs* vfs, const(char)* parseName) parseName;

  /** */
  extern(C) void function(GVfs* vfs, const(char)* filename, ulong device, GFileAttributeMatcher* attributeMatcher, GFileInfo* info, GCancellable* cancellable, void** extraData, GDestroyNotify* freeExtraData) localFileAddInfo;

  /** */
  extern(C) void function(GVfs* vfs, GFileAttributeInfoList* list) addWritableNamespaces;

  /** */
  extern(C) gboolean function(GVfs* vfs, const(char)* filename, GFileInfo* info, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) localFileSetAttributes;

  /** */
  extern(C) void function(GVfs* vfs, const(char)* filename) localFileRemoved;

  /** */
  extern(C) void function(GVfs* vfs, const(char)* source, const(char)* dest) localFileMoved;

  /** */
  extern(C) GIcon* function(GVfs* vfs, GVariant* value) deserializeIcon;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;
}

/**
    The [gio.volume.Volume] interface represents user-visible objects that can be
    mounted. Note, when [porting from GnomeVFS](migrating-gnome-vfs.html),
    [gio.volume.Volume] is the moral equivalent of `GnomeVFSDrive`.
    
    Mounting a [gio.volume.Volume] instance is an asynchronous operation. For more
    information about asynchronous operations, see [gio.async_result.AsyncResult] and
    [gio.task.Task]. To mount a [gio.volume.Volume], first call [gio.volume.Volume.mount]
    with (at least) the [gio.volume.Volume] instance, optionally a
    [gio.mount_operation.MountOperation] object and a [gio.types.AsyncReadyCallback].
    
    Typically, one will only want to pass `NULL` for the
    [gio.mount_operation.MountOperation] if automounting all volumes when a desktop session
    starts since it’s not desirable to put up a lot of dialogs asking
    for credentials.
    
    The callback will be fired when the operation has resolved (either
    with success or failure), and a [gio.async_result.AsyncResult] instance will be
    passed to the callback.  That callback should then call
    [gio.volume.Volume.mountFinish] with the [gio.volume.Volume] instance and the
    [gio.async_result.AsyncResult] data to see if the operation was completed
    successfully.  If a [glib.error.ErrorWrap] is present when
    [gio.volume.Volume.mountFinish] is called, then it will be filled with any
    error information.
    
    ## Volume Identifiers
    
    It is sometimes necessary to directly access the underlying
    operating system object behind a volume (e.g. for passing a volume
    to an application via the command line). For this purpose, GIO
    allows to obtain an ‘identifier’ for the volume. There can be
    different kinds of identifiers, such as Hal UDIs, filesystem labels,
    traditional Unix devices (e.g. `/dev/sda2`), UUIDs. GIO uses predefined
    strings as names for the different kinds of identifiers:
    [gio.types.VOLUME_IDENTIFIER_KIND_UUID], [gio.types.VOLUME_IDENTIFIER_KIND_LABEL], etc.
    Use [gio.volume.Volume.getIdentifier] to obtain an identifier for a volume.
    
    Note that [gio.types.VOLUME_IDENTIFIER_KIND_HAL_UDI] will only be available
    when the GVFS hal volume monitor is in use. Other volume monitors
    will generally be able to provide the [gio.types.VOLUME_IDENTIFIER_KIND_UNIX_DEVICE]
    identifier, which can be used to obtain a hal device by means of
    `libhal_manager_find_device_string_match()`.
*/
struct GVolume;

/**
    Interface for implementing operations for mountable volumes.
*/
struct GVolumeIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /**
      Changed signal that is emitted when the volume's state has changed.
  */
  extern(C) void function(GVolume* volume) changed;

  /**
      The removed signal that is emitted when the #GVolume have been removed. If the recipient is holding references to the object they should release them so the object can be finalized.
  */
  extern(C) void function(GVolume* volume) removed;

  /**
      Gets a string containing the name of the #GVolume.
  */
  extern(C) char* function(GVolume* volume) getName;

  /**
      Gets a #GIcon for the #GVolume.
  */
  extern(C) GIcon* function(GVolume* volume) getIcon;

  /**
      Gets the UUID for the #GVolume. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque string. Returns null if there is no UUID available.
  */
  extern(C) char* function(GVolume* volume) getUuid;

  /**
      Gets a #GDrive the volume is located on. Returns null if the #GVolume is not associated with a #GDrive.
  */
  extern(C) GDrive* function(GVolume* volume) getDrive;

  /**
      Gets a #GMount representing the mounted volume. Returns null if the #GVolume is not mounted.
  */
  extern(C) GMount* function(GVolume* volume) getMount;

  /**
      Returns true if the #GVolume can be mounted.
  */
  extern(C) gboolean function(GVolume* volume) canMount;

  /**
      Checks if a #GVolume can be ejected.
  */
  extern(C) gboolean function(GVolume* volume) canEject;

  /**
      Mounts a given #GVolume.
          #GVolume implementations must emit the #GMountOperation::aborted
          signal before completing a mount operation that is aborted while
          awaiting input from the user through a #GMountOperation instance.
  */
  extern(C) void function(GVolume* volume, GMountMountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) mountFn;

  /**
      Finishes a mount operation.
  */
  extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) mountFinish;

  /**
      Ejects a given #GVolume.
  */
  extern(C) void function(GVolume* volume, GMountUnmountFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) eject;

  /**
      Finishes an eject operation.
  */
  extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) ejectFinish;

  /**
      Returns the [identifier](#volume-identifiers) of the given kind, or null if
         the #GVolume doesn't have one.
  */
  extern(C) char* function(GVolume* volume, const(char)* kind) getIdentifier;

  /**
      Returns an array strings listing the kinds
         of [identifiers](#volume-identifiers) which the #GVolume has.
  */
  extern(C) char** function(GVolume* volume) enumerateIdentifiers;

  /**
      Returns true if the #GVolume should be automatically mounted.
  */
  extern(C) gboolean function(GVolume* volume) shouldAutomount;

  /**
      Returns the activation root for the #GVolume if it is known in advance or null if
        it is not known.
  */
  extern(C) GFile* function(GVolume* volume) getActivationRoot;

  /**
      Starts ejecting a #GVolume using a #GMountOperation. Since 2.22.
  */
  extern(C) void function(GVolume* volume, GMountUnmountFlags flags, GMountOperation* mountOperation, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ejectWithOperation;

  /**
      Finishes an eject operation using a #GMountOperation. Since 2.22.
  */
  extern(C) gboolean function(GVolume* volume, GAsyncResult* result, GError** _err) ejectWithOperationFinish;

  /**
      Gets a key used for sorting #GVolume instance or null if no such key exists. Since 2.32.
  */
  extern(C) const(char)* function(GVolume* volume) getSortKey;

  /**
      Gets a symbolic #GIcon for the #GVolume. Since 2.34.
  */
  extern(C) GIcon* function(GVolume* volume) getSymbolicIcon;
}

/**
    [gio.volume_monitor.VolumeMonitor] is for listing the user interesting devices and volumes
    on the computer. In other words, what a file selector or file manager
    would show in a sidebar.
    
    [gio.volume_monitor.VolumeMonitor] is not
    thread-default-context aware (see
    [glib.main_context.MainContext.pushThreadDefault]), and so should not be used
    other than from the main thread, with no thread-default-context active.
    
    In order to receive updates about volumes and mounts monitored through GVFS,
    a main loop must be running.
*/
struct GVolumeMonitor
{
  /** */
  GObject parentInstance;

  /** */
  void* priv;
}

/** */
struct GVolumeMonitorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GVolume* volume) volumeAdded;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GVolume* volume) volumeRemoved;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GVolume* volume) volumeChanged;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GMount* mount) mountAdded;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GMount* mount) mountRemoved;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GMount* mount) mountPreUnmount;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GMount* mount) mountChanged;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GDrive* drive) driveConnected;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GDrive* drive) driveDisconnected;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GDrive* drive) driveChanged;

  /** */
  extern(C) gboolean function() isSupported;

  /** */
  extern(C) GList* function(GVolumeMonitor* volumeMonitor) getConnectedDrives;

  /** */
  extern(C) GList* function(GVolumeMonitor* volumeMonitor) getVolumes;

  /** */
  extern(C) GList* function(GVolumeMonitor* volumeMonitor) getMounts;

  /** */
  extern(C) GVolume* function(GVolumeMonitor* volumeMonitor, const(char)* uuid) getVolumeForUuid;

  /** */
  extern(C) GMount* function(GVolumeMonitor* volumeMonitor, const(char)* uuid) getMountForUuid;

  /** */
  extern(C) GVolume* function(GMount* mount, GVolumeMonitor* volumeMonitor) adoptOrphanMount;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GDrive* drive) driveEjectButton;

  /** */
  extern(C) void function(GVolumeMonitor* volumeMonitor, GDrive* drive) driveStopButton;

  /** */
  extern(C) void function() GReserved1;

  /** */
  extern(C) void function() GReserved2;

  /** */
  extern(C) void function() GReserved3;

  /** */
  extern(C) void function() GReserved4;

  /** */
  extern(C) void function() GReserved5;

  /** */
  extern(C) void function() GReserved6;
}

/**
    [gio.zlib_compressor.ZlibCompressor] is an implementation of [gio.converter.Converter] that
    compresses data using zlib.
*/
struct GZlibCompressor;

/** */
struct GZlibCompressorClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gio.zlib_decompressor.ZlibDecompressor] is an implementation of [gio.converter.Converter] that
    decompresses data compressed with zlib.
*/
struct GZlibDecompressor;

/** */
struct GZlibDecompressorClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) void function(GObject* sourceObject, GAsyncResult* res, void* data) GAsyncReadyCallback;

alias extern(C) void function(GDBusConnection* connection, const(char)* name, void* userData) GBusAcquiredCallback;

alias extern(C) void function(GDBusConnection* connection, const(char)* name, void* userData) GBusNameAcquiredCallback;

alias extern(C) void function(GDBusConnection* connection, const(char)* name, const(char)* nameOwner, void* userData) GBusNameAppearedCallback;

alias extern(C) void function(GDBusConnection* connection, const(char)* name, void* userData) GBusNameLostCallback;

alias extern(C) void function(GDBusConnection* connection, const(char)* name, void* userData) GBusNameVanishedCallback;

alias extern(C) gboolean function(GCancellable* cancellable, void* data) GCancellableSourceFunc;

alias extern(C) GVariant* function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, const(char)* interfaceName, const(char)* propertyName, GError** error, void* userData) GDBusInterfaceGetPropertyFunc;

alias extern(C) void function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, const(char)* interfaceName, const(char)* methodName, GVariant* parameters, GDBusMethodInvocation* invocation, void* userData) GDBusInterfaceMethodCallFunc;

alias extern(C) gboolean function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, const(char)* interfaceName, const(char)* propertyName, GVariant* value, GError** error, void* userData) GDBusInterfaceSetPropertyFunc;

alias extern(C) GDBusMessage* function(GDBusConnection* connection, GDBusMessage* message, gboolean incoming, void* userData) GDBusMessageFilterFunction;

alias extern(C) GType function(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data) GDBusProxyTypeFunc;

alias extern(C) void function(GDBusConnection* connection, const(char)* senderName, const(char)* objectPath, const(char)* interfaceName, const(char)* signalName, GVariant* parameters, void* userData) GDBusSignalCallback;

alias extern(C) const(GDBusInterfaceVTable)* function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, const(char)* interfaceName, const(char)* node, void** outUserData, void* userData) GDBusSubtreeDispatchFunc;

alias extern(C) char** function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, void* userData) GDBusSubtreeEnumerateFunc;

alias extern(C) GDBusInterfaceInfo** function(GDBusConnection* connection, const(char)* sender, const(char)* objectPath, const(char)* node, void* userData) GDBusSubtreeIntrospectFunc;

alias extern(C) gboolean function(GDatagramBased* datagramBased, GIOCondition condition, void* data) GDatagramBasedSourceFunc;

alias extern(C) void function(GDesktopAppInfo* appinfo, GPid pid, void* userData) GDesktopAppLaunchCallback;

alias extern(C) void function(gboolean reporting, ulong currentSize, ulong numDirs, ulong numFiles, void* data) GFileMeasureProgressCallback;

alias extern(C) void function(long currentNumBytes, long totalNumBytes, void* data) GFileProgressCallback;

alias extern(C) gboolean function(const(char)* fileContents, long fileSize, void* callbackData) GFileReadMoreCallback;

alias extern(C) gboolean function(GIOSchedulerJob* job, GCancellable* cancellable, void* data) GIOSchedulerJobFunc;

alias extern(C) gboolean function(GObject* pollableStream, void* data) GPollableSourceFunc;

alias extern(C) void* function(void* data, size_t size) GReallocFunc;

alias extern(C) gboolean function(GValue* value, GVariant* variant, void* userData) GSettingsBindGetMapping;

alias extern(C) GVariant* function(const(GValue)* value, const(GVariantType)* expectedType, void* userData) GSettingsBindSetMapping;

alias extern(C) gboolean function(GVariant* value, void** result, void* userData) GSettingsGetMapping;

alias extern(C) void function(GSimpleAsyncResult* res, GObject* object, GCancellable* cancellable) GSimpleAsyncThreadFunc;

alias extern(C) gboolean function(GSocket* socket, GIOCondition condition, void* data) GSocketSourceFunc;

alias extern(C) void function(GTask* task, GObject* sourceObject, void* taskData, GCancellable* cancellable) GTaskThreadFunc;

alias extern(C) GFile* function(GVfs* vfs, const(char)* identifier, void* userData) GVfsFileLookupFunc;

