/// Module for [TypeInstance] class
module gid.gobject2.type_instance;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;

/**
    An opaque structure used as the base of all type instances.
*/
class TypeInstance : StructWrap!(GTypeInstance)
{
  /**
      Create a `type_instance.TypeInstance` wrap type.
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

  /** */
  void* getPrivate(gid.gobject2.types.GType privateType) nothrow
  {
    auto _retval = g_type_instance_get_private(cast(GTypeInstance*)this._cPtr, privateType);
    return _retval;
  }
}
