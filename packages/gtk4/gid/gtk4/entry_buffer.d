/// Module for [EntryBuffer] class
module gid.gtk4.entry_buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Holds the text that is displayed in a single-line text entry widget.
    
    A single [gid.gtk4.entry_buffer.EntryBuffer] object can be shared by multiple widgets
    which will then share the same text content, but not the cursor
    position, visibility attributes, icon etc.
    
    [gid.gtk4.entry_buffer.EntryBuffer] may be derived from. Such a derived class might allow
    text to be stored in an alternate location, such as non-pageable memory,
    useful in the case of important passwords. Or a derived class could
    integrate with an application’s concept of undo/redo.
*/
class EntryBuffer : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_entry_buffer_get_type != &gidSymbolNotFound ? gtk_entry_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEntryBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryBuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.entry_buffer.EntryBuffer]
      Returns: New builder object
  */
  static EntryBufferGidBuilder builder() nothrow
  {
    return new EntryBufferGidBuilder;
  }

  /**
      Get `length` property.
      Returns: The length (in characters) of the text in buffer.
  */
  @property uint length() nothrow
  {
    return getLength();
  }

  /**
      Get `maxLength` property.
      Returns: The maximum length (in characters) of the text in the buffer.
  */
  @property int maxLength() nothrow
  {
    return getMaxLength();
  }

  /**
      Set `maxLength` property.
      Params:
        propval = The maximum length (in characters) of the text in the buffer.
  */
  @property void maxLength(int propval) nothrow
  {
    setMaxLength(propval);
  }

  /**
      Get `text` property.
      Returns: The contents of the buffer.
  */
  @property string text() nothrow
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = The contents of the buffer.
  */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Create a new [gid.gtk4.entry_buffer.EntryBuffer] object.
      
      Optionally, specify initial text to set in the buffer.
  
      Params:
        initialChars = initial buffer text
      Returns: A new [gid.gtk4.entry_buffer.EntryBuffer] object.
  */
  this(string initialChars = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, initialChars !is null), Yes.Take);
    }
    else
    {
      GtkEntryBuffer* _cretval;
      int _nInitialChars;
      if (initialChars)
        _nInitialChars = cast(int)initialChars.length;

      auto _initialChars = cast(char*)initialChars.ptr;
      _cretval = gtk_entry_buffer_new(_initialChars, _nInitialChars);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Deletes a sequence of characters from the buffer.
      
      n_chars characters are deleted starting at position.
      If n_chars is negative, then all characters until the
      end of the text are deleted.
      
      If position or n_chars are out of bounds, then they
      are coerced to sane values.
      
      Note that the positions are specified in characters,
      not bytes.
  
      Params:
        position = position at which to delete text
        nChars = number of characters to delete
      Returns: The number of characters deleted.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteText` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncDeleteText(uint position, uint nChars)
  {
    auto _klass = cast(GtkEntryBufferClass*)_vfuncClass;
    if (!_klass.deleteText)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.deleteText(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
    return _retval;
  }

  /** */
  protected void vfuncDeletedText(uint position, uint nChars)
  {
    auto _klass = cast(GtkEntryBufferClass*)_vfuncClass;
    if (!_klass.deletedText)
      return;

    _klass.deletedText(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
  }

  /**
      Retrieves the length in characters of the buffer.
      Returns: The number of characters in the buffer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLength` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncGetLength()
  {
    auto _klass = cast(GtkEntryBufferClass*)_vfuncClass;
    if (!_klass.getLength)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getLength(cast(GtkEntryBuffer*)this._cPtr);
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
        nChars = the length of the text in characters, or -1
      Returns: The number of characters actually inserted.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertText` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncInsertText(uint position, string chars, uint nChars)
  {
    auto _klass = cast(GtkEntryBufferClass*)_vfuncClass;
    if (!_klass.insertText)
      return typeof(return).init;

    uint _retval;
    const(char)* _chars = chars.toCString!(No.Malloc, No.Nullable);
    _retval = _klass.insertText(cast(GtkEntryBuffer*)this._cPtr, position, _chars, nChars);
    return _retval;
  }

  /** */
  protected void vfuncInsertedText(uint position, string chars, uint nChars)
  {
    auto _klass = cast(GtkEntryBufferClass*)_vfuncClass;
    if (!_klass.insertedText)
      return;

    const(char)* _chars = chars.toCString!(No.Malloc, No.Nullable);
    _klass.insertedText(cast(GtkEntryBuffer*)this._cPtr, position, _chars, nChars);
  }

  /**
      Deletes a sequence of characters from the buffer.
      
      n_chars characters are deleted starting at position.
      If n_chars is negative, then all characters until the
      end of the text are deleted.
      
      If position or n_chars are out of bounds, then they
      are coerced to sane values.
      
      Note that the positions are specified in characters,
      not bytes.
  
      Params:
        position = position at which to delete text
        nChars = number of characters to delete
      Returns: The number of characters deleted.
  */
  uint deleteText(uint position, int nChars) nothrow
  {
    uint _retval;
    _retval = gtk_entry_buffer_delete_text(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
    return _retval;
  }

  /**
      Used when subclassing [gid.gtk4.entry_buffer.EntryBuffer].
  
      Params:
        position = position at which text was deleted
        nChars = number of characters deleted
  */
  void emitDeletedText(uint position, uint nChars) nothrow
  {
    gtk_entry_buffer_emit_deleted_text(cast(GtkEntryBuffer*)this._cPtr, position, nChars);
  }

  /**
      Used when subclassing [gid.gtk4.entry_buffer.EntryBuffer].
  
      Params:
        position = position at which text was inserted
        chars = text that was inserted
  */
  void emitInsertedText(uint position, string chars) nothrow
  {
    uint _nChars;
    if (chars)
      _nChars = cast(uint)chars.length;

    auto _chars = cast(char*)chars.ptr;
    gtk_entry_buffer_emit_inserted_text(cast(GtkEntryBuffer*)this._cPtr, position, _chars, _nChars);
  }

  /**
      Retrieves the length in bytes of the buffer.
      
      See [gid.gtk4.entry_buffer.EntryBuffer.getLength].
      Returns: The byte length of the buffer.
  */
  size_t getBytes() nothrow
  {
    size_t _retval;
    _retval = gtk_entry_buffer_get_bytes(cast(GtkEntryBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the length in characters of the buffer.
      Returns: The number of characters in the buffer.
  */
  uint getLength() nothrow
  {
    uint _retval;
    _retval = gtk_entry_buffer_get_length(cast(GtkEntryBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum allowed length of the text in buffer.
      Returns: the maximum allowed number of characters
          in [gid.gtk4.entry_buffer.EntryBuffer], or 0 if there is no maximum.
  */
  int getMaxLength() nothrow
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
          string. This string points to internally allocated storage
          in the buffer and must not be freed, modified or stored.
  */
  string getText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_entry_buffer_get_text(cast(GtkEntryBuffer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  uint insertText(uint position, string chars) nothrow
  {
    uint _retval;
    int _nChars;
    if (chars)
      _nChars = cast(int)chars.length;

    auto _chars = cast(char*)chars.ptr;
    _retval = gtk_entry_buffer_insert_text(cast(GtkEntryBuffer*)this._cPtr, position, _chars, _nChars);
    return _retval;
  }

  /**
      Sets the maximum allowed length of the contents of the buffer.
      
      If the current contents are longer than the given length, then
      they will be truncated to fit.
  
      Params:
        maxLength = the maximum length of the entry buffer, or 0 for no maximum.
            (other than the maximum length of entries.) The value passed in will
            be clamped to the range 0-65536.
  */
  void setMaxLength(int maxLength) nothrow
  {
    gtk_entry_buffer_set_max_length(cast(GtkEntryBuffer*)this._cPtr, maxLength);
  }

  /**
      Sets the text in the buffer.
      
      This is roughly equivalent to calling
      [gid.gtk4.entry_buffer.EntryBuffer.deleteText] and
      [gid.gtk4.entry_buffer.EntryBuffer.insertText].
      
      Note that n_chars is in characters, not in bytes.
  
      Params:
        chars = the new text
  */
  void setText(string chars) nothrow
  {
    int _nChars;
    if (chars)
      _nChars = cast(int)chars.length;

    auto _chars = cast(char*)chars.ptr;
    gtk_entry_buffer_set_text(cast(GtkEntryBuffer*)this._cPtr, _chars, _nChars);
  }

  /**
      Connect to `DeletedText` signal.
  
      The text is altered in the default handler for this signal.
        
        If you want access to the text after the text has been modified,
        use [gid.gobject2.types.ConnectFlags.After].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, uint nChars, gid.gtk4.entry_buffer.EntryBuffer entryBuffer)`
  
          `position` the position the text was deleted at. (optional)
  
          `nChars` The number of characters that were deleted. (optional)
  
          `entryBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeletedText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.entry_buffer.EntryBuffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.deletedText");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deleted-text", closure, after);
  }

  /**
      Connect to `InsertedText` signal.
  
      This signal is emitted after text is inserted into the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, string chars, gid.gtk4.entry_buffer.EntryBuffer entryBuffer)`
  
          `position` the position the text was inserted at. (optional)
  
          `chars` The text that was inserted. (optional)
  
          `entryBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertedText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.entry_buffer.EntryBuffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);
      auto nChars = getVal!(uint)(&_paramVals[3]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getStringWithLength(&_paramVals[2], nChars);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.insertedText");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("inserted-text", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from EntryBuffer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.entry_buffer.EntryBuffer), T.stringof ~ " is not derived from gid.gtk4.entry_buffer.EntryBuffer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteText", true)[0]) == gid.gtk4.entry_buffer.EntryBuffer))
      _installVfunc(klass, "delete_text");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeletedText", true)[0]) == gid.gtk4.entry_buffer.EntryBuffer))
      _installVfunc(klass, "deleted_text");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLength", true)[0]) == gid.gtk4.entry_buffer.EntryBuffer))
      _installVfunc(klass, "get_length");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertText", true)[0]) == gid.gtk4.entry_buffer.EntryBuffer))
      _installVfunc(klass, "insert_text");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertedText", true)[0]) == gid.gtk4.entry_buffer.EntryBuffer))
      _installVfunc(klass, "inserted_text");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkEntryBufferClass*)klass;

    switch (vfunc)
    {
      case "delete_text":
      {
        static extern(C) uint _vfuncDeleteTextTramp(GtkEntryBuffer* buffer, uint position, uint nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.entry_buffer.EntryBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.deleteText)
              return (cast(typeof(&_vfuncDeleteTextTramp))_klass.deleteText)(buffer, position, nChars);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncDeleteText(position, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.vfuncDeleteText");
          }
          return _retval;
        }

        _klass.deleteText = cast(typeof(_klass.deleteText))&_vfuncDeleteTextTramp;
        break;
      }
      case "deleted_text":
      {
        static extern(C) void _vfuncDeletedTextTramp(GtkEntryBuffer* buffer, uint position, uint nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.entry_buffer.EntryBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.deletedText)
              return (cast(typeof(&_vfuncDeletedTextTramp))_klass.deletedText)(buffer, position, nChars);
            return;
          }

          try
          {
            _obj.vfuncDeletedText(position, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.vfuncDeletedText");
          }
        }

        _klass.deletedText = cast(typeof(_klass.deletedText))&_vfuncDeletedTextTramp;
        break;
      }
      case "get_length":
      {
        static extern(C) uint _vfuncGetLengthTramp(GtkEntryBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.entry_buffer.EntryBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.getLength)
              return (cast(typeof(&_vfuncGetLengthTramp))_klass.getLength)(buffer);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetLength();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.vfuncGetLength");
          }
          return _retval;
        }

        _klass.getLength = cast(typeof(_klass.getLength))&_vfuncGetLengthTramp;
        break;
      }
      case "insert_text":
      {
        static extern(C) uint _vfuncInsertTextTramp(GtkEntryBuffer* buffer, uint position, const(char)* chars, uint nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.entry_buffer.EntryBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.insertText)
              return (cast(typeof(&_vfuncInsertTextTramp))_klass.insertText)(buffer, position, chars, nChars);
            return typeof(return).init;
          }

          uint _retval;
          string _chars = chars.fromCString!(No.Free);

          try
          {
            _retval = _obj.vfuncInsertText(position, _chars, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.vfuncInsertText");
          }
          return _retval;
        }

        _klass.insertText = cast(typeof(_klass.insertText))&_vfuncInsertTextTramp;
        break;
      }
      case "inserted_text":
      {
        static extern(C) void _vfuncInsertedTextTramp(GtkEntryBuffer* buffer, uint position, const(char)* chars, uint nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.entry_buffer.EntryBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.insertedText)
              return (cast(typeof(&_vfuncInsertedTextTramp))_klass.insertedText)(buffer, position, chars, nChars);
            return;
          }

          string _chars = chars.fromCString!(No.Free);

          try
          {
            _obj.vfuncInsertedText(position, _chars, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.entry_buffer.EntryBuffer.vfuncInsertedText");
          }
        }

        _klass.insertedText = cast(typeof(_klass.insertedText))&_vfuncInsertedTextTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.entry_buffer.EntryBuffer]
class EntryBufferGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `maxLength` property.
      Params:
        propval = The maximum length (in characters) of the text in the buffer.
      Returns: Builder instance for fluent chaining
  */
  T maxLength(int propval) nothrow
  {
    return setProperty("max-length", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The contents of the buffer.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }
}

/// Fluent builder for [gid.gtk4.entry_buffer.EntryBuffer]
final class EntryBufferGidBuilder : EntryBufferGidBuilderImpl!EntryBufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EntryBuffer build() nothrow
  {
    return new EntryBuffer(cast(void*)createGObject(EntryBuffer._getGType), Yes.Take);
  }
}
