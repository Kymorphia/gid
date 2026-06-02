/// Module for [NotebookPage] class
module gtk.notebook_page;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.notebook_page.NotebookPage] is an auxiliary object used by [gtk.notebook.Notebook].
*/
class NotebookPage : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_notebook_page_get_type != &gidSymbolNotFound ? gtk_notebook_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.notebook_page.NotebookPage]
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
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Get `detachable` property.
      Returns: Whether the tab is detachable.
  */
  @property bool detachable() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("detachable");
  }

  /**
      Set `detachable` property.
      Params:
        propval = Whether the tab is detachable.
  */
  @property void detachable(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("detachable", propval);
  }

  /**
      Get `menu` property.
      Returns: The label widget displayed in the child's menu entry.
  */
  @property gtk.widget.Widget menu() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("menu");
  }

  /**
      Get `menuLabel` property.
      Returns: The text of the menu widget.
  */
  @property string menuLabel() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("menu-label");
  }

  /**
      Set `menuLabel` property.
      Params:
        propval = The text of the menu widget.
  */
  @property void menuLabel(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("menu-label", propval);
  }

  /**
      Get `position` property.
      Returns: The index of the child in the parent.
  */
  @property int position() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("position");
  }

  /**
      Set `position` property.
      Params:
        propval = The index of the child in the parent.
  */
  @property void position(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("position", propval);
  }

  /**
      Get `reorderable` property.
      Returns: Whether the tab is reorderable by user action.
  */
  @property bool reorderable() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("reorderable");
  }

  /**
      Set `reorderable` property.
      Params:
        propval = Whether the tab is reorderable by user action.
  */
  @property void reorderable(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("reorderable", propval);
  }

  /**
      Get `tab` property.
      Returns: The tab widget for this page.
  */
  @property gtk.widget.Widget tab() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("tab");
  }

  /**
      Get `tabExpand` property.
      Returns: Whether to expand the child's tab.
  */
  @property bool tabExpand() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tab-expand");
  }

  /**
      Set `tabExpand` property.
      Params:
        propval = Whether to expand the child's tab.
  */
  @property void tabExpand(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tab-expand", propval);
  }

  /**
      Get `tabFill` property.
      Returns: Whether the child's tab should fill the allocated area.
  */
  @property bool tabFill() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tab-fill");
  }

  /**
      Set `tabFill` property.
      Params:
        propval = Whether the child's tab should fill the allocated area.
  */
  @property void tabFill(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tab-fill", propval);
  }

  /**
      Get `tabLabel` property.
      Returns: The text of the tab widget.
  */
  @property string tabLabel() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tab-label");
  }

  /**
      Set `tabLabel` property.
      Params:
        propval = The text of the tab widget.
  */
  @property void tabLabel(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("tab-label", propval);
  }

  /**
      Returns the notebook child to which page belongs.
      Returns: the child to which page belongs
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_page_get_child(cast(GtkNotebookPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.notebook_page.NotebookPage]
class NotebookPageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The child for this page.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
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
  T menu(gtk.widget.Widget propval) nothrow
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
  T tab(gtk.widget.Widget propval) nothrow
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

/// Fluent builder for [gtk.notebook_page.NotebookPage]
final class NotebookPageGidBuilder : NotebookPageGidBuilderImpl!NotebookPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookPage build() nothrow
  {
    return new NotebookPage(cast(void*)createGObject(NotebookPage._getGType), No.Take);
  }
}
