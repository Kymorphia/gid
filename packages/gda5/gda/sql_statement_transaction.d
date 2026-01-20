/// Module for [SqlStatementTransaction] class
module gda.sql_statement_transaction;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    The statement is a transaction management related statement (BEGIN, ROLLBACK, etc). The #GdaSqlStatementTransaction structure
    does not hold enough information to reconstruct the complete SQL statement (some information may be missing) - the aim of this
    structure is to identify a minimum set of information in the transaction statement. Note that the complete SQL which created the
    statement should be available in the #GdaSqlStatement structure which encapsulates this structure.
*/
class SqlStatementTransaction
{
  GdaSqlStatementTransaction _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_transaction.SqlStatementTransaction");

    _cInstance = *cast(GdaSqlStatementTransaction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `isolationLevel` field.
      Returns: isolation level as a #GdaTransactionIsolation
  */
  @property gda.types.TransactionIsolation isolationLevel()
  {
    return cast(gda.types.TransactionIsolation)(cast(GdaSqlStatementTransaction*)this._cPtr).isolationLevel;
  }

  /**
      Set `isolationLevel` field.
      Params:
        propval = isolation level as a #GdaTransactionIsolation
  */
  @property void isolationLevel(gda.types.TransactionIsolation propval)
  {
    (cast(GdaSqlStatementTransaction*)this._cPtr).isolationLevel = cast(GdaTransactionIsolation)propval;
  }

  /**
      Get `transMode` field.
      Returns: transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
  */
  @property string transMode()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transMode);
  }

  /**
      Set `transMode` field.
      Params:
        propval = transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
  */
  @property void transMode(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transMode);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementTransaction*)this._cPtr).transMode);
  }

  /**
      Get `transName` field.
      Returns: transaction name
  */
  @property string transName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transName);
  }

  /**
      Set `transName` field.
      Params:
        propval = transaction name
  */
  @property void transName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transName);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementTransaction*)this._cPtr).transName);
  }
}
