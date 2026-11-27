/// Module for [Parser] class
module gid.json1.parser;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.json1.array;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.node;
import gid.json1.object;
import gid.json1.types;

/**
    [gid.json1.parser.Parser] provides an object for parsing a JSON data stream, either
    inside a file or inside a static buffer.
    
    ## Using [gid.json1.parser.Parser]
    
    The [gid.json1.parser.Parser] API is fairly simple:
    
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
    synchronous; the [gid.json1.parser.Parser.loadFromStreamAsync] API will
    load the data asynchronously, but parse it in the main context as the
    signals of the parser must be emitted in the same thread. If you do
    not use signals, and you wish to also parse the JSON data without blocking,
    you should use a [gid.gio2.task.Task] and the synchronous [gid.json1.parser.Parser] API inside the
    task itself.
*/
@gidGir("Parser", "ParserClass")
class Parser : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())json_parser_get_type != &gidSymbolNotFound ? json_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "JsonParser";
  }

  /** Returns `this`, for use in `with` statements. */
  override Parser self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.json1.parser.Parser]
      Returns: New builder object
  */
  static ParserGidBuilder builder() nothrow
  {
    return new ParserGidBuilder;
  }

  /**
      Get `immutable_` property.
      Returns: Whether the tree built by the parser should be immutable
        when created.
        
        Making the output immutable on creation avoids the expense
        of traversing it to make it immutable later.
  */
  @property bool immutable_() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("immutable");
  }

  /**
      Get `strict` property.
      Returns: Whether the parser should be strictly conforming to the
        JSON format, or allow custom extensions like comments.
  */
  @property bool strict() nothrow
  {
    return getStrict();
  }

  /**
      Set `strict` property.
      Params:
        propval = Whether the parser should be strictly conforming to the
          JSON format, or allow custom extensions like comments.
  */
  @property void strict(bool propval) nothrow
  {
    setStrict(propval);
  }

  /**
      Creates a new JSON parser.
      
      You can use the [gid.json1.parser.Parser] to load a JSON stream from either a file or a
      buffer and then walk the hierarchy using the data types API.
      Returns: the newly created parser
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      JsonParser* _cretval;
      _cretval = json_parser_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new parser instance with its [gid.json1.parser.Parser.immutable_]
      property set to `TRUE` to create immutable output trees.
      Returns: the newly created parser
  */
  static gid.json1.parser.Parser newImmutable() nothrow
  {
    JsonParser* _cretval;
    _cretval = json_parser_new_immutable();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.json1.parser.Parser)(cast(JsonParser*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      class handler for the JsonParser::array-element signal
  
      Params:
        array =  (modified in place, changes are seen by the caller)
        index = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncArrayElement` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncArrayElement(gid.json1.array.Array array, int index)
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.arrayElement)
      return;

    _klass.arrayElement(cast(JsonParser*)this._cPtr, array ? cast(JsonArray*)array._cPtr(No.Dup) : null, index);
  }

  /**
      class handler for the JsonParser::array-end signal
  
      Params:
        array =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncArrayEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncArrayEnd(gid.json1.array.Array array)
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.arrayEnd)
      return;

    _klass.arrayEnd(cast(JsonParser*)this._cPtr, array ? cast(JsonArray*)array._cPtr(No.Dup) : null);
  }

  /**
      class handler for the JsonParser::array-start signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncArrayStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncArrayStart()
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.arrayStart)
      return;

    _klass.arrayStart(cast(JsonParser*)this._cPtr);
  }

  /**
      class handler for the JsonParser::error signal
  
      Params:
        error = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncError` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncError(gid.glib2.error.ErrorWrap error)
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.error)
      return;

    _klass.error(cast(JsonParser*)this._cPtr, error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
  }

  /**
      class handler for the JsonParser::object-end signal
  
      Params:
        object =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncObjectEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncObjectEnd(gid.json1.object.ObjectWrap object)
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.objectEnd)
      return;

    _klass.objectEnd(cast(JsonParser*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null);
  }

  /**
      class handler for the JsonParser::object-member signal
  
      Params:
        object =  (modified in place, changes are seen by the caller)
        memberName = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncObjectMember` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncObjectMember(gid.json1.object.ObjectWrap object, string memberName)
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.objectMember)
      return;

    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _klass.objectMember(cast(JsonParser*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null, _memberName);
  }

  /**
      class handler for the JsonParser::object-start signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncObjectStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncObjectStart()
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.objectStart)
      return;

    _klass.objectStart(cast(JsonParser*)this._cPtr);
  }

  /**
      class handler for the JsonParser::parse-end signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncParseEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncParseEnd()
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.parseEnd)
      return;

    _klass.parseEnd(cast(JsonParser*)this._cPtr);
  }

  /**
      class handler for the JsonParser::parse-start signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncParseStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncParseStart()
  {
    auto _klass = cast(JsonParserClass*)_vfuncClass;
    if (!_klass.parseStart)
      return;

    _klass.parseStart(cast(JsonParser*)this._cPtr);
  }

  /**
      Retrieves the line currently parsed, starting from 1.
      
      This function has defined behaviour only while parsing; calling this
      function from outside the signal handlers emitted by the parser will
      yield 0.
      Returns: the currently parsed line, or 0.
  */
  uint getCurrentLine() nothrow
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
  uint getCurrentPos() nothrow
  {
    uint _retval;
    _retval = json_parser_get_current_pos(cast(JsonParser*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the top level node from the parsed JSON stream.
      
      If the parser input was an empty string, or if parsing failed, the root
      will be `NULL`. It will also be `NULL` if it has been stolen using
      [gid.json1.parser.Parser.stealRoot].
      Returns: the root node.
  */
  gid.json1.node.Node getRoot() nothrow
  {
    JsonNode* _cretval;
    _cretval = json_parser_get_root(cast(JsonParser*)this._cPtr);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves whether the parser is operating in strict mode.
      Returns: true if the parser is strict, and false otherwise
  */
  bool getStrict() nothrow
  {
    bool _retval;
    _retval = cast(bool)json_parser_get_strict(cast(JsonParser*)this._cPtr);
    return _retval;
  }

  /**
      A JSON data stream might sometimes contain an assignment, like:
      
      ```
      var _json_data = { "member_name" : [ ...
      ```
      
      even though it would technically constitute a violation of the RFC.
      
      [gid.json1.parser.Parser] will ignore the left hand identifier and parse the right
      hand value of the assignment. [gid.json1.parser.Parser] will record, though, the
      existence of the assignment in the data stream and the variable name
      used.
  
      Params:
        variableName = the variable name
      Returns: `TRUE` if there was an assignment, and `FALSE` otherwise
  */
  bool hasAssignment(out string variableName) nothrow
  {
    bool _retval;
    char* _variableName;
    _retval = cast(bool)json_parser_has_assignment(cast(JsonParser*)this._cPtr, &_variableName);
    variableName = _variableName.fromCString!(No.Free);
    return _retval;
  }

  /**
      Loads a JSON stream from a buffer and parses it.
      
      You can call this function multiple times with the same parser, but the
      contents of the parser will be destroyed each time.
  
      Params:
        data = the buffer to parse
      Returns: `TRUE` if the buffer was succesfully parsed
      Throws: [ErrorWrap]
  */
  bool loadFromData(string data)
  {
    bool _retval;
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(char*)data.ptr;
    GError *_err;
    _retval = cast(bool)json_parser_load_from_data(cast(JsonParser*)this._cPtr, _data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
      
      If the file is large or shared between processes,
      [gid.json1.parser.Parser.loadFromMappedFile] may be a more efficient
      way to load it.
      
      See also: [gid.json1.parser.Parser.loadFromData]
  
      Params:
        filename = the path for the file to parse
      Returns: `TRUE` if the file was successfully loaded and parsed.
      Throws: [ErrorWrap]
  */
  bool loadFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)json_parser_load_from_file(cast(JsonParser*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads a JSON stream from the content of `filename` and parses it.
      
      Unlike [gid.json1.parser.Parser.loadFromFile], `filename` will be memory
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
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)json_parser_load_from_mapped_file(cast(JsonParser*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Loads the contents of an input stream and parses them.
      
      If `cancellable` is not `NULL`, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the
      operation was cancelled, [gid.gio2.types.IOErrorEnum.Cancelled] will be set
      on the given `error`.
  
      Params:
        stream = the input stream with the JSON data
        cancellable = a #GCancellable
      Returns: `TRUE` if the data stream was successfully read and
          parsed, and `FALSE` otherwise
      Throws: [ErrorWrap]
  */
  bool loadFromStream(gid.gio2.input_stream.InputStream stream, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)json_parser_load_from_stream(cast(JsonParser*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously reads the contents of a stream.
      
      For more details, see [gid.json1.parser.Parser.loadFromStream], which is the
      synchronous version of this call.
      
      When the operation is finished, callback will be called. You should
      then call [gid.json1.parser.Parser.loadFromStreamFinish] to get the result
      of the operation.
  
      Params:
        stream = the input stream with the JSON data
        cancellable = a #GCancellable
        callback = the function to call when the request is satisfied
  */
  void loadFromStreamAsync(gid.gio2.input_stream.InputStream stream, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    json_parser_load_from_stream_async(cast(JsonParser*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream loading started with
      [gid.json1.parser.Parser.loadFromStreamAsync].
  
      Params:
        result = the result of the asynchronous operation
      Returns: `TRUE` if the content of the stream was successfully retrieved
          and parsed, and `FALSE` otherwise
      Throws: [ErrorWrap]
  */
  bool loadFromStreamFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)json_parser_load_from_stream_finish(cast(JsonParser*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets whether the parser should operate in strict mode.
      
      If strict is true, [gid.json1.parser.Parser] will strictly conform to
      the JSON format.
      
      If strict is false, [gid.json1.parser.Parser] will allow custom extensions
      to the JSON format, like comments.
  
      Params:
        strict = whether the parser should be strict
  */
  void setStrict(bool strict) nothrow
  {
    json_parser_set_strict(cast(JsonParser*)this._cPtr, strict);
  }

  /**
      Steals the top level node from the parsed JSON stream.
      
      This will be `NULL` in the same situations as [gid.json1.parser.Parser.getRoot]
      return `NULL`.
      Returns: the root node
  */
  gid.json1.node.Node stealRoot() nothrow
  {
    JsonNode* _cretval;
    _cretval = json_parser_steal_root(cast(JsonParser*)this._cPtr);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `ArrayElement` signal.
  
      The `::array-element` signal is emitted each time a parser
        has successfully parsed a single element of a JSON array.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.json1.array.Array array, int index, gid.json1.parser.Parser parser)`
  
          `array` a JSON array (optional)
  
          `index` the index of the newly parsed array element (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.array_element` virtual function
  */
  gulong connectArrayElement(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.json1.array.Array)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.json1.parser.Parser)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.arrayElement");
      }
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
  
          `void callback(gid.json1.array.Array array, gid.json1.parser.Parser parser)`
  
          `array` the parsed JSON array (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.array_end` virtual function
  */
  gulong connectArrayEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.json1.array.Array)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.json1.parser.Parser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.arrayEnd");
      }
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
  
          `void callback(gid.json1.parser.Parser parser)`
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.array_start` virtual function
  */
  gulong connectArrayStart(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.json1.parser.Parser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.arrayStart");
      }
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
  
          `void callback(void* error, gid.json1.parser.Parser parser)`
  
          `error` the error (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.error` virtual function
  */
  gulong connectError(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.json1.parser.Parser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.error");
      }
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
  
          `void callback(gid.json1.object.ObjectWrap object, gid.json1.parser.Parser parser)`
  
          `object` the parsed JSON object (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.object_end` virtual function
  */
  gulong connectObjectEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.json1.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.json1.parser.Parser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.objectEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-end", closure, after);
  }

  /**
      Connect to `ObjectMember` signal.
  
      The `::object-member` signal is emitted each time a parser
        has successfully parsed a single member of a JSON object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.json1.object.ObjectWrap object, string memberName, gid.json1.parser.Parser parser)`
  
          `object` the JSON object being parsed (optional)
  
          `memberName` the name of the newly parsed member (optional)
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.object_member` virtual function
  */
  gulong connectObjectMember(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.json1.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.json1.parser.Parser)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.objectMember");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-member", closure, after);
  }

  /**
      Connect to `ObjectStart` signal.
  
      This signal is emitted each time a parser starts parsing a JSON object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.json1.parser.Parser parser)`
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.object_start` virtual function
  */
  gulong connectObjectStart(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.json1.parser.Parser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.objectStart");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-start", closure, after);
  }

  /**
      Connect to `ParseEnd` signal.
  
      This signal is emitted when a parser successfully finished parsing a
        JSON data stream.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.json1.parser.Parser parser)`
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.parse_end` virtual function
  */
  gulong connectParseEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.json1.parser.Parser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.parseEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parse-end", closure, after);
  }

  /**
      Connect to `ParseStart` signal.
  
      This signal is emitted when a parser starts parsing a JSON data stream.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.json1.parser.Parser parser)`
  
          `parser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Derive your own parser type from [gid.json1.parser.Parser] and
          override the `vfuncJson.Parser.parse_start` virtual function
  */
  gulong connectParseStart(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.json1.parser.Parser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.parseStart");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parse-start", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Parser
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.json1.parser.Parser), T.stringof ~ " is not derived from gid.json1.parser.Parser");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncArrayElement", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "array_element");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncArrayEnd", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "array_end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncArrayStart", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "array_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncError", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "error");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncObjectEnd", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "object_end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncObjectMember", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "object_member");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncObjectStart", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "object_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParseEnd", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "parse_end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParseStart", true)[0]) == gid.json1.parser.Parser))
      _installVfunc(klass, "parse_start");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(JsonParserClass*)klass;

    switch (vfunc)
    {
      case "array_element":
      {
        static extern(C) void _vfuncArrayElementTramp(JsonParser* parser, JsonArray* array, int index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.arrayElement)
              return (cast(typeof(&_vfuncArrayElementTramp))_klass.arrayElement)(parser, array, index);
            return;
          }

          auto _array = array ? new gid.json1.array.Array(cast(void*)array, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncArrayElement(_array, index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncArrayElement");
          }
          if (_array)
            _array._cUnborrow;

        }

        _klass.arrayElement = cast(typeof(_klass.arrayElement))&_vfuncArrayElementTramp;
        break;
      }
      case "array_end":
      {
        static extern(C) void _vfuncArrayEndTramp(JsonParser* parser, JsonArray* array) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.arrayEnd)
              return (cast(typeof(&_vfuncArrayEndTramp))_klass.arrayEnd)(parser, array);
            return;
          }

          auto _array = array ? new gid.json1.array.Array(cast(void*)array, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncArrayEnd(_array);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncArrayEnd");
          }
          if (_array)
            _array._cUnborrow;

        }

        _klass.arrayEnd = cast(typeof(_klass.arrayEnd))&_vfuncArrayEndTramp;
        break;
      }
      case "array_start":
      {
        static extern(C) void _vfuncArrayStartTramp(JsonParser* parser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.arrayStart)
              return (cast(typeof(&_vfuncArrayStartTramp))_klass.arrayStart)(parser);
            return;
          }

          try
          {
            _obj.vfuncArrayStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncArrayStart");
          }
        }

        _klass.arrayStart = cast(typeof(_klass.arrayStart))&_vfuncArrayStartTramp;
        break;
      }
      case "error":
      {
        static extern(C) void _vfuncErrorTramp(JsonParser* parser, const(GError)* error) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.error)
              return (cast(typeof(&_vfuncErrorTramp))_klass.error)(parser, error);
            return;
          }

          try
          {
            _obj.vfuncError(error ? new gid.glib2.error.ErrorWrap(cast(void*)error, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncError");
          }
        }

        _klass.error = cast(typeof(_klass.error))&_vfuncErrorTramp;
        break;
      }
      case "object_end":
      {
        static extern(C) void _vfuncObjectEndTramp(JsonParser* parser, JsonObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.objectEnd)
              return (cast(typeof(&_vfuncObjectEndTramp))_klass.objectEnd)(parser, object);
            return;
          }

          auto _object = object ? new gid.json1.object.ObjectWrap(cast(void*)object, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncObjectEnd(_object);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncObjectEnd");
          }
          if (_object)
            _object._cUnborrow;

        }

        _klass.objectEnd = cast(typeof(_klass.objectEnd))&_vfuncObjectEndTramp;
        break;
      }
      case "object_member":
      {
        static extern(C) void _vfuncObjectMemberTramp(JsonParser* parser, JsonObject* object, const(char)* memberName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.objectMember)
              return (cast(typeof(&_vfuncObjectMemberTramp))_klass.objectMember)(parser, object, memberName);
            return;
          }

          auto _object = object ? new gid.json1.object.ObjectWrap(cast(void*)object, Yes.Take)._cBorrow : null;
          string _memberName = memberName.fromCString!(No.Free);

          try
          {
            _obj.vfuncObjectMember(_object, _memberName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncObjectMember");
          }
          if (_object)
            _object._cUnborrow;

        }

        _klass.objectMember = cast(typeof(_klass.objectMember))&_vfuncObjectMemberTramp;
        break;
      }
      case "object_start":
      {
        static extern(C) void _vfuncObjectStartTramp(JsonParser* parser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.objectStart)
              return (cast(typeof(&_vfuncObjectStartTramp))_klass.objectStart)(parser);
            return;
          }

          try
          {
            _obj.vfuncObjectStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncObjectStart");
          }
        }

        _klass.objectStart = cast(typeof(_klass.objectStart))&_vfuncObjectStartTramp;
        break;
      }
      case "parse_end":
      {
        static extern(C) void _vfuncParseEndTramp(JsonParser* parser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.parseEnd)
              return (cast(typeof(&_vfuncParseEndTramp))_klass.parseEnd)(parser);
            return;
          }

          try
          {
            _obj.vfuncParseEnd();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncParseEnd");
          }
        }

        _klass.parseEnd = cast(typeof(_klass.parseEnd))&_vfuncParseEndTramp;
        break;
      }
      case "parse_start":
      {
        static extern(C) void _vfuncParseStartTramp(JsonParser* parser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.json1.parser.Parser)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parser);
          if (!_obj)
          {
            auto _klass = cast(JsonParserClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parser);
            if (_klass.parseStart)
              return (cast(typeof(&_vfuncParseStartTramp))_klass.parseStart)(parser);
            return;
          }

          try
          {
            _obj.vfuncParseStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.parser.Parser.vfuncParseStart");
          }
        }

        _klass.parseStart = cast(typeof(_klass.parseStart))&_vfuncParseStartTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.json1.parser.Parser]
class ParserGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `immutable_` property.
      Params:
        propval = Whether the tree built by the parser should be immutable
          when created.
          
          Making the output immutable on creation avoids the expense
          of traversing it to make it immutable later.
      Returns: Builder instance for fluent chaining
  */
  T immutable_(bool propval) nothrow
  {
    return setProperty("immutable", propval);
  }

  /**
      Set `strict` property.
      Params:
        propval = Whether the parser should be strictly conforming to the
          JSON format, or allow custom extensions like comments.
      Returns: Builder instance for fluent chaining
  */
  T strict(bool propval) nothrow
  {
    return setProperty("strict", propval);
  }
}

/// Fluent builder for [gid.json1.parser.Parser]
final class ParserGidBuilder : ParserGidBuilderImpl!ParserGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Parser build() nothrow
  {
    return new Parser(cast(void*)createGObject(Parser._getGType), Yes.Take);
  }
}
