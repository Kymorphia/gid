/// Module for [LabelAccessible] class
module gid.gtk3.label_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.hypertext;
import gid.atk1.hypertext_mixin;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
class LabelAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.hypertext.Hypertext, gid.atk1.text.Text
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
    return cast(void function())gtk_label_accessible_get_type != &gidSymbolNotFound ? gtk_label_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLabelAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override LabelAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.label_accessible.LabelAccessible]
      Returns: New builder object
  */
  static LabelAccessibleGidBuilder builder() nothrow
  {
    return new LabelAccessibleGidBuilder;
  }

  mixin HypertextT!();
  mixin TextT!();
}

/// Fluent builder implementation template for [gid.gtk3.label_accessible.LabelAccessible]
class LabelAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.hypertext.HypertextGidBuilderImpl!T, gid.atk1.text.TextGidBuilderImpl!T
{

  mixin HypertextGidBuilderT!();
  mixin TextGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.label_accessible.LabelAccessible]
final class LabelAccessibleGidBuilder : LabelAccessibleGidBuilderImpl!LabelAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LabelAccessible build() nothrow
  {
    return new LabelAccessible(cast(void*)createGObject(LabelAccessible._getGType), Yes.Take);
  }
}
