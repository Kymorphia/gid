/// Module for [ConverterIfaceProxy] interface proxy object
module gio.converter_iface_proxy;

import gobject.object;
import gio.converter;
import gio.converter_mixin;

/// Proxy object for [gio.converter.Converter] interface when a GObject has no applicable D binding
class ConverterIfaceProxy : IfaceProxy, gio.converter.Converter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.converter.Converter);
  }

  mixin ConverterT!();
}
