/// Module for [ButtonAccessible] class
module gtk.button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ButtonAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action, atk.image.Image
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
    return cast(void function())gtk_button_accessible_get_type != &gidSymbolNotFound ? gtk_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.button_accessible.ButtonAccessible]
      Returns: New builder object
  */
  static ButtonAccessibleGidBuilder builder()
  {
    return new ButtonAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ImageT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.button_accessible.ButtonAccessible]
class ButtonAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.button_accessible.ButtonAccessible]
final class ButtonAccessibleGidBuilder : ButtonAccessibleGidBuilderImpl!ButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ButtonAccessible build()
  {
    return new ButtonAccessible(cast(void*)createGObject(ButtonAccessible._getGType), No.Take);
  }
}
