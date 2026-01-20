/// Module for [Generator] class
module json.generator;

import gid.gid;
import gio.cancellable;
import gio.output_stream;
import glib.error;
import glib.string_;
import gobject.object;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

/**
    [json.generator.Generator] provides an object for generating a JSON data stream
    from a tree of [json.node.Node] instances, and put it into a buffer
    or a file.
*/
class Generator : gobject.object.ObjectWrap
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
    return cast(void function())json_generator_get_type != &gidSymbolNotFound ? json_generator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Generator self()
  {
    return this;
  }

  /**
      Get `indent` property.
      Returns: Number of spaces to be used to indent when pretty printing.
  */
  @property uint indent()
  {
    return getIndent();
  }

  /**
      Set `indent` property.
      Params:
        propval = Number of spaces to be used to indent when pretty printing.
  */
  @property void indent(uint propval)
  {
    return setIndent(propval);
  }

  /**
      Get `indentChar` property.
      Returns: The character that should be used when indenting in pretty print.
  */
  @property uint indentChar()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("indent-char");
  }

  /**
      Set `indentChar` property.
      Params:
        propval = The character that should be used when indenting in pretty print.
  */
  @property void indentChar(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("indent-char", propval);
  }

  /**
      Get `pretty` property.
      Returns: Whether the output should be "pretty-printed", with indentation and
        newlines.
        
        The indentation level can be controlled by using the
        [json.generator.Generator.indent] property.
  */
  @property bool pretty()
  {
    return getPretty();
  }

  /**
      Set `pretty` property.
      Params:
        propval = Whether the output should be "pretty-printed", with indentation and
          newlines.
          
          The indentation level can be controlled by using the
          [json.generator.Generator.indent] property.
  */
  @property void pretty(bool propval)
  {
    return setPretty(propval);
  }

  /**
      Get `root` property.
      Returns: The root node to be used when constructing a JSON data
        stream.
  */
  @property json.node.Node root()
  {
    return getRoot();
  }

  /**
      Set `root` property.
      Params:
        propval = The root node to be used when constructing a JSON data
          stream.
  */
  @property void root(json.node.Node propval)
  {
    return setRoot(propval);
  }

  /**
      Creates a new [json.generator.Generator].
      
      You can use this object to generate a JSON data stream starting from a
      data object model composed by [json.node.Node]s.
      Returns: the newly created generator instance
  */
  this()
  {
    JsonGenerator* _cretval;
    _cretval = json_generator_new();
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the value set using [json.generator.Generator.setIndent].
      Returns: the number of repetitions per indentation level
  */
  uint getIndent()
  {
    uint _retval;
    _retval = json_generator_get_indent(cast(JsonGenerator*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value set using [json.generator.Generator.setIndentChar].
      Returns: the character to be used when indenting
  */
  dchar getIndentChar()
  {
    dchar _retval;
    _retval = json_generator_get_indent_char(cast(JsonGenerator*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value set using [json.generator.Generator.setPretty].
      Returns: `TRUE` if the generated JSON should be pretty-printed, and
          `FALSE` otherwise
  */
  bool getPretty()
  {
    bool _retval;
    _retval = cast(bool)json_generator_get_pretty(cast(JsonGenerator*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a pointer to the root node set using
      [json.generator.Generator.setRoot].
      Returns: the root node
  */
  json.node.Node getRoot()
  {
    JsonNode* _cretval;
    _cretval = json_generator_get_root(cast(JsonGenerator*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the number of repetitions for each indentation level.
  
      Params:
        indentLevel = the number of repetitions of the indentation character
            that should be applied when pretty printing
  */
  void setIndent(uint indentLevel)
  {
    json_generator_set_indent(cast(JsonGenerator*)this._cPtr, indentLevel);
  }

  /**
      Sets the character to be used when indenting.
  
      Params:
        indentChar = a Unicode character to be used when indenting
  */
  void setIndentChar(dchar indentChar)
  {
    json_generator_set_indent_char(cast(JsonGenerator*)this._cPtr, indentChar);
  }

  /**
      Sets whether the generated JSON should be pretty printed.
      
      Pretty printing will use indentation character specified in the
      [json.generator.Generator.indent] property and the spacing
      specified in the [json.generator.Generator.indent] property.
  
      Params:
        isPretty = whether the generated string should be pretty printed
  */
  void setPretty(bool isPretty)
  {
    json_generator_set_pretty(cast(JsonGenerator*)this._cPtr, isPretty);
  }

  /**
      Sets the root of the JSON data stream to be serialized by
      the given generator.
      
      The passed `node` is copied by the generator object, so it can be
      safely freed after calling this function.
  
      Params:
        node = the root node
  */
  void setRoot(json.node.Node node)
  {
    json_generator_set_root(cast(JsonGenerator*)this._cPtr, node ? cast(JsonNode*)node._cPtr(No.Dup) : null);
  }

  /**
      Generates a JSON data stream from generator and returns it as a
      buffer.
  
      Params:
        length = return location for the length of the returned
            buffer
      Returns: a newly allocated string holding a JSON data stream
  */
  string toData(out size_t length)
  {
    char* _cretval;
    _cretval = json_generator_to_data(cast(JsonGenerator*)this._cPtr, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a JSON data stream and puts it inside `filename`, overwriting
      the file's current contents.
      
      This operation is atomic, in the sense that the data is written to a
      temporary file which is then renamed to the given `filename`.
  
      Params:
        filename = the path to the target file
      Returns: true if saving was successful.
      Throws: [ErrorWrap]
  */
  bool toFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)json_generator_to_file(cast(JsonGenerator*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Generates a JSON data stream and appends it to the string buffer.
  
      Params:
        string_ = a string buffer
      Returns: the passed string, updated with
          the generated JSON data
  */
  glib.string_.String toGstring(glib.string_.String string_)
  {
    GString* _cretval;
    _cretval = json_generator_to_gstring(cast(JsonGenerator*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.string_.String(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Outputs JSON data and writes it (synchronously) to the given stream.
  
      Params:
        stream = the output stream used to write the JSON data
        cancellable = a [gio.cancellable.Cancellable]
      Returns: whether the write operation was successful
      Throws: [ErrorWrap]
  */
  bool toStream(gio.output_stream.OutputStream stream, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)json_generator_to_stream(cast(JsonGenerator*)this._cPtr, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
