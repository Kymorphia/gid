/// C types for gda5 library
module gda.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import libxml2.c.types;

/** */
alias GdaMutex = GRecMutex;

/** */
alias GdaSqlBuilderId = uint;

/** */
alias GdaSqlErrorType = GdaSqlError;

/** */
enum GdaBatchError
{
  /** */
  BatchConflictingParameterError = 0,
}

/** */
enum GdaConfigError
{
  /** */
  DsnNotFoundError = 0,

  /** */
  PermissionError = 1,

  /** */
  ProviderNotFoundError = 2,

  /** */
  ProviderCreationError = 3,
}

/** */
enum GdaConnectionError
{
  /** */
  DsnNotFoundError = 0,

  /** */
  ProviderNotFoundError = 1,

  /** */
  ProviderError = 2,

  /** */
  NoCncSpecError = 3,

  /** */
  NoProviderSpecError = 4,

  /** */
  OpenError = 5,

  /** */
  StatementTypeError = 6,

  /** */
  CantLockError = 7,

  /** */
  TaskNotFoundError = 8,

  /** */
  UnsupportedThreadsError = 9,

  /** */
  ClosedError = 10,

  /** */
  MetaDataContextError = 11,

  /** */
  UnsupportedAsyncExecError = 12,
}

/** */
enum GdaConnectionEventCode
{
  /** */
  ConstraintViolation = 0,

  /** */
  RestrictViolation = 1,

  /** */
  NotNullViolation = 2,

  /** */
  ForeignKeyViolation = 3,

  /** */
  UniqueViolation = 4,

  /** */
  CheckViolation = 5,

  /** */
  InsufficientPrivileges = 6,

  /** */
  UndefinedColumn = 7,

  /** */
  UndefinedFunction = 8,

  /** */
  UndefinedTable = 9,

  /** */
  DuplicateColumn = 10,

  /** */
  DuplicateDatabase = 11,

  /** */
  DuplicateFunction = 12,

  /** */
  DuplicateSchema = 13,

  /** */
  DuplicateTable = 14,

  /** */
  DuplicateAlias = 15,

  /** */
  DuplicateObject = 16,

  /** */
  SyntaxError = 17,

  /** */
  Unknown = 18,
}

/** */
enum GdaConnectionEventType
{
  /** */
  Notice = 0,

  /** */
  Warning = 1,

  /** */
  Error = 2,

  /** */
  Command = 3,
}

/**
    Used in [gda.connection.Connection.supportsFeature] and [gda.server_provider.ServerProvider.supportsFeature] to test if a connection
    or a database provider supports some specific feature.
*/
enum GdaConnectionFeature
{
  /**
      test for aggregates support
  */
  Aggregates = 0,

  /**
      test for BLOBS (binary large objects) support
  */
  Blobs = 1,

  /**
      test for indexes support
  */
  Indexes = 2,

  /**
      test for tables inheritance support
  */
  Inheritance = 3,

  /**
      test for namespaces support
  */
  Namespaces = 4,

  /**
      test for functions support
  */
  Procedures = 5,

  /**
      test for sequences support
  */
  Sequences = 6,

  /**
      test for SQL language (even specific to the database) support
  */
  Sql = 7,

  /**
      test for transactions support
  */
  Transactions = 8,

  /**
      test for savepoints within transactions support
  */
  Savepoints = 9,

  /**
      test if savepoints can be removed
  */
  SavepointsRemove = 10,

  /**
      test for triggers support
  */
  Triggers = 11,

  /**
      test for updatable cursors support
  */
  UpdatableCursor = 12,

  /**
      test for users support
  */
  Users = 13,

  /**
      test for views support
  */
  Views = 14,

  /**
      test for distributed transactions support
  */
  XaTransactions = 15,

  /**
      test for native multi-threading support
  */
  MultiThreading = 16,

  /**
      test if connection supports asynchronous execution
  */
  AsyncExec = 17,

  /**
      not used
  */
  Last = 18,
}

/**
    Used with [gda.connection.Connection.getMetaStoreData] to describe what meta data to extract from
    a connection's associated #GdaMetaStore.
*/
enum GdaConnectionMetaType
{
  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_NAMESPACES">namespaces</link> (or schemas for PostgreSQL)
  */
  Namespaces = 0,

  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_TYPES">database types</link>
  */
  Types = 1,

  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_TABLES">tables</link>
  */
  Tables = 2,

  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_VIEWS">views</link>
  */
  Views = 3,

  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_FIELDS">table's or view's fields</link>
  */
  Fields = 4,

  /**
      lists the <link linkend="GdaConnectionMetaTypeGDA_CONNECTION_META_INDEXES">table's indexes</link>
  */
  Indexes = 5,
}

/**
    Specifies some aspects of a connection when opening it.
    
    Additional information about the GDA_CONNECTION_OPTIONS_SQL_IDENTIFIERS_CASE_SENSITIVE flag:
    <itemizedlist>
      <listitem><para>For example without this flag, if the table
          name specified in a #GdaServerOperation to create a table is
          <emphasis>MyTable</emphasis>, then usually the database will create a table named
          <emphasis>mytable</emphasis>, whereas with this flag, the table will be created
          as <emphasis>MyTable</emphasis> (note that in the end the database may still decide
          to name the table <emphasis>mytable</emphasis> or differently if it can't do
          otherwise).</para></listitem>
      <listitem><para>Libgda will not apply this rule when parsing SQL code, the SQL code being parsed
          has to be conform to the database it will be used with</para></listitem>
    </itemizedlist>
    
    Additional information about the GDA_CONNECTION_OPTIONS_THREAD_SAFE and GDA_CONNECTION_OPTIONS_THREAD_ISOLATED flags:
    The GDA_CONNECTION_OPTIONS_THREAD_SAFE flag specifies that it has to be able to use the returned connection object from
    several threads at once (locking is ensured by the #GdaConnection itself). Depending on the database provider's
    implementation and on the native libraries it uses, the "normal" connection object might not respect this requirement,
    and in this case a specific thread is started and used as the unique thread which will manipulate the actual connection,
    while a "wrapper connection" is actually returned and used by the caller (that wrapper connection passes method calls
    from the calling thread to the actual connection's specific thread, and gets the results back).
    
    The GDA_CONNECTION_OPTIONS_THREAD_ISOLATED forces using a specific thread and a "wrapper connection" even if the
    "normal" connection would itself be thread safe; this is useful for example to be sure the asynchronous API can
    always be used (see [gda.connection.Connection.asyncStatementExecute]).
    
    Having a specific thread and a "wrapper connection" definitely has an impact on the performances (because it involves
    messages passing between threads for every method call), so using the
    GDA_CONNECTION_OPTIONS_THREAD_SAFE or GDA_CONNECTION_OPTIONS_THREAD_ISOLATED flags should be carefully considered.
    
    Note about the @GDA_CONNECTION_OPTIONS_AUTO_META_DATA flag:
    <itemizedlist>
     <listitem><para>Every time a DDL statement is successfully executed, the associated meta data, if
                  defined, will be updated, which has a impact on performances</para></listitem>
     <listitem><para>If a transaction is started and some DDL statements are executed and the transaction
               is not rolled back or committed, then the meta data may end up being wrong</para></listitem>
    </itemizedlist>
*/
enum GdaConnectionOptions : uint
{
  /**
      no specific aspect
  */
  None = 0,

  /**
      this flag specifies that the connection to open should be in a read-only mode
                                         (this policy is not correctly enforced at the moment)
  */
  ReadOnly = 1,

  /**
      this flag specifies that SQL identifiers submitted as input
                                         to Libgda have to keep their case sensitivity.
  */
  SqlIdentifiersCaseSensitive = 2,

  /**
      this flag specifies that the connection to open will be used
                                          by several threads at once so it has to be thread safe
  */
  ThreadSafe = 4,

  /**
      this flag specifies that the connection to open will be used
                                          by several threads at once and requests that the real connection be used
                                          only in a sub thread created specifically for it
  */
  ThreadIsolated = 8,

  /**
      this flags specifies that if a #GdaMetaStore has been associated
                                          to the connection, then it is kept up to date with the evolutions in the
                                          database's structure. Be aware however that there are some drawbacks
                                          explained below.
  */
  AutoMetaData = 16,
}

/** */
enum GdaDataComparatorError
{
  /** */
  MissingDataModelError = 0,

  /** */
  ColumnTypesMismatchError = 1,

  /** */
  ModelAccessError = 2,

  /** */
  UserCancelledError = 3,
}

/** */
enum GdaDataModelAccessFlags : uint
{
  /** */
  Random = 1,

  /** */
  CursorForward = 2,

  /** */
  CursorBackward = 4,

  /** */
  Cursor = 6,

  /** */
  Insert = 8,

  /** */
  Update = 16,

  /** */
  Delete = 32,

  /** */
  Write = 56,
}

/** */
enum GdaDataModelError
{
  /** */
  RowOutOfRangeError = 0,

  /** */
  ColumnOutOfRangeError = 1,

  /** */
  ValuesListError = 2,

  /** */
  ValueTypeError = 3,

  /** */
  RowNotFoundError = 4,

  /** */
  AccessError = 5,

  /** */
  FeatureNonSupportedError = 6,

  /** */
  FileExistError = 7,

  /** */
  XmlFormatError = 8,

  /** */
  TruncatedError = 9,

  /** */
  OtherError = 10,
}

/** */
enum GdaDataModelHint
{
  /** */
  StartBatchUpdate = 0,

  /** */
  EndBatchUpdate = 1,

  /** */
  Refresh = 2,
}

/**
    Format to use when exporting a data model, see [gda.data_model.DataModel.exportToString] and [gda.data_model.DataModel.exportToFile]
*/
enum GdaDataModelIOFormat
{
  /**
      data is exported as an XML structure
  */
  DataArrayXml = 0,

  /**
      data is exported as CSV
  */
  TextSeparated = 1,

  /**
      data is exported as a human readable table
  */
  TextTable = 2,
}

/** */
enum GdaDataModelIterError
{
  /** */
  DataModelIterColumnOutOfRangeError = 0,
}

/**
    Possible operations for the data fields.
*/
enum GdaDataPivotAggregate
{
  /** */
  Avg = 0,

  /** */
  Count = 1,

  /** */
  Max = 2,

  /** */
  Min = 3,

  /** */
  Sum = 4,
}

/**
    Possible #GdaDataPivot related errors.
*/
enum GdaDataPivotError
{
  /** */
  InternalError = 0,

  /** */
  SourceModelError = 1,

  /** */
  FieldFormatError = 2,

  /** */
  UsageError = 3,

  /** */
  OverflowError = 4,
}

/**
    Define types of field to be used when defining a #GdaDataPivot analysis.
*/
enum GdaDataPivotFieldType
{
  /** */
  Row = 0,

