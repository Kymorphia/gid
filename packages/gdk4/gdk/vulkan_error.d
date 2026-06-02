/// Module for [VulkanError] enum namespace
module gdk.vulkan_error;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [VulkanError] enum
struct VulkanError
{
  alias Enum = gdk.types.VulkanError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gdk_vulkan_error_quark();
    return _retval;
  }
}

class VulkanException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gdk.vulkan_error.VulkanError.quark, cast(int)code, msg);
  }

  alias Code = gdk.types.VulkanError;
}
