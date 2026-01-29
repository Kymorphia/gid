/// Module for [VariantDict] class
module glib.variant_dict;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.boxed;

/**
    #GVariantDict is a mutable interface to #GVariant dictionaries.
    
    It can be used for doing a sequence of dictionary lookups in an
    efficient way on an existing #GVariant dictionary or it can be used
    to construct new dictionaries with a hashtable-like interface.  It
    can also be used for taking existing dictionaries and modifying them
    in order to create new ones.
    
    #GVariantDict can only be used with `G_VARIANT_TYPE_VARDICT`
    dictionaries.
    
    It is possible to use #GVariantDict allocated on the stack or on the
    heap.  When using a stack-allocated #GVariantDict, you begin with a
    call to [glib.variant_dict.VariantDict.init_] and free the resources with a call to
    [glib.variant_dict.VariantDict.clear].
    
    Heap-allocated #GVariantDict follows normal refcounting rules: you
    allocate it with [glib.variant_dict.VariantDict.new_] and use [glib.variant_dict.VariantDict.ref_]
    and [glib.variant_dict.VariantDict.unref].
    
    [glib.variant_dict.VariantDict.end] is used to convert the #GVariantDict back into a
    dictionary-type #GVariant.  When used with stack-allocated instances,
    this also implicitly frees all associated memory, but for
    heap-allocated instances, you must still call [glib.variant_dict.VariantDict.unref]
    afterwards.
    
    You will typically want to use a heap-allocated #GVariantDict when
    you expose it as part of an API.  For most other uses, the
    stack-allocated form will be more convenient.
    
    Consider the following two examples that do the same thing in each
    style: take an existing dictionary and look up the "count" uint32
    key, adding 1 to it if it is found, or returning an error if the
    key is not found.  Each returns the new dictionary as a floating
    #GVariant.
    
    ## Using a stack-allocated GVariantDict
    
    ```c
      GVariant *
      add_to_count (GVariant  *orig,
                    GError   **error)
      {
        GVariantDict dict;
        guint32 count;
    
        g_variant_dict_init (&dict, orig);
        if (!g_variant_dict_lookup (&dict, "count", "u", &count))
          {
            g_set_error (...);
            g_variant_dict_clear (&dict);
            return NULL;
          }
    
        g_variant_dict_insert (&dict, "count", "u", count + 1);
    
        return g_variant_dict_end (&dict);
      }
    ```
    
    ## Using heap-allocated GVariantDict
    
    ```c
      GVariant *
      add_to_count (GVariant  *orig,
                    GError   **error)
      {
        GVariantDict *dict;
        GVariant *result;
        guint32 count;
    
        dict = g_variant_dict_new (orig);
    
        if (g_variant_dict_lookup (dict, "count", "u", &count))
          {
            g_variant_dict_insert (dict, "count", "u", count + 1);
            result = g_variant_dict_end (dict);
          }
        else
          {
            g_set_error (...);
            result = NULL;
          }
    
        g_variant_dict_unref (dict);
    
        return result;
      }
    ```
*/
class VariantDict : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_variant_dict_get_type != &gidSymbolNotFound ? g_variant_dict_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VariantDict self()
  {
    return this;
  }

  /**
      Allocates and initialises a new #GVariantDict.
      
      You should call [glib.variant_dict.VariantDict.unref] on the return value when it
      is no longer needed.  The memory will not be automatically freed by
      any other call.
      
      In some cases it may be easier to place a #GVariantDict directly on
      the stack of the calling function and initialise it with
      [glib.variant_dict.VariantDict.init_].  This is particularly useful when you are
      using #GVariantDict to construct a #GVariant.
  
      Params:
        fromAsv = the #GVariant with which to initialise the
            dictionary
      Returns: a #GVariantDict
  */
  this(glib.variant.Variant fromAsv = null)
  {
    GVariantDict* _cretval;
    _cretval = g_variant_dict_new(fromAsv ? cast(GVariant*)fromAsv._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Releases all memory associated with a #GVariantDict without freeing
      the #GVariantDict structure itself.
      
      It typically only makes sense to do this on a stack-allocated
      #GVariantDict if you want to abort building the value part-way
      through.  This function need not be called if you call
      [glib.variant_dict.VariantDict.end] and it also doesn't need to be called on dicts
      allocated with g_variant_dict_new (see [glib.variant_dict.VariantDict.unref] for
      that).
      
      It is valid to call this function on either an initialised
      #GVariantDict or one that was previously cleared by an earlier call
      to [glib.variant_dict.VariantDict.clear] but it is not valid to call this function
      on uninitialised memory.
  */
  void clear()
  {
    g_variant_dict_clear(cast(GVariantDict*)this._cPtr);
  }

  /**
      Checks if key exists in dict.
  
      Params:
        key = the key to look up in the dictionary
      Returns: true if key is in dict
  */
  bool contains(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_variant_dict_contains(cast(GVariantDict*)this._cPtr, _key);
    return _retval;
  }

  /**
      Returns the current value of dict as a #GVariant of type
      `G_VARIANT_TYPE_VARDICT`, clearing it in the process.
      
      It is not permissible to use dict in any way after this call except
      for reference counting operations (in the case of a heap-allocated
      #GVariantDict) or by reinitialising it with [glib.variant_dict.VariantDict.init_] (in
      the case of stack-allocated).
      Returns: a new, floating, #GVariant
  */
  glib.variant.Variant end()
  {
    GVariant* _cretval;
    _cretval = g_variant_dict_end(cast(GVariantDict*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts (or replaces) a key in a #GVariantDict.
      
      value is consumed if it is floating.
  
      Params:
        key = the key to insert a value for
        value = the value to insert
  */
  void insertValue(string key, glib.variant.Variant value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    g_variant_dict_insert_value(cast(GVariantDict*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Looks up a value in a #GVariantDict.
      
      If key is not found in dictionary, null is returned.
      
      The expected_type string specifies what type of value is expected.
      If the value associated with key has a different type then null is
      returned.
      
      If the key is found and the value has the correct type, it is
      returned.  If expected_type was specified then any non-null return
      value will have this type.
  
      Params:
        key = the key to look up in the dictionary
        expectedType = a #GVariantType, or null
      Returns: the value of the dictionary key, or null
  */
  glib.variant.Variant lookupValue(string key, glib.variant_type.VariantType expectedType = null)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_variant_dict_lookup_value(cast(GVariantDict*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Removes a key and its associated value from a #GVariantDict.
  
      Params:
        key = the key to remove
      Returns: true if the key was found and removed
  */
  bool remove(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_variant_dict_remove(cast(GVariantDict*)this._cPtr, _key);
    return _retval;
  }
}
