/// Module for [CustomFilter] class
module gid.gtk4.custom_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.filter;
import gid.gtk4.types;

/**
    Determines whether to include items with a callback.
*/
@gidGir("CustomFilter", "CustomFilterClass")
class CustomFilter : gid.gtk4.filter.Filter
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
    return cast(void function())gtk_custom_filter_get_type != &gidSymbolNotFound ? gtk_custom_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCustomFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.custom_filter.CustomFilter]
      Returns: New builder object
  */
  static CustomFilterGidBuilder builder() nothrow
  {
    return new CustomFilterGidBuilder;
  }

  /**
      Creates a new filter using the given function to filter items.
      
      If match_func is `NULL`, the filter matches all items.
      
      If the filter func changes its filtering behavior,
      [gid.gtk4.filter.Filter.changed] needs to be called.
  
      Params:
        matchFunc = function to filter items
      Returns: a new [gid.gtk4.custom_filter.CustomFilter]
  */
  this(gid.gtk4.types.CustomFilterFunc matchFunc = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, matchFunc !is null), Yes.Take);
    }
    else
    {
      extern(C) gboolean _matchFuncCallback(GObject* item, void* userData) nothrow
      {
        gidAttachThread();
        bool _dretval;
        auto _dlg = cast(gid.gtk4.types.CustomFilterFunc*)userData;

        try
        {
          _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CustomFilterFunc");
        }
        auto _retval = cast(gboolean)_dretval;

        return _retval;
      }
      auto _matchFuncCB = matchFunc ? &_matchFuncCallback : null;
      GtkCustomFilter* _cretval;
      auto _matchFunc = matchFunc ? freezeDelegate(cast(void*)&matchFunc) : null;
      GDestroyNotify _matchFuncDestroyCB = matchFunc ? &thawDelegate : null;
      _cretval = gtk_custom_filter_new(_matchFuncCB, _matchFunc, _matchFuncDestroyCB);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Sets the function used for filtering items.
      
      If match_func is `NULL`, the filter matches all items.
      
      If the filter func changes its filtering behavior,
      [gid.gtk4.filter.Filter.changed] needs to be called.
      
      If a previous function was set, its user_destroy
      will be called.
  
      Params:
        matchFunc = function to filter items
  */
  void setFilterFunc(gid.gtk4.types.CustomFilterFunc matchFunc = null) nothrow
  {
    extern(C) gboolean _matchFuncCallback(GObject* item, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.CustomFilterFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CustomFilterFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _matchFuncCB = matchFunc ? &_matchFuncCallback : null;
    auto _matchFunc = matchFunc ? freezeDelegate(cast(void*)&matchFunc) : null;
    GDestroyNotify _matchFuncDestroyCB = matchFunc ? &thawDelegate : null;
    gtk_custom_filter_set_filter_func(cast(GtkCustomFilter*)this._cPtr, _matchFuncCB, _matchFunc, _matchFuncDestroyCB);
  }
}

/// Fluent builder implementation template for [gid.gtk4.custom_filter.CustomFilter]
class CustomFilterGidBuilderImpl(T) : gid.gtk4.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.custom_filter.CustomFilter]
final class CustomFilterGidBuilder : CustomFilterGidBuilderImpl!CustomFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CustomFilter build() nothrow
  {
    return new CustomFilter(cast(void*)createGObject(CustomFilter._getGType), Yes.Take);
  }
}
