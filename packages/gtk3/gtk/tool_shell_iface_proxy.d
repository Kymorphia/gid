/// Module for [ToolShellIfaceProxy] interface proxy object
module gtk.tool_shell_iface_proxy;

import gobject.object;
import gtk.tool_shell;
import gtk.tool_shell_mixin;

/// Proxy object for [gtk.tool_shell.ToolShell] interface when a GObject has no applicable D binding
class ToolShellIfaceProxy : IfaceProxy, gtk.tool_shell.ToolShell
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.tool_shell.ToolShell);
  }

  mixin ToolShellT!();
}
