/// Module for [BindingArg] class
module gid.gtk3.binding_arg;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.types;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    A #GtkBindingArg holds the data associated with
    an argument for a key binding signal emission as
    stored in #GtkBindingSignal.
*/
class BindingArg : StructWrap!(GtkBindingArg)
{
  /**
      Create a `binding_arg.BindingArg` wrap type.
      Params:
        argType = implementation detail
  */
  this(gid.gobject2.types.GType argType = gid.gobject2.types.GType.init) nothrow
  {
    this.argType = argType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `argType` field.
      Returns: implementation detail
  */
  @property gid.gobject2.types.GType argType() nothrow
  {
    return (cast(GtkBindingArg*)this._cPtr).argType;
  }

  /**
      Set `argType` field.
      Params:
        propval = implementation detail
  */
  @property void argType(gid.gobject2.types.GType propval) nothrow
  {
    (cast(GtkBindingArg*)this._cPtr).argType = propval;
  }
}
