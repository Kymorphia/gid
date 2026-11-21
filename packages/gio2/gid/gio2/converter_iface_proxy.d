/// Module for [ConverterIfaceProxy] interface proxy object
module gid.gio2.converter_iface_proxy;

import gid.gobject2.object;
import gid.gio2.converter;
import gid.gio2.converter_mixin;

/// Proxy object for [gid.gio2.converter.Converter] interface when a GObject has no applicable D binding
class ConverterIfaceProxy : IfaceProxy, gid.gio2.converter.Converter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.converter.Converter);
  }

  mixin ConverterT!();
}
