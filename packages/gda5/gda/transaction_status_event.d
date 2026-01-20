/// Module for [TransactionStatusEvent] class
module gda.transaction_status_event;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.transaction_status_event.TransactionStatusEvent");

    _cInstance = *cast(GdaTransactionStatusEvent*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.transaction_status.TransactionStatus trans()
  {
    return cToD!(gda.transaction_status.TransactionStatus)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
  }

  /** */
  @property void trans(gda.transaction_status.TransactionStatus propval)
  {
    cValueFree!(gda.transaction_status.TransactionStatus)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
    dToC(propval, cast(void*)&(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
  }

  /** */
  @property gda.types.TransactionStatusEventType type()
  {
    return cast(gda.types.TransactionStatusEventType)(cast(GdaTransactionStatusEvent*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.TransactionStatusEventType propval)
  {
    (cast(GdaTransactionStatusEvent*)this._cPtr).type = cast(GdaTransactionStatusEventType)propval;
  }

  /** */
  @property gda.connection_event.ConnectionEvent connEvent()
  {
    return cToD!(gda.connection_event.ConnectionEvent)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
  }

  /** */
  @property void connEvent(gda.connection_event.ConnectionEvent propval)
  {
    cValueFree!(gda.connection_event.ConnectionEvent)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
    dToC(propval, cast(void*)&(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
  }
}
