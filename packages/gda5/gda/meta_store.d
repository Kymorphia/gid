/// Module for [MetaStore] class
module gda.meta_store;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.data_model;
import gda.meta_context;
import gda.meta_struct;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/** */
class MetaStore : gobject.object.ObjectWrap
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
    return cast(void function())gda_meta_store_get_type != &gidSymbolNotFound ? gda_meta_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MetaStore self()
  {
    return this;
  }

  /**
      Create a new #GdaMetaStore object.
  
      Params:
        cncString = a connection string, or null for an in-memory internal database
      Returns: the newly created object, or null if an error occurred
  */
  this(string cncString = null)
  {
    GdaMetaStore* _cretval;
    const(char)* _cncString = cncString.toCString(No.Alloc);
    _cretval = gda_meta_store_new(_cncString);
    this(_cretval, Yes.Take);
  }

  /**
      Create a new #GdaMetaStore object using file_name as its internal
      database
  
      Params:
        fileName = a file name
      Returns: the newly created object, or null if an error occurred
  */
  static gda.meta_store.MetaStore newWithFile(string fileName)
  {
    GdaMetaStore* _cretval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    _cretval = gda_meta_store_new_with_file(_fileName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.meta_store.MetaStore)(cast(GdaMetaStore*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_meta_store_error_quark();
    return _retval;
  }

  /**
      Use this method to get a correctly quoted (if necessary) SQL identifier which can be used
      to retrieve or filter information in a #GdaMetaStore which stores meta data about cnc.
      
      The returned SQL identifier can be used in conjunction with [gda.connection.Connection.updateMetaStore],
      [gda.connection.Connection.getMetaStoreData], [gda.connection.Connection.getMetaStoreDataV] and
      [gda.meta_store.MetaStore.extract].
  
      Params:
        id = an SQL identifier
        cnc = a #GdaConnection
      Returns: a new string, to free with [glib.global.gfree] once not needed anymore
  */
  static string sqlIdentifierQuote(string id, gda.connection.Connection cnc)
  {
    char* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gda_meta_store_sql_identifier_quote(_id, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new #GdaDataModelArray data model which can be used, after being correctly filled,
      with the gda_meta_store_modify*() methods.*
      
      To be used by provider's implementation
  
      Params:
        tableName = the name of a table present in store
      Returns: a new #GdaDataModel
  */
  gda.data_model.DataModel createModifyDataModel(string tableName)
  {
    GdaDataModel* _cretval;
    const(char)* _tableName = tableName.toCString(No.Alloc);
    _cretval = gda_meta_store_create_modify_data_model(cast(GdaMetaStore*)this._cPtr, _tableName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Defines a new declared foreign key into store. If another declared foreign key is already defined
      between the two tables and with the same name, then it is first removed.
      
      This method begins a transaction if possible (ie. none is already started), and if it can't,
      then if there is an error, the job may be partially done.
      
      A check is always performed to make sure all the database objects actually
      exist and returns an error if not. The check is performed using mstruct if it's not null (in
      this case only the tables already represented in mstruct will be considered, in other words: mstruct
      will not be modified), and using an internal #GdaMetaStruct is null.
      
      The catalog, schema, table, ref_catalog, ref_schema and ref_table must follow the SQL
      identifiers naming convention, see the <link linkend="gen:sql_identifiers">SQL identifiers</link>
      section. The same convention needs to be respected for the strings in conames and ref_colnames.
      
      If catalog is not null, then schema must also be not null (the same restriction applies to
      ref_catalog and ref_schema).
  
      Params:
        mstruct = a #GdaMetaStruct, or null
        fkName = the name of the foreign key to declare
        catalog = the catalog in which the table (for which the foreign key is for) is, or null
        schema = the schema in which the table (for which the foreign key is for) is, or null
        table = the name of the table (for which the foreign key is for)
        refCatalog = the catalog in which the referenced table is, or null
        refSchema = the schema in which the referenced table is, or null
        refTable = the name of the referenced table
        colnames = an array of column names from the table for which the foreign key is for
        refColnames = an array of column names from the referenced table
      Returns: true if no error occurred
      Throws: [MetaStoreException]
  */
  bool declareForeignKey(gda.meta_struct.MetaStruct mstruct, string fkName, string catalog, string schema, string table, string refCatalog, string refSchema, string refTable, string[] colnames, string[] refColnames)
  {
    bool _retval;
    const(char)* _fkName = fkName.toCString(No.Alloc);
    const(char)* _catalog = catalog.toCString(No.Alloc);
    const(char)* _schema = schema.toCString(No.Alloc);
    const(char)* _table = table.toCString(No.Alloc);
    const(char)* _refCatalog = refCatalog.toCString(No.Alloc);
    const(char)* _refSchema = refSchema.toCString(No.Alloc);
    const(char)* _refTable = refTable.toCString(No.Alloc);
    uint _nbCols;
    if (colnames)
      _nbCols = cast(uint)colnames.length;

    char*[] _tmpcolnames;
    foreach (s; colnames)
      _tmpcolnames ~= s.toCString(No.Alloc);
    char** _colnames = _tmpcolnames.ptr;

    if (refColnames)
      _nbCols = cast(uint)refColnames.length;

    char*[] _tmprefColnames;
    foreach (s; refColnames)
      _tmprefColnames ~= s.toCString(No.Alloc);
    char** _refColnames = _tmprefColnames.ptr;

    GError *_err;
    _retval = cast(bool)gda_meta_store_declare_foreign_key(cast(GdaMetaStore*)this._cPtr, mstruct ? cast(GdaMetaStruct*)mstruct._cPtr(No.Dup) : null, _fkName, _catalog, _schema, _table, _refCatalog, _refSchema, _refTable, _nbCols, _colnames, _refColnames, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      The #GdaMetaStore object maintains a list of (name,value) attributes (attributes names starting with a '_'
      character are for internal use only and cannot be altered). This method and the [gda.meta_store.MetaStore.setAttributeValue]
      method allows the user to add, set or remove attributes specific to their usage.
      
      This method allows to get the value of a attribute stored in store. The returned attribute value is
      placed at att_value, the caller is responsible for free that string.
      
      If there is no attribute named att_name then att_value is set to null
      and error will contain the GDA_META_STORE_ATTRIBUTE_NOT_FOUND_ERROR error code, and FALSE is returned.
  
      Params:
        attName = name of the attribute to get
        attValue = the place to store the attribute value
      Returns: TRUE if no error occurred
      Throws: [MetaStoreException]
  */
  bool getAttributeValue(string attName, out string attValue)
  {
    bool _retval;
    const(char)* _attName = attName.toCString(No.Alloc);
    char* _attValue;
    GError *_err;
    _retval = cast(bool)gda_meta_store_get_attribute_value(cast(GdaMetaStore*)this._cPtr, _attName, &_attValue, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    attValue = _attValue.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get a pointer to the #GdaConnection object internally used by store to store
      its contents.
      
      The returned connection can be used to access some other data than the one managed by store
      itself. The returned object is not owned by the caller (if you need to keep it, then use [gobject.object.ObjectWrap.ref_]).
      Do not close the connection.
      Returns: a #GdaConnection, or null
  */
  gda.connection.Connection getInternalConnection()
  {
    GdaConnection* _cretval;
    _cretval = gda_meta_store_get_internal_connection(cast(GdaMetaStore*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get store's internal schema's version
      Returns: the version (incremented each time the schema changes, backward compatible)
  */
  int getVersion()
  {
    int _retval;
    _retval = gda_meta_store_get_version(cast(GdaMetaStore*)this._cPtr);
    return _retval;
  }

  /**
      Propagates an update to store, the update's contents is represented by new_data, this function is
      primarily reserved to database providers.
  
      Params:
        tableName = the name of the table to modify within store
        newData = a #GdaDataModel containing the new data to set in table_name, or null (treated as a data model
          with no row at all)
        condition = SQL expression (which may contain variables) defining the rows which are being obsoleted by new_data, or null
        valueNames = names of values
        values = values
      Returns: true if no error occurred
      Throws: [MetaStoreException]
  */
  bool modify(string tableName, gda.data_model.DataModel newData, string condition, string[] valueNames, gobject.value.Value[] values)
  {
    bool _retval;
    const(char)* _tableName = tableName.toCString(No.Alloc);
    const(char)* _condition = condition.toCString(No.Alloc);
    int _nvalues;
    if (valueNames)
      _nvalues = cast(int)valueNames.length;

    char*[] _tmpvalueNames;
    foreach (s; valueNames)
      _tmpvalueNames ~= s.toCString(No.Alloc);
    const(char*)* _valueNames = _tmpvalueNames.ptr;

    if (values)
      _nvalues = cast(int)values.length;

    GValue*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= cast(GValue*)obj._cPtr;
    const(GValue*)* _values = _tmpvalues.ptr;

    GError *_err;
    _retval = cast(bool)gda_meta_store_modify_v(cast(GdaMetaStore*)this._cPtr, _tableName, newData ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)newData)._cPtr(No.Dup) : null, _condition, _nvalues, _valueNames, _values, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      Propagates an update to store, the update's contents is represented by new_data, this function is
      primarily reserved to database providers.
  
      Params:
        context = a #GdaMetaContext context describing what to modify in store
        newData = a #GdaDataModel containing the new data to set in table_name, or null (treated as a data model
          with no row at all)
      Returns: TRUE if no error occurred
      Throws: [MetaStoreException]
  */
  bool modifyWithContext(gda.meta_context.MetaContext context, gda.data_model.DataModel newData = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_meta_store_modify_with_context(cast(GdaMetaStore*)this._cPtr, context ? cast(GdaMetaContext*)context._cPtr(No.Dup) : null, newData ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)newData)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      The internal database used by store can be 'augmented' with some user-defined database objects
      (such as tables or views). This method allows one to add a new database object.
      
      If the internal database already contains the object, then:
      <itemizedlist>
        <listitem><para>if the object is equal to the provided description then TRUE is returned</para></listitem>
        <listitem><para>if the object exists but differs from the provided description, then FALSE is returned,
           with the GDA_META_STORE_SCHEMA_OBJECT_CONFLICT_ERROR error code</para></listitem>
      </itemizedlist>
      
      The xml_description defines the table of view's definition, for example:
      <programlisting><![CDATA[<table name="mytable">
          <column name="id" pkey="TRUE"/>
          <column name="value"/>
      </table>]]></programlisting>
      
      The partial DTD for this XML description of the object to add is the following (the top node must be
      a &lt;table&gt; or a &lt;view&gt;):
      <programlisting><![CDATA[<!ELEMENT table (column*,check*,fkey*,unique*)>
      <!ATTLIST table
                name NMTOKEN #REQUIRED>
      
      <!ELEMENT column EMPTY>
      <!ATTLIST column
                name NMTOKEN #REQUIRED
                type CDATA #IMPLIED
                pkey (TRUE|FALSE) #IMPLIED
                autoinc (TRUE|FALSE) #IMPLIED
                nullok (TRUE|FALSE) #IMPLIED>
      
      <!ELEMENT check (#PCDATA)>
      
      <!ELEMENT fkey (part+)>
      <!ATTLIST fkey
                ref_table NMTOKEN #REQUIRED>
      
      <!ELEMENT part EMPTY>
      <!ATTLIST part
                column NMTOKEN #IMPLIED
                ref_column NMTOKEN #IMPLIED>
      
      <!ELEMENT unique (column)>
      
      <!ELEMENT view (definition)>
      <!ATTLIST view
                name NMTOKEN #REQUIRED
                descr CDATA #IMPLIED>
      
      <!ELEMENT definition (#PCDATA)>]]></programlisting>
  
      Params:
        xmlDescription = an XML description of the table or view to add to store
      Returns: TRUE if the new object has successfully been added
      Throws: [MetaStoreException]
  */
  bool schemaAddCustomObject(string xmlDescription)
  {
    bool _retval;
    const(char)* _xmlDescription = xmlDescription.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_meta_store_schema_add_custom_object(cast(GdaMetaStore*)this._cPtr, _xmlDescription, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      Get an ordered list of the tables store knows about. The tables are ordered in a way that tables dependencies
      are respected: if table B has a foreign key on table A, then table A will be listed before table B in the returned
      list.
      Returns: a new list of tables names (as gchar*), the list must be freed when no longer needed, but the strings present in the list must not be modified.
  */
  string[] schemaGetAllTables()
  {
    GSList* _cretval;
    _cretval = gda_meta_store_schema_get_all_tables(cast(GdaMetaStore*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Get an ordered list of the tables store knows about on which the table_name table depends (recursively).
      The tables are ordered in a way that tables dependencies
      are respected: if table B has a foreign key on table A, then table A will be listed before table B in the returned
      list.
  
      Params:
        tableName = the name of the table for which all the dependencies must be listed
      Returns: a new list of tables names (as gchar*), the list must be freed when no longer needed, but the strings present in the list must not be modified.
  */
  string[] schemaGetDependTables(string tableName)
  {
    GSList* _cretval;
    const(char)* _tableName = tableName.toCString(No.Alloc);
    _cretval = gda_meta_store_schema_get_depend_tables(cast(GdaMetaStore*)this._cPtr, _tableName);
    auto _retval = gSListToD!(string, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Creates a new #GdaMetaStruct object representing store's internal database structure.
      Returns: a new #GdaMetaStruct object, or null if an error occurred
      Throws: [MetaStoreException]
  */
  gda.meta_struct.MetaStruct schemaGetStructure()
  {
    GdaMetaStruct* _cretval;
    GError *_err;
    _cretval = gda_meta_store_schema_get_structure(cast(GdaMetaStore*)this._cPtr, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.meta_struct.MetaStruct)(cast(GdaMetaStruct*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes the custom database object named obj_name.
  
      Params:
        objName = name of the custom object to remove
      Returns: TRUE if the custom object has successfully been removed
      Throws: [MetaStoreException]
  */
  bool schemaRemoveCustomObject(string objName)
  {
    bool _retval;
    const(char)* _objName = objName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_meta_store_schema_remove_custom_object(cast(GdaMetaStore*)this._cPtr, _objName, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      Set the value of the attribute named att_name to att_value; see [gda.meta_store.MetaStore.getAttributeValue] for
      more information.
  
      Params:
        attName = name of the attribute to set
        attValue = value of the attribute to set, or null to unset the attribute
      Returns: TRUE if no error occurred
      Throws: [MetaStoreException]
  */
  bool setAttributeValue(string attName, string attValue = null)
  {
    bool _retval;
    const(char)* _attName = attName.toCString(No.Alloc);
    const(char)* _attValue = attValue.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_meta_store_set_attribute_value(cast(GdaMetaStore*)this._cPtr, _attName, _attValue, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      Specifies how store must handle SQL identifiers it has to store. This method is mainly used by
      database providers.
  
      Params:
        style = a style
  */
  void setIdentifiersStyle(gda.types.SqlIdentifierStyle style)
  {
    gda_meta_store_set_identifiers_style(cast(GdaMetaStore*)this._cPtr, style);
  }

  /**
      Specifies a function which store will use to determine if a keyword is an SQL reserved
      keyword or not.
      
      This method is mainly used by database providers.
  
      Params:
        func = a #GdaSqlReservedKeywordsFunc function, or null
  */
  void setReservedKeywordsFunc(gda.types.SqlReservedKeywordsFunc func = null)
  {
    static gda.types.SqlReservedKeywordsFunc _static_func;

    extern(C) gboolean _funcCallback(const(char)* word)
    {
      bool _dretval;
      string _word = word.fromCString(No.Free);

      _dretval = _static_func(_word);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    _static_func = func;
    gda_meta_store_set_reserved_keywords_func(cast(GdaMetaStore*)this._cPtr, _funcCB);
    _static_func = null;
  }

  /**
      Removes a declared foreign key from store.
      
      This method begins a transaction if possible (ie. none is already started), and if it can't, then if there
      is an error, the job may be partially done.
      
      A check is always performed to make sure all the database objects actually
      exist and returns an error if not. The check is performed using mstruct if it's not null (in
      this case only the tables already represented in mstruct will be considered, in other words: mstruct
      will not be modified), and using an internal #GdaMetaStruct is null.
      
      See [gda.meta_store.MetaStore.declareForeignKey] for more information anout the catalog, schema, name,
      ref_catalog, ref_schema and ref_name arguments.
  
      Params:
        mstruct = a #GdaMetaStruct, or null
        fkName = the name of the foreign key to declare
        catalog = the catalog in which the table (for which the foreign key is for) is, or null
        schema = the schema in which the table (for which the foreign key is for) is, or null
        table = the name of the table (for which the foreign key is for)
        refCatalog = the catalog in which the referenced table is, or null
        refSchema = the schema in which the referenced table is, or null
        refTable = the name of the referenced table
      Returns: true if no error occurred
      Throws: [MetaStoreException]
  */
  bool undeclareForeignKey(gda.meta_struct.MetaStruct mstruct, string fkName, string catalog, string schema, string table, string refCatalog, string refSchema, string refTable)
  {
    bool _retval;
    const(char)* _fkName = fkName.toCString(No.Alloc);
    const(char)* _catalog = catalog.toCString(No.Alloc);
    const(char)* _schema = schema.toCString(No.Alloc);
    const(char)* _table = table.toCString(No.Alloc);
    const(char)* _refCatalog = refCatalog.toCString(No.Alloc);
    const(char)* _refSchema = refSchema.toCString(No.Alloc);
    const(char)* _refTable = refTable.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_meta_store_undeclare_foreign_key(cast(GdaMetaStore*)this._cPtr, mstruct ? cast(GdaMetaStruct*)mstruct._cPtr(No.Dup) : null, _fkName, _catalog, _schema, _table, _refCatalog, _refSchema, _refTable, &_err);
    if (_err)
      throw new MetaStoreException(_err);
    return _retval;
  }

  /**
      Connect to `MetaReset` signal.
  
      This signal is emitted when the store's contents have been reset completely and when
        no detailed changes are available
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.meta_store.MetaStore metaStore))
  
          `metaStore` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMetaReset(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.meta_store.MetaStore)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("meta-reset", closure, after);
  }

  /**
      Connect to `SuggestUpdate` signal.
  
      This signal is emitted when the contents of a table should be updated (data to update or insert only;
        deleting data is done automatically). This signal is used for internal purposes by the #GdaConnection
        object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D glib.error.ErrorWrap callback(gda.meta_context.MetaContext suggest, gda.meta_store.MetaStore metaStore))
  
          `suggest` the suggested update, as a #GdaMetaContext structure (optional)
  
          `metaStore` the instance the signal is connected to (optional)
  
          `Returns` a new #GError error structure if there was an error when processing the
            signal, or null if signal propagation should continue
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSuggestUpdate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == glib.error.ErrorWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gda.meta_context.MetaContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.meta_store.MetaStore)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(glib.error.ErrorWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("suggest-update", closure, after);
  }
}

class MetaStoreException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.meta_store.MetaStore.errorQuark, cast(int)code, msg);
  }

  alias Code = MetaStoreError;
}
