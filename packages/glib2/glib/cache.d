/// Module for [Cache] class
module glib.cache;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A [glib.cache.Cache] allows sharing of complex data structures, in order to
    save system resources.
    
    [glib.cache.Cache] uses keys and values. A [glib.cache.Cache] key describes the properties
    of a particular resource. A [glib.cache.Cache] value is the actual resource.
    
    [glib.cache.Cache] has been marked as deprecated, since this API is rarely
    used and not very actively maintained.

    Deprecated: Use a #GHashTable instead
*/
class Cache
{
  GCache* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.cache.Cache");

    _cInstancePtr = cast(GCache*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Frees the memory allocated for the #GCache.
      
      Note that it does not destroy the keys and values which were
      contained in the #GCache.
  
      Deprecated: Use a #GHashTable instead
  */
  void destroy()
  {
    g_cache_destroy(cast(GCache*)this._cPtr);
  }

  /**
      Gets the value corresponding to the given key, creating it if
      necessary. It first checks if the value already exists in the
      #GCache, by using the key_equal_func function passed to
      [glib.cache.Cache.new_]. If it does already exist it is returned, and its
      reference count is increased by one. If the value does not currently
      exist, if is created by calling the value_new_func. The key is
      duplicated by calling key_dup_func and the duplicated key and value
      are inserted into the #GCache.
  
      Params:
        key = a key describing a #GCache object
      Returns: a pointer to a #GCache value
  
      Deprecated: Use a #GHashTable instead
  */
  void* insert(void* key = null)
  {
    auto _retval = g_cache_insert(cast(GCache*)this._cPtr, key);
    return _retval;
  }

  /**
      Calls the given function for each of the keys in the #GCache.
      
      NOTE func is passed three parameters, the value and key of a cache
      entry and the user_data. The order of value and key is different
      from the order in which [glib.hash_table.HashTable.foreach_] passes key-value
      pairs to its callback function !
  
      Params:
        func = the function to call with each #GCache key
  
      Deprecated: Use a #GHashTable instead
  */
  void keyForeach(glib.types.HFunc func)
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData)
    {
      auto _dlg = cast(glib.types.HFunc*)userData;

      (*_dlg)(key, value);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_cache_key_foreach(cast(GCache*)this._cPtr, _funcCB, _func);
  }

  /**
      Decreases the reference count of the given value. If it drops to 0
      then the value and its corresponding key are destroyed, using the
      value_destroy_func and key_destroy_func passed to [glib.cache.Cache.new_].
  
      Params:
        value = the value to remove
  
      Deprecated: Use a #GHashTable instead
  */
  void remove(const(void)* value = null)
  {
    g_cache_remove(cast(GCache*)this._cPtr, value);
  }

  /**
      Calls the given function for each of the values in the #GCache.
  
      Params:
        func = the function to call with each #GCache value
  
      Deprecated: The reason is that it passes pointers to internal
           data structures to func; use [glib.cache.Cache.keyForeach] instead
  */
  void valueForeach(glib.types.HFunc func)
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData)
    {
      auto _dlg = cast(glib.types.HFunc*)userData;

      (*_dlg)(key, value);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_cache_value_foreach(cast(GCache*)this._cPtr, _funcCB, _func);
  }
}
