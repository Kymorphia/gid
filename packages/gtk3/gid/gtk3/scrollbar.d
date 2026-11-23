/// Module for [Scrollbar] class
module gid.gtk3.scrollbar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.range;
import gid.gtk3.types;

/**
    The #GtkScrollbar widget is a horizontal or vertical scrollbar,
    depending on the value of the #GtkOrientable:orientation property.
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gid.gtk4.scrollbar.Scrollbar.new_]. See #GtkAdjustment for more details. The
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
class Scrollbar : gid.gtk3.range.Range
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
      Get builder for [gid.gtk3.scrollbar.Scrollbar]
      Returns: New builder object
  */
  static ScrollbarGidBuilder builder() nothrow
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
  this(gid.gtk3.types.Orientation orientation, gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
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
}

/// Fluent builder implementation template for [gid.gtk3.scrollbar.Scrollbar]
class ScrollbarGidBuilderImpl(T) : gid.gtk3.range.RangeGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.scrollbar.Scrollbar]
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
