/// Module for [BoolFilter] class
module gtk.bool_filter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.filter;
import gtk.types;

/**
    [gtk.bool_filter.BoolFilter] evaluates a boolean [gtk.expression.Expression]
    to determine whether to include items.
*/
class BoolFilter : gtk.filter.Filter
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
    return cast(void function())gtk_bool_filter_get_type != &gidSymbolNotFound ? gtk_bool_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BoolFilter self()
  {
    return this;
  }

  /**
      Get `expression` property.
      Returns: The boolean expression to evaluate on item.
  */
  @property gtk.expression.Expression expression()
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The boolean expression to evaluate on item.
  */
  @property void expression(gtk.expression.Expression propval)
  {
    return setExpression(propval);
  }

  /**
      Get `invert` property.
      Returns: If the expression result should be inverted.
  */
  @property bool invert()
  {
    return getInvert();
  }

  /**
      Set `invert` property.
      Params:
        propval = If the expression result should be inverted.
  */
  @property void invert(bool propval)
  {
    return setInvert(propval);
  }

  /**
      Creates a new bool filter.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gtk.bool_filter.BoolFilter]
  */
  this(gtk.expression.Expression expression = null)
  {
    GtkBoolFilter* _cretval;
    _cretval = gtk_bool_filter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the expression that the filter uses to evaluate if
      an item should be filtered.
      Returns: a [gtk.expression.Expression]
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_bool_filter_get_expression(cast(GtkBoolFilter*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the filter inverts the expression.
      Returns: true if the filter inverts
  */
  bool getInvert()
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
        expression = a [gtk.expression.Expression]
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_bool_filter_set_expression(cast(GtkBoolFilter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the filter should invert the expression.
  
      Params:
        invert = true to invert
  */
  void setInvert(bool invert)
  {
    gtk_bool_filter_set_invert(cast(GtkBoolFilter*)this._cPtr, invert);
  }
}
