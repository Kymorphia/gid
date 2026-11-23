/// Module for [Style] class
module gid.gtk3.style;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.core.utils;
import gid.gdk3.color;
import gid.gdk3.types;
import gid.gdk3.window;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.icon_set;
import gid.gtk3.icon_source;
import gid.gtk3.rc_style;
import gid.gtk3.style_context;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.layout;

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
class Style : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_style_get_type != &gidSymbolNotFound ? gtk_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStyle";
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.style.Style]
      Returns: New builder object
  */
  static StyleGidBuilder builder() nothrow
  {
    return new StyleGidBuilder;
  }

  /** */
  @property gid.gtk3.style_context.StyleContext context() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.style_context.StyleContext)("context");
  }

  /**
      Creates a new #GtkStyle.
      Returns: a new #GtkStyle.
  
      Deprecated: Use #GtkStyleContext
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkStyle* _cretval;
      _cretval = gtk_style_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncCopy(gid.gtk3.style.Style src)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.copy)
      return;

    _klass.copy(cast(GtkStyle*)this._cPtr, src ? cast(GtkStyle*)src._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDrawArrow(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, gid.gtk3.types.ArrowType arrowType, bool fill, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawArrow)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawArrow(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, arrowType, fill, x, y, width, height);
  }

  /** */
  protected void vfuncDrawBox(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawBox)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawBox(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawBoxGap(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height, gid.gtk3.types.PositionType gapSide, int gapX, int gapWidth)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawBoxGap)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawBoxGap(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide, gapX, gapWidth);
  }

  /** */
  protected void vfuncDrawCheck(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawCheck)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawCheck(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawDiamond(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawDiamond)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawDiamond(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawExpander(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, int x, int y, gid.gtk3.types.ExpanderStyle expanderStyle)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawExpander)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawExpander(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, expanderStyle);
  }

  /** */
  protected void vfuncDrawExtension(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height, gid.gtk3.types.PositionType gapSide)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawExtension)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawExtension(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide);
  }

  /** */
  protected void vfuncDrawFlatBox(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawFlatBox)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawFlatBox(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawFocus(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawFocus)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawFocus(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawHandle(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height, gid.gtk3.types.Orientation orientation)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawHandle)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawHandle(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, orientation);
  }

  /** */
  protected void vfuncDrawHline(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, int x1, int x2, int y)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawHline)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawHline(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x1, x2, y);
  }

  /** */
  protected void vfuncDrawLayout(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, bool useText, gid.gtk3.widget.Widget widget, string detail, int x, int y, gid.pango1.layout.Layout layout)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawLayout)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawLayout(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, useText, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncDrawOption(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawOption)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawOption(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawResizeGrip(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, gid.gdk3.types.WindowEdge edge, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawResizeGrip)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawResizeGrip(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, edge, x, y, width, height);
  }

  /** */
  protected void vfuncDrawShadow(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawShadow)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawShadow(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawShadowGap(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height, gid.gtk3.types.PositionType gapSide, int gapX, int gapWidth)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawShadowGap)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawShadowGap(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide, gapX, gapWidth);
  }

  /** */
  protected void vfuncDrawSlider(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height, gid.gtk3.types.Orientation orientation)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawSlider)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawSlider(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, orientation);
  }

  /** */
  protected void vfuncDrawSpinner(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, uint step, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawSpinner)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawSpinner(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, step, x, y, width, height);
  }

  /** */
  protected void vfuncDrawTab(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.types.ShadowType shadowType, gid.gtk3.widget.Widget widget, string detail, int x, int y, int width, int height)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawTab)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawTab(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
  }

  /** */
  protected void vfuncDrawVline(gid.cairo1.context.Context cr, gid.gtk3.types.StateType stateType, gid.gtk3.widget.Widget widget, string detail, int y1, int y2, int x)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.drawVline)
      return;

    const(char)* _detail = detail.toCString!(No.Malloc, No.Nullable);
    _klass.drawVline(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, y1, y2, x);
  }

  /** */
  protected void vfuncInitFromRc(gid.gtk3.rc_style.RcStyle rcStyle)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.initFromRc)
      return;

    _klass.initFromRc(cast(GtkStyle*)this._cPtr, rcStyle ? cast(GtkRcStyle*)rcStyle._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncRealize()
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.realize)
      return;

    _klass.realize(cast(GtkStyle*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderIcon` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk3.global.renderIconPixbuf] instead
  */
  protected gid.gdkpixbuf2.pixbuf.Pixbuf vfuncRenderIcon(gid.gtk3.icon_source.IconSource source, gid.gtk3.types.TextDirection direction, gid.gtk3.types.StateType state, gid.gtk3.types.IconSize size, gid.gtk3.widget.Widget widget = null, string detail = null)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.renderIcon)
      return typeof(return).init;

    GdkPixbuf* _cretval;
    const(char)* _detail = detail.toCString!(No.Malloc, Yes.Nullable);
    _cretval = _klass.renderIcon(cast(GtkStyle*)this._cPtr, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null, direction, state, size, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the background of window to the background color or pixmap
      specified by style for the given state.
  
      Params:
        window = a #GdkWindow
        stateType = a state
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetBackground` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk3.style_context.StyleContext.setBackground] instead
  */
  protected void vfuncSetBackground(gid.gdk3.window.Window window, gid.gtk3.types.StateType stateType)
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.setBackground)
      return;

    _klass.setBackground(cast(GtkStyle*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, stateType);
  }

  /** */
  protected void vfuncUnrealize()
  {
    auto _klass = cast(GtkStyleClass*)_vfuncClass;
    if (!_klass.unrealize)
      return;

    _klass.unrealize(cast(GtkStyle*)this._cPtr);
  }

  /** */
  void applyDefaultBackground(gid.cairo1.context.Context cr, gid.gdk3.window.Window window, gid.gtk3.types.StateType stateType, int x, int y, int width, int height) nothrow
  {
    gtk_style_apply_default_background(cast(GtkStyle*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, stateType, x, y, width, height);
  }

  /**
      Creates a copy of the passed in #GtkStyle object.
      Returns: a copy of style
  
      Deprecated: Use #GtkStyleContext instead
  */
  gid.gtk3.style.Style copy() nothrow
  {
    GtkStyle* _cretval;
    _cretval = gtk_style_copy(cast(GtkStyle*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style.Style)(cast(GtkStyle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Detaches a style from a window. If the style is not attached
      to any windows anymore, it is unrealized. See [gid.gtk3.style.Style.attach].
  
      Deprecated: Use #GtkStyleContext instead
  */
  void detach() nothrow
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
  void getStyleProperty(gid.gobject2.types.GType widgetType, string propertyName, out gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gtk_style_get_style_property(cast(GtkStyle*)this._cPtr, widgetType, _propertyName, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Returns whether style has an associated #GtkStyleContext.
      Returns: true if style has a #GtkStyleContext
  */
  bool hasContext() nothrow
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
  
      Deprecated: Use [gid.gtk4.style_context.StyleContext.lookupColor] instead
  */
  bool lookupColor(string colorName, out gid.gdk3.color.Color color) nothrow
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_lookup_color(cast(GtkStyle*)this._cPtr, _colorName, cast(GdkColor*)&color);
    return _retval;
  }

  /**
      Looks up stock_id in the icon factories associated with style
      and the default icon factory, returning an icon set if found,
      otherwise null.
  
      Params:
        stockId = an icon name
      Returns: icon set of stock_id
  
      Deprecated: Use [gid.gtk3.style_context.StyleContext.lookupIconSet] instead
  */
  gid.gtk3.icon_set.IconSet lookupIconSet(string stockId) nothrow
  {
    GtkIconSet* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_style_lookup_icon_set(cast(GtkStyle*)this._cPtr, _stockId);
    auto _retval = _cretval ? new gid.gtk3.icon_set.IconSet(cast(void*)_cretval, No.Take) : null;
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
  
      Deprecated: Use [gid.gtk3.global.renderIconPixbuf] instead
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf renderIcon(gid.gtk3.icon_source.IconSource source, gid.gtk3.types.TextDirection direction, gid.gtk3.types.StateType state, gid.gtk3.types.IconSize size, gid.gtk3.widget.Widget widget = null, string detail = null) nothrow
  {
    GdkPixbuf* _cretval;
    const(char)* _detail = detail.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_style_render_icon(cast(GtkStyle*)this._cPtr, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null, direction, state, size, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the background of window to the background color or pixmap
      specified by style for the given state.
  
      Params:
        window = a #GdkWindow
        stateType = a state
  
      Deprecated: Use [gid.gtk3.style_context.StyleContext.setBackground] instead
  */
  void setBackground(gid.gdk3.window.Window window, gid.gtk3.types.StateType stateType) nothrow
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
  
          `void callback(gid.gtk3.style.Style style)`
  
          `style` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.style.Style)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.realize");
      }
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
  
          `void callback(gid.gtk3.style.Style style)`
  
          `style` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnrealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.style.Style)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.unrealize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unrealize", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Style
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.style.Style), T.stringof ~ " is not derived from gid.gtk3.style.Style");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopy", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "copy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawArrow", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_arrow");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawBox", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_box");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawBoxGap", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_box_gap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawCheck", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_check");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawDiamond", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_diamond");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawExpander", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_expander");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawExtension", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_extension");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawFlatBox", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_flat_box");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawFocus", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawHandle", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawHline", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_hline");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawLayout", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_layout");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawOption", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_option");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawResizeGrip", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_resize_grip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawShadow", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_shadow");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawShadowGap", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_shadow_gap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawSlider", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_slider");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawSpinner", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_spinner");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawTab", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_tab");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawVline", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "draw_vline");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInitFromRc", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "init_from_rc");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRealize", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "realize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderIcon", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "render_icon");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetBackground", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "set_background");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnrealize", true)[0]) == gid.gtk3.style.Style))
      _installVfunc(klass, "unrealize");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkStyleClass*)klass;

    switch (vfunc)
    {
      case "copy":
      {
        static extern(C) void _vfuncCopyTramp(GtkStyle* style, GtkStyle* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.copy)
              return (cast(typeof(&_vfuncCopyTramp))_klass.copy)(style, src);
            return;
          }

          try
          {
            _obj.vfuncCopy(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style.Style)(cast(void*)src, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncCopy");
          }
        }

        _klass.copy = cast(typeof(_klass.copy))&_vfuncCopyTramp;
        break;
      }
      case "draw_arrow":
      {
        static extern(C) void _vfuncDrawArrowTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, GtkArrowType arrowType, gboolean fill, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawArrow)
              return (cast(typeof(&_vfuncDrawArrowTramp))_klass.drawArrow)(style, cr, stateType, shadowType, widget, detail, arrowType, fill, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawArrow(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, arrowType, cast(bool)fill, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawArrow");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawArrow = cast(typeof(_klass.drawArrow))&_vfuncDrawArrowTramp;
        break;
      }
      case "draw_box":
      {
        static extern(C) void _vfuncDrawBoxTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawBox)
              return (cast(typeof(&_vfuncDrawBoxTramp))_klass.drawBox)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawBox(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawBox");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawBox = cast(typeof(_klass.drawBox))&_vfuncDrawBoxTramp;
        break;
      }
      case "draw_box_gap":
      {
        static extern(C) void _vfuncDrawBoxGapTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide, int gapX, int gapWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawBoxGap)
              return (cast(typeof(&_vfuncDrawBoxGapTramp))_klass.drawBoxGap)(style, cr, stateType, shadowType, widget, detail, x, y, width, height, gapSide, gapX, gapWidth);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawBoxGap(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height, gapSide, gapX, gapWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawBoxGap");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawBoxGap = cast(typeof(_klass.drawBoxGap))&_vfuncDrawBoxGapTramp;
        break;
      }
      case "draw_check":
      {
        static extern(C) void _vfuncDrawCheckTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawCheck)
              return (cast(typeof(&_vfuncDrawCheckTramp))_klass.drawCheck)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawCheck(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawCheck");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawCheck = cast(typeof(_klass.drawCheck))&_vfuncDrawCheckTramp;
        break;
      }
      case "draw_diamond":
      {
        static extern(C) void _vfuncDrawDiamondTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawDiamond)
              return (cast(typeof(&_vfuncDrawDiamondTramp))_klass.drawDiamond)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawDiamond(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawDiamond");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawDiamond = cast(typeof(_klass.drawDiamond))&_vfuncDrawDiamondTramp;
        break;
      }
      case "draw_expander":
      {
        static extern(C) void _vfuncDrawExpanderTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x, int y, GtkExpanderStyle expanderStyle) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawExpander)
              return (cast(typeof(&_vfuncDrawExpanderTramp))_klass.drawExpander)(style, cr, stateType, widget, detail, x, y, expanderStyle);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawExpander(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, expanderStyle);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawExpander");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawExpander = cast(typeof(_klass.drawExpander))&_vfuncDrawExpanderTramp;
        break;
      }
      case "draw_extension":
      {
        static extern(C) void _vfuncDrawExtensionTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawExtension)
              return (cast(typeof(&_vfuncDrawExtensionTramp))_klass.drawExtension)(style, cr, stateType, shadowType, widget, detail, x, y, width, height, gapSide);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawExtension(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height, gapSide);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawExtension");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawExtension = cast(typeof(_klass.drawExtension))&_vfuncDrawExtensionTramp;
        break;
      }
      case "draw_flat_box":
      {
        static extern(C) void _vfuncDrawFlatBoxTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawFlatBox)
              return (cast(typeof(&_vfuncDrawFlatBoxTramp))_klass.drawFlatBox)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawFlatBox(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawFlatBox");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawFlatBox = cast(typeof(_klass.drawFlatBox))&_vfuncDrawFlatBoxTramp;
        break;
      }
      case "draw_focus":
      {
        static extern(C) void _vfuncDrawFocusTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawFocus)
              return (cast(typeof(&_vfuncDrawFocusTramp))_klass.drawFocus)(style, cr, stateType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawFocus(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawFocus");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawFocus = cast(typeof(_klass.drawFocus))&_vfuncDrawFocusTramp;
        break;
      }
      case "draw_handle":
      {
        static extern(C) void _vfuncDrawHandleTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkOrientation orientation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawHandle)
              return (cast(typeof(&_vfuncDrawHandleTramp))_klass.drawHandle)(style, cr, stateType, shadowType, widget, detail, x, y, width, height, orientation);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawHandle(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height, orientation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawHandle");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawHandle = cast(typeof(_klass.drawHandle))&_vfuncDrawHandleTramp;
        break;
      }
      case "draw_hline":
      {
        static extern(C) void _vfuncDrawHlineTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x1, int x2, int y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawHline)
              return (cast(typeof(&_vfuncDrawHlineTramp))_klass.drawHline)(style, cr, stateType, widget, detail, x1, x2, y);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawHline(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x1, x2, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawHline");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawHline = cast(typeof(_klass.drawHline))&_vfuncDrawHlineTramp;
        break;
      }
      case "draw_layout":
      {
        static extern(C) void _vfuncDrawLayoutTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, gboolean useText, GtkWidget* widget, const(char)* detail, int x, int y, PangoLayout* layout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawLayout)
              return (cast(typeof(&_vfuncDrawLayoutTramp))_klass.drawLayout)(style, cr, stateType, useText, widget, detail, x, y, layout);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawLayout(_cr, stateType, cast(bool)useText, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(void*)layout, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawLayout");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawLayout = cast(typeof(_klass.drawLayout))&_vfuncDrawLayoutTramp;
        break;
      }
      case "draw_option":
      {
        static extern(C) void _vfuncDrawOptionTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawOption)
              return (cast(typeof(&_vfuncDrawOptionTramp))_klass.drawOption)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawOption(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawOption");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawOption = cast(typeof(_klass.drawOption))&_vfuncDrawOptionTramp;
        break;
      }
      case "draw_resize_grip":
      {
        static extern(C) void _vfuncDrawResizeGripTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, GdkWindowEdge edge, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawResizeGrip)
              return (cast(typeof(&_vfuncDrawResizeGripTramp))_klass.drawResizeGrip)(style, cr, stateType, widget, detail, edge, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawResizeGrip(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, edge, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawResizeGrip");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawResizeGrip = cast(typeof(_klass.drawResizeGrip))&_vfuncDrawResizeGripTramp;
        break;
      }
      case "draw_shadow":
      {
        static extern(C) void _vfuncDrawShadowTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawShadow)
              return (cast(typeof(&_vfuncDrawShadowTramp))_klass.drawShadow)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawShadow(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawShadow");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawShadow = cast(typeof(_klass.drawShadow))&_vfuncDrawShadowTramp;
        break;
      }
      case "draw_shadow_gap":
      {
        static extern(C) void _vfuncDrawShadowGapTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide, int gapX, int gapWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawShadowGap)
              return (cast(typeof(&_vfuncDrawShadowGapTramp))_klass.drawShadowGap)(style, cr, stateType, shadowType, widget, detail, x, y, width, height, gapSide, gapX, gapWidth);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawShadowGap(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height, gapSide, gapX, gapWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawShadowGap");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawShadowGap = cast(typeof(_klass.drawShadowGap))&_vfuncDrawShadowGapTramp;
        break;
      }
      case "draw_slider":
      {
        static extern(C) void _vfuncDrawSliderTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkOrientation orientation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawSlider)
              return (cast(typeof(&_vfuncDrawSliderTramp))_klass.drawSlider)(style, cr, stateType, shadowType, widget, detail, x, y, width, height, orientation);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawSlider(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height, orientation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawSlider");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawSlider = cast(typeof(_klass.drawSlider))&_vfuncDrawSliderTramp;
        break;
      }
      case "draw_spinner":
      {
        static extern(C) void _vfuncDrawSpinnerTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, uint step, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawSpinner)
              return (cast(typeof(&_vfuncDrawSpinnerTramp))_klass.drawSpinner)(style, cr, stateType, widget, detail, step, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawSpinner(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, step, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawSpinner");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawSpinner = cast(typeof(_klass.drawSpinner))&_vfuncDrawSpinnerTramp;
        break;
      }
      case "draw_tab":
      {
        static extern(C) void _vfuncDrawTabTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawTab)
              return (cast(typeof(&_vfuncDrawTabTramp))_klass.drawTab)(style, cr, stateType, shadowType, widget, detail, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawTab(_cr, stateType, shadowType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawTab");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawTab = cast(typeof(_klass.drawTab))&_vfuncDrawTabTramp;
        break;
      }
      case "draw_vline":
      {
        static extern(C) void _vfuncDrawVlineTramp(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int y1, int y2, int x) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.drawVline)
              return (cast(typeof(&_vfuncDrawVlineTramp))_klass.drawVline)(style, cr, stateType, widget, detail, y1, y2, x);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _obj.vfuncDrawVline(_cr, stateType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail, y1, y2, x);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncDrawVline");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawVline = cast(typeof(_klass.drawVline))&_vfuncDrawVlineTramp;
        break;
      }
      case "init_from_rc":
      {
        static extern(C) void _vfuncInitFromRcTramp(GtkStyle* style, GtkRcStyle* rcStyle) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.initFromRc)
              return (cast(typeof(&_vfuncInitFromRcTramp))_klass.initFromRc)(style, rcStyle);
            return;
          }

          try
          {
            _obj.vfuncInitFromRc(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.rc_style.RcStyle)(cast(void*)rcStyle, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncInitFromRc");
          }
        }

        _klass.initFromRc = cast(typeof(_klass.initFromRc))&_vfuncInitFromRcTramp;
        break;
      }
      case "realize":
      {
        static extern(C) void _vfuncRealizeTramp(GtkStyle* style) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.realize)
              return (cast(typeof(&_vfuncRealizeTramp))_klass.realize)(style);
            return;
          }

          try
          {
            _obj.vfuncRealize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncRealize");
          }
        }

        _klass.realize = cast(typeof(_klass.realize))&_vfuncRealizeTramp;
        break;
      }
      case "render_icon":
      {
        static extern(C) GdkPixbuf* _vfuncRenderIconTramp(GtkStyle* style, const(GtkIconSource)* source, GtkTextDirection direction, GtkStateType state, GtkIconSize size, GtkWidget* widget, const(char)* detail) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.renderIcon)
              return (cast(typeof(&_vfuncRenderIconTramp))_klass.renderIcon)(style, source, direction, state, size, widget, detail);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf.Pixbuf _dretval;
          string _detail = detail.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncRenderIcon(source ? new gid.gtk3.icon_source.IconSource(cast(void*)source, No.Take) : null, direction, state, size, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _detail);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncRenderIcon");
          }
          auto _retval = _dretval ? cast(GdkPixbuf*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.renderIcon = cast(typeof(_klass.renderIcon))&_vfuncRenderIconTramp;
        break;
      }
      case "set_background":
      {
        static extern(C) void _vfuncSetBackgroundTramp(GtkStyle* style, GdkWindow* window, GtkStateType stateType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.setBackground)
              return (cast(typeof(&_vfuncSetBackgroundTramp))_klass.setBackground)(style, window, stateType);
            return;
          }

          try
          {
            _obj.vfuncSetBackground(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(void*)window, No.Take), stateType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncSetBackground");
          }
        }

        _klass.setBackground = cast(typeof(_klass.setBackground))&_vfuncSetBackgroundTramp;
        break;
      }
      case "unrealize":
      {
        static extern(C) void _vfuncUnrealizeTramp(GtkStyle* style) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.style.Style)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)style);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)style);
            if (_klass.unrealize)
              return (cast(typeof(&_vfuncUnrealizeTramp))_klass.unrealize)(style);
            return;
          }

          try
          {
            _obj.vfuncUnrealize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style.Style.vfuncUnrealize");
          }
        }

        _klass.unrealize = cast(typeof(_klass.unrealize))&_vfuncUnrealizeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.style.Style]
class StyleGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T context(gid.gtk3.style_context.StyleContext propval) nothrow
  {
    return setProperty("context", propval);
  }
}

/// Fluent builder for [gid.gtk3.style.Style]
final class StyleGidBuilder : StyleGidBuilderImpl!StyleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Style build() nothrow
  {
    return new Style(cast(void*)createGObject(Style._getGType), Yes.Take);
  }
}
