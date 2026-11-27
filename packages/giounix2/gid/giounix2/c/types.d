/// C types for giounix2 library
module gid.giounix2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gio2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "GioUnix";

/// GIR namespace version of the binding
enum string _gidGirVersion = "2.0";

/// C headers of the binding library (included by the C headers of D libraries using its types)
enum string[] _gidGirCIncludes = ["gio/gdesktopappinfo.h", "gio/gfiledescriptorbased.h", "gio/gio.h", "gio/gunixfdmessage.h", "gio/gunixinputstream.h", "gio/gunixmounts.h", "gio/gunixoutputstream.h"];

/**
    [gid.giounix2.desktop_app_info.DesktopAppInfo] is an implementation of [gid.gio2.app_info.AppInfo] based on
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

    Deprecated: The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
        deprecated and unused by GIO.
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
       [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup.getDefaultForUriScheme].
  */
  extern(C) GAppInfo* function(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) getDefaultForUriScheme;
}

/**
    This [gid.gio2.socket_control_message.SocketControlMessage] contains a [gid.gio2.unix_fdlist.UnixFDList].
    It may be sent using [gid.gio2.socket.Socket.sendMessage] and received using
    [gid.gio2.socket.Socket.receiveMessage] over UNIX sockets (ie: sockets in the
    [gid.gio2.types.SocketFamily.Unix] family). The file descriptors are copied
    between processes by the kernel.
    
    For an easier way to send and receive file descriptors over
    stream-oriented UNIX sockets, see [gid.gio2.unix_connection.UnixConnection.sendFd] and
    [gid.gio2.unix_connection.UnixConnection.receiveFd].
    
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
@gidGir("FDMessagePrivate")
struct GUnixFDMessagePrivate;

/**
    [gid.giounix2.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gid.gio2.input_stream.InputStream] or
    [gid.gio2.output_stream.OutputStream]) that are based on file descriptors.
    
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
    [gid.giounix2.input_stream.InputStream] implements [gid.gio2.input_stream.InputStream] for reading from a UNIX
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
@gidGir("InputStreamPrivate")
struct GUnixInputStreamPrivate;

/**
    Defines a Unix mount entry (e.g. `/media/cdrom`).
    This corresponds roughly to a mtab entry.
*/
struct GUnixMountEntry;

/**
    Watches for changes to the set of mount entries and mount points in the
    system.
    
    Connect to the [gid.giounix2.mount_monitor.MountMonitor.mountsChanged] signal to be
    notified of changes to the [gid.giounix2.mount_entry.MountEntry] list.
    
    Connect to the [gid.giounix2.mount_monitor.MountMonitor.mountpointsChanged] signal to
    be notified of changes to the [gid.giounix2.mount_point.MountPoint] list.
*/
struct GUnixMountMonitor;

/** */
@gidGir("MountMonitorClass")
struct GUnixMountMonitorClass;

/**
    Defines a Unix mount point (e.g. `/dev`).
    This corresponds roughly to a fstab entry.
*/
struct GUnixMountPoint;

/**
    [gid.giounix2.output_stream.OutputStream] implements [gid.gio2.output_stream.OutputStream] for writing to a UNIX
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
@gidGir("OutputStreamPrivate")
struct GUnixOutputStreamPrivate;

alias extern(C) void function(GDesktopAppInfo* appinfo, GPid pid, void* userData) GDesktopAppLaunchCallback;

