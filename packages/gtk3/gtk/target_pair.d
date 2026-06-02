/// Module for [TargetPair] class
module gtk.target_pair;

public import gid.basictypes;
import gdk.atom;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkTargetPair is used to represent the same
    information as a table of #GtkTargetEntry, but in
    an efficient form.
*/
class TargetPair
{
  GtkTargetPair _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkTargetPair*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `target` field.
      Returns: #GdkAtom representation of the target type
  */
  @property gdk.atom.Atom target() nothrow
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GtkTargetPair*)this._cPtr).target, No.Take);
  }

  /**
      Get `flags` field.
      Returns: #GtkTargetFlags for DND
  */
  @property uint flags() nothrow
  {
    return (cast(GtkTargetPair*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GtkTargetFlags for DND
  */
  @property void flags(uint propval) nothrow
  {
    (cast(GtkTargetPair*)this._cPtr).flags = propval;
  }

  /**
      Get `info` field.
      Returns: an application-assigned integer ID which will
            get passed as a parameter to e.g the #GtkWidget::selection-get
            signal. It allows the application to identify the target
            type without extensive string compares.
  */
  @property uint info() nothrow
  {
    return (cast(GtkTargetPair*)this._cPtr).info;
  }

  /**
      Set `info` field.
      Params:
        propval = an application-assigned integer ID which will
              get passed as a parameter to e.g the #GtkWidget::selection-get
              signal. It allows the application to identify the target
              type without extensive string compares.
  */
  @property void info(uint propval) nothrow
  {
    (cast(GtkTargetPair*)this._cPtr).info = propval;
  }
}
