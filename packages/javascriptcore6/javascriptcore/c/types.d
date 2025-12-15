/// C types for javascriptcore6 library
module javascriptcore.c.types;

public import gid.basictypes;
public import gobject.c.types;

/**
    Enum values to specify a mode to check for syntax errors in [javascriptcore.context.Context.checkSyntax].
*/
enum JSCCheckSyntaxMode
{
  /**
      mode to check syntax of a script
  */
  Script = 0,

  /**
      mode to check syntax of a module
  */
  Module = 1,
}

/**
    Enum values to specify the result of [javascriptcore.context.Context.checkSyntax].
*/
enum JSCCheckSyntaxResult
{
  /**
      no errors
  */
  Success = 0,

  /**
      recoverable syntax error
  */
  RecoverableError = 1,

  /**
      irrecoverable syntax error
  */
  IrrecoverableError = 2,

  /**
      unterminated literal error
  */
  UnterminatedLiteralError = 3,

  /**
      out of memory error
  */
  OutOfMemoryError = 4,

  /**
      stack overflow error
  */
  StackOverflowError = 5,
}

/**
    Enum values for options types.
*/
enum JSCOptionType
{
  /**
      A #gboolean option type.
  */
  Boolean = 0,

  /**
      A #gint option type.
  */
  Int = 1,

  /**
      A #guint option type.
  */
  Uint = 2,

  /**
      A #gsize options type.
  */
  Size = 3,

  /**
      A #gdouble options type.
  */
  Double = 4,

  /**
      A string option type.
  */
  String = 5,

  /**
      A range string option type.
  */
  RangeString = 6,
}

/**
    Possible types of the elements contained in a typed array.
*/
enum JSCTypedArrayType
{
  /**
      Not a typed array, or type unsupported.
  */
  None = 0,

  /**
      Array elements are 8-bit signed integers (int8_t).
  */
  Int8 = 1,

  /**
      Array elements are 16-bit signed integers (int16_t).
  */
  Int16 = 2,

  /**
      Array elements are 32-bit signed integers (int32_t).
  */
  Int32 = 3,

  /**
      Array elements are 64-bit signed integers (int64_t).
  */
  Int64 = 4,

  /**
      Array elements are 8-bit unsigned integers (uint8_t).
  */
  Uint8 = 5,

  /**
      Array elements are 8-bit unsigned integers (uint8_t).
  */
  Uint8Clamped = 6,

  /**
      Array elements are 16-bit unsigned integers (uint16_t).
  */
  Uint16 = 7,

  /**
      Array elements are 32-bit unsigned integers (uint32_t).
  */
  Uint32 = 8,

  /**
      Array elements are 64-bit unsigned integers (uint64_t).
  */
  Uint64 = 9,

  /**
      Array elements are 32-bit floating point numbers (float).
  */
  Float32 = 10,

  /**
      Array elements are 64-bit floating point numbers (double).
  */
  Float64 = 11,
}

/**
    Flags used when defining properties with [javascriptcore.value.Value.objectDefinePropertyData] and
    [javascriptcore.value.Value.objectDefinePropertyAccessor].
*/
enum JSCValuePropertyFlags : uint
{
  /**
      the type of the property descriptor may be changed and the
       property may be deleted from the corresponding object.
  */
  Configurable = 1,

  /**
      the property shows up during enumeration of the properties on
       the corresponding object.
  */
  Enumerable = 2,

  /**
      the value associated with the property may be changed with an
       assignment operator. This doesn't have any effect when passed to [javascriptcore.value.Value.objectDefinePropertyAccessor].
  */
  Writable = 4,
}

/**
    A JSSClass represents a custom JavaScript class registered by the user in a #JSCContext.
    It allows to create new JavaScripts objects whose instances are created by the user using
    this API.
    It's possible to add constructors, properties and methods for a JSSClass by providing
    #GCallback<!-- -->s to implement them.
*/
struct JSCClass;

