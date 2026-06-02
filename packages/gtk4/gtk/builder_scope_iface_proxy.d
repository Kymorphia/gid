/// Module for [BuilderScopeIfaceProxy] interface proxy object
module gtk.builder_scope_iface_proxy;

import gobject.object;
import gtk.builder_scope;
import gtk.builder_scope_mixin;

/// Proxy object for [gtk.builder_scope.BuilderScope] interface when a GObject has no applicable D binding
class BuilderScopeIfaceProxy : IfaceProxy, gtk.builder_scope.BuilderScope
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.builder_scope.BuilderScope);
  }

  mixin BuilderScopeT!();
}
