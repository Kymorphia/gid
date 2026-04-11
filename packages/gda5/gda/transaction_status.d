/// Module for [TransactionStatus] class
module gda.transaction_status;

import gda.c.functions;
import gda.c.types;
import gda.transaction_status_event;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class TransactionStatus : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_transaction_status_get_type != &gidSymbolNotFound ? gda_transaction_status_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TransactionStatus self()
  {
    return this;
  }

  /**
      Get builder for [gda.transaction_status.TransactionStatus]
      Returns: New builder object
  */
  static TransactionStatusGidBuilder builder()
  {
    return new TransactionStatusGidBuilder;
  }

  /**
      Creates a new #GdaTransactionStatus object, which allows a fine-tune and
      full control of transactions to be used with providers.
  
      Params:
        name = name for the transaction
      Returns: the newly created object.
  */
  this(string name)
  {
    GdaTransactionStatus* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gda_transaction_status_new(_name);
    this(_cretval, Yes.Take);
  }

  /** */
  gda.transaction_status.TransactionStatus find(string str, gda.transaction_status_event.TransactionStatusEvent destev)
  {
    GdaTransactionStatus* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gda_transaction_status_find(cast(GdaTransactionStatus*)this._cPtr, _str, destev ? cast(GdaTransactionStatusEvent**)destev._cPtr : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.transaction_status.TransactionStatus)(cast(GdaTransactionStatus*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Find a pointer to the "current" _unnamed_ transaction, which is the last
      transaction if there are several nested transactions
  
      Params:
        destev = 
        unnamedOnly = 
      Returns: 
  */
  gda.transaction_status.TransactionStatus findCurrent(gda.transaction_status_event.TransactionStatusEvent destev, bool unnamedOnly)
  {
    GdaTransactionStatus* _cretval;
    _cretval = gda_transaction_status_find_current(cast(GdaTransactionStatus*)this._cPtr, destev ? cast(GdaTransactionStatusEvent**)destev._cPtr : null, unnamedOnly);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.transaction_status.TransactionStatus)(cast(GdaTransactionStatus*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void freeEvents(gda.transaction_status_event.TransactionStatusEvent event, bool freeAfter)
  {
    gda_transaction_status_free_events(cast(GdaTransactionStatus*)this._cPtr, event ? cast(GdaTransactionStatusEvent*)event._cPtr : null, freeAfter);
  }
}

/// Fluent builder implementation template for [gda.transaction_status.TransactionStatus]
class TransactionStatusGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gda.transaction_status.TransactionStatus]
final class TransactionStatusGidBuilder : TransactionStatusGidBuilderImpl!TransactionStatusGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TransactionStatus build()
  {
    return new TransactionStatus(cast(void*)createGObject(TransactionStatus._getGType), Yes.Take);
  }
}
