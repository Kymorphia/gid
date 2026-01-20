/// Module for [SequenceIter] class
module glib.sequence_iter;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.sequence;
import glib.types;

/**
    The #GSequenceIter struct is an opaque data type representing an
    iterator pointing into a #GSequence.
*/
class SequenceIter
{
  GSequenceIter* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.sequence_iter.SequenceIter");

    _cInstancePtr = cast(GSequenceIter*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Returns a negative number if `a` comes before `b`, 0 if they are equal,
      and a positive number if `a` comes after `b`.
      
      The `a` and `b` iterators must point into the same sequence.
  
      Params:
        b = a #GSequenceIter
      Returns: a negative number if `a` comes before `b`, 0 if they are
            equal, and a positive number if `a` comes after `b`
  */
  int compare(glib.sequence_iter.SequenceIter b)
  {
    int _retval;
    _retval = g_sequence_iter_compare(cast(GSequenceIter*)this._cPtr, b ? cast(GSequenceIter*)b._cPtr : null);
    return _retval;
  }

  /**
      Returns the position of iter
      Returns: the position of iter
  */
  int getPosition()
  {
    int _retval;
    _retval = g_sequence_iter_get_position(cast(GSequenceIter*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GSequence that iter points into.
      Returns: the #GSequence that iter points into
  */
  glib.sequence.Sequence getSequence()
  {
    GSequence* _cretval;
    _cretval = g_sequence_iter_get_sequence(cast(GSequenceIter*)this._cPtr);
    auto _retval = _cretval ? new glib.sequence.Sequence(cast(GSequence*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether iter is the begin iterator
      Returns: whether iter is the begin iterator
  */
  bool isBegin()
  {
    bool _retval;
    _retval = cast(bool)g_sequence_iter_is_begin(cast(GSequenceIter*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether iter is the end iterator
      Returns: Whether iter is the end iterator
  */
  bool isEnd()
  {
    bool _retval;
    _retval = cast(bool)g_sequence_iter_is_end(cast(GSequenceIter*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GSequenceIter which is delta positions away from iter.
      If iter is closer than -delta positions to the beginning of the sequence,
      the begin iterator is returned. If iter is closer than delta positions
      to the end of the sequence, the end iterator is returned.
  
      Params:
        delta = A positive or negative number indicating how many positions away
             from iter the returned #GSequenceIter will be
      Returns: a #GSequenceIter which is delta positions away from iter
  */
  glib.sequence_iter.SequenceIter move(int delta)
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_iter_move(cast(GSequenceIter*)this._cPtr, delta);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns an iterator pointing to the next position after iter.
      If iter is the end iterator, the end iterator is returned.
      Returns: a #GSequenceIter pointing to the next position after iter
  */
  glib.sequence_iter.SequenceIter next()
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_iter_next(cast(GSequenceIter*)this._cPtr);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns an iterator pointing to the previous position before iter.
      If iter is the begin iterator, the begin iterator is returned.
      Returns: a #GSequenceIter pointing to the previous position
            before iter
  */
  glib.sequence_iter.SequenceIter prev()
  {
    GSequenceIter* _cretval;
    _cretval = g_sequence_iter_prev(cast(GSequenceIter*)this._cPtr);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }
}
