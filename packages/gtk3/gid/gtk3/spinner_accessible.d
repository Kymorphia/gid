/// Module for [SpinnerAccessible] class
module gid.gtk3.spinner_accessible;

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
@gidGir("SpinnerAccessible", "SpinnerAccessibleClass")
class SpinnerAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.image.Image
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
    return cast(void function())gtk_spinner_accessible_get_type != &gidSymbolNotFound ? gtk_spinner_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSpinnerAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinnerAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.spinner_accessible.SpinnerAccessible]
      Returns: New builder object
  */
  static SpinnerAccessibleGidBuilder builder() nothrow
  {
    return new SpinnerAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gid.gtk3.spinner_accessible.SpinnerAccessible]
class SpinnerAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.spinner_accessible.SpinnerAccessible]
final class SpinnerAccessibleGidBuilder : SpinnerAccessibleGidBuilderImpl!SpinnerAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpinnerAccessible build() nothrow
  {
    return new SpinnerAccessible(cast(void*)createGObject(SpinnerAccessible._getGType), Yes.Take);
  }
}
