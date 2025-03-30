/// Module for [PropertyValues] class
module atk.property_values;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.value;

/**
    Note: @old_value field of #AtkPropertyValues will not contain a
    valid value. This is a field defined with the purpose of contain
    the previous value of the property, but is not used anymore.
*/
class PropertyValues
{
  AtkPropertyValues cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.PropertyValues");

    cInstance = *cast(AtkPropertyValues*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string propertyName()
  {
    return cToD!(string)(cast(void*)(cast(AtkPropertyValues*)cPtr).propertyName);
  }

  @property void propertyName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkPropertyValues*)cPtr).propertyName);
    dToC(propval, cast(void*)&(cast(AtkPropertyValues*)cPtr).propertyName);
  }

  @property gobject.value.Value oldValue()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(AtkPropertyValues*)cPtr).oldValue);
  }

  @property gobject.value.Value newValue()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(AtkPropertyValues*)cPtr).newValue);
  }
}
