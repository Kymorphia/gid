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

  /**
      Create a `transaction_status_event.TransactionStatusEvent` wrap type.
      Params:
        trans = 
        type = 
        connEvent = 
  */
  this(gda.transaction_status.TransactionStatus trans = gda.transaction_status.TransactionStatus.init, gda.types.TransactionStatusEventType type = gda.types.TransactionStatusEventType.init, gda.connection_event.ConnectionEvent connEvent = gda.connection_event.ConnectionEvent.init) nothrow
  {
    this.trans = trans;
    this.type = type;
    this.connEvent = connEvent;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaTransactionStatusEvent*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gda.transaction_status.TransactionStatus _transRef; // Keeps borrowed field value alive

  /** */
  @property gda.transaction_status.TransactionStatus trans() nothrow
  {
    return cToD!(gda.transaction_status.TransactionStatus)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).trans);
  }

  /** */
  @property void trans(gda.transaction_status.TransactionStatus propval) nothrow
  {
    _transRef = propval;
    (cast(GdaTransactionStatusEvent*)this._cPtr).trans = propval ? cast(GdaTransactionStatus*)propval._cPtr(No.Dup) : null;
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

  private gda.connection_event.ConnectionEvent _connEventRef; // Keeps borrowed field value alive

  /** */
  @property gda.connection_event.ConnectionEvent connEvent() nothrow
  {
    return cToD!(gda.connection_event.ConnectionEvent)(cast(void*)(cast(GdaTransactionStatusEvent*)this._cPtr).connEvent);
  }

  /** */
  @property void connEvent(gda.connection_event.ConnectionEvent propval) nothrow
  {
    _connEventRef = propval;
    (cast(GdaTransactionStatusEvent*)this._cPtr).connEvent = propval ? cast(GdaConnectionEvent*)propval._cPtr(No.Dup) : null;
  }
}
