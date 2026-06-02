/// Module for [LengthUnit] enum namespace
module adw.length_unit;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.settings;

/// Namespace for [LengthUnit] enum
struct LengthUnit
{
  alias Enum = adw.types.LengthUnit; ///

  /**
      Converts value from pixels to unit.
  
      Params:
        unit = a length unit
        value = a value in pixels
        settings = settings to use, or `NULL` for default settings
      Returns: the length in unit
  */
  static double fromPx(adw.types.LengthUnit unit, double value, gtk.settings.Settings settings) nothrow
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
  static double toPx(adw.types.LengthUnit unit, double value, gtk.settings.Settings settings) nothrow
  {
    double _retval;
    _retval = adw_length_unit_to_px(unit, value, settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null);
    return _retval;
  }
}
