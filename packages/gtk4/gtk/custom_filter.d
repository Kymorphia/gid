/// Module for [CustomFilter] class
module gtk.custom_filter;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.filter;
import gtk.types;

/**
    [gtk.custom_filter.CustomFilter] determines whether to include items with a callback.
*/
class CustomFilter : gtk.filter.Filter
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
    return cast(void function())gtk_custom_filter_get_type != &gidSymbolNotFound ? gtk_custom_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomFilter self()
  {
    return this;
  }

  /**
      Creates a new filter using the given match_func to filter
      items.
      
      If match_func is null, the filter matches all items.
      
      If the filter func changes its filtering behavior,
      [gtk.filter.Filter.changed] needs to be called.
  
      Params:
        matchFunc = function to filter items
      Returns: a new [gtk.custom_filter.CustomFilter]
  */
  this(gtk.types.CustomFilterFunc matchFunc = null)
  {
    extern(C) gboolean _matchFuncCallback(GObject* item, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.CustomFilterFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, No.Take));
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

  /**
      Sets the function used for filtering items.
      
      If match_func is null, the filter matches all items.
      
      If the filter func changes its filtering behavior,
      [gtk.filter.Filter.changed] needs to be called.
      
      If a previous function was set, its user_destroy will be
      called now.
  
      Params:
        matchFunc = function to filter items
  */
  void setFilterFunc(gtk.types.CustomFilterFunc matchFunc = null)
  {
    extern(C) gboolean _matchFuncCallback(GObject* item, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.CustomFilterFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _matchFuncCB = matchFunc ? &_matchFuncCallback : null;
    auto _matchFunc = matchFunc ? freezeDelegate(cast(void*)&matchFunc) : null;
    GDestroyNotify _matchFuncDestroyCB = matchFunc ? &thawDelegate : null;
    gtk_custom_filter_set_filter_func(cast(GtkCustomFilter*)this._cPtr, _matchFuncCB, _matchFunc, _matchFuncDestroyCB);
  }
}
