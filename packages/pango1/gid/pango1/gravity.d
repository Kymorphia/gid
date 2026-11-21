/// Module for [Gravity] enum namespace
module gid.pango1.gravity;

import gid.core.gid;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.matrix;
import gid.pango1.types;

/// Namespace for [Gravity] enum
struct Gravity
{
  alias Enum = gid.pango1.types.Gravity; ///

  /**
      Finds the gravity that best matches the rotation component
      in a [gid.pango1.matrix.Matrix].
  
      Params:
        matrix = a [gid.pango1.matrix.Matrix]
      Returns: the gravity of matrix, which will never be
        [gid.pango1.types.Gravity.Auto], or [gid.pango1.types.Gravity.South] if matrix is null
  */
  static gid.pango1.types.Gravity getForMatrix(gid.pango1.matrix.Matrix* matrix) nothrow
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_matrix(cast(const(PangoMatrix)*)matrix);
    gid.pango1.types.Gravity _retval = cast(gid.pango1.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Returns the gravity to use in laying out a [gid.pango1.item.Item].
      
      The gravity is determined based on the script, base gravity, and hint.
      
      If base_gravity is [gid.pango1.types.Gravity.Auto], it is first replaced with the
      preferred gravity of script.  To get the preferred gravity of a script,
      pass [gid.pango1.types.Gravity.Auto] and [gid.pango1.types.GravityHint.Strong] in.
  
      Params:
        script = [gid.pango1.types.Script] to query
        baseGravity = base gravity of the paragraph
        hint = orientation hint
      Returns: resolved gravity suitable to use for a run of text
        with script
  */
  static gid.pango1.types.Gravity getForScript(gid.pango1.types.Script script, gid.pango1.types.Gravity baseGravity, gid.pango1.types.GravityHint hint) nothrow
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_script(script, baseGravity, hint);
    gid.pango1.types.Gravity _retval = cast(gid.pango1.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Returns the gravity to use in laying out a single character
      or [gid.pango1.item.Item].
      
      The gravity is determined based on the script, East Asian width,
      base gravity, and hint,
      
      This function is similar to `funcPango.Gravity.get_for_script` except
      that this function makes a distinction between narrow/half-width and
      wide/full-width characters also. Wide/full-width characters always
      stand *upright*, that is, they always take the base gravity,
      whereas narrow/full-width characters are always rotated in vertical
      context.
      
      If base_gravity is [gid.pango1.types.Gravity.Auto], it is first replaced with the
      preferred gravity of script.
  
      Params:
        script = [gid.pango1.types.Script] to query
        wide = true for wide characters as returned by [gid.glib2.global.unicharIswide]
        baseGravity = base gravity of the paragraph
        hint = orientation hint
      Returns: resolved gravity suitable to use for a run of text
        with script and wide.
  */
  static gid.pango1.types.Gravity getForScriptAndWidth(gid.pango1.types.Script script, bool wide, gid.pango1.types.Gravity baseGravity, gid.pango1.types.GravityHint hint) nothrow
  {
    PangoGravity _cretval;
    _cretval = pango_gravity_get_for_script_and_width(script, wide, baseGravity, hint);
    gid.pango1.types.Gravity _retval = cast(gid.pango1.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Converts a [gid.pango1.types.Gravity] value to its natural rotation in radians.
      
      Note that [gid.pango1.matrix.Matrix.rotate] takes angle in degrees, not radians.
      So, to call [gid.pango1.matrix.Matrix] with the output of this function
      you should multiply it by (180. / G_PI).
  
      Params:
        gravity = gravity to query, should not be [gid.pango1.types.Gravity.Auto]
      Returns: the rotation value corresponding to gravity.
  */
  static double toRotation(gid.pango1.types.Gravity gravity) nothrow
  {
    double _retval;
    _retval = pango_gravity_to_rotation(gravity);
    return _retval;
  }
}
