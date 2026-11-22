/// Module for [PropertyValues] class
module gid.atk1.property_values;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.value;

/**
    Note: @old_value field of #AtkPropertyValues will not contain a
    valid value. This is a field defined with the purpose of contain
    the previous value of the property, but is not used anymore.
*/
class PropertyValues : StructWrap!(AtkPropertyValues)
{
  /**
      Create a `property_values.PropertyValues` wrap type.
      Params:
        propertyName = The name of the ATK property which has changed.
  */
  this(string propertyName = string.init) nothrow
  {
    this.propertyName = propertyName;
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

  private const(char)* _propertyNameRef; // Keeps borrowed GC string alive

  /**
      Get `propertyName` field.
      Returns: The name of the ATK property which has changed.
  */
  @property string propertyName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(AtkPropertyValues*)this._cPtr).propertyName);
  }

  /**
      Set `propertyName` field.
      Params:
        propval = The name of the ATK property which has changed.
  */
  @property void propertyName(string propval) nothrow
  {
    if (_refuseBorrowedStore("propertyName"))
      return;

    _propertyNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(AtkPropertyValues*)this._cPtr).propertyName = cast(const(char)*)_propertyNameRef;
  }

  /**
      Get `oldValue` field.
      Returns: NULL. This field is not used anymore.
  */
  @property gid.gobject2.value.Value oldValue() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)&(cast(AtkPropertyValues*)this._cPtr).oldValue);
  }

  /**
      Get `newValue` field.
      Returns: The new value of the named property.
  */
  @property gid.gobject2.value.Value newValue() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)&(cast(AtkPropertyValues*)this._cPtr).newValue);
  }
}
