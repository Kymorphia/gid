/// Module for [BoolFilter] class
module gid.gtk4.bool_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.filter;
import gid.gtk4.types;

/**
    Evaluates a boolean expression to determine whether to include items.
*/
class BoolFilter : gid.gtk4.filter.Filter
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
    return cast(void function())gtk_bool_filter_get_type != &gidSymbolNotFound ? gtk_bool_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBoolFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override BoolFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.bool_filter.BoolFilter]
      Returns: New builder object
  */
  static BoolFilterGidBuilder builder() nothrow
  {
    return new BoolFilterGidBuilder;
  }

  /**
      Get `expression` property.
      Returns: The boolean expression to evaluate on each item.
  */
  @property gid.gtk4.expression.Expression expression() nothrow
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The boolean expression to evaluate on each item.
  */
  @property void expression(gid.gtk4.expression.Expression propval) nothrow
  {
    setExpression(propval);
  }

  /**
      Get `invert` property.
      Returns: If the expression result should be inverted.
  */
  @property bool invert() nothrow
  {
    return getInvert();
  }

  /**
      Set `invert` property.
      Params:
        propval = If the expression result should be inverted.
  */
  @property void invert(bool propval) nothrow
  {
    setInvert(propval);
  }

  /**
      Creates a new bool filter.
  
      Params:
        expression = the expression to evaluate
      Returns: a new [gid.gtk4.bool_filter.BoolFilter]
  */
  this(gid.gtk4.expression.Expression expression = null) nothrow
  {
    GtkBoolFilter* _cretval;
    _cretval = gtk_bool_filter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the expression that the filter evaluates for
      each item.
      Returns: the expression
  */
  gid.gtk4.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_bool_filter_get_expression(cast(GtkBoolFilter*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the filter inverts the expression.
      Returns: true if the filter inverts
  */
  bool getInvert() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_bool_filter_get_invert(cast(GtkBoolFilter*)this._cPtr);
    return _retval;
  }

  /**
      Sets the expression that the filter uses to check if items
      should be filtered.
      
      The expression must have a value type of `G_TYPE_BOOLEAN`.
  
      Params:
        expression = the expression
  */
  void setExpression(gid.gtk4.expression.Expression expression = null) nothrow
  {
    gtk_bool_filter_set_expression(cast(GtkBoolFilter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the filter should invert the expression.
  
      Params:
        invert = true to invert
  */
  void setInvert(bool invert) nothrow
  {
    gtk_bool_filter_set_invert(cast(GtkBoolFilter*)this._cPtr, invert);
  }
}

/// Fluent builder implementation template for [gid.gtk4.bool_filter.BoolFilter]
class BoolFilterGidBuilderImpl(T) : gid.gtk4.filter.FilterGidBuilderImpl!T
{

  /**
      Set `expression` property.
      Params:
        propval = The boolean expression to evaluate on each item.
      Returns: Builder instance for fluent chaining
  */
  T expression(gid.gtk4.expression.Expression propval) nothrow
  {
    return setProperty("expression", propval);
  }

  /**
      Set `invert` property.
      Params:
        propval = If the expression result should be inverted.
      Returns: Builder instance for fluent chaining
  */
  T invert(bool propval) nothrow
  {
    return setProperty("invert", propval);
  }
}

/// Fluent builder for [gid.gtk4.bool_filter.BoolFilter]
final class BoolFilterGidBuilder : BoolFilterGidBuilderImpl!BoolFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BoolFilter build() nothrow
  {
    return new BoolFilter(cast(void*)createGObject(BoolFilter._getGType), Yes.Take);
  }
}
