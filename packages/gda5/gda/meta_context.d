/// Module for [MetaContext] class
module gda.meta_context;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.types;
import gid.gid;
import gobject.boxed;
import gobject.value;

/**
    The <structname>GdaMetaContext</structname> represents a meta data modification
    context: the <emphasis>how</emphasis> when used with [gda.meta_store.MetaStore.modifyWithContext],
    and the <emphasis>what</emphasis> when used with [gda.connection.Connection.updateMetaStore].
    
    To create a new #GdaMetaContext use #gda_meta_context_new.
    
    To add a new column/value pair use #gda_meta_context_add_column.
    
    To free a #GdaMetaContext, created by #gda_meta_context_new, use #gda_attributes_manager_free.
    
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_meta_context_free on a struct that was created manually.
*/
class MetaContext : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_meta_context_get_type != &gidSymbolNotFound ? gda_meta_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MetaContext self()
  {
    return this;
  }

  /**
      Get `tableName` field.
      Returns: the name of the table <emphasis>in the GdaMetaStore's internal database</emphasis>
  */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaMetaContext*)this._cPtr).tableName);
  }

  /**
      Set `tableName` field.
      Params:
        propval = the name of the table <emphasis>in the GdaMetaStore's internal database</emphasis>
  */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaMetaContext*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaMetaContext*)this._cPtr).tableName);
  }

  /**
      Get `size` field.
      Returns: the size of the @column_names and @column_values arrays
  */
  @property int size()
  {
    return (cast(GdaMetaContext*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the size of the @column_names and @column_values arrays
  */
  @property void size(int propval)
  {
    (cast(GdaMetaContext*)this._cPtr).size = propval;
  }

  /**
      Creates a new #GdaMetaContext struct with a #GHashTable to store column/value pairs.
      Returns: a new #GdaMetaContext struct with a new created hash to
        store column name/value pairs.
  */
  this()
  {
    GdaMetaContext* _cretval;
    _cretval = gda_meta_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copy constructor.
      Returns: a new #GdaMetaContext
  */
  gda.meta_context.MetaContext copy()
  {
    GdaMetaContext* _cretval;
    _cretval = gda_meta_context_copy(cast(GdaMetaContext*)this._cPtr);
    auto _retval = _cretval ? new gda.meta_context.MetaContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get table's name to used in the context.
      Returns: A string with the table's name used in the context.
  */
  string getTable()
  {
    const(char)* _cretval;
    _cretval = gda_meta_context_get_table(cast(GdaMetaContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets a new column/value pair to the given context ctx. Column, must be a column in the given table's
      name setted by #gda_meta_context_set_table () (a table in the <link linkend="information_schema">database
      schema</link>). If the given column already exists it's value is overwrited.
      
      Column's name and value is copied and destroyed when #gda_meta_context_free is called.
  
      Params:
        column = the column's name
        value = the column's value
        cnc = a #GdaConnection to be used when identifier are normalized, or NULL
  */
  void setColumn(string column, gobject.value.Value value, gda.connection.Connection cnc = null)
  {
    const(char)* _column = column.toCString(No.Alloc);
    gda_meta_context_set_column(cast(GdaMetaContext*)this._cPtr, _column, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
  }

  /**
      Set table's name to use in the context. The table is one of <link linkend="information_schema">database
      schema</link> used to store meta information about the database. Use "_tables" to update meta information
      about database's tables.
  
      Params:
        table = a string with the table's name to use in context
  */
  void setTable(string table)
  {
    const(char)* _table = table.toCString(No.Alloc);
    gda_meta_context_set_table(cast(GdaMetaContext*)this._cPtr, _table);
  }
}
