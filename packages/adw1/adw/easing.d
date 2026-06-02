/// Module for [Easing] enum namespace
module adw.easing;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;

/// Namespace for [Easing] enum
struct Easing
{
  alias Enum = adw.types.Easing; ///

  /**
      Computes easing with easing for value.
      
      value should generally be in the [0, 1] range.
  
      Params:
        self = an easing value
        value = a value to ease
      Returns: the easing for value
  */
  static double ease(adw.types.Easing self, double value) nothrow
  {
    double _retval;
    _retval = adw_easing_ease(self, value);
    return _retval;
  }
}
