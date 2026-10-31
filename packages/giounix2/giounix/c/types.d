/// C types for giounix2 library
module giounix.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gio.c.types;

/**
    [giounix.desktop_app_info.DesktopAppInfo] is an implementation of [gio.app_info.AppInfo] based on
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

    Deprecated: The [giounix.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
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
       [giounix.desktop_app_info_lookup.DesktopAppInfoLookup.getDefaultForUriScheme].
  */
  extern(C) GAppInfo* function(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) getDefaultForUriScheme;
}

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
    [giounix.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
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
    [giounix.input_stream.InputStream] implements [gio.input_stream.InputStream] for reading from a UNIX
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
    Defines a Unix mount entry (e.g. `/media/cdrom`).
    This corresponds roughly to a mtab entry.
*/
struct GUnixMountEntry;

/**
    Watches for changes to the set of mount entries and mount points in the
    system.
    
    Connect to the [giounix.mount_monitor.MountMonitor.mountsChanged] signal to be
    notified of changes to the [giounix.mount_entry.MountEntry] list.
    
    Connect to the [giounix.mount_monitor.MountMonitor.mountpointsChanged] signal to
    be notified of changes to the [giounix.mount_point.MountPoint] list.
*/
struct GUnixMountMonitor;

/** */
struct GUnixMountMonitorClass;

/**
    Defines a Unix mount point (e.g. `/dev`).
    This corresponds roughly to a fstab entry.
*/
struct GUnixMountPoint;

/**
    [giounix.output_stream.OutputStream] implements [gio.output_stream.OutputStream] for writing to a UNIX
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

alias extern(C) void function(GDesktopAppInfo* appinfo, GPid pid, void* userData) GDesktopAppLaunchCallback;

