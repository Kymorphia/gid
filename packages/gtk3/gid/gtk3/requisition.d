/// Module for [Requisition] struct
module gid.gtk3.requisition;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

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

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_requisition_get_type != &gidSymbolNotFound ? gtk_requisition_get_type() : cast(GType)0;
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
      Copies a #GtkRequisition.
      Returns: a copy of requisition
  */
  gid.gtk3.requisition.Requisition copy() nothrow
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_copy(cast(const(GtkRequisition)*)&this);
    gid.gtk3.requisition.Requisition _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gtk3.requisition.Requisition*)_cretval;
      cValueFree!(gid.gtk3.requisition.Requisition)(_cretval);
    }
    return _retval;
  }
}
