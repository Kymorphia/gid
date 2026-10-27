/// Module for [SqlStatementCheckValidityData] class
module gda.sql_statement_check_validity_data;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.meta_store;
import gda.meta_struct;
import gda.types;
import gid.gid;

/**
    Validation against a dictionary
*/
class SqlStatementCheckValidityData
{
  GdaSqlStatementCheckValidityData _cInstance;

  /**
      Create a `sql_statement_check_validity_data.SqlStatementCheckValidityData` wrap type.
      Params:
        cnc = 
        store = 
        mstruct = 
  */
  this(gda.connection.Connection cnc = gda.connection.Connection.init, gda.meta_store.MetaStore store = gda.meta_store.MetaStore.init, gda.meta_struct.MetaStruct mstruct = gda.meta_struct.MetaStruct.init) nothrow
  {
    this.cnc = cnc;
    this.store = store;
    this.mstruct = mstruct;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementCheckValidityData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gda.connection.Connection _cncRef; // Keeps borrowed field value alive

  /** */
  @property gda.connection.Connection cnc() nothrow
  {
    return cToD!(gda.connection.Connection)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).cnc);
  }

  /** */
  @property void cnc(gda.connection.Connection propval) nothrow
  {
    _cncRef = propval;
    (cast(GdaSqlStatementCheckValidityData*)this._cPtr).cnc = propval ? cast(GdaConnection*)propval._cPtr(No.Dup) : null;
  }

  private gda.meta_store.MetaStore _storeRef; // Keeps borrowed field value alive

  /** */
  @property gda.meta_store.MetaStore store() nothrow
  {
    return cToD!(gda.meta_store.MetaStore)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).store);
  }

  /** */
  @property void store(gda.meta_store.MetaStore propval) nothrow
  {
    _storeRef = propval;
    (cast(GdaSqlStatementCheckValidityData*)this._cPtr).store = propval ? cast(GdaMetaStore*)propval._cPtr(No.Dup) : null;
  }

  private gda.meta_struct.MetaStruct _mstructRef; // Keeps borrowed field value alive

  /** */
  @property gda.meta_struct.MetaStruct mstruct() nothrow
  {
    return cToD!(gda.meta_struct.MetaStruct)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).mstruct);
  }

  /** */
  @property void mstruct(gda.meta_struct.MetaStruct propval) nothrow
  {
    _mstructRef = propval;
    (cast(GdaSqlStatementCheckValidityData*)this._cPtr).mstruct = propval ? cast(GdaMetaStruct*)propval._cPtr(No.Dup) : null;
  }
}
