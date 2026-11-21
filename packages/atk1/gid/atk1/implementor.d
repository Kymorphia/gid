/// Module for [Implementor] class
module gid.atk1.implementor;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.gid;
import gid.gobject2.object;

/** */
class Implementor : OpaqueWrap!(AtkImplementor*, void, void)
{

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

  /**
      Gets a reference to an object's #AtkObject implementation, if
      the object implements #AtkObjectIface
      Returns: a reference to an object's #AtkObject
        implementation
  */
  gid.atk1.object.ObjectWrap refAccessible() nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_implementor_ref_accessible(cast(AtkImplementor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }
}
