/// Module for [InitiallyUnowned] class
module gobject.initially_unowned;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.gid_builder;
import gobject.object;
import gobject.types;

/**
    A type for objects that have an initially floating reference.
    
    All the fields in the [gobject.initially_unowned.InitiallyUnowned] structure are private to the
    implementation and should never be accessed directly.
*/
class InitiallyUnowned : gobject.object.ObjectWrap
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
    return cast(void function())g_initially_unowned_get_type != &gidSymbolNotFound ? g_initially_unowned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InitiallyUnowned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gobject.initially_unowned.InitiallyUnowned]
      Returns: New builder object
  */
  static InitiallyUnownedGidBuilder builder() nothrow
  {
    return new InitiallyUnownedGidBuilder;
  }
}

/// Fluent builder implementation template for [gobject.initially_unowned.InitiallyUnowned]
class InitiallyUnownedGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gobject.initially_unowned.InitiallyUnowned]
final class InitiallyUnownedGidBuilder : InitiallyUnownedGidBuilderImpl!InitiallyUnownedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InitiallyUnowned build() nothrow
  {
    return new InitiallyUnowned(cast(void*)createGObject(InitiallyUnowned._getGType), No.Take);
  }
}
