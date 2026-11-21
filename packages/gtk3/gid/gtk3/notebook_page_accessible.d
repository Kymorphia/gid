/// Module for [NotebookPageAccessible] class
module gid.gtk3.notebook_page_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.notebook_accessible;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class NotebookPageAccessible : gid.atk1.object.ObjectWrap, gid.atk1.component.Component
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
    return cast(void function())gtk_notebook_page_accessible_get_type != &gidSymbolNotFound ? gtk_notebook_page_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNotebookPageAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookPageAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.notebook_page_accessible.NotebookPageAccessible]
      Returns: New builder object
  */
  static NotebookPageAccessibleGidBuilder builder() nothrow
  {
    return new NotebookPageAccessibleGidBuilder;
  }

  mixin ComponentT!();

  /** */
  this(gid.gtk3.notebook_accessible.NotebookAccessible notebook, gid.gtk3.widget.Widget child) nothrow
  {
    AtkObject* _cretval;
    _cretval = gtk_notebook_page_accessible_new(notebook ? cast(GtkNotebookAccessible*)notebook._cPtr(No.Dup) : null, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  void invalidate() nothrow
  {
    gtk_notebook_page_accessible_invalidate(cast(GtkNotebookPageAccessible*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gtk3.notebook_page_accessible.NotebookPageAccessible]
class NotebookPageAccessibleGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.notebook_page_accessible.NotebookPageAccessible]
final class NotebookPageAccessibleGidBuilder : NotebookPageAccessibleGidBuilderImpl!NotebookPageAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookPageAccessible build() nothrow
  {
    return new NotebookPageAccessible(cast(void*)createGObject(NotebookPageAccessible._getGType), Yes.Take);
  }
}
