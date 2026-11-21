/// Module for [TagXmpWriterIfaceProxy] interface proxy object
module gid.gsttag1.tag_xmp_writer_iface_proxy;

import gid.gobject2.object;
import gid.gsttag1.tag_xmp_writer;
import gid.gsttag1.tag_xmp_writer_mixin;

/// Proxy object for [gid.gsttag1.tag_xmp_writer.TagXmpWriter] interface when a GObject has no applicable D binding
class TagXmpWriterIfaceProxy : IfaceProxy, gid.gsttag1.tag_xmp_writer.TagXmpWriter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gsttag1.tag_xmp_writer.TagXmpWriter);
  }

  mixin TagXmpWriterT!();
}
