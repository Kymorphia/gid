/// Module for [Promise] class
module gid.gst1.promise;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.mini_object;
import gid.gst1.structure;
import gid.gst1.types;

/**
    The #GstPromise object implements the container for values that may
    be available later. i.e. a Future or a Promise in
    <https://en.wikipedia.org/wiki/Futures_and_promises>.
    As with all Future/Promise-like functionality, there is the concept of the
    producer of the value and the consumer of the value.
    
    A #GstPromise is created with [gid.gst1.promise.Promise.new_] by the consumer and passed
    to the producer to avoid thread safety issues with the change callback.
    A #GstPromise can be replied to with a value (or an error) by the producer
    with [gid.gst1.promise.Promise.reply]. The exact value returned is defined by the API
    contract of the producer and null may be a valid reply.
    [gid.gst1.promise.Promise.interrupt] is for the consumer to
    indicate to the producer that the value is not needed anymore and producing
    that value can stop.  The @GST_PROMISE_RESULT_EXPIRED state set by a call
    to [gid.gst1.promise.Promise.expire] indicates to the consumer that a value will never
    be produced and is intended to be called by a third party that implements
    some notion of message handling such as #GstBus.
    A callback can also be installed at #GstPromise creation for
    result changes with [gid.gst1.promise.Promise.newWithChangeFunc].
    The change callback can be used to chain #GstPromises's together as in the
    following example.
    ```c
    const GstStructure *reply;
    GstPromise *p;
    if (gst_promise_wait (promise) != GST_PROMISE_RESULT_REPLIED)
      return; // interrupted or expired value
    reply = gst_promise_get_reply (promise);
    if (error in reply)
      return; // propagate error
    p = gst_promise_new_with_change_func (another_promise_change_func, user_data, notify);
    pass p to promise-using API
    ```
    
    Each #GstPromise starts out with a #GstPromiseResult of
    [gid.gst1.types.PromiseResult.Pending] and only ever transitions once
    into one of the other #GstPromiseResult's.
    
    In order to support multi-threaded code, [gid.gst1.promise.Promise.reply],
    [gid.gst1.promise.Promise.interrupt] and [gid.gst1.promise.Promise.expire] may all be from
    different threads with some restrictions and the final result of the promise
    is whichever call is made first.  There are two restrictions on ordering:
    
    1. That [gid.gst1.promise.Promise.reply] and [gid.gst1.promise.Promise.interrupt] cannot be called
    after [gid.gst1.promise.Promise.expire]
    2. That [gid.gst1.promise.Promise.reply] and [gid.gst1.promise.Promise.interrupt]
    cannot be called twice.
    
    The change function set with [gid.gst1.promise.Promise.newWithChangeFunc] is
    called directly from either the [gid.gst1.promise.Promise.reply],
    [gid.gst1.promise.Promise.interrupt] or [gid.gst1.promise.Promise.expire] and can be called
    from an arbitrary thread.  #GstPromise using APIs can restrict this to
    a single thread or a subset of threads but that is entirely up to the API
    that uses #GstPromise.
*/
class Promise : gid.gobject2.boxed.BoxedWrap!(gst_promise_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Promise self() nothrow
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: parent #GstMiniObject
  */
  @property gid.gst1.mini_object.MiniObject parent() nothrow
  {
    return cToD!(gid.gst1.mini_object.MiniObject)(cast(void*)&(cast(GstPromise*)this._cPtr).parent);
  }

  /** */
  this() nothrow
  {
    GstPromise* _cretval;
    _cretval = gst_promise_new();
    this(_cretval, Yes.Take);
  }

  /**
      func will be called exactly once when transitioning out of
      [gid.gst1.types.PromiseResult.Pending] into any of the other #GstPromiseResult
      states.
  
      Params:
        func = a #GstPromiseChangeFunc to call
      Returns: a new #GstPromise
  */
  static gid.gst1.promise.Promise newWithChangeFunc(gid.gst1.types.PromiseChangeFunc func) nothrow
  {
    extern(C) void _funcCallback(GstPromise* promise, void* userData) nothrow
    {
      auto _dlg = cast(gid.gst1.types.PromiseChangeFunc*)userData;
      auto _promise = promise ? new gid.gst1.promise.Promise(cast(void*)promise, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(_promise);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.PromiseChangeFunc");
      }
      if (_promise)
        _promise._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    GstPromise* _cretval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _cretval = gst_promise_new_with_change_func(_funcCB, _func, _funcDestroyCB);
    auto _retval = _cretval ? new gid.gst1.promise.Promise(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Expire a promise.  This will wake up any waiters with
      [gid.gst1.types.PromiseResult.Expired].  Called by a message loop when the parent
      message is handled and/or destroyed (possibly unanswered).
  */
  void expire() nothrow
  {
    gst_promise_expire(cast(GstPromise*)this._cPtr);
  }

  /**
      Retrieve the reply set on promise.  promise must be in
      [gid.gst1.types.PromiseResult.Replied] and the returned structure is owned by promise
      Returns: The reply set on promise
  */
  gid.gst1.structure.Structure getReply() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_promise_get_reply(cast(GstPromise*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Interrupt waiting for a promise.  This will wake up any waiters with
      [gid.gst1.types.PromiseResult.Interrupted].  Called when the consumer does not want
      the value produced anymore.
  */
  void interrupt() nothrow
  {
    gst_promise_interrupt(cast(GstPromise*)this._cPtr);
  }

  /**
      Set a reply on promise.  This will wake up any waiters with
      [gid.gst1.types.PromiseResult.Replied].  Called by the producer of the value to
      indicate success (or failure).
      
      If promise has already been interrupted by the consumer, then this reply
      is not visible to the consumer.
  
      Params:
        s = a #GstStructure with the the reply contents
  */
  void reply(gid.gst1.structure.Structure s = null) nothrow
  {
    gst_promise_reply(cast(GstPromise*)this._cPtr, s ? cast(GstStructure*)s._cPtr(Yes.Dup) : null);
  }

  /**
      Wait for promise to move out of the [gid.gst1.types.PromiseResult.Pending] state.
      If promise is not in [gid.gst1.types.PromiseResult.Pending] then it will return
      immediately with the current result.
      Returns: the result of the promise
  */
  gid.gst1.types.PromiseResult wait() nothrow
  {
    GstPromiseResult _cretval;
    _cretval = gst_promise_wait(cast(GstPromise*)this._cPtr);
    gid.gst1.types.PromiseResult _retval = cast(gid.gst1.types.PromiseResult)_cretval;
    return _retval;
  }
}