  /** */
  Column = 1,
}

/** */
enum GdaDataProxyError
{
  /** */
  CommitError = 0,

  /** */
  CommitCancelled = 1,

  /** */
  ReadOnlyValue = 2,

  /** */
  ReadOnlyRow = 3,

  /** */
  FilterError = 4,
}

/**
    Defines what criteria [gda.data_select.DataSelect.computeModificationStatementsExt] uses
    to uniquely identify a single row in a table when creating modification statements.
*/
enum GdaDataSelectConditionType
{
  /**
      only primary key fields are used
  */
  Pk = 0,

  /**
      all the columns of the tables are used
  */
  AllColumns = 1,
}

/** */
enum GdaDataSelectError
{
  /** */
  ModificationStatementError = 0,

  /** */
  MissingModificationStatementError = 1,

  /** */
  ConnectionError = 2,

  /** */
  AccessError = 3,

  /** */
  SqlError = 4,

  /** */
  SafetyLockedError = 5,
}

/** */
enum GdaDiffType
{
  /** */
  AddRow = 0,

  /** */
  RemoveRow = 1,

  /** */
  ModifyRow = 2,
}

/** */
enum GdaHolderError
{
  /** */
  StringConversionError = 0,

  /** */
  ValueTypeError = 1,

  /** */
  ValueNullError = 2,
}

/**
    Type of database object which can be handled as a #GdaMetaDbObject
*/
enum GdaMetaDbObjectType
{
  /**
      unknown type
  */
  Unknown = 0,

  /**
      represents a table
  */
  Table = 1,

  /**
      represents a view
  */
  View = 2,
}

/**
    Defines the filtering policy of a foreign key when invoked on an UPDATE
    or DELETE operation.
*/
enum GdaMetaForeignKeyPolicy
{
  /**
      unspecified policy
  */
  Unknown = 0,

  /**
      not enforced policy
  */
  None = 1,

  /**
      return an error, no action taken
  */
  NoAction = 2,

  /**
      same as @GDA_META_FOREIGN_KEY_NO_ACTION, not deferrable
  */
  Restrict = 3,

  /**
      policy is to delete any rows referencing the deleted row, or update the value of the referencing column to the new value of the referenced column, respectively
  */
  Cascade = 4,

  /**
      policy is to set the referencing column to NULL
  */
  SetNull = 5,

  /**
      policy is to set the referencing column to its default value
  */
  SetDefault = 6,
}

/** */
enum GdaMetaGraphInfo : uint
{
  /** */
  MetaGraphColumns = 1,
}

/**
    Types of sorting
*/
enum GdaMetaSortType
{
  /**
      sort alphabetically
  */
  Alhapetical = 0,

  /**
      sort by dependencies
  */
  Dependencies = 1,
}

/** */
enum GdaMetaStoreChangeType
{
  /** */
  Add = 0,

  /** */
  Remove = 1,

  /** */
  Modify = 2,
}

/** */
enum GdaMetaStoreError
{
  /** */
  IncorrectSchemaError = 0,

  /** */
  UnsupportedProviderError = 1,

  /** */
  InternalError = 2,

  /** */
  MetaContextError = 3,

  /** */
  ModifyContentsError = 4,

  /** */
  ExtractSqlError = 5,

  /** */
  AttributeNotFoundError = 6,

  /** */
  AttributeError = 7,

  /** */
  SchemaObjectNotFoundError = 8,

  /** */
  SchemaObjectConflictError = 9,

  /** */
  SchemaObjectDescrError = 10,

  /** */
  TransactionAlreadyStartedError = 11,
}

/** */
enum GdaMetaStructError
{
  /** */
  UnknownObjectError = 0,

  /** */
  DuplicateObjectError = 1,

  /** */
  IncoherenceError = 2,

  /** */
  XmlError = 3,
}

/**
    Controls which features are computed about database objects.
*/
enum GdaMetaStructFeature : uint
{
  /**
      database objects only have their own attributes
  */
  None = 0,

  /**
      foreign keys are computed for tables
  */
  ForeignKeys = 1,

  /**
      for views, the tables they use are also computed
  */
  ViewDependencies = 2,

  /**
      all the features are computed
  */
  All = 3,
}

/** */
enum GdaServerOperationCreateTableFlag : uint
{
  /** */
  NothingFlag = 1,

  /** */
  PkeyFlag = 2,

  /** */
  NotNullFlag = 4,

  /** */
  UniqueFlag = 8,

  /** */
  AutoincFlag = 16,

  /** */
  FkeyFlag = 32,

  /** */
  PkeyAutoincFlag = 18,
}

/** */
enum GdaServerOperationError
{
  /** */
  ObjectNameError = 0,

  /** */
  IncorrectValueError = 1,

  /** */
  XmlError = 2,
}

/** */
enum GdaServerOperationNodeStatus
{
  /** */
  Optional = 0,

  /** */
  Required = 1,

  /** */
  Unknown = 2,
}

/** */
enum GdaServerOperationNodeType
{
  /** */
  Paramlist = 0,

  /** */
  DataModel = 1,

  /** */
  Param = 2,

  /** */
  Sequence = 3,

  /** */
  SequenceItem = 4,

  /** */
  DataModelColumn = 5,

  /** */
  Unknown = 6,
}

/** */
enum GdaServerOperationType
{
  /** */
  CreateDb = 0,

  /** */
  DropDb = 1,

  /** */
  CreateTable = 2,

  /** */
  DropTable = 3,

  /** */
  RenameTable = 4,

  /** */
  AddColumn = 5,

  /** */
  DropColumn = 6,

  /** */
  CreateIndex = 7,

  /** */
  DropIndex = 8,

  /** */
  CreateView = 9,

  /** */
  DropView = 10,

  /** */
  CommentTable = 11,

  /** */
  CommentColumn = 12,

  /** */
  CreateUser = 13,

  /** */
  AlterUser = 14,

  /** */
  DropUser = 15,

  /** */
  Last = 16,
}

/** */
enum GdaServerProviderError
{
  /** */
  MethodNonImplementedError = 0,

  /** */
  PrepareStmtError = 1,

  /** */
  EmptyStmtError = 2,

  /** */
  MissingParamError = 3,

  /** */
  StatementExecError = 4,

  /** */
  OperationError = 5,

  /** */
  InternalError = 6,

  /** */
  BusyError = 7,

  /** */
  NonSupportedError = 8,

  /** */
  ServerVersionError = 9,

  /** */
  DataError = 10,

  /** */
  DefaultValueHandlingError = 11,

  /** */
  MisuseError = 12,

  /** */
  FileNotFoundError = 13,
}

/** */
enum GdaSetError
{
  /** */
  XmlSpecError = 0,

  /** */
  HolderNotFoundError = 1,

  /** */
  InvalidError = 2,

  /** */
  ReadOnlyError = 3,

  /** */
  ImplementationError = 4,
}

/**
    Type of part.
*/
enum GdaSqlAnyPartType
{
  /**
      structure is a #GdaSqlStatementSelect
  */
  StmtSelect = 0,

  /**
      structure is a #GdaSqlStatementInsert
  */
  StmtInsert = 1,

  /**
      structure is a #GdaSqlStatementUpdate
  */
  StmtUpdate = 2,

  /**
      structure is a #GdaSqlStatementDelete
  */
  StmtDelete = 3,

  /**
      structure is a #GdaSqlStatementCompound
  */
  StmtCompound = 4,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtBegin = 5,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtRollback = 6,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtCommit = 7,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtSavepoint = 8,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtRollbackSavepoint = 9,

  /**
      structure is a #GdaSqlStatementTransaction
  */
  StmtDeleteSavepoint = 10,

  /**
      structure is a #GdaSqlStatementUnknown
  */
  StmtUnknown = 11,

  /**
      structure is a #GdaSqlExpr
  */
  Expr = 500,

  /**
      structure is a #GdaSqlField
  */
  SqlField = 501,

  /**
      structure is a #GdaSqlTable
  */
  SqlTable = 502,

  /**
      structure is a #GdaSqlFunction
  */
  SqlFunction = 503,

  /**
      structure is a #GdaSqlOperation
  */
  SqlOperation = 504,

  /**
      structure is a #GdaSqlCase
  */
  SqlCase = 505,

  /**
      structure is a #GdaSqlSelectField
  */
  SqlSelectField = 506,

  /**
      structure is a #GdaSqlSelectTarget
  */
  SqlSelectTarget = 507,

  /**
      structure is a #GdaSqlSelectJoin
  */
  SqlSelectJoin = 508,

  /**
      structure is a #GdaSqlSelectFrom
  */
  SqlSelectFrom = 509,

  /**
      structure is a #GdaSqlSelectOrder
  */
  SqlSelectOrder = 510,
}

/** */
enum GdaSqlBuilderError
{
  /** */
  WrongTypeError = 0,

  /** */
  MisuseError = 1,
}

/** */
enum GdaSqlError
{
  /** */
  StructureContentsError = 0,

  /** */
  MalformedIdentifierError = 1,

  /** */
  MissingIdentifierError = 2,

  /** */
  ValidationError = 3,
}

/**
    Specifies how SQL identifiers are represented by a specific database
*/
enum GdaSqlIdentifierStyle : uint
{
  /**
      case insensitive SQL identifiers are represented in lower case (meaning that any SQL identifier which has a non lower case character is case sensitive)
  */
  LowerCase = 1,

  /**
      case insensitive SQL identifiers are represented in upper case (meaning that any SQL identifier which has a non upper case character is case sensitive)
  */
  UpperCase = 2,
}

/** */
enum GdaSqlOperatorType
{
  /** */
  And = 0,

  /** */
  Or = 1,

  /** */
  Eq = 2,

  /** */
  Is = 3,

  /** */
  Like = 4,

  /** */
  Between = 5,

  /** */
  Gt = 6,

  /** */
  Lt = 7,

  /** */
  Geq = 8,

  /** */
  Leq = 9,

  /** */
  Diff = 10,

  /** */
  Regexp = 11,

  /** */
  RegexpCi = 12,

  /** */
  NotRegexp = 13,

  /** */
  NotRegexpCi = 14,

  /** */
  Similar = 15,

  /** */
  Isnull = 16,

  /** */
  Isnotnull = 17,

  /** */
  Not = 18,

  /** */
  In = 19,

  /** */
  Notin = 20,

  /** */
  Concat = 21,

  /** */
  Plus = 22,

  /** */
  Minus = 23,

  /** */
  Star = 24,

  /** */
  Div = 25,

  /** */
  Rem = 26,

  /** */
  Bitand = 27,

  /** */
  Bitor = 28,

  /** */
  Bitnot = 29,

  /** */
  Ilike = 30,

