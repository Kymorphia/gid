/// Module for [PropertyExpression] class
module gtk.property_expression;

public import gid.basictypes;
import gid.gid;
import gobject.param_spec;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A [gobject.object.ObjectWrap] property value in a [gtk.expression.Expression].
*/
class PropertyExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GtkExpression*)ptr, take);
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
      Returns: a new [gtk.expression.Expression]
  */
  this(gobject.types.GType thisType, gtk.expression.Expression expression, string propertyName) nothrow
  {
    GtkExpression* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
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
        pspec = the [gobject.param_spec.ParamSpec] for the property to query
      Returns: a new [gtk.expression.Expression]
  */
  static gtk.property_expression.PropertyExpression newForPspec(gtk.expression.Expression expression, gobject.param_spec.ParamSpec pspec) nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_new_for_pspec(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.property_expression.PropertyExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the expression specifying the object of
      a property expression.
      Returns: the object expression
  */
  gtk.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_get_expression(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the [gobject.param_spec.ParamSpec] specifying the property of
      a property expression.
      Returns: the [gobject.param_spec.ParamSpec] for the property
  */
  gobject.param_spec.ParamSpec getPspec() nothrow
  {
    GParamSpec* _cretval;
    _cretval = gtk_property_expression_get_pspec(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}
