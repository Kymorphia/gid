/// Module for [VulkanError] enum namespace
module gid.gdk4.vulkan_error;

import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [VulkanError] enum
struct VulkanError
{
  alias Enum = gid.gdk4.types.VulkanError; ///

  /**
      Registers an error quark for [gid.gdk4.vulkan_context.VulkanContext] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gdk_vulkan_error_quark();
    return _retval;
  }
}

class VulkanException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gdk4.vulkan_error.VulkanError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdk4.types.VulkanError;
}
