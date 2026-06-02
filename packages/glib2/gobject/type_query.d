/// Module for [TypeQuery] class
module gobject.type_query;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure holding information for a specific type.
    
    See also: [gobject.global.typeQuery]
*/
class TypeQuery
{
  GTypeQuery _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GTypeQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the #GType value of the type
  */
  @property gobject.types.GType type() nothrow
  {
    return (cast(GTypeQuery*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GType value of the type
  */
  @property void type(gobject.types.GType propval) nothrow
  {
    (cast(GTypeQuery*)this._cPtr).type = propval;
  }

  /**
      Get `typeName` field.
      Returns: the name of the type
  */
  @property string typeName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GTypeQuery*)this._cPtr).typeName);
  }

  /**
      Set `typeName` field.
      Params:
        propval = the name of the type
  */
  @property void typeName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GTypeQuery*)this._cPtr).typeName);
    dToC(propval, cast(void*)&(cast(GTypeQuery*)this._cPtr).typeName);
  }

  /**
      Get `classSize` field.
      Returns: the size of the class structure
  */
  @property uint classSize() nothrow
  {
    return (cast(GTypeQuery*)this._cPtr).classSize;
  }

  /**
      Set `classSize` field.
      Params:
        propval = the size of the class structure
  */
  @property void classSize(uint propval) nothrow
  {
    (cast(GTypeQuery*)this._cPtr).classSize = propval;
  }

  /**
      Get `instanceSize` field.
      Returns: the size of the instance structure
  */
  @property uint instanceSize() nothrow
  {
    return (cast(GTypeQuery*)this._cPtr).instanceSize;
  }

  /**
      Set `instanceSize` field.
      Params:
        propval = the size of the instance structure
  */
  @property void instanceSize(uint propval) nothrow
  {
    (cast(GTypeQuery*)this._cPtr).instanceSize = propval;
  }
}
