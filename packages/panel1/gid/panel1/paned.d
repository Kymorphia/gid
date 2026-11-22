/// Module for [Paned] class
module gid.panel1.paned;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
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
import gid.panel1.types;

/**
    A #PanelPaned is the concrete widget for a panel area.
*/
class Paned : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())panel_paned_get_type != &gidSymbolNotFound ? panel_paned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelPaned";
  }

  /** Returns `this`, for use in `with` statements. */
  override Paned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.paned.Paned]
      Returns: New builder object
  */
  static PanedGidBuilder builder() nothrow
  {
    return new PanedGidBuilder;
  }

  mixin OrientableT!();

  /**
      Create a new #PanelPaned.
      Returns: a newly created #PanelPaned
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_paned_new();
    this(_cretval, No.Take);
  }

  /**
      Append a widget in the paned.
  
      Params:
        child = a #GtkWidget to append.
  */
  void append(gid.gtk4.widget.Widget child) nothrow
  {
    panel_paned_append(cast(PanelPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the number of children in the paned.
      Returns: the number of children.
  */
  uint getNChildren() nothrow
  {
    uint _retval;
    _retval = panel_paned_get_n_children(cast(PanelPaned*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child at position nth.
  
      Params:
        nth = the child position
      Returns: a #GtkWidget or null
  */
  gid.gtk4.widget.Widget getNthChild(uint nth) nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_paned_get_nth_child(cast(PanelPaned*)this._cPtr, nth);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts a widget at position in the paned.
  
      Params:
        position = the position
        child = a #GtkWidget to insert.
  */
  void insert(int position, gid.gtk4.widget.Widget child) nothrow
  {
    panel_paned_insert(cast(PanelPaned*)this._cPtr, position, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Inserts a widget afer sibling in the paned.
  
      Params:
        child = a #GtkWidget to insert.
        sibling = the widget after which to insert.
  */
  override void insertAfter(gid.gtk4.widget.Widget child, gid.gtk4.widget.Widget sibling) nothrow
  {
    panel_paned_insert_after(cast(PanelPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Prepends a widget in the paned.
  
      Params:
        child = a #GtkWidget to prepend.
  */
  void prepend(gid.gtk4.widget.Widget child) nothrow
  {
    panel_paned_prepend(cast(PanelPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a widget from the paned.
  
      Params:
        child = a #GtkWidget
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    panel_paned_remove(cast(PanelPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.panel1.paned.Paned]
class PanedGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
}

/// Fluent builder for [gid.panel1.paned.Paned]
final class PanedGidBuilder : PanedGidBuilderImpl!PanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Paned build() nothrow
  {
    return new Paned(cast(void*)createGObject(Paned._getGType), Yes.Take);
  }
}
