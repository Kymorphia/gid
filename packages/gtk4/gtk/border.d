/// Module for [Border] struct
module gtk.border;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A struct that specifies a border around a rectangular area.
    
    Each side can have different width.
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

  /**
      Copies a [gtk.border.Border].
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