  /** */
  Notlike = 31,

  /** */
  Notilike = 32,

  /** */
  Glob = 33,
}

/** */
enum GdaSqlParserError
{
  /** */
  SyntaxError = 0,

  /** */
  OverflowError = 1,

  /** */
  EmptySqlError = 2,
}

/** */
enum GdaSqlParserFlavour
{
  /** */
  Standard = 0,

  /** */
  Sqlite = 1,

  /** */
  Mysql = 2,

  /** */
  Oracle = 3,

  /** */
  Postgresql = 4,
}

/** */
enum GdaSqlParserMode
{
  /** */
  Parse = 0,

  /** */
  Delimit = 1,
}

/** */
enum GdaSqlSelectJoinType
{
  /** */
  Cross = 0,

  /** */
  Natural = 1,

  /** */
  Inner = 2,

  /** */
  Left = 3,

  /** */
  Right = 4,

  /** */
  Full = 5,
}

/** */
enum GdaSqlStatementCompoundType
{
  /** */
  Union = 0,

  /** */
  UnionAll = 1,

  /** */
  Intersect = 2,

  /** */
  IntersectAll = 3,

  /** */
  Except = 4,

  /** */
  ExceptAll = 5,
}

/**
    Known types of statements
*/
enum GdaSqlStatementType
{
  /**
      a SELECT statement
  */
  Select = 0,

  /**
      an INSERT statement
  */
  Insert = 1,

  /**
      an UPDATE statement
  */
  Update = 2,

  /**
      a DELETE statement
  */
  Delete = 3,

  /**
      a compound statement: multiple SELECT statements grouped together using an operator
  */
  Compound = 4,

  /**
      start of transaction statement
  */
  Begin = 5,

  /**
      transaction abort statement
  */
  Rollback = 6,

  /**
      transaction commit statement
  */
  Commit = 7,

  /**
      new savepoint definition statement
  */
  Savepoint = 8,

  /**
      return to savepoint statement
  */
  RollbackSavepoint = 9,

  /**
      savepoint deletion statement
  */
  DeleteSavepoint = 10,

  /**
      unknown statement, only identifies variables
  */
  Unknown = 11,

  /**
      not used
  */
  None = 12,
}

/** */
enum GdaStatementError
{
  /** */
  ParseError = 0,

  /** */
  SyntaxError = 1,

  /** */
  NoCncError = 2,

  /** */
  CncClosedError = 3,

  /** */
  ExecError = 4,

  /** */
  ParamTypeError = 5,

  /** */
  ParamError = 6,
}

/**
    These flags specify how the #GdaDataModel returned when executing a #GdaStatement will be used
*/
enum GdaStatementModelUsage : uint
{
  /**
      access to the data model will be random (usually this will result in a data model completely stored in memory)
  */
  RandomAccess = 1,

  /**
      access to the data model will be done using a cursor moving forward
  */
  CursorForward = 2,

  /**
      access to the data model will be done using a cursor moving backward
  */
  CursorBackward = 4,

  /**
      access to the data model will be done using a cursor (moving both forward and backward)
  */
  Cursor = 6,

  /**
      specifies that the data model should be executed even if some parameters required to execute it are invalid (in this case the data model will have no row, and will automatically be re-run when the missing parameters are once again valid)
  */
  AllowNoparam = 8,

  /**
      specifies that the data model's contents will be fully loaded into the client side (the memory of the process using Libgda), not requiring the server any more to access the data (the default behaviour is to access the server any time data is to be read, and data is cached in memory). This flag is useful only if used in conjunction with the GDA_STATEMENT_MODEL_RANDOM_ACCESS flag (otherwise an error will be returned).
  */
  Offline = 16,
}

/**
    Specifies rendering options
*/
enum GdaStatementSqlFlag : uint
{
  /**
      rendering will replace parameters with their values
  */
  ParamsAsValues = 0,

  /**
      rendering will include newlines and indentation to make it easy to read
  */
  Pretty = 1,

  /**
      parameters will be rendered using the "/&ast; name:&lt;param_name&gt; ... &ast;/" syntax
  */
  ParamsLong = 2,

  /**
      parameters will be rendered using the "##&lt;param_name&gt;..." syntax
  */
  ParamsShort = 4,

  /**
      parameters will be rendered using the ":&lt;param_name&gt;" syntax
  */
  ParamsAsColon = 8,

  /**
      parameters will be rendered using the "$&lt;param_number&gt;" syntax where parameters are numbered starting from 1
  */
  ParamsAsDollar = 16,

  /**
      parameters will be rendered using the "?&lt;param_number&gt;" syntax where parameters are numbered starting from 1
  */
  ParamsAsQmark = 32,

  /**
      parameters will be rendered using the "?" syntax
  */
  ParamsAsUqmark = 64,

  /**
      time and timestamp with a timezone information are converted to GMT before rendering, and rendering does not show the timezone information
  */
  TimezoneToGmt = 128,
}

/**
    Defines the kind of notification which can be obtained when reading from te #GIOChannel
    returned by [gda.thread_wrapper.ThreadWrapper.getIoChannel].
*/
enum GdaThreadNotificationType
{
  /**
      the notification regards a job finished
  */
  Job = 1,

  /**
      the notification regards a signal
  */
  Signal = 2,
}

/** */
enum GdaThreadWrapperError
{
  /** */
  ThreadWrapperUnknownError = 0,
}

/** */
enum GdaTransactionIsolation
{
  /** */
  Unknown = 0,

  /** */
  ReadCommitted = 1,

  /** */
  ReadUncommitted = 2,

  /** */
  RepeatableRead = 3,

  /** */
  Serializable = 4,
}

/** */
enum GdaTransactionStatusEventType
{
  /** */
  Savepoint = 0,

  /** */
  Sql = 1,

  /** */
  SubTransaction = 2,
}

/** */
enum GdaTransactionStatusState
{
  /** */
  Ok = 0,

  /** */
  Failed = 1,
}

/** */
enum GdaTreeError
{
  /** */
  TreeUnknownError = 0,
}

/** */
enum GdaTreeManagerError
{
  /** */
  TreeManagerUnknownError = 0,
}

/** */
enum GdaTreeNodeError
{
  /** */
  TreeNodeUnknownError = 0,
}

/** */
enum GdaValueAttribute : uint
{
  /** */
  None = 0,

  /** */
  IsNull = 1,

  /** */
  CanBeNull = 2,

  /** */
  IsDefault = 4,

  /** */
  CanBeDefault = 8,

  /** */
  IsUnchanged = 16,

  /** */
  ActionsShown = 32,

  /** */
  DataNonValid = 64,

  /** */
  HasValueOrig = 128,

  /** */
  NoModif = 256,

  /** */
  Unused = 512,
}

/** */
enum GdaXaTransactionError
{
  /** */
  AlreadyRegisteredError = 0,

  /** */
  DtpNotSupportedError = 1,

  /** */
  ConnectionBranchLengthError = 2,
}

/** */
struct GdaAttributesManager;

/** */
struct GdaBatch
{
  /** */
  GObject object;

  /** */
  GdaBatchPrivate* priv;
}

/** */
struct GdaBatchClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaBatch* batch, GdaStatement* changedStmt) changed;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaBatchPrivate;

/** */
struct GdaBinary
{
  /**
      the actual data as an array
  */
  ubyte* data;

  /**
      length of @data
  */
  glong binaryLength;
}

/**
    Represents some binary data, accessed through a #GdaBlobOp object.
    @op is generally set up by database providers when giving access to an existing BLOB in
    a database, but can be modified if needed using [gda.blob.Blob.setOp].
*/
struct GdaBlob
{
  /**
      data buffer, as a #GdaBinary
  */
  GdaBinary data;

  /**
      a pointer to a #GdaBlopOp, or null
  */
  GdaBlobOp* op;
}

/** */
struct GdaBlobOp
{
  /** */
  GObject object;

  /** */
  void* GdaReserved1;
}

/** */
struct GdaBlobOpClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) glong function(GdaBlobOp* op) getLength;

  /** */
  extern(C) glong function(GdaBlobOp* op, GdaBlob* blob, glong offset, glong size) read;

  /** */
  extern(C) glong function(GdaBlobOp* op, GdaBlob* blob, glong offset) write;

  /** */
  extern(C) gboolean function(GdaBlobOp* op, GdaBlob* blob) writeAll;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaColumn
{
  /** */
  GObject object;

  /** */
  GdaColumnPrivate* priv;
}

/** */
struct GdaColumnClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaColumn* column, const(char)* oldName) nameChanged;

  /** */
  extern(C) void function(GdaColumn* column, GType oldType, GType newType) gTypeChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaColumnPrivate;

/** */
struct GdaConfig
{
  /** */
  GObject object;

  /** */
  GdaConfigPrivate* priv;
}

/** */
struct GdaConfigClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) void function(GdaConfig* conf, GdaDsnInfo* newDsn) dsnAdded;

  /** */
  extern(C) void function(GdaConfig* conf, GdaDsnInfo* oldDsn) dsnToBeRemoved;

  /** */
  extern(C) void function(GdaConfig* conf, GdaDsnInfo* oldDsn) dsnRemoved;

  /** */
  extern(C) void function(GdaConfig* conf, GdaDsnInfo* dsn) dsnChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaConfigPrivate;

/** */
struct GdaConnection
{
  /** */
  GObject object;

  /** */
  GdaConnectionPrivate* priv;
}

/** */
struct GdaConnectionClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) void function(GdaConnection* cnc, GdaConnectionEvent* error) error;

  /** */
  extern(C) void function(GdaConnection* obj) connOpened;

  /** */
  extern(C) void function(GdaConnection* obj) connToClose;

  /** */
  extern(C) void function(GdaConnection* obj) connClosed;

  /** */
  extern(C) void function(GdaConnection* obj) dsnChanged;

  /** */
  extern(C) void function(GdaConnection* obj) transactionStatusChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaConnectionEvent
{
  /** */
  GObject object;

  /** */
  GdaConnectionEventPrivate* priv;
}

/** */
struct GdaConnectionEventClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaConnectionEventPrivate;

/** */
struct GdaConnectionPrivate;

/** */
struct GdaDataAccessWrapper
{
  /** */
  GObject object;

  /** */
  GdaDataAccessWrapperPrivate* priv;
}

/** */
struct GdaDataAccessWrapperClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataAccessWrapperPrivate;

/** */
struct GdaDataComparator
{
  /** */
  GObject object;

  /** */
  GdaDataComparatorPrivate* priv;
}

/** */
struct GdaDataComparatorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GdaDataComparator* comp, GdaDiff* diff) diffComputed;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataComparatorPrivate;

/** */
struct GdaDataHandler;

