/// Module for [Simd4X4F] class
module graphene.simd4_x4_f;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/** */
class Simd4X4F
{
  graphene_simd4x4f_t _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for graphene.simd4_x4_f.Simd4X4F");

    _cInstance = *cast(graphene_simd4x4f_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
