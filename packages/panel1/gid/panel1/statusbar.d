/// Module for [Statusbar] class
module gid.panel1.statusbar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/**
    A panel status bar is meant to be displayed at the bottom of the
    window. It can contain widgets in the prefix and in the suffix.
*/
@gidGir("Statusbar", "StatusbarClass")
class Statusbar : gid.gtk4.widget.Widget
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
    return cast(void function())panel_statusbar_get_type != &gidSymbolNotFound ? panel_statusbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelStatusbar";
  }

  /** Returns `this`, for use in `with` statements. */
  override Statusbar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.statusbar.Statusbar]
      Returns: New builder object
  */
  static StatusbarGidBuilder builder() nothrow
  {
    return new StatusbarGidBuilder;
  }

  /**
      Create a new #PanelStatusbar.
      Returns: a newly created #PanelStatusBar.
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
      _cretval = panel_statusbar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a widget into the prefix with priority. The higher the
      priority the closer to the start the widget will be added.
  
      Params:
        priority = the priority
        widget = a #GtkWidget to add.
  */
  void addPrefix(int priority, gid.gtk4.widget.Widget widget) nothrow
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
  void addSuffix(int priority, gid.gtk4.widget.Widget widget) nothrow
  {
    panel_statusbar_add_suffix(cast(PanelStatusbar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Removes widget from the #PanelStatusbar.
  
      Params:
        widget = a #GtkWidget to remove.
  */
  void remove(gid.gtk4.widget.Widget widget) nothrow
  {
    panel_statusbar_remove(cast(PanelStatusbar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.panel1.statusbar.Statusbar]
class StatusbarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.panel1.statusbar.Statusbar]
final class StatusbarGidBuilder : StatusbarGidBuilderImpl!StatusbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Statusbar build() nothrow
  {
    return new Statusbar(cast(void*)createGObject(Statusbar._getGType), Yes.Take);
  }
}
