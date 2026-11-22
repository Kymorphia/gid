/// Module for [Uuid] class
module gid.vte3.uuid;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.vte3.c.functions;
import gid.vte3.c.types;
import gid.vte3.types;

/**
    An object representing an UUID.
*/
class Uuid : gid.gobject2.boxed.BoxedWrap!(vte_uuid_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Uuid self() nothrow
  {
    return this;
  }

  /**
      Creates a new UUID from its string representation str.
  
      Params:
        str = a string
        len = the length of str, or -1 is str is NUL terminated
        fmt = flags from #VteUuidFormat for which fmt(s) to accept
      Returns: a new UUID, or null is
          str is not a valid UUID string representation
  */
  static gid.vte3.uuid.Uuid newFromString(string str, ptrdiff_t len, gid.vte3.types.UuidFormat fmt) nothrow
  {
    VteUuid* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_uuid_new_from_string(_str, len, fmt);
    auto _retval = _cretval ? new gid.vte3.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new random UUID.
      Returns: a new v4 UUID
  */
  static gid.vte3.uuid.Uuid newV4() nothrow
  {
    VteUuid* _cretval;
    _cretval = vte_uuid_new_v4();
    auto _retval = _cretval ? new gid.vte3.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of uuid.
      Returns: a new copy of @uuid
  */
  gid.vte3.uuid.Uuid dup() nothrow
  {
    VteUuid* _cretval;
    _cretval = vte_uuid_dup(cast(const(VteUuid)*)this._cPtr);
    auto _retval = _cretval ? new gid.vte3.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares uuid and other for equality.
  
      Params:
        other = 
      Returns: true iff uuid and other are equal
  */
  bool equal(gid.vte3.uuid.Uuid other) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_uuid_equal(cast(const(VteUuid)*)this._cPtr, other ? cast(const(VteUuid)*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a new UUID for ns and str.
  
      Params:
        data = string data
        len = the length of data, or -1 if str is NUL terminated
      Returns: a new v5 UUID
  */
  gid.vte3.uuid.Uuid newV5(string data, ptrdiff_t len) nothrow
  {
    VteUuid* _cretval;
    const(char)* _data = data.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_uuid_new_v5(cast(const(VteUuid)*)this._cPtr, _data, len);
    auto _retval = _cretval ? new gid.vte3.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the string representation of uuid.
  
      Params:
        fmt = a #VteUuidFormat
        len = a location to store the length of the returned string, or null
      Returns: a string representation of uuid
  */
  string toString_(gid.vte3.types.UuidFormat fmt, out size_t len) nothrow
  {
    char* _cretval;
    _cretval = vte_uuid_to_string(cast(const(VteUuid)*)this._cPtr, fmt, cast(size_t*)&len);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks whether str is a valid string representation of an UUID.
  
      Params:
        str = a string
        len = the length of str, or -1 is str is NUL terminated
        fmt = a #VteUuidFormat
      Returns: true iff str is a valid string representation
  */
  static bool validateString(string str, ptrdiff_t len, gid.vte3.types.UuidFormat fmt) nothrow
  {
    bool _retval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_uuid_validate_string(_str, len, fmt);
    return _retval;
  }
}
