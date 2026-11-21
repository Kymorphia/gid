/// D types for javascriptcore6 library
module gid.javascriptcore6.types;

import gid.core.gid;
import gid.javascriptcore6.c.functions;
import gid.javascriptcore6.c.types;
import gid.javascriptcore6.class_;
import gid.javascriptcore6.context;
import gid.javascriptcore6.exception;
import gid.javascriptcore6.value;


// Enums

/** */
alias CheckSyntaxMode = JSCCheckSyntaxMode;

/** */
alias CheckSyntaxResult = JSCCheckSyntaxResult;

/** */
alias OptionType = JSCOptionType;

/** */
alias TypedArrayType = JSCTypedArrayType;

/** */
alias ValuePropertyFlags = JSCValuePropertyFlags;

// Structs

/** */
alias ClassVTable = JSCClassVTable;

// Callbacks

/**
    The type of delete_property in #JSCClassVTable. This is only required when you need to handle
    external properties not added to the prototype.

    Params:
      jscClass = a #JSCClass
      context = a #JSCContext
      instance = the jsc_class instance
      name = the property name
    Returns: true if handled or false to to forward the request to the parent class or prototype chain.
*/
alias ClassDeletePropertyFunction = bool delegate(gid.javascriptcore6.class_.Class jscClass, gid.javascriptcore6.context.Context context, void* instance, string name);

/**
    The type of enumerate_properties in #JSCClassVTable. This is only required when you need to handle
    external properties not added to the prototype.

    Params:
      jscClass = a #JSCClass
      context = a #JSCContext
      instance = the jsc_class instance
    Returns: a null-terminated array of strings
         containing the property names, or null if instance doesn't have enumerable properties.
*/
alias ClassEnumeratePropertiesFunction = string[] delegate(gid.javascriptcore6.class_.Class jscClass, gid.javascriptcore6.context.Context context, void* instance);

/**
    The type of get_property in #JSCClassVTable. This is only required when you need to handle
    external properties not added to the prototype.

    Params:
      jscClass = a #JSCClass
      context = a #JSCContext
      instance = the jsc_class instance
      name = the property name
    Returns: a #JSCValue or null to forward the request to
         the parent class or prototype chain
*/
alias ClassGetPropertyFunction = gid.javascriptcore6.value.Value delegate(gid.javascriptcore6.class_.Class jscClass, gid.javascriptcore6.context.Context context, void* instance, string name);

/**
    The type of has_property in #JSCClassVTable. This is only required when you need to handle
    external properties not added to the prototype.

    Params:
      jscClass = a #JSCClass
      context = a #JSCContext
      instance = the jsc_class instance
      name = the property name
    Returns: true if instance has a property with name or false to forward the request
         to the parent class or prototype chain.
*/
alias ClassHasPropertyFunction = bool delegate(gid.javascriptcore6.class_.Class jscClass, gid.javascriptcore6.context.Context context, void* instance, string name);

/**
    The type of set_property in #JSCClassVTable. This is only required when you need to handle
    external properties not added to the prototype.

    Params:
      jscClass = a #JSCClass
      context = a #JSCContext
      instance = the jsc_class instance
      name = the property name
      value = the #JSCValue to set
    Returns: true if handled or false to forward the request to the parent class or prototype chain.
*/
alias ClassSetPropertyFunction = bool delegate(gid.javascriptcore6.class_.Class jscClass, gid.javascriptcore6.context.Context context, void* instance, string name, gid.javascriptcore6.value.Value value);

/**
    Function used to handle JavaScript exceptions in a #JSCContext.

    Params:
      context = a #JSCContext
      exception = a #JSCException
*/
alias ExceptionHandler = void delegate(gid.javascriptcore6.context.Context context, gid.javascriptcore6.exception.ExceptionWrap exception);

/**
    A function passed to jsc_value_new_promise called during initialization
    
    It is called like a JavaScript function, so exceptions raised will not be propagated
    to the context, but handled by the promise causing a rejection.
    resolve and reject can be reffed for later use to handle async task completion.

    Params:
      resolve = #JSCValue function to call to resolve the promise
      reject = #JSCValue function to call to reject the promise
*/
alias Executor = void delegate(gid.javascriptcore6.value.Value resolve, gid.javascriptcore6.value.Value reject);

/**
    Function used to iterate options.
    
    Not that description string is not localized.

    Params:
      option = the option name
      type = the option #JSCOptionType
      description = the option description, or null
    Returns: true to stop the iteration, or false otherwise
*/
alias OptionsFunc = bool delegate(string option, gid.javascriptcore6.types.OptionType type, string description);

/**
    Like [gid.javascriptcore6.global.getMajorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 2;

/**
    Like [gid.javascriptcore6.global.getMicroVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 6;

/**
    Like [gid.javascriptcore6.global.getMinorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 52;

/**
    Allows the DFG JIT to be used if true.
    Option type: [gid.javascriptcore6.types.OptionType.Boolean]
    Default value: true.
*/
enum OPTIONS_USE_DFG = "useDFGJIT";

/**
    Allows the FTL JIT to be used if true.
    Option type: [gid.javascriptcore6.types.OptionType.Boolean]
    Default value: true.
*/
enum OPTIONS_USE_FTL = "useFTLJIT";

/**
    Allows the executable pages to be allocated for JIT and thunks if true.
    Option type: [gid.javascriptcore6.types.OptionType.Boolean]
    Default value: true.
*/
enum OPTIONS_USE_JIT = "useJIT";

/**
    Allows the LLINT to be used if true.
    Option type: [gid.javascriptcore6.types.OptionType.Boolean]
    Default value: true.
*/
enum OPTIONS_USE_LLINT = "useLLInt";
