/// Module for [ValueArray] class
module gobject.value_array;

import gid.gid;
import glib.types;
import gobject.boxed;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;
import gobject.value;

/**
    A [gobject.value_array.ValueArray] is a container structure to hold an array of generic values.
    
    The prime purpose of a [gobject.value_array.ValueArray] is for it to be used as an
    object property that holds an array of values. A [gobject.value_array.ValueArray] wraps
    an array of [gobject.value.Value] elements in order for it to be used as a boxed
    type through `G_TYPE_VALUE_ARRAY`.
    
    [gobject.value_array.ValueArray] is deprecated in favour of [glib.array.Array] since GLib 2.32.
    It is possible to create a [glib.array.Array] that behaves like a [gobject.value_array.ValueArray]
    by using the size of [gobject.value.Value] as the element size, and by setting
    [gobject.value.Value.unset] as the clear function using
    [glib.array.Array.setClearFunc], for instance, the following code:
    
    ```c
      GValueArray *array = g_value_array_new (10);
    ```
    
    can be replaced by:
    
    ```c
      GArray *array = g_array_sized_new (FALSE, TRUE, sizeof (GValue), 10);
      g_array_set_clear_func (array, (GDestroyNotify) g_value_unset);
    ```

    Deprecated: Use [glib.array.Array] instead, if possible for the given use case,
         as described above.
*/
class ValueArray : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_value_array_get_type != &gidSymbolNotFound ? g_value_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ValueArray self()
  {
    return this;
  }

  /**
      Get `nValues` field.
      Returns: number of values contained in the array
  */
  @property uint nValues()
  {
    return (cast(GValueArray*)this._cPtr).nValues;
  }

  /**
      Set `nValues` field.
      Params:
        propval = number of values contained in the array
  */
  @property void nValues(uint propval)
  {
    (cast(GValueArray*)this._cPtr).nValues = propval;
  }

  /**
      Get `values` field.
      Returns: array of values
  */
  @property gobject.value.Value values()
  {
    return cToD!(gobject.value.Value)(cast(void*)(cast(GValueArray*)this._cPtr).values);
  }

  /**
      Set `values` field.
      Params:
        propval = array of values
  */
  @property void values(gobject.value.Value propval)
  {
    cValueFree!(gobject.value.Value)(cast(void*)(cast(GValueArray*)this._cPtr).values);
    dToC(propval, cast(void*)&(cast(GValueArray*)this._cPtr).values);
  }

  /**
      Allocate and initialize a new #GValueArray, optionally preserve space
      for n_prealloced elements. New arrays always contain 0 elements,
      regardless of the value of n_prealloced.
  
      Params:
        nPrealloced = number of values to preallocate space for
      Returns: a newly allocated #GValueArray with 0 values
  
      Deprecated: Use #GArray and [glib.array.Array.sizedNew] instead.
  */
  this(uint nPrealloced)
  {
    GValueArray* _cretval;
    _cretval = g_value_array_new(nPrealloced);
    this(_cretval, Yes.Take);
  }

  /**
      Insert a copy of value as last element of value_array. If value is
      null, an uninitialized value is appended.
  
      Params:
        value = #GValue to copy into #GValueArray, or null
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and g_array_append_val() instead.
  */
  gobject.value_array.ValueArray append(gobject.value.Value value = null)
  {
    GValueArray* _cretval;
    _cretval = g_value_array_append(cast(GValueArray*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Construct an exact copy of a #GValueArray by duplicating all its
      contents.
      Returns: Newly allocated copy of #GValueArray
  
      Deprecated: Use #GArray and [glib.array.Array.ref_] instead.
  */
  gobject.value_array.ValueArray copy()
  {
    GValueArray* _cretval;
    _cretval = g_value_array_copy(cast(const(GValueArray)*)this._cPtr);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a pointer to the value at index_ containd in value_array.
  
      Params:
        index = index of the value of interest
      Returns: pointer to a value at index_ in value_array
  
      Deprecated: Use g_array_index() instead.
  */
  gobject.value.Value getNth(uint index)
  {
    GValue* _cretval;
    _cretval = g_value_array_get_nth(cast(GValueArray*)this._cPtr, index);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Insert a copy of value at specified position into value_array. If value
      is null, an uninitialized value is inserted.
  
      Params:
        index = insertion position, must be <= value_array->;n_values
        value = #GValue to copy into #GValueArray, or null
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and g_array_insert_val() instead.
  */
  gobject.value_array.ValueArray insert(uint index, gobject.value.Value value = null)
  {
    GValueArray* _cretval;
    _cretval = g_value_array_insert(cast(GValueArray*)this._cPtr, index, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Insert a copy of value as first element of value_array. If value is
      null, an uninitialized value is prepended.
  
      Params:
        value = #GValue to copy into #GValueArray, or null
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and g_array_prepend_val() instead.
  */
  gobject.value_array.ValueArray prepend(gobject.value.Value value = null)
  {
    GValueArray* _cretval;
    _cretval = g_value_array_prepend(cast(GValueArray*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Remove the value at position index_ from value_array.
  
      Params:
        index = position of value to remove, which must be less than
              value_array->n_values
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and [glib.array.Array.removeIndex] instead.
  */
  gobject.value_array.ValueArray remove(uint index)
  {
    GValueArray* _cretval;
    _cretval = g_value_array_remove(cast(GValueArray*)this._cPtr, index);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sort value_array using compare_func to compare the elements according
      to the semantics of #GCompareDataFunc.
      
      The current implementation uses the same sorting algorithm as standard
      C qsort() function.
  
      Params:
        compareFunc = function to compare elements
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and [glib.array.Array.sortWithData].
  */
  gobject.value_array.ValueArray sort(glib.types.CompareDataFunc compareFunc)
  {
    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
    GValueArray* _cretval;
    auto _compareFunc = compareFunc ? cast(void*)&(compareFunc) : null;
    _cretval = g_value_array_sort_with_data(cast(GValueArray*)this._cPtr, _compareFuncCB, _compareFunc);
    auto _retval = _cretval ? new gobject.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
