/// Module for [ArrowAccessible] class
module gid.gtk3.arrow_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
class ArrowAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.image.Image
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_arrow_accessible_get_type != &gidSymbolNotFound ? gtk_arrow_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkArrowAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrowAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.arrow_accessible.ArrowAccessible]
      Returns: New builder object
  */
  static ArrowAccessibleGidBuilder builder() nothrow
  {
    return new ArrowAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gid.gtk3.arrow_accessible.ArrowAccessible]
class ArrowAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.arrow_accessible.ArrowAccessible]
final class ArrowAccessibleGidBuilder : ArrowAccessibleGidBuilderImpl!ArrowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ArrowAccessible build() nothrow
  {
    return new ArrowAccessible(cast(void*)createGObject(ArrowAccessible._getGType), Yes.Take);
  }
}
