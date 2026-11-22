/// Module for [FileDescriptorBased] interface mixin
module gid.giounix2.file_descriptor_based_mixin;

public import gid.core.basictypes;
public import gid.giounix2.file_descriptor_based_iface_proxy;
public import gid.core.utils;
public import gid.giounix2.c.functions;
public import gid.giounix2.c.types;
public import gid.giounix2.types;
public import gid.gobject2.gid_builder;

/**
    [gid.giounix2.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gid.gio2.input_stream.InputStream] or
    [gid.gio2.output_stream.OutputStream]) that are based on file descriptors.
    
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
  override int getFd() nothrow
  {
    int _retval;
    _retval = g_file_descriptor_based_get_fd(cast(GFileDescriptorBased*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.giounix2.file_descriptor_based.FileDescriptorBased]
template FileDescriptorBasedGidBuilderT()
{
}
