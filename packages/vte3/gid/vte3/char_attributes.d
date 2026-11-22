/// Module for [CharAttributes] class
module gid.vte3.char_attributes;

public import gid.core.basictypes;
import gid.core.utils;
import gid.vte3.c.functions;
import gid.vte3.c.types;
import gid.vte3.types;

/** */
class CharAttributes : StructWrap!(VteCharAttributes)
{
  /**
      Create a `char_attributes.CharAttributes` wrap type.
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
