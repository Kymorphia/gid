/// Module for [Scanner] class
module glib.scanner;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.scanner_config;
import glib.token_value;
import glib.types;

/**
    [glib.scanner.Scanner] provides a general-purpose lexical scanner.
    
    You should set @input_name after creating the scanner, since
    it is used by the default message handler when displaying
    warnings and errors. If you are scanning a file, the filename
    would be a good choice.
    
    The @user_data and @max_parse_errors fields are not used.
    If you need to associate extra data with the scanner you
    can place them here.
    
    If you want to use your own message handler you can set the
    @msg_handler field. The type of the message handler function
    is declared by #GScannerMsgFunc.
*/
class Scanner
{
  GScanner _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.scanner.Scanner");

    _cInstance = *cast(GScanner*)ptr;

    if (take)
      gFree(ptr);
  }

  ~this()
  {
    g_scanner_destroy(&_cInstance);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `maxParseErrors` field.
      Returns: unused
  */
  @property uint maxParseErrors()
  {
    return (cast(GScanner*)this._cPtr).maxParseErrors;
  }

  /**
      Set `maxParseErrors` field.
      Params:
        propval = unused
  */
  @property void maxParseErrors(uint propval)
  {
    (cast(GScanner*)this._cPtr).maxParseErrors = propval;
  }

  /**
      Get `parseErrors` field.
      Returns: [glib.scanner.Scanner.error] increments this field
  */
  @property uint parseErrors()
  {
    return (cast(GScanner*)this._cPtr).parseErrors;
  }

  /**
      Set `parseErrors` field.
      Params:
        propval = [glib.scanner.Scanner.error] increments this field
  */
  @property void parseErrors(uint propval)
  {
    (cast(GScanner*)this._cPtr).parseErrors = propval;
  }

  /**
      Get `inputName` field.
      Returns: name of input stream, featured by the default message handler
  */
  @property string inputName()
  {
    return cToD!(string)(cast(void*)(cast(GScanner*)this._cPtr).inputName);
  }

  /**
      Set `inputName` field.
      Params:
        propval = name of input stream, featured by the default message handler
  */
  @property void inputName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GScanner*)this._cPtr).inputName);
    dToC(propval, cast(void*)&(cast(GScanner*)this._cPtr).inputName);
  }

  /**
      Get `qdata` field.
      Returns: quarked data
  */
  @property glib.types.Data qdata()
  {
    return (cast(GScanner*)this._cPtr).qdata;
  }

  /**
      Get `config` field.
      Returns: link into the scanner configuration
  */
  @property glib.scanner_config.ScannerConfig config()
  {
    return new glib.scanner_config.ScannerConfig(cast(GScannerConfig*)(cast(GScanner*)this._cPtr).config, No.Take);
  }

  /**
      Get `token` field.
      Returns: token parsed by the last [glib.scanner.Scanner.getNextToken]
  */
  @property glib.types.TokenType token()
  {
    return cast(glib.types.TokenType)(cast(GScanner*)this._cPtr).token;
  }

  /**
      Set `token` field.
      Params:
        propval = token parsed by the last [glib.scanner.Scanner.getNextToken]
  */
  @property void token(glib.types.TokenType propval)
  {
    (cast(GScanner*)this._cPtr).token = cast(GTokenType)propval;
  }

  /**
      Get `value` field.
      Returns: value of the last token from [glib.scanner.Scanner.getNextToken]
  */
  @property glib.token_value.TokenValue value()
  {
    return new glib.token_value.TokenValue(cast(GTokenValue*)&(cast(GScanner*)this._cPtr).value, No.Take);
  }

  /**
      Get `line` field.
      Returns: line number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  @property uint line()
  {
    return (cast(GScanner*)this._cPtr).line;
  }

  /**
      Set `line` field.
      Params:
        propval = line number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  @property void line(uint propval)
  {
    (cast(GScanner*)this._cPtr).line = propval;
  }

  /**
      Get `position` field.
      Returns: char number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  @property uint position()
  {
    return (cast(GScanner*)this._cPtr).position;
  }

  /**
      Set `position` field.
      Params:
        propval = char number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  @property void position(uint propval)
  {
    (cast(GScanner*)this._cPtr).position = propval;
  }

  /**
      Get `nextToken` field.
      Returns: token parsed by the last [glib.scanner.Scanner.peekNextToken]
  */
  @property glib.types.TokenType nextToken()
  {
    return cast(glib.types.TokenType)(cast(GScanner*)this._cPtr).nextToken;
  }

  /**
      Set `nextToken` field.
      Params:
        propval = token parsed by the last [glib.scanner.Scanner.peekNextToken]
  */
  @property void nextToken(glib.types.TokenType propval)
  {
    (cast(GScanner*)this._cPtr).nextToken = cast(GTokenType)propval;
  }

  /**
      Get `nextValue` field.
      Returns: value of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  @property glib.token_value.TokenValue nextValue()
  {
    return new glib.token_value.TokenValue(cast(GTokenValue*)&(cast(GScanner*)this._cPtr).nextValue, No.Take);
  }

  /**
      Get `nextLine` field.
      Returns: line number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  @property uint nextLine()
  {
    return (cast(GScanner*)this._cPtr).nextLine;
  }

  /**
      Set `nextLine` field.
      Params:
        propval = line number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  @property void nextLine(uint propval)
  {
    (cast(GScanner*)this._cPtr).nextLine = propval;
  }

  /**
      Get `nextPosition` field.
      Returns: char number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  @property uint nextPosition()
  {
    return (cast(GScanner*)this._cPtr).nextPosition;
  }

  /**
      Set `nextPosition` field.
      Params:
        propval = char number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  @property void nextPosition(uint propval)
  {
    (cast(GScanner*)this._cPtr).nextPosition = propval;
  }

  /**
      Get `msgHandler` field.
      Returns: handler function for _warn and _error
  */
  @property GScannerMsgFunc msgHandler()
  {
    return (cast(GScanner*)this._cPtr).msgHandler;
  }

  /**
      Set `msgHandler` field.
      Params:
        propval = handler function for _warn and _error
  */

  @property void msgHandler(GScannerMsgFunc propval)
  {
    (cast(GScanner*)this._cPtr).msgHandler = propval;
  }

  /**
      Returns the current line in the input stream (counting
      from 1). This is the line of the last token parsed via
      [glib.scanner.Scanner.getNextToken].
      Returns: the current line
  */
  uint curLine()
  {
    uint _retval;
    _retval = g_scanner_cur_line(cast(GScanner*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current position in the current line (counting
      from 0). This is the position of the last token parsed via
      [glib.scanner.Scanner.getNextToken].
      Returns: the current position on the line
  */
  uint curPosition()
  {
    uint _retval;
    _retval = g_scanner_cur_position(cast(GScanner*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current token type. This is simply the token
      field in the #GScanner structure.
      Returns: the current token type
  */
  glib.types.TokenType curToken()
  {
    GTokenType _cretval;
    _cretval = g_scanner_cur_token(cast(GScanner*)this._cPtr);
    glib.types.TokenType _retval = cast(glib.types.TokenType)_cretval;
    return _retval;
  }

  /**
      Frees all memory used by the #GScanner.
  */
  void destroy()
  {
    g_scanner_destroy(cast(GScanner*)this._cPtr);
  }

  /**
      Returns true if the scanner has reached the end of
      the file or text buffer.
      Returns: true if the scanner has reached the end of
            the file or text buffer
  */
  bool eof()
  {
    bool _retval;
    _retval = cast(bool)g_scanner_eof(cast(GScanner*)this._cPtr);
    return _retval;
  }

  /**
      Parses the next token just like [glib.scanner.Scanner.peekNextToken]
      and also removes it from the input stream. The token data is
      placed in the token, value, line, and position fields of
      the #GScanner structure.
      Returns: the type of the token
  */
  glib.types.TokenType getNextToken()
  {
    GTokenType _cretval;
    _cretval = g_scanner_get_next_token(cast(GScanner*)this._cPtr);
    glib.types.TokenType _retval = cast(glib.types.TokenType)_cretval;
    return _retval;
  }

  /**
      Prepares to scan a file.
  
      Params:
        inputFd = a file descriptor
  */
  void inputFile(int inputFd)
  {
    g_scanner_input_file(cast(GScanner*)this._cPtr, inputFd);
  }

  /**
      Prepares to scan a text buffer.
  
      Params:
        text = the text buffer to scan
  */
  void inputText(string text)
  {
    uint _textLen;
    if (text)
      _textLen = cast(uint)text.length;

    auto _text = cast(const(char)*)text.ptr;
    g_scanner_input_text(cast(GScanner*)this._cPtr, _text, _textLen);
  }

  /**
      Looks up a symbol in the current scope and return its value.
      If the symbol is not bound in the current scope, null is
      returned.
  
      Params:
        symbol = the symbol to look up
      Returns: the value of symbol in the current scope, or null
            if symbol is not bound in the current scope
  */
  void* lookupSymbol(string symbol)
  {
    const(char)* _symbol = symbol.toCString(No.Alloc);
    auto _retval = g_scanner_lookup_symbol(cast(GScanner*)this._cPtr, _symbol);
    return _retval;
  }

  /**
      Parses the next token, without removing it from the input stream.
      The token data is placed in the next_token, next_value, next_line,
      and next_position fields of the #GScanner structure.
      
      Note that, while the token is not removed from the input stream
      (i.e. the next call to [glib.scanner.Scanner.getNextToken] will return the
      same token), it will not be reevaluated. This can lead to surprising
      results when changing scope or the scanner configuration after peeking
      the next token. Getting the next token after switching the scope or
      configuration will return whatever was peeked before, regardless of
      any symbols that may have been added or removed in the new scope.
      Returns: the type of the token
  */
  glib.types.TokenType peekNextToken()
  {
    GTokenType _cretval;
    _cretval = g_scanner_peek_next_token(cast(GScanner*)this._cPtr);
    glib.types.TokenType _retval = cast(glib.types.TokenType)_cretval;
    return _retval;
  }

  /**
      Adds a symbol to the given scope.
  
      Params:
        scopeId = the scope id
        symbol = the symbol to add
        value = the value of the symbol
  */
  void scopeAddSymbol(uint scopeId, string symbol, void* value = null)
  {
    const(char)* _symbol = symbol.toCString(No.Alloc);
    g_scanner_scope_add_symbol(cast(GScanner*)this._cPtr, scopeId, _symbol, value);
  }

  /**
      Calls the given function for each of the symbol/value pairs
      in the given scope of the #GScanner. The function is passed
      the symbol and value of each pair, and the given user_data
      parameter.
  
      Params:
        scopeId = the scope id
        func = the function to call for each symbol/value pair
  */
  void scopeForeachSymbol(uint scopeId, glib.types.HFunc func)
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData)
    {
      auto _dlg = cast(glib.types.HFunc*)userData;

      (*_dlg)(key, value);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_scanner_scope_foreach_symbol(cast(GScanner*)this._cPtr, scopeId, _funcCB, _func);
  }

  /**
      Looks up a symbol in a scope and return its value. If the
      symbol is not bound in the scope, null is returned.
  
      Params:
        scopeId = the scope id
        symbol = the symbol to look up
      Returns: the value of symbol in the given scope, or null
            if symbol is not bound in the given scope.
  */
  void* scopeLookupSymbol(uint scopeId, string symbol)
  {
    const(char)* _symbol = symbol.toCString(No.Alloc);
    auto _retval = g_scanner_scope_lookup_symbol(cast(GScanner*)this._cPtr, scopeId, _symbol);
    return _retval;
  }

  /**
      Removes a symbol from a scope.
  
      Params:
        scopeId = the scope id
        symbol = the symbol to remove
  */
  void scopeRemoveSymbol(uint scopeId, string symbol)
  {
    const(char)* _symbol = symbol.toCString(No.Alloc);
    g_scanner_scope_remove_symbol(cast(GScanner*)this._cPtr, scopeId, _symbol);
  }

  /**
      Sets the current scope.
  
      Params:
        scopeId = the new scope id
      Returns: the old scope id
  */
  uint setScope(uint scopeId)
  {
    uint _retval;
    _retval = g_scanner_set_scope(cast(GScanner*)this._cPtr, scopeId);
    return _retval;
  }

  /**
      Rewinds the filedescriptor to the current buffer position
      and blows the file read ahead buffer. This is useful for
      third party uses of the scanners filedescriptor, which hooks
      onto the current scanning position.
  */
  void syncFileOffset()
  {
    g_scanner_sync_file_offset(cast(GScanner*)this._cPtr);
  }

  /**
      Outputs a message through the scanner's msg_handler,
      resulting from an unexpected token in the input stream.
      Note that you should not call [glib.scanner.Scanner.peekNextToken]
      followed by [glib.scanner.Scanner.unexpToken] without an intermediate
      call to [glib.scanner.Scanner.getNextToken], as [glib.scanner.Scanner.unexpToken]
      evaluates the scanner's current token (not the peeked token)
      to construct part of the message.
  
      Params:
        expectedToken = the expected token
        identifierSpec = a string describing how the scanner's user
              refers to identifiers (null defaults to "identifier").
              This is used if expected_token is `G_TOKEN_IDENTIFIER` or
              `G_TOKEN_IDENTIFIER_NULL`.
        symbolSpec = a string describing how the scanner's user refers
              to symbols (null defaults to "symbol"). This is used if
              expected_token is `G_TOKEN_SYMBOL` or any token value greater
              than `G_TOKEN_LAST`.
        symbolName = the name of the symbol, if the scanner's current
              token is a symbol.
        message = a message string to output at the end of the
              warning/error, or null.
        isError = if true it is output as an error. If false it is
              output as a warning.
  */
  void unexpToken(glib.types.TokenType expectedToken, string identifierSpec, string symbolSpec, string symbolName, string message, int isError)
  {
    const(char)* _identifierSpec = identifierSpec.toCString(No.Alloc);
    const(char)* _symbolSpec = symbolSpec.toCString(No.Alloc);
    const(char)* _symbolName = symbolName.toCString(No.Alloc);
    const(char)* _message = message.toCString(No.Alloc);
    g_scanner_unexp_token(cast(GScanner*)this._cPtr, expectedToken, _identifierSpec, _symbolSpec, _symbolName, _message, isError);
  }
}
