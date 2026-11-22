/// Module for [Border] struct
module gid.gtk4.border;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Specifies a border around a rectangular area.
    
    Each side can have a different width.
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
      Copies a [gid.gtk4.border.Border].
      Returns: a copy of border_.
  */
  gid.gtk4.border.Border copy() nothrow
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_copy(cast(const(GtkBorder)*)&this);
    gid.gtk4.border.Border _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gtk4.border.Border*)_cretval;
      cValueFree!(gid.gtk4.border.Border)(_cretval);
    }
    return _retval;
  }
}
