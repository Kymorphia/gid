/// Module for [ClassClass] class
module gid.javascriptcore6.class_class;

public import gid.core.basictypes;
import gid.core.gid;
import gid.javascriptcore6.c.functions;
import gid.javascriptcore6.c.types;
import gid.javascriptcore6.types;

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
