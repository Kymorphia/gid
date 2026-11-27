/// Module for [BitsetIter] class
module gid.gtk4.bitset_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gtk4.bitset;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Iterates over the elements of a [gid.gtk4.bitset.Bitset].
    
    `GtkBitSetIter is an opaque, stack-allocated struct.
    
    Before a [gid.gtk4.bitset_iter.BitsetIter] can be used, it needs to be initialized with
    [gid.gtk4.bitset_iter.BitsetIter.initFirst], [gid.gtk4.bitset_iter.BitsetIter.initLast]
    or [gid.gtk4.bitset_iter.BitsetIter.initAt].
*/
@gidGir("BitsetIter")
class BitsetIter : gid.gobject2.boxed.BoxedWrap!(gtk_bitset_iter_get_type)
{
  /**
      Create a `bitset_iter.BitsetIter` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GtkBitsetIter(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override BitsetIter self() nothrow
  {
    return this;
  }

  /**
      Gets the current value that iter points to.
      
      If iter is not valid and [gid.gtk4.bitset_iter.BitsetIter.isValid]
      returns false, this function returns 0.
      Returns: The current value pointer to by iter
  */
  uint getValue() nothrow
  {
    uint _retval;
    _retval = gtk_bitset_iter_get_value(cast(const(GtkBitsetIter)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if iter points to a valid value.
      Returns: true if iter points to a valid value
  */
  bool isValid() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_is_valid(cast(const(GtkBitsetIter)*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter to the next value in the set.
      
      If it was already pointing to the last value in the set,
      false is returned and iter is invalidated.
  
      Params:
        value = Set to the next value
      Returns: true if a next value existed
  */
  bool next(out uint value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_next(cast(GtkBitsetIter*)this._cPtr, cast(uint*)&value);
    return _retval;
  }

  /**
      Moves iter to the previous value in the set.
      
      If it was already pointing to the first value in the set,
      false is returned and iter is invalidated.
  
      Params:
        value = Set to the previous value
      Returns: true if a previous value existed
  */
  bool previous(out uint value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_previous(cast(GtkBitsetIter*)this._cPtr, cast(uint*)&value);
    return _retval;
  }

  /**
      Initializes iter to point to target.
      
      If target is not found, finds the next value after it.
      If no value >= target exists in set, this function returns false.
  
      Params:
        iter = a pointer to an uninitialized [gid.gtk4.bitset_iter.BitsetIter]
        set = a [gid.gtk4.bitset.Bitset]
        target = target value to start iterating at
        value = Set to the found value in set
      Returns: true if a value was found.
  */
  static bool initAt(out gid.gtk4.bitset_iter.BitsetIter iter, gid.gtk4.bitset.Bitset set, uint target, out uint value) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkBitsetIter(gid.gtk4.bitset_iter.BitsetIter._getGType);
    _retval = cast(bool)gtk_bitset_iter_init_at(_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, target, cast(uint*)&value);
    iter = new gid.gtk4.bitset_iter.BitsetIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Initializes an iterator for set and points it to the first
      value in set.
      
      If set is empty, false is returned and value is set to `G_MAXUINT`.
  
      Params:
        iter = a pointer to an uninitialized [gid.gtk4.bitset_iter.BitsetIter]
        set = a [gid.gtk4.bitset.Bitset]
        value = Set to the first value in set
      Returns: true if set isn't empty.
  */
  static bool initFirst(out gid.gtk4.bitset_iter.BitsetIter iter, gid.gtk4.bitset.Bitset set, out uint value) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkBitsetIter(gid.gtk4.bitset_iter.BitsetIter._getGType);
    _retval = cast(bool)gtk_bitset_iter_init_first(_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    iter = new gid.gtk4.bitset_iter.BitsetIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Initializes an iterator for set and points it to the last
      value in set.
      
      If set is empty, false is returned.
  
      Params:
        iter = a pointer to an uninitialized [gid.gtk4.bitset_iter.BitsetIter]
        set = a [gid.gtk4.bitset.Bitset]
        value = Set to the last value in set
      Returns: true if set isn't empty.
  */
  static bool initLast(out gid.gtk4.bitset_iter.BitsetIter iter, gid.gtk4.bitset.Bitset set, out uint value) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkBitsetIter(gid.gtk4.bitset_iter.BitsetIter._getGType);
    _retval = cast(bool)gtk_bitset_iter_init_last(_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    iter = new gid.gtk4.bitset_iter.BitsetIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }
}
