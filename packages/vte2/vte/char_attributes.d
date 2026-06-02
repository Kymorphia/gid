/// Module for [CharAttributes] class
module vte.char_attributes;

public import gid.basictypes;
import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/** */
class CharAttributes
{
  VteCharAttributes _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(VteCharAttributes*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }
}
