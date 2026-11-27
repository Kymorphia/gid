/// Module for [Cache] class
module gid.glib2.cache;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    A [gid.glib2.cache.Cache] allows sharing of complex data structures, in order to
    save system resources.
    
    [gid.glib2.cache.Cache] uses keys and values. A [gid.glib2.cache.Cache] key describes the properties
    of a particular resource. A [gid.glib2.cache.Cache] value is the actual resource.
    
    [gid.glib2.cache.Cache] has been marked as deprecated, since this API is rarely
    used and not very actively maintained.

    Deprecated: Use a #GHashTable instead
*/
@gidGir("Cache")
class Cache : OpaqueWrap!(GCache*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Frees the memory allocated for the #GCache.
      
      Note that it does not destroy the keys and values which were
      contained in the #GCache.
  
      Deprecated: Use a #GHashTable instead
  */
  void destroy() nothrow
  {
    g_cache_destroy(cast(GCache*)this._cPtr);
  }

  /**
      Gets the value corresponding to the given key, creating it if
      necessary. It first checks if the value already exists in the
      #GCache, by using the key_equal_func function passed to
      [gid.glib2.cache.Cache.new_]. If it does already exist it is returned, and its
      reference count is increased by one. If the value does not currently
      exist, if is created by calling the value_new_func. The key is
      duplicated by calling key_dup_func and the duplicated key and value
      are inserted into the #GCache.
  
      Params:
        key = a key describing a #GCache object
      Returns: a pointer to a #GCache value
  
      Deprecated: Use a #GHashTable instead
  */
  void* insert(void* key = null) nothrow
  {
    auto _retval = g_cache_insert(cast(GCache*)this._cPtr, key);
    return _retval;
  }

  /**
      Calls the given function for each of the keys in the #GCache.
      
      NOTE func is passed three parameters, the value and key of a cache
      entry and the user_data. The order of value and key is different
      from the order in which [gid.glib2.hash_table.HashTable.foreach_] passes key-value
      pairs to its callback function !
  
      Params:
        func = the function to call with each #GCache key
  
      Deprecated: Use a #GHashTable instead
  */
  void keyForeach(gid.glib2.types.HFunc func) nothrow
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.glib2.types.HFunc*)userData;

      try
      {
        (*_dlg)(key, value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.HFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_cache_key_foreach(cast(GCache*)this._cPtr, _funcCB, _func);
  }

  /**
      Decreases the reference count of the given value. If it drops to 0
      then the value and its corresponding key are destroyed, using the
      value_destroy_func and key_destroy_func passed to [gid.glib2.cache.Cache.new_].
  
      Params:
        value = the value to remove
  
      Deprecated: Use a #GHashTable instead
  */
  void remove(const(void)* value = null) nothrow
  {
    g_cache_remove(cast(GCache*)this._cPtr, value);
  }

  /**
      Calls the given function for each of the values in the #GCache.
  
      Params:
        func = the function to call with each #GCache value
  
      Deprecated: The reason is that it passes pointers to internal
           data structures to func; use [gid.glib2.cache.Cache.keyForeach] instead
  */
  void valueForeach(gid.glib2.types.HFunc func) nothrow
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.glib2.types.HFunc*)userData;

      try
      {
        (*_dlg)(key, value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.HFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_cache_value_foreach(cast(GCache*)this._cPtr, _funcCB, _func);
  }
}
