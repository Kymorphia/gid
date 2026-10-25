/// Module for [SqlStatementInsert] class
module gda.sql_statement_insert;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    The statement is an INSERT statement, any kind of INSERT statement can be represented using this structure
    (if this is not the case
    then report a bug).
    <mediaobject>
      <imageobject role="html">
        <imagedata fileref="stmt-insert1.png" format="PNG"/>
      </imageobject>
      <caption>
        <para>
    Example of a #GdaSqlStatement having a #GdaSqlStatementInsert as its contents with 2 lists of values
    to insert.
        </para>
      </caption>
    </mediaobject>
    <mediaobject>
      <imageobject role="html">
        <imagedata fileref="stmt-insert2.png" format="PNG"/>
      </imageobject>
      <caption>
        <para>
    Another example of a #GdaSqlStatement having a #GdaSqlStatementInsert as its contents, using a SELECT
    to express the values to insert.
        </para>
      </caption>
    </mediaobject>
*/
class SqlStatementInsert
{
  GdaSqlStatementInsert _cInstance;

  /**
      Create a `sql_statement_insert.SqlStatementInsert` wrap type.
      Params:
        onConflict = conflict resolution clause if there is one (such as "OR REPLACE")
  */
  this(string onConflict = string.init) nothrow
  {
    this.onConflict = onConflict;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementInsert*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `onConflict` field.
      Returns: conflict resolution clause if there is one (such as "OR REPLACE")
  */
  @property string onConflict() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementInsert*)this._cPtr).onConflict);
  }

  /**
      Set `onConflict` field.
      Params:
        propval = conflict resolution clause if there is one (such as "OR REPLACE")
  */
  @property void onConflict(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementInsert*)this._cPtr).onConflict);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementInsert*)this._cPtr).onConflict);
  }

  /**
      Get `fieldsList` field.
      Returns: list of #GdaSqlField fields which are valued for insertion
  */
  @property void*[] fieldsList() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementInsert*)this._cPtr).fieldsList);
  }

  /**
      Get `valuesList` field.
      Returns: list of list of #GdaSqlExpr expressions (this is a list of list, not a simple list)
  */
  @property void*[] valuesList() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementInsert*)this._cPtr).valuesList);
  }
}
