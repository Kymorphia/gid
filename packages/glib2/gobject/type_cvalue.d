/// Module for [TypeCValue] class
module gobject.type_cvalue;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A union holding one collected value.
*/
class TypeCValue
{
  GTypeCValue _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.type_cvalue.TypeCValue");

    _cInstance = *cast(GTypeCValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `vInt` field.
      Returns: the field for holding integer values
  */
  @property int vInt()
  {
    return (cast(GTypeCValue*)this._cPtr).vInt;
  }

  /**
      Set `vInt` field.
      Params:
        propval = the field for holding integer values
  */
  @property void vInt(int propval)
  {
    (cast(GTypeCValue*)this._cPtr).vInt = propval;
  }

  /**
      Get `vLong` field.
      Returns: the field for holding long integer values
  */
  @property glong vLong()
  {
    return (cast(GTypeCValue*)this._cPtr).vLong;
  }

  /**
      Set `vLong` field.
      Params:
        propval = the field for holding long integer values
  */
  @property void vLong(glong propval)
  {
    (cast(GTypeCValue*)this._cPtr).vLong = propval;
  }

  /**
      Get `vInt64` field.
      Returns: the field for holding 64 bit integer values
  */
  @property long vInt64()
  {
    return (cast(GTypeCValue*)this._cPtr).vInt64;
  }

  /**
      Set `vInt64` field.
      Params:
        propval = the field for holding 64 bit integer values
  */
  @property void vInt64(long propval)
  {
    (cast(GTypeCValue*)this._cPtr).vInt64 = propval;
  }

  /**
      Get `vDouble` field.
      Returns: the field for holding floating point values
  */
  @property double vDouble()
  {
    return (cast(GTypeCValue*)this._cPtr).vDouble;
  }

  /**
      Set `vDouble` field.
      Params:
        propval = the field for holding floating point values
  */
  @property void vDouble(double propval)
  {
    (cast(GTypeCValue*)this._cPtr).vDouble = propval;
  }
}
