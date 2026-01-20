/// D types for gda5 library
module gda.types;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.server_provider;
import gda.sql_rendering_context;
import gda.thread_wrapper;
import gid.gid;
import glib.error;
import gobject.object;
import gobject.value;


// Aliases

/** */
alias SqlBuilderId = GdaSqlBuilderId;

/** */
alias SqlErrorType = gda.types.SqlError;

// Enums

/** */
alias BatchError = GdaBatchError;

/** */
alias ConfigError = GdaConfigError;

/** */
alias ConnectionError = GdaConnectionError;

/** */
alias ConnectionEventCode = GdaConnectionEventCode;

/** */
alias ConnectionEventType = GdaConnectionEventType;

/** */
alias ConnectionFeature = GdaConnectionFeature;

/** */
alias ConnectionMetaType = GdaConnectionMetaType;

/** */
alias ConnectionOptions = GdaConnectionOptions;

/** */
alias DataComparatorError = GdaDataComparatorError;

/** */
alias DataModelAccessFlags = GdaDataModelAccessFlags;

/** */
alias DataModelError = GdaDataModelError;

/** */
alias DataModelHint = GdaDataModelHint;

/** */
alias DataModelIOFormat = GdaDataModelIOFormat;

/** */
alias DataModelIterError = GdaDataModelIterError;

/** */
alias DataPivotAggregate = GdaDataPivotAggregate;

/** */
alias DataPivotError = GdaDataPivotError;

/** */
alias DataPivotFieldType = GdaDataPivotFieldType;

/** */
alias DataProxyError = GdaDataProxyError;

/** */
alias DataSelectConditionType = GdaDataSelectConditionType;

/** */
alias DataSelectError = GdaDataSelectError;

/** */
alias DiffType = GdaDiffType;

/** */
alias HolderError = GdaHolderError;

/** */
alias MetaDbObjectType = GdaMetaDbObjectType;

/** */
alias MetaForeignKeyPolicy = GdaMetaForeignKeyPolicy;

/** */
alias MetaGraphInfo = GdaMetaGraphInfo;

/** */
alias MetaSortType = GdaMetaSortType;

/** */
alias MetaStoreChangeType = GdaMetaStoreChangeType;

/** */
alias MetaStoreError = GdaMetaStoreError;

/** */
alias MetaStructError = GdaMetaStructError;

/** */
alias MetaStructFeature = GdaMetaStructFeature;

/** */
alias ServerOperationCreateTableFlag = GdaServerOperationCreateTableFlag;

/** */
alias ServerOperationError = GdaServerOperationError;

/** */
alias ServerOperationNodeStatus = GdaServerOperationNodeStatus;

/** */
alias ServerOperationNodeType = GdaServerOperationNodeType;

/** */
alias ServerOperationType = GdaServerOperationType;

/** */
alias ServerProviderError = GdaServerProviderError;

/** */
alias SetError = GdaSetError;

/** */
alias SqlAnyPartType = GdaSqlAnyPartType;

/** */
alias SqlBuilderError = GdaSqlBuilderError;

/** */
alias SqlError = GdaSqlError;

/** */
alias SqlIdentifierStyle = GdaSqlIdentifierStyle;

/** */
alias SqlOperatorType = GdaSqlOperatorType;

/** */
alias SqlParserError = GdaSqlParserError;

/** */
alias SqlParserFlavour = GdaSqlParserFlavour;

/** */
alias SqlParserMode = GdaSqlParserMode;

/** */
alias SqlSelectJoinType = GdaSqlSelectJoinType;

/** */
alias SqlStatementCompoundType = GdaSqlStatementCompoundType;

/** */
alias SqlStatementType = GdaSqlStatementType;

/** */
alias StatementError = GdaStatementError;

/** */
alias StatementModelUsage = GdaStatementModelUsage;

/** */
alias StatementSqlFlag = GdaStatementSqlFlag;

/** */
alias ThreadNotificationType = GdaThreadNotificationType;

/** */
alias ThreadWrapperError = GdaThreadWrapperError;

/** */
alias TransactionIsolation = GdaTransactionIsolation;

/** */
alias TransactionStatusEventType = GdaTransactionStatusEventType;

/** */
alias TransactionStatusState = GdaTransactionStatusState;

/** */
alias TreeError = GdaTreeError;

/** */
alias TreeManagerError = GdaTreeManagerError;

/** */
alias TreeNodeError = GdaTreeNodeError;

/** */
alias ValueAttribute = GdaValueAttribute;

/** */
alias XaTransactionError = GdaXaTransactionError;

// Structs

/** */
alias HandlerBinPriv = GdaHandlerBinPriv*;

/** */
alias HandlerBooleanPriv = GdaHandlerBooleanPriv*;

/** */
alias HandlerNumericalPriv = GdaHandlerNumericalPriv*;

/** */
alias HandlerStringPriv = GdaHandlerStringPriv*;

/** */
alias HandlerTimePriv = GdaHandlerTimePriv*;

/** */
alias HandlerTypePriv = GdaHandlerTypePriv*;

/** */
alias ServerProviderInfo = GdaServerProviderInfo*;

/** */
alias ServerProviderMeta = GdaServerProviderMeta;

/** */
alias ServerProviderXa = GdaServerProviderXa;

/** */
alias ThreadNotification = GdaThreadNotification;