/** */
struct GdaDataHandlerIface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) char* function(GdaDataHandler* dh, const(GValue)* value) getSqlFromValue;

  /** */
  extern(C) char* function(GdaDataHandler* dh, const(GValue)* value) getStrFromValue;

  /** */
  extern(C) GValue* function(GdaDataHandler* dh, const(char)* sql, GType type) getValueFromSql;

  /** */
  extern(C) GValue* function(GdaDataHandler* dh, const(char)* str, GType type) getValueFromStr;

  /** */
  extern(C) GValue* function(GdaDataHandler* dh, GType type) getSaneInitValue;

  /** */
  extern(C) gboolean function(GdaDataHandler* dh, GType type) acceptsGType;

  /** */
  extern(C) const(char)* function(GdaDataHandler* dh) getDescr;
}

/** */
struct GdaDataModel;

/** */
struct GdaDataModelArray
{
  /** */
  GObject object;

  /** */
  GdaDataModelArrayPrivate* priv;
}

/** */
struct GdaDataModelArrayClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataModelArrayPrivate;

/** */
struct GdaDataModelDir
{
  /** */
  GObject object;

  /** */
  GdaDataModelDirPrivate* priv;
}

/** */
struct GdaDataModelDirClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataModelDirPrivate;

/** */
struct GdaDataModelIface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) int function(GdaDataModel* model) iGetNRows;

  /** */
  extern(C) int function(GdaDataModel* model) iGetNColumns;

  /** */
  extern(C) GdaColumn* function(GdaDataModel* model, int col) iDescribeColumn;

  /** */
  extern(C) GdaDataModelAccessFlags function(GdaDataModel* model) iGetAccessFlags;

  /** */
  extern(C) const(GValue)* function(GdaDataModel* model, int col, int row, GError** _err) iGetValueAt;

  /** */
  extern(C) GdaValueAttribute function(GdaDataModel* model, int col, int row) iGetAttributesAt;

  /** */
  extern(C) GdaDataModelIter* function(GdaDataModel* model) iCreateIter;

  /** */
  extern(C) gboolean function(GdaDataModel* model, GdaDataModelIter* iter, int row) iIterAtRow;

  /** */
  extern(C) gboolean function(GdaDataModel* model, GdaDataModelIter* iter) iIterNext;

  /** */
  extern(C) gboolean function(GdaDataModel* model, GdaDataModelIter* iter) iIterPrev;

  /** */
  extern(C) gboolean function(GdaDataModel* model, int col, int row, const(GValue)* value, GError** _err) iSetValueAt;

  /** */
  extern(C) gboolean function(GdaDataModel* model, GdaDataModelIter* iter, int col, const(GValue)* value, GError** _err) iIterSetValue;

  /** */
  extern(C) gboolean function(GdaDataModel* model, int row, GList* values, GError** _err) iSetValues;

  /** */
  extern(C) int function(GdaDataModel* model, const(GList)* values, GError** _err) iAppendValues;

  /** */
  extern(C) int function(GdaDataModel* model, GError** _err) iAppendRow;

  /** */
  extern(C) gboolean function(GdaDataModel* model, int row, GError** _err) iRemoveRow;

  /** */
  extern(C) int function(GdaDataModel* model, GSList* values, int* colsIndex) iFindRow;

  /** */
  extern(C) void function(GdaDataModel* model, gboolean doNotifyChanges) iSetNotify;

  /** */
  extern(C) gboolean function(GdaDataModel* model) iGetNotify;

  /** */
  extern(C) void function(GdaDataModel* model, GdaDataModelHint hint, const(GValue)* hintValue) iSendHint;

  /** */
  extern(C) void function(GdaDataModel* model, int row) rowInserted;

  /** */
  extern(C) void function(GdaDataModel* model, int row) rowUpdated;

  /** */
  extern(C) void function(GdaDataModel* model, int row) rowRemoved;

  /** */
  extern(C) void function(GdaDataModel* model) changed;

  /** */
  extern(C) void function(GdaDataModel* model) reset;

  /** */
  extern(C) void function(GdaDataModel* model) accessChanged;

  /** */
  extern(C) GError** function(GdaDataModel* model) iGetExceptions;
}

/** */
struct GdaDataModelImport
{
  /** */
  GObject object;

  /** */
  GdaDataModelImportPrivate* priv;
}

/** */
struct GdaDataModelImportClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataModelImportPrivate;

/** */
struct GdaDataModelIter
{
  /** */
  GdaSet object;

  /** */
  GdaDataModelIterPrivate* priv;
}

/** */
struct GdaDataModelIterClass
{
  /** */
  GdaSetClass parentClass;

  /** */
  extern(C) void function(GdaDataModelIter* iter, int row) rowChanged;

  /** */
  extern(C) void function(GdaDataModelIter* iter) endOfData;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataModelIterPrivate;

/** */
struct GdaDataPivot
{
  /** */
  GObject object;

  /** */
  GdaDataPivotPrivate* priv;
}

/** */
struct GdaDataPivotClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataPivotPrivate;

/** */
struct GdaDataProxy
{
  /** */
  GObject object;

  /** */
  GdaDataProxyPrivate* priv;
}

/** */
struct GdaDataProxyClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaDataProxy* proxy, int row, gboolean toBeDeleted) rowDeleteChanged;

  /** */
  extern(C) void function(GdaDataProxy* proxy, int sampleSize) sampleSizeChanged;

  /** */
  extern(C) void function(GdaDataProxy* proxy, int sampleStart, int sampleEnd) sampleChanged;

  /** */
  extern(C) GError* function(GdaDataProxy* proxy, int row, int proxiedRow) validateRowChanges;

  /** */
  extern(C) void function(GdaDataProxy* proxy, int row, int proxiedRow) rowChangesApplied;

  /** */
  extern(C) void function(GdaDataProxy* proxy) filterChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataProxyPrivate;

/** */
struct GdaDataSelect
{
  /** */
  GObject object;

  /** */
  GdaDataSelectPrivate* priv;

  /** */
  GdaPStmt* prepStmt;

  /** */
  int nbStoredRows;

  /** */
  int advertizedNrows;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaDataSelectClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) int function(GdaDataSelect* model) fetchNbRows;

  /** */
  extern(C) gboolean function(GdaDataSelect* model, GdaRow** prow, int rownum, GError** _err) fetchRandom;

  /** */
  extern(C) gboolean function(GdaDataSelect* model, GError** _err) storeAll;

  /** */
  extern(C) gboolean function(GdaDataSelect* model, GdaRow** prow, int rownum, GError** _err) fetchNext;

  /** */
  extern(C) gboolean function(GdaDataSelect* model, GdaRow** prow, int rownum, GError** _err) fetchPrev;

  /** */
  extern(C) gboolean function(GdaDataSelect* model, GdaRow** prow, int rownum, GError** _err) fetchAt;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaDataSelectPrivate;

/** */
struct GdaDiff
{
  /** */
  GdaDiffType type;

  /** */
  int oldRow;

  /** */
  int newRow;

  /** */
  GHashTable* values;
}

/**
    This structure defines the properties of a named data source (DSN).
*/
struct GdaDsnInfo
{
  /**
      the (unique) name of the DSN (plain text, not RFC 1738 encoded)
  */
  char* name;

  /**
      the ID of the database provider to be used (plain text, not RFC 1738 encoded)
  */
  char* provider;

  /**
      a descriptive string (plain text, not RFC 1738 encoded), can be null.
  */
  char* description;

  /**
      the connection string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded
  */
  char* cncString;

  /**
      the authentication string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded. Can be null.
  */
  char* authString;

  /**
      true if the DSN is a system wide defined data source
  */
  gboolean isSystem;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaGeometricPoint
{
  /** */
  double x;

  /** */
  double y;
}

/** */
struct GdaHandlerBin
{
  /** */
  GObject object;

  /** */
  GdaHandlerBinPriv* priv;
}

/** */
struct GdaHandlerBinClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerBinPriv;

/** */
struct GdaHandlerBoolean
{
  /** */
  GObject object;

  /** */
  GdaHandlerBooleanPriv* priv;
}

/** */
struct GdaHandlerBooleanClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerBooleanPriv;

/** */
struct GdaHandlerNumerical
{
  /** */
  GObject object;

  /** */
  GdaHandlerNumericalPriv* priv;
}

/** */
struct GdaHandlerNumericalClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerNumericalPriv;

/** */
struct GdaHandlerString
{
  /** */
  GObject object;

  /** */
  GdaHandlerStringPriv* priv;
}

/** */
struct GdaHandlerStringClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerStringPriv;

/** */
struct GdaHandlerTime
{
  /** */
  GObject object;

  /** */
  GdaHandlerTimePriv* priv;
}

/** */
struct GdaHandlerTimeClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerTimePriv;

/** */
struct GdaHandlerType
{
  /** */
  GObject object;

  /** */
  GdaHandlerTypePriv* priv;
}

/** */
struct GdaHandlerTypeClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;
}

/** */
struct GdaHandlerTypePriv;

/** */
struct GdaHolder
{
  /** */
  GObject object;

  /** */
  GdaHolderPrivate* priv;
}

/** */
struct GdaHolderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaHolder* holder) changed;

  /** */
  extern(C) void function(GdaHolder* holder) sourceChanged;

  /** */
  extern(C) GError* function(GdaHolder* holder, const(GValue)* newValue) validateChange;

  /** */
  extern(C) void function(GdaHolder* holder, const(char)* attName, const(GValue)* attValue) attChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaHolderPrivate;

/** */
struct GdaLockable;

/** */
struct GdaLockableIface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) void function(GdaLockable* lock) iLock;

  /** */
  extern(C) gboolean function(GdaLockable* lock) iTrylock;

  /** */
  extern(C) void function(GdaLockable* lock) iUnlock;
}

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
struct GdaMetaContext
{
  /**
      the name of the table <emphasis>in the GdaMetaStore's internal database</emphasis>
  */
  char* tableName;

  /**
      the size of the @column_names and @column_values arrays
  */
  int size;

  /**
      an array of column names (columns of the @table_name table)
  */
  char** columnNames;

  /**
      an array of values, one for each column named in @column_names
  */
  GValue** columnValues;

  /**
      A #GHashTable storing columns' name as key and #GValue as column's
      value.
  */
  GHashTable* columns;
}

/**
    Struture to hold information about each database object (tables, views, ...),
    its contents must not be modified.
    
    Note: @obj_catalog, @obj_schema, @obj_name, @obj_short_name and @obj_full_name respect the
    <link linkend="information_schema:sql_identifiers">SQL identifiers</link> convention used in
    #GdaMetaStore objects. Before using these SQL identifiers, you should check the
    [gda.global.sqlIdentifierQuote] to know if is it is necessary to surround by double quotes
    before using in an SQL statement.
*/
struct GdaMetaDbObject
{
  /** */
  /** */
  union ExtraType
  {
    /** */
    GdaMetaTable metaTable;

