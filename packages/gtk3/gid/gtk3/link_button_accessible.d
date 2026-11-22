/// Module for [LinkButtonAccessible] class
module gid.gtk3.link_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.hyperlink_impl;
import gid.atk1.hyperlink_impl_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.button_accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class LinkButtonAccessible : gid.gtk3.button_accessible.ButtonAccessible, gid.atk1.hyperlink_impl.HyperlinkImpl
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
    return cast(void function())gtk_link_button_accessible_get_type != &gidSymbolNotFound ? gtk_link_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLinkButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override LinkButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.link_button_accessible.LinkButtonAccessible]
      Returns: New builder object
  */
  static LinkButtonAccessibleGidBuilder builder() nothrow
  {
    return new LinkButtonAccessibleGidBuilder;
  }

  mixin HyperlinkImplT!();
}

/// Fluent builder implementation template for [gid.gtk3.link_button_accessible.LinkButtonAccessible]
class LinkButtonAccessibleGidBuilderImpl(T) : gid.gtk3.button_accessible.ButtonAccessibleGidBuilderImpl!T, gid.atk1.hyperlink_impl.HyperlinkImplGidBuilderImpl!T
{

  mixin HyperlinkImplGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.link_button_accessible.LinkButtonAccessible]
final class LinkButtonAccessibleGidBuilder : LinkButtonAccessibleGidBuilderImpl!LinkButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LinkButtonAccessible build() nothrow
  {
    return new LinkButtonAccessible(cast(void*)createGObject(LinkButtonAccessible._getGType), Yes.Take);
  }
}
