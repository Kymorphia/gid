/// Module for [Style] class
module gtk.style;

import cairo.context;
import gdk.color;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_set;
import gtk.icon_source;
import gtk.types;
import gtk.widget;

/**
    A #GtkStyle object encapsulates the information that provides the look and
    feel for a widget.
    
    > In GTK+ 3.0, GtkStyle has been deprecated and replaced by
    > #GtkStyleContext.
    
    Each #GtkWidget has an associated #GtkStyle object that is used when
    rendering that widget. Also, a #GtkStyle holds information for the five
    possible widget states though not every widget supports all five
    states; see #GtkStateType.
    
    Usually the #GtkStyle for a widget is the same as the default style that
    is set by GTK+ and modified the theme engine.
    
    Usually applications should not need to use or modify the #GtkStyle of
    their widgets.
*/
class Style : gobject.object.ObjectWrap
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
    return cast(void function())gtk_style_get_type != &gidSymbolNotFound ? gtk_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self()
  {
    return this;
  }

  /**
      Creates a new #GtkStyle.
      Returns: a new #GtkStyle.
  
      Deprecated: Use #GtkStyleContext
  */
  this()
  {
    GtkStyle* _cretval;
    _cretval = gtk_style_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void applyDefaultBackground(cairo.context.Context cr, gdk.window.Window window, gtk.types.StateType stateType, int x, int y, int width, int height)
  {
    gtk_style_apply_default_background(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, stateType, x, y, width, height);
  }

  /**
      Creates a copy of the passed in #GtkStyle object.
      Returns: a copy of style
  
      Deprecated: Use #GtkStyleContext instead
  */
  gtk.style.Style copy()
  {
    GtkStyle* _cretval;
    _cretval = gtk_style_copy(cast(GtkStyle*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style.Style)(cast(GtkStyle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Detaches a style from a window. If the style is not attached
      to any windows anymore, it is unrealized. See [gtk.style.Style.attach].
  
      Deprecated: Use #GtkStyleContext instead
  */
  void detach()
  {
    gtk_style_detach(cast(GtkStyle*)this._cPtr);
  }

  /**
      Queries the value of a style property corresponding to a
      widget class is in the given style.
  
      Params:
        widgetType = the #GType of a descendant of #GtkWidget
        propertyName = the name of the style property to get
        value = a #GValue where the value of the property being
              queried will be stored
  */
  void getStyleProperty(gobject.types.GType widgetType, string propertyName, out gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    GValue _value;
    gtk_style_get_style_property(cast(GtkStyle*)this._cPtr, widgetType, _propertyName, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Returns whether style has an associated #GtkStyleContext.
      Returns: true if style has a #GtkStyleContext
  */
  bool hasContext()
  {
    bool _retval;
    _retval = cast(bool)gtk_style_has_context(cast(GtkStyle*)this._cPtr);
    return _retval;
  }

  /**
      Looks up color_name in the style’s logical color mappings,
      filling in color and returning true if found, otherwise
      returning false. Do not cache the found mapping, because
      it depends on the #GtkStyle and might change when a theme
      switch occurs.
  
      Params:
        colorName = the name of the logical color to look up
        color = the #GdkColor to fill in
      Returns: true if the mapping was found.
  
      Deprecated: Use [gtk.style_context.StyleContext.lookupColor] instead
  */
  bool lookupColor(string colorName, out gdk.color.Color color)
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString(No.Alloc);
    GdkColor _color;
    _retval = cast(bool)gtk_style_lookup_color(cast(GtkStyle*)this._cPtr, _colorName, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
    return _retval;
  }

  /**
      Looks up stock_id in the icon factories associated with style
      and the default icon factory, returning an icon set if found,
      otherwise null.
  
      Params:
        stockId = an icon name
      Returns: icon set of stock_id
  
      Deprecated: Use [gtk.style_context.StyleContext.lookupIconSet] instead
  */
  gtk.icon_set.IconSet lookupIconSet(string stockId)
  {
    GtkIconSet* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_style_lookup_icon_set(cast(GtkStyle*)this._cPtr, _stockId);
    auto _retval = _cretval ? new gtk.icon_set.IconSet(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Renders the icon specified by source at the given size
      according to the given parameters and returns the result in a
      pixbuf.
  
      Params:
        source = the #GtkIconSource specifying the icon to render
        direction = a text direction
        state = a state
        size = the size to render the icon at (#GtkIconSize). A size of
              `(GtkIconSize)-1` means render at the size of the source and
              don’t scale.
        widget = the widget
        detail = a style detail
      Returns: a newly-created #GdkPixbuf
            containing the rendered icon
  
      Deprecated: Use [gtk.global.renderIconPixbuf] instead
  */
  gdkpixbuf.pixbuf.Pixbuf renderIcon(gtk.icon_source.IconSource source, gtk.types.TextDirection direction, gtk.types.StateType state, gtk.types.IconSize size, gtk.widget.Widget widget = null, string detail = null)
  {
    GdkPixbuf* _cretval;
    const(char)* _detail = detail.toCString(No.Alloc);
    _cretval = gtk_style_render_icon(cast(GtkStyle*)this._cPtr, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null, direction, state, size, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the background of window to the background color or pixmap
      specified by style for the given state.
  
      Params:
        window = a #GdkWindow
        stateType = a state
  
      Deprecated: Use [gtk.style_context.StyleContext.setBackground] instead
  */
  void setBackground(gdk.window.Window window, gtk.types.StateType stateType)
  {
    gtk_style_set_background(cast(GtkStyle*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, stateType);
  }

  /**
      Connect to `Realize` signal.
  
      Emitted when the style has been initialized for a particular
      visual. Connecting to this signal is probably seldom
      useful since most of the time applications and widgets only
      deal with styles that have been already realized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.style.Style style))
  
          `style` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRealize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.style.Style)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("realize", closure, after);
  }

  /**
      Connect to `Unrealize` signal.
  
      Emitted when the aspects of the style specific to a particular visual
      is being cleaned up. A connection to this signal can be useful
      if a widget wants to cache objects as object data on #GtkStyle.
      This signal provides a convenient place to free such cached objects.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.style.Style style))
  
          `style` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnrealize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.style.Style)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unrealize", closure, after);
  }
}
