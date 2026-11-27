/// Module for [QueueArray] class
module gid.gstbase1.queue_array;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    #GstQueueArray is an object that provides standard queue functionality
    based on an array instead of linked lists. This reduces the overhead
    caused by memory management by a large factor.

    Deprecated: Use #GstVecDeque instead.
*/
@gidGir("QueueArray")
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
