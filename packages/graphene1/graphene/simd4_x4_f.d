/// Module for [Simd4X4F] class
module graphene.simd4_x4_f;

public import gid.basictypes;
import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

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
}
