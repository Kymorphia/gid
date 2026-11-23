/// Module for [ValueArray] class
module gid.gobject2.value_array;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    A [gid.gobject2.value_array.ValueArray] is a container structure to hold an array of generic values.
    
    The prime purpose of a [gid.gobject2.value_array.ValueArray] is for it to be used as an
    object property that holds an array of values. A [gid.gobject2.value_array.ValueArray] wraps
    an array of [gid.gobject2.value.Value] elements in order for it to be used as a boxed
    type through `G_TYPE_VALUE_ARRAY`.
    
    [gid.gobject2.value_array.ValueArray] is deprecated in favour of [gid.glib2.array.Array] since GLib 2.32.
    It is possible to create a [gid.glib2.array.Array] that behaves like a [gid.gobject2.value_array.ValueArray]
    by using the size of [gid.gobject2.value.Value] as the element size, and by setting
    [gid.gobject2.value.Value.unset] as the clear function using
    [gid.glib2.array.Array.setClearFunc], for instance, the following code:
    
    ```c
      GValueArray *array = g_value_array_new (10);
    ```
    
    can be replaced by:
    
    ```c
      GArray *array = g_array_sized_new (FALSE, TRUE, sizeof (GValue), 10);
      g_array_set_clear_func (array, (GDestroyNotify) g_value_unset);
    ```

    Deprecated: Use [gid.glib2.array.Array] instead, if possible for the given use case,
         as described above.
*/
class ValueArray : gid.gobject2.boxed.BoxedWrap!(g_value_array_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ValueArray self() nothrow
  {
    return this;
  }

  /**
      Get `nValues` field.
      Returns: number of values contained in the array
  */
  @property uint nValues() nothrow
  {
    return (cast(GValueArray*)this._cPtr).nValues;
  }

  /**
      Set `nValues` field.
      Params:
        propval = number of values contained in the array
  */
  @property void nValues(uint propval) nothrow
  {
    (cast(GValueArray*)this._cPtr).nValues = propval;
  }

  /**
      Get `values` field.
      Returns: array of values
  */
  @property gid.gobject2.value.Value values() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)(cast(GValueArray*)this._cPtr).values);
  }

  /**
      Allocate and initialize a new #GValueArray, optionally preserve space
      for n_prealloced elements. New arrays always contain 0 elements,
      regardless of the value of n_prealloced.
  
      Params:
        nPrealloced = number of values to preallocate space for
      Returns: a newly allocated #GValueArray with 0 values
  
      Deprecated: Use #GArray and [gid.glib2.array.Array.sizedNew] instead.
  */
  this(uint nPrealloced) nothrow
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
  gid.gobject2.value_array.ValueArray append(gid.gobject2.value.Value value = null) nothrow
  {
    GValueArray* _cretval;
    _cretval = g_value_array_append(cast(GValueArray*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Construct an exact copy of a #GValueArray by duplicating all its
      contents.
      Returns: Newly allocated copy of #GValueArray
  
      Deprecated: Use #GArray and [gid.glib2.array.Array.ref_] instead.
  */
  gid.gobject2.value_array.ValueArray copy() nothrow
  {
    GValueArray* _cretval;
    _cretval = g_value_array_copy(cast(const(GValueArray)*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a pointer to the value at index_ contained in value_array.
  
      Params:
        index = index of the value of interest
      Returns: pointer to a value at index_ in value_array
  
      Deprecated: Use g_array_index() instead.
  */
  gid.gobject2.value.Value getNth(uint index) nothrow
  {
    GValue* _cretval;
    _cretval = g_value_array_get_nth(cast(GValueArray*)this._cPtr, index);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, No.Take) : null;
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
  gid.gobject2.value_array.ValueArray insert(uint index, gid.gobject2.value.Value value = null) nothrow
  {
    GValueArray* _cretval;
    _cretval = g_value_array_insert(cast(GValueArray*)this._cPtr, index, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
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
  gid.gobject2.value_array.ValueArray prepend(gid.gobject2.value.Value value = null) nothrow
  {
    GValueArray* _cretval;
    _cretval = g_value_array_prepend(cast(GValueArray*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Remove the value at position index_ from value_array.
  
      Params:
        index = position of value to remove, which must be less than
              value_array->n_values
      Returns: the #GValueArray passed in as value_array
  
      Deprecated: Use #GArray and [gid.glib2.array.Array.removeIndex] instead.
  */
  gid.gobject2.value_array.ValueArray remove(uint index) nothrow
  {
    GValueArray* _cretval;
    _cretval = g_value_array_remove(cast(GValueArray*)this._cPtr, index);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
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
  
      Deprecated: Use #GArray and [gid.glib2.array.Array.sortWithData].
  */
  gid.gobject2.value_array.ValueArray sort(gid.glib2.types.CompareDataFunc compareFunc) nothrow
  {
    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.glib2.types.CompareDataFunc*)userData;

      try
      {
        _retval = (*_dlg)(a, b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.CompareDataFunc");
      }
      return _retval;
    }
    auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
    GValueArray* _cretval;
    auto _compareFunc = compareFunc ? cast(void*)&(compareFunc) : null;
    _cretval = g_value_array_sort_with_data(cast(GValueArray*)this._cPtr, _compareFuncCB, _compareFunc);
    auto _retval = _cretval ? new gid.gobject2.value_array.ValueArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
