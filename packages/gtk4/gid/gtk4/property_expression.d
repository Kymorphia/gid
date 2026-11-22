/// Module for [PropertyExpression] class
module gid.gtk4.property_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.param_spec;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    A [gid.gobject2.object.ObjectWrap] property value in a [gid.gtk4.expression.Expression].
*/
class PropertyExpression : gid.gtk4.expression.Expression
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
    return cast(void function())gtk_property_expression_get_type != &gidSymbolNotFound ? gtk_property_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates an expression that looks up a property.
      
      The object to use is found by evaluating the `expression`,
      or using the `this` argument when `expression` is `NULL`.
      
      If the resulting object conforms to `this_type`, its property named
      `property_name` will be queried. Otherwise, this expression's
      evaluation will fail.
      
      The given `this_type` must have a property with `property_name`.
  
      Params:
        thisType = The type to expect for the this type
        expression = Expression to
            evaluate to get the object to query or `NULL` to
            query the `this` object
        propertyName = name of the property
      Returns: a new [gid.gtk4.expression.Expression]
  */
  this(gid.gobject2.types.GType thisType, gid.gtk4.expression.Expression expression, string propertyName) nothrow
  {
    GtkExpression* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_property_expression_new(thisType, expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null, _propertyName);
    this(_cretval, Yes.Take);
  }

  /**
      Creates an expression that looks up a property.
      
      The object to use is found by evaluating the `expression`,
      or using the `this` argument when `expression` is `NULL`.
      
      If the resulting object conforms to `this_type`, its
      property specified by `pspec` will be queried.
      Otherwise, this expression's evaluation will fail.
  
      Params:
        expression = Expression to
            evaluate to get the object to query or `NULL` to
            query the `this` object
        pspec = the [gid.gobject2.param_spec.ParamSpec] for the property to query
      Returns: a new [gid.gtk4.expression.Expression]
  */
  static gid.gtk4.property_expression.PropertyExpression newForPspec(gid.gtk4.expression.Expression expression, gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_new_for_pspec(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.property_expression.PropertyExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the expression specifying the object of
      a property expression.
      Returns: the object expression
  */
  gid.gtk4.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_get_expression(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the [gid.gobject2.param_spec.ParamSpec] specifying the property of
      a property expression.
      Returns: the [gid.gobject2.param_spec.ParamSpec] for the property
  */
  gid.gobject2.param_spec.ParamSpec getPspec() nothrow
  {
    GParamSpec* _cretval;
    _cretval = gtk_property_expression_get_pspec(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}
