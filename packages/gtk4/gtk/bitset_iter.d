/// Module for [BitsetIter] struct
module gtk.bitset_iter;

import gid.gid;
import gtk.bitset;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An opaque, stack-allocated struct for iterating
    over the elements of a [gtk.bitset.Bitset].
    
    Before a [gtk.bitset_iter.BitsetIter] can be used, it needs to be initialized with
    [gtk.bitset_iter.BitsetIter.initFirst], [gtk.bitset_iter.BitsetIter.initLast]
    or [gtk.bitset_iter.BitsetIter.initAt].
*/
struct BitsetIter
{
  /** */
  void*[10] privateData;

  /**
      Gets the current value that iter points to.
      
      If iter is not valid and [gtk.bitset_iter.BitsetIter.isValid]
      returns false, this function returns 0.
      Returns: The current value pointer to by iter
  */
  uint getValue()
  {
    uint _retval;
    _retval = gtk_bitset_iter_get_value(cast(const(GtkBitsetIter)*)&this);
    return _retval;
  }

  /**
      Checks if iter points to a valid value.
      Returns: true if iter points to a valid value
  */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_is_valid(cast(const(GtkBitsetIter)*)&this);
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
  bool next(out uint value)
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_next(cast(GtkBitsetIter*)&this, cast(uint*)&value);
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
  bool previous(out uint value)
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_previous(cast(GtkBitsetIter*)&this, cast(uint*)&value);
    return _retval;
  }

  /**
      Initializes iter to point to target.
      
      If target is not found, finds the next value after it.
      If no value >= target exists in set, this function returns false.
  
      Params:
        iter = a pointer to an uninitialized [gtk.bitset_iter.BitsetIter]
        set = a [gtk.bitset.Bitset]
        target = target value to start iterating at
        value = Set to the found value in set
      Returns: true if a value was found.
  */
  static bool initAt(out gtk.bitset_iter.BitsetIter iter, gtk.bitset.Bitset set, uint target, out uint value)
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_init_at(cast(GtkBitsetIter*)&iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, target, cast(uint*)&value);
    return _retval;
  }

  /**
      Initializes an iterator for set and points it to the first
      value in set.
      
      If set is empty, false is returned and value is set to `G_MAXUINT`.
  
      Params:
        iter = a pointer to an uninitialized [gtk.bitset_iter.BitsetIter]
        set = a [gtk.bitset.Bitset]
        value = Set to the first value in set
      Returns: true if set isn't empty.
  */
  static bool initFirst(out gtk.bitset_iter.BitsetIter iter, gtk.bitset.Bitset set, out uint value)
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_init_first(cast(GtkBitsetIter*)&iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    return _retval;
  }

  /**
      Initializes an iterator for set and points it to the last
      value in set.
      
      If set is empty, false is returned.
  
      Params:
        iter = a pointer to an uninitialized [gtk.bitset_iter.BitsetIter]
        set = a [gtk.bitset.Bitset]
        value = Set to the last value in set
      Returns: true if set isn't empty.
  */
  static bool initLast(out gtk.bitset_iter.BitsetIter iter, gtk.bitset.Bitset set, out uint value)
  {
    bool _retval;
    _retval = cast(bool)gtk_bitset_iter_init_last(cast(GtkBitsetIter*)&iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    return _retval;
  }
}
