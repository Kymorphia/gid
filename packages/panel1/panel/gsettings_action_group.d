/// Module for [GSettingsActionGroup] class
module panel.gsettings_action_group;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.settings;
import gobject.gid_builder;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class GSettingsActionGroup : gobject.object.ObjectWrap, gio.action_group.ActionGroup
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
    return cast(void function())panel_gsettings_action_group_get_type != &gidSymbolNotFound ? panel_gsettings_action_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GSettingsActionGroup self()
  {
    return this;
  }

  /**
  Get builder for [panel.gsettings_action_group.GSettingsActionGroup]
  Returns: New builder object
  */
  static GSettingsActionGroupGidBuilder builder()
  {
    return new GSettingsActionGroupGidBuilder;
  }

  /** */
  @property gio.settings.Settings settings()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.settings.Settings)("settings");
  }

  mixin ActionGroupT!();

  /**
      Creates a new #GActionGroup that exports settings.
  
      Params:
        settings = a #GSettings
      Returns: an #PanelGSettingsActionGroup
  */
  static gio.action_group.ActionGroup new_(gio.settings.Settings settings)
  {
    GActionGroup* _cretval;
    _cretval = panel_gsettings_action_group_new(settings ? cast(GSettings*)settings._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action_group.ActionGroup)(cast(GActionGroup*)_cretval, Yes.Take);
    return _retval;
  }
}

class GSettingsActionGroupGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.action_group.ActionGroupGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();

  /** */
  T settings(gio.settings.Settings propval)
  {
    return setProperty("settings", propval);
  }
}

/// Fluent builder for [panel.gsettings_action_group.GSettingsActionGroup]
final class GSettingsActionGroupGidBuilder : GSettingsActionGroupGidBuilderImpl!GSettingsActionGroupGidBuilder
{
  GSettingsActionGroup build()
  {
    return new GSettingsActionGroup(cast(void*)createGObject(GSettingsActionGroup._getGType), No.Take);
  }
}
