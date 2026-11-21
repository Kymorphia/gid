/// Module for [Sorter] class
module gid.gtk4.sorter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Describes sorting criteria for a [gid.gtk4.sort_list_model.SortListModel].
    
    Its primary user is [gid.gtk4.sort_list_model.SortListModel]
    
    The model will use a sorter to determine the order in which
    its items should appear by calling [gid.gtk4.sorter.Sorter.compare]
    for pairs of items.
    
    Sorters may change their sorting behavior through their lifetime.
    In that case, they will emit the [gid.gtk4.sorter.Sorter.changed] signal
    to notify that the sort order is no longer valid and should be updated
    by calling [gid.gtk4.sorter.Sorter.compare] again.
    
    GTK provides various pre-made sorter implementations for common sorting
    operations. [gid.gtk4.column_view.ColumnView] has built-in support for sorting lists
    via the [gid.gtk4.column_view_column.ColumnViewColumn.sorter] property, where the user can
    change the sorting by clicking on list headers.
    
    Of course, in particular for large lists, it is also possible to subclass
    [gid.gtk4.sorter.Sorter] and provide one's own sorter.
*/
class Sorter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_sorter_get_type != &gidSymbolNotFound ? gtk_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override Sorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.sorter.Sorter]
      Returns: New builder object
  */
  static SorterGidBuilder builder() nothrow
  {
    return new SorterGidBuilder;
  }

  /**
      Notifies all users of the sorter that it has changed.
      
      This emits the [gid.gtk4.sorter.Sorter.changed] signal. Users
      of the sorter should then update the sort order via
      [gid.gtk4.sorter.Sorter.compare].
      
      Depending on the change parameter, it may be possible to
      update the sort order without a full resorting. Refer to
      the [gid.gtk4.types.SorterChange] documentation for details.
      
      This function is intended for implementers of [gid.gtk4.sorter.Sorter]
      subclasses and should not be called from other functions.
  
      Params:
        change = How the sorter changed
  */
  void changed(gid.gtk4.types.SorterChange change) nothrow
  {
    gtk_sorter_changed(cast(GtkSorter*)this._cPtr, change);
  }

  /**
      Compares two given items according to the sort order implemented
      by the sorter.
      
      Sorters implement a partial order:
      
      * It is reflexive, ie a = a
      * It is antisymmetric, ie if a < b and b < a, then a = b
      * It is transitive, ie given any 3 items with a ≤ b and b ≤ c,
        then a ≤ c
      
      The sorter may signal it conforms to additional constraints
      via the return value of [gid.gtk4.sorter.Sorter.getOrder].
  
      Params:
        item1 = first item to compare
        item2 = second item to compare
      Returns: [gid.gtk4.types.Ordering.Equal] if item1 == item2,
          [gid.gtk4.types.Ordering.Smaller] if item1 < item2,
          [gid.gtk4.types.Ordering.Larger] if item1 > item2
  */
  gid.gtk4.types.Ordering compare(gid.gobject2.object.ObjectWrap item1, gid.gobject2.object.ObjectWrap item2) nothrow
  {
    GtkOrdering _cretval;
    _cretval = gtk_sorter_compare(cast(GtkSorter*)this._cPtr, item1 ? cast(GObject*)item1._cPtr(No.Dup) : null, item2 ? cast(GObject*)item2._cPtr(No.Dup) : null);
    gid.gtk4.types.Ordering _retval = cast(gid.gtk4.types.Ordering)_cretval;
    return _retval;
  }

  /**
      Gets the order that self conforms to.
      
      See [gid.gtk4.types.SorterOrder] for details
      of the possible return values.
      
      This function is intended to allow optimizations.
      Returns: The order
  */
  gid.gtk4.types.SorterOrder getOrder() nothrow
  {
    GtkSorterOrder _cretval;
    _cretval = gtk_sorter_get_order(cast(GtkSorter*)this._cPtr);
    gid.gtk4.types.SorterOrder _retval = cast(gid.gtk4.types.SorterOrder)_cretval;
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted whenever the sorter changed.
        
        Users of the sorter should then update the sort order
        again via [gid.gtk4.sorter.Sorter.compare].
        
        [gid.gtk4.sort_list_model.SortListModel] handles this signal automatically.
        
        Depending on the change parameter, it may be possible to update
        the sort order without a full resorting. Refer to the
        [gid.gtk4.types.SorterChange] documentation for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.SorterChange change, gid.gtk4.sorter.Sorter sorter)`
  
          `change` how the sorter changed (optional)
  
          `sorter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.SorterChange)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.sorter.Sorter)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.sorter.Sorter.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.sorter.Sorter]
class SorterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.sorter.Sorter]
final class SorterGidBuilder : SorterGidBuilderImpl!SorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Sorter build() nothrow
  {
    return new Sorter(cast(void*)createGObject(Sorter._getGType), Yes.Take);
  }
}
