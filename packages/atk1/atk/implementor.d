/// Module for [Implementor] class
module atk.implementor;

public import gid.basictypes;
import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;

/** */
class Implementor
{
  AtkImplementor* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(AtkImplementor*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Gets a reference to an object's #AtkObject implementation, if
      the object implements #AtkObjectIface
      Returns: a reference to an object's #AtkObject
        implementation
  */
  atk.object.ObjectWrap refAccessible() nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_implementor_ref_accessible(cast(AtkImplementor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }
}
