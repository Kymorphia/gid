/// Module for [MiniObject] struct
module gst.mini_object;

import gid.gid;
import glib.types;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    #GstMiniObject is a simple structure that can be used to implement refcounted
    types.
    
    Subclasses will include #GstMiniObject as the first member in their structure
    and then call [gst.mini_object.MiniObject.init_] to initialize the #GstMiniObject fields.
    
    [gst.mini_object.MiniObject.ref_] and [gst.mini_object.MiniObject.unref] increment and decrement the
    refcount respectively. When the refcount of a mini-object reaches 0, the
    dispose function is called first and when this returns true, the free
    function of the miniobject is called.
    
    A copy can be made with [gst.mini_object.MiniObject.copy].
    
    [gst.mini_object.MiniObject.isWritable] will return true when the refcount of the
    object is exactly 1 and there is no parent or a single parent exists and is
    writable itself, meaning the current caller has the only reference to the
    object. [gst.mini_object.MiniObject.makeWritable] will return a writable version of
    the object, which might be a new copy when the refcount was not 1.
    
    Opaque data can be associated with a #GstMiniObject with
    [gst.mini_object.MiniObject.setQdata] and [gst.mini_object.MiniObject.getQdata]. The data is
    meant to be specific to the particular object and is not automatically copied
    with [gst.mini_object.MiniObject.copy] or similar methods.
    
    A weak reference can be added and remove with [gst.mini_object.MiniObject.weakRef]
    and [gst.mini_object.MiniObject.weakUnref] respectively.
*/
struct MiniObject
{
  /**
      the GType of the object
  */
  GType type;

  /**
      atomic refcount
  */
  int refcount;

  /**
      atomic state of the locks
  */
  int lockstate;

  /**
      extra flags.
  */
  uint flags;

  /**
      a copy function
  */
  GstMiniObjectCopyFunction copy;

  /**
      a dispose function
  */
  GstMiniObjectDisposeFunction dispose;

  /**
      the free function
  */
  GstMiniObjectFreeFunction free;

  /** */
  uint privUint;

  /** */
  void* privPointer;

  /**
      This adds parent as a parent for object. Having one ore more parents affects the
      writability of object: if a parent is not writable, object is also not
      writable, regardless of its refcount. object is only writable if all
      the parents are writable and its own refcount is exactly 1.
      
      Note: This function does not take ownership of parent and also does not
      take an additional reference. It is the responsibility of the caller to
      remove the parent again at a later time.
  
      Params:
        parent = a parent #GstMiniObject
  */
  void addParent(gst.mini_object.MiniObject parent)
  {
    gst_mini_object_add_parent(cast(GstMiniObject*)&this, cast(GstMiniObject*)&parent);
  }

  /**
      This function gets back user data pointers stored via
      [gst.mini_object.MiniObject.setQdata].
  
      Params:
        quark = A #GQuark, naming the user data pointer
      Returns: The user data pointer set, or
        null
  */
  void* getQdata(glib.types.Quark quark)
  {
    auto _retval = gst_mini_object_get_qdata(cast(GstMiniObject*)&this, quark);
    return _retval;
  }

  /**
      If mini_object has the LOCKABLE flag set, check if the current EXCLUSIVE
      lock on object is the only one, this means that changes to the object will
      not be visible to any other object.
      
      If the LOCKABLE flag is not set, check if the refcount of mini_object is
      exactly 1, meaning that no other reference exists to the object and that the
      object is therefore writable.
      
      Modification of a mini-object should only be done after verifying that it
      is writable.
      Returns: true if the object is writable.
  */
  bool isWritable()
  {
    bool _retval;
    _retval = cast(bool)gst_mini_object_is_writable(cast(const(GstMiniObject)*)&this);
    return _retval;
  }

  /**
      Lock the mini-object with the specified access mode in flags.
  
      Params:
        flags = #GstLockFlags
      Returns: true if object could be locked.
  */
  bool lock(gst.types.LockFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_mini_object_lock(cast(GstMiniObject*)&this, flags);
    return _retval;
  }

  /**
      This removes parent as a parent for object. See
      [gst.mini_object.MiniObject.addParent].
  
      Params:
        parent = a parent #GstMiniObject
  */
  void removeParent(gst.mini_object.MiniObject parent)
  {
    gst_mini_object_remove_parent(cast(GstMiniObject*)&this, cast(GstMiniObject*)&parent);
  }

  /**
      This sets an opaque, named pointer on a miniobject.
      The name is specified through a #GQuark (retrieved e.g. via
      [glib.global.quarkFromStaticString]), and the pointer
      can be gotten back from the object with [gst.mini_object.MiniObject.getQdata]
      until the object is disposed.
      Setting a previously set user data pointer, overrides (frees)
      the old pointer set, using null as pointer essentially
      removes the data stored.
      
      destroy may be specified which is called with data as argument
      when the object is disposed, or the data is being overwritten by
      a call to [gst.mini_object.MiniObject.setQdata] with the same quark.
  
      Params:
        quark = A #GQuark, naming the user data pointer
        data = An opaque user data pointer
        destroy = Function to invoke with data as argument, when data
                    needs to be freed
  */
  void setQdata(glib.types.Quark quark, void* data, glib.types.DestroyNotify destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    gst_mini_object_set_qdata(cast(GstMiniObject*)&this, quark, data, _destroyCB);
  }

  /**
      This function gets back user data pointers stored via [gst.mini_object.MiniObject.setQdata]
      and removes the data from object without invoking its `destroy()` function (if
      any was set).
  
      Params:
        quark = A #GQuark, naming the user data pointer
      Returns: The user data pointer set, or
        null
  */
  void* stealQdata(glib.types.Quark quark)
  {
    auto _retval = gst_mini_object_steal_qdata(cast(GstMiniObject*)&this, quark);
    return _retval;
  }

  /**
      Unlock the mini-object with the specified access mode in flags.
  
      Params:
        flags = #GstLockFlags
  */
  void unlock(gst.types.LockFlags flags)
  {
    gst_mini_object_unlock(cast(GstMiniObject*)&this, flags);
  }

  /**
      Atomically modifies a pointer to point to a new mini-object.
      The reference count of olddata is decreased and the reference count of
      newdata is increased.
      
      Either newdata and the value pointed to by olddata may be null.
  
      Params:
        olddata = pointer to a pointer to a
              mini-object to be replaced
        newdata = pointer to new mini-object
      Returns: true if newdata was different from olddata
  */
  static bool replace(ref gst.mini_object.MiniObject olddata, gst.mini_object.MiniObject newdata)
  {
    bool _retval;
    GstMiniObject* _olddata;
    _retval = cast(bool)gst_mini_object_replace(&_olddata, cast(GstMiniObject*)&newdata);
    olddata = *cast(MiniObject*)_olddata;
    return _retval;
  }

  /**
      Modifies a pointer to point to a new mini-object. The modification
      is done atomically. This version is similar to [gst.mini_object.MiniObject.replace]
      except that it does not increase the refcount of newdata and thus
      takes ownership of newdata.
      
      Either newdata and the value pointed to by olddata may be null.
  
      Params:
        olddata = pointer to a pointer to a mini-object to
              be replaced
        newdata = pointer to new mini-object
      Returns: true if newdata was different from olddata
  */
  static bool take(ref gst.mini_object.MiniObject olddata, gst.mini_object.MiniObject newdata)
  {
    bool _retval;
    GstMiniObject* _olddata;
    _retval = cast(bool)gst_mini_object_take(&_olddata, cast(GstMiniObject*)&newdata);
    olddata = *cast(MiniObject*)_olddata;
    return _retval;
  }
}
