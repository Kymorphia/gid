/// Module for [BitsetIter] class
module gtk.bitset_iter;

import gid.gid;
import gobject.boxed;
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
class BitsetIter : gobject.boxed.Boxed
{

  /**
      Create a `bitset_iter.BitsetIter` boxed type.
  */
  this()
  {
    super(gMalloc(GtkBitsetIter.sizeof), Yes.Take);
  }

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
    return cast(void function())gtk_bitset_iter_get_type != &gidSymbolNotFound ? gtk_bitset_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BitsetIter self()
  {
    return this;
  }

  /**
      Gets the current value that iter points to.
      
      If iter is not valid and [gtk.bitset_iter.BitsetIter.isValid]
      returns false, this function returns 0.
      Returns: The current value pointer to by iter
  */
  uint getValue()
  {
    uint _retval;
    _retval = gtk_bitset_iter_get_value(cast(const(GtkBitsetIter)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if iter points to a valid value.
      Returns: true if iter points to a valid value
  */
  bool isValid()
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
  bool next(out uint value)
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
  bool previous(out uint value)
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
        iter = a pointer to an uninitialized [gtk.bitset_iter.BitsetIter]
        set = a [gtk.bitset.Bitset]
        target = target value to start iterating at
        value = Set to the found value in set
      Returns: true if a value was found.
  */
  static bool initAt(out gtk.bitset_iter.BitsetIter iter, gtk.bitset.Bitset set, uint target, out uint value)
  {
    bool _retval;
    GtkBitsetIter _iter;
    _retval = cast(bool)gtk_bitset_iter_init_at(&_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, target, cast(uint*)&value);
    iter = new gtk.bitset_iter.BitsetIter(cast(void*)&_iter, No.Take);
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
    GtkBitsetIter _iter;
    _retval = cast(bool)gtk_bitset_iter_init_first(&_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    iter = new gtk.bitset_iter.BitsetIter(cast(void*)&_iter, No.Take);
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
    GtkBitsetIter _iter;
    _retval = cast(bool)gtk_bitset_iter_init_last(&_iter, set ? cast(const(GtkBitset)*)set._cPtr(No.Dup) : null, cast(uint*)&value);
    iter = new gtk.bitset_iter.BitsetIter(cast(void*)&_iter, No.Take);
    return _retval;
  }
}
