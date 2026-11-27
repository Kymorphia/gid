/// Module for [ButtonAccessible] class
module gid.gtk3.button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.atk1.object;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
@gidGir("ButtonAccessible", "ButtonAccessibleClass")
class ButtonAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.action.Action, gid.atk1.image.Image
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
    return cast(void function())gtk_button_accessible_get_type != &gidSymbolNotFound ? gtk_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.button_accessible.ButtonAccessible]
      Returns: New builder object
  */
  static ButtonAccessibleGidBuilder builder() nothrow
  {
    return new ButtonAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ImageT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.button_accessible.ButtonAccessible]
class ButtonAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.image.ImageGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.button_accessible.ButtonAccessible]
final class ButtonAccessibleGidBuilder : ButtonAccessibleGidBuilderImpl!ButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ButtonAccessible build() nothrow
  {
    return new ButtonAccessible(cast(void*)createGObject(ButtonAccessible._getGType), Yes.Take);
  }
}
