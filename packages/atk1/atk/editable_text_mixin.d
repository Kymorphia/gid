/// Module for [EditableText] interface mixin
module atk.editable_text_mixin;

public import atk.editable_text_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;

/**
    The ATK interface implemented by components containing user-editable text content.
    
    #AtkEditableText should be implemented by UI components which
    contain text which the user can edit, via the #AtkObject
    corresponding to that component (see #AtkObject).
    
    #AtkEditableText is a subclass of #AtkText, and as such, an object
    which implements #AtkEditableText is by definition an #AtkText
    implementor as well.
    
    See `iface@AtkText`
*/
template EditableTextT()
{

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void copyText(int startPos, int endPos)
  {
    atk_editable_text_copy_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard and then delete from the widget.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void cutText(int startPos, int endPos)
  {
    atk_editable_text_cut_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Delete text start_pos up to, but not including end_pos.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void deleteText(int startPos, int endPos)
  {
    atk_editable_text_delete_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Insert text at a given position.
  
      Params:
        string_ = the text to insert
        position = The caller initializes this to
          the position at which to insert the text. After the call it
          points at the position after the newly inserted text.
  */
  override void insertText(string string_, ref int position)
  {
    int _length;
    if (string_)
      _length = cast(int)string_.length;

    auto _string_ = cast(const(char)*)string_.ptr;
    atk_editable_text_insert_text(cast(AtkEditableText*)this._cPtr, _string_, _length, cast(int*)&position);
  }

  /**
      Paste text from clipboard to specified position.
  
      Params:
        position = position to paste
  */
  override void pasteText(int position)
  {
    atk_editable_text_paste_text(cast(AtkEditableText*)this._cPtr, position);
  }

  /**
      Set text contents of text.
  
      Params:
        string_ = string to set for text contents of text
  */
  override void setTextContents(string string_)
  {
    const(char)* _string_ = string_.toCString(No.Alloc);
    atk_editable_text_set_text_contents(cast(AtkEditableText*)this._cPtr, _string_);
  }
}
