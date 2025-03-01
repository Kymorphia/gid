module atk.misc;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.global;
import gobject.object;

/**
 * A set of ATK utility functions for thread locking
 * A set of utility functions for thread locking. This interface and
 * all his related methods are deprecated since 2.12.
 */
class Misc : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_misc_get_type != &gidSymbolNotFound ? atk_misc_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Obtain the singleton instance of AtkMisc for this application.
   * Returns: The singleton instance of AtkMisc for this application.

   * Deprecated: Since 2.12.
   */
  static Misc getInstance()
  {
    const(AtkMisc)* _cretval;
    _cretval = atk_misc_get_instance();
    auto _retval = ObjectG.getDObject!Misc(cast(AtkMisc*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Take the thread mutex for the GUI toolkit,
   * if one exists.
   * $(LPAREN)This method is implemented by the toolkit ATK implementation layer;
   * for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER$(RPAREN).

   * Deprecated: Since 2.12.
   */
  void threadsEnter()
  {
    atk_misc_threads_enter(cast(AtkMisc*)cPtr);
  }

  /**
   * Release the thread mutex for the GUI toolkit,
   * if one exists. This method, and atk_misc_threads_enter,
   * are needed in some situations by threaded application code which
   * services ATK requests, since fulfilling ATK requests often
   * requires calling into the GUI toolkit.  If a long-running or
   * potentially blocking call takes place inside such a block, it should
   * be bracketed by atk_misc_threads_leave/atk_misc_threads_enter calls.
   * $(LPAREN)This method is implemented by the toolkit ATK implementation layer;
   * for instance, for GTK+, GAIL implements this via GDK_THREADS_LEAVE$(RPAREN).

   * Deprecated: Since 2.12.
   */
  void threadsLeave()
  {
    atk_misc_threads_leave(cast(AtkMisc*)cPtr);
  }
}
