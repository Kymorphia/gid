/// Module for [ToolShellIfaceProxy] interface proxy object
module gid.gtk3.tool_shell_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.tool_shell;
import gid.gtk3.tool_shell_mixin;

/// Proxy object for [gid.gtk3.tool_shell.ToolShell] interface when a GObject has no applicable D binding
class ToolShellIfaceProxy : IfaceProxy, gid.gtk3.tool_shell.ToolShell
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.tool_shell.ToolShell);
  }

  mixin ToolShellT!();
}
