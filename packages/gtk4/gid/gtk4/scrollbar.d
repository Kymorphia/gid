/// Module for [Scrollbar] class
module gid.gtk4.scrollbar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.adjustment;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a horizontal or vertical scrollbar.
    
    <picture>
      <source srcset="scrollbar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkScrollbar" src="scrollbar.png">
    </picture>
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gid.gtk4.scrollbar.Scrollbar.new_]. See [gid.gtk4.adjustment.Adjustment] for more
    details. The [gid.gtk4.adjustment.Adjustment.value] field sets the position of the
    thumb and must be between [gid.gtk4.adjustment.Adjustment.lower] and
    [gid.gtk4.adjustment.Adjustment.upper] - [gid.gtk4.adjustment.Adjustment.pageSize].
    The [gid.gtk4.adjustment.Adjustment.pageSize] represents the size of the visible
    scrollable area.
    
    The fields [gid.gtk4.adjustment.Adjustment.stepIncrement] and
    [gid.gtk4.adjustment.Adjustment.pageIncrement] fields are added to or subtracted
    from the [gid.gtk4.adjustment.Adjustment.value] when the user asks to move by a step
    (using e.g. the cursor arrow keys) or by a page (using e.g. the Page Down/Up
    keys).
    
    # CSS nodes
    
    ```
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ```
    
    [gid.gtk4.scrollbar.Scrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes applied,
    depending on the scrollbar's orientation.
    
    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.
    
    Other style classes that may be added to scrollbars inside
    [gid.gtk4.scrolled_window.ScrolledWindow] include the positional classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling (.overlay-indicator,
    .dragging, .hovering).
    
    # Accessibility
    
    [gid.gtk4.scrollbar.Scrollbar] uses the [gid.gtk4.types.AccessibleRole.Scrollbar] role.
*/
class Scrollbar : gid.gtk4.widget.Widget, gid.gtk4.accessible_range.AccessibleRange, gid.gtk4.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrollbar_get_type != &gidSymbolNotFound ? gtk_scrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScrollbar";
  }

  /** Returns `this`, for use in `with` statements. */
  override Scrollbar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.scrollbar.Scrollbar]
      Returns: New builder object
  */
  static ScrollbarGidBuilder builder() nothrow
  {
    return new ScrollbarGidBuilder;
  }

  /**
      Get `adjustment` property.
      Returns: The [gid.gtk4.adjustment.Adjustment] controlled by this scrollbar.
  */
  @property gid.gtk4.adjustment.Adjustment adjustment() nothrow
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The [gid.gtk4.adjustment.Adjustment] controlled by this scrollbar.
  */
  @property void adjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    setAdjustment(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new scrollbar with the given orientation.
  
      Params:
        orientation = the scrollbar’s orientation.
        adjustment = the [gid.gtk4.adjustment.Adjustment] to use, or null
            to create a new adjustment.
      Returns: the new [gid.gtk4.scrollbar.Scrollbar].
  */
  this(gid.gtk4.types.Orientation orientation, gid.gtk4.adjustment.Adjustment adjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_scrollbar_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Returns the scrollbar's adjustment.
      Returns: the scrollbar's adjustment
  */
  gid.gtk4.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollbar_get_adjustment(cast(GtkScrollbar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Makes the scrollbar use the given adjustment.
  
      Params:
        adjustment = the adjustment to set
  */
  void setAdjustment(gid.gtk4.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_scrollbar_set_adjustment(cast(GtkScrollbar*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.scrollbar.Scrollbar]
class ScrollbarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_range.AccessibleRangeGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin AccessibleRangeGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /**
      Set `adjustment` property.
      Params:
        propval = The [gid.gtk4.adjustment.Adjustment] controlled by this scrollbar.
      Returns: Builder instance for fluent chaining
  */
  T adjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    return setProperty("adjustment", propval);
  }
}

/// Fluent builder for [gid.gtk4.scrollbar.Scrollbar]
final class ScrollbarGidBuilder : ScrollbarGidBuilderImpl!ScrollbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Scrollbar build() nothrow
  {
    return new Scrollbar(cast(void*)createGObject(Scrollbar._getGType), Yes.Take);
  }
}
