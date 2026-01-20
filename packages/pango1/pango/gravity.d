/// Module for [Gravity] enum namespace
module pango.gravity;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.matrix;
import pango.types;

/// Namespace for [Gravity] enum
struct Gravity
{
  alias Enum = pango.types.Gravity; ///

  /**
      Finds the gravity that best matches the rotation component
      in a [pango.matrix.Matrix].
  
      Params:
        matrix = a [pango.matrix.Matrix]
      Returns: the gravity of matrix, which will never be
        [pango.types.Gravity.Auto], or [pango.types.Gravity.South] if matrix is null
  */
  static pango.types.Gravity getForMatrix(pango.matrix.Matrix matrix)
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_matrix(cast(const(PangoMatrix)*)&matrix);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Returns the gravity to use in laying out a [pango.item.Item].
      
      The gravity is determined based on the script, base gravity, and hint.
      
      If base_gravity is [pango.types.Gravity.Auto], it is first replaced with the
      preferred gravity of script.  To get the preferred gravity of a script,
      pass [pango.types.Gravity.Auto] and [pango.types.GravityHint.Strong] in.
  
      Params:
        script = [pango.types.Script] to query
        baseGravity = base gravity of the paragraph
        hint = orientation hint
      Returns: resolved gravity suitable to use for a run of text
        with script
  */
  static pango.types.Gravity getForScript(pango.types.Script script, pango.types.Gravity baseGravity, pango.types.GravityHint hint)
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_script(script, baseGravity, hint);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Returns the gravity to use in laying out a single character
      or [pango.item.Item].
      
      The gravity is determined based on the script, East Asian width,
      base gravity, and hint,
      
      This function is similar to `funcPango.Gravity.get_for_script` except
      that this function makes a distinction between narrow/half-width and
      wide/full-width characters also. Wide/full-width characters always
      stand *upright*, that is, they always take the base gravity,
      whereas narrow/full-width characters are always rotated in vertical
      context.
      
      If base_gravity is [pango.types.Gravity.Auto], it is first replaced with the
      preferred gravity of script.
  
      Params:
        script = [pango.types.Script] to query
        wide = true for wide characters as returned by [glib.global.unicharIswide]
        baseGravity = base gravity of the paragraph
        hint = orientation hint
      Returns: resolved gravity suitable to use for a run of text
        with script and wide.
  */
  static pango.types.Gravity getForScriptAndWidth(pango.types.Script script, bool wide, pango.types.Gravity baseGravity, pango.types.GravityHint hint)
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_script_and_width(script, wide, baseGravity, hint);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Converts a [pango.types.Gravity] value to its natural rotation in radians.
      
      Note that [pango.matrix.Matrix.rotate] takes angle in degrees, not radians.
      So, to call [pango.matrix.Matrix] with the output of this function
      you should multiply it by (180. / G_PI).
  
      Params:
        gravity = gravity to query, should not be [pango.types.Gravity.Auto]
      Returns: the rotation value corresponding to gravity.
  */
  static double toRotation(pango.types.Gravity gravity)
  {
    double _retval;
    _retval = pango_gravity_to_rotation(gravity);
    return _retval;
  }
}
