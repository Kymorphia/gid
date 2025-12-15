/// Module for [Scale] class
module gtk.scale;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.range;
import gtk.types;
import pango.layout;

/**
    A [gtk.scale.Scale] is a slider control used to select a numeric value.
    
    ![An example GtkScale](scales.png)
    
    To use it, you’ll probably want to investigate the methods on its base
    class, [gtk.range.Range], in addition to the methods for [gtk.scale.Scale] itself.
    To set the value of a scale, you would normally use [gtk.range.Range.setValue].
    To detect changes to the value, you would normally use the
    `signal@Gtk.Range::value-changed` signal.
    
    Note that using the same upper and lower bounds for the [gtk.scale.Scale] (through
    the [gtk.range.Range] methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    [gtk.scale.Scale] supports a custom `<marks>` element, which can contain multiple
    `<mark\>` elements. The “value” and “position” attributes have the same
    meaning as [gtk.scale.Scale.addMark] parameters of the same name. If
    the element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # CSS nodes
    
    ```
    scale[.fine-tune][.marks-before][.marks-after]
    ├── [value][.top][.right][.bottom][.left]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── marks.bottom
    │   ├── mark
    │   ┊    ├── indicator
    │   ┊    ╰── [label]
    ┊   ┊
    │   ╰── mark
    ╰── trough
        ├── [fill]
        ├── [highlight]
        ╰── slider
    ```
    
    [gtk.scale.Scale] has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gtk.scale.Scale.setHasOrigin]), there is
    a subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gtk.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the trough
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see `property@Gtk.Scale:draw-value`),
    there is subnode with name value. This node will get the .top or .bottom style
    classes similar to the marks node.
    
    # Accessibility
    
    [gtk.scale.Scale] uses the [gtk.types.AccessibleRole.Slider] role.
*/
class Scale : gtk.range.Range
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
    return cast(void function())gtk_scale_get_type != &gidSymbolNotFound ? gtk_scale_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Scale self()
  {
    return this;
  }

  /**
      Get `digits` property.
      Returns: The number of decimal places that are displayed in the value.
  */
  @property int digits()
  {
    return getDigits();
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places that are displayed in the value.
  */
  @property void digits(int propval)
  {
    return setDigits(propval);
  }

  /**
      Get `drawValue` property.
      Returns: Whether the current value is displayed as a string next to the slider.
  */
  @property bool drawValue()
  {
    return getDrawValue();
  }

  /**
      Set `drawValue` property.
      Params:
        propval = Whether the current value is displayed as a string next to the slider.
  */
  @property void drawValue(bool propval)
  {
    return setDrawValue(propval);
  }

  /**
      Get `hasOrigin` property.
      Returns: Whether the scale has an origin.
  */
  @property bool hasOrigin()
  {
    return getHasOrigin();
  }

  /**
      Set `hasOrigin` property.
      Params:
        propval = Whether the scale has an origin.
  */
  @property void hasOrigin(bool propval)
  {
    return setHasOrigin(propval);
  }

  /**
      Get `valuePos` property.
      Returns: The position in which the current value is displayed.
  */
  @property gtk.types.PositionType valuePos()
  {
    return getValuePos();
  }

  /**
      Set `valuePos` property.
      Params:
        propval = The position in which the current value is displayed.
  */
  @property void valuePos(gtk.types.PositionType propval)
  {
    return setValuePos(propval);
  }

  /**
      Creates a new [gtk.scale.Scale].
  
      Params:
        orientation = the scale’s orientation.
        adjustment = the [gtk.adjustment.Adjustment] which sets
            the range of the scale, or null to create a new adjustment.
      Returns: a new [gtk.scale.Scale]
  */
  this(gtk.types.Orientation orientation, gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new scale widget with a range from min to max.
      
      The returns scale will have the given orientation and will let the
      user input a number between min and max (including min and max)
      with the increment step. step must be nonzero; it’s the distance
      the slider moves when using the arrow keys to adjust the scale
      value.
      
      Note that the way in which the precision is derived works best if
      step is a power of ten. If the resulting precision is not suitable
      for your needs, use [gtk.scale.Scale.setDigits] to correct it.
  
      Params:
        orientation = the scale’s orientation.
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new [gtk.scale.Scale]
  */
  static gtk.scale.Scale newWithRange(gtk.types.Orientation orientation, double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_new_with_range(orientation, min, max, step);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.scale.Scale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a mark at value.
      
      A mark is indicated visually by drawing a tick mark next to the scale,
      and GTK makes it easy for the user to position the scale exactly at the
      marks value.
      
      If markup is not null, text is shown next to the tick mark.
      
      To remove marks from a scale, use [gtk.scale.Scale.clearMarks].
  
      Params:
        value = the value at which the mark is placed, must be between
            the lower and upper limits of the scales’ adjustment
        position = where to draw the mark. For a horizontal scale, [gtk.types.PositionType.Top]
            and [gtk.types.PositionType.Left] are drawn above the scale, anything else below.
            For a vertical scale, [gtk.types.PositionType.Left] and [gtk.types.PositionType.Top] are drawn to
            the left of the scale, anything else to the right.
        markup = Text to be shown at the mark, using Pango markup
  */
  void addMark(double value, gtk.types.PositionType position, string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_scale_add_mark(cast(GtkScale*)this._cPtr, value, position, _markup);
  }

  /**
      Removes any marks that have been added.
  */
  void clearMarks()
  {
    gtk_scale_clear_marks(cast(GtkScale*)this._cPtr);
  }

  /**
      Gets the number of decimal places that are displayed in the value.
      Returns: the number of decimal places that are displayed
  */
  int getDigits()
  {
    int _retval;
    _retval = gtk_scale_get_digits(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the current value is displayed as a string
      next to the slider.
      Returns: whether the current value is displayed as a string
  */
  bool getDrawValue()
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_get_draw_value(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the scale has an origin.
      Returns: true if the scale has an origin.
  */
  bool getHasOrigin()
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_get_has_origin(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [pango.layout.Layout] used to display the scale.
      
      The returned object is owned by the scale so does not need
      to be freed by the caller.
      Returns: the [pango.layout.Layout]
          for this scale, or null if the `propertyGtk.Scale:draw-value`
          property is false.
  */
  pango.layout.Layout getLayout()
  {
    PangoLayout* _cretval;
    _cretval = gtk_scale_get_layout(cast(GtkScale*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the coordinates where the scale will draw the
      [pango.layout.Layout] representing the text in the scale.
      
      Remember when using the [pango.layout.Layout] function you need to
      convert to and from pixels using `PANGO_PIXELS()` or `PANGO_SCALE`.
      
      If the `propertyGtk.Scale:draw-value` property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout
        y = location to store Y offset of layout
  */
  void getLayoutOffsets(out int x, out int y)
  {
    gtk_scale_get_layout_offsets(cast(GtkScale*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Gets the position in which the current value is displayed.
      Returns: the position in which the current value is displayed
  */
  gtk.types.PositionType getValuePos()
  {
    GtkPositionType _cretval;
    _cretval = gtk_scale_get_value_pos(cast(GtkScale*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Sets the number of decimal places that are displayed in the value.
      
      Also causes the value of the adjustment to be rounded to this number
      of digits, so the retrieved value matches the displayed one, if
      `propertyGtk.Scale:draw-value` is true when the value changes. If
      you want to enforce rounding the value when `propertyGtk.Scale:draw-value`
      is false, you can set `propertyGtk.Range:round-digits` instead.
      
      Note that rounding to a small number of digits can interfere with
      the smooth autoscrolling that is built into [gtk.scale.Scale]. As an alternative,
      you can use [gtk.scale.Scale.setFormatValueFunc] to format the displayed
      value yourself.
  
      Params:
        digits = the number of decimal places to display,
            e.g. use 1 to display 1.0, 2 to display 1.00, etc
  */
  void setDigits(int digits)
  {
    gtk_scale_set_digits(cast(GtkScale*)this._cPtr, digits);
  }

  /**
      Specifies whether the current value is displayed as a string next
      to the slider.
  
      Params:
        drawValue = true to draw the value
  */
  void setDrawValue(bool drawValue)
  {
    gtk_scale_set_draw_value(cast(GtkScale*)this._cPtr, drawValue);
  }

  /**
      func allows you to change how the scale value is displayed.
      
      The given function will return an allocated string representing
      value. That string will then be used to display the scale's value.
      
      If #NULL is passed as func, the value will be displayed on
      its own, rounded according to the value of the
      [gtk.scale.Scale.digits] property.
  
      Params:
        func = function that formats the value
  */
  void setFormatValueFunc(gtk.types.ScaleFormatValueFunc func = null)
  {
    extern(C) char* _funcCallback(GtkScale* scale, double value, void* userData)
    {
      string _dretval;
      auto _dlg = cast(gtk.types.ScaleFormatValueFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.scale.Scale)(cast(void*)scale, No.Take), value);
      char* _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_scale_set_format_value_func(cast(GtkScale*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets whether the scale has an origin.
      
      If `propertyGtk.Scale:has-origin` is set to true (the default),
      the scale will highlight the part of the trough between the origin
      (bottom or left side) and the current value.
  
      Params:
        hasOrigin = true if the scale has an origin
  */
  void setHasOrigin(bool hasOrigin)
  {
    gtk_scale_set_has_origin(cast(GtkScale*)this._cPtr, hasOrigin);
  }

  /**
      Sets the position in which the current value is displayed.
  
      Params:
        pos = the position in which the current value is displayed
  */
  void setValuePos(gtk.types.PositionType pos)
  {
    gtk_scale_set_value_pos(cast(GtkScale*)this._cPtr, pos);
  }
}
