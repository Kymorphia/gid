/// Module for [FileDescriptorBased] interface
module gid.giounix2.file_descriptor_based;

public import gid.core.basictypes;
public import gid.giounix2.file_descriptor_based_iface_proxy;
import gid.core.utils;
import gid.giounix2.c.functions;
import gid.giounix2.c.types;
import gid.giounix2.types;
import gid.gobject2.gid_builder;

/**
    [gid.giounix2.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gid.gio2.input_stream.InputStream] or
    [gid.gio2.output_stream.OutputStream]) that are based on file descriptors.
    
    Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
interface FileDescriptorBased : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_file_descriptor_based_get_type != &gidSymbolNotFound ? g_file_descriptor_based_get_type() : cast(GType)0;
  }


  /**
      Gets the underlying file descriptor.
      Returns: The file descriptor
  */
  int getFd();
}

/// Fluent builder implementation template for [gid.giounix2.file_descriptor_based.FileDescriptorBased]
interface FileDescriptorBasedGidBuilderImpl(T)
{
}
