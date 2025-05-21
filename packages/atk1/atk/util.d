/// Module for [Util] class
module atk.util;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.object;

/**
    A set of ATK utility functions for event and toolkit support.
    
    A set of ATK utility functions which are used to support event
    registration of various types, and obtaining the 'root' accessible
    of a process and information about the current ATK implementation
    and toolkit version.
*/
class Util : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_util_get_type != &gidSymbolNotFound ? atk_util_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Util self()
  {
    return this;
  }
}
