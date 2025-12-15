/// Module for [Parser] class
module json.parser;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import json.array;
import json.c.functions;
import json.c.types;
import json.node;
import json.object;
import json.types;

/**
    [json.parser.Parser] provides an object for parsing a JSON data stream, either
    inside a file or inside a static buffer.
    
    ## Using [json.parser.Parser]
    
    The [json.parser.Parser] API is fairly simple:
    
    ```c
    gboolean
    parse_json (const char *filename)
    {
      g_autoptr(JsonParser) parser = json_parser_new ();
      g_autoptr(GError) error = NULL
    
      json_parser_load_from_file (parser, filename, &error);
      if (error != NULL)
        {
          g_critical ("Unable to parse '%s': %s", filename, error->message);
          return FALSE;
        }
    
      g_autoptr(JsonNode) root = json_parser_get_root (parser);
    
      // manipulate the object tree from the root node
    
      return TRUE
    }
    ```
    
    By default, the entire process of loading the data and parsing it is
    synchronous; the [json.parser.Parser.loadFromStreamAsync] API will
    load the data asynchronously, but parse it in the main context as the
    signals of the parser must be emitted in the same thread. If you do
    not use signals, and you wish to also parse the JSON data without blocking,
    you should use a [gio.task.Task] and the synchronous [json.parser.Parser] API inside the
    task itself.
*/
class Parser : gobject.object.ObjectWrap
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
    return cast(void function())json_parser_get_type != &gidSymbolNotFound ? json_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Parser self()
  {
    return this;
  }

  /**
      Creates a new JSON parser.
      
      You can use the [json.parser.Parser] to load a JSON stream from either a file or a
      buffer and then walk the hierarchy using the data types API.
      Returns: the newly created parser
  */
  this()
  {
    JsonParser* _cretval;
    _cretval = json_parser_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new parser instance with its [json.parser.Parser.immutable_]
      property set to `TRUE` to create immutable output trees.
      Returns: the newly created parser
  */
  static json.parser.Parser newImmutable()
  {
    JsonParser* _cretval;
    _cretval = json_parser_new_immutable();
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.parser.Parser)(cast(JsonParser*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the line currently parsed, starting from 1.
      
      This function has defined behaviour only while parsing; calling this
      function from outside the signal handlers emitted by the parser will
      yield 0.
      Returns: the currently parsed line, or 0.
  */
  uint getCurrentLine()
  {
    uint _retval;
    _retval = json_parser_get_current_line(cast(JsonParser*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current position inside the current line, starting
      from 0.
      
      This function has defined behaviour only while parsing; calling this
      function from outside the signal handlers emitted by the parser will
      yield 0.
      Returns: the position in the current line, or 0.
  */
  uint getCurrentPos()
  {
    uint _retval;
    _retval = json_parser_get_current_pos(cast(JsonParser*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the top level node from the parsed JSON stream.
      
      If the parser input was an empty string, or if parsing failed, the root
      will be `NULL`. It will also be `NULL` if it has been stolen using
      [json.parser.Parser.stealRoot].
      Returns: the root node.
  */
  json.node.Node getRoot()
  {
    JsonNode* _cretval;
    _cretval = json_parser_get_root(cast(JsonParser*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A JSON data stream might sometimes contain an assignment, like:
      
      ```
      var _json_data = { "member_name" : [ ...
      ```
      
      even though it would technically constitute a violation of the RFC.
      
      [json.parser.Parser] will ignore the left hand identifier and parse the right
      hand value of the assignment. [json.parser.Parser] will record, though, the
      existence of the assignment in the data stream and the variable name
      used.
  
      Params:
        variableName = the variable name
      Returns: `TRUE` if there was an assignment, and `FALSE` otherwise
  */
  bool hasAssignment(out string variableName)
  {
    bool _retval;
    char* _variableName;
    _retval = cast(bool)json_parser_has_assignment(cast(JsonParser*)this._cPtr, &_variableName);
    variableName = _variableName.fromCString(No.Free);
    return _retval;
  }

  /**
      Loads a JSON stream from a buffer and parses it.
      
      You can call this function multiple times with the same parser, but the
      contents of the parser will be destroyed each time.
  
      Params:
        data = the buffer to parse
        length = the length of the buffer, or -1 if it is `NUL` terminated
      Returns: `TRUE` if the buffer was succesfully parsed
      Throws: [ErrorWrap]
  */
  bool loadFromData(string data, ptrdiff_t length)
  {
    bool _retval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)json_parser_load_from_data(cast(JsonParser*)this._cPtr, _data, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
      
      If the file is large or shared between processes,
      [json.parser.Parser.loadFromMappedFile] may be a more efficient
      way to load it.
      
      See also: [json.parser.Parser.loadFromData]
  
      Params:
        filename = the path for the file to parse
      Returns: `TRUE` if the file was successfully loaded and parsed.
      Throws: [ErrorWrap]
  */
  bool loadFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)json_parser_load_from_file(cast(JsonParser*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
      
      Unlike [json.parser.Parser.loadFromFile], `filename` will be memory
      mapped as read-only and parsed. `filename` will be unmapped before this
      function returns.
      
      If mapping or reading the file fails, a `G_FILE_ERROR` will be returned.
  
      Params:
        filename = the path for the file to parse
      Returns: `TRUE` if the file was successfully loaded and parsed.
      Throws: [ErrorWrap]
  */
  bool loadFromMappedFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)json_parser_load_from_mapped_file(cast(JsonParser*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Loads the contents of an input stream and parses them.
      
      If `cancellable` is not `NULL`, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the
      operation was cancelled, [gio.types.IOErrorEnum.Cancelled] will be set
      on the given `error`.
  
      Params:
        stream = the input stream with the JSON data
        cancellable = a #GCancellable
      Returns: `TRUE` if the data stream was successfully read and
          parsed, and `FALSE` otherwise
      Throws: [ErrorWrap]
  */
  bool loadFromStream(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)json_parser_load_from_stream(cast(JsonParser*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously reads the contents of a stream.
      
      For more details, see [json.parser.Parser.loadFromStream], which is the
      synchronous version of this call.
      
      When the operation is finished, callback will be called. You should
      then call [json.parser.Parser.loadFromStreamFinish] to get the result
      of the operation.
  
      Params:
        stream = the input stream with the JSON data
        cancellable = a #GCancellable
        callback = the function to call when the request is satisfied
  */
  void loadFromStreamAsync(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    json_parser_load_from_stream_async(cast(JsonParser*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream loading started with
      [json.parser.Parser.loadFromStreamAsync].
  
      Params:
        result = the result of the asynchronous operation
      Returns: `TRUE` if the content of the stream was successfully retrieved
          and parsed, and `FALSE` otherwise
      Throws: [ErrorWrap]
  */
  bool loadFromStreamFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)json_parser_load_from_stream_finish(cast(JsonParser*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Steals the top level node from the parsed JSON stream.
      
      This will be `NULL` in the same situations as [json.parser.Parser.getRoot]
      return `NULL`.
      Returns: the root node
  */
  json.node.Node stealRoot()
  {
    JsonNode* _cretval;
    _cretval = json_parser_steal_root(cast(JsonParser*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `ArrayElement` signal.
  
      The `::array-element` signal is emitted each time a parser
      has successfully parsed a single element of a JSON array.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.array.Array array, int index, json.parser.Parser parser))
  
          `array` a JSON array (optional)
  
          `index` the index of the newly parsed array element (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectArrayElement(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == json.array.Array)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : json.parser.Parser)))
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
    return connectSignalClosure("array-element", closure, after);
  }

  /**
      Connect to `ArrayEnd` signal.
  
      The `::array-end` signal is emitted each time a parser
      has successfully parsed an entire JSON array.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.array.Array array, json.parser.Parser parser))
  
          `array` the parsed JSON array (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectArrayEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == json.array.Array)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : json.parser.Parser)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("array-end", closure, after);
  }

  /**
      Connect to `ArrayStart` signal.
  
      The `::array-start` signal is emitted each time a parser
      starts parsing a JSON array.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.parser.Parser parser))
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectArrayStart(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : json.parser.Parser)))
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
    return connectSignalClosure("array-start", closure, after);
  }

  /**
      Connect to `Error` signal.
  
      The `::error` signal is emitted each time a parser encounters
      an error in a JSON stream.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* error, json.parser.Parser parser))
  
          `error` the error (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectError(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : json.parser.Parser)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }

  /**
      Connect to `ObjectEnd` signal.
  
      The `::object-end` signal is emitted each time a parser
      has successfully parsed an entire JSON object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.object.ObjectWrap object, json.parser.Parser parser))
  
          `object` the parsed JSON object (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectObjectEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == json.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : json.parser.Parser)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-end", closure, after);
  }

  /**
      Connect to `ObjectMember` signal.
  
      The `::object-member` signal is emitted each time a parser
      has successfully parsed a single member of a JSON object
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.object.ObjectWrap object, string memberName, json.parser.Parser parser))
  
          `object` the JSON object being parsed (optional)
  
          `memberName` the name of the newly parsed member (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectObjectMember(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == json.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : json.parser.Parser)))
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
    return connectSignalClosure("object-member", closure, after);
  }

  /**
      Connect to `ObjectStart` signal.
  
      This signal is emitted each time a parser starts parsing a JSON object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.parser.Parser parser))
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectObjectStart(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : json.parser.Parser)))
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
    return connectSignalClosure("object-start", closure, after);
  }

  /**
      Connect to `ParseEnd` signal.
  
      This signal is emitted when a parser successfully finished parsing a
      JSON data stream
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.parser.Parser parser))
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectParseEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : json.parser.Parser)))
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
    return connectSignalClosure("parse-end", closure, after);
  }

  /**
      Connect to `ParseStart` signal.
  
      This signal is emitted when a parser starts parsing a JSON data stream.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(json.parser.Parser parser))
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectParseStart(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : json.parser.Parser)))
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
    return connectSignalClosure("parse-start", closure, after);
  }
}
