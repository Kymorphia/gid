/// Module for [LabelAccessible] class
module gtk.label_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import atk.hypertext;
import atk.hypertext_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class LabelAccessible : gtk.widget_accessible.WidgetAccessible, atk.hypertext.Hypertext, atk.text.Text
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_label_accessible_get_type != &gidSymbolNotFound ? gtk_label_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LabelAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.label_accessible.LabelAccessible]
      Returns: New builder object
  */
  static LabelAccessibleGidBuilder builder() nothrow
  {
    return new LabelAccessibleGidBuilder;
  }

  mixin HypertextT!();
  mixin TextT!();
}

/// Fluent builder implementation template for [gtk.label_accessible.LabelAccessible]
class LabelAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.hypertext.HypertextGidBuilderImpl!T, atk.text.TextGidBuilderImpl!T
{

  mixin HypertextGidBuilderT!();
  mixin TextGidBuilderT!();
}

/// Fluent builder for [gtk.label_accessible.LabelAccessible]
final class LabelAccessibleGidBuilder : LabelAccessibleGidBuilderImpl!LabelAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LabelAccessible build() nothrow
  {
    return new LabelAccessible(cast(void*)createGObject(LabelAccessible._getGType), No.Take);
  }
}
