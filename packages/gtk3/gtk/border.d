/// Module for [Border] struct
module gtk.border;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_border_get_type != &gidSymbolNotFound ? gtk_border_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      Copies a #GtkBorder-struct.
      Returns: a copy of border_.
  */
  gtk.border.Border copy()
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_copy(cast(const(GtkBorder)*)&this);
    gtk.border.Border _retval;
    if (_cretval)
      _retval = *cast(gtk.border.Border*)_cretval;
    return _retval;
  }
}
