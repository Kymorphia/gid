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
class TypeQuery : StructWrap!(GTypeQuery)
{
  /**
      Create a `type_query.TypeQuery` wrap type.
      Params:
        type = the #GType value of the type
        typeName = the name of the type
        classSize = the size of the class structure
        instanceSize = the size of the instance structure
  */
  this(gobject.types.GType type = gobject.types.GType.init, string typeName = string.init, uint classSize = uint.init, uint instanceSize = uint.init) nothrow
  {
    this.type = type;
    this.typeName = typeName;
    this.classSize = classSize;
    this.instanceSize = instanceSize;
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

  private const(char)* _typeNameRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("typeName"))
      return;

    _typeNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GTypeQuery*)this._cPtr).typeName = cast(const(char)*)_typeNameRef;
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
