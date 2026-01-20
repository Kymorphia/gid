/// Module for [Requisition] struct
module gtk.requisition;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkRequisition-struct represents the desired size of a widget. See
    [GtkWidget’s geometry management section][geometry-management] for
    more information.
*/
struct Requisition
{
  /**
      the widget’s desired width
  */
  int width;

  /**
      the widget’s desired height
  */
  int height;

  /**
      Copies a #GtkRequisition.
      Returns: a copy of requisition
  */
  gtk.requisition.Requisition copy()
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_copy(cast(const(GtkRequisition)*)&this);
    gtk.requisition.Requisition _retval;
    if (_cretval)
      _retval = *cast(gtk.requisition.Requisition*)_cretval;
    return _retval;
  }
}
