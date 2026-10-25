/// Module for [ClassClass] class
module javascriptcore.class_class;

public import gid.basictypes;
import gid.gid;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/** */
class ClassClass
{
  JSCClassClass _cInstance;

  /**
      Create a `class_class.ClassClass` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(JSCClassClass*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }
}
