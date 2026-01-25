/// Module for [Hook] class
module glib.hook;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.hook_list;
import glib.types;

/**
    The #GHook struct represents a single hook function in a #GHookList.
*/
class Hook
{
  GHook _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.hook.Hook");

    _cInstance = *cast(GHook*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `next` field.
      Returns: pointer to the next hook in the list
  */
  @property glib.hook.Hook next()
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHook*)this._cPtr).next, No.Take);
  }

  /**
      Get `prev` field.
      Returns: pointer to the previous hook in the list
  */
  @property glib.hook.Hook prev()
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHook*)this._cPtr).prev, No.Take);
  }

  /**
      Get `refCount` field.
      Returns: the reference count of this hook
  */
  @property uint refCount()
  {
    return (cast(GHook*)this._cPtr).refCount;
  }

  /**
      Set `refCount` field.
      Params:
        propval = the reference count of this hook
  */
  @property void refCount(uint propval)
  {
    (cast(GHook*)this._cPtr).refCount = propval;
  }

  /**
      Get `hookId` field.
      Returns: the id of this hook, which is unique within its list
  */
  @property gulong hookId()
  {
    return (cast(GHook*)this._cPtr).hookId;
  }

  /**
      Set `hookId` field.
      Params:
        propval = the id of this hook, which is unique within its list
  */
  @property void hookId(gulong propval)
  {
    (cast(GHook*)this._cPtr).hookId = propval;
  }

  /**
      Get `flags` field.
      Returns: flags which are set for this hook. See #GHookFlagMask for
            predefined flags
  */
  @property uint flags()
  {
    return (cast(GHook*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags which are set for this hook. See #GHookFlagMask for
              predefined flags
  */
  @property void flags(uint propval)
  {
    (cast(GHook*)this._cPtr).flags = propval;
  }

  /**
      Get `destroy` field.
      Returns: the default @finalize_hook function of a #GHookList calls
            this member of the hook that is being finalized
  */
  @property GDestroyNotify destroy()
  {
    return (cast(GHook*)this._cPtr).destroy;
  }

  /**
      Set `destroy` field.
      Params:
        propval = the default @finalize_hook function of a #GHookList calls
              this member of the hook that is being finalized
  */

  @property void destroy(GDestroyNotify propval)
  {
    (cast(GHook*)this._cPtr).destroy = propval;
  }

  /**
      Compares the ids of two #GHook elements, returning a negative value
      if the second id is greater than the first.
  
      Params:
        sibling = a #GHook to compare with new_hook
      Returns: a value <= 0 if the id of sibling is >= the id of new_hook
  */
  int compareIds(glib.hook.Hook sibling)
  {
    int _retval;
    _retval = g_hook_compare_ids(cast(GHook*)this._cPtr, sibling ? cast(GHook*)sibling._cPtr : null);
    return _retval;
  }

  /**
      Destroys a #GHook, given its ID.
  
      Params:
        hookList = a #GHookList
        hookId = a hook ID
      Returns: true if the #GHook was found in the #GHookList and destroyed
  */
  static bool destroy(glib.hook_list.HookList hookList, gulong hookId)
  {
    bool _retval;
    _retval = cast(bool)g_hook_destroy(hookList ? cast(GHookList*)hookList._cPtr : null, hookId);
    return _retval;
  }

  /**
      Removes one #GHook from a #GHookList, marking it
      inactive and calling [glib.hook.Hook.unref] on it.
  
      Params:
        hookList = a #GHookList
        hook = the #GHook to remove
  */
  static void destroyLink(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_destroy_link(hookList ? cast(GHookList*)hookList._cPtr : null, hook ? cast(GHook*)hook._cPtr : null);
  }

  /**
      Calls the #GHookList finalize_hook function if it exists,
      and frees the memory allocated for the #GHook.
  
      Params:
        hookList = a #GHookList
        hook = the #GHook to free
  */
  static void free(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_free(hookList ? cast(GHookList*)hookList._cPtr : null, hook ? cast(GHook*)hook._cPtr : null);
  }

  /**
      Inserts a #GHook into a #GHookList, before a given #GHook.
  
      Params:
        hookList = a #GHookList
        sibling = the #GHook to insert the new #GHook before
        hook = the #GHook to insert
  */
  static void insertBefore(glib.hook_list.HookList hookList, glib.hook.Hook sibling, glib.hook.Hook hook)
  {
    g_hook_insert_before(hookList ? cast(GHookList*)hookList._cPtr : null, sibling ? cast(GHook*)sibling._cPtr : null, hook ? cast(GHook*)hook._cPtr : null);
  }

  /**
      Inserts a #GHook into a #GHookList, sorted by the given function.
  
      Params:
        hookList = a #GHookList
        hook = the #GHook to insert
        func = the comparison function used to sort the #GHook elements
  */
  static void insertSorted(glib.hook_list.HookList hookList, glib.hook.Hook hook, glib.types.HookCompareFunc func)
  {
    static glib.types.HookCompareFunc _static_func;

    extern(C) int _funcCallback(GHook* newHook, GHook* sibling)
    {
      int _retval = _static_func(newHook ? new glib.hook.Hook(cast(void*)newHook, No.Take) : null, sibling ? new glib.hook.Hook(cast(void*)sibling, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    _static_func = func;
    g_hook_insert_sorted(hookList ? cast(GHookList*)hookList._cPtr : null, hook ? cast(GHook*)hook._cPtr : null, _funcCB);
    _static_func = null;
  }

  /**
      Prepends a #GHook on the start of a #GHookList.
  
      Params:
        hookList = a #GHookList
        hook = the #GHook to add to the start of hook_list
  */
  static void prepend(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_prepend(hookList ? cast(GHookList*)hookList._cPtr : null, hook ? cast(GHook*)hook._cPtr : null);
  }

  /**
      Decrements the reference count of a #GHook.
      If the reference count falls to 0, the #GHook is removed
      from the #GHookList and [glib.hook.Hook.free] is called to free it.
  
      Params:
        hookList = a #GHookList
        hook = the #GHook to unref
  */
  static void unref(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_unref(hookList ? cast(GHookList*)hookList._cPtr : null, hook ? cast(GHook*)hook._cPtr : null);
  }
}
