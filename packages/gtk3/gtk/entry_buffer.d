/// Module for [EntryBuffer] class
module gtk.entry_buffer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkEntryBuffer class contains the actual text displayed in a
    #GtkEntry widget.
    
    A single #GtkEntryBuffer object can be shared by multiple #GtkEntry
    widgets which will then share the same text content, but not the cursor
    position, visibility attributes, icon etc.
    
    #GtkEntryBuffer may be derived from. Such a derived class might allow
    text to be stored in an alternate location, such as non-pageable memory,
    useful in the case of important passwords. Or a derived class could
    integrate with an application’s concept of undo/redo.
*/
class EntryBuffer : gobject.object.ObjectWrap
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
    return cast(void function())gtk_entry_buffer_get_type != &gidSymbolNotFound ? gtk_entry_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryBuffer self()
  {
    return this;
  }

  /**
      Get `length` property.
      Returns: The length (in characters) of the text in buffer.
  */
  @property uint length()
  {
    return getLength();
  }

  /**
      Get `maxLength` property.
      Returns: The maximum length (in characters) of the text in the buffer.
  */
  @property int maxLength()
  {
    return getMaxLength();
  }

  /**
      Set `maxLength` property.
      Params:
        propval = The maximum length (in characters) of the text in the buffer.
  */
  @property void maxLength(int propval)
  {
    return setMaxLength(propval);
  }

  /**
      Get `text` property.
      Returns: The contents of the buffer.
  */
  @property string text()
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = The contents of the buffer.
  */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Create a new GtkEntryBuffer object.
      
      Optionally, specify initial text to set in the buffer.
  
      Params:
        initialChars = initial buffer text, or null
      Returns: A new GtkEntryBuffer object.
  */
  this(string initialChars = null)
  {
    GtkEntryBuffer* _cretval;
    int _nInitialChars;
    if (initialChars)
      _nInitialChars = cast(int)initialChars.length;

    auto _initialChars = cast(const(char)*)initialChars.ptr;
    _cretval = gtk_entry_buffer_new(_initialChars, _nInitialChars);
    this(_cretval, Yes.Take);
  }

  /**
      Deletes a sequence of characters from the buffer. n_chars characters are
      deleted starting at position. If n_chars is negative, then all characters
      until the end of the text are deleted.
      
      If position or n_chars are out of bounds, then they are coerced to sane
      values.
      
      Note that the positions are specified in characters, not bytes.
  
      Params:
        position = position at which to delete text
        nChars = number of characters to delete
      Returns: The number of characters deleted.
  */
  uint deleteText(uint position, int nChars)
  {
    uint _retval;
    _retval = gtk_entry_buffer_delete_text(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
    return _retval;
  }

  /**
      Used when subclassing #GtkEntryBuffer
  
      Params:
        position = position at which text was deleted
        nChars = number of characters deleted
  */
  void emitDeletedText(uint position, uint nChars)
  {
    gtk_entry_buffer_emit_deleted_text(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
  }

  /**
      Used when subclassing #GtkEntryBuffer
  
      Params:
        position = position at which text was inserted
        chars = text that was inserted
  */
  void emitInsertedText(uint position, string chars)
  {
    uint _nChars;
    if (chars)
      _nChars = cast(uint)chars.length;

    auto _chars = cast(const(char)*)chars.ptr;
    gtk_entry_buffer_emit_inserted_text(cast(GtkEntryBuffer*)this._cPtr, position, _chars, _nChars);
  }

  /**
      Retrieves the length in bytes of the buffer.
      See [gtk.entry_buffer.EntryBuffer.getLength].
      Returns: The byte length of the buffer.
  */
  size_t getBytes()
  {
    size_t _retval;
    _retval = gtk_entry_buffer_get_bytes(cast(GtkEntryBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the length in characters of the buffer.
      Returns: The number of characters in the buffer.
  */
  uint getLength()
  {
    uint _retval;
    _retval = gtk_entry_buffer_get_length(cast(GtkEntryBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum allowed length of the text in
      buffer. See [gtk.entry_buffer.EntryBuffer.setMaxLength].
      Returns: the maximum allowed number of characters
                      in #GtkEntryBuffer, or 0 if there is no maximum.
  */
  int getMaxLength()
  {
    int _retval;
    _retval = gtk_entry_buffer_get_max_length(cast(GtkEntryBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the contents of the buffer.
      
      The memory pointer returned by this call will not change
      unless this object emits a signal, or is finalized.
      Returns: a pointer to the contents of the widget as a
             string. This string points to internally allocated
             storage in the buffer and must not be freed, modified or
             stored.
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_entry_buffer_get_text(cast(GtkEntryBuffer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Inserts n_chars characters of chars into the contents of the
      buffer, at position position.
      
      If n_chars is negative, then characters from chars will be inserted
      until a null-terminator is found. If position or n_chars are out of
      bounds, or the maximum buffer text length is exceeded, then they are
      coerced to sane values.
      
      Note that the position and length are in characters, not in bytes.
  
      Params:
        position = the position at which to insert text.
        chars = the text to insert into the buffer.
      Returns: The number of characters actually inserted.
  */
  uint insertText(uint position, string chars)
  {
    uint _retval;
    int _nChars;
    if (chars)
      _nChars = cast(int)chars.length;

    auto _chars = cast(const(char)*)chars.ptr;
    _retval = gtk_entry_buffer_insert_text(cast(GtkEntryBuffer*)this._cPtr, position, _chars, _nChars);
    return _retval;
  }

  /**
      Sets the maximum allowed length of the contents of the buffer. If
      the current contents are longer than the given length, then they
      will be truncated to fit.
  
      Params:
        maxLength = the maximum length of the entry buffer, or 0 for no maximum.
            (other than the maximum length of entries.) The value passed in will
            be clamped to the range 0-65536.
  */
  void setMaxLength(int maxLength)
  {
    gtk_entry_buffer_set_max_length(cast(GtkEntryBuffer*)this._cPtr, maxLength);
  }

  /**
      Sets the text in the buffer.
      
      This is roughly equivalent to calling [gtk.entry_buffer.EntryBuffer.deleteText]
      and [gtk.entry_buffer.EntryBuffer.insertText].
      
      Note that n_chars is in characters, not in bytes.
  
      Params:
        chars = the new text
  */
  void setText(string chars)
  {
    int _nChars;
    if (chars)
      _nChars = cast(int)chars.length;

    auto _chars = cast(const(char)*)chars.ptr;
    gtk_entry_buffer_set_text(cast(GtkEntryBuffer*)this._cPtr, _chars, _nChars);
  }

  /**
      Connect to `DeletedText` signal.
  
      This signal is emitted after text is deleted from the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, uint nChars, gtk.entry_buffer.EntryBuffer entryBuffer))
  
          `position` the position the text was deleted at. (optional)
  
          `nChars` The number of characters that were deleted. (optional)
  
          `entryBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeletedText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry_buffer.EntryBuffer)))
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
    return connectSignalClosure("deleted-text", closure, after);
  }

  /**
      Connect to `InsertedText` signal.
  
      This signal is emitted after text is inserted into the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, char[] chars, gtk.entry_buffer.EntryBuffer entryBuffer))
  
          `position` the position the text was inserted at. (optional)
  
          `chars` The text that was inserted. (optional)
  
          `entryBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertedText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == char[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry_buffer.EntryBuffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      auto nChars = getVal!(uint)(&_paramVals[3]);
      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);


      static if (Parameters!T.length > 1)
      {
        auto _cArray = getVal!(char**)(&_paramVals[2]);
        char[] _dArray;
        _dArray = cast(char[])_cArray[0 .. nChars];
        _paramTuple[1] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("inserted-text", closure, after);
  }
}
