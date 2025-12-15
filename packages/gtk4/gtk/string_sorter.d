/// Module for [StringSorter] class
module gtk.string_sorter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.sorter;
import gtk.types;

/**
    [gtk.string_sorter.StringSorter] is a [gtk.sorter.Sorter] that compares strings.
    
    It does the comparison in a linguistically correct way using the
    current locale by normalizing Unicode strings and possibly case-folding
    them before performing the comparison.
    
    To obtain the strings to compare, this sorter evaluates a
    [gtk.expression.Expression].
*/
class StringSorter : gtk.sorter.Sorter
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
    return cast(void function())gtk_string_sorter_get_type != &gidSymbolNotFound ? gtk_string_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringSorter self()
  {
    return this;
  }

  /**
      Get `collation` property.
      Returns: The collation method to use for sorting.
      
      The [gtk.types.Collation.None] value is useful when the expression already
      returns collation keys, or strings that need to be compared byte-by-byte.
      
      The default value, [gtk.types.Collation.Unicode], compares strings according
      to the [Unicode collation algorithm](https://www.unicode.org/reports/tr10/).
  */
  @property gtk.types.Collation collation()
  {
    return getCollation();
  }

  /**
      Set `collation` property.
      Params:
        propval = The collation method to use for sorting.
        
        The [gtk.types.Collation.None] value is useful when the expression already
        returns collation keys, or strings that need to be compared byte-by-byte.
        
        The default value, [gtk.types.Collation.Unicode], compares strings according
        to the [Unicode collation algorithm](https://www.unicode.org/reports/tr10/).
  */
  @property void collation(gtk.types.Collation propval)
  {
    return setCollation(propval);
  }

  /**
      Get `expression` property.
      Returns: The expression to evaluate on item to get a string to compare with.
  */
  @property gtk.expression.Expression expression()
  {
    return getExpression();
  }

  /**
      Set `expression` property.
      Params:
        propval = The expression to evaluate on item to get a string to compare with.
  */
  @property void expression(gtk.expression.Expression propval)
  {
    return setExpression(propval);
  }

  /**
      Get `ignoreCase` property.
      Returns: If sorting is case sensitive.
  */
  @property bool ignoreCase()
  {
    return getIgnoreCase();
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = If sorting is case sensitive.
  */
  @property void ignoreCase(bool propval)
  {
    return setIgnoreCase(propval);
  }

  /**
      Creates a new string sorter that compares items using the given
      expression.
      
      Unless an expression is set on it, this sorter will always
      compare items as invalid.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gtk.string_sorter.StringSorter]
  */
  this(gtk.expression.Expression expression = null)
  {
    GtkStringSorter* _cretval;
    _cretval = gtk_string_sorter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets which collation method the sorter uses.
      Returns: The collation method
  */
  gtk.types.Collation getCollation()
  {
    GtkCollation _cretval;
    _cretval = gtk_string_sorter_get_collation(cast(GtkStringSorter*)this._cPtr);
    gtk.types.Collation _retval = cast(gtk.types.Collation)_cretval;
    return _retval;
  }

  /**
      Gets the expression that is evaluated to obtain strings from items.
      Returns: a [gtk.expression.Expression]
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_string_sorter_get_expression(cast(GtkStringSorter*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets whether the sorter ignores case differences.
      Returns: true if self is ignoring case differences
  */
  bool getIgnoreCase()
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
  void setCollation(gtk.types.Collation collation)
  {
    gtk_string_sorter_set_collation(cast(GtkStringSorter*)this._cPtr, collation);
  }

  /**
      Sets the expression that is evaluated to obtain strings from items.
      
      The expression must have the type `G_TYPE_STRING`.
  
      Params:
        expression = a [gtk.expression.Expression]
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_string_sorter_set_expression(cast(GtkStringSorter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the sorter will ignore case differences.
  
      Params:
        ignoreCase = true to ignore case differences
  */
  void setIgnoreCase(bool ignoreCase)
  {
    gtk_string_sorter_set_ignore_case(cast(GtkStringSorter*)this._cPtr, ignoreCase);
  }
}
