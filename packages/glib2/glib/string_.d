/// Module for [String] class
module glib.string_;

import gid.gid;
import glib.bytes;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    A [glib.string_.String] is an object that handles the memory management of a C string.
    
    The emphasis of [glib.string_.String] is on text, typically UTF-8. Crucially, the "str" member
    of a [glib.string_.String] is guaranteed to have a trailing nul character, and it is therefore
    always safe to call functions such as `strchr()` or `strdup()` on it.
    
    However, a [glib.string_.String] can also hold arbitrary binary data, because it has a "len" member,
    which includes any possible embedded nul characters in the data. Conceptually then,
    [glib.string_.String] is like a [glib.byte_array.ByteArray] with the addition of many convenience methods for
    text, and a guaranteed nul terminator.
*/
class String : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_gstring_get_type != &gidSymbolNotFound ? g_gstring_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override String self()
  {
    return this;
  }

  /**
      Get `str` field.
      Returns: points to the character data. It may move as text is added.
        The @str field is null-terminated and so
        can be used as an ordinary C string.
  */
  @property string str()
  {
    return cToD!(string)(cast(void*)(cast(GString*)this._cPtr).str);
  }

  /**
      Set `str` field.
      Params:
        propval = points to the character data. It may move as text is added.
          The @str field is null-terminated and so
          can be used as an ordinary C string.
  */
  @property void str(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GString*)this._cPtr).str);
    dToC(propval, cast(void*)&(cast(GString*)this._cPtr).str);
  }

  /**
      Get `len` field.
      Returns: contains the length of the string, not including the
        terminating nul byte.
  */
  @property size_t len()
  {
    return (cast(GString*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = contains the length of the string, not including the
          terminating nul byte.
  */
  @property void len(size_t propval)
  {
    (cast(GString*)this._cPtr).len = propval;
  }

  /**
      Get `allocatedLen` field.
      Returns: the number of bytes that can be stored in the
        string before it needs to be reallocated. May be larger than @len.
  */
  @property size_t allocatedLen()
  {
    return (cast(GString*)this._cPtr).allocatedLen;
  }

  /**
      Set `allocatedLen` field.
      Params:
        propval = the number of bytes that can be stored in the
          string before it needs to be reallocated. May be larger than @len.
  */
  @property void allocatedLen(size_t propval)
  {
    (cast(GString*)this._cPtr).allocatedLen = propval;
  }

  /**
      Creates a new #GString, initialized with the given string.
  
      Params:
        init_ = the initial text to copy into the string, or null to
            start with an empty string
      Returns: the new #GString
  */
  this(string init_ = null)
  {
    GString* _cretval;
    const(char)* _init_ = init_.toCString(No.Alloc);
    _cretval = g_string_new(_init_);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GString with len bytes of the init buffer.
      Because a length is provided, init need not be nul-terminated,
      and can contain embedded nul bytes.
      
      Since this function does not stop at nul bytes, it is the caller's
      responsibility to ensure that init has at least len addressable
      bytes.
  
      Params:
        init_ = initial contents of the string
        len = length of init to use
      Returns: a new #GString
  */
  static glib.string_.String newLen(string init_, ptrdiff_t len)
  {
    GString* _cretval;
    const(char)* _init_ = init_.toCString(No.Alloc);
    _cretval = g_string_new_len(_init_, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GString, initialized with the given string.
      
      After this call, init belongs to the #GString and may no longer be
      modified by the caller. The memory of data has to be dynamically
      allocated and will eventually be freed with [glib.global.gfree].
  
      Params:
        init_ = initial text used as the string.
              Ownership of the string is transferred to the #GString.
              Passing null creates an empty string.
      Returns: the new #GString
  */
  static glib.string_.String newTake(string init_ = null)
  {
    GString* _cretval;
    char* _init_ = init_.toCString(Yes.Alloc);
    _cretval = g_string_new_take(_init_);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GString, with enough space for dfl_size
      bytes. This is useful if you are going to add a lot of
      text to the string and don't want it to be reallocated
      too often.
  
      Params:
        dflSize = the default size of the space allocated to hold the string
      Returns: the new #GString
  */
  static glib.string_.String sizedNew(size_t dflSize)
  {
    GString* _cretval;
    _cretval = g_string_sized_new(dflSize);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds a string onto the end of a #GString, expanding
      it if necessary.
  
      Params:
        val = the string to append onto the end of string
      Returns: string
  */
  glib.string_.String append(string val)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_append(cast(GString*)this._cPtr, _val);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a byte onto the end of a #GString, expanding
      it if necessary.
  
      Params:
        c = the byte to append onto the end of string
      Returns: string
  */
  glib.string_.String appendC(char c)
  {
    GString* _cretval;
    _cretval = g_string_append_c(cast(GString*)this._cPtr, c);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Appends len bytes of val to string.
      
      If len is positive, val may contain embedded nuls and need
      not be nul-terminated. It is the caller's responsibility to
      ensure that val has at least len addressable bytes.
      
      If len is negative, val must be nul-terminated and len
      is considered to request the entire string length. This
      makes [glib.string_.String.appendLen] equivalent to [glib.string_.String.append].
  
      Params:
        val = bytes to append
        len = number of bytes of val to use, or -1 for all of val
      Returns: string
  */
  glib.string_.String appendLen(string val, ptrdiff_t len)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_append_len(cast(GString*)this._cPtr, _val, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts a Unicode character into UTF-8, and appends it
      to the string.
  
      Params:
        wc = a Unicode character
      Returns: string
  */
  glib.string_.String appendUnichar(dchar wc)
  {
    GString* _cretval;
    _cretval = g_string_append_unichar(cast(GString*)this._cPtr, wc);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Appends unescaped to string, escaping any characters that
      are reserved in URIs using URI-style escape sequences.
  
      Params:
        unescaped = a string
        reservedCharsAllowed = a string of reserved characters allowed
              to be used, or null
        allowUtf8 = set true if the escaped string may include UTF8 characters
      Returns: string
  */
  glib.string_.String appendUriEscaped(string unescaped, string reservedCharsAllowed, bool allowUtf8)
  {
    GString* _cretval;
    const(char)* _unescaped = unescaped.toCString(No.Alloc);
    const(char)* _reservedCharsAllowed = reservedCharsAllowed.toCString(No.Alloc);
    _cretval = g_string_append_uri_escaped(cast(GString*)this._cPtr, _unescaped, _reservedCharsAllowed, allowUtf8);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts all uppercase ASCII letters to lowercase ASCII letters.
      Returns: passed-in string pointer, with all the
            uppercase characters converted to lowercase in place,
            with semantics that exactly match [glib.global.asciiTolower].
  */
  glib.string_.String asciiDown()
  {
    GString* _cretval;
    _cretval = g_string_ascii_down(cast(GString*)this._cPtr);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts all lowercase ASCII letters to uppercase ASCII letters.
      Returns: passed-in string pointer, with all the
            lowercase characters converted to uppercase in place,
            with semantics that exactly match [glib.global.asciiToupper].
  */
  glib.string_.String asciiUp()
  {
    GString* _cretval;
    _cretval = g_string_ascii_up(cast(GString*)this._cPtr);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Copies the bytes from a string into a #GString,
      destroying any previous contents. It is rather like
      the standard strcpy() function, except that you do not
      have to worry about having enough space to copy the string.
  
      Params:
        rval = the string to copy into string
      Returns: string
  */
  glib.string_.String assign(string rval)
  {
    GString* _cretval;
    const(char)* _rval = rval.toCString(No.Alloc);
    _cretval = g_string_assign(cast(GString*)this._cPtr, _rval);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts a #GString to lowercase.
      Returns: the #GString
  
      Deprecated: This function uses the locale-specific
            tolower() function, which is almost never the right thing.
            Use [glib.string_.String.asciiDown] or [glib.global.utf8Strdown] instead.
  */
  glib.string_.String down()
  {
    GString* _cretval;
    _cretval = g_string_down(cast(GString*)this._cPtr);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Compares two strings for equality, returning true if they are equal.
      For use with #GHashTable.
  
      Params:
        v2 = another #GString
      Returns: true if the strings are the same length and contain the
            same bytes
  */
  bool equal(glib.string_.String v2)
  {
    bool _retval;
    _retval = cast(bool)g_string_equal(cast(const(GString)*)this._cPtr, v2 ? cast(const(GString)*)v2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes len bytes from a #GString, starting at position pos.
      The rest of the #GString is shifted down to fill the gap.
  
      Params:
        pos = the position of the content to remove
        len = the number of bytes to remove, or -1 to remove all
                following bytes
      Returns: string
  */
  glib.string_.String erase(ptrdiff_t pos, ptrdiff_t len)
  {
    GString* _cretval;
    _cretval = g_string_erase(cast(GString*)this._cPtr, pos, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Frees the memory allocated for the #GString.
      
      The caller gains ownership of the buffer and
      must free it after use with [glib.global.gfree].
      Returns: the character data of string
  */
  string freeAndSteal()
  {
    char* _cretval;
    _cretval = g_string_free_and_steal(cast(GString*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Transfers ownership of the contents of string to a newly allocated
      #GBytes.  The #GString structure itself is deallocated, and it is
      therefore invalid to use string after invoking this function.
      
      Note that while #GString ensures that its buffer always has a
      trailing nul character (not reflected in its "len"), the returned
      #GBytes does not include this extra nul; i.e. it has length exactly
      equal to the "len" member.
      Returns: A newly allocated #GBytes containing contents of string; string itself is freed
  */
  glib.bytes.Bytes freeToBytes()
  {
    GBytes* _cretval;
    _cretval = g_string_free_to_bytes(cast(GString*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a hash code for str; for use with #GHashTable.
      Returns: hash code for str
  */
  uint hash()
  {
    uint _retval;
    _retval = g_string_hash(cast(const(GString)*)this._cPtr);
    return _retval;
  }

  /**
      Inserts a copy of a string into a #GString,
      expanding it if necessary.
  
      Params:
        pos = the position to insert the copy of the string
        val = the string to insert
      Returns: string
  */
  glib.string_.String insert(ptrdiff_t pos, string val)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_insert(cast(GString*)this._cPtr, pos, _val);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts a byte into a #GString, expanding it if necessary.
  
      Params:
        pos = the position to insert the byte
        c = the byte to insert
      Returns: string
  */
  glib.string_.String insertC(ptrdiff_t pos, char c)
  {
    GString* _cretval;
    _cretval = g_string_insert_c(cast(GString*)this._cPtr, pos, c);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts len bytes of val into string at pos.
      
      If len is positive, val may contain embedded nuls and need
      not be nul-terminated. It is the caller's responsibility to
      ensure that val has at least len addressable bytes.
      
      If len is negative, val must be nul-terminated and len
      is considered to request the entire string length.
      
      If pos is -1, bytes are inserted at the end of the string.
  
      Params:
        pos = position in string where insertion should
                happen, or -1 for at the end
        val = bytes to insert
        len = number of bytes of val to insert, or -1 for all of val
      Returns: string
  */
  glib.string_.String insertLen(ptrdiff_t pos, string val, ptrdiff_t len)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_insert_len(cast(GString*)this._cPtr, pos, _val, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts a Unicode character into UTF-8, and insert it
      into the string at the given position.
  
      Params:
        pos = the position at which to insert character, or -1
              to append at the end of the string
        wc = a Unicode character
      Returns: string
  */
  glib.string_.String insertUnichar(ptrdiff_t pos, dchar wc)
  {
    GString* _cretval;
    _cretval = g_string_insert_unichar(cast(GString*)this._cPtr, pos, wc);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Overwrites part of a string, lengthening it if necessary.
  
      Params:
        pos = the position at which to start overwriting
        val = the string that will overwrite the string starting at pos
      Returns: string
  */
  glib.string_.String overwrite(size_t pos, string val)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_overwrite(cast(GString*)this._cPtr, pos, _val);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Overwrites part of a string, lengthening it if necessary.
      This function will work with embedded nuls.
  
      Params:
        pos = the position at which to start overwriting
        val = the string that will overwrite the string starting at pos
        len = the number of bytes to write from val
      Returns: string
  */
  glib.string_.String overwriteLen(size_t pos, string val, ptrdiff_t len)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_overwrite_len(cast(GString*)this._cPtr, pos, _val, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a string on to the start of a #GString,
      expanding it if necessary.
  
      Params:
        val = the string to prepend on the start of string
      Returns: string
  */
  glib.string_.String prepend(string val)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_prepend(cast(GString*)this._cPtr, _val);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a byte onto the start of a #GString,
      expanding it if necessary.
  
      Params:
        c = the byte to prepend on the start of the #GString
      Returns: string
  */
  glib.string_.String prependC(char c)
  {
    GString* _cretval;
    _cretval = g_string_prepend_c(cast(GString*)this._cPtr, c);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Prepends len bytes of val to string.
      
      If len is positive, val may contain embedded nuls and need
      not be nul-terminated. It is the caller's responsibility to
      ensure that val has at least len addressable bytes.
      
      If len is negative, val must be nul-terminated and len
      is considered to request the entire string length. This
      makes [glib.string_.String.prependLen] equivalent to [glib.string_.String.prepend].
  
      Params:
        val = bytes to prepend
        len = number of bytes in val to prepend, or -1 for all of val
      Returns: string
  */
  glib.string_.String prependLen(string val, ptrdiff_t len)
  {
    GString* _cretval;
    const(char)* _val = val.toCString(No.Alloc);
    _cretval = g_string_prepend_len(cast(GString*)this._cPtr, _val, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts a Unicode character into UTF-8, and prepends it
      to the string.
  
      Params:
        wc = a Unicode character
      Returns: string
  */
  glib.string_.String prependUnichar(dchar wc)
  {
    GString* _cretval;
    _cretval = g_string_prepend_unichar(cast(GString*)this._cPtr, wc);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Replaces the string find with the string replace in a #GString up to
      limit times. If the number of instances of find in the #GString is
      less than limit, all instances are replaced. If limit is `0`,
      all instances of find are replaced.
      
      If find is the empty string, since versions 2.69.1 and 2.68.4 the
      replacement will be inserted no more than once per possible position
      (beginning of string, end of string and between characters). This did
      not work correctly in earlier versions.
  
      Params:
        find = the string to find in string
        replace = the string to insert in place of find
        limit = the maximum instances of find to replace with replace, or `0` for
          no limit
      Returns: the number of find and replace operations performed.
  */
  uint replace(string find, string replace, uint limit)
  {
    uint _retval;
    const(char)* _find = find.toCString(No.Alloc);
    const(char)* _replace = replace.toCString(No.Alloc);
    _retval = g_string_replace(cast(GString*)this._cPtr, _find, _replace, limit);
    return _retval;
  }

  /**
      Sets the length of a #GString. If the length is less than
      the current length, the string will be truncated. If the
      length is greater than the current length, the contents
      of the newly added area are undefined. (However, as
      always, string->str[string->len] will be a nul byte.)
  
      Params:
        len = the new length
      Returns: string
  */
  glib.string_.String setSize(size_t len)
  {
    GString* _cretval;
    _cretval = g_string_set_size(cast(GString*)this._cPtr, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Cuts off the end of the GString, leaving the first len bytes.
  
      Params:
        len = the new size of string
      Returns: string
  */
  glib.string_.String truncate(size_t len)
  {
    GString* _cretval;
    _cretval = g_string_truncate(cast(GString*)this._cPtr, len);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Converts a #GString to uppercase.
      Returns: string
  
      Deprecated: This function uses the locale-specific
            toupper() function, which is almost never the right thing.
            Use [glib.string_.String.asciiUp] or [glib.global.utf8Strup] instead.
  */
  glib.string_.String up()
  {
    GString* _cretval;
    _cretval = g_string_up(cast(GString*)this._cPtr);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
