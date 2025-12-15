/// Module for [Filter] class
module gtk.filter;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A [gtk.filter.Filter] object describes the filtering to be performed by a
    [gtk.filter_list_model.FilterListModel].
    
    The model will use the filter to determine if it should include items
    or not by calling [gtk.filter.Filter.match] for each item and only
    keeping the ones that the function returns true for.
    
    Filters may change what items they match through their lifetime. In that
    case, they will emit the [gtk.filter.Filter.changed] signal to notify
    that previous filter results are no longer valid and that items should
    be checked again via [gtk.filter.Filter.match].
    
    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.
    
    However, in particular for large lists or complex search methods, it is
    also possible to subclass [gtk.filter.Filter] and provide one's own filter.
*/
class Filter : gobject.object.ObjectWrap
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
    return cast(void function())gtk_filter_get_type != &gidSymbolNotFound ? gtk_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Filter self()
  {
    return this;
  }

  /**
      Notifies all users of the filter that it has changed.
      
      This emits the [gtk.filter.Filter.changed] signal. Users
      of the filter should then check items again via
      [gtk.filter.Filter.match].
      
      Depending on the change parameter, not all items need to
      be changed, but only some. Refer to the [gtk.types.FilterChange]
      documentation for details.
      
      This function is intended for implementers of [gtk.filter.Filter]
      subclasses and should not be called from other functions.
  
      Params:
        change = How the filter changed
  */
  void changed(gtk.types.FilterChange change)
  {
    gtk_filter_changed(cast(GtkFilter*)this._cPtr, change);
  }

  /**
      Gets the known strictness of filters.
      
      If the strictness is not known, [gtk.types.FilterMatch.Some] is returned.
      
      This value may change after emission of the [gtk.filter.Filter.changed]
      signal.
      
      This function is meant purely for optimization purposes, filters can
      choose to omit implementing it, but [gtk.filter_list_model.FilterListModel] uses it.
      Returns: the strictness of self
  */
  gtk.types.FilterMatch getStrictness()
  {
    GtkFilterMatch _cretval;
    _cretval = gtk_filter_get_strictness(cast(GtkFilter*)this._cPtr);
    gtk.types.FilterMatch _retval = cast(gtk.types.FilterMatch)_cretval;
    return _retval;
  }

  /**
      Checks if the given item is matched by the filter or not.
  
      Params:
        item = The item to check
      Returns: true if the filter matches the item and a filter model should
          keep it, false if not.
  */
  bool match(gobject.object.ObjectWrap item)
  {
    bool _retval;
    _retval = cast(bool)gtk_filter_match(cast(GtkFilter*)this._cPtr, item ? cast(GObject*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted whenever the filter changed.
      
      Users of the filter should then check items again via
      [gtk.filter.Filter.match].
      
      [gtk.filter_list_model.FilterListModel] handles this signal automatically.
      
      Depending on the change parameter, not all items need
      to be checked, but only some. Refer to the [gtk.types.FilterChange]
      documentation for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.FilterChange change, gtk.filter.Filter filter))
  
          `change` how the filter changed (optional)
  
          `filter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.FilterChange)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.filter.Filter)))
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
