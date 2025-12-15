/// Module for [ServerOperation] class
module gda.server_operation;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.server_provider;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;
import libxml2.types;

/** */
class ServerOperation : gobject.object.ObjectWrap
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
    return cast(void function())gda_server_operation_get_type != &gidSymbolNotFound ? gda_server_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerOperation self()
  {
    return this;
  }

  /**
      IMPORTANT NOTE: Using this funtion is not the recommended way of creating a #GdaServerOperation object, the
      correct way is to use [gda.server_provider.ServerProvider.createOperation]; this method is reserved for the database provider's
      implementation.
      
      Creates a new #GdaServerOperation object from the xml_file specifications
      
      The xml_file must respect the DTD described in the "libgda-server-operation.dtd" file: its top
      node must be a &lt;serv_op&gt; tag.
  
      Params:
        opType = type of operation
        xmlFile = a file which has the specifications for the GdaServerOperation object to create
      Returns: a new #GdaServerOperation object
  */
  this(gda.types.ServerOperationType opType, string xmlFile)
  {
    GdaServerOperation* _cretval;
    const(char)* _xmlFile = xmlFile.toCString(No.Alloc);
    _cretval = gda_server_operation_new(opType, _xmlFile);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_server_operation_error_quark();
    return _retval;
  }

  /**
      Get a string version of type
  
      Params:
        type = a #GdaServerOperationType value
      Returns: a non null string (do not free or modify)
  */
  static string opTypeToString(gda.types.ServerOperationType type)
  {
    const(char)* _cretval;
    _cretval = gda_server_operation_op_type_to_string(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Creates a new #GdaServerOperation object which contains the specifications required
      to create a database. Once these specifications provided, use
      [gda.server_operation.ServerOperation.performCreateDatabase] to perform the database creation.
      
      If db_name is left null, then the name of the database to create will have to be set in the
      returned #GdaServerOperation using [gda.server_operation.ServerOperation.setValueAt].
  
      Params:
        provider = the database provider to use
        dbName = the name of the database to create, or null
      Returns: new #GdaServerOperation object, or null if the provider does not support database
        creation
      Throws: [ServerOperationException]
  */
  static gda.server_operation.ServerOperation prepareCreateDatabase(string provider, string dbName = null)
  {
    GdaServerOperation* _cretval;
    const(char)* _provider = provider.toCString(No.Alloc);
    const(char)* _dbName = dbName.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_server_operation_prepare_create_database(_provider, _dbName, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_operation.ServerOperation)(cast(GdaServerOperation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaServerOperation object which contains the specifications required
      to drop a database. Once these specifications provided, use
      [gda.server_operation.ServerOperation.performDropDatabase] to perform the database creation.
      
      If db_name is left null, then the name of the database to drop will have to be set in the
      returned #GdaServerOperation using [gda.server_operation.ServerOperation.setValueAt].
  
      Params:
        provider = the database provider to use
        dbName = the name of the database to drop, or null
      Returns: new #GdaServerOperation object, or null if the provider does not support database
        destruction
      Throws: [ServerOperationException]
  */
  static gda.server_operation.ServerOperation prepareDropDatabase(string provider, string dbName = null)
  {
    GdaServerOperation* _cretval;
    const(char)* _provider = provider.toCString(No.Alloc);
    const(char)* _dbName = dbName.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_server_operation_prepare_drop_database(_provider, _dbName, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_operation.ServerOperation)(cast(GdaServerOperation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is just a convenient function to create a #GdaServerOperation to drop a
      table in an opened connection.
  
      Params:
        cnc = an opened connection
        tableName = name of the table to drop
      Returns: a new #GdaServerOperation or null if couldn't create the opereration.
      Throws: [ServerOperationException]
  */
  static gda.server_operation.ServerOperation prepareDropTable(gda.connection.Connection cnc, string tableName)
  {
    GdaServerOperation* _cretval;
    const(char)* _tableName = tableName.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_server_operation_prepare_drop_table(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _tableName, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_operation.ServerOperation)(cast(GdaServerOperation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Performs the reverse of [gda.server_operation.ServerOperation.opTypeToString]
  
      Params:
        str = a string
      Returns: the #GdaServerOperationType represented by str, or #G_MAXINT if str is not a valid representation
        of a #GdaServerOperationType
  */
  static gda.types.ServerOperationType stringToOpType(string str)
  {
    GdaServerOperationType _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gda_server_operation_string_to_op_type(_str);
    gda.types.ServerOperationType _retval = cast(gda.types.ServerOperationType)_cretval;
    return _retval;
  }

  /** */
  uint addItemToSequence(string seqPath)
  {
    uint _retval;
    const(char)* _seqPath = seqPath.toCString(No.Alloc);
    _retval = gda_server_operation_add_item_to_sequence(cast(GdaServerOperation*)this._cPtr, _seqPath);
    return _retval;
  }

  /** */
  bool delItemFromSequence(string itemPath)
  {
    bool _retval;
    const(char)* _itemPath = itemPath.toCString(No.Alloc);
    _retval = cast(bool)gda_server_operation_del_item_from_sequence(cast(GdaServerOperation*)this._cPtr, _itemPath);
    return _retval;
  }

  /**
      Get the complete path to the parent of the node defined by path
  
      Params:
        path = a complete path to a node (starting with "/")
      Returns: a new string or null if the node does not have any parent or does not exist.
  */
  string getNodeParent(string path)
  {
    char* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_node_parent(cast(GdaServerOperation*)this._cPtr, _path);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the last part of path
  
      Params:
        path = a complete path to a node (starting with "/")
      Returns: a new string, or null if an error occurred
  */
  string getNodePathPortion(string path)
  {
    char* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_node_path_portion(cast(GdaServerOperation*)this._cPtr, _path);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the type of operation op is for
      Returns: a #GdaServerOperationType enum
  */
  gda.types.ServerOperationType getOpType()
  {
    GdaServerOperationType _cretval;
    _cretval = gda_server_operation_get_op_type(cast(GdaServerOperation*)this._cPtr);
    gda.types.ServerOperationType _retval = cast(gda.types.ServerOperationType)_cretval;
    return _retval;
  }

  /**
      Get an array of strings containing the paths of nodes situated at the root of op.
      Returns: a new array, which must be freed with [glib.global.strfreev].
  */
  string[] getRootNodes()
  {
    char** _cretval;
    _cretval = gda_server_operation_get_root_nodes(cast(GdaServerOperation*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Fetch the contents of a sequence. path can describe either a sequence (for example "/SEQNAME") or an item in a sequence
      (for example "/SEQNAME/3")
  
      Params:
        path = a complete path to a sequence node (starting with "/")
      Returns: a array of strings containing the complete paths of the nodes contained at path (free with [glib.global.strfreev])
  */
  string[] getSequenceItemNames(string path)
  {
    char** _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_sequence_item_names(cast(GdaServerOperation*)this._cPtr, _path);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  uint getSequenceMaxSize(string path)
  {
    uint _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = gda_server_operation_get_sequence_max_size(cast(GdaServerOperation*)this._cPtr, _path);
    return _retval;
  }

  /** */
  uint getSequenceMinSize(string path)
  {
    uint _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = gda_server_operation_get_sequence_min_size(cast(GdaServerOperation*)this._cPtr, _path);
    return _retval;
  }

  /** */
  string getSequenceName(string path)
  {
    const(char)* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_sequence_name(cast(GdaServerOperation*)this._cPtr, _path);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  uint getSequenceSize(string path)
  {
    uint _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = gda_server_operation_get_sequence_size(cast(GdaServerOperation*)this._cPtr, _path);
    return _retval;
  }

  /**
      This method is similar to [gda.server_operation.ServerOperation.getValueAt], but for SQL identifiers: a new string
      is returned instead of a #GValue. Also the returned string is assumed to represents an SQL identifier
      and will correctly be quoted to be used with cnc, or prov if cnc is null (a generic quoting rule
      will be applied if both are null).
  
      Params:
        cnc = a #GdaConnection, or null
        prov = a #GdaServerProvider, or null
        path = a complete path to a node (starting with "/")
      Returns: a new string, or null if the value is undefined or
        if the path is not defined or path does not hold any value, or if the value held is not a string
        (in that last case a warning is shown).
  */
  string getSqlIdentifierAt(gda.connection.Connection cnc, gda.server_provider.ServerProvider prov, string path)
  {
    char* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_sql_identifier_at_path(cast(GdaServerOperation*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, prov ? cast(GdaServerProvider*)prov._cPtr(No.Dup) : null, _path);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the value for the node at the path path
  
      Params:
        path = a complete path to a node (starting with "/")
      Returns: a constant #GValue if a value has been defined, or null if the value is undefined or if the path is not defined or path does not hold any value.
  */
  gobject.value.Value getValueAt(string path)
  {
    const(GValue)* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gda_server_operation_get_value_at_path(cast(GdaServerOperation*)this._cPtr, _path);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Tells if all the required values in op have been defined.
      
      if xml_file is not null, the validity of op is tested against that specification,
      and not against the current op's specification.
  
      Params:
        xmlFile = an XML specification file (see [gda.server_operation.ServerOperation.new_]) or null
      Returns: true if op is valid
      Throws: [ServerOperationException]
  */
  bool isValid(string xmlFile = null)
  {
    bool _retval;
    const(char)* _xmlFile = xmlFile.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_server_operation_is_valid(cast(GdaServerOperation*)this._cPtr, _xmlFile, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Loads the contents of node into op. The XML tree passed through the node
      argument must correspond to an XML tree saved using [gda.server_operation.ServerOperation.saveDataToXml].
  
      Params:
        node = a #xmlNodePtr
      Returns: true if no error occurred
      Throws: [ServerOperationException]
  */
  bool loadDataFromXml(libxml2.types.NodePtr node)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_server_operation_load_data_from_xml(cast(GdaServerOperation*)this._cPtr, node, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Creates a new database using the specifications in op. op can be obtained using
      [gda.server_provider.ServerProvider.createOperation], or [gda.server_operation.ServerOperation.prepareCreateDatabase].
  
      Params:
        provider = the database provider to use, or null if op has been created using [gda.server_operation.ServerOperation.prepareCreateDatabase]
      Returns: TRUE if no error occurred and the database has been created, FALSE otherwise
      Throws: [ServerOperationException]
  */
  bool performCreateDatabase(string provider = null)
  {
    bool _retval;
    const(char)* _provider = provider.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_server_operation_perform_create_database(cast(GdaServerOperation*)this._cPtr, _provider, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Performs a prepared #GdaServerOperation to create a table. This could perform
      an operation created by #gda_server_operation_prepare_create_table or any other using the
      the #GdaServerOperation API.
      Returns: TRUE if the table was created; FALSE and set error otherwise
      Throws: [ServerOperationException]
  */
  bool performCreateTable()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_server_operation_perform_create_table(cast(GdaServerOperation*)this._cPtr, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Destroys an existing database using the specifications in op. op can be obtained using
      [gda.server_provider.ServerProvider.createOperation], or [gda.server_operation.ServerOperation.prepareDropDatabase].
  
      Params:
        provider = the database provider to use, or null if op has been created using [gda.server_operation.ServerOperation.prepareDropDatabase]
      Returns: TRUE if no error occurred and the database has been destroyed
      Throws: [ServerOperationException]
  */
  bool performDropDatabase(string provider = null)
  {
    bool _retval;
    const(char)* _provider = provider.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_server_operation_perform_drop_database(cast(GdaServerOperation*)this._cPtr, _provider, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      This is just a convenient function to perform a drop a table operation.
      Returns: TRUE if the table was dropped
      Throws: [ServerOperationException]
  */
  bool performDropTable()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_server_operation_perform_drop_table(cast(GdaServerOperation*)this._cPtr, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Set the value for the node at the path formed using path_format and the ... ellipse (the rules are the same as
      for [glib.global.strdupPrintf]).
      
      Note that trying to set a value for a path which is not used by the current
      provider, such as "/TABLE_OPTIONS_P/TABLE_ENGINE" for a PostgreSQL connection (this option is only supported for MySQL),
      will <emphasis>not</emphasis> generate
      any error; this allows one to give values to a superset of the parameters and thus use the same code for several providers.
      
      Here are the possible formats of path_format:
      <itemizedlist>
       <listitem><para>If the path corresponds to a #GdaHolder, then the parameter is set to <![CDATA["value"]]></para></listitem>
       <listitem><para>If the path corresponds to a sequence item like for example "/SEQUENCE_NAME/5/NAME" for
          the "NAME" value of the 6th item of the "SEQUENCE_NAME" sequence then:
          <itemizedlist>
             <listitem><para>if the sequence already has 6 or more items, then the value is just set to the corresponding
                value in the 6th item of the sequence</para></listitem>
             <listitem><para>if the sequence has less then 6 items, then items are added up to the 6th one before setting
                the value to the corresponding in the 6th item of the sequence</para></listitem>
          </itemizedlist>
       </para></listitem>
       <listitem><para>If the path corresponds to a #GdaDataModel, like for example "/ARRAY/@COLUMN/5" for the value at the
          6th row of the "COLUMN" column of the "ARRAY" data model, then:
          <itemizedlist>
             <listitem><para>if the data model already contains 6 or more rows, then the value is just set</para></listitem>
             <listitem><para>if the data model has less than 6 rows, then rows are added up to the 6th one before setting
                the value</para></listitem>
          </itemizedlist>
       </para></listitem>
      </itemizedlist>
  
      Params:
        value = a string
        path = a complete path to a node (starting with "/")
      Returns: true if no error occurred
      Throws: [ServerOperationException]
  */
  bool setValueAt(string value, string path)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_server_operation_set_value_at_path(cast(GdaServerOperation*)this._cPtr, _value, _path, &_err);
    if (_err)
      throw new ServerOperationException(_err);
    return _retval;
  }

  /**
      Connect to `SequenceItemAdded` signal.
  
      Gets emitted whenever a new sequence item (from a sequence template) has been added
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string seqPath, int itemIndex, gda.server_operation.ServerOperation serverOperation))
  
          `seqPath` the path to the new sequence item (optional)
  
          `itemIndex` the index (starting from 0) of the new sequence item in the sequence (optional)
  
          `serverOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSequenceItemAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.server_operation.ServerOperation)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sequence-item-added", closure, after);
  }

  /**
      Connect to `SequenceItemRemove` signal.
  
      Gets emitted whenever a sequence item is about to be removed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string seqPath, int itemIndex, gda.server_operation.ServerOperation serverOperation))
  
          `seqPath` the path to the sequence item to be removed (optional)
  
          `itemIndex` the index (starting from 0) of the sequence item in the sequence (optional)
  
          `serverOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSequenceItemRemove(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.server_operation.ServerOperation)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sequence-item-remove", closure, after);
  }
}

class ServerOperationException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.server_operation.ServerOperation.errorQuark, cast(int)code, msg);
  }

  alias Code = ServerOperationError;
}
