/// Module for [StringFilter] class
module gtk.string_filter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.filter;
import gtk.types;

/**
    [gtk.string_filter.StringFilter] determines whether to include items by comparing
    strings to a fixed search term.
    
    The strings are obtained from the items by evaluating a [gtk.expression.Expression]
    set with [gtk.string_filter.StringFilter.setExpression], and they are
    compared against a search term set with [gtk.string_filter.StringFilter.setSearch].
    
    [gtk.string_filter.StringFilter] has several different modes of comparison - it
    can match the whole string, just a prefix, or any substring. Use
    [gtk.string_filter.StringFilter.setMatchMode] choose a mode.
    
    It is also possible to make case-insensitive comparisons, with
    [gtk.string_filter.StringFilter.setIgnoreCase].
*/
class StringFilter : gtk.filter.Filter
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
    return cast(void function())gtk_string_filter_get_type != &gidSymbolNotFound ? gtk_string_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringFilter self()
  {
    return this;
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
      Returns: If matching is case sensitive.
  */
  @property bool ignoreCase()
  {
    return getIgnoreCase();
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = If matching is case sensitive.
  */
  @property void ignoreCase(bool propval)
  {
    return setIgnoreCase(propval);
  }

  /**
      Get `matchMode` property.
      Returns: If exact matches are necessary or if substrings are allowed.
  */
  @property gtk.types.StringFilterMatchMode matchMode()
  {
    return getMatchMode();
  }

  /**
      Set `matchMode` property.
      Params:
        propval = If exact matches are necessary or if substrings are allowed.
  */
  @property void matchMode(gtk.types.StringFilterMatchMode propval)
  {
    return setMatchMode(propval);
  }

  /**
      Get `search` property.
      Returns: The search term.
  */
  @property string search()
  {
    return getSearch();
  }

  /**
      Set `search` property.
      Params:
        propval = The search term.
  */
  @property void search(string propval)
  {
    return setSearch(propval);
  }

  /**
      Creates a new string filter.
      
      You will want to set up the filter by providing a string to search for
      and by providing a property to look up on the item.
  
      Params:
        expression = The expression to evaluate
      Returns: a new [gtk.string_filter.StringFilter]
  */
  this(gtk.expression.Expression expression = null)
  {
    GtkStringFilter* _cretval;
    _cretval = gtk_string_filter_new(expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the expression that the string filter uses to
      obtain strings from items.
      Returns: a [gtk.expression.Expression]
  */
  gtk.expression.Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_string_filter_get_expression(cast(GtkStringFilter*)this._cPtr);
    auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the filter ignores case differences.
      Returns: true if the filter ignores case
  */
  bool getIgnoreCase()
  {
    bool _retval;
    _retval = cast(bool)gtk_string_filter_get_ignore_case(cast(GtkStringFilter*)this._cPtr);
    return _retval;
  }

  /**
      Returns the match mode that the filter is using.
      Returns: the match mode of the filter
  */
  gtk.types.StringFilterMatchMode getMatchMode()
  {
    GtkStringFilterMatchMode _cretval;
    _cretval = gtk_string_filter_get_match_mode(cast(GtkStringFilter*)this._cPtr);
    gtk.types.StringFilterMatchMode _retval = cast(gtk.types.StringFilterMatchMode)_cretval;
    return _retval;
  }

  /**
      Gets the search term.
      Returns: The search term
  */
  string getSearch()
  {
    const(char)* _cretval;
    _cretval = gtk_string_filter_get_search(cast(GtkStringFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the expression that the string filter uses to
      obtain strings from items.
      
      The expression must have a value type of `G_TYPE_STRING`.
  
      Params:
        expression = a [gtk.expression.Expression]
  */
  void setExpression(gtk.expression.Expression expression = null)
  {
    gtk_string_filter_set_expression(cast(GtkStringFilter*)this._cPtr, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the filter ignores case differences.
  
      Params:
        ignoreCase = true to ignore case
  */
  void setIgnoreCase(bool ignoreCase)
  {
    gtk_string_filter_set_ignore_case(cast(GtkStringFilter*)this._cPtr, ignoreCase);
  }

  /**
      Sets the match mode for the filter.
  
      Params:
        mode = the new match mode
  */
  void setMatchMode(gtk.types.StringFilterMatchMode mode)
  {
    gtk_string_filter_set_match_mode(cast(GtkStringFilter*)this._cPtr, mode);
  }

  /**
      Sets the string to search for.
  
      Params:
        search = The string to search for
            or null to clear the search
  */
  void setSearch(string search = null)
  {
    const(char)* _search = search.toCString(No.Alloc);
    gtk_string_filter_set_search(cast(GtkStringFilter*)this._cPtr, _search);
  }
}
