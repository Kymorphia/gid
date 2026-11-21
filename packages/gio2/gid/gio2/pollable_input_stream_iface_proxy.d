/// Module for [PollableInputStreamIfaceProxy] interface proxy object
module gid.gio2.pollable_input_stream_iface_proxy;

import gid.gobject2.object;
import gid.gio2.pollable_input_stream;
import gid.gio2.pollable_input_stream_mixin;

/// Proxy object for [gid.gio2.pollable_input_stream.PollableInputStream] interface when a GObject has no applicable D binding
class PollableInputStreamIfaceProxy : IfaceProxy, gid.gio2.pollable_input_stream.PollableInputStream
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.pollable_input_stream.PollableInputStream);
  }

  mixin PollableInputStreamT!();
}
