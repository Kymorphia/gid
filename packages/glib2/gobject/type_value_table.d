/// Module for [TypeValueTable] class
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
  GTypeValueTable _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.type_value_table.TypeValueTable");

    _cInstance = *cast(GTypeValueTable*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `valueInit` field.
      Returns: Function to initialize a GValue
  */
  @property GTypeValueInitFunc valueInit()
  {
    return (cast(GTypeValueTable*)this._cPtr).valueInit;
  }

  /**
      Set `valueInit` field.
      Params:
        propval = Function to initialize a GValue
  */

  @property void valueInit(GTypeValueInitFunc propval)
  {
    (cast(GTypeValueTable*)this._cPtr).valueInit = propval;
  }

  /**
      Get `valueFree` field.
      Returns: Function to free a GValue
  */
  @property GTypeValueFreeFunc valueFree()
  {
    return (cast(GTypeValueTable*)this._cPtr).valueFree;
  }

  /**
      Set `valueFree` field.
      Params:
        propval = Function to free a GValue
  */

  @property void valueFree(GTypeValueFreeFunc propval)
  {
    (cast(GTypeValueTable*)this._cPtr).valueFree = propval;
  }

  /**
      Get `valueCopy` field.
      Returns: Function to copy a GValue
  */
  @property GTypeValueCopyFunc valueCopy()
  {
    return (cast(GTypeValueTable*)this._cPtr).valueCopy;
  }

  /**
      Set `valueCopy` field.
      Params:
        propval = Function to copy a GValue
  */

  @property void valueCopy(GTypeValueCopyFunc propval)
  {
    (cast(GTypeValueTable*)this._cPtr).valueCopy = propval;
  }

  /**
      Get `valuePeekPointer` field.
      Returns: Function to peek the contents of a GValue if they fit
          into a pointer
  */
  @property GTypeValuePeekPointerFunc valuePeekPointer()
  {
    return (cast(GTypeValueTable*)this._cPtr).valuePeekPointer;
  }

  /**
      Set `valuePeekPointer` field.
      Params:
        propval = Function to peek the contents of a GValue if they fit
            into a pointer
  */

  @property void valuePeekPointer(GTypeValuePeekPointerFunc propval)
  {
    (cast(GTypeValueTable*)this._cPtr).valuePeekPointer = propval;
  }

  /**
      Get `collectFormat` field.
      Returns: A string format describing how to collect the contents of
          this value bit-by-bit. Each character in the format represents
          an argument to be collected, and the characters themselves indicate
          the type of the argument. Currently supported arguments are:
           $(LIST
                * `'i'`: Integers, passed as `collect_values[].v_int`
                * `'l'`: Longs, passed as `collect_values[].v_long`
                * `'d'`: Doubles, passed as `collect_values[].v_double`
                * `'p'`: Pointers, passed as `collect_values[].v_pointer`
           )
          It should be noted that for variable argument list construction,
          ANSI C promotes every type smaller than an integer to an int, and
          floats to doubles. So for collection of short int or char, `'i'`
          needs to be used, and for collection of floats `'d'`.
  */
  @property string collectFormat()
  {
    return cToD!(string)(cast(void*)(cast(GTypeValueTable*)this._cPtr).collectFormat);
  }

  /**
      Set `collectFormat` field.
      Params:
        propval = A string format describing how to collect the contents of
            this value bit-by-bit. Each character in the format represents
            an argument to be collected, and the characters themselves indicate
            the type of the argument. Currently supported arguments are:
             $(LIST
                  * `'i'`: Integers, passed as `collect_values[].v_int`
                  * `'l'`: Longs, passed as `collect_values[].v_long`
                  * `'d'`: Doubles, passed as `collect_values[].v_double`
                  * `'p'`: Pointers, passed as `collect_values[].v_pointer`
             )
            It should be noted that for variable argument list construction,
            ANSI C promotes every type smaller than an integer to an int, and
            floats to doubles. So for collection of short int or char, `'i'`
            needs to be used, and for collection of floats `'d'`.
  */
  @property void collectFormat(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTypeValueTable*)this._cPtr).collectFormat);
    dToC(propval, cast(void*)&(cast(GTypeValueTable*)this._cPtr).collectFormat);
  }

  /**
      Get `lcopyFormat` field.
      Returns: Format description of the arguments to collect for @lcopy_value,
          analogous to @collect_format. Usually, @lcopy_format string consists
          only of `'p'`s to provide lcopy_value() with pointers to storage locations.
  */
  @property string lcopyFormat()
  {
    return cToD!(string)(cast(void*)(cast(GTypeValueTable*)this._cPtr).lcopyFormat);
  }

  /**
      Set `lcopyFormat` field.
      Params:
        propval = Format description of the arguments to collect for @lcopy_value,
            analogous to @collect_format. Usually, @lcopy_format string consists
            only of `'p'`s to provide lcopy_value() with pointers to storage locations.
  */
  @property void lcopyFormat(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GTypeValueTable*)this._cPtr).lcopyFormat);
    dToC(propval, cast(void*)&(cast(GTypeValueTable*)this._cPtr).lcopyFormat);
  }
}
