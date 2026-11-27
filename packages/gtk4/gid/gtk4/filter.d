/// Module for [Filter] class
module gid.gtk4.filter;

public import gid.core.basictypes;
import gid.core.utils;
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
@gidGir("Filter", "FilterClass")
class Filter : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
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
      Gets the known strictness of a filter.
      
      If the strictness is not known, [gid.gtk4.types.FilterMatch.Some] is returned.
      
      This value may change after emission of the [gid.gtk4.filter.Filter.changed]
      signal.
      
      This function is meant purely for optimization purposes. Filters can
      choose to omit implementing it, but [gid.gtk4.filter_list_model.FilterListModel] uses it.
      Returns: the strictness of self
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetStrictness` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.types.FilterMatch vfuncGetStrictness()
  {
    auto _klass = cast(GtkFilterClass*)_vfuncClass;
    if (!_klass.getStrictness)
      return typeof(return).init;

    GtkFilterMatch _cretval;
    _cretval = _klass.getStrictness(cast(GtkFilter*)this._cPtr);
    gid.gtk4.types.FilterMatch _retval = cast(gid.gtk4.types.FilterMatch)_cretval;
    return _retval;
  }

  /**
      Checks if the given item is matched by the filter or not.
  
      Params:
        item = The item to check
      Returns: true if the filter matches the item
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMatch` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncMatch(gid.gobject2.object.ObjectWrap item = null)
  {
    auto _klass = cast(GtkFilterClass*)_vfuncClass;
    if (!_klass.match)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.match(cast(GtkFilter*)this._cPtr, item ? cast(GObject*)item._cPtr(No.Dup) : null);
    return _retval;
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
      gidAttachThread();
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Filter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.filter.Filter), T.stringof ~ " is not derived from gid.gtk4.filter.Filter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetStrictness", true)[0]) == gid.gtk4.filter.Filter))
      _installVfunc(klass, "get_strictness");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMatch", true)[0]) == gid.gtk4.filter.Filter))
      _installVfunc(klass, "match");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkFilterClass*)klass;

    switch (vfunc)
    {
      case "get_strictness":
      {
        static extern(C) GtkFilterMatch _vfuncGetStrictnessTramp(GtkFilter* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.filter.Filter)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.getStrictness)
              return (cast(typeof(&_vfuncGetStrictnessTramp))_klass.getStrictness)(self);
            return typeof(return).init;
          }

          gid.gtk4.types.FilterMatch _dretval;

          try
          {
            _dretval = _obj.vfuncGetStrictness();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.filter.Filter.vfuncGetStrictness");
          }
          auto _retval = cast(GtkFilterMatch)_dretval;

          return _retval;
        }

        _klass.getStrictness = cast(typeof(_klass.getStrictness))&_vfuncGetStrictnessTramp;
        break;
      }
      case "match":
      {
        static extern(C) gboolean _vfuncMatchTramp(GtkFilter* self, GObject* item) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.filter.Filter)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.match)
              return (cast(typeof(&_vfuncMatchTramp))_klass.match)(self, item);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMatch(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.filter.Filter.vfuncMatch");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.match = cast(typeof(_klass.match))&_vfuncMatchTramp;
        break;
      }
      default:
      break;
    }
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
