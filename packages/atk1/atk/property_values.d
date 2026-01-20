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
  AtkPropertyValues _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for atk.property_values.PropertyValues");

    _cInstance = *cast(AtkPropertyValues*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `propertyName` field.
      Returns: The name of the ATK property which has changed.
  */
  @property string propertyName()
  {
    return cToD!(string)(cast(void*)(cast(AtkPropertyValues*)this._cPtr).propertyName);
  }

  /**
      Set `propertyName` field.
      Params:
        propval = The name of the ATK property which has changed.
  */
  @property void propertyName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkPropertyValues*)this._cPtr).propertyName);
    dToC(propval, cast(void*)&(cast(AtkPropertyValues*)this._cPtr).propertyName);
  }

  /**
      Get `oldValue` field.
      Returns: NULL. This field is not used anymore.
  */
  @property gobject.value.Value oldValue()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(AtkPropertyValues*)this._cPtr).oldValue);
  }

  /**
      Get `newValue` field.
      Returns: The new value of the named property.
  */
  @property gobject.value.Value newValue()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(AtkPropertyValues*)this._cPtr).newValue);
  }
}
