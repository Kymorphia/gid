/// Module for [SqlStatementTransaction] class
module gda.sql_statement_transaction;

public import gid.basictypes;
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

  /**
      Create a `sql_statement_transaction.SqlStatementTransaction` wrap type.
      Params:
        isolationLevel = isolation level as a #GdaTransactionIsolation
        transMode = transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
        transName = transaction name
  */
  this(gda.types.TransactionIsolation isolationLevel = gda.types.TransactionIsolation.init, string transMode = string.init, string transName = string.init) nothrow
  {
    this.isolationLevel = isolationLevel;
    this.transMode = transMode;
    this.transName = transName;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementTransaction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `isolationLevel` field.
      Returns: isolation level as a #GdaTransactionIsolation
  */
  @property gda.types.TransactionIsolation isolationLevel() nothrow
  {
    return cast(gda.types.TransactionIsolation)(cast(GdaSqlStatementTransaction*)this._cPtr).isolationLevel;
  }

  /**
      Set `isolationLevel` field.
      Params:
        propval = isolation level as a #GdaTransactionIsolation
  */
  @property void isolationLevel(gda.types.TransactionIsolation propval) nothrow
  {
    (cast(GdaSqlStatementTransaction*)this._cPtr).isolationLevel = cast(GdaTransactionIsolation)propval;
  }

  /**
      Get `transMode` field.
      Returns: transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
  */
  @property string transMode() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transMode);
  }

  /**
      Set `transMode` field.
      Params:
        propval = transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
  */
  @property void transMode(string propval) nothrow
  {
    (cast(GdaSqlStatementTransaction*)this._cPtr).transMode = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `transName` field.
      Returns: transaction name
  */
  @property string transName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementTransaction*)this._cPtr).transName);
  }

  /**
      Set `transName` field.
      Params:
        propval = transaction name
  */
  @property void transName(string propval) nothrow
  {
    (cast(GdaSqlStatementTransaction*)this._cPtr).transName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