    /** */
    GdaMetaView metaView;
  }

  ExtraType extra;

  /**
      the type of object (table, view)
  */
  GdaMetaDbObjectType objType;

  /**
      set to true if the information in this #GdaMetaDbObject may be outdated because the #GdaMetaStore has been updated
  */
  gboolean outdated;

  /**
      the catalog the object is in
  */
  char* objCatalog;

  /**
      the schema the object is in
  */
  char* objSchema;

  /**
      the object's name
  */
  char* objName;

  /**
      the shortest way to name the object
  */
  char* objShortName;

  /**
      the full name of the object (in the &lt;schema&gt;.&lt;nameagt; notation
  */
  char* objFullName;

  /**
      object's owner
  */
  char* objOwner;

  /**
      list of #GdaMetaDbObject pointers on which this object depends (through foreign keys
                    or tables used for views)
  */
  GSList* dependList;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaMetaStore
{
  /** */
  GObject object;

  /** */
  GdaMetaStorePrivate* priv;
}

/** */
struct GdaMetaStoreChange
{
  /** */
  GdaMetaStoreChangeType cType;

  /** */
  char* tableName;

  /** */
  GHashTable* keys;
}

/** */
struct GdaMetaStoreClass
{
  /** */
  GObjectClass parentClass;

  /** */
  GdaMetaStoreClassPrivate* cpriv;

  /** */
  extern(C) void function(GdaMetaStore* store) metaReset;

  /** */
  extern(C) GError* function(GdaMetaStore* store, GdaMetaContext* suggest) suggestUpdate;

  /** */
  extern(C) void function(GdaMetaStore* store, GSList* changes) metaChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaMetaStoreClassPrivate;

/** */
struct GdaMetaStorePrivate;

/** */
struct GdaMetaStruct
{
  /** */
  GObject object;

  /** */
  GdaMetaStructPrivate* priv;
}

/** */
struct GdaMetaStructClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaMetaStructPrivate;

/**
    This structure specifies a #GdaMetaDbObject to represent a table's specific attributes,
    its contents must not be modified.
    
    Note that in some cases, the columns cannot be determined for views, and in this case the
    @columns will be null (this can be the case for example with SQLite where a view
    uses a function which is not natively provided by SQLite.
*/
struct GdaMetaTable
{
  /**
      list of #GdaMetaTableColumn structures, one for each column in the table
  */
  GSList* columns;

  /**
      index of the columns part of the primary key for the table (WARNING: columns numbering
                      here start at 0)
  */
  int* pkColsArray;

  /**
      size of the @pk_cols_array array
  */
  int pkColsNb;

  /**
      list of #GdaMetaTableForeignKey where the referenced table is this table
  */
  GSList* reverseFkList;

  /**
      list of #GdaMetaTableForeignKey for this table
  */
  GSList* fkList;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/**
    This structure represents a table of view's column, its contents must not be modified.
*/
struct GdaMetaTableColumn
{
  /**
      the column's name
  */
  char* columnName;

  /**
      the column's DBMS's type
  */
  char* columnType;

  /**
      the detected column's #GType
  */
  GType gtype;

  /**
      tells if the column is part of a primary key
  */
  gboolean pkey;

  /**
      tells if the column can be null
  */
  gboolean nullok;

  /**
      the column's default value, represented as a valid SQL value (surrounded by simple quotes for strings, ...), or null if column has no default value
  */
  char* defaultValue;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/**
    This structure represents a foreign key constraint, its contents must not be modified.
*/
struct GdaMetaTableForeignKey
{
  /**
      the #GdaMetaDbObject for which this structure represents a foreign key
  */
  GdaMetaDbObject* metaTable;

  /**
      the #GdaMetaDbObject which is referenced by the foreign key
  */
  GdaMetaDbObject* dependOn;

  /**
      the size of the @fk_cols_array, @fk_names_array, @ref_pk_cols_array and @ref_pk_names_array arrays
  */
  int colsNb;

  /**
      the columns' indexes in @meta_table which participate in the constraint (WARNING: columns numbering
                      here start at 1)
  */
  int* fkColsArray;

  /**
      the columns' names in @meta_table which participate in the constraint
  */
  char** fkNamesArray;

  /**
      the columns' indexes in @depend_on which participate in the constraint (WARNING: columns numbering
                      here start at 1)
  */
  int* refPkColsArray;

  /**
      the columns' names in @depend_on which participate in the constraint
  */
  char** refPkNamesArray;

  /** */
  GdaMetaForeignKeyPolicy onUpdatePolicy;

  /** */
  GdaMetaForeignKeyPolicy onDeletePolicy;

  /** */
  gboolean declared;

  /** */
  char* fkName;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/**
    This structure specifies a #GdaMetaDbObject to represent a view's specific attributes,
    its contents must not be modified.
*/
struct GdaMetaView
{
  /**
      a view is also a table as it has columns
  */
  GdaMetaTable table;

  /**
      views' definition
  */
  char* viewDef;

  /**
      tells if the view's contents can be updated
  */
  gboolean isUpdatable;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/**
    Holds numbers represented as strings.
    
    This struct must be considered as opaque. Any access to its members must use its
    accessors added since version 5.0.2.
*/
struct GdaNumeric
{
  /**
      a string representing a number
  */
  char* number;

  /**
      precision to use when @number is converted (not implemented jet)
  */
  glong precision;

  /**
      not implemented jet
  */
  glong width;

  /** */
  void* reserved;
}

/** */
struct GdaPStmt
{
  /** */
  GObject object;

  /** */
  GdaPStmtPrivate* priv;

  /**
      actual SQL code used for this prepared statement, mem freed by GdaPStmt
  */
  char* sql;

  /**
      list of parameters' IDs (as gchar *), mem freed by GdaPStmt
  */
  GSList* paramIds;

  /**
      number of types in array
  */
  int ncols;

  /**
      array of ncols types
  */
  GType* types;

  /**
      list of #GdaColumn objects which data models created from this prep. statement can copy
  */
  GSList* tmplColumns;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaPStmtClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaPStmtPrivate;

/**
    This structure holds the information associated to a database provider as discovered by Libgda.
*/
struct GdaProviderInfo
{
  /**
      the unique identifier of the database provider
  */
  char* id;

  /**
      the complete path to the shared library implementing the database provider
  */
  char* location;

  /**
      provider's description
  */
  char* description;

  /**
      a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
  */
  GdaSet* dsnParams;

  /**
      a #GdaSet containing all the authentication parameters
  */
  GdaSet* authParams;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaQuarkList;

/** */
struct GdaRepetitiveStatement
{
  /** */
  GObject parentInstance;
}

/** */
struct GdaRepetitiveStatementClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GdaRow
{
  /** */
  GObject object;

  /** */
  GdaRowPrivate* priv;
}

/** */
struct GdaRowClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaRowPrivate;

/** */
struct GdaServerOperation
{
  /** */
  GObject object;

  /** */
  GdaServerOperationPrivate* priv;
}

/** */
struct GdaServerOperationClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaServerOperation* op, const(char)* seqPath, int itemIndex) seqItemAdded;

  /** */
  extern(C) void function(GdaServerOperation* op, const(char)* seqPath, int itemIndex) seqItemRemove;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaServerOperationNode
{
  /** */
  GdaServerOperationNodeType type;

  /** */
  GdaServerOperationNodeStatus status;

  /** */
  GdaSet* plist;

  /** */
  GdaDataModel* model;

  /** */
  GdaColumn* column;

  /** */
  GdaHolder* param;

  /** */
  void* priv;
}

/** */
struct GdaServerOperationPrivate;

/** */
struct GdaServerProvider
{
  /** */
  GObject object;

  /** */
  GdaServerProviderPrivate* priv;
}

/** */
struct GdaServerProviderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  GThread* limitingThread;

  /** */
  extern(C) const(char)* function(GdaServerProvider* provider) getName;

  /** */
  extern(C) const(char)* function(GdaServerProvider* provider) getVersion;

  /** */
  extern(C) const(char)* function(GdaServerProvider* provider, GdaConnection* cnc) getServerVersion;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaConnectionFeature feature) supportsFeature;

  /** */
  extern(C) GdaDataHandler* function(GdaServerProvider* provider, GdaConnection* cnc, GType gType, const(char)* dbmsType) getDataHandler;

  /** */
  extern(C) const(char)* function(GdaServerProvider* provider, GdaConnection* cnc, GType gType) getDefDbmsType;

  /** */
  extern(C) char* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* str) escapeString;

  /** */
  extern(C) char* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* str) unescapeString;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaQuarkList* params, GdaQuarkList* auth, uint* taskId, GdaServerProviderAsyncCallback asyncCb, void* cbData) openConnection;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc) closeConnection;

  /** */
  extern(C) const(char)* function(GdaServerProvider* provider, GdaConnection* cnc) getDatabase;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperationType type, GdaSet* options) supportsOperation;

  /** */
  extern(C) GdaServerOperation* function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperationType type, GdaSet* options, GError** _err) createOperation;

  /** */
  extern(C) char* function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperation* op, GError** _err) renderOperation;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperation* op, uint* taskId, GdaServerProviderAsyncCallback asyncCb, void* cbData, GError** _err) performOperation;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GdaTransactionIsolation level, GError** _err) beginTransaction;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GError** _err) commitTransaction;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GError** _err) rollbackTransaction;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GError** _err) addSavepoint;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GError** _err) rollbackSavepoint;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* name, GError** _err) deleteSavepoint;

  /** */
  extern(C) GdaSqlParser* function(GdaServerProvider* provider, GdaConnection* cnc) createParser;

  /** */
  extern(C) char* function(GdaServerProvider* provider, GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementSqlFlag flags, GSList** paramsUsed, GError** _err) statementToSql;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaStatement* stmt, GError** _err) statementPrepare;

  /** */
  extern(C) GObject* function(GdaServerProvider* provider, GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementModelUsage modelUsage, GType* colTypes, GdaSet** lastInsertedRow, uint* taskId, GdaServerProviderExecCallback execCb, void* cbData, GError** _err) statementExecute;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GError** _err) isBusy;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, uint taskId, GError** _err) cancel;

  /** */
  extern(C) GdaConnection* function(GdaServerProvider* provider) createConnection;

  /** */
  GdaServerProviderMeta metaFuncs;

  /** */
  GdaServerProviderXa* xaFuncs;

  /** */
  extern(C) char* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* id, gboolean forMetaStore, gboolean forceQuotes) identifierQuote;

  /** */
  extern(C) gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GError** _err) handleAsync;

  /** */
  extern(C) GdaSqlStatement* function(GdaServerProvider* provider, GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GError** _err) statementRewrite;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;

  /** */
  extern(C) void function() GdaReserved5;

  /** */
  extern(C) void function() GdaReserved6;
}

