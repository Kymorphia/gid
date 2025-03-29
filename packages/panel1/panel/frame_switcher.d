module panel.frame_switcher;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame_header;
import panel.frame_header_mixin;
import panel.types;

/**
    A #PanelFrameSwitcher is a #PanelFrameHeader that shows a row of
    buttons to switch between #GtkStack pages, not disimilar to a
    #GtkStackSwitcher.
*/
class FrameSwitcher : gtk.widget.Widget, gtk.orientable.Orientable, panel.frame_header.FrameHeader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_frame_switcher_get_type != &gidSymbolNotFound ? panel_frame_switcher_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override FrameSwitcher self()
  {
    return this;
  }

  mixin OrientableT!();
  mixin FrameHeaderT!();

  /**
      Create a new [panel.frame_switcher.FrameSwitcher].
      Returns: a new [panel.frame_switcher.FrameSwitcher].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_switcher_new();
    this(_cretval, No.Take);
  }
}
