/// Module for [LinkButtonAccessible] class
module gtk.link_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.hyperlink_impl;
import atk.hyperlink_impl_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class LinkButtonAccessible : gtk.button_accessible.ButtonAccessible, atk.hyperlink_impl.HyperlinkImpl
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
    return cast(void function())gtk_link_button_accessible_get_type != &gidSymbolNotFound ? gtk_link_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LinkButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.link_button_accessible.LinkButtonAccessible]
      Returns: New builder object
  */
  static LinkButtonAccessibleGidBuilder builder()
  {
    return new LinkButtonAccessibleGidBuilder;
  }

  mixin HyperlinkImplT!();
}

/// Fluent builder implementation template for [gtk.link_button_accessible.LinkButtonAccessible]
class LinkButtonAccessibleGidBuilderImpl(T) : gtk.button_accessible.ButtonAccessibleGidBuilderImpl!T, atk.hyperlink_impl.HyperlinkImplGidBuilderImpl!T
{

  mixin HyperlinkImplGidBuilderT!();
}

/// Fluent builder for [gtk.link_button_accessible.LinkButtonAccessible]
final class LinkButtonAccessibleGidBuilder : LinkButtonAccessibleGidBuilderImpl!LinkButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LinkButtonAccessible build()
  {
    return new LinkButtonAccessible(cast(void*)createGObject(LinkButtonAccessible._getGType), No.Take);
  }
}
