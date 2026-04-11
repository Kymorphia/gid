/// Module for [TextViewAccessible] class
module gtk.text_view_accessible;

import atk.component;
import atk.component_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.streamable_content;
import atk.streamable_content_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class TextViewAccessible : gtk.container_accessible.ContainerAccessible, atk.editable_text.EditableText, atk.streamable_content.StreamableContent, atk.text.Text
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
    return cast(void function())gtk_text_view_accessible_get_type != &gidSymbolNotFound ? gtk_text_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextViewAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.text_view_accessible.TextViewAccessible]
      Returns: New builder object
  */
  static TextViewAccessibleGidBuilder builder()
  {
    return new TextViewAccessibleGidBuilder;
  }

  mixin EditableTextT!();
  mixin StreamableContentT!();
  mixin TextT!();
}

/// Fluent builder implementation template for [gtk.text_view_accessible.TextViewAccessible]
class TextViewAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.editable_text.EditableTextGidBuilderImpl!T, atk.streamable_content.StreamableContentGidBuilderImpl!T, atk.text.TextGidBuilderImpl!T
{

  mixin EditableTextGidBuilderT!();
  mixin StreamableContentGidBuilderT!();
  mixin TextGidBuilderT!();
}

/// Fluent builder for [gtk.text_view_accessible.TextViewAccessible]
final class TextViewAccessibleGidBuilder : TextViewAccessibleGidBuilderImpl!TextViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextViewAccessible build()
  {
    return new TextViewAccessible(cast(void*)createGObject(TextViewAccessible._getGType), No.Take);
  }
}
