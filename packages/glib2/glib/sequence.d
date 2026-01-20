/// Module for [Sequence] class
module glib.sequence;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.sequence_iter;
import glib.types;

/**
    The #GSequence struct is an opaque data type representing a
    [sequence][glib-Sequences] data type.
*/
class Sequence
{
  GSequence* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.sequence.Sequence");

    _cInstancePtr = cast(GSequence*)ptr;

    owned = take;
  }

  ~this()
  {
    if (owned)
      g_sequence_free(_cInstancePtr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Adds a new item to the end of seq.
  
      Params:
        data = the data for the new item
      Returns: an iterator pointing to the new item
  */
  glib.sequence_iter.SequenceIter append(void* data = null)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_append(cast(GSequence*)this._cPtr, data);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Calls func for each item in the sequence passing user_data
      to the function. func must not modify the sequence itself.
  
      Params:
        func = the function to call for each item in seq
  */
  void foreach_(glib.types.Func func)
  {
    extern(C) void _funcCallback(void* data, void* userData)
    {
      auto _dlg = cast(glib.types.Func*)userData;

      (*_dlg)(data);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_sequence_foreach(cast(GSequence*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the begin iterator for seq.
      Returns: the begin iterator for seq.
  */
  glib.sequence_iter.SequenceIter getBeginIter()
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_get_begin_iter(cast(GSequence*)this._cPtr);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the end iterator for seg
      Returns: the end iterator for seq
  */
  glib.sequence_iter.SequenceIter getEndIter()
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_get_end_iter(cast(GSequence*)this._cPtr);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the iterator at position pos. If pos is negative or larger
      than the number of items in seq, the end iterator is returned.
  
      Params:
        pos = a position in seq, or -1 for the end
      Returns: The #GSequenceIter at position pos
  */
  glib.sequence_iter.SequenceIter getIterAtPos(int pos)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_get_iter_at_pos(cast(GSequence*)this._cPtr, pos);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the positive length (>= 0) of seq. Note that this method is
      O(h) where `h' is the height of the tree. It is thus more efficient
      to use [glib.sequence.Sequence.isEmpty] when comparing the length to zero.
      Returns: the length of seq
  */
  int getLength()
  {
    int _retval;
    _retval = g_sequence_get_length(cast(GSequence*)this._cPtr);
    return _retval;
  }

  /**
      Inserts data into seq using cmp_func to determine the new
      position. The sequence must already be sorted according to cmp_func;
      otherwise the new position of data is undefined.
      
      cmp_func is called with two items of the seq, and cmp_data.
      It should return 0 if the items are equal, a negative value
      if the first item comes before the second, and a positive value
      if the second item comes before the first.
      
      Note that when adding a large amount of data to a #GSequence,
      it is more efficient to do unsorted insertions and then call
      [glib.sequence.Sequence.sort] or [glib.sequence.Sequence.sortIter].
  
      Params:
        data = the data to insert
        cmpFunc = the function used to compare items in the sequence
      Returns: a #GSequenceIter pointing to the new item.
  */
  glib.sequence_iter.SequenceIter insertSorted(void* data, glib.types.CompareDataFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    GSequenceIter* _cretval;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    _cretval = g_sequence_insert_sorted(cast(GSequence*)this._cPtr, data, _cmpFuncCB, _cmpFunc);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Like [glib.sequence.Sequence.insertSorted], but uses
      a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as
      the compare function.
      
      iter_cmp is called with two iterators pointing into seq.
      It should return 0 if the iterators are equal, a negative
      value if the first iterator comes before the second, and a
      positive value if the second iterator comes before the first.
      
      Note that when adding a large amount of data to a #GSequence,
      it is more efficient to do unsorted insertions and then call
      [glib.sequence.Sequence.sort] or [glib.sequence.Sequence.sortIter].
  
      Params:
        data = data for the new item
        iterCmp = the function used to compare iterators in the sequence
      Returns: a #GSequenceIter pointing to the new item
  */
  glib.sequence_iter.SequenceIter insertSortedIter(void* data, glib.types.SequenceIterCompareFunc iterCmp)
  {
    extern(C) int _iterCmpCallback(GSequenceIter* a, GSequenceIter* b, void* data)
    {
      auto _dlg = cast(glib.types.SequenceIterCompareFunc*)data;

      int _retval = (*_dlg)(a ? new glib.sequence_iter.SequenceIter(cast(void*)a, No.Take) : null, b ? new glib.sequence_iter.SequenceIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _iterCmpCB = iterCmp ? &_iterCmpCallback : null;
    GSequenceIter* _cretval;
    auto _iterCmp = iterCmp ? cast(void*)&(iterCmp) : null;
    _cretval = g_sequence_insert_sorted_iter(cast(GSequence*)this._cPtr, data, _iterCmpCB, _iterCmp);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns true if the sequence contains zero items.
      
      This function is functionally identical to checking the result of
      [glib.sequence.Sequence.getLength] being equal to zero. However this function is
      implemented in O(1) running time.
      Returns: true if the sequence is empty, otherwise false.
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)g_sequence_is_empty(cast(GSequence*)this._cPtr);
    return _retval;
  }

  /**
      Returns an iterator pointing to the position of the first item found
      equal to data according to cmp_func and cmp_data. If more than one
      item is equal, it is not guaranteed that it is the first which is
      returned. In that case, you can use [glib.sequence_iter.SequenceIter.next] and
      [glib.sequence_iter.SequenceIter.prev] to get others.
      
      cmp_func is called with two items of the seq, and cmp_data.
      It should return 0 if the items are equal, a negative value if
      the first item comes before the second, and a positive value if
      the second item comes before the first.
      
      This function will fail if the data contained in the sequence is
      unsorted.
  
      Params:
        data = data to look up
        cmpFunc = the function used to compare items in the sequence
      Returns: an #GSequenceIter pointing to the position of the
            first item found equal to data according to cmp_func and
            cmp_data, or null if no such item exists
  */
  glib.sequence_iter.SequenceIter lookup(void* data, glib.types.CompareDataFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    GSequenceIter* _cretval;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    _cretval = g_sequence_lookup(cast(GSequence*)this._cPtr, data, _cmpFuncCB, _cmpFunc);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Like [glib.sequence.Sequence.lookup], but uses a #GSequenceIterCompareFunc
      instead of a #GCompareDataFunc as the compare function.
      
      iter_cmp is called with two iterators pointing into seq.
      It should return 0 if the iterators are equal, a negative value
      if the first iterator comes before the second, and a positive
      value if the second iterator comes before the first.
      
      This function will fail if the data contained in the sequence is
      unsorted.
  
      Params:
        data = data to look up
        iterCmp = the function used to compare iterators in the sequence
      Returns: an #GSequenceIter pointing to the position of
            the first item found equal to data according to iter_cmp
            and cmp_data, or null if no such item exists
  */
  glib.sequence_iter.SequenceIter lookupIter(void* data, glib.types.SequenceIterCompareFunc iterCmp)
  {
    extern(C) int _iterCmpCallback(GSequenceIter* a, GSequenceIter* b, void* data)
    {
      auto _dlg = cast(glib.types.SequenceIterCompareFunc*)data;

      int _retval = (*_dlg)(a ? new glib.sequence_iter.SequenceIter(cast(void*)a, No.Take) : null, b ? new glib.sequence_iter.SequenceIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _iterCmpCB = iterCmp ? &_iterCmpCallback : null;
    GSequenceIter* _cretval;
    auto _iterCmp = iterCmp ? cast(void*)&(iterCmp) : null;
    _cretval = g_sequence_lookup_iter(cast(GSequence*)this._cPtr, data, _iterCmpCB, _iterCmp);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a new item to the front of seq
  
      Params:
        data = the data for the new item
      Returns: an iterator pointing to the new item
  */
  glib.sequence_iter.SequenceIter prepend(void* data = null)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_prepend(cast(GSequence*)this._cPtr, data);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns an iterator pointing to the position where data would
      be inserted according to cmp_func and cmp_data.
      
      cmp_func is called with two items of the seq, and cmp_data.
      It should return 0 if the items are equal, a negative value if
      the first item comes before the second, and a positive value if
      the second item comes before the first.
      
      If you are simply searching for an existing element of the sequence,
      consider using [glib.sequence.Sequence.lookup].
      
      This function will fail if the data contained in the sequence is
      unsorted.
  
      Params:
        data = data for the new item
        cmpFunc = the function used to compare items in the sequence
      Returns: an #GSequenceIter pointing to the position where data
            would have been inserted according to cmp_func and cmp_data
  */
  glib.sequence_iter.SequenceIter search(void* data, glib.types.CompareDataFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    GSequenceIter* _cretval;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    _cretval = g_sequence_search(cast(GSequence*)this._cPtr, data, _cmpFuncCB, _cmpFunc);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Like [glib.sequence.Sequence.search], but uses a #GSequenceIterCompareFunc
      instead of a #GCompareDataFunc as the compare function.
      
      iter_cmp is called with two iterators pointing into seq.
      It should return 0 if the iterators are equal, a negative value
      if the first iterator comes before the second, and a positive
      value if the second iterator comes before the first.
      
      If you are simply searching for an existing element of the sequence,
      consider using [glib.sequence.Sequence.lookupIter].
      
      This function will fail if the data contained in the sequence is
      unsorted.
  
      Params:
        data = data for the new item
        iterCmp = the function used to compare iterators in the sequence
      Returns: a #GSequenceIter pointing to the position in seq
            where data would have been inserted according to iter_cmp
            and cmp_data
  */
  glib.sequence_iter.SequenceIter searchIter(void* data, glib.types.SequenceIterCompareFunc iterCmp)
  {
    extern(C) int _iterCmpCallback(GSequenceIter* a, GSequenceIter* b, void* data)
    {
      auto _dlg = cast(glib.types.SequenceIterCompareFunc*)data;

      int _retval = (*_dlg)(a ? new glib.sequence_iter.SequenceIter(cast(void*)a, No.Take) : null, b ? new glib.sequence_iter.SequenceIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _iterCmpCB = iterCmp ? &_iterCmpCallback : null;
    GSequenceIter* _cretval;
    auto _iterCmp = iterCmp ? cast(void*)&(iterCmp) : null;
    _cretval = g_sequence_search_iter(cast(GSequence*)this._cPtr, data, _iterCmpCB, _iterCmp);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sorts seq using cmp_func.
      
      cmp_func is passed two items of seq and should
      return 0 if they are equal, a negative value if the
      first comes before the second, and a positive value
      if the second comes before the first.
  
      Params:
        cmpFunc = the function used to sort the sequence
  */
  void sort(glib.types.CompareDataFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    g_sequence_sort(cast(GSequence*)this._cPtr, _cmpFuncCB, _cmpFunc);
  }

  /**
      Like [glib.sequence.Sequence.sort], but uses a #GSequenceIterCompareFunc instead
      of a #GCompareDataFunc as the compare function
      
      cmp_func is called with two iterators pointing into seq. It should
      return 0 if the iterators are equal, a negative value if the first
      iterator comes before the second, and a positive value if the second
      iterator comes before the first.
  
      Params:
        cmpFunc = the function used to compare iterators in the sequence
  */
  void sortIter(glib.types.SequenceIterCompareFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(GSequenceIter* a, GSequenceIter* b, void* data)
    {
      auto _dlg = cast(glib.types.SequenceIterCompareFunc*)data;

      int _retval = (*_dlg)(a ? new glib.sequence_iter.SequenceIter(cast(void*)a, No.Take) : null, b ? new glib.sequence_iter.SequenceIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    g_sequence_sort_iter(cast(GSequence*)this._cPtr, _cmpFuncCB, _cmpFunc);
  }

  /**
      Calls func for each item in the range (begin, end) passing
      user_data to the function. func must not modify the sequence
      itself.
  
      Params:
        begin = a #GSequenceIter
        end = a #GSequenceIter
        func = a #GFunc
  */
  static void foreachRange(glib.sequence_iter.SequenceIter begin, glib.sequence_iter.SequenceIter end, glib.types.Func func)
  {
    extern(C) void _funcCallback(void* data, void* userData)
    {
      auto _dlg = cast(glib.types.Func*)userData;

      (*_dlg)(data);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_sequence_foreach_range(begin ? cast(GSequenceIter*)begin._cPtr : null, end ? cast(GSequenceIter*)end._cPtr : null, _funcCB, _func);
  }

  /**
      Returns the data that iter points to.
  
      Params:
        iter = a #GSequenceIter
      Returns: the data that iter points to
  */
  static void* get(glib.sequence_iter.SequenceIter iter)
  {
    auto _retval = g_sequence_get(iter ? cast(GSequenceIter*)iter._cPtr : null);
    return _retval;
  }

  /**
      Inserts a new item just before the item pointed to by iter.
  
      Params:
        iter = a #GSequenceIter
        data = the data for the new item
      Returns: an iterator pointing to the new item
  */
  static glib.sequence_iter.SequenceIter insertBefore(glib.sequence_iter.SequenceIter iter, void* data = null)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_insert_before(iter ? cast(GSequenceIter*)iter._cPtr : null, data);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Moves the item pointed to by src to the position indicated by dest.
      After calling this function dest will point to the position immediately
      after src. It is allowed for src and dest to point into different
      sequences.
  
      Params:
        src = a #GSequenceIter pointing to the item to move
        dest = a #GSequenceIter pointing to the position to which
              the item is moved
  */
  static void move(glib.sequence_iter.SequenceIter src, glib.sequence_iter.SequenceIter dest)
  {
    g_sequence_move(src ? cast(GSequenceIter*)src._cPtr : null, dest ? cast(GSequenceIter*)dest._cPtr : null);
  }

  /**
      Inserts the (begin, end) range at the destination pointed to by dest.
      The begin and end iters must point into the same sequence. It is
      allowed for dest to point to a different sequence than the one pointed
      into by begin and end.
      
      If dest is null, the range indicated by begin and end is
      removed from the sequence. If dest points to a place within
      the (begin, end) range, the range does not move.
  
      Params:
        dest = a #GSequenceIter
        begin = a #GSequenceIter
        end = a #GSequenceIter
  */
  static void moveRange(glib.sequence_iter.SequenceIter dest, glib.sequence_iter.SequenceIter begin, glib.sequence_iter.SequenceIter end)
  {
    g_sequence_move_range(dest ? cast(GSequenceIter*)dest._cPtr : null, begin ? cast(GSequenceIter*)begin._cPtr : null, end ? cast(GSequenceIter*)end._cPtr : null);
  }

  /**
      Finds an iterator somewhere in the range (begin, end). This
      iterator will be close to the middle of the range, but is not
      guaranteed to be exactly in the middle.
      
      The begin and end iterators must both point to the same sequence
      and begin must come before or be equal to end in the sequence.
  
      Params:
        begin = a #GSequenceIter
        end = a #GSequenceIter
      Returns: a #GSequenceIter pointing somewhere in the
           (begin, end) range
  */
  static glib.sequence_iter.SequenceIter rangeGetMidpoint(glib.sequence_iter.SequenceIter begin, glib.sequence_iter.SequenceIter end)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_range_get_midpoint(begin ? cast(GSequenceIter*)begin._cPtr : null, end ? cast(GSequenceIter*)end._cPtr : null);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes the item pointed to by iter. It is an error to pass the
      end iterator to this function.
      
      If the sequence has a data destroy function associated with it, this
      function is called on the data for the removed item.
  
      Params:
        iter = a #GSequenceIter
  */
  static void remove(glib.sequence_iter.SequenceIter iter)
  {
    g_sequence_remove(iter ? cast(GSequenceIter*)iter._cPtr : null);
  }

  /**
      Removes all items in the (begin, end) range.
      
      If the sequence has a data destroy function associated with it, this
      function is called on the data for the removed items.
  
      Params:
        begin = a #GSequenceIter
        end = a #GSequenceIter
  */
  static void removeRange(glib.sequence_iter.SequenceIter begin, glib.sequence_iter.SequenceIter end)
  {
    g_sequence_remove_range(begin ? cast(GSequenceIter*)begin._cPtr : null, end ? cast(GSequenceIter*)end._cPtr : null);
  }

  /**
      Changes the data for the item pointed to by iter to be data. If
      the sequence has a data destroy function associated with it, that
      function is called on the existing data that iter pointed to.
  
      Params:
        iter = a #GSequenceIter
        data = new data for the item
  */
  static void set(glib.sequence_iter.SequenceIter iter, void* data = null)
  {
    g_sequence_set(iter ? cast(GSequenceIter*)iter._cPtr : null, data);
  }

  /**
      Moves the data pointed to by iter to a new position as indicated by
      cmp_func. This
      function should be called for items in a sequence already sorted according
      to cmp_func whenever some aspect of an item changes so that cmp_func
      may return different values for that item.
      
      cmp_func is called with two items of the seq, and cmp_data.
      It should return 0 if the items are equal, a negative value if
      the first item comes before the second, and a positive value if
      the second item comes before the first.
  
      Params:
        iter = A #GSequenceIter
        cmpFunc = the function used to compare items in the sequence
  */
  static void sortChanged(glib.sequence_iter.SequenceIter iter, glib.types.CompareDataFunc cmpFunc)
  {
    extern(C) int _cmpFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _cmpFuncCB = cmpFunc ? &_cmpFuncCallback : null;
    auto _cmpFunc = cmpFunc ? cast(void*)&(cmpFunc) : null;
    g_sequence_sort_changed(iter ? cast(GSequenceIter*)iter._cPtr : null, _cmpFuncCB, _cmpFunc);
  }

  /**
      Like [glib.sequence.Sequence.sortChanged], but uses
      a #GSequenceIterCompareFunc instead of a #GCompareDataFunc as
      the compare function.
      
      iter_cmp is called with two iterators pointing into the #GSequence that
      iter points into. It should
      return 0 if the iterators are equal, a negative value if the first
      iterator comes before the second, and a positive value if the second
      iterator comes before the first.
  
      Params:
        iter = a #GSequenceIter
        iterCmp = the function used to compare iterators in the sequence
  */
  static void sortChangedIter(glib.sequence_iter.SequenceIter iter, glib.types.SequenceIterCompareFunc iterCmp)
  {
    extern(C) int _iterCmpCallback(GSequenceIter* a, GSequenceIter* b, void* data)
    {
      auto _dlg = cast(glib.types.SequenceIterCompareFunc*)data;

      int _retval = (*_dlg)(a ? new glib.sequence_iter.SequenceIter(cast(void*)a, No.Take) : null, b ? new glib.sequence_iter.SequenceIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _iterCmpCB = iterCmp ? &_iterCmpCallback : null;
    auto _iterCmp = iterCmp ? cast(void*)&(iterCmp) : null;
    g_sequence_sort_changed_iter(iter ? cast(GSequenceIter*)iter._cPtr : null, _iterCmpCB, _iterCmp);
  }

  /**
      Swaps the items pointed to by `a` and `b`. It is allowed for `a` and `b`
      to point into difference sequences.
  
      Params:
        a = a #GSequenceIter
        b = a #GSequenceIter
  */
  static void swap(glib.sequence_iter.SequenceIter a, glib.sequence_iter.SequenceIter b)
  {
    g_sequence_swap(a ? cast(GSequenceIter*)a._cPtr : null, b ? cast(GSequenceIter*)b._cPtr : null);
  }
}
