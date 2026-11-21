/// Module for [Filter] class
module gid.gtk4.filter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Describes the filtering to be performed by a [gid.gtk4.filter_list_model.FilterListModel].
    
    The model will use the filter to determine if it should include items
    or not by calling [gid.gtk4.filter.Filter.match] for each item and only
    keeping the ones that the function returns true for.
    
    Filters may change what items they match through their lifetime. In that
    case, they will emit the [gid.gtk4.filter.Filter.changed] signal to notify
    that previous filter results are no longer valid and that items should
    be checked again via [gid.gtk4.filter.Filter.match].
    
    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.
    
    However, in particular for large lists or complex search methods, it is
    also possible to subclass [gid.gtk4.filter.Filter] and provide one's own filter.
*/
class Filter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_filter_get_type != &gidSymbolNotFound ? gtk_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override Filter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.filter.Filter]
      Returns: New builder object
  */
  static FilterGidBuilder builder() nothrow
  {
    return new FilterGidBuilder;
  }

  /**
      Notifies all users of the filter that it has changed.
      
      This emits the [gid.gtk4.filter.Filter.changed] signal. Users
      of the filter should then check items again via
      [gid.gtk4.filter.Filter.match].
      
      Depending on the change parameter, not all items need to
      be changed, but only some. Refer to the [gid.gtk4.types.FilterChange]
      documentation for details.
      
      This function is intended for implementers of [gid.gtk4.filter.Filter]
      subclasses and should not be called from other functions.
  
      Params:
        change = how the filter changed
  */
  void changed(gid.gtk4.types.FilterChange change) nothrow
  {
    gtk_filter_changed(cast(GtkFilter*)this._cPtr, change);
  }

  /**
      Gets the known strictness of a filter.
      
      If the strictness is not known, [gid.gtk4.types.FilterMatch.Some] is returned.
      
      This value may change after emission of the [gid.gtk4.filter.Filter.changed]
      signal.
      
      This function is meant purely for optimization purposes. Filters can
      choose to omit implementing it, but [gid.gtk4.filter_list_model.FilterListModel] uses it.
      Returns: the strictness of self
  */
  gid.gtk4.types.FilterMatch getStrictness() nothrow
  {
    GtkFilterMatch _cretval;
    _cretval = gtk_filter_get_strictness(cast(GtkFilter*)this._cPtr);
    gid.gtk4.types.FilterMatch _retval = cast(gid.gtk4.types.FilterMatch)_cretval;
    return _retval;
  }

  /**
      Checks if the given item is matched by the filter or not.
  
      Params:
        item = The item to check
      Returns: true if the filter matches the item
  */
  bool match(gid.gobject2.object.ObjectWrap item) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_filter_match(cast(GtkFilter*)this._cPtr, item ? cast(GObject*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted whenever the filter changed.
        
        Users of the filter should then check items again via
        [gid.gtk4.filter.Filter.match].
        
        [gid.gtk4.filter_list_model.FilterListModel] handles this signal automatically.
        
        Depending on the change parameter, not all items need
        to be checked, but only some. Refer to the [gid.gtk4.types.FilterChange]
        documentation for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.FilterChange change, gid.gtk4.filter.Filter filter)`
  
          `change` how the filter changed (optional)
  
          `filter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.FilterChange)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.filter.Filter)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.filter.Filter.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.filter.Filter]
class FilterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.filter.Filter]
final class FilterGidBuilder : FilterGidBuilderImpl!FilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Filter build() nothrow
  {
    return new Filter(cast(void*)createGObject(Filter._getGType), Yes.Take);
  }
}
