/// Module for [ListStore] class
module gid.gio2.list_store;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    [gid.gio2.list_store.ListStore] is a simple implementation of [gid.gio2.list_model.ListModel] that stores
    all items in memory.
    
    It provides insertions, deletions, and lookups in logarithmic time
    with a fast path for the common case of iterating the list linearly.
*/
class ListStore : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_list_store_get_type != &gidSymbolNotFound ? g_list_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GListStore";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListStore self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.list_store.ListStore]
      Returns: New builder object
  */
  static ListStoreGidBuilder builder() nothrow
  {
    return new ListStoreGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items contained in this list store. Items must be
        subclasses of #GObject.
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items contained in this list store.
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();

  /**
  * Looks up the given item in the list store by looping over the items and
  * comparing them with equal_func until the first occurrence of item which
  * matches. If item was not found, then position will not be set, and this
  * method will return %FALSE.
  * item is always passed as second parameter to equal_func.
  * Since GLib 2.76 it is possible to pass `NULL` for item.
  * Params:
  *   item = an item
  *   equalFunc = A custom equality check function
  *   position = the first position of item, if it was found.
  * Returns: Whether store contains item. If it was found, position will be
  *   set to the position where item occurred for the first time.
  */
  bool findWithEqualFunc(gid.gobject2.object.ObjectWrap item, bool delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) equalFunc, out uint position) nothrow
  {
    static bool delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) _static_equalFunc;

    extern(C) gboolean _equalFuncCallback(const(void)* a, const(void)* b) nothrow
    {
      gidAttachThread();
      gboolean _retval;

      try
      {
        _retval = _static_equalFunc(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)a, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_store.ListStore.findWithEqualFunc");

      return _retval;
    }

    _static_equalFunc = equalFunc;
    gboolean _retval;
    _retval = g_list_store_find_with_equal_func(cast(GListStore*)_cPtr, item ? cast(GObject*)item._cPtr : null, &_equalFuncCallback, cast(uint*)&position);
    _static_equalFunc = null;
    return cast(bool)_retval;
  }

  /**
  * Inserts item into store at a position to be determined by the
  * compare_func.
  * The list must already be sorted before calling this function or the
  * result is undefined.  Usually you would approach this by only ever
  * inserting items by way of this function.
  * This function takes a ref on item.
  * Params:
  *   item = the new item
  *   compareFunc = pairwise comparison function for sorting
  * Returns: the position at which item was inserted
  */
  uint insertSorted(gid.gobject2.object.ObjectWrap item, int delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) compareFunc) nothrow
  {
    static int delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;

      try
      {
        _retval = _static_compareFunc(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)a, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_store.ListStore.insertSorted");

      return _retval;
    }

    _static_compareFunc = compareFunc;
    uint _retval;
    _retval = g_list_store_insert_sorted(cast(GListStore*)_cPtr, item ? cast(GObject*)item._cPtr : null, &_compareFuncCallback, null);
    _static_compareFunc = null;
    return _retval;
  }

  /**
  * Sort the items in store according to compare_func.
  * Params:
  *   compareFunc = pairwise comparison function for sorting
  */
  void sort(int delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) compareFunc) nothrow
  {
    static int delegate(gid.gobject2.object.ObjectWrap, gid.gobject2.object.ObjectWrap) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;

      try
      {
        _retval = _static_compareFunc(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)a, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)b, No.Take));
      }
      catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gio2.list_store.ListStore.sort");

      return _retval;
    }

    _static_compareFunc = compareFunc;
    g_list_store_sort(cast(GListStore*)_cPtr, &_compareFuncCallback, null);
    _static_compareFunc = null;
  }

  /**
      Creates a new #GListStore with items of type item_type. item_type
      must be a subclass of #GObject.
  
      Params:
        itemType = the #GType of items in the list
      Returns: a new #GListStore
  */
  this(gid.gobject2.types.GType itemType) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GListStore* _cretval;
      _cretval = g_list_store_new(itemType);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Appends item to store. item must be of type #GListStore:item-type.
      
      This function takes a ref on item.
      
      Use [gid.gio2.list_store.ListStore.splice] to append multiple items at the same time
      efficiently.
  
      Params:
        item = the new item
  */
  void append(gid.gobject2.object.ObjectWrap item) nothrow
  {
    g_list_store_append(cast(GListStore*)this._cPtr, item ? cast(GObject*)item._cPtr(No.Dup) : null);
  }

  /**
      Looks up the given item in the list store by looping over the items until
      the first occurrence of item. If item was not found, then position will
      not be set, and this method will return false.
      
      If you need to compare the two items with a custom comparison function, use
      [gid.gio2.list_store.ListStore.findWithEqualFunc] with a custom #GEqualFunc instead.
  
      Params:
        item = an item
        position = the first position of item, if it was found.
      Returns: Whether store contains item. If it was found, position will be
        set to the position where item occurred for the first time.
  */
  bool find(gid.gobject2.object.ObjectWrap item, out uint position) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_list_store_find(cast(GListStore*)this._cPtr, item ? cast(GObject*)item._cPtr(No.Dup) : null, cast(uint*)&position);
    return _retval;
  }

  /**
      Inserts item into store at position. item must be of type
      #GListStore:item-type or derived from it. position must be smaller
      than the length of the list, or equal to it to append.
      
      This function takes a ref on item.
      
      Use [gid.gio2.list_store.ListStore.splice] to insert multiple items at the same time
      efficiently.
  
      Params:
        position = the position at which to insert the new item
        item = the new item
  */
  void insert(uint position, gid.gobject2.object.ObjectWrap item) nothrow
  {
    g_list_store_insert(cast(GListStore*)this._cPtr, position, item ? cast(GObject*)item._cPtr(No.Dup) : null);
  }

  /**
      Removes the item from store that is at position. position must be
      smaller than the current length of the list.
      
      Use [gid.gio2.list_store.ListStore.splice] to remove multiple items at the same time
      efficiently.
  
      Params:
        position = the position of the item that is to be removed
  */
  void remove(uint position) nothrow
  {
    g_list_store_remove(cast(GListStore*)this._cPtr, position);
  }

  /**
      Removes all items from store.
  */
  void removeAll() nothrow
  {
    g_list_store_remove_all(cast(GListStore*)this._cPtr);
  }

  /**
      Changes store by removing n_removals items and adding n_additions
      items to it. additions must contain n_additions items of type
      #GListStore:item-type.  null is not permitted.
      
      This function is more efficient than [gid.gio2.list_store.ListStore.insert] and
      [gid.gio2.list_store.ListStore.remove], because it only emits
      #GListModel::items-changed once for the change.
      
      This function takes a ref on each item in additions.
      
      The parameters position and n_removals must be correct (ie:
      position + n_removals must be less than or equal to the length of
      the list at the time this function is called).
  
      Params:
        position = the position at which to make the change
        nRemovals = the number of items to remove
        additions = the items to add
  */
  void splice(uint position, uint nRemovals, gid.gobject2.object.ObjectWrap[] additions) nothrow
  {
    uint _nAdditions;
    if (additions)
      _nAdditions = cast(uint)additions.length;

    auto _additions_arr = new GObject*[](additions.length);
    auto _additions = cast(void**)_additions_arr.ptr;
    foreach (i, obj; additions) _additions[i] = obj ? cast(GObject*)obj._cPtr(No.Dup) : null;
    g_list_store_splice(cast(GListStore*)this._cPtr, position, nRemovals, _additions, _nAdditions);
  }
}

/// Fluent builder implementation template for [gid.gio2.list_store.ListStore]
class ListStoreGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `itemType` property.
      Params:
        propval = The type of items contained in this list store. Items must be
          subclasses of #GObject.
      Returns: Builder instance for fluent chaining
  */
  T itemType(gid.gobject2.types.GType propval) nothrow
  {
    return setProperty("item-type", propval);
  }
}

/// Fluent builder for [gid.gio2.list_store.ListStore]
final class ListStoreGidBuilder : ListStoreGidBuilderImpl!ListStoreGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListStore build() nothrow
  {
    return new ListStore(cast(void*)createGObject(ListStore._getGType), Yes.Take);
  }
}
