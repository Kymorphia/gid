/// Module for [LevelBar] class
module gtk.level_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    The #GtkLevelBar is a bar widget that can be used
    as a level indicator. Typical use cases are displaying the strength
    of a password, or showing the charge level of a battery.
    
    Use [gtk.level_bar.LevelBar.setValue] to set the current value, and
    [gtk.level_bar.LevelBar.addOffsetValue] to set the value offsets at which
    the bar will be considered in a different state. GTK will add a few
    offsets by default on the level bar: #GTK_LEVEL_BAR_OFFSET_LOW,
    #GTK_LEVEL_BAR_OFFSET_HIGH and #GTK_LEVEL_BAR_OFFSET_FULL, with
    values 0.25, 0.75 and 1.0 respectively.
    
    Note that it is your responsibility to update preexisting offsets
    when changing the minimum or maximum value. GTK+ will simply clamp
    them to the new range.
    
    ## Adding a custom offset on the bar
    
    ```c
    
    static GtkWidget *
    create_level_bar (void)
    {
      GtkWidget *widget;
      GtkLevelBar *bar;
    
      widget = gtk_level_bar_new ();
      bar = GTK_LEVEL_BAR (widget);
    
      // This changes the value of the default low offset
    
      gtk_level_bar_add_offset_value (bar,
                                      GTK_LEVEL_BAR_OFFSET_LOW,
                                      0.10);
    
      // This adds a new offset to the bar; the application will
      // be able to change its color CSS like this:
      //
      // levelbar block.my-offset {
      //   background-color: magenta;
      //   border-style: solid;
      //   border-color: black;
      //   border-style: 1px;
      // }
    
      gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
    
      return widget;
    }
    ```
    
    The default interval of values is between zero and one, but it’s possible to
    modify the interval using [gtk.level_bar.LevelBar.setMinValue] and
    [gtk.level_bar.LevelBar.setMaxValue]. The value will be always drawn in proportion to
    the admissible interval, i.e. a value of 15 with a specified interval between
    10 and 20 is equivalent to a value of 0.5 with an interval between 0 and 1.
    When #GTK_LEVEL_BAR_MODE_DISCRETE is used, the bar level is rendered
    as a finite number of separated blocks instead of a single one. The number
    of blocks that will be rendered is equal to the number of units specified by
    the admissible interval.
    
    For instance, to build a bar rendered with five blocks, it’s sufficient to
    set the minimum value to 0 and the maximum value to 5 after changing the indicator
    mode to discrete.
    
    GtkLevelBar was introduced in GTK+ 3.6.
    
    # GtkLevelBar as GtkBuildable
    
    The GtkLevelBar implementation of the GtkBuildable interface supports a
    custom `<offsets>` element, which can contain any number of `<offset>` elements,
    each of which must have "name" and "value" attributes.
    
    # CSS nodes
    
    ```plain
    levelbar[.discrete]
    ╰── trough
        ├── block.filled.level-name
        ┊
        ├── block.empty
        ┊
    ```
    
    GtkLevelBar has a main CSS node with name levelbar and one of the style
    classes .discrete or .continuous and a subnode with name trough. Below the
    trough node are a number of nodes with name block and style class .filled
    or .empty. In continuous mode, there is exactly one node of each, in discrete
    mode, the number of filled and unfilled nodes corresponds to blocks that are
    drawn. The block.filled nodes also get a style class .level-name corresponding
    to the level for the current value.
    
    In horizontal orientation, the nodes are always arranged from left to right,
    regardless of text direction.
