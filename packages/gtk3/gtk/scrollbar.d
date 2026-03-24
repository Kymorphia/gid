/// Module for [Scrollbar] class
module gtk.scrollbar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.range;
import gtk.types;

/**
    The #GtkScrollbar widget is a horizontal or vertical scrollbar,
    depending on the value of the #GtkOrientable:orientation property.
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gtk.scrollbar.Scrollbar.new_]. See #GtkAdjustment for more details. The
    #GtkAdjustment:value field sets the position of the thumb and must be between
    #GtkAdjustment:lower and #GtkAdjustment:upper - #GtkAdjustment:page-size. The
    #GtkAdjustment:page-size represents the size of the visible scrollable area.
    The fields #GtkAdjustment:step-increment and #GtkAdjustment:page-increment
    fields are added to or subtracted from the #GtkAdjustment:value when the user
    asks to move by a step (using e.g. the cursor arrow keys or, if present, the
    stepper buttons) or by a page (using e.g. the Page Down/Up keys).
    
    # CSS nodes
    
    ```plain
    scrollbar[.fine-tune]
    ╰── contents
        ├── [button.up]
        ├── [button.down]
        ├── trough
        │   ╰── slider
        ├── [button.up]
        ╰── [button.down]
    ```
    
    GtkScrollbar has a main CSS node with name scrollbar and a subnode for its
    contents, with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.
    
    If steppers are enabled, they are represented by up to four additional
    subnodes with name button. These get the style classes .up and .down to
    indicate in which direction they are moving.
    
    Other style classes that may be added to scrollbars inside #GtkScrolledWindow
    include the positional classes (.left, .right, .top, .bottom) and style
    classes related to overlay scrolling (.overlay-indicator, .dragging, .hovering).
*/
class Scrollbar : gtk.range.Range
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
      Creates a new scrollbar with the given orientation.
  
      Params:
        orientation = the scrollbar’s orientation.
        adjustment = the #GtkAdjustment to use, or null to create a new adjustment.
      Returns: the new #GtkScrollbar.
  */
  this(gtk.types.Orientation orientation, gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrollbar_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

class ScrollbarGidBuilderImpl(T) : gtk.range.RangeGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.scrollbar.Scrollbar]
final class ScrollbarGidBuilder : ScrollbarGidBuilderImpl!ScrollbarGidBuilder
{
  Scrollbar build()
  {
    return new Scrollbar(cast(void*)createGObject(Scrollbar._getGType), No.Take);
  }
}
