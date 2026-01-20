/// Module for [Promise] class
module gst.promise;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.mini_object;
import gst.structure;
import gst.types;

/**
    The #GstPromise object implements the container for values that may
    be available later. i.e. a Future or a Promise in
    <https://en.wikipedia.org/wiki/Futures_and_promises>.
    As with all Future/Promise-like functionality, there is the concept of the
    producer of the value and the consumer of the value.
    
    A #GstPromise is created with [gst.promise.Promise.new_] by the consumer and passed
    to the producer to avoid thread safety issues with the change callback.
    A #GstPromise can be replied to with a value (or an error) by the producer
    with [gst.promise.Promise.reply]. The exact value returned is defined by the API
    contract of the producer and null may be a valid reply.
    [gst.promise.Promise.interrupt] is for the consumer to
    indicate to the producer that the value is not needed anymore and producing
    that value can stop.  The @GST_PROMISE_RESULT_EXPIRED state set by a call
    to [gst.promise.Promise.expire] indicates to the consumer that a value will never
    be produced and is intended to be called by a third party that implements
    some notion of message handling such as #GstBus.
    A callback can also be installed at #GstPromise creation for
    result changes with [gst.promise.Promise.newWithChangeFunc].
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
    [gst.types.PromiseResult.Pending] and only ever transitions once
    into one of the other #GstPromiseResult's.
    
    In order to support multi-threaded code, [gst.promise.Promise.reply],
    [gst.promise.Promise.interrupt] and [gst.promise.Promise.expire] may all be from
    different threads with some restrictions and the final result of the promise
    is whichever call is made first.  There are two restrictions on ordering:
    
    1. That [gst.promise.Promise.reply] and [gst.promise.Promise.interrupt] cannot be called
    after [gst.promise.Promise.expire]
    2. That [gst.promise.Promise.reply] and [gst.promise.Promise.interrupt]
    cannot be called twice.
    
    The change function set with [gst.promise.Promise.newWithChangeFunc] is
    called directly from either the [gst.promise.Promise.reply],
    [gst.promise.Promise.interrupt] or [gst.promise.Promise.expire] and can be called
    from an arbitrary thread.  #GstPromise using APIs can restrict this to
    a single thread or a subset of threads but that is entirely up to the API
    that uses #GstPromise.
*/
class Promise : gobject.boxed.Boxed
{

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
    return cast(void function())gst_promise_get_type != &gidSymbolNotFound ? gst_promise_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Promise self()
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: parent #GstMiniObject
  */
  @property gst.mini_object.MiniObject parent()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstPromise*)this._cPtr).parent);
  }

  /**
      Set `parent` field.
      Params:
        propval = parent #GstMiniObject
  */
  @property void parent(gst.mini_object.MiniObject propval)
  {
    (cast(GstPromise*)this._cPtr).parent = cast(GstMiniObject)propval;
  }

  /** */
  this()
  {
    GstPromise* _cretval;
    _cretval = gst_promise_new();
    this(_cretval, Yes.Take);
  }

  /**
      func will be called exactly once when transitioning out of
      [gst.types.PromiseResult.Pending] into any of the other #GstPromiseResult
      states.
  
      Params:
        func = a #GstPromiseChangeFunc to call
      Returns: a new #GstPromise
  */
  static gst.promise.Promise newWithChangeFunc(gst.types.PromiseChangeFunc func)
  {
    extern(C) void _funcCallback(GstPromise* promise, void* userData)
    {
      auto _dlg = cast(gst.types.PromiseChangeFunc*)userData;

      (*_dlg)(promise ? new gst.promise.Promise(cast(void*)promise, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstPromise* _cretval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _cretval = gst_promise_new_with_change_func(_funcCB, _func, _funcDestroyCB);
    auto _retval = _cretval ? new gst.promise.Promise(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Expire a promise.  This will wake up any waiters with
      [gst.types.PromiseResult.Expired].  Called by a message loop when the parent
      message is handled and/or destroyed (possibly unanswered).
  */
  void expire()
  {
    gst_promise_expire(cast(GstPromise*)this._cPtr);
  }

  /**
      Retrieve the reply set on promise.  promise must be in
      [gst.types.PromiseResult.Replied] and the returned structure is owned by promise
      Returns: The reply set on promise
  */
  gst.structure.Structure getReply()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_promise_get_reply(cast(GstPromise*)this._cPtr);
    gst.structure.Structure _retval;
    if (_cretval)
      _retval = *cast(gst.structure.Structure*)_cretval;
    return _retval;
  }

  /**
      Interrupt waiting for a promise.  This will wake up any waiters with
      [gst.types.PromiseResult.Interrupted].  Called when the consumer does not want
      the value produced anymore.
  */
  void interrupt()
  {
    gst_promise_interrupt(cast(GstPromise*)this._cPtr);
  }

  /**
      Set a reply on promise.  This will wake up any waiters with
      [gst.types.PromiseResult.Replied].  Called by the producer of the value to
      indicate success (or failure).
      
      If promise has already been interrupted by the consumer, then this reply
      is not visible to the consumer.
  
      Params:
        s = a #GstStructure with the the reply contents
  */
  void reply(gst.structure.Structure s)
  {
    gst_promise_reply(cast(GstPromise*)this._cPtr, cast(GstStructure*)&s);
  }

  /**
      Wait for promise to move out of the [gst.types.PromiseResult.Pending] state.
      If promise is not in [gst.types.PromiseResult.Pending] then it will return
      immediately with the current result.
      Returns: the result of the promise
  */
  gst.types.PromiseResult wait()
  {
    GstPromiseResult _cretval;
    _cretval = gst_promise_wait(cast(GstPromise*)this._cPtr);
    gst.types.PromiseResult _retval = cast(gst.types.PromiseResult)_cretval;
    return _retval;
  }
}
