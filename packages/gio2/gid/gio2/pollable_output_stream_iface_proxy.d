/// Module for [PollableOutputStreamIfaceProxy] interface proxy object
module gid.gio2.pollable_output_stream_iface_proxy;

import gid.gobject2.object;
import gid.gio2.pollable_output_stream;
import gid.gio2.pollable_output_stream_mixin;

/// Proxy object for [gid.gio2.pollable_output_stream.PollableOutputStream] interface when a GObject has no applicable D binding
class PollableOutputStreamIfaceProxy : IfaceProxy, gid.gio2.pollable_output_stream.PollableOutputStream
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.pollable_output_stream.PollableOutputStream);
  }

  mixin PollableOutputStreamT!();
}
