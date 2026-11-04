/// Module for [ClassClass] class
module javascriptcore.class_class;

public import gid.basictypes;
import gid.gid;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;

/** */
class ClassClass : StructWrap!(JSCClassClass)
{
  /**
      Create a `class_class.ClassClass` wrap type.
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
