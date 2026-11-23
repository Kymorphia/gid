/// Module for [StringSorter] class
module gid.gtk4.string_sorter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Sorts items by comparing strings.
    
    To obtain the strings to compare, this sorter evaluates a
    [gid.gtk4.expression.Expression].
    
    It does the comparison in a linguistically correct way using the
    current locale by normalizing Unicode strings and possibly case-folding
    them before performing the comparison.
*/
class StringSorter : gid.gtk4.sorter.Sorter
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
    return cast(void function())gtk_string_sorter_get_type != &gidSymbolNotFound ? gtk_string_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStringSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override StringSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.string_sorter.StringSorter]
      Returns: New builder object
  */
  static StringSorterGidBuilder builder() nothrow
  {
    return new StringSorterGidBuilder;
  }

  /**
      Get `collation` property.
      Returns: The collation method to use for sorting.
        
        The [gid.gtk4.types.Collation.None] value is useful when the expression already
        returns collation keys, or strings that need to be compared byte-by-byte.
        
        The default value, [gid.gtk4.types.Collation.Unicode], compares strings according
        to the [Unicode collation algorithm](https://www.unicode.org/reports/tr10/).
  */
  @property gid.gtk4.types.Collation collation() nothrow
  {
    return getCollation();
  }

  /**
      Set `collation` property.
      Params:
        propval = The collation method to use for sorting.
          
          The [gid.gtk4.types.Collation.None] value is useful when the expression already
          returns collation keys, or strings that need to be compared byte-by-byte.
          
          The default value, [gid.gtk4.types.Collation.Unicode], compares strings according
          to the [Unicode collation algorithm](https://www.unicode.org/reports/tr10/).
  */
  @property void collation(gid.gtk4.types.Collation propval) nothrow
  {
    setCollation(propval);
  }

  /**
      Get `expression` property.
      Returns: The expression to evaluate on item to get a string to compare with.
  */
  @property gid.gtk4.expression.Expression expression() nothrow
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on item to get a string to compare with.
  */
  @property void expression(gid.gtk4.expression.Expression propval) nothrow
  {
    setExpression(propval);
  }

  /**
      Get `ignoreCase` property.
      Returns: If sorting is case sensitive.
  */
  @property bool ignoreCase() nothrow
  {
    return getIgnoreCase();
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = If sorting is case sensitive.
  */
  @property void ignoreCase(bool propval) nothrow
  {
    setIgnoreCase(propval);
  }

  /**
      Creates a new string sorter that compares items using the given
      expression.
      
      Unless an expression is set on it, this sorter will always
      compare items as invalid.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gid.gtk4.string_sorter.StringSorter]
  */
  this(gid.gtk4.expression.Expression expression = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, expression !is null), Yes.Take);
    }
    else
    {
      GtkStringSorter* _cretval;
      _cretval = gtk_string_sorter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets which collation method the sorter uses.
      Returns: The collation method
  */
  gid.gtk4.types.Collation getCollation() nothrow
  {
    GtkCollation _cretval;
    _cretval = gtk_string_sorter_get_collation(cast(GtkStringSorter*)this._cPtr);
    gid.gtk4.types.Collation _retval = cast(gid.gtk4.types.Collation)_cretval;
    return _retval;
  }

  /**
      Gets the expression that is evaluated to obtain strings from items.
      Returns: a [gid.gtk4.expression.Expression]
  */
  gid.gtk4.expression.Expression getExpression() nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_string_sorter_get_expression(cast(GtkStringSorter*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets whether the sorter ignores case differences.
      Returns: true if self is ignoring case differences
  */
  bool getIgnoreCase() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_string_sorter_get_ignore_case(cast(GtkStringSorter*)this._cPtr);
    return _retval;
  }

  /**
      Sets the collation method to use for sorting.
  
      Params:
        collation = the collation method
  */
  void setCollation(gid.gtk4.types.Collation collation) nothrow
  {
    gtk_string_sorter_set_collation(cast(GtkStringSorter*)this._cPtr, collation);
  }

  /**
      Sets the expression that is evaluated to obtain strings from items.
      
      The expression must have the type `G_TYPE_STRING`.
  
      Params:
        expression = a [gid.gtk4.expression.Expression]
  */
  void setExpression(gid.gtk4.expression.Expression expression = null) nothrow
  {
    gtk_string_sorter_set_expression(cast(GtkStringSorter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the sorter will ignore case differences.
  
      Params:
        ignoreCase = true to ignore case differences
  */
  void setIgnoreCase(bool ignoreCase) nothrow
  {
    gtk_string_sorter_set_ignore_case(cast(GtkStringSorter*)this._cPtr, ignoreCase);
  }
}

/// Fluent builder implementation template for [gid.gtk4.string_sorter.StringSorter]
class StringSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T
{

  /**
      Set `collation` property.
      Params:
        propval = The collation method to use for sorting.
          
          The [gid.gtk4.types.Collation.None] value is useful when the expression already
          returns collation keys, or strings that need to be compared byte-by-byte.
          
          The default value, [gid.gtk4.types.Collation.Unicode], compares strings according
          to the [Unicode collation algorithm](https://www.unicode.org/reports/tr10/).
      Returns: Builder instance for fluent chaining
  */
  T collation(gid.gtk4.types.Collation propval) nothrow
  {
    return setProperty("collation", propval);
  }

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on item to get a string to compare with.
      Returns: Builder instance for fluent chaining
  */
  T expression(gid.gtk4.expression.Expression propval) nothrow
  {
    return setProperty("expression", propval);
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = If sorting is case sensitive.
      Returns: Builder instance for fluent chaining
  */
  T ignoreCase(bool propval) nothrow
  {
    return setProperty("ignore-case", propval);
  }
}

/// Fluent builder for [gid.gtk4.string_sorter.StringSorter]
final class StringSorterGidBuilder : StringSorterGidBuilderImpl!StringSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StringSorter build() nothrow
  {
    return new StringSorter(cast(void*)createGObject(StringSorter._getGType), Yes.Take);
  }
}
