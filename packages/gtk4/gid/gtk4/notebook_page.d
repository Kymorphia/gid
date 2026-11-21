/// Module for [NotebookPage] class
module gid.gtk4.notebook_page;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    An auxiliary object used by [gid.gtk4.notebook.Notebook].
*/
class NotebookPage : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_notebook_page_get_type != &gidSymbolNotFound ? gtk_notebook_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNotebookPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.notebook_page.NotebookPage]
      Returns: New builder object
  */
  static NotebookPageGidBuilder builder() nothrow
  {
    return new NotebookPageGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child for this page.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Get `detachable` property.
      Returns: Whether the tab is detachable.
  */
  @property bool detachable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("detachable");
  }

  /**
      Set `detachable` property.
      Params:
        propval = Whether the tab is detachable.
  */
  @property void detachable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("detachable", propval);
  }

  /**
      Get `menu` property.
      Returns: The label widget displayed in the child's menu entry.
  */
  @property gid.gtk4.widget.Widget menu() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.widget.Widget)("menu");
  }

  /**
      Get `menuLabel` property.
      Returns: The text of the menu widget.
  */
  @property string menuLabel() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("menu-label");
  }

  /**
      Set `menuLabel` property.
      Params:
        propval = The text of the menu widget.
  */
  @property void menuLabel(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("menu-label", propval);
  }

  /**
      Get `position` property.
      Returns: The index of the child in the parent.
  */
  @property int position() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("position");
  }

  /**
      Set `position` property.
      Params:
        propval = The index of the child in the parent.
  */
  @property void position(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("position", propval);
  }

  /**
      Get `reorderable` property.
      Returns: Whether the tab is reorderable by user action.
  */
  @property bool reorderable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("reorderable");
  }

  /**
      Set `reorderable` property.
      Params:
        propval = Whether the tab is reorderable by user action.
  */
  @property void reorderable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("reorderable", propval);
  }

  /**
      Get `tab` property.
      Returns: The tab widget for this page.
  */
  @property gid.gtk4.widget.Widget tab() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.widget.Widget)("tab");
  }

  /**
      Get `tabExpand` property.
      Returns: Whether to expand the child's tab.
  */
  @property bool tabExpand() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("tab-expand");
  }

  /**
      Set `tabExpand` property.
      Params:
        propval = Whether to expand the child's tab.
  */
  @property void tabExpand(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("tab-expand", propval);
  }

  /**
      Get `tabFill` property.
      Returns: Whether the child's tab should fill the allocated area.
  */
  @property bool tabFill() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("tab-fill");
  }

  /**
      Set `tabFill` property.
      Params:
        propval = Whether the child's tab should fill the allocated area.
  */
  @property void tabFill(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("tab-fill", propval);
  }

  /**
      Get `tabLabel` property.
      Returns: The text of the tab widget.
  */
  @property string tabLabel() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tab-label");
  }

  /**
      Set `tabLabel` property.
      Params:
        propval = The text of the tab widget.
  */
  @property void tabLabel(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tab-label", propval);
  }

  /**
      Returns the notebook child to which page belongs.
      Returns: the child to which page belongs
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_page_get_child(cast(GtkNotebookPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.notebook_page.NotebookPage]
class NotebookPageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The child for this page.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `detachable` property.
      Params:
        propval = Whether the tab is detachable.
      Returns: Builder instance for fluent chaining
  */
  T detachable(bool propval) nothrow
  {
    return setProperty("detachable", propval);
  }

  /**
      Set `menu` property.
      Params:
        propval = The label widget displayed in the child's menu entry.
      Returns: Builder instance for fluent chaining
  */
  T menu(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("menu", propval);
  }

  /**
      Set `menuLabel` property.
      Params:
        propval = The text of the menu widget.
      Returns: Builder instance for fluent chaining
  */
  T menuLabel(string propval) nothrow
  {
    return setProperty("menu-label", propval);
  }

  /**
      Set `position` property.
      Params:
        propval = The index of the child in the parent.
      Returns: Builder instance for fluent chaining
  */
  T position(int propval) nothrow
  {
    return setProperty("position", propval);
  }

  /**
      Set `reorderable` property.
      Params:
        propval = Whether the tab is reorderable by user action.
      Returns: Builder instance for fluent chaining
  */
  T reorderable(bool propval) nothrow
  {
    return setProperty("reorderable", propval);
  }

  /**
      Set `tab` property.
      Params:
        propval = The tab widget for this page.
      Returns: Builder instance for fluent chaining
  */
  T tab(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("tab", propval);
  }

  /**
      Set `tabExpand` property.
      Params:
        propval = Whether to expand the child's tab.
      Returns: Builder instance for fluent chaining
  */
  T tabExpand(bool propval) nothrow
  {
    return setProperty("tab-expand", propval);
  }

  /**
      Set `tabFill` property.
      Params:
        propval = Whether the child's tab should fill the allocated area.
      Returns: Builder instance for fluent chaining
  */
  T tabFill(bool propval) nothrow
  {
    return setProperty("tab-fill", propval);
  }

  /**
      Set `tabLabel` property.
      Params:
        propval = The text of the tab widget.
      Returns: Builder instance for fluent chaining
  */
  T tabLabel(string propval) nothrow
  {
    return setProperty("tab-label", propval);
  }
}

/// Fluent builder for [gid.gtk4.notebook_page.NotebookPage]
final class NotebookPageGidBuilder : NotebookPageGidBuilderImpl!NotebookPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookPage build() nothrow
  {
    return new NotebookPage(cast(void*)createGObject(NotebookPage._getGType), Yes.Take);
  }
}
