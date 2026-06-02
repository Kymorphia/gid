/// Module for [TransactionStatusEvent] class
module gda.transaction_status_event;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.connection_event;
import gda.transaction_status;
import gda.types;
import gid.gid;

/** */
class TransactionStatusEvent
{
  GdaTransactionStatusEvent _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaTransactionStatusEvent*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.transaction_status.TransactionStatus trans() nothrow
  {
    return cToD!(gda.transaction_status.TransactionStatus)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
  }

  /** */
  @property void trans(gda.transaction_status.TransactionStatus propval) nothrow
  {
    cValueFree!(gda.transaction_status.TransactionStatus)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
    dToC(propval, cast(void*)&(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
  }

  /** */
  @property gda.types.TransactionStatusEventType type() nothrow
  {
    return cast(gda.types.TransactionStatusEventType)(cast(GdaTransactionStatusEvent*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.TransactionStatusEventType propval) nothrow
  {
    (cast(GdaTransactionStatusEvent*)this._cPtr).type = cast(GdaTransactionStatusEventType)propval;
  }

  /** */
  @property gda.connection_event.ConnectionEvent connEvent() nothrow
  {
    return cToD!(gda.connection_event.ConnectionEvent)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
  }

  /** */
  @property void connEvent(gda.connection_event.ConnectionEvent propval) nothrow
  {
    cValueFree!(gda.connection_event.ConnectionEvent)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
    dToC(propval, cast(void*)&(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
  }
}
