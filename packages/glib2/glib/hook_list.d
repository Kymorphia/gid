/// Module for [HookList] class
module glib.hook_list;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.hook;
import glib.types;

/**
    The #GHookList struct represents a list of hook functions.
*/
class HookList
{
  GHookList cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.hook_list.HookList");

    cInstance = *cast(GHookList*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `seqId` field.
      Returns: the next free #GHook id
  */
  @property gulong seqId()
  {
    return (cast(GHookList*)this._cPtr).seqId;
  }

  /**
      Set `seqId` field.
      Params:
        propval = the next free #GHook id
  */
  @property void seqId(gulong propval)
  {
    (cast(GHookList*)this._cPtr).seqId = propval;
  }

  /**
      Get `hookSize` field.
      Returns: the size of the #GHookList elements, in bytes
  */
  @property uint hookSize()
  {
    return (cast(GHookList*)this._cPtr).hookSize;
  }

  /**
      Set `hookSize` field.
      Params:
        propval = the size of the #GHookList elements, in bytes
  */
  @property void hookSize(uint propval)
  {
    (cast(GHookList*)this._cPtr).hookSize = propval;
  }

  /**
      Get `isSetup` field.
      Returns: 1 if the #GHookList has been initialized
  */
  @property uint isSetup()
  {
    return (cast(GHookList*)this._cPtr).isSetup;
  }

  /**
      Set `isSetup` field.
      Params:
        propval = 1 if the #GHookList has been initialized
  */
  @property void isSetup(uint propval)
  {
    (cast(GHookList*)this._cPtr).isSetup = propval;
  }

  /**
      Get `hooks` field.
      Returns: the first #GHook element in the list
  */
  @property glib.hook.Hook hooks()
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHookList*)this._cPtr).hooks, No.Take);
  }

  /**
      Get `finalizeHook` field.
      Returns: the function to call to finalize a #GHook element.
          The default behaviour is to call the hooks @destroy function
  */
  @property GHookFinalizeFunc finalizeHook()
  {
    return (cast(GHookList*)this._cPtr).finalizeHook;
  }

  /**
      Set `finalizeHook` field.
      Params:
        propval = the function to call to finalize a #GHook element.
            The default behaviour is to call the hooks @destroy function
  */

  @property void finalizeHook(GHookFinalizeFunc propval)
  {
    (cast(GHookList*)this._cPtr).finalizeHook = propval;
  }

  /**
      Removes all the #GHook elements from a #GHookList.
  */
  void clear()
  {
    g_hook_list_clear(cast(GHookList*)this._cPtr);
  }

  /**
      Initializes a #GHookList.
      This must be called before the #GHookList is used.
  
      Params:
        hookSize = the size of each element in the #GHookList,
              typically `sizeof (GHook)`.
  */
  void init_(uint hookSize)
  {
    g_hook_list_init(cast(GHookList*)this._cPtr, hookSize);
  }

  /**
      Calls all of the #GHook functions in a #GHookList.
  
      Params:
        mayRecurse = true if functions which are already running
              (e.g. in another thread) can be called. If set to false,
              these are skipped
  */
  void invoke(bool mayRecurse)
  {
    g_hook_list_invoke(cast(GHookList*)this._cPtr, mayRecurse);
  }

  /**
      Calls all of the #GHook functions in a #GHookList.
      Any function which returns false is removed from the #GHookList.
  
      Params:
        mayRecurse = true if functions which are already running
              (e.g. in another thread) can be called. If set to false,
              these are skipped
  */
  void invokeCheck(bool mayRecurse)
  {
    g_hook_list_invoke_check(cast(GHookList*)this._cPtr, mayRecurse);
  }

  /**
      Calls a function on each valid #GHook.
  
      Params:
        mayRecurse = true if hooks which are currently running
              (e.g. in another thread) are considered valid. If set to false,
              these are skipped
        marshaller = the function to call for each #GHook
  */
  void marshal(bool mayRecurse, glib.types.HookMarshaller marshaller)
  {
    extern(C) void _marshallerCallback(GHook* hook, void* marshalData)
    {
      auto _dlg = cast(glib.types.HookMarshaller*)marshalData;

      (*_dlg)(hook ? new glib.hook.Hook(cast(void*)hook, No.Take) : null);
    }
    auto _marshallerCB = marshaller ? &_marshallerCallback : null;

    auto _marshaller = marshaller ? cast(void*)&(marshaller) : null;
    g_hook_list_marshal(cast(GHookList*)this._cPtr, mayRecurse, _marshallerCB, _marshaller);
  }

  /**
      Calls a function on each valid #GHook and destroys it if the
      function returns false.
  
      Params:
        mayRecurse = true if hooks which are currently running
              (e.g. in another thread) are considered valid. If set to false,
              these are skipped
        marshaller = the function to call for each #GHook
  */
  void marshalCheck(bool mayRecurse, glib.types.HookCheckMarshaller marshaller)
  {
    extern(C) gboolean _marshallerCallback(GHook* hook, void* marshalData)
    {
      auto _dlg = cast(glib.types.HookCheckMarshaller*)marshalData;

      gboolean _retval = (*_dlg)(hook ? new glib.hook.Hook(cast(void*)hook, No.Take) : null);
      return _retval;
    }
    auto _marshallerCB = marshaller ? &_marshallerCallback : null;

    auto _marshaller = marshaller ? cast(void*)&(marshaller) : null;
    g_hook_list_marshal_check(cast(GHookList*)this._cPtr, mayRecurse, _marshallerCB, _marshaller);
  }
}
