/// Module for [Gradient] class
module gid.gtk3.gradient;

public import gid.core.basictypes;
import gid.cairo1.pattern;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.style_context;
import gid.gtk3.style_properties;
import gid.gtk3.symbolic_color;
import gid.gtk3.types;

/**
    GtkGradient is a boxed type that represents a gradient.
    It is the result of parsing a
    [gradient expression][gtkcssprovider-gradients].
    To obtain the gradient represented by a GtkGradient, it has to
    be resolved with [gid.gtk3.gradient.Gradient.resolve], which replaces all
    symbolic color references by the colors they refer to (in a given
    context) and constructs a #cairo_pattern_t value.
    
    It is not normally necessary to deal directly with #GtkGradients,
    since they are mostly used behind the scenes by #GtkStyleContext and
    #GtkCssProvider.
    
    #GtkGradient is deprecated. It was used internally by GTK’s CSS engine
    to represent gradients. As its handling is not conforming to modern
    web standards, it is not used anymore. If you want to use gradients in
    your own code, please use Cairo directly.
*/
@gidGir("Gradient")
class Gradient : gid.gobject2.boxed.BoxedWrap!(gtk_gradient_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Gradient self() nothrow
  {
    return this;
  }

  /**
      Creates a new linear gradient along the line defined by (x0, y0) and (x1, y1). Before using the gradient
      a number of stop colors must be added through [gid.gtk3.gradient.Gradient.addColorStop].
  
      Params:
        x0 = X coordinate of the starting point
        y0 = Y coordinate of the starting point
        x1 = X coordinate of the end point
        y1 = Y coordinate of the end point
      Returns: A newly created #GtkGradient
  
      Deprecated: #GtkGradient is deprecated.
  */
  static gid.gtk3.gradient.Gradient newLinear(double x0, double y0, double x1, double y1) nothrow
  {
    GtkGradient* _cretval;
    _cretval = gtk_gradient_new_linear(x0, y0, x1, y1);
    auto _retval = _cretval ? new gid.gtk3.gradient.Gradient(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new radial gradient along the two circles defined by (x0, y0, radius0) and
      (x1, y1, radius1). Before using the gradient a number of stop colors must be added
      through [gid.gtk3.gradient.Gradient.addColorStop].
  
      Params:
        x0 = X coordinate of the start circle
        y0 = Y coordinate of the start circle
        radius0 = radius of the start circle
        x1 = X coordinate of the end circle
        y1 = Y coordinate of the end circle
        radius1 = radius of the end circle
      Returns: A newly created #GtkGradient
  
      Deprecated: #GtkGradient is deprecated.
  */
  static gid.gtk3.gradient.Gradient newRadial(double x0, double y0, double radius0, double x1, double y1, double radius1) nothrow
  {
    GtkGradient* _cretval;
    _cretval = gtk_gradient_new_radial(x0, y0, radius0, x1, y1, radius1);
    auto _retval = _cretval ? new gid.gtk3.gradient.Gradient(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds a stop color to gradient.
  
      Params:
        offset = offset for the color stop
        color = color to use
  
      Deprecated: #GtkGradient is deprecated.
  */
  void addColorStop(double offset, gid.gtk3.symbolic_color.SymbolicColor color) nothrow
  {
    gtk_gradient_add_color_stop(cast(GtkGradient*)this._cPtr, offset, color ? cast(GtkSymbolicColor*)color._cPtr(No.Dup) : null);
  }

  /**
      If gradient is resolvable, resolved_gradient will be filled in
      with the resolved gradient as a cairo_pattern_t, and true will
      be returned. Generally, if gradient can’t be resolved, it is
      due to it being defined on top of a named color that doesn't
      exist in props.
  
      Params:
        props = #GtkStyleProperties to use when resolving named colors
        resolvedGradient = return location for the resolved pattern
      Returns: true if the gradient has been resolved
  
      Deprecated: #GtkGradient is deprecated.
  */
  bool resolve(gid.gtk3.style_properties.StyleProperties props, out gid.cairo1.pattern.Pattern resolvedGradient) nothrow
  {
    bool _retval;
    cairo_pattern_t* _resolvedGradient;
    _retval = cast(bool)gtk_gradient_resolve(cast(GtkGradient*)this._cPtr, props ? cast(GtkStyleProperties*)props._cPtr(No.Dup) : null, &_resolvedGradient);
    if (_resolvedGradient)
      resolvedGradient = new gid.cairo1.pattern.Pattern(cast(void*)_resolvedGradient, Yes.Take);
    return _retval;
  }

  /** */
  gid.cairo1.pattern.Pattern resolveForContext(gid.gtk3.style_context.StyleContext context) nothrow
  {
    cairo_pattern_t* _cretval;
    _cretval = gtk_gradient_resolve_for_context(cast(GtkGradient*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.cairo1.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a string representation for gradient that is suitable
      for using in GTK CSS files.
      Returns: A string representation for gradient
  
      Deprecated: #GtkGradient is deprecated.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gtk_gradient_to_string(cast(GtkGradient*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
