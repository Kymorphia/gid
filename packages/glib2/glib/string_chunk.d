/// Module for [StringChunk] class
module glib.string_chunk;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    [glib.string_chunk.StringChunk] provides efficient storage of groups of strings
    
    String chunks are used to store groups of strings. Memory is
    allocated in blocks, and as strings are added to the [glib.string_chunk.StringChunk]
    they are copied into the next free position in a block. When a block
    is full a new block is allocated.
    
    When storing a large number of strings, string chunks are more
    efficient than using `func@GLib.strdup` since fewer calls to `malloc()`
    are needed, and less memory is wasted in memory allocation overheads.
    
    By adding strings with [glib.string_chunk.StringChunk.insertConst] it is also
    possible to remove duplicates.
    
    To create a new [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.new_].
    
    To add strings to a [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.insert].
    
    To add strings to a [glib.string_chunk.StringChunk], but without duplicating strings
    which are already in the [glib.string_chunk.StringChunk], use [glib.string_chunk.StringChunk.insertConst].
    
    To free the entire [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.free].
    It is not possible to free individual strings.
*/
class StringChunk
{
  GStringChunk* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.string_chunk.StringChunk");

    _cInstancePtr = cast(GStringChunk*)ptr;

    owned = take;
  }

  ~this()
  {
    if (owned)
      g_string_chunk_free(_cInstancePtr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Frees all strings contained within the #GStringChunk.
      After calling [glib.string_chunk.StringChunk.clear] it is not safe to
      access any of the strings which were contained within it.
  */
  void clear()
  {
    g_string_chunk_clear(cast(GStringChunk*)this._cPtr);
  }

  /**
      Adds a copy of string to the #GStringChunk.
      It returns a pointer to the new copy of the string
      in the #GStringChunk. The characters in the string
      can be changed, if necessary, though you should not
      change anything after the end of the string.
      
      Unlike [glib.string_chunk.StringChunk.insertConst], this function
      does not check for duplicates. Also strings added
      with [glib.string_chunk.StringChunk.insert] will not be searched
      by [glib.string_chunk.StringChunk.insertConst] when looking for
      duplicates.
  
      Params:
        string_ = the string to add
      Returns: a pointer to the copy of string within
            the #GStringChunk
  */
  string insert(string string_)
  {
    char* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_string_chunk_insert(cast(GStringChunk*)this._cPtr, _string_);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Adds a copy of string to the #GStringChunk, unless the same
      string has already been added to the #GStringChunk with
      [glib.string_chunk.StringChunk.insertConst].
      
      This function is useful if you need to copy a large number
      of strings but do not want to waste space storing duplicates.
      But you must remember that there may be several pointers to
      the same string, and so any changes made to the strings
      should be done very carefully.
      
      Note that [glib.string_chunk.StringChunk.insertConst] will not return a
      pointer to a string added with [glib.string_chunk.StringChunk.insert], even
      if they do match.
  
      Params:
        string_ = the string to add
      Returns: a pointer to the new or existing copy of string
            within the #GStringChunk
  */
  string insertConst(string string_)
  {
    char* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_string_chunk_insert_const(cast(GStringChunk*)this._cPtr, _string_);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Adds a copy of the first len bytes of string to the #GStringChunk.
      The copy is nul-terminated.
      
      Since this function does not stop at nul bytes, it is the caller's
      responsibility to ensure that string has at least len addressable
      bytes.
      
      The characters in the returned string can be changed, if necessary,
      though you should not change anything after the end of the string.
  
      Params:
        string_ = bytes to insert
        len = number of bytes of string to insert, or -1 to insert a
              nul-terminated string
      Returns: a pointer to the copy of string within the #GStringChunk
  */
  string insertLen(string string_, ptrdiff_t len)
  {
    char* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_string_chunk_insert_len(cast(GStringChunk*)this._cPtr, _string_, len);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
