/// Module for [Parser] class
module gmime.parser;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.message;
import gmime.object;
import gmime.parser_options;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A MIME parser context.
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
    return cast(void function())g_mime_parser_get_type != &gidSymbolNotFound ? g_mime_parser_get_type() : cast(GType)0;
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
      Creates a new parser object.
      Returns: a new parser object.
  */
  this()
  {
    GMimeParser* _cretval;
    _cretval = g_mime_parser_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new parser object preset to parse stream.
  
      Params:
        stream = raw message or part stream
      Returns: a new parser object.
  */
  static gmime.parser.Parser newWithStream(gmime.stream.Stream stream)
  {
    GMimeParser* _cretval;
    _cretval = g_mime_parser_new_with_stream(stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.parser.Parser)(cast(GMimeParser*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Constructs a MIME message from parser.
  
      Params:
        options = a #GMimeParserOptions or null
      Returns: a MIME message or null on fail.
  */
  gmime.message.Message constructMessage(gmime.parser_options.ParserOptions options = null)
  {
    GMimeMessage* _cretval;
    _cretval = g_mime_parser_construct_message(cast(GMimeParser*)this._cPtr, options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.message.Message)(cast(GMimeMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Constructs a MIME part from parser.
  
      Params:
        options = a #GMimeParserOptions or null
      Returns: a MIME part based on parser or null on
        fail.
  */
  gmime.object.ObjectWrap constructPart(gmime.parser_options.ParserOptions options = null)
  {
    GMimeObject* _cretval;
    _cretval = g_mime_parser_construct_part(cast(GMimeParser*)this._cPtr, options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tests the end-of-stream indicator for parser's internal stream.
      Returns: true on EOS or false otherwise.
  */
  bool eos()
  {
    bool _retval;
    _retval = cast(bool)g_mime_parser_eos(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the format that the parser is set to parse.
      Returns: the format that the parser is set to parse.
  */
  gmime.types.Format getFormat()
  {
    GMimeFormat _cretval;
    _cretval = g_mime_parser_get_format(cast(GMimeParser*)this._cPtr);
    gmime.types.Format _retval = cast(gmime.types.Format)_cretval;
    return _retval;
  }

  /**
      Gets the stream offset of the beginning of the headers of the most
      recently parsed message.
      Returns: the offset of the beginning of the headers of the most
        recently parsed message or %-1 on error.
  */
  long getHeadersBegin()
  {
    long _retval;
    _retval = g_mime_parser_get_headers_begin(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stream offset of the end of the headers of the most
      recently parsed message.
      Returns: the offset of the end of the headers of the most recently
        parsed message or %-1 on error.
  */
  long getHeadersEnd()
  {
    long _retval;
    _retval = g_mime_parser_get_headers_end(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the mbox-style From-line of the most recently parsed message
      (gotten from [gmime.parser.Parser.constructMessage]).
      Returns: the mbox-style From-line of the most recently parsed
        message or null on error.
  */
  string getMboxMarker()
  {
    char* _cretval;
    _cretval = g_mime_parser_get_mbox_marker(cast(GMimeParser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the offset of the most recently parsed mbox-style From-line
      (gotten from [gmime.parser.Parser.constructMessage]).
      Returns: the offset of the most recently parsed mbox-style From-line
        or %-1 on error.
  */
  long getMboxMarkerOffset()
  {
    long _retval;
    _retval = g_mime_parser_get_mbox_marker_offset(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether or not the underlying stream is persistent.
      Returns: true if the parser will leave the content on disk or
        false if it will load the content into memory.
  */
  bool getPersistStream()
  {
    bool _retval;
    _retval = cast(bool)g_mime_parser_get_persist_stream(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether or not parser is set to use Content-Length for
      determining the offset of the end of the message.
      Returns: whether or not parser is set to use Content-Length for
        determining the offset of the end of the message.
  */
  bool getRespectContentLength()
  {
    bool _retval;
    _retval = cast(bool)g_mime_parser_get_respect_content_length(cast(GMimeParser*)this._cPtr);
    return _retval;
  }

  /**
      Initializes parser to use stream.
      
      WARNING: Initializing a parser with a stream is comparable to
      selling your soul (stream) to the devil (parser). You are
      basically giving the parser complete control of the stream, this
      means that you had better not touch the stream so long as the
      parser is still using it. This means no reading, writing, seeking,
      or resetting of the stream. Anything that will/could change the
      current stream's offset is PROHIBITED.
      
      It is also recommended that you not use [gmime.stream.Stream.tell]
      because it will not necessarily give you the current parser offset
      since parser handles its own internal read-ahead buffer. Instead,
      it is recommended that you use [gmime.parser.Parser.tell] if you have a
      reason to need the current offset of the parser.
  
      Params:
        stream = raw message or part stream
  */
  void initWithStream(gmime.stream.Stream stream)
  {
    g_mime_parser_init_with_stream(cast(GMimeParser*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Sets the format that the parser should expect the stream to be in.
  
      Params:
        format = a #GMimeFormat
  */
  void setFormat(gmime.types.Format format)
  {
    g_mime_parser_set_format(cast(GMimeParser*)this._cPtr, format);
  }

  /**
      Sets whether or not the parser's underlying stream is persistent.
      
      If persist is true, the parser will attempt to construct
      messages/parts whose content will remain on disk rather than being
      loaded into memory so as to reduce memory usage. This is the default.
      
      If persist is false, the parser will always load message content
      into memory.
      
      Note: This attribute only serves as a hint to the parser. If the
      underlying stream does not support seeking, then this attribute
      will be ignored.
      
      By default, this feature is enabled if the underlying stream is seekable.
  
      Params:
        persist = persist attribute
  */
  void setPersistStream(bool persist)
  {
    g_mime_parser_set_persist_stream(cast(GMimeParser*)this._cPtr, persist);
  }

  /**
      Sets whether or not parser should respect Content-Length headers
      when deciding where to look for the start of the next message. Only
      used when the parser is also set to scan for From-lines.
      
      Most notably useful when parsing broken Solaris mbox files (See
      http://www.jwz.org/doc/content-length.html for details).
      
      By default, this feature is disabled.
  
      Params:
        respectContentLength = true if the parser should use Content-Length headers or false otherwise.
  */
  void setRespectContentLength(bool respectContentLength)
  {
    g_mime_parser_set_respect_content_length(cast(GMimeParser*)this._cPtr, respectContentLength);
  }

  /**
      Gets the current stream offset from the parser's internal stream.
      Returns: the current stream offset from the parser's internal stream
        or %-1 on error.
  */
  long tell()
  {
    long _retval;
    _retval = g_mime_parser_tell(cast(GMimeParser*)this._cPtr);
    return _retval;
  }
}
