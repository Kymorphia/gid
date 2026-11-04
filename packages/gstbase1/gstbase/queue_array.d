/// Module for [QueueArray] class
module gstbase.queue_array;

public import gid.basictypes;
import gid.gid;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstQueueArray is an object that provides standard queue functionality
    based on an array instead of linked lists. This reduces the overhead
    caused by memory management by a large factor.

    Deprecated: Use #GstVecDeque instead.
*/
class QueueArray : OpaqueWrap!(GstQueueArray*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /** */
  void pushTailStruct(void* pStruct = null) nothrow
  {
    gst_queue_array_push_tail_struct(cast(GstQueueArray*)this._cPtr, pStruct);
  }
}
