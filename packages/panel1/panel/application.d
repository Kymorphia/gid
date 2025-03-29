module panel.application;

import adw.application;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.types;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class Application : adw.application.Application
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_application_get_type != &gidSymbolNotFound ? panel_application_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Application self()
  {
    return this;
  }

  /** */
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    PanelApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = panel_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }
}
