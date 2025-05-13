/// Module for [Simd4X4F] class
module graphene.simd4_x4_f;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/** */
class Simd4X4F
{
  graphene_simd4x4f_t cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for graphene.simd4_x4_f.Simd4X4F");

    cInstance = *cast(graphene_simd4x4f_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }
}
