/// Module for [NumericSorter] class
module gid.gtk4.numeric_sorter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Sorts items numerically.
    
    To obtain the numbers to compare, this sorter evaluates a
    [gid.gtk4.expression.Expression].
*/
class NumericSorter : gid.gtk4.sorter.Sorter
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
    return cast(void function())gtk_numeric_sorter_get_type != &gidSymbolNotFound ? gtk_numeric_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNumericSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override NumericSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.numeric_sorter.NumericSorter]
      Returns: New builder object
  */
  static NumericSorterGidBuilder builder() nothrow
  {
    return new NumericSorterGidBuilder;
  }

  /**
      Get `expression` property.
      Returns: The expression to evaluate on items to get a number to compare with.
  */
  @property gid.gtk4.expression.Expression expression() nothrow
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on items to get a number to compare with.
  */
  @property void expression(gid.gtk4.expression.Expression propval) nothrow
  {
    setExpression(propval);
  }

  /**
      Get `sortOrder` property.
      Returns: Whether the sorter will sort smaller numbers first.
  */
  @property gid.gtk4.types.SortType sortOrder() nothrow
  {
    return getSortOrder();
  }

  /**
      Set `sortOrder` property.
      Params:
        propval = Whether the sorter will sort smaller numbers first.
  */
  @property void sortOrder(gid.gtk4.types.SortType propval) nothrow
  {
    setSortOrder(propval);
  }

  /**
      Creates a new numeric sorter using the given expression.
      
      Smaller numbers will be sorted first. You can call
      [gid.gtk4.numeric_sorter.NumericSorter.setSortOrder] to change this.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gid.gtk4.numeric_sorter.NumericSorter]
  */
  this(gid.gtk4.expression.Expression expression = null) nothrow
  {
    GtkNumericSorter* _cretval;
    _cretval = gtk_numeric_sorter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the expression that is evaluated to obtain numbers from items.
      Returns: a [gid.gtk4.expression.Expression]
  */
  gid.gtk4.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_numeric_sorter_get_expression(cast(GtkNumericSorter*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets whether this sorter will sort smaller numbers first.
      Returns: the order of the numbers
  */
  gid.gtk4.types.SortType getSortOrder() nothrow
  {
    GtkSortType _cretval;
    _cretval = gtk_numeric_sorter_get_sort_order(cast(GtkNumericSorter*)this._cPtr);
    gid.gtk4.types.SortType _retval = cast(gid.gtk4.types.SortType)_cretval;
    return _retval;
  }

  /**
      Sets the expression that is evaluated to obtain numbers from items.
      
      Unless an expression is set on self, the sorter will always
      compare items as invalid.
      
      The expression must have a return type that can be compared
      numerically, such as `G_TYPE_INT` or `G_TYPE_DOUBLE`.
  
      Params:
        expression = a [gid.gtk4.expression.Expression]
  */
  void setExpression(gid.gtk4.expression.Expression expression = null) nothrow
  {
    gtk_numeric_sorter_set_expression(cast(GtkNumericSorter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to sort smaller numbers before larger ones.
  
      Params:
        sortOrder = whether to sort smaller numbers first
  */
  void setSortOrder(gid.gtk4.types.SortType sortOrder) nothrow
  {
    gtk_numeric_sorter_set_sort_order(cast(GtkNumericSorter*)this._cPtr, sortOrder);
  }
}

/// Fluent builder implementation template for [gid.gtk4.numeric_sorter.NumericSorter]
class NumericSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T
{

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on items to get a number to compare with.
      Returns: Builder instance for fluent chaining
  */
  T expression(gid.gtk4.expression.Expression propval) nothrow
  {
    return setProperty("expression", propval);
  }

  /**
      Set `sortOrder` property.
      Params:
        propval = Whether the sorter will sort smaller numbers first.
      Returns: Builder instance for fluent chaining
  */
  T sortOrder(gid.gtk4.types.SortType propval) nothrow
  {
    return setProperty("sort-order", propval);
  }
}

/// Fluent builder for [gid.gtk4.numeric_sorter.NumericSorter]
final class NumericSorterGidBuilder : NumericSorterGidBuilderImpl!NumericSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NumericSorter build() nothrow
  {
    return new NumericSorter(cast(void*)createGObject(NumericSorter._getGType), Yes.Take);
  }
}