/** */
struct GdaServerProviderHandlerInfo
{
  /** */
  GdaConnection* cnc;

  /** */
  GType gType;

  /** */
  char* dbmsType;
}

/** */
struct GdaServerProviderInfo;

/**
    These methods must be implemented by providers to update a connection's associated metadata (in a
    #GdaMetaStore object), see the <link linkend="prov-metadata">Virtual methods for providers/Methods - metadata</link>
    for more information.
*/
struct GdaServerProviderMeta
{
  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Info;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Btypes;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Udt;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* udtCatalog, const(GValue)* udtSchema) udt;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) UdtCols;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* udtCatalog, const(GValue)* udtSchema, const(GValue)* udtName) udtCols;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Enums;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* udtCatalog, const(GValue)* udtSchema, const(GValue)* udtName) enums;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Domains;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* domainCatalog, const(GValue)* domainSchema) domains;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) ConstraintsDom;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* domainCatalog, const(GValue)* domainSchema, const(GValue)* domainName) constraintsDom;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) ElTypes;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* specificName) elTypes;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Collations;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* collationCatalog, const(GValue)* collationSchema, const(GValue)* collationNameN) collations;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) CharacterSets;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* chsetCatalog, const(GValue)* chsetSchema, const(GValue)* chsetNameN) characterSets;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Schemata;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* catalogName, const(GValue)* schemaNameN) schemata;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) TablesViews;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableNameN) tablesViews;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Columns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName) columns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) ViewCols;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* viewCatalog, const(GValue)* viewSchema, const(GValue)* viewName) viewCols;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) ConstraintsTab;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* constraintNameN) constraintsTab;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) ConstraintsRef;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* constraintName) constraintsRef;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) KeyColumns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* constraintName) keyColumns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) CheckColumns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* constraintName) checkColumns;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Triggers;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName) triggers;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) Routines;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* routineCatalog, const(GValue)* routineSchema, const(GValue)* routineNameN) routines;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) RoutineCol;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* routCatalog, const(GValue)* routSchema, const(GValue)* routName) routineCol;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) RoutinePar;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* routCatalog, const(GValue)* routSchema, const(GValue)* routName) routinePar;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) IndexesTab;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* indexNameN) indexesTab;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** _err) IndexCols;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, GdaMetaStore* meta, GdaMetaContext* ctx, GError** error, const(GValue)* tableCatalog, const(GValue)* tableSchema, const(GValue)* tableName, const(GValue)* indexName) indexCols;

  /** */
  extern(C) void function() GdaReserved5;

  /** */
  extern(C) void function() GdaReserved6;

  /** */
  extern(C) void function() GdaReserved7;

  /** */
  extern(C) void function() GdaReserved8;

  /** */
  extern(C) void function() GdaReserved9;

  /** */
  extern(C) void function() GdaReserved10;

  /** */
  extern(C) void function() GdaReserved11;

  /** */
  extern(C) void function() GdaReserved12;

  /** */
  extern(C) void function() GdaReserved13;

  /** */
  extern(C) void function() GdaReserved14;

  /** */
  extern(C) void function() GdaReserved15;

  /** */
  extern(C) void function() GdaReserved16;
}

/** */
struct GdaServerProviderPrivate
{
  /** */
  GHashTable* dataHandlers;

  /** */
  GdaSqlParser* parser;
}

/** */
struct GdaServerProviderXa
{
  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, const(GdaXaTransactionId)* trx, GError** _err) xaStart;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, const(GdaXaTransactionId)* trx, GError** _err) xaEnd;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, const(GdaXaTransactionId)* trx, GError** _err) xaPrepare;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, const(GdaXaTransactionId)* trx, GError** _err) xaCommit;

  /** */
  extern(C) gboolean function(GdaServerProvider* prov, GdaConnection* cnc, const(GdaXaTransactionId)* trx, GError** _err) xaRollback;

  /** */
  extern(C) GList* function(GdaServerProvider* prov, GdaConnection* cnc, GError** _err) xaRecover;
}

/** */
struct GdaSet
{
  /** */
  GObject object;

  /** */
  GdaSetPrivate* priv;

  /**
      list of GdaHolder objects
  */
  GSList* holders;

  /**
      list of GdaSetNode
  */
  GSList* nodesList;

  /**
      list of GdaSetSource
  */
  GSList* sourcesList;

  /**
      list of GdaSetGroup
  */
  GSList* groupsList;
}

/** */
struct GdaSetClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GError* function(GdaSet* set, GdaHolder* holder, const(GValue)* newValue) validateHolderChange;

  /** */
  extern(C) GError* function(GdaSet* set) validateSet;

  /** */
  extern(C) void function(GdaSet* set, GdaHolder* holder) holderChanged;

  /** */
  extern(C) void function(GdaSet* set, GdaHolder* holder, const(char)* attrName, const(GValue)* attrValue) holderAttrChanged;

  /** */
  extern(C) void function(GdaSet* set) publicDataChanged;

  /** */
  extern(C) void function(GdaSet* set, GdaHolder* holder) holderTypeSet;

  /** */
  extern(C) void function(GdaSet* set, GdaSetSource* source) sourceModelChanged;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_group_free on a struct that was created manually.
*/
struct GdaSetGroup
{
  /**
      list of GdaSetNode, at least one entry
  */
  GSList* nodes;

  /**
      if NULL, then @nodes contains exactly one entry
  */
  GdaSetSource* nodesSource;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_node_free on a struct that was created manually.
*/
struct GdaSetNode
{
  /**
      a #GdaHolder. It can't be NULL
  */
  GdaHolder* holder;

  /**
      a #GdaDataModel. It could be NULL
  */
  GdaDataModel* sourceModel;

  /**
      a #gint with the number of column in @source_model
  */
  int sourceColumn;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSetPrivate;

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_source_free on a struct that was created manually.
*/
struct GdaSetSource
{
  /**
      Can't be NULL
  */
  GdaDataModel* dataModel;

  /**
      list of #GdaSetNode for which source_model == @data_model
  */
  GSList* nodes;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaShort;

/**
    Base structure of which all structures (except #GdaSqlStatement) "inherit". It identifies, for each structure,
    its type and its parent in the structure hierarchy.
*/
struct GdaSqlAnyPart
{
  /**
      type of structure, as a #GdaSqlAnyPartType enum.
  */
  GdaSqlAnyPartType type;

  /**
      pointer to the parent #GdaSqlAnyPart structure
  */
  GdaSqlAnyPart* parent;
}

/** */
struct GdaSqlBuilder
{
  /** */
  GObject object;

  /** */
  GdaSqlBuilderPrivate* priv;
}

/** */
struct GdaSqlBuilderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaSqlBuilderPrivate;

/**
    This structure represents a CASE WHEN... construct
*/
struct GdaSqlCase
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      expression to test
  */
  GdaSqlExpr* baseExpr;

  /**
      list of #GdaSqlExpr, one for each WHEN clause
  */
  GSList* whenExprList;

  /**
      list of #GdaSqlExpr, one for each THEN clause
  */
  GSList* thenExprList;

  /**
      default expression for the CASE
  */
  GdaSqlExpr* elseExpr;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure contains any expression, either as a value (the @value part is set),
    a variable (the @param_spec is set), or as other types of expressions.
    
    Note 1 about the @value field: if the expression represents a string value in the SQL statement,
    the string itself must be represented as it would be in the actual SQL, ie. it should be
    escaped (accordingly to the escaping rules of the database which will use the SQL). For
    example a string representing the <userinput>'joe'</userinput> value should be
    <userinput>"'joe'"</userinput> and not <userinput>"joe"</userinput>.
    
    Note 2 about the @value field: if the expression represents an SQL identifier (such as a table
    or field name), then the @value_is_ident should be set to true, and @value should be a string
    which may contain double quotes around SQL identifiers which also are reserved keywords or which
    are case sensitive.
*/
struct GdaSqlExpr
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      a #GValue, or null. Please see specific note about this field.
  */
  GValue* value;

  /**
      a #GdaSqlParamSpec, or null if this is not a variable
  */
  GdaSqlParamSpec* paramSpec;

  /**
      not null if expression is a function or aggregate
  */
  GdaSqlFunction* func;

  /**
      not null if expression is a condition or an operation
  */
  GdaSqlOperation* cond;

  /**
      not null if expression is a sub select statement (#GdaSqlStatementSelect or #GdaSqlStatementCompound)
  */
  GdaSqlAnyPart* select;

  /**
      not null if expression is a CASE WHEN ... expression
  */
  GdaSqlCase* caseS;

  /**
      not null if expression must be cast to another data type
  */
  char* castAs;

  /**
      Please see specific note about the @value field
  */
  gboolean valueIsIdent;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/**
    any:
    This structure represents the name of a table's field.
*/
struct GdaSqlField
{
  /** */
  GdaSqlAnyPart any;

  /** */
  char* fieldName;

  /** */
  GdaMetaTableColumn* validityMetaTableColumn;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents a function or an aggregate with zero or more arguments.
*/
struct GdaSqlFunction
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      name of the function , in the form [[catalog.]schema.]function_name
  */
  char* functionName;

  /**
      list of #GdaSqlExpr expressions, one for each argument
  */
  GSList* argsList;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents an operation between one or more operands.
*/
struct GdaSqlOperation
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /** */
  GdaSqlOperatorType operatorType;

