/// Module for [CharAttributes] class
module gid.vte2.char_attributes;

public import gid.core.basictypes;
import gid.core.utils;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.types;

/** */
@gidGir("CharAttributes")
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
