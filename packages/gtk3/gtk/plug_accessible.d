/// Module for [PlugAccessible] class
module gtk.plug_accessible;

import atk.component;
import atk.component_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window_accessible;

/** */
class PlugAccessible : gtk.window_accessible.WindowAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_plug_accessible_get_type != &gidSymbolNotFound ? gtk_plug_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PlugAccessible self()
  {
    return this;
  }

  /** */
  string getId()
  {
    char* _cretval;
    _cretval = gtk_plug_accessible_get_id(cast(GtkPlugAccessible*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
