/// Module for [InitiallyUnowned] class
module gid.gobject2.initially_unowned;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    A type for objects that have an initially floating reference.
    
    All the fields in the [gid.gobject2.initially_unowned.InitiallyUnowned] structure are private to the
    implementation and should never be accessed directly.
*/
class InitiallyUnowned : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_initially_unowned_get_type != &gidSymbolNotFound ? g_initially_unowned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GInitiallyUnowned";
  }

  /** Returns `this`, for use in `with` statements. */
  override InitiallyUnowned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gobject2.initially_unowned.InitiallyUnowned]
      Returns: New builder object
  */
  static InitiallyUnownedGidBuilder builder() nothrow
  {
    return new InitiallyUnownedGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gobject2.initially_unowned.InitiallyUnowned]
class InitiallyUnownedGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gobject2.initially_unowned.InitiallyUnowned]
final class InitiallyUnownedGidBuilder : InitiallyUnownedGidBuilderImpl!InitiallyUnownedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InitiallyUnowned build() nothrow
  {
    return new InitiallyUnowned(cast(void*)createGObject(InitiallyUnowned._getGType), Yes.Take);
  }
}
