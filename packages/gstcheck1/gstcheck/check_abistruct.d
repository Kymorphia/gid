/// Module for [CheckABIStruct] class
module gstcheck.check_abistruct;

public import gid.basictypes;
import gid.gid;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.types;

/** */
class CheckABIStruct
{
  GstCheckABIStruct _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstCheckABIStruct*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: The name of the structure
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstCheckABIStruct*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the structure
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GstCheckABIStruct*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GstCheckABIStruct*)this._cPtr).name);
  }

  /**
      Get `size` field.
      Returns: The current size of a structure
  */
  @property int size() nothrow
  {
    return (cast(GstCheckABIStruct*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = The current size of a structure
  */
  @property void size(int propval) nothrow
  {
    (cast(GstCheckABIStruct*)this._cPtr).size = propval;
  }

  /**
      Get `abiSize` field.
      Returns: The reference size of the structure
  */
  @property int abiSize() nothrow
  {
    return (cast(GstCheckABIStruct*)this._cPtr).abiSize;
  }

  /**
      Set `abiSize` field.
      Params:
        propval = The reference size of the structure
  */
  @property void abiSize(int propval) nothrow
  {
    (cast(GstCheckABIStruct*)this._cPtr).abiSize = propval;
  }
}
