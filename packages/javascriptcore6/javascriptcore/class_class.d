/// Module for [ClassClass] class
module javascriptcore.class_class;

import gid.gid;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/** */
class ClassClass
{
  JSCClassClass _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for javascriptcore.class_class.ClassClass");

    _cInstance = *cast(JSCClassClass*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
