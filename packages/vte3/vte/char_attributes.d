/// Module for [CharAttributes] class
module vte.char_attributes;

public import gid.basictypes;
import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

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
}
