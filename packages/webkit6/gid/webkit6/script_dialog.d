/// Module for [ScriptDialog] class
module gid.webkit6.script_dialog;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Carries details to be shown in user-facing dialogs.
*/
class ScriptDialog : gid.gobject2.boxed.BoxedWrap!(webkit_script_dialog_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ScriptDialog self() nothrow
  {
    return this;
  }

  /**
      Close dialog.
      
      When handling a #WebKitScriptDialog asynchronously ([gid.webkit6.script_dialog.ScriptDialog.ref_]
      was called in #WebKitWebView::script-dialog callback), this function needs to be called to notify
      that we are done with the script dialog. The dialog will be closed on destruction if this function
      hasn't been called before.
  */
  void close() nothrow
  {
    webkit_script_dialog_close(cast(WebKitScriptDialog*)this._cPtr);
  }

  /**
      Set whether the user confirmed the dialog.
      
      This method is used for [gid.webkit6.types.ScriptDialogType.Confirm] and [gid.webkit6.types.ScriptDialogType.BeforeUnloadConfirm] dialogs when
      #WebKitWebView::script-dialog signal is emitted to set whether the user
      confirmed the dialog or not. The default implementation of #WebKitWebView::script-dialog
      signal sets true when the OK or Stay buttons are clicked and false otherwise.
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [gid.webkit6.types.ScriptDialogType.Confirm] or [gid.webkit6.types.ScriptDialogType.BeforeUnloadConfirm]
  
      Params:
        confirmed = whether user confirmed the dialog
  */
  void confirmSetConfirmed(bool confirmed) nothrow
  {
    webkit_script_dialog_confirm_set_confirmed(cast(WebKitScriptDialog*)this._cPtr, confirmed);
  }

  /**
      Get the dialog type of a #WebKitScriptDialog.
      Returns: the #WebKitScriptDialogType of dialog
  */
  gid.webkit6.types.ScriptDialogType getDialogType() nothrow
  {
    WebKitScriptDialogType _cretval;
    _cretval = webkit_script_dialog_get_dialog_type(cast(WebKitScriptDialog*)this._cPtr);
    gid.webkit6.types.ScriptDialogType _retval = cast(gid.webkit6.types.ScriptDialogType)_cretval;
    return _retval;
  }

  /**
      Get the message of a #WebKitScriptDialog.
      Returns: the message of dialog.
  */
  string getMessage() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_script_dialog_get_message(cast(WebKitScriptDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the default text of a #WebKitScriptDialog of type [gid.webkit6.types.ScriptDialogType.Prompt].
      
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [gid.webkit6.types.ScriptDialogType.Prompt].
      Returns: the default text of dialog
  */
  string promptGetDefaultText() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_script_dialog_prompt_get_default_text(cast(WebKitScriptDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Set the text entered by the user in the dialog.
      
      This method is used for [gid.webkit6.types.ScriptDialogType.Prompt] dialogs when
      #WebKitWebView::script-dialog signal is emitted to set the text
      entered by the user. The default implementation of #WebKitWebView::script-dialog
      signal sets the text of the entry form when OK button is clicked, otherwise null is set.
      It's an error to use this method with a #WebKitScriptDialog that is not of type
      [gid.webkit6.types.ScriptDialogType.Prompt].
  
      Params:
        text = the text to set
  */
  void promptSetText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    webkit_script_dialog_prompt_set_text(cast(WebKitScriptDialog*)this._cPtr, _text);
  }
}
