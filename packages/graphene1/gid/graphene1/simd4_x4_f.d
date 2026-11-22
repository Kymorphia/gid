/// Module for [Simd4X4F] class
module gid.graphene1.simd4_x4_f;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.types;

/** */
class Simd4X4F : StructWrap!(graphene_simd4x4f_t)
{
  /**
      Create a `simd4_x4_f.Simd4X4F` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }
}
