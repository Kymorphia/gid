module panel.inhibitor;

import gid.gid;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class Inhibitor : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_inhibitor_get_type != &gidSymbolNotFound ? panel_inhibitor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Inhibitor self()
  {
    return this;
  }

  /** */
  void uninhibit()
  {
    panel_inhibitor_uninhibit(cast(PanelInhibitor*)cPtr);
  }
}
