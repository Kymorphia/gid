/// Module for [Statusbar] class
module panel.statusbar;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.types;

/**
    A panel status bar is meant to be displayed at the bottom of the
    window. It can contain widgets in the prefix and in the suffix.
*/
class Statusbar : gtk.widget.Widget
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
    return cast(void function())panel_statusbar_get_type != &gidSymbolNotFound ? panel_statusbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Statusbar self()
  {
    return this;
  }

  /**
  Get builder for [panel.statusbar.Statusbar]
  Returns: New builder object
  */
  static StatusbarGidBuilder builder()
  {
    return new StatusbarGidBuilder;
  }

  /**
      Create a new #PanelStatusbar.
      Returns: a newly created #PanelStatusBar.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_statusbar_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a widget into the prefix with priority. The higher the
      priority the closer to the start the widget will be added.
  
      Params:
        priority = the priority
        widget = a #GtkWidget to add.
  */
  void addPrefix(int priority, gtk.widget.Widget widget)
  {
    panel_statusbar_add_prefix(cast(PanelStatusbar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Adds a widget into the suffix with priority. The higher the
      priority the closer to the start the widget will be added.
  
      Params:
        priority = the priority
        widget = a #GtkWidget to add.
  */
  void addSuffix(int priority, gtk.widget.Widget widget)
  {
    panel_statusbar_add_suffix(cast(PanelStatusbar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Removes widget from the #PanelStatusbar.
  
      Params:
        widget = a #GtkWidget to remove.
  */
  void remove(gtk.widget.Widget widget)
  {
    panel_statusbar_remove(cast(PanelStatusbar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

class StatusbarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [panel.statusbar.Statusbar]
final class StatusbarGidBuilder : StatusbarGidBuilderImpl!StatusbarGidBuilder
{
  Statusbar build()
  {
    return new Statusbar(cast(void*)createGObject(Statusbar._getGType), No.Take);
  }
}
