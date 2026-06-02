/// Module for [TagXmpWriterIfaceProxy] interface proxy object
module gsttag.tag_xmp_writer_iface_proxy;

import gobject.object;
import gsttag.tag_xmp_writer;
import gsttag.tag_xmp_writer_mixin;

/// Proxy object for [gsttag.tag_xmp_writer.TagXmpWriter] interface when a GObject has no applicable D binding
class TagXmpWriterIfaceProxy : IfaceProxy, gsttag.tag_xmp_writer.TagXmpWriter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gsttag.tag_xmp_writer.TagXmpWriter);
  }

  mixin TagXmpWriterT!();
}
