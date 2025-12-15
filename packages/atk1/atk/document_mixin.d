/// Module for [Document] interface mixin
module atk.document_mixin;

public import atk.document_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;

/**
    The ATK interface which represents the toplevel
     container for document content.
    
    The AtkDocument interface should be supported by any object whose
    content is a representation or view of a document.  The AtkDocument
    interface should appear on the toplevel container for the document
    content; however AtkDocument instances may be nested (i.e. an
    AtkDocument may be a descendant of another AtkDocument) in those
    cases where one document contains "embedded content" which can
    reasonably be considered a document in its own right.
*/
template DocumentT()
{

  /**
      Retrieves the value of the given attribute_name inside document.
  
      Params:
        attributeName = a character string representing the name of the attribute
            whose value is being queried.
      Returns: a string value associated with the named
           attribute for this document, or null if a value for
           attribute_name has not been specified for this document.
  */
  override string getAttributeValue(string attributeName)
  {
    const(char)* _cretval;
    const(char)* _attributeName = attributeName.toCString(No.Alloc);
    _cretval = atk_document_get_attribute_value(cast(AtkDocument*)this._cPtr, _attributeName);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the current page number inside document.
      Returns: the current page number inside document, or -1 if
          not implemented, not know by the implementor, or irrelevant.
  */
  override int getCurrentPageNumber()
  {
    int _retval;
    _retval = atk_document_get_current_page_number(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [xlib.types.void*] that points to an instance of the DOM.  It is
      up to the caller to check atk_document_get_type to determine
      how to cast this pointer.
      Returns: a [xlib.types.void*] that points to an instance of the DOM.
  
      Deprecated: Since 2.12. document is already a representation of
        the document. Use it directly, or one of its children, as an
        instance of the DOM.
  */
  override void* getDocument()
  {
    auto _retval = atk_document_get_document(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Gets a string indicating the document type.
      Returns: a string indicating the document type
  
      Deprecated: Since 2.12. Please use [atk.document.Document.getAttributes] to
        ask for the document type if it applies.
  */
  override string getDocumentType()
  {
    const(char)* _cretval;
    _cretval = atk_document_get_document_type(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
               of the content of this document instance.  Individual
               text substrings or images within this document may have
               a different locale, see atk_text_get_attributes and
               atk_image_get_image_locale.
      Returns: a UTF-8 string indicating the POSIX-style LC_MESSAGES
                 locale of the document content as a whole, or NULL if
                 the document content does not specify a locale.
  
      Deprecated: Please use [atk.object.ObjectWrap.getObjectLocale] instead.
  */
  override string getLocale()
  {
    const(char)* _cretval;
    _cretval = atk_document_get_locale(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the total number of pages inside document.
      Returns: total page count of document, or -1 if not implemented,
          not know by the implementor or irrelevant.
  */
  override int getPageCount()
  {
    int _retval;
    _retval = atk_document_get_page_count(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Sets the value for the given attribute_name inside document.
  
      Params:
        attributeName = a character string representing the name of the attribute
            whose value is being set.
        attributeValue = a string value to be associated with attribute_name.
      Returns: true if attribute_value is successfully associated
          with attribute_name for this document, and false if if the
          document does not allow the attribute to be modified
  */
  override bool setAttributeValue(string attributeName, string attributeValue)
  {
    bool _retval;
    const(char)* _attributeName = attributeName.toCString(No.Alloc);
    const(char)* _attributeValue = attributeValue.toCString(No.Alloc);
    _retval = cast(bool)atk_document_set_attribute_value(cast(AtkDocument*)this._cPtr, _attributeName, _attributeValue);
    return _retval;
  }

  /**
      Connect to `DocumentAttributeChanged` signal.
  
      The "document-attribute-changed" signal should be emitted when there is a
      change to one of the document attributes returned by
      atk_document_get_attributes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string arg1, string arg2, atk.document.Document document))
  
          `arg1` the name of the attribute being modified, or null if not
                   available. (optional)
  
          `arg2` the attribute's new value, or null if not available. (optional)
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDocumentAttributeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.document.Document)))
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
    return connectSignalClosure("document-attribute-changed", closure, after);
  }

  /**
      Connect to `LoadComplete` signal.
  
      The 'load-complete' signal is emitted when a pending load of
      a static document has completed.  This signal is to be
      expected by ATK clients if and when AtkDocument implementors
      expose ATK_STATE_BUSY.  If the state of an AtkObject which
      implements AtkDocument does not include ATK_STATE_BUSY, it
      should be safe for clients to assume that the AtkDocument's
      static contents are fully loaded into the container.
      (Dynamic document contents should be exposed via other
      signals.)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.document.Document document))
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadComplete(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.document.Document)))
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
    return connectSignalClosure("load-complete", closure, after);
  }

  /**
      Connect to `LoadStopped` signal.
  
      The 'load-stopped' signal is emitted when a pending load of
      document contents is cancelled, paused, or otherwise
      interrupted by the user or application logic.  It should not
      however be emitted while waiting for a resource (for instance
      while blocking on a file or network read) unless a
      user-significant timeout has occurred.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.document.Document document))
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadStopped(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.document.Document)))
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
    return connectSignalClosure("load-stopped", closure, after);
  }

  /**
      Connect to `PageChanged` signal.
  
      The 'page-changed' signal is emitted when the current page of
      a document changes, e.g. pressing page up/down in a document
      viewer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int pageNumber, atk.document.Document document))
  
          `pageNumber` the new page number. If this value is unknown
          or not applicable, -1 should be provided. (optional)
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : atk.document.Document)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-changed", closure, after);
  }

  /**
      Connect to `Reload` signal.
  
      The 'reload' signal is emitted when the contents of a
      document is refreshed from its source.  Once 'reload' has
      been emitted, a matching 'load-complete' or 'load-stopped'
      signal should follow, which clients may await before
      interrogating ATK for the latest document content.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.document.Document document))
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReload(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.document.Document)))
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
    return connectSignalClosure("reload", closure, after);
  }
}
