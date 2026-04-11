/// Module for [Lockable] interface
module gda.lockable;

public import gda.lockable_iface_proxy;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.gid_builder;

/** */
interface Lockable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_lockable_get_type != &gidSymbolNotFound ? gda_lockable_get_type() : cast(GType)0;
  }

  /**
      Locks lockable. If it is already locked by another thread, the current thread will block until it is unlocked
      by the other thread.
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
      
      Note: unlike [glib.mutex.Mutex.lock], this method recursive, which means a thread can lock lockable several times
      (and has to unlock it as many times to actually unlock it).
  */
  void lock();

  /**
      Tries to lock lockable. If it is already locked by another thread, then it immediately returns FALSE, otherwise
      it locks lockable.
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
      
      Note: unlike [glib.mutex.Mutex.lock], this method recursive, which means a thread can lock lockable several times
      (and has to unlock it as many times to actually unlock it).
      Returns: TRUE if the object has successfully been locked.
  */
  bool trylock();

  /**
      Unlocks lockable. This method should not be called if the current does not already holds a lock on lockable (having
      used [gda.lockable.Lockable.lock] or [gda.lockable.Lockable.trylock]).
      
      This function can be used even if [glib.thread.Thread.init_] has not yet been called, and, in that case, will do nothing.
  */
  void unlock();
}

/// Fluent builder implementation template for [gda.lockable.Lockable]
interface LockableGidBuilderImpl(T)
{
}
