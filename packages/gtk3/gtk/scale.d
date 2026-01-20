/// Module for [Scale] class
module gtk.scale;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.range;
import gtk.types;
import pango.layout;

/**
    A GtkScale is a slider control used to select a numeric value.
    To use it, you’ll probably want to investigate the methods on
    its base class, #GtkRange, in addition to the methods for GtkScale itself.
    To set the value of a scale, you would normally use [gtk.range.Range.setValue].
    To detect changes to the value, you would normally use the
    #GtkRange::value-changed signal.
    
    Note that using the same upper and lower bounds for the #GtkScale (through
    the #GtkRange methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    GtkScale supports a custom `<marks>` element, which can contain multiple
    `<mark>` elements. The “value” and “position” attributes have the same
    meaning as [gtk.scale.Scale.addMark] parameters of the same name. If the
    element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # CSS nodes
    
    ```plain
    scale[.fine-tune][.marks-before][.marks-after]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── [value]
    ├── contents
    │   ╰── trough
    │       ├── slider
    │       ├── [highlight]
    │       ╰── [fill]
    ╰── marks.bottom
        ├── mark
        ┊    ├── indicator
        ┊    ╰── [label]
        ╰── mark
    ```
    
    GtkScale has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gtk.scale.Scale.setHasOrigin]), there is a
    subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gtk.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the contents
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see #GtkScale:draw-value), there is
    subnode with name value.
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

  /** */
  @property int digits()
  {
    return getDigits();
  }

  /** */
  @property void digits(int propval)
  {
    return setDigits(propval);
  }

  /** */
  @property bool drawValue()
  {
    return getDrawValue();
  }

  /** */
  @property void drawValue(bool propval)
  {
    return setDrawValue(propval);
  }

  /** */
  @property bool hasOrigin()
  {
    return getHasOrigin();
  }

  /** */
  @property void hasOrigin(bool propval)
  {
    return setHasOrigin(propval);
  }

  /** */
  @property gtk.types.PositionType valuePos()
  {
    return getValuePos();
  }

  /** */
  @property void valuePos(gtk.types.PositionType propval)
  {
    return setValuePos(propval);
  }

  /**
      Creates a new #GtkScale.
  
      Params:
        orientation = the scale’s orientation.
        adjustment = the #GtkAdjustment which sets the range
                       of the scale, or null to create a new adjustment.
      Returns: a new #GtkScale
  */
  this(gtk.types.Orientation orientation, gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a new scale widget with the given orientation that lets the
      user input a number between min and max (including min and max)
      with the increment step.  step must be nonzero; it’s the distance
      the slider moves when using the arrow keys to adjust the scale
      value.
      
      Note that the way in which the precision is derived works best if step
      is a power of ten. If the resulting precision is not suitable for your
      needs, use [gtk.scale.Scale.setDigits] to correct it.
  
      Params:
        orientation = the scale’s orientation.
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new #GtkScale
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
      and GTK+ makes it easy for the user to position the scale exactly at the
      marks value.
      
      If markup is not null, text is shown next to the tick mark.
      
      To remove marks from a scale, use [gtk.scale.Scale.clearMarks].
  
      Params:
        value = the value at which the mark is placed, must be between
            the lower and upper limits of the scales’ adjustment
        position = where to draw the mark. For a horizontal scale, #GTK_POS_TOP
            and [gtk.types.PositionType.Left] are drawn above the scale, anything else below.
            For a vertical scale, #GTK_POS_LEFT and [gtk.types.PositionType.Top] are drawn to
            the left of the scale, anything else to the right.
        markup = Text to be shown at the mark, using [Pango markup][PangoMarkupFormat], or null
  */
  void addMark(double value, gtk.types.PositionType position, string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_scale_add_mark(cast(GtkScale*)this._cPtr, value, position, _markup);
  }

  /**
      Removes any marks that have been added with [gtk.scale.Scale.addMark].
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
      Gets the #PangoLayout used to display the scale. The returned
      object is owned by the scale so does not need to be freed by
      the caller.
      Returns: the #PangoLayout for this scale,
            or null if the #GtkScale:draw-value property is false.
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
      #PangoLayout representing the text in the scale. Remember
      when using the #PangoLayout function you need to convert to
      and from pixels using PANGO_PIXELS() or #PANGO_SCALE.
      
      If the #GtkScale:draw-value property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
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
      Sets the number of decimal places that are displayed in the value. Also
      causes the value of the adjustment to be rounded to this number of digits,
      so the retrieved value matches the displayed one, if #GtkScale:draw-value is
      true when the value changes. If you want to enforce rounding the value when
      #GtkScale:draw-value is false, you can set #GtkRange:round-digits instead.
      
      Note that rounding to a small number of digits can interfere with
      the smooth autoscrolling that is built into #GtkScale. As an alternative,
      you can use the #GtkScale::format-value signal to format the displayed
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
      If #GtkScale:has-origin is set to true (the default), the scale will
      highlight the part of the trough between the origin (bottom or left side)
      and the current value.
  
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

  /**
      Connect to `FormatValue` signal.
  
      Signal which allows you to change how the scale value is displayed.
        Connect a signal handler which returns an allocated string representing
        value. That string will then be used to display the scale's value.
        
        If no user-provided handlers are installed, the value will be displayed on
        its own, rounded according to the value of the #GtkScale:digits property.
        
        Here's an example signal handler which displays a value 1.0 as
        with "-->1.0<--".
        ```c
        static gchar*
        format_value_callback (GtkScale *scale,
                               gdouble   value)
        {
          return g_strdup_printf ("-->\%0.*g<--",
                                  gtk_scale_get_digits (scale), value);
         }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D string callback(double value, gtk.scale.Scale scale))
  
          `value` the value to format (optional)
  
          `scale` the instance the signal is connected to (optional)
  
          `Returns` allocated string representing value
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFormatValue(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.scale.Scale)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-value", closure, after);
  }
}
