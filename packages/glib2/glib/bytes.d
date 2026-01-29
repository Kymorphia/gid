/// Module for [Bytes] class
module glib.bytes;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    A simple refcounted data type representing an immutable sequence of zero or
    more bytes from an unspecified origin.
    
    The purpose of a #GBytes is to keep the memory region that it holds
    alive for as long as anyone holds a reference to the bytes.  When
    the last reference count is dropped, the memory is released. Multiple
    unrelated callers can use byte data in the #GBytes without coordinating
    their activities, resting assured that the byte data will not change or
    move while they hold a reference.
    
    A #GBytes can come from many different origins that may have
    different procedures for freeing the memory region.  Examples are
    memory from [glib.global.gmalloc], from memory slices, from a #GMappedFile or
    memory from other allocators.
    
    #GBytes work well as keys in #GHashTable. Use [glib.bytes.Bytes.equal] and
    [glib.bytes.Bytes.hash] as parameters to [glib.hash_table.HashTable.new_] or [glib.hash_table.HashTable.newFull].
    #GBytes can also be used as keys in a #GTree by passing the [glib.bytes.Bytes.compare]
    function to [glib.tree.Tree.new_].
    
    The data pointed to by this bytes must not be modified. For a mutable
    array of bytes see #GByteArray. Use [glib.bytes.Bytes.unrefToArray] to create a
    mutable array for a #GBytes sequence. To create an immutable #GBytes from
    a mutable #GByteArray, use the [glib.byte_array.ByteArray.freeToBytes] function.
