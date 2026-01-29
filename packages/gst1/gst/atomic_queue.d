/// Module for [AtomicQueue] class
module gst.atomic_queue;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    The #GstAtomicQueue object implements a queue that can be used from multiple
    threads without performing any blocking operations.
*/
class AtomicQueue : gobject.boxed.Boxed
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
    return cast(void function())gst_atomic_queue_get_type != &gidSymbolNotFound ? gst_atomic_queue_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AtomicQueue self()
  {
    return this;
  }

  /**
      Create a new atomic queue instance. initial_size will be rounded up to the
      nearest power of 2 and used as the initial size of the queue.
  
      Params:
        initialSize = initial queue size
      Returns: a new #GstAtomicQueue
  */
  this(uint initialSize)
  {
    GstAtomicQueue* _cretval;
    _cretval = gst_atomic_queue_new(initialSize);
    this(_cretval, Yes.Take);
  }

  /**
      Get the amount of items in the queue.
      Returns: the number of elements in the queue.
  */
  uint length()
  {
    uint _retval;
    _retval = gst_atomic_queue_length(cast(GstAtomicQueue*)this._cPtr);
    return _retval;
  }

  /**
      Peek the head element of the queue without removing it from the queue.
      Returns: the head element of queue or
        null when the queue is empty.
  */
  void* peek()
  {
    auto _retval = gst_atomic_queue_peek(cast(GstAtomicQueue*)this._cPtr);
    return _retval;
  }

  /**
      Get the head element of the queue.
      Returns: the head element of queue or null when
        the queue is empty.
  */
  void* pop()
  {
    auto _retval = gst_atomic_queue_pop(cast(GstAtomicQueue*)this._cPtr);
    return _retval;
  }

  /**
      Append data to the tail of the queue.
  
      Params:
        data = the data
  */
  void push(void* data = null)
  {
    gst_atomic_queue_push(cast(GstAtomicQueue*)this._cPtr, data);
  }
}
