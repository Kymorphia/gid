/// Module for [BindingArg] class
module gtk.binding_arg;

public import gid.basictypes;
import gid.gid;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkBindingArg holds the data associated with
    an argument for a key binding signal emission as
    stored in #GtkBindingSignal.
*/
class BindingArg
{
  GtkBindingArg _cInstance;

  /**
      Create a `binding_arg.BindingArg` wrap type.
      Params:
        argType = implementation detail
  */
  this(gobject.types.GType argType = gobject.types.GType.init) nothrow
  {
    this.argType = argType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkBindingArg*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `argType` field.
      Returns: implementation detail
  */
  @property gobject.types.GType argType() nothrow
  {
    return (cast(GtkBindingArg*)this._cPtr).argType;
  }

  /**
      Set `argType` field.
      Params:
        propval = implementation detail
  */
  @property void argType(gobject.types.GType propval) nothrow
  {
    (cast(GtkBindingArg*)this._cPtr).argType = propval;
  }
}
