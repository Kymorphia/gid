/// Module for [XaTransaction] class
module gda.xa_transaction;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;

/** */
class XaTransaction : gobject.object.ObjectWrap
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
    return cast(void function())gda_xa_transaction_get_type != &gidSymbolNotFound ? gda_xa_transaction_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override XaTransaction self()
  {
    return this;
  }

  /**
      Creates a new #GdaXaTransaction object, which will control the process of
      performing a distributed transaction across several connections.
  
      Params:
        format = a format ID
        globalTransactionId = the global transaction ID
      Returns: the newly created object.
  */
  this(uint format, string globalTransactionId)
  {
    GdaXaTransaction* _cretval;
    const(char)* _globalTransactionId = globalTransactionId.toCString(No.Alloc);
    _cretval = gda_xa_transaction_new(format, _globalTransactionId);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_xa_transaction_error_quark();
    return _retval;
  }

  /**
      Begins a distributed transaction (managed by xa_trans). Please note that this phase may fail
      for some connections if a (normal) transaction is already started (this depends on the database
      provider being used), so it's better to avoid starting any (normal) transaction on any of the
      connections registered with xa_trans.
      Returns: TRUE if no error occurred
      Throws: [XaTransactionException]
  */
  bool begin()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_xa_transaction_begin(cast(GdaXaTransaction*)this._cPtr, &_err);
    if (_err)
      throw new XaTransactionException(_err);
    return _retval;
  }

  /**
      Commits a distributed transaction (managed by xa_trans). The commit is composed of two phases:
      <itemizedlist>
        <listitem><para>a PREPARE phase where all the connections are required to store their transaction data to a
          permanent place (to be able to complete the commit should a problem occur afterwards)</para></listitem>
        <listitem><para>a COMMIT phase where the transaction data is actually written to the database</para></listitem>
      </itemizedlist>
      
      If the PREPARE phase fails for any of the connection registered with xa_trans, then the distributed commit
      fails and FALSE is returned. During the COMMIT phase, some commit may actually fail but the transaction can
      still be completed because the PREPARE phase succeeded (through the recover method).
  
      Params:
        cncToRecover = a place to store the list of connections for which the commit phase failed, or null
      Returns: TRUE if no error occurred (there may be some connections to recover, though)
      Throws: [XaTransactionException]
  */
  bool commit(out gda.connection.Connection[] cncToRecover)
  {
    bool _retval;
    GSList* _cncToRecover;
    GError *_err;
    _retval = cast(bool)gda_xa_transaction_commit(cast(GdaXaTransaction*)this._cPtr, &_cncToRecover, &_err);
    if (_err)
      throw new XaTransactionException(_err);
    cncToRecover = gSListToD!(gda.connection.Connection, GidOwnership.Full)(_cncToRecover);
    return _retval;
  }

  /**
      Tries to commit the data prepared but which failed to commit (see [gda.xa_transaction.XaTransaction.commit]). This
      method allows one to terminate a distributed transaction which succeeded but for which some
      connections needed to be recovered.
  
      Params:
        cncToRecover = a place to store the list of connections for which the there were data to recover and which failed to be actually committed, or null
      Returns: true if all the data which was still uncommitted has been committed
      Throws: [XaTransactionException]
  */
  bool commitRecovered(out gda.connection.Connection[] cncToRecover)
  {
    bool _retval;
    GSList* _cncToRecover;
    GError *_err;
    _retval = cast(bool)gda_xa_transaction_commit_recovered(cast(GdaXaTransaction*)this._cPtr, &_cncToRecover, &_err);
    if (_err)
      throw new XaTransactionException(_err);
    cncToRecover = gSListToD!(gda.connection.Connection, GidOwnership.Full)(_cncToRecover);
    return _retval;
  }

  /**
      Registers cnc to be used by xa_trans to create a distributed transaction.
      
      Note: any #GdaConnection object can only be registered with at most one #GdaXaTransaction object; also
      some connections may not be registered at all with a #GdaXaTransaction object because the database
      provider being used does not support it.
  
      Params:
        cnc = the connection to add to xa_trans
        branch = the branch qualifier
      Returns: true if no error occurred
      Throws: [XaTransactionException]
  */
  bool registerConnection(gda.connection.Connection cnc, string branch)
  {
    bool _retval;
    const(char)* _branch = branch.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_xa_transaction_register_connection(cast(GdaXaTransaction*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _branch, &_err);
    if (_err)
      throw new XaTransactionException(_err);
    return _retval;
  }

  /**
      Cancels a distributed transaction (managed by xa_trans).
      Returns: true if no error occurred
      Throws: [XaTransactionException]
  */
  bool rollback()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_xa_transaction_rollback(cast(GdaXaTransaction*)this._cPtr, &_err);
    if (_err)
      throw new XaTransactionException(_err);
    return _retval;
  }

  /**
      Unregisters cnc to be used by xa_trans to create a distributed transaction. This is
      the opposite of [gda.xa_transaction.XaTransaction.registerConnection].
  
      Params:
        cnc = the connection to add to xa_trans
  */
  void unregisterConnection(gda.connection.Connection cnc)
  {
    gda_xa_transaction_unregister_connection(cast(GdaXaTransaction*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
  }
}

class XaTransactionException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.xa_transaction.XaTransaction.errorQuark, cast(int)code, msg);
  }

  alias Code = XaTransactionError;
}
