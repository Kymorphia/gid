module Gio.MountIfaceProxy;

import GObject.ObjectG;
import Gio.Mount;
import Gio.MountT;

/// Proxy object for Gio.Mount interface when a GObject has no applicable D binding
class MountIfaceProxy : IfaceProxy, Mount
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Mount);
  }

  mixin MountT!();
}
