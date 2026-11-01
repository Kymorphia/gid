/// Module for [ScriptMessageReply] class
module webkit.script_message_reply;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import javascriptcore.value;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A reply for a script message received.
    If no reply has been sent by the user, an automatically generated reply with
    undefined value with be sent.
*/
class ScriptMessageReply : gobject.boxed.BoxedWrap!(webkit_script_message_reply_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ScriptMessageReply self() nothrow
  {
    return this;
  }

  /**
      Reply to a script message with an error message.
  
      Params:
        errorMessage = An error message to return as specified by the user's script message
  */
  void returnErrorMessage(string errorMessage) nothrow
  {
    const(char)* _errorMessage = errorMessage.toCString!(No.Malloc, No.Nullable);
    webkit_script_message_reply_return_error_message(cast(WebKitScriptMessageReply*)this._cPtr, _errorMessage);
  }

  /**
      Reply to a script message with a value.
      
      This function can be called twice for passing the reply value in.
  
      Params:
        replyValue = Reply value of the provided script message
  */
  void returnValue(javascriptcore.value.Value replyValue) nothrow
  {
    webkit_script_message_reply_return_value(cast(WebKitScriptMessageReply*)this._cPtr, replyValue ? cast(JSCValue*)replyValue._cPtr(No.Dup) : null);
  }
}
