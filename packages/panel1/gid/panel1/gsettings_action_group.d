/// Module for [GSettingsActionGroup] class
module gid.panel1.gsettings_action_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.settings;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/** */
class GSettingsActionGroup : gid.gobject2.object.ObjectWrap, gid.gio2.action_group.ActionGroup
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_gsettings_action_group_get_type != &gidSymbolNotFound ? panel_gsettings_action_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelGSettingsActionGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override GSettingsActionGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.gsettings_action_group.GSettingsActionGroup]
      Returns: New builder object
  */
  static GSettingsActionGroupGidBuilder builder() nothrow
  {
    return new GSettingsActionGroupGidBuilder;
  }

  /** */
  @property gid.gio2.settings.Settings settings() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.settings.Settings)("settings");
  }

  mixin ActionGroupT!();

  /**
      Creates a new #GActionGroup that exports settings.
  
      Params:
        settings = a #GSettings
      Returns: an #PanelGSettingsActionGroup
  */
  static gid.gio2.action_group.ActionGroup new_(gid.gio2.settings.Settings settings) nothrow
  {
    GActionGroup* _cretval;
    _cretval = panel_gsettings_action_group_new(settings ? cast(GSettings*)settings._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action_group.ActionGroup)(cast(GActionGroup*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.panel1.gsettings_action_group.GSettingsActionGroup]
class GSettingsActionGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();

  /** */
  T settings(gid.gio2.settings.Settings propval) nothrow
  {
    return setProperty("settings", propval);
  }
}

/// Fluent builder for [gid.panel1.gsettings_action_group.GSettingsActionGroup]
final class GSettingsActionGroupGidBuilder : GSettingsActionGroupGidBuilderImpl!GSettingsActionGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GSettingsActionGroup build() nothrow
  {
    return new GSettingsActionGroup(cast(void*)createGObject(GSettingsActionGroup._getGType), Yes.Take);
  }
}
