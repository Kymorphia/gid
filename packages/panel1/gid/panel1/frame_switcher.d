/// Module for [FrameSwitcher] class
module gid.panel1.frame_switcher;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame_header;
import gid.panel1.frame_header_mixin;
import gid.panel1.types;

/**
    A #PanelFrameSwitcher is a #PanelFrameHeader that shows a row of
    buttons to switch between #GtkStack pages, not disimilar to a
    #GtkStackSwitcher.
*/
class FrameSwitcher : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable, gid.panel1.frame_header.FrameHeader
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
    return cast(void function())panel_frame_switcher_get_type != &gidSymbolNotFound ? panel_frame_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelFrameSwitcher";
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameSwitcher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.frame_switcher.FrameSwitcher]
      Returns: New builder object
  */
  static FrameSwitcherGidBuilder builder() nothrow
  {
    return new FrameSwitcherGidBuilder;
  }

  mixin OrientableT!();
  mixin FrameHeaderT!();

  /**
      Create a new [gid.panel1.frame_switcher.FrameSwitcher].
      Returns: a new [gid.panel1.frame_switcher.FrameSwitcher].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_frame_switcher_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.frame_switcher.FrameSwitcher]
class FrameSwitcherGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T, gid.panel1.frame_header.FrameHeaderGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
  mixin FrameHeaderGidBuilderT!();
}

/// Fluent builder for [gid.panel1.frame_switcher.FrameSwitcher]
final class FrameSwitcherGidBuilder : FrameSwitcherGidBuilderImpl!FrameSwitcherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FrameSwitcher build() nothrow
  {
    return new FrameSwitcher(cast(void*)createGObject(FrameSwitcher._getGType), Yes.Take);
  }
}
