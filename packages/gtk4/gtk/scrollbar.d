/// Module for [Scrollbar] class
module gtk.scrollbar;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.scrollbar.Scrollbar] widget is a horizontal or vertical scrollbar.
    
    ![An example GtkScrollbar](scrollbar.png)
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gtk.scrollbar.Scrollbar.new_]. See [gtk.adjustment.Adjustment] for more
    details. The [gtk.adjustment.Adjustment.value] field sets the position of the
    thumb and must be between [gtk.adjustment.Adjustment.lower] and
    [gtk.adjustment.Adjustment.upper] - `property@Gtk.Adjustment:page-size`.
    The `property@Gtk.Adjustment:page-size` represents the size of the visible
    scrollable area.
    
    The fields `property@Gtk.Adjustment:step-increment` and
    `property@Gtk.Adjustment:page-increment` fields are added to or subtracted
    from the [gtk.adjustment.Adjustment.value] when the user asks to move by a step
    (using e.g. the cursor arrow keys) or by a page (using e.g. the Page Down/Up
    keys).
    
    # CSS nodes
    
    ```
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ```
    
    [gtk.scrollbar.Scrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes applied,
    depending on the scrollbar's orientation.
    
    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.
    
    Other style classes that may be added to scrollbars inside
    [gtk.scrolled_window.ScrolledWindow] include the positional classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling (.overlay-indicator,
    .dragging, .hovering).
    
    # Accessibility
    
    [gtk.scrollbar.Scrollbar] uses the [gtk.types.AccessibleRole.Scrollbar] role.
*/
class Scrollbar : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_scrollbar_get_type != &gidSymbolNotFound ? gtk_scrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Scrollbar self()
  {
    return this;
  }

  /**
      Get builder for [gtk.scrollbar.Scrollbar]
      Returns: New builder object
  */
  static ScrollbarGidBuilder builder()
  {
    return new ScrollbarGidBuilder;
  }

  /**
      Get `adjustment` property.
      Returns: The [gtk.adjustment.Adjustment] controlled by this scrollbar.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The [gtk.adjustment.Adjustment] controlled by this scrollbar.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    setAdjustment(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new scrollbar with the given orientation.
  
      Params:
        orientation = the scrollbar’s orientation.
        adjustment = the [gtk.adjustment.Adjustment] to use, or null
            to create a new adjustment.
      Returns: the new [gtk.scrollbar.Scrollbar].
  */
  this(gtk.types.Orientation orientation, gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrollbar_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Returns the scrollbar's adjustment.
      Returns: the scrollbar's adjustment
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollbar_get_adjustment(cast(GtkScrollbar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Makes the scrollbar use the given adjustment.
  
      Params:
        adjustment = the adjustment to set
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_scrollbar_set_adjustment(cast(GtkScrollbar*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.scrollbar.Scrollbar]
class ScrollbarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `adjustment` property.
      Params:
        propval = The [gtk.adjustment.Adjustment] controlled by this scrollbar.
      Returns: Builder instance for fluent chaining
  */
  T adjustment(gtk.adjustment.Adjustment propval)
  {
    return setProperty("adjustment", propval);
  }
}

/// Fluent builder for [gtk.scrollbar.Scrollbar]
final class ScrollbarGidBuilder : ScrollbarGidBuilderImpl!ScrollbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Scrollbar build()
  {
    return new Scrollbar(cast(void*)createGObject(Scrollbar._getGType), No.Take);
  }
}
