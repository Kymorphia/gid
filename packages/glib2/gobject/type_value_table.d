module gobject.type_value_table;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    The #GTypeValueTable provides the functions required by the #GValue
  implementation, to serve as a container for values of a type.
*/
class TypeValueTable
{
  GTypeValueTable cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.TypeValueTable");

    cInstance = *cast(GTypeValueTable*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property GTypeValueInitFunc valueInit()
  {
    return (cast(GTypeValueTable*)cPtr).valueInit;
  }

  @property void valueInit(GTypeValueInitFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).valueInit = propval;
  }

  @property GTypeValueFreeFunc valueFree()
  {
    return (cast(GTypeValueTable*)cPtr).valueFree;
  }

  @property void valueFree(GTypeValueFreeFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).valueFree = propval;
  }

  @property GTypeValueCopyFunc valueCopy()
  {
    return (cast(GTypeValueTable*)cPtr).valueCopy;
  }

  @property void valueCopy(GTypeValueCopyFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).valueCopy = propval;
  }

  @property GTypeValuePeekPointerFunc valuePeekPointer()
  {
    return (cast(GTypeValueTable*)cPtr).valuePeekPointer;
  }

  @property void valuePeekPointer(GTypeValuePeekPointerFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).valuePeekPointer = propval;
  }

  @property string collectFormat()
  {
    return (cast(GTypeValueTable*)cPtr).collectFormat.fromCString(No.Free);
  }

  @property void collectFormat(string propval)
  {
    safeFree(cast(void*)(cast(GTypeValueTable*)cPtr).collectFormat);
    (cast(GTypeValueTable*)cPtr).collectFormat = propval.toCString(Yes.Alloc);
  }

  @property GTypeValueCollectFunc collectValue()
  {
    return (cast(GTypeValueTable*)cPtr).collectValue;
  }

  @property void collectValue(GTypeValueCollectFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).collectValue = propval;
  }

  @property string lcopyFormat()
  {
    return (cast(GTypeValueTable*)cPtr).lcopyFormat.fromCString(No.Free);
  }

  @property void lcopyFormat(string propval)
  {
    safeFree(cast(void*)(cast(GTypeValueTable*)cPtr).lcopyFormat);
    (cast(GTypeValueTable*)cPtr).lcopyFormat = propval.toCString(Yes.Alloc);
  }

  @property GTypeValueLCopyFunc lcopyValue()
  {
    return (cast(GTypeValueTable*)cPtr).lcopyValue;
  }

  @property void lcopyValue(GTypeValueLCopyFunc propval)
  {
    (cast(GTypeValueTable*)cPtr).lcopyValue = propval;
  }
}
