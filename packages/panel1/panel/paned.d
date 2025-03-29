module panel.paned;

import gid.gid;
import gobject.object;
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
import panel.types;

/**
    A #PanelPaned is the concrete widget for a panel area.
*/
class Paned : gtk.widget.Widget, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_paned_get_type != &gidSymbolNotFound ? panel_paned_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Paned self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Create a new #PanelPaned.
      Returns: a newly created #PanelPaned
  */
  this()
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
  void append(gtk.widget.Widget child)
  {
    panel_paned_append(cast(PanelPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Gets the number of children in the paned.
      Returns: the number of children.
  */
  uint getNChildren()
  {
    uint _retval;
    _retval = panel_paned_get_n_children(cast(PanelPaned*)cPtr);
    return _retval;
  }

  /**
      Gets the child at position nth.
  
      Params:
        nth = the child position
      Returns: a #GtkWidget or null
  */
  gtk.widget.Widget getNthChild(uint nth)
  {
    GtkWidget* _cretval;
    _cretval = panel_paned_get_nth_child(cast(PanelPaned*)cPtr, nth);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts a widget at position in the paned.
  
      Params:
        position = the position
        child = a #GtkWidget to insert.
  */
  void insert(int position, gtk.widget.Widget child)
  {
    panel_paned_insert(cast(PanelPaned*)cPtr, position, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Inserts a widget afer sibling in the paned.
  
      Params:
        child = a #GtkWidget to insert.
        sibling = the widget after which to insert.
  */
  override void insertAfter(gtk.widget.Widget child, gtk.widget.Widget sibling)
  {
    panel_paned_insert_after(cast(PanelPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling.cPtr(No.Dup) : null);
  }

  /**
      Prepends a widget in the paned.
  
      Params:
        child = a #GtkWidget to prepend.
  */
  void prepend(gtk.widget.Widget child)
  {
    panel_paned_prepend(cast(PanelPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Removes a widget from the paned.
  
      Params:
        child = a #GtkWidget
  */
  void remove(gtk.widget.Widget child)
  {
    panel_paned_remove(cast(PanelPaned*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
