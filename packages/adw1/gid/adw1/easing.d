/// Module for [Easing] enum namespace
module gid.adw1.easing;

import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;

/// Namespace for [Easing] enum
struct Easing
{
  alias Enum = gid.adw1.types.Easing; ///

  /**
      Computes easing with easing for value.
      
      value should generally be in the [0, 1] range.
  
      Params:
        self = an easing value
        value = a value to ease
      Returns: the easing for value
  */
  static double ease(gid.adw1.types.Easing self, double value) nothrow
  {
    double _retval;
    _retval = adw_easing_ease(self, value);
    return _retval;
  }
}
