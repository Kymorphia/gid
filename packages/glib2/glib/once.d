/// Module for [Once] class
module glib.once;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A #GOnce struct controls a one-time initialization function. Any
    one-time initialization function must have its own unique #GOnce
    struct.
*/
class Once
{
  GOnce cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.once.Once");

    cInstance = *cast(GOnce*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `status` field.
      Returns: the status of the #GOnce
  */
  @property glib.types.OnceStatus status()
  {
    return cast(glib.types.OnceStatus)(cast(GOnce*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = the status of the #GOnce
  */
  @property void status(glib.types.OnceStatus propval)
  {
    (cast(GOnce*)this._cPtr).status = cast(GOnceStatus)propval;
  }

  /**
      Function to be called when starting a critical initialization
      section. The argument location must point to a static
      0-initialized variable that will be set to a value other than 0 at
      the end of the initialization section. In combination with
      [glib.once.Once.initLeave] and the unique address value_location, it can
      be ensured that an initialization section will be executed only once
      during a program's life time, and that concurrent threads are
      blocked until initialization completed. To be used in constructs
      like this:
      
      ```c
        static gsize initialization_value = 0;
      
        if (g_once_init_enter (&initialization_value))
          {
            gsize setup_value = 42; // initialization code here
      
            g_once_init_leave (&initialization_value, setup_value);
          }
      
        // use initialization_value here
      ```
      
      While location has a `volatile` qualifier, this is a historical artifact and
      the pointer passed to it should not be `volatile`.
  
      Params:
        location = location of a static initializable variable
             containing 0
      Returns: true if the initialization section should be entered,
            false and blocks otherwise
  */
  static bool initEnter(ref void* location)
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter(cast(void*)&location);
    return _retval;
  }

  /** */
  static bool initEnterImpl(out size_t location)
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter_impl(cast(size_t*)&location);
    return _retval;
  }

  /**
      This functions behaves in the same way as [glib.once.Once.initEnter], but can
      can be used to initialize pointers (or #guintptr) instead of #gsize.
      
      ```c
        static MyStruct *interesting_struct = NULL;
      
        if (g_once_init_enter_pointer (&interesting_struct))
          {
            MyStruct *setup_value = allocate_my_struct (); // initialization code here
      
            g_once_init_leave_pointer (&interesting_struct, g_steal_pointer (&setup_value));
          }
      
        // use interesting_struct here
      ```
  
      Params:
        location = location of a static initializable variable
             containing `NULL`
      Returns: true if the initialization section should be entered,
            false and blocks otherwise
  */
  static bool initEnterPointer(void* location)
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter_pointer(location);
    return _retval;
  }

  /**
      Counterpart to [glib.once.Once.initEnter]. Expects a location of a static
      0-initialized initialization variable, and an initialization value
      other than 0. Sets the variable to the initialization value, and
      releases concurrent threads blocking in [glib.once.Once.initEnter] on this
      initialization variable.
      
      While location has a `volatile` qualifier, this is a historical artifact and
      the pointer passed to it should not be `volatile`.
  
      Params:
        location = location of a static initializable variable
             containing 0
        result = new non-0 value for *value_location
  */
  static void initLeave(ref void* location, size_t result)
  {
    g_once_init_leave(cast(void*)&location, result);
  }

  /**
      Counterpart to [glib.once.Once.initEnterPointer]. Expects a location of a static
      `NULL`-initialized initialization variable, and an initialization value
      other than `NULL`. Sets the variable to the initialization value, and
      releases concurrent threads blocking in [glib.once.Once.initEnterPointer] on this
      initialization variable.
      
      This functions behaves in the same way as [glib.once.Once.initLeave], but
      can be used to initialize pointers (or #guintptr) instead of #gsize.
  
      Params:
        location = location of a static initializable variable
             containing `NULL`
        result = new non-`NULL` value for `*location`
  */
  static void initLeavePointer(void* location, void* result = null)
  {
    g_once_init_leave_pointer(location, result);
  }
}
