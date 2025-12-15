/// Module for [Lockable] interface mixin
module gda.lockable_mixin;

public import gda.lockable_iface_proxy;
public import gda.c.functions;
public import gda.c.types;
public import gda.types;
public import gid.gid;

/** */
template LockableT()
{

  /**
      Locks lockable. If it is already locked by another thread, the current thread will block until it is unlocked
      by the other thread.
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
      
      Note: unlike [glib.mutex.Mutex.lock], this method recursive, which means a thread can lock lockable several times
      (and has to unlock it as many times to actually unlock it).
  */
  override void lock()
  {
    gda_lockable_lock(cast(GdaLockable*)this._cPtr);
  }

  /**
      Tries to lock lockable. If it is already locked by another thread, then it immediately returns FALSE, otherwise
      it locks lockable.
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
      
      Note: unlike [glib.mutex.Mutex.lock], this method recursive, which means a thread can lock lockable several times
      (and has to unlock it as many times to actually unlock it).
      Returns: TRUE if the object has successfully been locked.
  */
  override bool trylock()
  {
    bool _retval;
    _retval = cast(bool)gda_lockable_trylock(cast(GdaLockable*)this._cPtr);
    return _retval;
  }

  /**
      Unlocks lockable. This method should not be called if the current does not already holds a lock on lockable (having
      used [gda.lockable.Lockable.lock] or [gda.lockable.Lockable.trylock]).
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
  */
  override void unlock()
  {
    gda_lockable_unlock(cast(GdaLockable*)this._cPtr);
  }
}