*/
class LevelBar : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_level_bar_get_type != &gidSymbolNotFound ? gtk_level_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LevelBar self()
  {
    return this;
  }

  /**
      Get `inverted` property.
      Returns: Level bars normally grow from top to bottom or left to right.
      Inverted level bars grow in the opposite direction.
  */
  @property bool inverted()
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Level bars normally grow from top to bottom or left to right.
        Inverted level bars grow in the opposite direction.
  */
  @property void inverted(bool propval)
  {
    return setInverted(propval);
  }

  /**
      Get `maxValue` property.
      Returns: The #GtkLevelBar:max-value property determaxes the maximum value of
      the interval that can be displayed by the bar.
  */
  @property double maxValue()
  {
    return getMaxValue();
  }

  /**
      Set `maxValue` property.
      Params:
        propval = The #GtkLevelBar:max-value property determaxes the maximum value of
        the interval that can be displayed by the bar.
  */
  @property void maxValue(double propval)
  {
    return setMaxValue(propval);
  }

  /**
      Get `minValue` property.
      Returns: The #GtkLevelBar:min-value property determines the minimum value of
      the interval that can be displayed by the bar.
  */
  @property double minValue()
  {
    return getMinValue();
  }

  /**
      Set `minValue` property.
      Params:
        propval = The #GtkLevelBar:min-value property determines the minimum value of
        the interval that can be displayed by the bar.
  */
  @property void minValue(double propval)
  {
    return setMinValue(propval);
  }

  /**
      Get `mode` property.
      Returns: The #GtkLevelBar:mode property determines the way #GtkLevelBar
      interprets the value properties to draw the level fill area.
      Specifically, when the value is #GTK_LEVEL_BAR_MODE_CONTINUOUS,
      #GtkLevelBar will draw a single block representing the current value in
      that area; when the value is #GTK_LEVEL_BAR_MODE_DISCRETE,
      the widget will draw a succession of separate blocks filling the
      draw area, with the number of blocks being equal to the units separating
      the integral roundings of #GtkLevelBar:min-value and #GtkLevelBar:max-value.
  */
  @property gtk.types.LevelBarMode mode()
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = The #GtkLevelBar:mode property determines the way #GtkLevelBar
        interprets the value properties to draw the level fill area.
        Specifically, when the value is #GTK_LEVEL_BAR_MODE_CONTINUOUS,
        #GtkLevelBar will draw a single block representing the current value in
        that area; when the value is #GTK_LEVEL_BAR_MODE_DISCRETE,
        the widget will draw a succession of separate blocks filling the
        draw area, with the number of blocks being equal to the units separating
        the integral roundings of #GtkLevelBar:min-value and #GtkLevelBar:max-value.
  */
  @property void mode(gtk.types.LevelBarMode propval)
  {
    return setMode(propval);
  }

  /**
      Get `value` property.
      Returns: The #GtkLevelBar:value property determines the currently
      filled value of the level bar.
  */
  @property double value()
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = The #GtkLevelBar:value property determines the currently
        filled value of the level bar.
  */
  @property void value(double propval)
  {
    return setValue(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkLevelBar.
      Returns: a #GtkLevelBar.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_level_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Utility constructor that creates a new #GtkLevelBar for the specified
      interval.
  
      Params:
        minValue = a positive value
        maxValue = a positive value
      Returns: a #GtkLevelBar
  */
  static gtk.level_bar.LevelBar newForInterval(double minValue, double maxValue)
  {
    GtkWidget* _cretval;
    _cretval = gtk_level_bar_new_for_interval(minValue, maxValue);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.level_bar.LevelBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a new offset marker on self at the position specified by value.
      When the bar value is in the interval topped by value (or between value
      and #GtkLevelBar:max-value in case the offset is the last one on the bar)
      a style class named `level-`name will be applied
      when rendering the level bar fill.
      If another offset marker named name exists, its value will be
      replaced by value.
  
      Params:
        name = the name of the new offset
        value = the value for the new offset
  */
  void addOffsetValue(string name, double value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_level_bar_add_offset_value(cast(GtkLevelBar*)this._cPtr, _name, value);
  }

  /**
      Return the value of the #GtkLevelBar:inverted property.
      Returns: true if the level bar is inverted
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)gtk_level_bar_get_inverted(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the #GtkLevelBar:max-value property.
      Returns: a positive value
  */
  double getMaxValue()
  {
    double _retval;
    _retval = gtk_level_bar_get_max_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the #GtkLevelBar:min-value property.
      Returns: a positive value
  */
  double getMinValue()
  {
    double _retval;
    _retval = gtk_level_bar_get_min_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the #GtkLevelBar:mode property.
      Returns: a #GtkLevelBarMode
  */
  gtk.types.LevelBarMode getMode()
  {
    GtkLevelBarMode _cretval;
    _cretval = gtk_level_bar_get_mode(cast(GtkLevelBar*)this._cPtr);
    gtk.types.LevelBarMode _retval = cast(gtk.types.LevelBarMode)_cretval;
    return _retval;
  }

  /**
      Fetches the value specified for the offset marker name in self,
      returning true in case an offset named name was found.
  
      Params:
        name = the name of an offset in the bar
        value = location where to store the value
      Returns: true if the specified offset is found
  */
  bool getOffsetValue(string name, out double value)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gtk_level_bar_get_offset_value(cast(GtkLevelBar*)this._cPtr, _name, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the value of the #GtkLevelBar:value property.
      Returns: a value in the interval between
            #GtkLevelBar:min-value and #GtkLevelBar:max-value
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_level_bar_get_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Removes an offset marker previously added with
      [gtk.level_bar.LevelBar.addOffsetValue].
  
      Params:
        name = the name of an offset in the bar
  */
  void removeOffsetValue(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_level_bar_remove_offset_value(cast(GtkLevelBar*)this._cPtr, _name);
  }

  /**
      Sets the value of the #GtkLevelBar:inverted property.
  
      Params:
        inverted = true to invert the level bar
  */
  void setInverted(bool inverted)
  {
    gtk_level_bar_set_inverted(cast(GtkLevelBar*)this._cPtr, inverted);
  }

  /**
      Sets the value of the #GtkLevelBar:max-value property.
      
      You probably want to update preexisting level offsets after calling
      this function.
  
      Params:
        value = a positive value
  */
  void setMaxValue(double value)
  {
    gtk_level_bar_set_max_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Sets the value of the #GtkLevelBar:min-value property.
      
      You probably want to update preexisting level offsets after calling
      this function.
  
      Params:
        value = a positive value
  */
  void setMinValue(double value)
  {
    gtk_level_bar_set_min_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Sets the value of the #GtkLevelBar:mode property.
  
      Params:
        mode = a #GtkLevelBarMode
  */
  void setMode(gtk.types.LevelBarMode mode)
  {
    gtk_level_bar_set_mode(cast(GtkLevelBar*)this._cPtr, mode);
  }

  /**
      Sets the value of the #GtkLevelBar:value property.
  
      Params:
        value = a value in the interval between
              #GtkLevelBar:min-value and #GtkLevelBar:max-value
  */
  void setValue(double value)
  {
    gtk_level_bar_set_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Connect to `OffsetChanged` signal.
  
      Emitted when an offset specified on the bar changes value as an
      effect to [gtk.level_bar.LevelBar.addOffsetValue] being called.
      
      The signal supports detailed connections; you can connect to the
      detailed signal "changed::x" in order to only receive callbacks when
      the value of offset "x" changes.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string name, gtk.level_bar.LevelBar levelBar))
  
          `name` the name of the offset that changed value (optional)
  
          `levelBar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOffsetChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.level_bar.LevelBar)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("offset-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
