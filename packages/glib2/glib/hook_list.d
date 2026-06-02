/// Module for [HookList] class
module glib.hook_list;

public import gid.basictypes;
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
  GHookList _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GHookList*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `seqId` field.
      Returns: the next free #GHook id
  */
  @property gulong seqId() nothrow
  {
    return (cast(GHookList*)this._cPtr).seqId;
  }

  /**
      Set `seqId` field.
      Params:
        propval = the next free #GHook id
  */
  @property void seqId(gulong propval) nothrow
  {
    (cast(GHookList*)this._cPtr).seqId = propval;
  }

  /**
      Get `hookSize` field.
      Returns: the size of the #GHookList elements, in bytes
  */
  @property uint hookSize() nothrow
  {
    return (cast(GHookList*)this._cPtr).hookSize;
  }

  /**
      Set `hookSize` field.
      Params:
        propval = the size of the #GHookList elements, in bytes
  */
  @property void hookSize(uint propval) nothrow
  {
    (cast(GHookList*)this._cPtr).hookSize = propval;
  }

  /**
      Get `isSetup` field.
      Returns: 1 if the #GHookList has been initialized
  */
  @property uint isSetup() nothrow
  {
    return (cast(GHookList*)this._cPtr).isSetup;
  }

  /**
      Set `isSetup` field.
      Params:
        propval = 1 if the #GHookList has been initialized
  */
  @property void isSetup(uint propval) nothrow
  {
    (cast(GHookList*)this._cPtr).isSetup = propval;
  }

  /**
      Get `hooks` field.
      Returns: the first #GHook element in the list
  */
  @property glib.hook.Hook hooks() nothrow
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHookList*)this._cPtr).hooks, No.Take);
  }

  /**
      Get `finalizeHook` field.
      Returns: the function to call to finalize a #GHook element.
            The default behaviour is to call the hooks @destroy function
  */
  @property GHookFinalizeFunc finalizeHook() nothrow
  {
    return (cast(GHookList*)this._cPtr).finalizeHook;
  }

  /**
      Set `finalizeHook` field.
      Params:
        propval = the function to call to finalize a #GHook element.
              The default behaviour is to call the hooks @destroy function
  */

  @property void finalizeHook(GHookFinalizeFunc propval) nothrow
  {
    (cast(GHookList*)this._cPtr).finalizeHook = propval;
  }

  /**
      Removes all the #GHook elements from a #GHookList.
  */
  void clear() nothrow
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
  void init_(uint hookSize) nothrow
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
  void invoke(bool mayRecurse) nothrow
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
  void invokeCheck(bool mayRecurse) nothrow
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
  void marshal(bool mayRecurse, glib.types.HookMarshaller marshaller) nothrow
  {
    extern(C) void _marshallerCallback(GHook* hook, void* marshalData) nothrow
    {
      auto _dlg = cast(glib.types.HookMarshaller*)marshalData;

      try
      {
        (*_dlg)(hook ? new glib.hook.Hook(cast(void*)hook, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.HookMarshaller");
      }
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
  void marshalCheck(bool mayRecurse, glib.types.HookCheckMarshaller marshaller) nothrow
  {
    extern(C) gboolean _marshallerCallback(GHook* hook, void* marshalData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(glib.types.HookCheckMarshaller*)marshalData;

      try
      {
        _dretval = (*_dlg)(hook ? new glib.hook.Hook(cast(void*)hook, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.HookCheckMarshaller");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _marshallerCB = marshaller ? &_marshallerCallback : null;
    auto _marshaller = marshaller ? cast(void*)&(marshaller) : null;
    g_hook_list_marshal_check(cast(GHookList*)this._cPtr, mayRecurse, _marshallerCB, _marshaller);
  }
}