  /**
      list of #GdaSqlExpr operands
  */
  GSList* operands;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSqlParamSpec
{
  /** */
  char* name;

  /** */
  char* descr;

  /** */
  gboolean isParam;

  /** */
  gboolean nullok;

  /** */
  GType gType;

  /** */
  void* validityMetaDict;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSqlParser
{
  /** */
  GObject object;

  /** */
  GdaSqlParserPrivate* priv;
}

/** */
struct GdaSqlParserClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void* function(void** f) delimAlloc;

  /** */
  extern(C) void function(void* d, void** f) delimFree;

  /** */
  extern(C) void function(void* d, char* s) delimTrace;

  /** */
  extern(C) void function(void* d, int i, GValue* v, GdaSqlParserIface* iface) delimParse;

  /** */
  int* delimTokensTrans;

  /** */
  extern(C) void* function(void** f) parserAlloc;

  /** */
  extern(C) void function(void* p, void** f) parserFree;

  /** */
  extern(C) void function(void* p, char* s) parserTrace;

  /** */
  extern(C) void function(void* p, int i, GValue* v, GdaSqlParserIface* iface) parserParse;

  /** */
  int* parserTokensTrans;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaSqlParserIface
{
  /** */
  GdaSqlParser* parser;

  /** */
  GdaSqlStatement* parsedStatement;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSqlParserPrivate;

/**
    Specifies the context in which a #GdaSqlStatement is being converted to SQL.
*/
struct GdaSqlRenderingContext
{
  /**
      Global rendering options
  */
  GdaStatementSqlFlag flags;

  /**
      Parameters to be used while doing the rendering
  */
  GdaSet* params;

  /**
      When rendering is complete, contains the ordered list of parameters which have been used while doing the rendering
  */
  GSList* paramsUsed;

  /**
      Pointer to the server provider to be used
  */
  GdaServerProvider* provider;

  /**
      Pointer to the connection to be used
  */
  GdaConnection* cnc;

  /**
      function to render a #GValue
  */
  GdaSqlRenderingValue renderValue;

  /**
      function to render a #GdaSqlParamSpec
  */
  GdaSqlRenderingPSpecFunc renderParamSpec;

  /**
      function to render a #GdaSqlExpr
  */
  GdaSqlRenderingExpr renderExpr;

  /**
      function to render a #GdaSqlStatementUnknown
  */
  GdaSqlRenderingFunc renderUnknown;

  /**
      function to render a BEGIN #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderBegin;

  /**
      function to render a ROLLBACK #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderRollback;

  /**
      function to render a COMMIT #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderCommit;

  /**
      function to render a ADD SAVEPOINT #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderSavepoint;

  /**
      function to render a ROLBACK SAVEPOINT #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderRollbackSavepoint;

  /**
      function to render a DELETE SAVEPOINT #GdaSqlStatementTransaction
  */
  GdaSqlRenderingFunc renderDeleteSavepoint;

  /**
      function to render a #GdaSqlStatementSelect
  */
  GdaSqlRenderingFunc renderSelect;

  /**
      function to render a #GdaSqlStatementInsert
  */
  GdaSqlRenderingFunc renderInsert;

  /**
      function to render a #GdaSqlStatementDelete
  */
  GdaSqlRenderingFunc renderDelete;

  /**
      function to render a #GdaSqlStatementUpdate
  */
  GdaSqlRenderingFunc renderUpdate;

  /**
      function to render a #GdaSqlStatementCompound
  */
  GdaSqlRenderingFunc renderCompound;

  /**
      function to render a #GdaSqlField
  */
  GdaSqlRenderingFunc renderField;

  /**
      function to render a #GdaSqlTable
  */
  GdaSqlRenderingFunc renderTable;

  /**
      function to render a #GdaSqlFunction
  */
  GdaSqlRenderingFunc renderFunction;

  /**
      function to render a #GdaSqlOperation
  */
  GdaSqlRenderingFunc renderOperation;

  /**
      function to render a #GdaSqlCase
  */
  GdaSqlRenderingFunc renderCase;

  /**
      function to render a #GdaSqlSelectField
  */
  GdaSqlRenderingFunc renderSelectField;

  /**
      function to render a #GdaSqlSelectTarget
  */
  GdaSqlRenderingFunc renderSelectTarget;

  /**
      function to render a #GdaSqlSelectJoin
  */
  GdaSqlRenderingFunc renderSelectJoin;

  /**
      function to render a #GdaSqlSelectFrom
  */
  GdaSqlRenderingFunc renderSelectFrom;

  /**
      function to render a #GdaSqlSelectOrder
  */
  GdaSqlRenderingFunc renderSelectOrder;

  /**
      function to render the DISTINCT clause in a SELECT
  */
  GdaSqlRenderingFunc renderDistinct;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;

  /** */
  extern(C) void function() GdaReserved5;

  /** */
  extern(C) void function() GdaReserved6;

  /** */
  extern(C) void function() GdaReserved7;
}

/**
    This structure represents a selected item in a SELECT statement (when executed, the returned data set
    will have one column per selected item). Note that the @table_name and
    @field_name field parts <emphasis>will be</emphasis> overwritten by &LIBGDA;,
    set the value of @expr->value instead.
*/
struct GdaSqlSelectField
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      expression
  */
  GdaSqlExpr* expr;

  /**
      field name part of @expr if @expr represents a field
  */
  char* fieldName;

  /**
      table name part of @expr if @expr represents a field
  */
  char* tableName;

  /**
      alias
  */
  char* as;

  /** */
  GdaMetaDbObject* validityMetaObject;

  /** */
  GdaMetaTableColumn* validityMetaTableColumn;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents the FROM clause of a SELECT statement, it lists targets and joins
*/
struct GdaSqlSelectFrom
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      list of #GdaSqlSelectTarget
  */
  GSList* targets;

  /**
      list of #GdaSqlSelectJoin
  */
  GSList* joins;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents a join between two targets in a SELECT statement.
*/
struct GdaSqlSelectJoin
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      type of join
  */
  GdaSqlSelectJoinType type;

  /**
      represents a join between a target at (pos &lt; @position) and the one at @position
  */
  int position;

  /**
      joining expression, or null
  */
  GdaSqlExpr* expr;

  /**
      list of #GdaSqlField pointers to use when joining, or null
  */
  GSList* use;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents the ordering of a SELECT statement.
*/
struct GdaSqlSelectOrder
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      expression to order on
  */
  GdaSqlExpr* expr;

  /**
      TRUE is ordering is ascending
  */
  gboolean asc;

  /**
      name of the collation to use for ordering
  */
  char* collationName;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents a target used to fetch data from in a SELECT statement; it can represent a table or
    a sub select. Note that the @table_name
    part <emphasis>will be</emphasis> overwritten by &LIBGDA;,
    set the value of @expr->value instead.
*/
struct GdaSqlSelectTarget
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      expression
  */
  GdaSqlExpr* expr;

  /**
      table name part of @expr if @expr represents a table
  */
  char* tableName;

  /**
      alias
  */
  char* as;

  /** */
  GdaMetaDbObject* validityMetaObject;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure is the top level structure encapsulating several type of statements.
*/
struct GdaSqlStatement
{
  /** */
  char* sql;

  /**
      type of statement
  */
  GdaSqlStatementType stmtType;

  /**
      contents, cast it depending on @stmt_type (for example to a #GdaSqlStatementSelect).
  */
  void* contents;

  /** */
  GdaMetaStruct* validityMetaStruct;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    Validation against a dictionary
*/
struct GdaSqlStatementCheckValidityData
{
  /** */
  GdaConnection* cnc;

  /** */
  GdaMetaStore* store;

  /** */
  GdaMetaStruct* mstruct;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaSqlStatementCompound
{
  /** */
  GdaSqlAnyPart any;

  /** */
  GdaSqlStatementCompoundType compoundType;

  /** */
  GSList* stmtList;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    Contents' infos
*/
struct GdaSqlStatementContentsInfo
{
  /** */
  GdaSqlStatementType type;

  /** */
  char* name;

  /** */
  extern(C) void* function() construct;

  /** */
  extern(C) void function(void* stm) free;

  /** */
  extern(C) void* function(void* stm) copy;

  /** */
  extern(C) char* function(void* stm) serialize;

  /** */
  GdaSqlForeachFunc checkStructureFunc;

  /** */
  GdaSqlForeachFunc checkValidityFunc;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;

  /** */
  void* GdaReserved3;

  /** */
  void* GdaReserved4;
}

/** */
struct GdaSqlStatementDelete
{
  /** */
  GdaSqlAnyPart any;

  /** */
  GdaSqlTable* table;

  /** */
  GdaSqlExpr* cond;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

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
struct GdaSqlStatementInsert
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      conflict resolution clause if there is one (such as "OR REPLACE")
  */
  char* onConflict;

  /**
      name of the table to which data is inserted
  */
  GdaSqlTable* table;

  /**
      list of #GdaSqlField fields which are valued for insertion
  */
  GSList* fieldsList;

  /**
      list of list of #GdaSqlExpr expressions (this is a list of list, not a simple list)
  */
  GSList* valuesList;

  /**
      a #GdaSqlStatementSelect or #GdaSqlStatementCompound structure representing the values to insert
  */
  GdaSqlAnyPart* select;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSqlStatementSelect
{
  /** */
  GdaSqlAnyPart any;

  /** */
  gboolean distinct;

  /** */
  GdaSqlExpr* distinctExpr;

  /** */
  GSList* exprList;

  /** */
  GdaSqlSelectFrom* from;

  /** */
  GdaSqlExpr* whereCond;

  /** */
  GSList* groupBy;

  /** */
  GdaSqlExpr* havingCond;

  /** */
  GSList* orderBy;

  /** */
  GdaSqlExpr* limitCount;

  /** */
  GdaSqlExpr* limitOffset;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    The statement is a transaction management related statement (BEGIN, ROLLBACK, etc). The #GdaSqlStatementTransaction structure
    does not hold enough information to reconstruct the complete SQL statement (some information may be missing) - the aim of this
    structure is to identify a minimum set of information in the transaction statement. Note that the complete SQL which created the
    statement should be available in the #GdaSqlStatement structure which encapsulates this structure.
*/
struct GdaSqlStatementTransaction
{
  /**
      inheritance structure
  */
  GdaSqlAnyPart any;

  /**
      isolation level as a #GdaTransactionIsolation
  */
  GdaTransactionIsolation isolationLevel;

  /**
      transaction mode (DEFERRED, IMMEDIATE, EXCLUSIVE, READ_WRITE, READ_ONLY)
  */
  char* transMode;

  /**
      transaction name
  */
  char* transName;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    Represents any statement which type is not identified (any DDL statement or database specific dialect)
*/
struct GdaSqlStatementUnknown
{
  /** */
  GdaSqlAnyPart any;

  /**
      a list of #GdaSqlExpr pointers
  */
  GSList* expressions;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaSqlStatementUpdate
{
  /** */
  GdaSqlAnyPart any;

  /** */
  char* onConflict;

  /** */
  GdaSqlTable* table;

  /** */
  GSList* fieldsList;

  /** */
  GSList* exprList;

  /** */
  GdaSqlExpr* cond;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/**
    This structure represents the name of a table.
*/
struct GdaSqlTable
{
  /** */
  GdaSqlAnyPart any;

  /** */
  char* tableName;

  /** */
  GdaMetaDbObject* validityMetaObject;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaStatement
{
  /** */
  GObject object;

  /** */
  GdaStatementPrivate* priv;
}

/** */
struct GdaStatementClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdaStatement* stmt, GdaConnection* cnc, gboolean checked) checked;

  /** */
  extern(C) void function(GdaStatement* stmt) reset;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaStatementPrivate;

/**
    A notification to be read through the #GIOChannel which is returned by [gda.thread_wrapper.ThreadWrapper.getIoChannel],
    for example:
    <programlisting><![CDATA[
    gboolean
    wrapper_ioc_cb (GIOChannel *source, GIOCondition condition, gpointer data)
    {
        GIOStatus status;
        gsize nread;
        GdaThreadNotification notif;
        if (condition & G_IO_IN) {
       status = g_io_channel_read_chars (source, (gchar*) &notif, sizeof (notif), &nread, NULL);
            if ((status != G_IO_STATUS_NORMAL) || (nread != sizeof (notif)))
                goto onerror;
       switch (notif.type) {
       case GDA_THREAD_NOTIFICATION_JOB:
                check_for_wrapper_result (bcnc);
                break;
            case GDA_THREAD_NOTIFICATION_SIGNAL:
                gda_thread_wrapper_iterate (bcnc->priv->wrapper, FALSE);
                break;
            default:
                goto onerror;
                break;
       }
      }
      if (condition & (G_IO_ERR | G_IO_HUP | G_IO_NVAL))
                goto onerror;
      return TRUE; // keep callback
    
    onerror:
      g_io_channel_shutdown (bcnc->priv->ioc, FALSE, NULL);
      return FALSE; // removed callback
    }
    
    {
    [...]
        GIOChannel *ioc;
        ioc = gda_thread_wrapper_get_io_channel (wrapper);
        if (!ioc)
            [handle error]
        else {
            guint watch_id;
            watch_id = g_io_add_watch (ioc, G_IO_IN | G_IO_HUP | G_IO_ERR | G_IO_NVAL,
                                       (GIOFunc) wrapper_ioc_cb, NULL);
        }
    }
    ]]></programlisting>
*/
struct GdaThreadNotification
{
  /**
      the notification type
  */
  GdaThreadNotificationType type;

  /**
      the job ID, if @type is a #GDA_THREAD_NOTIFICATION_JOB
  */
  uint jobId;
}

/** */
struct GdaThreadWrapper
{
  /** */
  GObject object;

  /** */
  GdaThreadWrapperPrivate* priv;
}

/** */
struct GdaThreadWrapperClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaThreadWrapperPrivate;

/**
    Represents a time information.
*/
struct GdaTime
{
  /**
      hour representation of the time, as a number between 0 and 23
  */
  ushort hour;

  /**
      minute representation of the time, as a number between 0 and 59
  */
  ushort minute;

  /**
      second representation of the time, as a number between 0 and 59
  */
  ushort second;

  /**
      fractionnal part of the seconds, in millionth' of second
  */
  gulong fraction;

  /**
      number of seconds added to the GMT timezone
  */
  glong timezone;
}

/**
    Represents an instant (a time stamp)
*/
struct GdaTimestamp
{
  /**
      year representation of the time stamp
  */
  short year;

  /**
      month representation of the time stamp, as a number between 1 and 12
  */
  ushort month;

  /**
      day representation of the time stamp, as a number between 1 and 31
  */
  ushort day;

  /**
      hour representation of the time stamp, as a number between 0 and 23
  */
  ushort hour;

  /**
      minute representation of the time stamp, as a number between 0 and 59
  */
  ushort minute;

  /**
      second representation of the time stamp, as a number between 0 and 59
  */
  ushort second;

  /**
      fractionnal part of the seconds, in millionth' of second
  */
  gulong fraction;

  /**
      number of seconds added to the GMT timezone
  */
  glong timezone;
}

/** */
struct GdaTransactionStatus
{
  /** */
  GObject object;

  /** */
  char* name;

  /** */
  GdaTransactionIsolation isolationLevel;

  /** */
  GdaTransactionStatusState state;

  /** */
  GList* events;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaTransactionStatusClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaTransactionStatusEvent
{
  /** */
  GdaTransactionStatus* trans;

  /** */
  GdaTransactionStatusEventType type;

  /** */
  /** */
  union PlType
  {
    /** */
    char* svpName;

    /** */
    char* sql;

    /** */
    GdaTransactionStatus* subTrans;
  }

  PlType pl;

  /** */
  GdaConnectionEvent* connEvent;

  /** */
  void* GdaReserved1;

  /** */
  void* GdaReserved2;
}

/** */
struct GdaTree
{
  /** */
  GObject object;

  /** */
  GdaTreePrivate* priv;
}

/** */
struct GdaTreeClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) void function(GdaTree* tree, GdaTreeNode* node) nodeChanged;

  /** */
  extern(C) void function(GdaTree* tree, GdaTreeNode* node) nodeInserted;

  /** */
  extern(C) void function(GdaTree* tree, GdaTreeNode* node) nodeHasChildToggled;

  /** */
  extern(C) void function(GdaTree* tree, const(char)* nodePath) nodeDeleted;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaTreeManager
{
  /** */
  GObject object;

  /** */
  GdaTreeManagerPrivate* priv;
}

/** */
struct GdaTreeManagerClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) GSList* function(GdaTreeManager* manager, GdaTreeNode* node, const(GSList)* childrenNodes, gboolean* outError, GError** _err) updateChildren;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaTreeManagerPrivate;

/** */
struct GdaTreeMgrColumns
{
  /** */
  GdaTreeManager object;

  /** */
  GdaTreeMgrColumnsPriv* priv;
}

/** */
struct GdaTreeMgrColumnsClass
{
  /** */
  GdaTreeManagerClass objectClass;
}

/** */
struct GdaTreeMgrColumnsPriv;

/** */
struct GdaTreeMgrLabel
{
  /** */
  GdaTreeManager object;

  /** */
  GdaTreeMgrLabelPriv* priv;
}

/** */
struct GdaTreeMgrLabelClass
{
  /** */
  GdaTreeManagerClass objectClass;
}

/** */
struct GdaTreeMgrLabelPriv;

/** */
struct GdaTreeMgrSchemas
{
  /** */
  GdaTreeManager object;

  /** */
  GdaTreeMgrSchemasPriv* priv;
}

/** */
struct GdaTreeMgrSchemasClass
{
  /** */
  GdaTreeManagerClass objectClass;
}

/** */
struct GdaTreeMgrSchemasPriv;

/** */
struct GdaTreeMgrSelect
{
  /** */
  GdaTreeManager object;

  /** */
  GdaTreeMgrSelectPriv* priv;
}

/** */
struct GdaTreeMgrSelectClass
{
  /** */
  GdaTreeManagerClass objectClass;
}

/** */
struct GdaTreeMgrSelectPriv;

/** */
struct GdaTreeMgrTables
{
  /** */
  GdaTreeManager object;

  /** */
  GdaTreeMgrTablesPriv* priv;
}

/** */
struct GdaTreeMgrTablesClass
{
  /** */
  GdaTreeManagerClass objectClass;
}

/** */
struct GdaTreeMgrTablesPriv;

/** */
struct GdaTreeNode
{
  /** */
  GObject object;

  /** */
  GdaTreeNodePrivate* priv;
}

/** */
struct GdaTreeNodeClass
{
  /** */
  GObjectClass objectClass;

  /** */
  extern(C) void function(GdaTreeNode* reporting, GdaTreeNode* node) nodeChanged;

  /** */
  extern(C) void function(GdaTreeNode* reporting, GdaTreeNode* node) nodeInserted;

  /** */
  extern(C) void function(GdaTreeNode* reporting, GdaTreeNode* node) nodeHasChildToggled;

  /** */
  extern(C) void function(GdaTreeNode* reporting, const(char)* relativePath) nodeDeleted;

  /** */
  extern(C) char* function(GdaTreeNode* node) dumpHeader;

  /** */
  extern(C) void function(GdaTreeNode* node, const(char)* prefix, GString* inString) dumpChildren;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaTreeNodePrivate;

/** */
struct GdaTreePrivate;

/** */
struct GdaUShort;

/** */
struct GdaXaTransaction
{
  /** */
  GObject object;

  /** */
  GdaXaTransactionPrivate* priv;
}

/** */
struct GdaXaTransactionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GdaReserved1;

  /** */
  extern(C) void function() GdaReserved2;

  /** */
  extern(C) void function() GdaReserved3;

  /** */
  extern(C) void function() GdaReserved4;
}

/** */
struct GdaXaTransactionId
{
  /**
      any number
  */
  uint format;

  /**
      number between 1 and 64
  */
  ushort gtridLength;

  /**
      number between 1 and 64
  */
  ushort bqualLength;

  /** */
  char[128] data;
}

/** */
struct GdaXaTransactionPrivate;

alias extern(C) void function(const(char)* attName, const(GValue)* value, void* data) GdaAttributesManagerFunc;

alias extern(C) void function(GObject* obj, const(char)* attName, const(GValue)* value, void* data) GdaAttributesManagerSignal;

alias extern(C) void function(GdaServerProvider* provider, GdaConnection* cnc, uint taskId, gboolean resultStatus, const(GError)* error, void* data) GdaServerProviderAsyncCallback;

alias extern(C) void function(GdaServerProvider* provider, GdaConnection* cnc, uint taskId, GObject* resultObj, const(GError)* error, void* data) GdaServerProviderExecCallback;

alias extern(C) gboolean function(GdaSqlAnyPart* part, void* data, GError** _err) GdaSqlForeachFunc;

alias extern(C) char* function(GdaSqlExpr* expr, GdaSqlRenderingContext* context, gboolean* isDefault, gboolean* isNull, GError** _err) GdaSqlRenderingExpr;

alias extern(C) char* function(GdaSqlAnyPart* node, GdaSqlRenderingContext* context, GError** _err) GdaSqlRenderingFunc;

alias extern(C) char* function(GdaSqlParamSpec* pspec, GdaSqlExpr* expr, GdaSqlRenderingContext* context, gboolean* isDefault, gboolean* isNull, GError** _err) GdaSqlRenderingPSpecFunc;

alias extern(C) char* function(const(GValue)* value, GdaSqlRenderingContext* context, GError** _err) GdaSqlRenderingValue;

alias extern(C) gboolean function(const(char)* word) GdaSqlReservedKeywordsFunc;

alias extern(C) void function(GdaThreadWrapper* wrapper, void* instance, const(char)* signame, int nParamValues, const(GValue)* paramValues, void* gdaReserved, void* data) GdaThreadWrapperCallback;

alias extern(C) void* function(void* arg, GError** _err) GdaThreadWrapperFunc;

alias extern(C) void function(void* arg, GError** _err) GdaThreadWrapperVoidFunc;

alias extern(C) GdaTreeNode* function(GdaTreeManager* manager, GdaTreeNode* parent, const(char)* name) GdaTreeManagerNodeFunc;

alias extern(C) GSList* function(GdaTreeManager* manager, GdaTreeNode* node, const(GSList)* childrenNodes, gboolean* outError, GError** _err) GdaTreeManagerNodesFunc;

