/// Module for [ConsoleMessage] class
module webkitwebprocessextension.console_message;

import gid.gid;
import gobject.boxed;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;

/** */
class ConsoleMessage : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_console_message_get_type != &gidSymbolNotFound ? webkit_console_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConsoleMessage self()
  {
    return this;
  }

  /**
      Make a copy of console_message.
      Returns: A copy of passed in #WebKitConsoleMessage
  */
  webkitwebprocessextension.console_message.ConsoleMessage copy()
  {
    WebKitConsoleMessage* _cretval;
    _cretval = webkit_console_message_copy(cast(WebKitConsoleMessage*)this._cPtr);
    auto _retval = _cretval ? new webkitwebprocessextension.console_message.ConsoleMessage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the log level of a #WebKitConsoleMessage
      Returns: a #WebKitConsoleMessageLevel indicating the log level of console_message
  */
  webkitwebprocessextension.types.ConsoleMessageLevel getLevel()
  {
    WebKitConsoleMessageLevel _cretval;
    _cretval = webkit_console_message_get_level(cast(WebKitConsoleMessage*)this._cPtr);
    webkitwebprocessextension.types.ConsoleMessageLevel _retval = cast(webkitwebprocessextension.types.ConsoleMessageLevel)_cretval;
    return _retval;
  }

  /**
      Gets the line number of a #WebKitConsoleMessage
      Returns: the line number of console_message
  */
  uint getLine()
  {
    uint _retval;
    _retval = webkit_console_message_get_line(cast(WebKitConsoleMessage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the source of a #WebKitConsoleMessage
      Returns: a #WebKitConsoleMessageSource indicating the source of console_message
  */
  webkitwebprocessextension.types.ConsoleMessageSource getSource()
  {
    WebKitConsoleMessageSource _cretval;
    _cretval = webkit_console_message_get_source(cast(WebKitConsoleMessage*)this._cPtr);
    webkitwebprocessextension.types.ConsoleMessageSource _retval = cast(webkitwebprocessextension.types.ConsoleMessageSource)_cretval;
    return _retval;
  }

  /**
      Gets the source identifier of a #WebKitConsoleMessage
      Returns: the source identifier of console_message
  */
  string getSourceId()
  {
    const(char)* _cretval;
    _cretval = webkit_console_message_get_source_id(cast(WebKitConsoleMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the text message of a #WebKitConsoleMessage
      Returns: the text message of console_message
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = webkit_console_message_get_text(cast(WebKitConsoleMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
