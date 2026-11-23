/// Module for [Document] interface mixin
module gid.atk1.document_mixin;

public import gid.core.basictypes;
public import gid.atk1.document_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.text_selection;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

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
      Retrieves the current page number inside document.
      Returns: the current page number inside document, or -1 if
          not implemented, not know by the implementor, or irrelevant.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCurrentPageNumber`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetCurrentPageNumber()
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getCurrentPageNumber)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getCurrentPageNumber(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [gid.xlib2.types.void*] that points to an instance of the DOM.  It is
      up to the caller to check atk_document_get_type to determine
      how to cast this pointer.
      Returns: a [gid.xlib2.types.void*] that points to an instance of the DOM.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDocument`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. document is already a representation of
        the document. Use it directly, or one of its children, as an
        instance of the DOM.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void* vfuncGetDocument()
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getDocument)
      return typeof(return).init;

    auto _retval = _klass.getDocument(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value of the given attribute_name inside document.
  
      Params:
        attributeName = a character string representing the name of the attribute
            whose value is being queried.
      Returns: a string value associated with the named
           attribute for this document, or null if a value for
           attribute_name has not been specified for this document.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDocumentAttributeValue`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetDocumentAttributeValue(string attributeName)
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getDocumentAttributeValue)
      return typeof(return).init;

    const(char)* _cretval;
    const(char)* _attributeName = attributeName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getDocumentAttributeValue(cast(AtkDocument*)this._cPtr, _attributeName);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDocumentLocale`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  
      Deprecated: Please use [gid.atk1.object.ObjectWrap.getObjectLocale] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetDocumentLocale()
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getDocumentLocale)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getDocumentLocale(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a string indicating the document type.
      Returns: a string indicating the document type
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDocumentType`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  
      Deprecated: Since 2.12. Please use [gid.atk1.document.Document.getAttributes] to
        ask for the document type if it applies.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetDocumentType()
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getDocumentType)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getDocumentType(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the total number of pages inside document.
      Returns: total page count of document, or -1 if not implemented,
          not know by the implementor or irrelevant.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPageCount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetPageCount()
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.getPageCount)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getPageCount(cast(AtkDocument*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetDocumentAttribute`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetDocumentAttribute(string attributeName, string attributeValue)
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.setDocumentAttribute)
      return typeof(return).init;

    bool _retval;
    const(char)* _attributeName = attributeName.toCString!(No.Malloc, No.Nullable);
    const(char)* _attributeValue = attributeValue.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.setDocumentAttribute(cast(AtkDocument*)this._cPtr, _attributeName, _attributeValue);
    return _retval;
  }

  /**
      Makes 1 or more selections within this document denoted by the given
      array of AtkTextSelections. Any existing physical selection (inside or
      outside this document) is replaced by the new selections. All objects within
      the given selection ranges must be descendants of this document. Otherwise
      FALSE will be returned.
  
      Params:
        selections = a GArray of AtkTextSelections
                       to be selected.
      Returns: TRUE if the selection was made successfully; FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetTextSelections`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetTextSelections(gid.atk1.text_selection.TextSelection[] selections)
  {
    auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.document.Document._getGType);
    if (!_klass || !_klass.setTextSelections)
      return typeof(return).init;

    bool _retval;
    auto _selections = gArrayFromD!(gid.atk1.text_selection.TextSelection, false)(selections);
    scope(exit) containerFree!(GArray*, gid.atk1.text_selection.TextSelection, GidOwnership.None)(_selections);
    _retval = cast(bool)_klass.setTextSelections(cast(AtkDocument*)this._cPtr, _selections);
    return _retval;
  }

  /**
      Retrieves the value of the given attribute_name inside document.
  
      Params:
        attributeName = a character string representing the name of the attribute
            whose value is being queried.
      Returns: a string value associated with the named
           attribute for this document, or null if a value for
           attribute_name has not been specified for this document.
  */
  override string getAttributeValue(string attributeName) nothrow
  {
    const(char)* _cretval;
    const(char)* _attributeName = attributeName.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_document_get_attribute_value(cast(AtkDocument*)this._cPtr, _attributeName);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the current page number inside document.
      Returns: the current page number inside document, or -1 if
          not implemented, not know by the implementor, or irrelevant.
  */
  override int getCurrentPageNumber() nothrow
  {
    int _retval;
    _retval = atk_document_get_current_page_number(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [gid.xlib2.types.void*] that points to an instance of the DOM.  It is
      up to the caller to check atk_document_get_type to determine
      how to cast this pointer.
      Returns: a [gid.xlib2.types.void*] that points to an instance of the DOM.
  
      Deprecated: Since 2.12. document is already a representation of
        the document. Use it directly, or one of its children, as an
        instance of the DOM.
  */
  override void* getDocument() nothrow
  {
    auto _retval = atk_document_get_document(cast(AtkDocument*)this._cPtr);
    return _retval;
  }

  /**
      Gets a string indicating the document type.
      Returns: a string indicating the document type
  
      Deprecated: Since 2.12. Please use [gid.atk1.document.Document.getAttributes] to
        ask for the document type if it applies.
  */
  override string getDocumentType() nothrow
  {
    const(char)* _cretval;
    _cretval = atk_document_get_document_type(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  
      Deprecated: Please use [gid.atk1.object.ObjectWrap.getObjectLocale] instead.
  */
  override string getLocale() nothrow
  {
    const(char)* _cretval;
    _cretval = atk_document_get_locale(cast(AtkDocument*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the total number of pages inside document.
      Returns: total page count of document, or -1 if not implemented,
          not know by the implementor or irrelevant.
  */
  override int getPageCount() nothrow
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
  override bool setAttributeValue(string attributeName, string attributeValue) nothrow
  {
    bool _retval;
    const(char)* _attributeName = attributeName.toCString!(No.Malloc, No.Nullable);
    const(char)* _attributeValue = attributeValue.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)atk_document_set_attribute_value(cast(AtkDocument*)this._cPtr, _attributeName, _attributeValue);
    return _retval;
  }

  /**
      Makes 1 or more selections within this document denoted by the given
      array of AtkTextSelections. Any existing physical selection (inside or
      outside this document) is replaced by the new selections. All objects within
      the given selection ranges must be descendants of this document. Otherwise
      FALSE will be returned.
  
      Params:
        selections = a GArray of AtkTextSelections
                       to be selected.
      Returns: TRUE if the selection was made successfully; FALSE otherwise.
  */
  override bool setTextSelections(gid.atk1.text_selection.TextSelection[] selections) nothrow
  {
    bool _retval;
    auto _selections = gArrayFromD!(gid.atk1.text_selection.TextSelection, false)(selections);
    scope(exit) containerFree!(GArray*, gid.atk1.text_selection.TextSelection, GidOwnership.None)(_selections);
    _retval = cast(bool)atk_document_set_text_selections(cast(AtkDocument*)this._cPtr, _selections);
    return _retval;
  }

  /**
      Connect to `DocumentAttributeChanged` signal.
  
      The "document-attribute-changed" signal should be emitted when there is a
        change to one of the document attributes returned by
        atk_document_get_attributes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string arg1, string arg2, gid.atk1.document.Document document)`
  
          `arg1` the name of the attribute being modified, or null if not
                     available. (optional)
  
          `arg2` the attribute's new value, or null if not available. (optional)
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDocumentAttributeChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.document.Document)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.documentAttributeChanged");
      }
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
  
          `void callback(gid.atk1.document.Document document)`
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLoadComplete(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.document.Document)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.loadComplete");
      }
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
  
          `void callback(gid.atk1.document.Document document)`
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLoadStopped(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.document.Document)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.loadStopped");
      }
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
  
          `void callback(int pageNumber, gid.atk1.document.Document document)`
  
          `pageNumber` the new page number. If this value is unknown
            or not applicable, -1 should be provided. (optional)
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.atk1.document.Document)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.pageChanged");
      }
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
  
          `void callback(gid.atk1.document.Document document)`
  
          `document` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReload(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.document.Document)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.reload");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reload", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.document.Document (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_document_Document(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentPageNumber", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocument", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentAttributeValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentLocale", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPageCount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDocumentAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetTextSelections", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.document.Document vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_document_Document(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentPageNumber", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_document_Document(iface, "get_current_page_number");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocument", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_document_Document(iface, "get_document");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentAttributeValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.document.Document.vfuncGetDocumentAttributeValue is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentLocale", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.document.Document.vfuncGetDocumentLocale is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDocumentType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.document.Document.vfuncGetDocumentType is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPageCount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_document_Document(iface, "get_page_count");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDocumentAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_document_Document(iface, "set_document_attribute");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetTextSelections", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_document_Document(iface, "set_text_selections");
  }

  private static void _installIfaceVfunc_gid_atk1_document_Document(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkDocumentIface*)iface;

    switch (vfunc)
    {
      case "get_current_page_number":
      {
        static extern(C) int _vfuncGetCurrentPageNumberTramp(AtkDocument* document) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)document);
          if (!_obj)
          {
            auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)document), gid.atk1.document.Document._getGType);
            if (_klass && _klass.getCurrentPageNumber)
              return (cast(typeof(&_vfuncGetCurrentPageNumberTramp))_klass.getCurrentPageNumber)(document);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetCurrentPageNumber();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.vfuncGetCurrentPageNumber");
          }
          return _retval;
        }

        _klass.getCurrentPageNumber = cast(typeof(_klass.getCurrentPageNumber))&_vfuncGetCurrentPageNumberTramp;
        break;
      }
      case "get_document":
      {
        static extern(C) void* _vfuncGetDocumentTramp(AtkDocument* document) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)document);
          if (!_obj)
          {
            auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)document), gid.atk1.document.Document._getGType);
            if (_klass && _klass.getDocument)
              return (cast(typeof(&_vfuncGetDocumentTramp))_klass.getDocument)(document);
            return typeof(return).init;
          }

          void* _retval;

          try
          {
            _retval = _obj.vfuncGetDocument();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.vfuncGetDocument");
          }
          return _retval;
        }

        _klass.getDocument = cast(typeof(_klass.getDocument))&_vfuncGetDocumentTramp;
        break;
      }
      case "get_page_count":
      {
        static extern(C) int _vfuncGetPageCountTramp(AtkDocument* document) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)document);
          if (!_obj)
          {
            auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)document), gid.atk1.document.Document._getGType);
            if (_klass && _klass.getPageCount)
              return (cast(typeof(&_vfuncGetPageCountTramp))_klass.getPageCount)(document);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetPageCount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.vfuncGetPageCount");
          }
          return _retval;
        }

        _klass.getPageCount = cast(typeof(_klass.getPageCount))&_vfuncGetPageCountTramp;
        break;
      }
      case "set_document_attribute":
      {
        static extern(C) gboolean _vfuncSetDocumentAttributeTramp(AtkDocument* document, const(char)* attributeName, const(char)* attributeValue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)document);
          if (!_obj)
          {
            auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)document), gid.atk1.document.Document._getGType);
            if (_klass && _klass.setDocumentAttribute)
              return (cast(typeof(&_vfuncSetDocumentAttributeTramp))_klass.setDocumentAttribute)(document, attributeName, attributeValue);
            return typeof(return).init;
          }

          bool _dretval;
          string _attributeName = attributeName.fromCString!(No.Free);
          string _attributeValue = attributeValue.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetDocumentAttribute(_attributeName, _attributeValue);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.vfuncSetDocumentAttribute");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setDocumentAttribute = cast(typeof(_klass.setDocumentAttribute))&_vfuncSetDocumentAttributeTramp;
        break;
      }
      case "set_text_selections":
      {
        static extern(C) gboolean _vfuncSetTextSelectionsTramp(AtkDocument* document, GArray* selections) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)document);
          if (!_obj)
          {
            auto _klass = cast(AtkDocumentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)document), gid.atk1.document.Document._getGType);
            if (_klass && _klass.setTextSelections)
              return (cast(typeof(&_vfuncSetTextSelectionsTramp))_klass.setTextSelections)(document, selections);
            return typeof(return).init;
          }

          bool _dretval;
          auto _selections = gArrayToD!(gid.atk1.text_selection.TextSelection, GidOwnership.None)(selections);

          try
          {
            _dretval = _obj.vfuncSetTextSelections(_selections);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.document.Document.vfuncSetTextSelections");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setTextSelections = cast(typeof(_klass.setTextSelections))&_vfuncSetTextSelectionsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.document.Document]
template DocumentGidBuilderT()
{
}
