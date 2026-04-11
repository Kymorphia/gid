/// Module for [FileDescriptorBased] interface
module gio.file_descriptor_based;

public import gio.file_descriptor_based_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;

/**
    [gio.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gio.input_stream.InputStream] or
    [gio.output_stream.OutputStream]) that are based on file descriptors.
    
    Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
interface FileDescriptorBased
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_file_descriptor_based_get_type != &gidSymbolNotFound ? g_file_descriptor_based_get_type() : cast(GType)0;
  }

  /**
      Gets the underlying file descriptor.
      Returns: The file descriptor
  */
  int getFd();
}

/// Fluent builder implementation template for [gio.file_descriptor_based.FileDescriptorBased]
interface FileDescriptorBasedGidBuilderImpl(T)
{
}
