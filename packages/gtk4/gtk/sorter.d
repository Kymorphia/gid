/// Module for [Sorter] class
module gtk.sorter;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.sorter.Sorter] is an object to describe sorting criteria.
    
    Its primary user is [gtk.sort_list_model.SortListModel]
    
    The model will use a sorter to determine the order in which
    its items should appear by calling [gtk.sorter.Sorter.compare]
    for pairs of items.
    
    Sorters may change their sorting behavior through their lifetime.
    In that case, they will emit the [gtk.sorter.Sorter.changed] signal
    to notify that the sort order is no longer valid and should be updated
    by calling [gtk.sorter.Sorter.compare] again.
    
    GTK provides various pre-made sorter implementations for common sorting
    operations. [gtk.column_view.ColumnView] has built-in support for sorting lists
    via the [gtk.column_view_column.ColumnViewColumn.sorter] property, where the user can
    change the sorting by clicking on list headers.
    
    Of course, in particular for large lists, it is also possible to subclass
    [gtk.sorter.Sorter] and provide one's own sorter.
*/
class Sorter : gobject.object.ObjectWrap
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
    return cast(void function())gtk_sorter_get_type != &gidSymbolNotFound ? gtk_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Sorter self()
  {
    return this;
  }

  /**
      Notifies all users of the sorter that it has changed.
      
      This emits the [gtk.sorter.Sorter.changed] signal. Users
      of the sorter should then update the sort order via
      [gtk.sorter.Sorter.compare].
      
      Depending on the change parameter, it may be possible to
      update the sort order without a full resorting. Refer to
      the [gtk.types.SorterChange] documentation for details.
      
      This function is intended for implementers of [gtk.sorter.Sorter]
      subclasses and should not be called from other functions.
  
      Params:
        change = How the sorter changed
  */
  void changed(gtk.types.SorterChange change)
  {
    gtk_sorter_changed(cast(GtkSorter*)this._cPtr, change);
  }

  /**
      Compares two given items according to the sort order implemented
      by the sorter.
      
      Sorters implement a partial order:
      
      $(LIST
        * It is reflexive, ie a = a
        * It is antisymmetric, ie if a < b and b < a, then a = b
        * It is transitive, ie given any 3 items with a ≤ b and b ≤ c,
          then a ≤ c
      )
        
      The sorter may signal it conforms to additional constraints
      via the return value of [gtk.sorter.Sorter.getOrder].
  
      Params:
        item1 = first item to compare
        item2 = second item to compare
      Returns: [gtk.types.Ordering.Equal] if item1 == item2,
          [gtk.types.Ordering.Smaller] if item1 < item2,
          [gtk.types.Ordering.Larger] if item1 > item2
  */
  gtk.types.Ordering compare(gobject.object.ObjectWrap item1, gobject.object.ObjectWrap item2)
  {
    GtkOrdering _cretval;
    _cretval = gtk_sorter_compare(cast(GtkSorter*)this._cPtr, item1 ? cast(GObject*)item1._cPtr(No.Dup) : null, item2 ? cast(GObject*)item2._cPtr(No.Dup) : null);
    gtk.types.Ordering _retval = cast(gtk.types.Ordering)_cretval;
    return _retval;
  }

  /**
      Gets the order that self conforms to.
      
      See [gtk.types.SorterOrder] for details
      of the possible return values.
      
      This function is intended to allow optimizations.
      Returns: The order
  */
  gtk.types.SorterOrder getOrder()
  {
    GtkSorterOrder _cretval;
    _cretval = gtk_sorter_get_order(cast(GtkSorter*)this._cPtr);
    gtk.types.SorterOrder _retval = cast(gtk.types.SorterOrder)_cretval;
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted whenever the sorter changed.
        
        Users of the sorter should then update the sort order
        again via [gtk.sorter.Sorter.compare].
        
        [gtk.sort_list_model.SortListModel] handles this signal automatically.
        
        Depending on the change parameter, it may be possible to update
        the sort order without a full resorting. Refer to the
        [gtk.types.SorterChange] documentation for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.SorterChange change, gtk.sorter.Sorter sorter))
  
          `change` how the sorter changed (optional)
  
          `sorter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.SorterChange)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.sorter.Sorter)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
