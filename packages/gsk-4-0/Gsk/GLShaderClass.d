module Gsk.GLShaderClass;

import GObject.ObjectClass;
import Gid.gid;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

class GLShaderClass
{
  GskGLShaderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.GLShaderClass");

    cInstance = *cast(GskGLShaderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GskGLShaderClass*)cPtr).parentClass);
  }
}
