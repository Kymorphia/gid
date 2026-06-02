/// Module for [PluginError] enum namespace
module gst.plugin_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [PluginError] enum
struct PluginError
{
  alias Enum = gst.types.PluginError; ///

  /**
      Get the error quark.
      Returns: The error quark used in GError messages
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_plugin_error_quark();
    return _retval;
  }
}

class PluginException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.plugin_error.PluginError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.PluginError;
}
