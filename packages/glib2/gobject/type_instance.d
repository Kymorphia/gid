/// Module for [TypeInstance] class
module gobject.type_instance;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

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
  void* getPrivate(gobject.types.GType privateType) nothrow
  {
    auto _retval = g_type_instance_get_private(cast(GTypeInstance*)this._cPtr, privateType);
    return _retval;
  }
}
