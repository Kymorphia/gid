/// Module for [BindingArg] class
module gtk.binding_arg;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.binding_arg.BindingArg");

    _cInstance = *cast(GtkBindingArg*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `argType` field.
      Returns: implementation detail
  */
  @property gobject.types.GType argType()
  {
    return (cast(GtkBindingArg*)this._cPtr).argType;
  }

  /**
      Set `argType` field.
      Params:
        propval = implementation detail
  */
  @property void argType(gobject.types.GType propval)
  {
    (cast(GtkBindingArg*)this._cPtr).argType = propval;
  }
}
