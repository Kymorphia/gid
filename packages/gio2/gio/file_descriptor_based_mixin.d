/// Module for [FileDescriptorBased] interface mixin
module gio.file_descriptor_based_mixin;

public import gio.file_descriptor_based_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import gobject.gid_builder;

/**
    [gio.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gio.input_stream.InputStream] or
    [gio.output_stream.OutputStream]) that are based on file descriptors.
    
    Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
template FileDescriptorBasedT()
{

  /**
      Gets the underlying file descriptor.
      Returns: The file descriptor
  */
  override int getFd()
  {
    int _retval;
    _retval = g_file_descriptor_based_get_fd(cast(GFileDescriptorBased*)this._cPtr);
    return _retval;
  }
}

template FileDescriptorBasedGidBuilderT()
{
}
