/// Module for [LengthUnit] enum namespace
module gid.adw1.length_unit;

import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gtk4.settings;

/// Namespace for [LengthUnit] enum
struct LengthUnit
{
  alias Enum = gid.adw1.types.LengthUnit; ///

  /**
      Converts value from pixels to unit.
  
      Params:
        unit = a length unit
        value = a value in pixels
        settings = settings to use, or `NULL` for default settings
      Returns: the length in unit
  */
  static double fromPx(gid.adw1.types.LengthUnit unit, double value, gid.gtk4.settings.Settings settings) nothrow
  {
    double _retval;
    _retval = adw_length_unit_from_px(unit, value, settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts value from unit to pixels.
  
      Params:
        unit = a length unit
        value = a value in unit
        settings = settings to use, or `NULL` for default settings
      Returns: the length in pixels
  */
  static double toPx(gid.adw1.types.LengthUnit unit, double value, gid.gtk4.settings.Settings settings) nothrow
  {
    double _retval;
    _retval = adw_length_unit_to_px(unit, value, settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null);
    return _retval;
  }
}