/** */
alias TreeMgrColumnsPriv = GdaTreeMgrColumnsPriv*;

/** */
alias TreeMgrLabelPriv = GdaTreeMgrLabelPriv*;

/** */
alias TreeMgrSchemasPriv = GdaTreeMgrSchemasPriv*;

/** */
alias TreeMgrSelectPriv = GdaTreeMgrSelectPriv*;

/** */
alias TreeMgrTablesPriv = GdaTreeMgrTablesPriv*;

// Callbacks

/** */
alias AttributesManagerFunc = void delegate(string attName, gobject.value.Value value);

/** */
alias AttributesManagerSignal = void delegate(gobject.object.ObjectWrap obj, string attName, gobject.value.Value value);

/**
    Function to be called by Libgda when the associated asynchronous method invoked finishes.

    Params:
      provider = 
      cnc = 
      taskId = 
      resultStatus = 
      error = 
*/
alias ServerProviderAsyncCallback = void delegate(gda.server_provider.ServerProvider provider, gda.connection.Connection cnc, uint taskId, bool resultStatus, glib.error.ErrorWrap error);

/**
    Function to be called by Libgda when the associated asynchronous method invoked finishes

    Params:
      provider = 
      cnc = 
      taskId = 
      resultObj = 
      error = 
*/
alias ServerProviderExecCallback = void delegate(gda.server_provider.ServerProvider provider, gda.connection.Connection cnc, uint taskId, gobject.object.ObjectWrap resultObj, glib.error.ErrorWrap error);

/**
    Rendering function type to render a #GValue

    Params:
      value = the #GValue to render
      context = the rendering context
    Returns: a new string, or null if an error occurred
    Throws: [ErrorWrap]
*/
alias SqlRenderingValue = string delegate(gobject.value.Value value, gda.sql_rendering_context.SqlRenderingContext context, GError **_err);

/** */
alias SqlReservedKeywordsFunc = bool delegate(string word);

/**
    Specifies the type of function to be passed to [gda.thread_wrapper.ThreadWrapper.connectRaw]

    Params:
      wrapper = the #GdaThreadWrapper
      instance = a pointer to the instance which emitted the signal
      signame = the name of the signal being emitted
      nParamValues = number of GValue in param_values
      paramValues = array of n_param_values GValue
      gdaReserved = reserved
*/
alias ThreadWrapperCallback = void delegate(gda.thread_wrapper.ThreadWrapper wrapper, void* instance, string signame, int nParamValues, gobject.value.Value paramValues, void* gdaReserved);

/**
    Specifies the type of function to be passed to [gda.thread_wrapper.ThreadWrapper.execute].

    Params:
      arg = pointer to the data (which is the arg argument passed to [gda.thread_wrapper.ThreadWrapper.executeVoid])
    Returns: a pointer to some data which will be returned by [gda.thread_wrapper.ThreadWrapper.fetchResult]
    Throws: [ErrorWrap]
*/
alias ThreadWrapperFunc = void* delegate(void* arg, GError **_err);

/**
    Specifies the type of function to be passed to [gda.thread_wrapper.ThreadWrapper.executeVoid].

    Params:
      arg = a pointer to the data (which is the arg argument passed to [gda.thread_wrapper.ThreadWrapper.executeVoid])
    Throws: [ErrorWrap]
*/
alias ThreadWrapperVoidFunc = void delegate(void* arg, GError **_err);

/**
    The corresponding attribute specifies if the object it refers to is auto incremented (value has a G_TYPE_BOOLEAN type).
*/
enum ATTRIBUTE_AUTO_INCREMENT = "__gda_attr_autoinc";

/**
    The corresponding attribute is the description of the object it refers to (value has a G_TYPE_STRING type).
*/
enum ATTRIBUTE_DESCRIPTION = "__gda_attr_descr";

/**
    The corresponding attribute specifies if the object it refers to has its value to default (value has a G_TYPE_BOOLEAN type).
*/
enum ATTRIBUTE_IS_DEFAULT = "__gda_attr_is_default";

/**
    The corresponding attribute is the name of the object it refers to (value has a G_TYPE_STRING type).
*/
enum ATTRIBUTE_NAME = "__gda_attr_name";

/**
    The corresponding attribute is the number of significant digits of the object it refers to (value has a G_TYPE_INT type).
*/
enum ATTRIBUTE_NUMERIC_PRECISION = "__gda_attr_numeric_precision";

/**
    The corresponding attribute is the number of significant digits to the right of the decimal point of the object it refers to (value has a G_TYPE_INT type).
*/
enum ATTRIBUTE_NUMERIC_SCALE = "__gda_attr_numeric_scale";

/**
    This attribute, if true specifies that a tree node may or may not have any children nodes (value has a G_TYPE_BOOLEAN type).
*/
enum ATTRIBUTE_TREE_NODE_UNKNOWN_CHILDREN = "__gda_attr_tnuchild";

/** */
enum EXTRA_AUTO_INCREMENT = "AUTO_INCREMENT";

/** */
enum SERVER_PROVIDER_UNDEFINED_LIMITING_THREAD = 1;

/** */
enum SQLSTATE_GENERAL_ERROR = "HY000";

/** */
enum SQLSTATE_NO_ERROR = "00000";

/** */
enum TIMEZONE_INVALID = 86400;
