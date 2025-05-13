/// Module for [Inhibitor] class
module panel.inhibitor;

import gid.gid;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class Inhibitor : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_inhibitor_get_type != &gidSymbolNotFound ? panel_inhibitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Inhibitor self()
  {
    return this;
  }

  /** */
  void uninhibit()
  {
    panel_inhibitor_uninhibit(cast(PanelInhibitor*)this._cPtr);
  }
}
