/// Module for [Util] class
module gid.atk1.util;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A set of ATK utility functions for event and toolkit support.
    
    A set of ATK utility functions which are used to support event
    registration of various types, and obtaining the 'root' accessible
    of a process and information about the current ATK implementation
    and toolkit version.
*/
class Util : gid.gobject2.object.ObjectWrap
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
    return cast(void function())atk_util_get_type != &gidSymbolNotFound ? atk_util_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkUtil";
  }

  /** Returns `this`, for use in `with` statements. */
  override Util self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.util.Util]
      Returns: New builder object
  */
  static UtilGidBuilder builder() nothrow
  {
    return new UtilGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.atk1.util.Util]
class UtilGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.util.Util]
final class UtilGidBuilder : UtilGidBuilderImpl!UtilGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Util build() nothrow
  {
    return new Util(cast(void*)createGObject(Util._getGType), Yes.Take);
  }
}
