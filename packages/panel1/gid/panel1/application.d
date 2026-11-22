/// Module for [Application] class
module gid.panel1.application;

public import gid.core.basictypes;
import gid.adw1.application;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/** */
class Application : gid.adw1.application.Application
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_application_get_type != &gidSymbolNotFound ? panel_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelApplication";
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /** */
  this(string applicationId, gid.gio2.types.ApplicationFlags flags) nothrow
  {
    PanelApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.panel1.application.Application]
class ApplicationGidBuilderImpl(T) : gid.adw1.application.ApplicationGidBuilderImpl!T
{

}

/// Fluent builder for [gid.panel1.application.Application]
final class ApplicationGidBuilder : ApplicationGidBuilderImpl!ApplicationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Application build() nothrow
  {
    return new Application(cast(void*)createGObject(Application._getGType), Yes.Take);
  }
}
