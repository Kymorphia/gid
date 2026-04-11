/// Module for [Misc] class
module atk.misc;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A set of ATK utility functions for thread locking
    
    A set of utility functions for thread locking. This interface and
    all his related methods are deprecated since 2.12.
*/
class Misc : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_misc_get_type != &gidSymbolNotFound ? atk_misc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Misc self()
  {
    return this;
  }

  /**
      Get builder for [atk.misc.Misc]
      Returns: New builder object
  */
  static MiscGidBuilder builder()
  {
    return new MiscGidBuilder;
  }

  /**
      Obtain the singleton instance of AtkMisc for this application.
      Returns: The singleton instance of AtkMisc for this application.
  
      Deprecated: Since 2.12.
  */
  static atk.misc.Misc getInstance()
  {
    const(AtkMisc)* _cretval;
    _cretval = atk_misc_get_instance();
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.misc.Misc)(cast(AtkMisc*)_cretval, No.Take);
    return _retval;
  }

  /**
      Take the thread mutex for the GUI toolkit,
      if one exists.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER).
  
      Deprecated: Since 2.12.
  */
  void threadsEnter()
  {
    atk_misc_threads_enter(cast(AtkMisc*)this._cPtr);
  }

  /**
      Release the thread mutex for the GUI toolkit,
      if one exists. This method, and atk_misc_threads_enter,
      are needed in some situations by threaded application code which
      services ATK requests, since fulfilling ATK requests often
      requires calling into the GUI toolkit.  If a long-running or
      potentially blocking call takes place inside such a block, it should
      be bracketed by atk_misc_threads_leave/atk_misc_threads_enter calls.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_LEAVE).
  
      Deprecated: Since 2.12.
  */
  void threadsLeave()
  {
    atk_misc_threads_leave(cast(AtkMisc*)this._cPtr);
  }
}

/// Fluent builder implementation template for [atk.misc.Misc]
class MiscGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [atk.misc.Misc]
final class MiscGidBuilder : MiscGidBuilderImpl!MiscGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Misc build()
  {
    return new Misc(cast(void*)createGObject(Misc._getGType), No.Take);
  }
}
