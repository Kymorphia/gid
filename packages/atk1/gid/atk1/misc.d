/// Module for [Misc] class
module gid.atk1.misc;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A set of ATK utility functions for thread locking
    
    A set of utility functions for thread locking. This interface and
    all his related methods are deprecated since 2.12.
*/
class Misc : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_misc_get_type != &gidSymbolNotFound ? atk_misc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkMisc";
  }

  /** Returns `this`, for use in `with` statements. */
  override Misc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.misc.Misc]
      Returns: New builder object
  */
  static MiscGidBuilder builder() nothrow
  {
    return new MiscGidBuilder;
  }

  /**
      Obtain the singleton instance of AtkMisc for this application.
      Returns: The singleton instance of AtkMisc for this application.
  
      Deprecated: Since 2.12.
  */
  static gid.atk1.misc.Misc getInstance() nothrow
  {
    const(AtkMisc)* _cretval;
    _cretval = atk_misc_get_instance();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.misc.Misc)(cast(AtkMisc*)_cretval, No.Take);
    return _retval;
  }

  /**
      Take the thread mutex for the GUI toolkit,
      if one exists.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER).
  
      Deprecated: Since 2.12.
  */
  void threadsEnter() nothrow
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
  void threadsLeave() nothrow
  {
    atk_misc_threads_leave(cast(AtkMisc*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.atk1.misc.Misc]
class MiscGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.misc.Misc]
final class MiscGidBuilder : MiscGidBuilderImpl!MiscGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Misc build() nothrow
  {
    return new Misc(cast(void*)createGObject(Misc._getGType), Yes.Take);
  }
}
