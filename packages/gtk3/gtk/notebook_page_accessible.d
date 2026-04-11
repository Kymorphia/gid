/// Module for [NotebookPageAccessible] class
module gtk.notebook_page_accessible;

import atk.component;
import atk.component_mixin;
import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.notebook_accessible;
import gtk.types;
import gtk.widget;

/** */
class NotebookPageAccessible : atk.object.ObjectWrap, atk.component.Component
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
    return cast(void function())gtk_notebook_page_accessible_get_type != &gidSymbolNotFound ? gtk_notebook_page_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookPageAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.notebook_page_accessible.NotebookPageAccessible]
      Returns: New builder object
  */
  static NotebookPageAccessibleGidBuilder builder()
  {
    return new NotebookPageAccessibleGidBuilder;
  }

  mixin ComponentT!();

  /** */
  this(gtk.notebook_accessible.NotebookAccessible notebook, gtk.widget.Widget child)
  {
    AtkObject* _cretval;
    _cretval = gtk_notebook_page_accessible_new(notebook ? cast(GtkNotebookAccessible*)notebook._cPtr(No.Dup) : null, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  void invalidate()
  {
    gtk_notebook_page_accessible_invalidate(cast(GtkNotebookPageAccessible*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gtk.notebook_page_accessible.NotebookPageAccessible]
class NotebookPageAccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T, atk.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gtk.notebook_page_accessible.NotebookPageAccessible]
final class NotebookPageAccessibleGidBuilder : NotebookPageAccessibleGidBuilderImpl!NotebookPageAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookPageAccessible build()
  {
    return new NotebookPageAccessible(cast(void*)createGObject(NotebookPageAccessible._getGType), Yes.Take);
  }
}