/** */
struct JSCClassClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Virtual table for a JSCClass. This can be optionally used when registering a #JSCClass in a #JSCContext
    to provide a custom implementation for the class. All virtual functions are optional and can be set to
    null to fallback to the default implementation.
*/
struct JSCClassVTable
{
  /**
      a #JSCClassGetPropertyFunction for getting a property.
  */
  JSCClassGetPropertyFunction getProperty;

  /**
      a #JSCClassSetPropertyFunction for setting a property.
  */
  JSCClassSetPropertyFunction setProperty;

  /**
      a #JSCClassHasPropertyFunction for querying a property.
  */
  JSCClassHasPropertyFunction hasProperty;

  /**
      a #JSCClassDeletePropertyFunction for deleting a property.
  */
  JSCClassDeletePropertyFunction deleteProperty;

  /**
      a #JSCClassEnumeratePropertiesFunction for enumerating properties.
  */
  JSCClassEnumeratePropertiesFunction enumerateProperties;

  /** */
  extern(C) void function() JscReserved0;

  /** */
  extern(C) void function() JscReserved1;

  /** */
  extern(C) void function() JscReserved2;

  /** */
  extern(C) void function() JscReserved3;

  /** */
  extern(C) void function() JscReserved4;

  /** */
  extern(C) void function() JscReserved5;

  /** */
  extern(C) void function() JscReserved6;

  /** */
  extern(C) void function() JscReserved7;
}

/**
    JSCContext represents a JavaScript execution context, where all operations
    take place and where the values will be associated.
    
    When a new context is created, a global object is allocated and the built-in JavaScript
    objects (Object, Function, String, Array) are populated. You can execute JavaScript in
    the context by using [javascriptcore.context.Context.evaluate] or [javascriptcore.context.Context.evaluateWithSourceUri].
    It's also possible to register custom objects in the context with [javascriptcore.context.Context.registerClass].
*/
struct JSCContext;

/** */
struct JSCContextClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct JSCExceptionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    JSCException represents a JavaScript exception.
*/
struct JSCException;

/**
    JSCValue represents a reference to a value in a #JSCContext. The JSCValue
    protects the referenced value from being garbage collected.
*/
struct JSCValue;

/** */
struct JSCValueClass
{
  /** */
  GObjectClass parentClass;
}

/**
    JSCVirtualMachine represents a group of JSCContext<!-- -->s. It allows
    concurrent JavaScript execution by creating a different instance of
    JSCVirtualMachine in each thread.
    
    To create a group of JSCContext<!-- -->s pass the same JSCVirtualMachine
    instance to every JSCContext constructor.
*/
struct JSCVirtualMachine;

/** */
struct JSCVirtualMachineClass
{
  /** */
  GObjectClass parentClass;
}

/**
    JSCWeakValue represents a weak reference to a value in a #JSCContext. It can be used
    to keep a reference to a JavaScript value without protecting it from being garbage
    collected and without referencing the #JSCContext either.
*/
struct JSCWeakValue;

/** */
struct JSCWeakValueClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) gboolean function(JSCClass* jscClass, JSCContext* context, void* instance, const(char)* name) JSCClassDeletePropertyFunction;

alias extern(C) char** function(JSCClass* jscClass, JSCContext* context, void* instance) JSCClassEnumeratePropertiesFunction;

alias extern(C) JSCValue* function(JSCClass* jscClass, JSCContext* context, void* instance, const(char)* name) JSCClassGetPropertyFunction;

alias extern(C) gboolean function(JSCClass* jscClass, JSCContext* context, void* instance, const(char)* name) JSCClassHasPropertyFunction;

alias extern(C) gboolean function(JSCClass* jscClass, JSCContext* context, void* instance, const(char)* name, JSCValue* value) JSCClassSetPropertyFunction;

alias extern(C) void function(JSCContext* context, JSCException* exception, void* userData) JSCExceptionHandler;

alias extern(C) void function(JSCValue* resolve, JSCValue* reject, void* userData) JSCExecutor;

alias extern(C) gboolean function(const(char)* option, JSCOptionType type, const(char)* description, void* userData) JSCOptionsFunc;

