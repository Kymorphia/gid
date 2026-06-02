/// Module for [Util] class
module atk.util;

public import gid.basictypes;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A set of ATK utility functions for event and toolkit support.
    
    A set of ATK utility functions which are used to support event
    registration of various types, and obtaining the 'root' accessible
    of a process and information about the current ATK implementation
    and toolkit version.
*/
class Util : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_util_get_type != &gidSymbolNotFound ? atk_util_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Util self() nothrow
  {
    return this;
  }

  /**
      Get builder for [atk.util.Util]
      Returns: New builder object
  */
  static UtilGidBuilder builder() nothrow
  {
    return new UtilGidBuilder;
  }
}

/// Fluent builder implementation template for [atk.util.Util]
class UtilGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [atk.util.Util]
final class UtilGidBuilder : UtilGidBuilderImpl!UtilGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Util build() nothrow
  {
    return new Util(cast(void*)createGObject(Util._getGType), No.Take);
  }
}
