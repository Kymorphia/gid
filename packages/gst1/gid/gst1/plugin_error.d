/// Module for [PluginError] enum namespace
module gid.gst1.plugin_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [PluginError] enum
struct PluginError
{
  alias Enum = gid.gst1.types.PluginError; ///

  /**
      Get the error quark.
      Returns: The error quark used in GError messages
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_plugin_error_quark();
    return _retval;
  }
}

class PluginException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.plugin_error.PluginError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.PluginError;
}
