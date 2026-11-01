/// Module for [ListBase] class
module gtk.list_base;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;
import gtk.widget;

/**
    The abstract base class for GTK's list widgets.
    
    # Shortcuts and Gestures
    
    [gtk.list_base.ListBase] supports the following keyboard shortcuts:
    
    - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd>
      selects all items.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
      <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all items.
    
    The focused item is controlled by the navigation keys below, combined
    with the <kbd>Ctrl</kbd> modifier to prevent moving the selection,
    and the <kbd>Shift</kbd> modifier to extend the current selection.
    
    - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move the focus
      on the next item in the designed direction.
    - <kbd>Home</kbd> and <kbd>End</kbd> focus the first or last item.
    - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move the focus one page up or down.
    
    List item widgets support the following keyboard shortcuts:
    
    - <kbd>Enter</kbd> activates the item.
    - <kbd>␣</kbd> selects the item, with the same <kbd>Ctrl</kbd> and
      <kbd>Shift</kbd> modifiers combinations as the navigation keys.
    
    # Actions
    
    [gtk.list_base.ListBase] defines a set of built-in actions:
    
    - `list.scroll-to-item` moves the visible area to the item at given position
      with the minimum amount of scrolling required. If the item is already
      visible, nothing happens.
    - `list.select-item` changes the selection.
    - `list.select-all` selects all items in the model, if the selection model
      supports it.
    - `list.unselect-all` unselects all items in the model, if the selection
      model supports it.
    
    List item widgets install the following actions:
    
    - `listitem.select` changes selection if the item is selectable.
    - `listitem.scroll-to` moves the visible area of the list to this item with
      the minimum amount of scrolling required.
*/
class ListBase : gtk.widget.Widget, gtk.orientable.Orientable, gtk.scrollable.Scrollable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_base_get_type != &gidSymbolNotFound ? gtk_list_base_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBase self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.list_base.ListBase]
      Returns: New builder object
  */
  static ListBaseGidBuilder builder() nothrow
  {
    return new ListBaseGidBuilder;
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the list. See GtkOrientable:orientation
        for details.
  */
  @property gtk.types.Orientation orientation() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Orientation)("orientation");
  }

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the list. See GtkOrientable:orientation
          for details.
  */
  @property void orientation(gtk.types.Orientation propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.Orientation)("orientation", propval);
  }

  mixin OrientableT!();
  mixin ScrollableT!();
}

/// Fluent builder implementation template for [gtk.list_base.ListBase]
class ListBaseGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T, gtk.scrollable.ScrollableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
  mixin ScrollableGidBuilderT!();

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the list. See GtkOrientable:orientation
          for details.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gtk.types.Orientation propval) nothrow
  {
    return setProperty("orientation", propval);
  }
}

/// Fluent builder for [gtk.list_base.ListBase]
final class ListBaseGidBuilder : ListBaseGidBuilderImpl!ListBaseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListBase build() nothrow
  {
    return new ListBase(cast(void*)createGObject(ListBase._getGType), Yes.Take);
  }
}
