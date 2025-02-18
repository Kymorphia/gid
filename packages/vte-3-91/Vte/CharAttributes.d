module Vte.CharAttributes;

import Gid.gid;
import Vte.Types;
import Vte.c.functions;
import Vte.c.types;

class CharAttributes
{
  VteCharAttributes cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Vte.CharAttributes");

    cInstance = *cast(VteCharAttributes*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
