/// Module for [Border] struct
module gid.gtk3.border;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    A struct that specifies a border around a rectangular area
    that can be of different width on each side.
*/
struct Border
{
  /**
      The width of the left border
  */
  short left;

  /**
      The width of the right border
  */
  short right;

  /**
      The width of the top border
  */
  short top;

  /**
      The width of the bottom border
  */
  short bottom;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_border_get_type != &gidSymbolNotFound ? gtk_border_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Copies a #GtkBorder-struct.
      Returns: a copy of border_.
  */
  gid.gtk3.border.Border copy() nothrow
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_copy(cast(const(GtkBorder)*)&this);
    gid.gtk3.border.Border _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gtk3.border.Border*)_cretval;
      cValueFree!(gid.gtk3.border.Border)(_cretval);
    }
    return _retval;
  }
}
