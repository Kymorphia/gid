/// Module for [IdStr] class
module gst.id_str;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A #GstIdStr is string type optimized for short strings and used for structure
    names, structure field names and in other places.
    
    Strings up to 16 bytes (including NUL terminator) are stored inline, other
    strings are stored on the heap.
    
    ```cpp
    GstIdStr s = GST_ID_STR_INIT;
    
    gst_id_str_set (&s, "Hello, World!");
    g_print ("%s\n", gst_id_str_as_str (&s));
    
    gst_id_str_clear (&s);
    ```
*/
class IdStr : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_id_str_get_type != &gidSymbolNotFound ? gst_id_str_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IdStr self() nothrow
  {
    return this;
  }

  /**
      Returns a newly heap allocated empty string.
      Returns: A heap-allocated string.
  */
  this() nothrow
  {
    GstIdStr* _cretval;
    _cretval = gst_id_str_new();
    this(_cretval, Yes.Take);
  }

  /** */
  string asStr() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_id_str_as_str(cast(const(GstIdStr)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Clears `s` and sets it to the empty string.
  */
  void clear() nothrow
  {
    gst_id_str_clear(cast(GstIdStr*)this._cPtr);
  }

  /**
      Copies `s` into newly allocated heap memory.
      Returns: A heap-allocated copy of `s`.
  */
  gst.id_str.IdStr copy() nothrow
  {
    GstIdStr* _cretval;
    _cretval = gst_id_str_copy(cast(const(GstIdStr)*)this._cPtr);
    auto _retval = _cretval ? new gst.id_str.IdStr(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies `s` into `d`.
  
      Params:
        s = The source [gst.id_str.IdStr]
  */
  void copyInto(gst.id_str.IdStr s) nothrow
  {
    gst_id_str_copy_into(cast(GstIdStr*)this._cPtr, s ? cast(const(GstIdStr)*)s._cPtr(No.Dup) : null);
  }

  /**
      Returns the length of `s`, exluding the NUL-terminator. This is equivalent to
      calling `strcmp()` but potentially faster.
      Returns: 
  */
  size_t getLen() nothrow
  {
    size_t _retval;
    _retval = gst_id_str_get_len(cast(const(GstIdStr)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a (usually stack-allocated) id string `s`. The newly-initialized
      id string will contain an empty string by default as value.
  */
  void init_() nothrow
  {
    gst_id_str_init(cast(GstIdStr*)this._cPtr);
  }

  /**
      Compares s1 and s2 for equality.
  
      Params:
        s2 = A [gst.id_str.IdStr]
      Returns: true if s1 and s2 are equal.
  */
  bool isEqual(gst.id_str.IdStr s2) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_id_str_is_equal(cast(const(GstIdStr)*)this._cPtr, s2 ? cast(const(GstIdStr)*)s2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Compares s1 and s2 for equality.
  
      Params:
        s2 = A string
      Returns: true if s1 and s2 are equal.
  */
  bool isEqualToStr(string s2) nothrow
  {
    bool _retval;
    const(char)* _s2 = s2.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_id_str_is_equal_to_str(cast(const(GstIdStr)*)this._cPtr, _s2);
    return _retval;
  }

  /**
      Compares s1 and s2 with length len for equality. s2 does not have to be
      NUL-terminated and len should not include the NUL-terminator.
      
      This is generally faster than [gst.id_str.IdStr.isEqualToStr] if the length is
      already known.
  
      Params:
        s2 = A string
        len = Length of s2.
      Returns: true if s1 and s2 are equal.
  */
  bool isEqualToStrWithLen(string s2, size_t len) nothrow
  {
    bool _retval;
    const(char)* _s2 = s2.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_id_str_is_equal_to_str_with_len(cast(const(GstIdStr)*)this._cPtr, _s2, len);
    return _retval;
  }

  /**
      Moves `s` into `d` and resets `s`.
  
      Params:
        s = The source [gst.id_str.IdStr]
  */
  void move(gst.id_str.IdStr s) nothrow
  {
    gst_id_str_move(cast(GstIdStr*)this._cPtr, s ? cast(GstIdStr*)s._cPtr(No.Dup) : null);
  }

  /**
      Sets `s` to the string value.
  
      Params:
        value = A NUL-terminated string
  */
  void set(string value) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_id_str_set(cast(GstIdStr*)this._cPtr, _value);
  }

  /**
      Sets `s` to the string value. value needs to be valid for the remaining
      lifetime of the process, e.g. has to be a static string.
  
      Params:
        value = A NUL-terminated string
  */
  void setStaticStr(string value) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_id_str_set_static_str(cast(GstIdStr*)this._cPtr, _value);
  }

  /**
      Sets `s` to the string value of length len. value needs to be valid for the
      remaining lifetime of the process, e.g. has to be a static string.
      
      value must be NUL-terminated and len should not include the
      NUL-terminator.
  
      Params:
        value = A string
        len = Length of the string
  */
  void setStaticStrWithLen(string value, size_t len) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_id_str_set_static_str_with_len(cast(GstIdStr*)this._cPtr, _value, len);
  }

  /**
      Sets `s` to the string value of length len. value does not have to be
      NUL-terminated and len should not include the NUL-terminator.
  
      Params:
        value = A string
        len = Length of the string
  */
  void setWithLen(string value, size_t len) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_id_str_set_with_len(cast(GstIdStr*)this._cPtr, _value, len);
  }
}
