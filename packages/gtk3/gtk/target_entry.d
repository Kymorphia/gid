/// Module for [TargetEntry] class
module gtk.target_entry;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkTargetEntry represents a single type of
    data than can be supplied for by a widget for a selection
    or for supplied or received during drag-and-drop.
*/
class TargetEntry : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_target_entry_get_type != &gidSymbolNotFound ? gtk_target_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TargetEntry self()
  {
    return this;
  }

  /**
      Get `target` field.
      Returns: a string representation of the target type
  */
  @property string target()
  {
    return cToD!(string)(cast(void*)(cast(GtkTargetEntry*)this._cPtr).target);
  }

  /**
      Set `target` field.
      Params:
        propval = a string representation of the target type
  */
  @property void target(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkTargetEntry*)this._cPtr).target);
    dToC(propval, cast(void*)&(cast(GtkTargetEntry*)this._cPtr).target);
  }

  /**
      Get `flags` field.
      Returns: #GtkTargetFlags for DND
  */
  @property uint flags()
  {
    return (cast(GtkTargetEntry*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GtkTargetFlags for DND
  */
  @property void flags(uint propval)
  {
    (cast(GtkTargetEntry*)this._cPtr).flags = propval;
  }

  /**
      Get `info` field.
      Returns: an application-assigned integer ID which will
            get passed as a parameter to e.g the #GtkWidget::selection-get
            signal. It allows the application to identify the target
            type without extensive string compares.
  */
  @property uint info()
  {
    return (cast(GtkTargetEntry*)this._cPtr).info;
  }

  /**
      Set `info` field.
      Params:
        propval = an application-assigned integer ID which will
              get passed as a parameter to e.g the #GtkWidget::selection-get
              signal. It allows the application to identify the target
              type without extensive string compares.
  */
  @property void info(uint propval)
  {
    (cast(GtkTargetEntry*)this._cPtr).info = propval;
  }

  /**
      Makes a new #GtkTargetEntry.
  
      Params:
        target = String identifier for target
        flags = Set of flags, see #GtkTargetFlags
        info = an ID that will be passed back to the application
      Returns: a pointer to a new #GtkTargetEntry.
            Free with [gtk.target_entry.TargetEntry.free]
  */
  this(string target, uint flags, uint info)
  {
    GtkTargetEntry* _cretval;
    const(char)* _target = target.toCString(No.Alloc);
    _cretval = gtk_target_entry_new(_target, flags, info);
    this(_cretval, Yes.Take);
  }

  /**
      Makes a copy of a #GtkTargetEntry and its data.
      Returns: a pointer to a copy of data.
            Free with [gtk.target_entry.TargetEntry.free]
  */
  gtk.target_entry.TargetEntry copy()
  {
    GtkTargetEntry* _cretval;
    _cretval = gtk_target_entry_copy(cast(GtkTargetEntry*)this._cPtr);
    auto _retval = _cretval ? new gtk.target_entry.TargetEntry(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
