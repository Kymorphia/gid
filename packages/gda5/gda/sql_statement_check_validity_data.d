/// Module for [SqlStatementCheckValidityData] class
module gda.sql_statement_check_validity_data;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_check_validity_data.SqlStatementCheckValidityData");

    _cInstance = *cast(GdaSqlStatementCheckValidityData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.connection.Connection cnc()
  {
    return cToD!(gda.connection.Connection)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).cnc);
  }

  /** */
  @property void cnc(gda.connection.Connection propval)
  {
    cValueFree!(gda.connection.Connection)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).cnc);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementCheckValidityData*)this._cPtr).cnc);
  }

  /** */
  @property gda.meta_store.MetaStore store()
  {
    return cToD!(gda.meta_store.MetaStore)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).store);
  }

  /** */
  @property void store(gda.meta_store.MetaStore propval)
  {
    cValueFree!(gda.meta_store.MetaStore)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).store);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementCheckValidityData*)this._cPtr).store);
  }

  /** */
  @property gda.meta_struct.MetaStruct mstruct()
  {
    return cToD!(gda.meta_struct.MetaStruct)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).mstruct);
  }

  /** */
  @property void mstruct(gda.meta_struct.MetaStruct propval)
  {
    cValueFree!(gda.meta_struct.MetaStruct)(cast(void*)(cast(GdaSqlStatementCheckValidityData*)this._cPtr).mstruct);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementCheckValidityData*)this._cPtr).mstruct);
  }
}
