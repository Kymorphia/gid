/// Module for [Once] class
module gid.glib2.once;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    A #GOnce struct controls a one-time initialization function. Any
    one-time initialization function must have its own unique #GOnce
    struct.
*/
@gidGir("Once")
class Once : StructWrap!(GOnce)
{
  /**
      Create a `once.Once` wrap type.
      Params:
        status = the status of the #GOnce
  */
  this(gid.glib2.types.OnceStatus status = gid.glib2.types.OnceStatus.init) nothrow
  {
    this.status = status;
  }

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
      Get `status` field.
      Returns: the status of the #GOnce
  */
  @property gid.glib2.types.OnceStatus status() nothrow
  {
    return cast(gid.glib2.types.OnceStatus)(cast(GOnce*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = the status of the #GOnce
  */
  @property void status(gid.glib2.types.OnceStatus propval) nothrow
  {
    (cast(GOnce*)this._cPtr).status = cast(GOnceStatus)propval;
  }

  /**
      Function to be called when starting a critical initialization
      section. The argument location must point to a static
      0-initialized variable that will be set to a value other than 0 at
      the end of the initialization section. In combination with
      [gid.glib2.once.Once.initLeave] and the unique address value_location, it can
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
  static bool initEnter(ref void* location) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter(cast(void*)&location);
    return _retval;
  }

  /** */
  static bool initEnterImpl(out size_t location) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter_impl(cast(size_t*)&location);
    return _retval;
  }

  /**
      This functions behaves in the same way as [gid.glib2.once.Once.initEnter], but can
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
  static bool initEnterPointer(void* location) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_once_init_enter_pointer(location);
    return _retval;
  }

  /**
      Counterpart to [gid.glib2.once.Once.initEnter]. Expects a location of a static
      0-initialized initialization variable, and an initialization value
      other than 0. Sets the variable to the initialization value, and
      releases concurrent threads blocking in [gid.glib2.once.Once.initEnter] on this
      initialization variable.
      
      While location has a `volatile` qualifier, this is a historical artifact and
      the pointer passed to it should not be `volatile`.
  
      Params:
        location = location of a static initializable variable
             containing 0
        result = new non-0 value for `*value_location`
  */
  static void initLeave(ref void* location, size_t result) nothrow
  {
    g_once_init_leave(cast(void*)&location, result);
  }

  /**
      Counterpart to [gid.glib2.once.Once.initEnterPointer]. Expects a location of a static
      `NULL`-initialized initialization variable, and an initialization value
      other than `NULL`. Sets the variable to the initialization value, and
      releases concurrent threads blocking in [gid.glib2.once.Once.initEnterPointer] on this
      initialization variable.
      
      This functions behaves in the same way as [gid.glib2.once.Once.initLeave], but
      can be used to initialize pointers (or #guintptr) instead of #gsize.
  
      Params:
        location = location of a static initializable variable
             containing `NULL`
        result = new non-`NULL` value for `*location`
  */
  static void initLeavePointer(void* location, void* result = null) nothrow
  {
    g_once_init_leave_pointer(location, result);
  }
}
