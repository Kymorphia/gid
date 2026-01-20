/// Module for [Editable] interface mixin
module gtk.editable_mixin;

public import gtk.editable_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The #GtkEditable interface is an interface which should be implemented by
    text editing widgets, such as #GtkEntry and #GtkSpinButton. It contains functions
    for generically manipulating an editable widget, a large number of action
    signals used for key bindings, and several signals that an application can
    connect to to modify the behavior of a widget.
    
    As an example of the latter usage, by connecting
    the following handler to #GtkEditable::insert-text, an application
    can convert all entry into a widget into uppercase.
    
    ## Forcing entry to uppercase.
    
    ```c
    #include <ctype.h>;
    
    void
    insert_text_handler (GtkEditable *editable,
                         const gchar *text,
                         gint         length,
                         gint        *position,
                         gpointer     data)
    {
      gchar *result = g_utf8_strup (text, length);
    
      g_signal_handlers_block_by_func (editable,
                                   (gpointer) insert_text_handler, data);
      gtk_editable_insert_text (editable, result, length, position);
      g_signal_handlers_unblock_by_func (editable,
                                         (gpointer) insert_text_handler, data);
    
      g_signal_stop_emission_by_name (editable, "insert_text");
    
      g_free (result);
    }
    ```
*/
template EditableT()
{

  /**
      Copies the contents of the currently selected content in the editable and
      puts it on the clipboard.
  */
  override void copyClipboard()
  {
    gtk_editable_copy_clipboard(cast(GtkEditable*)this._cPtr);
  }

  /**
      Removes the contents of the currently selected content in the editable and
      puts it on the clipboard.
  */
  override void cutClipboard()
  {
    gtk_editable_cut_clipboard(cast(GtkEditable*)this._cPtr);
  }

  /**
      Deletes the currently selected text of the editable.
      This call doesn’t do anything if there is no selected text.
  */
  override void deleteSelection()
  {
    gtk_editable_delete_selection(cast(GtkEditable*)this._cPtr);
  }

  /**
      Deletes a sequence of characters. The characters that are deleted are
      those characters at positions from start_pos up to, but not including
      end_pos. If end_pos is negative, then the characters deleted
      are those from start_pos to the end of the text.
      
      Note that the positions are specified in characters, not bytes.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void deleteText(int startPos, int endPos)
  {
    gtk_editable_delete_text(cast(GtkEditable*)this._cPtr, startPos, endPos);
  }

  /**
      Retrieves a sequence of characters. The characters that are retrieved
      are those characters at positions from start_pos up to, but not
      including end_pos. If end_pos is negative, then the characters
      retrieved are those characters from start_pos to the end of the text.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = start of text
        endPos = end of text
      Returns: a pointer to the contents of the widget as a
             string. This string is allocated by the #GtkEditable
             implementation and should be freed by the caller.
  */
  override string getChars(int startPos, int endPos)
  {
    char* _cretval;
    _cretval = gtk_editable_get_chars(cast(GtkEditable*)this._cPtr, startPos, endPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves whether editable is editable. See
      [gtk.editable.Editable.setEditable].
      Returns: true if editable is editable.
  */
  override bool getEditable()
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_get_editable(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current position of the cursor relative to the start
      of the content of the editable.
      
      Note that this position is in characters, not in bytes.
      Returns: the cursor position
  */
  override int getPosition()
  {
    int _retval;
    _retval = gtk_editable_get_position(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the selection bound of the editable. start_pos will be filled
      with the start of the selection and end_pos with end. If no text was
      selected both will be identical and false will be returned.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = location to store the starting position, or null
        endPos = location to store the end position, or null
      Returns: true if an area is selected, false otherwise
  */
  override bool getSelectionBounds(out int startPos, out int endPos)
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_get_selection_bounds(cast(GtkEditable*)this._cPtr, cast(int*)&startPos, cast(int*)&endPos);
    return _retval;
  }

  /**
      Inserts new_text_length bytes of new_text into the contents of the
      widget, at position position.
      
      Note that the position is in characters, not in bytes.
      The function updates position to point after the newly inserted text.
  
      Params:
        newText = the text to append
        newTextLength = the length of the text in bytes, or -1
        position = location of the position text will be inserted at
  */
  override void insertText(string newText, int newTextLength, ref int position)
  {
    const(char)* _newText = newText.toCString(No.Alloc);
    gtk_editable_insert_text(cast(GtkEditable*)this._cPtr, _newText, newTextLength, cast(int*)&position);
  }

  /**
      Pastes the content of the clipboard to the current position of the
      cursor in the editable.
  */
  override void pasteClipboard()
  {
    gtk_editable_paste_clipboard(cast(GtkEditable*)this._cPtr);
  }

  /**
      Selects a region of text. The characters that are selected are
      those characters at positions from start_pos up to, but not
      including end_pos. If end_pos is negative, then the
      characters selected are those characters from start_pos to
      the end of the text.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = start of region
        endPos = end of region
  */
  override void selectRegion(int startPos, int endPos)
  {
    gtk_editable_select_region(cast(GtkEditable*)this._cPtr, startPos, endPos);
  }

  /**
      Determines if the user can edit the text in the editable
      widget or not.
  
      Params:
        isEditable = true if the user is allowed to edit the text
            in the widget
  */
  override void setEditable(bool isEditable)
  {
    gtk_editable_set_editable(cast(GtkEditable*)this._cPtr, isEditable);
  }

  /**
      Sets the cursor position in the editable to the given value.
      
      The cursor is displayed before the character with the given (base 0)
      index in the contents of the editable. The value must be less than or
      equal to the number of characters in the editable. A value of -1
      indicates that the position should be set after the last character
      of the editable. Note that position is in characters, not in bytes.
  
      Params:
        position = the position of the cursor
  */
  override void setPosition(int position)
  {
    gtk_editable_set_position(cast(GtkEditable*)this._cPtr, position);
  }

  /**
      Connect to `Changed` signal.
  
      The ::changed signal is emitted at the end of a single
        user-visible operation on the contents of the #GtkEditable.
        
        E.g., a paste operation that replaces the contents of the
        selection will cause only one signal emission (even though it
        is implemented by first deleting the selection, then inserting
        the new content, and may cause multiple ::notify::text signals
        to be emitted).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.editable.Editable editable))
  
          `editable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.editable.Editable)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `DeleteText` signal.
  
      This signal is emitted when text is deleted from
        the widget by the user. The default handler for
        this signal will normally be responsible for deleting
        the text, so by connecting to this signal and then
        stopping the signal with [gobject.global.signalStopEmission], it
        is possible to modify the range of deleted text, or
        prevent it from being deleted entirely. The start_pos
        and end_pos parameters are interpreted as for
        [gtk.editable.Editable.deleteText].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int startPos, int endPos, gtk.editable.Editable editable))
  
          `startPos` the starting position (optional)
  
          `endPos` the end position (optional)
  
          `editable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.editable.Editable)))
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
    return connectSignalClosure("delete-text", closure, after);
  }
}