*/
class Bytes : gobject.boxed.Boxed
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
    return cast(void function())g_bytes_get_type != &gidSymbolNotFound ? g_bytes_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Bytes self()
  {
    return this;
  }

  /**
      Creates a new #GBytes from data.
      
      data is copied. If size is 0, data may be null.
  
      Params:
        data = the data to be used for the bytes
      Returns: a new #GBytes
  */
  this(ubyte[] data = null)
  {
    GBytes* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _cretval = g_bytes_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  /**
      Compares the two #GBytes values.
      
      This function can be used to sort GBytes instances in lexicographical order.
      
      If bytes1 and bytes2 have different length but the shorter one is a
      prefix of the longer one then the shorter one is considered to be less than
      the longer one. Otherwise the first byte where both differ is used for
      comparison. If bytes1 has a smaller value at that position it is
      considered less, otherwise greater than bytes2.
  
      Params:
        bytes2 = a pointer to a #GBytes to compare with bytes1
      Returns: a negative value if bytes1 is less than bytes2, a positive value
                 if bytes1 is greater than bytes2, and zero if bytes1 is equal to
                 bytes2
  */
  int compare(glib.bytes.Bytes bytes2)
  {
    int _retval;
    _retval = g_bytes_compare(cast(GBytes*)this._cPtr, bytes2 ? cast(GBytes*)bytes2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Compares the two #GBytes values being pointed to and returns
      true if they are equal.
      
      This function can be passed to [glib.hash_table.HashTable.new_] as the key_equal_func
      parameter, when using non-null #GBytes pointers as keys in a #GHashTable.
  
      Params:
        bytes2 = a pointer to a #GBytes to compare with bytes1
      Returns: true if the two keys match.
  */
  bool equal(glib.bytes.Bytes bytes2)
  {
    bool _retval;
    _retval = cast(bool)g_bytes_equal(cast(GBytes*)this._cPtr, bytes2 ? cast(GBytes*)bytes2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the byte data in the #GBytes. This data should not be modified.
      
      This function will always return the same pointer for a given #GBytes.
      
      null may be returned if size is 0. This is not guaranteed, as the #GBytes
      may represent an empty string with data non-null and size as 0. null will
      not be returned if size is non-zero.
      Returns: a pointer to the byte data, or null
  */
  ubyte[] getData()
  {
    const(void)* _cretval;
    size_t _cretlength;
    _cretval = g_bytes_get_data(cast(GBytes*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Gets a pointer to a region in bytes.
      
      The region starts at offset many bytes from the start of the data
      and contains n_elements many elements of element_size size.
      
      n_elements may be zero, but element_size must always be non-zero.
      Ideally, element_size is a static constant (eg: sizeof a struct).
      
      This function does careful bounds checking (including checking for
      arithmetic overflows) and returns a non-null pointer if the
      specified region lies entirely within the bytes. If the region is
      in some way out of range, or if an overflow has occurred, then null
      is returned.
      
      Note: it is possible to have a valid zero-size region. In this case,
      the returned pointer will be equal to the base pointer of the data of
      bytes, plus offset.  This will be non-null except for the case
      where bytes itself was a zero-sized region.  Since it is unlikely
      that you will be using this function to check for a zero-sized region
      in a zero-sized bytes, null effectively always means "error".
  
      Params:
        elementSize = a non-zero element size
        offset = an offset to the start of the region within the bytes
        nElements = the number of elements in the region
      Returns: the requested region, or null in case of an error
  */
  const(void)* getRegion(size_t elementSize, size_t offset, size_t nElements)
  {
    auto _retval = g_bytes_get_region(cast(GBytes*)this._cPtr, elementSize, offset, nElements);
    return _retval;
  }

  /**
      Get the size of the byte data in the #GBytes.
      
      This function will always return the same value for a given #GBytes.
      Returns: the size
  */
  size_t getSize()
  {
    size_t _retval;
    _retval = g_bytes_get_size(cast(GBytes*)this._cPtr);
    return _retval;
  }

  /**
      Creates an integer hash code for the byte data in the #GBytes.
      
      This function can be passed to [glib.hash_table.HashTable.new_] as the key_hash_func
      parameter, when using non-null #GBytes pointers as keys in a #GHashTable.
      Returns: a hash value corresponding to the key.
  */
  uint hash()
  {
    uint _retval;
    _retval = g_bytes_hash(cast(GBytes*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GBytes which is a subsection of another #GBytes. The offset +
      length may not be longer than the size of bytes.
      
      A reference to bytes will be held by the newly created #GBytes until
      the byte data is no longer needed.
      
      Since 2.56, if offset is 0 and length matches the size of bytes, then
      bytes will be returned with the reference count incremented by 1. If bytes
      is a slice of another #GBytes, then the resulting #GBytes will reference
      the same #GBytes instead of bytes. This allows consumers to simplify the
      usage of #GBytes when asynchronously writing to streams.
  
      Params:
        offset = offset which subsection starts at
        length = length of subsection
      Returns: a new #GBytes
  */
  glib.bytes.Bytes newFromBytes(size_t offset, size_t length)
  {
    GBytes* _cretval;
    _cretval = g_bytes_new_from_bytes(cast(GBytes*)this._cPtr, offset, length);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Unreferences the bytes, and returns a new mutable #GByteArray containing
      the same byte data.
      
      As an optimization, the byte data is transferred to the array without copying
      if this was the last reference to bytes and bytes was created with
      [glib.bytes.Bytes.new_], [glib.bytes.Bytes.newTake] or [glib.byte_array.ByteArray.freeToBytes]. In all
      other cases the data is copied.
      
      Do not use it if bytes contains more than `G_MAXUINT`
      bytes. #GByteArray stores the length of its data in #guint, which
      may be shorter than #gsize, that bytes is using.
      Returns: a new mutable #GByteArray containing the same byte data
  */
  ubyte[] unrefToArray()
  {
    GByteArray* _cretval;
    _cretval = g_bytes_unref_to_array(cast(GBytes*)this._cPtr);
    auto _retval = gByteArrayToD(cast(GByteArray*)_cretval);
    return _retval;
  }

  /**
      Unreferences the bytes, and returns a pointer the same byte data
      contents.
      
      As an optimization, the byte data is returned without copying if this was
      the last reference to bytes and bytes was created with [glib.bytes.Bytes.new_],
      [glib.bytes.Bytes.newTake] or [glib.byte_array.ByteArray.freeToBytes]. In all other cases the
      data is copied.
      Returns: a pointer to the same byte data, which should be
                 freed with [glib.global.gfree]
  */
  ubyte[] unrefToData()
  {
    void* _cretval;
    size_t _cretlength;
    _cretval = g_bytes_unref_to_data(cast(GBytes*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
