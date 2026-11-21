/// Module for [BuilderScopeIfaceProxy] interface proxy object
module gid.gtk4.builder_scope_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.builder_scope;
import gid.gtk4.builder_scope_mixin;

/// Proxy object for [gid.gtk4.builder_scope.BuilderScope] interface when a GObject has no applicable D binding
class BuilderScopeIfaceProxy : IfaceProxy, gid.gtk4.builder_scope.BuilderScope
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.builder_scope.BuilderScope);
  }

  mixin BuilderScopeT!();
}
