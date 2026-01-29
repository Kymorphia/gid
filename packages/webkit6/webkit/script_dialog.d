/// Module for [ScriptDialog] class
module webkit.script_dialog;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Carries details to be shown in user-facing dialogs.
*/
class ScriptDialog : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_script_dialog_get_type != &gidSymbolNotFound ? webkit_script_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScriptDialog self()
  {
    return this;
  }

  /**
      Close dialog.
      
      When handling a #WebKitScriptDialog asynchronously ([webkit.script_dialog.ScriptDialog.ref_]
      was called in #WebKitWebView::script-dialog callback), this function needs to be called to notify
      that we are done with the script dialog. The dialog will be closed on destruction if this function
      hasn't been called before.
  */
  void close()
  {
    webkit_script_dialog_close(cast(WebKitScriptDialog*)this._cPtr);
  }

  /**
      Set whether the user confirmed the dialog.
      
      This method is used for [webkit.types.ScriptDialogType.Confirm] and [webkit.types.ScriptDialogType.BeforeUnloadConfirm] dialogs when
      #WebKitWebView::script-dialog signal is emitted to set whether the user
      confirmed the dialog or not. The default implementation of #WebKitWebView::script-dialog
      signal sets true when the OK or Stay buttons are clicked and false otherwise.
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [webkit.types.ScriptDialogType.Confirm] or [webkit.types.ScriptDialogType.BeforeUnloadConfirm]
  
      Params:
        confirmed = whether user confirmed the dialog
  */
  void confirmSetConfirmed(bool confirmed)
  {
    webkit_script_dialog_confirm_set_confirmed(cast(WebKitScriptDialog*)this._cPtr, confirmed);
  }

  /**
      Get the dialog type of a #WebKitScriptDialog.
      Returns: the #WebKitScriptDialogType of dialog
  */
  webkit.types.ScriptDialogType getDialogType()
  {
    WebKitScriptDialogType _cretval;
    _cretval = webkit_script_dialog_get_dialog_type(cast(WebKitScriptDialog*)this._cPtr);
    webkit.types.ScriptDialogType _retval = cast(webkit.types.ScriptDialogType)_cretval;
    return _retval;
  }

  /**
      Get the message of a #WebKitScriptDialog.
      Returns: the message of dialog.
  */
  string getMessage()
  {
    const(char)* _cretval;
    _cretval = webkit_script_dialog_get_message(cast(WebKitScriptDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the default text of a #WebKitScriptDialog of type [webkit.types.ScriptDialogType.Prompt].
      
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [webkit.types.ScriptDialogType.Prompt].
      Returns: the default text of dialog
  */
  string promptGetDefaultText()
  {
    const(char)* _cretval;
    _cretval = webkit_script_dialog_prompt_get_default_text(cast(WebKitScriptDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the text entered by the user in the dialog.
      
      This method is used for [webkit.types.ScriptDialogType.Prompt] dialogs when
      #WebKitWebView::script-dialog signal is emitted to set the text
      entered by the user. The default implementation of #WebKitWebView::script-dialog
      signal sets the text of the entry form when OK button is clicked, otherwise null is set.
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [webkit.types.ScriptDialogType.Prompt].
  
      Params:
        text = the text to set
  */
  void promptSetText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    webkit_script_dialog_prompt_set_text(cast(WebKitScriptDialog*)this._cPtr, _text);
  }
}
