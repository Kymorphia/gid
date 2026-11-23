/// Module for [TextViewAccessible] class
module gid.gtk3.text_view_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.editable_text;
import gid.atk1.editable_text_mixin;
import gid.atk1.streamable_content;
import gid.atk1.streamable_content_mixin;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class TextViewAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.editable_text.EditableText, gid.atk1.streamable_content.StreamableContent, gid.atk1.text.Text
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
    return cast(void function())gtk_text_view_accessible_get_type != &gidSymbolNotFound ? gtk_text_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextViewAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextViewAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.text_view_accessible.TextViewAccessible]
      Returns: New builder object
  */
  static TextViewAccessibleGidBuilder builder() nothrow
  {
    return new TextViewAccessibleGidBuilder;
  }

  mixin EditableTextT!();
  mixin StreamableContentT!();
  mixin TextT!();
}

/// Fluent builder implementation template for [gid.gtk3.text_view_accessible.TextViewAccessible]
class TextViewAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.editable_text.EditableTextGidBuilderImpl!T, gid.atk1.streamable_content.StreamableContentGidBuilderImpl!T, gid.atk1.text.TextGidBuilderImpl!T
{

  mixin EditableTextGidBuilderT!();
  mixin StreamableContentGidBuilderT!();
  mixin TextGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.text_view_accessible.TextViewAccessible]
final class TextViewAccessibleGidBuilder : TextViewAccessibleGidBuilderImpl!TextViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextViewAccessible build() nothrow
  {
    return new TextViewAccessible(cast(void*)createGObject(TextViewAccessible._getGType), Yes.Take);
  }
}
