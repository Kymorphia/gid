/// Module for [CompletionProvider] interface mixin
module gid.gtksource5.completion_provider_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.completion_provider;
public import gid.gtksource5.completion_provider_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.types;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.list_model;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.text_iter;
public import gid.gtksource5.c.functions;
public import gid.gtksource5.c.types;
public import gid.gtksource5.completion_cell;
public import gid.gtksource5.completion_context;
public import gid.gtksource5.completion_proposal;
public import gid.gtksource5.types;

/**
    Completion provider interface.
    
    You must implement this interface to provide proposals to [gid.gtksource5.completion.Completion].
    
    In most cases, implementations of this interface will want to use
    `vfunc@CompletionProvider.populate_async` to asynchronously populate the results
    to avoid blocking the main loop.
*/
template CompletionProviderT()
{

  /**
      This function requests proposal to be activated by the
      #GtkSourceCompletionProvider.
      
      What the provider does to activate the proposal is specific to that
      provider. Many providers may choose to insert a #GtkSourceSnippet with
      edit points the user may cycle through.
      
      See also: [gid.gtksource5.snippet.Snippet], [gid.gtksource5.snippet_chunk.SnippetChunk], [gid.gtksource5.view.View.pushSnippet]
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActivate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActivate(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.activate)
      return;

    _klass.activate(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
  }

  /**
      This function requests that the #GtkSourceCompletionProvider prepares
      cell to display the contents of proposal.
      
      Based on cells column type, you may want to display different information.
      
      This allows for columns of information among completion proposals
      resulting in better alignment of similar content (icons, return types,
      method names, and parameter lists).
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        cell = a #GtkSourceCompletionCell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDisplay`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncDisplay(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal, gid.gtksource5.completion_cell.CompletionCell cell)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.display)
      return;

    _klass.display(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, cell ? cast(GtkSourceCompletionCell*)cell._cPtr(No.Dup) : null);
  }

  /**
      This function should return the priority of self in context.
      
      The priority is used to sort groups of completion proposals by
      provider so that higher priority providers results are shown
      above lower priority providers.
      
      Higher value indicates higher priority.
  
      Params:
        context = a #GtkSourceCompletionContext
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPriority`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetPriority(gid.gtksource5.completion_context.CompletionContext context)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getPriority)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getPriority(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the title of the completion provider, if any.
      
      Currently, titles are not displayed in the completion results, but may be
      at some point in the future when non-null.
      Returns: a title for the provider or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTitle`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetTitle()
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getTitle)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getTitle(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      This function is used to determine if a character inserted into the text
      editor should cause a new completion request to be triggered.
      
      An example would be period '.' which might indicate that the user wants
      to complete method or field names of an object.
      
      This method will only trigger when text is inserted into the #GtkTextBuffer
      while the completion list is visible and a proposal is selected. Incremental
      key-presses (like shift, control, or alt) are not triggerable.
  
      Params:
        iter = a #GtkTextIter
        ch = a #gunichar of the character inserted
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsTrigger`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsTrigger(gid.gtk4.text_iter.TextIter iter, dchar ch)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.isTrigger)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isTrigger(cast(GtkSourceCompletionProvider*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, ch);
    return _retval;
  }

  /**
      This function is used to determine if a key typed by the user should
      activate proposal (resulting in committing the text to the editor).
      
      This is useful when using languages where convention may lead to less
      typing by the user. One example may be the use of "." or "-" to expand
      a field access in the C programming language.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        keyval = a keyval such as [gid.gdk4.types.KEY_period]
        state = a #GdkModifierType or 0
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncKeyActivates`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncKeyActivates(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal, uint keyval, gid.gdk4.types.ModifierType state)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.keyActivates)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.keyActivates(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, keyval, state);
    return _retval;
  }

  /**
      Providers should return a list of alternates to proposal or null if
      there are no alternates available.
      
      This can be used by the completion view to allow the user to move laterally
      through similar proposals, such as overrides of methods by the same name.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
      Returns: a #GPtrArray of #GtkSourceCompletionProposal or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncListAlternates`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtksource5.completion_proposal.CompletionProposal[] vfuncListAlternates(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.listAlternates)
      return typeof(return).init;

    GPtrArray* _cretval;
    _cretval = _klass.listAlternates(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.gtksource5.completion_proposal.CompletionProposal, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Asynchronously requests that the provider populates the completion
      results for context.
      
      For providers that would like to populate a [gid.gio2.list_model.ListModel] while those
      results are displayed to the user,
      [gid.gtksource5.completion_context.CompletionContext.setProposalsForProvider] may be used
      to reduce latency until the user sees results.
  
      Params:
        context = a #GtkSourceCompletionContext
        cancellable = a #GCancellable or null
        callback = a callback to execute upon completion
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPopulateAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPopulateAsync(gid.gtksource5.completion_context.CompletionContext context, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.populateAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.populateAsync(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Completes an asynchronous operation to populate a completion provider.
  
      Params:
        result = a #GAsyncResult provided to callback
      Returns: a #GListModel of #GtkSourceCompletionProposal
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPopulateFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.list_model.ListModel vfuncPopulateFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.populateFinish)
      return typeof(return).init;

    GListModel* _cretval;
    GError *_err;
    _cretval = _klass.populateFinish(cast(GtkSourceCompletionProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function can be used to filter results previously provided to
      the [gid.gtksource5.completion_context.CompletionContext] by the #GtkSourceCompletionProvider.
      
      This can happen as the user types additional text onto the word so
      that previously matched items may be removed from the list instead of
      generating new [gid.gio2.list_model.ListModel] of results.
  
      Params:
        context = a #GtkSourceCompletionContext
        model = a #GListModel
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRefilter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRefilter(gid.gtksource5.completion_context.CompletionContext context, gid.gio2.list_model.ListModel model)
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.refilter)
      return;

    _klass.refilter(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      This function requests proposal to be activated by the
      #GtkSourceCompletionProvider.
      
      What the provider does to activate the proposal is specific to that
      provider. Many providers may choose to insert a #GtkSourceSnippet with
      edit points the user may cycle through.
      
      See also: [gid.gtksource5.snippet.Snippet], [gid.gtksource5.snippet_chunk.SnippetChunk], [gid.gtksource5.view.View.pushSnippet]
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
  */
  override void activate(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal) nothrow
  {
    gtk_source_completion_provider_activate(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
  }

  /**
      This function requests that the #GtkSourceCompletionProvider prepares
      cell to display the contents of proposal.
      
      Based on cells column type, you may want to display different information.
      
      This allows for columns of information among completion proposals
      resulting in better alignment of similar content (icons, return types,
      method names, and parameter lists).
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        cell = a #GtkSourceCompletionCell
  */
  override void display(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal, gid.gtksource5.completion_cell.CompletionCell cell) nothrow
  {
    gtk_source_completion_provider_display(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, cell ? cast(GtkSourceCompletionCell*)cell._cPtr(No.Dup) : null);
  }

  /**
      This function should return the priority of self in context.
      
      The priority is used to sort groups of completion proposals by
      provider so that higher priority providers results are shown
      above lower priority providers.
      
      Higher value indicates higher priority.
  
      Params:
        context = a #GtkSourceCompletionContext
      Returns: 
  */
  override int getPriority(gid.gtksource5.completion_context.CompletionContext context) nothrow
  {
    int _retval;
    _retval = gtk_source_completion_provider_get_priority(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the title of the completion provider, if any.
      
      Currently, titles are not displayed in the completion results, but may be
      at some point in the future when non-null.
      Returns: a title for the provider or null
  */
  override string getTitle() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_provider_get_title(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      This function is used to determine if a character inserted into the text
      editor should cause a new completion request to be triggered.
      
      An example would be period '.' which might indicate that the user wants
      to complete method or field names of an object.
      
      This method will only trigger when text is inserted into the #GtkTextBuffer
      while the completion list is visible and a proposal is selected. Incremental
      key-presses (like shift, control, or alt) are not triggerable.
  
      Params:
        iter = a #GtkTextIter
        ch = a #gunichar of the character inserted
      Returns: 
  */
  override bool isTrigger(gid.gtk4.text_iter.TextIter iter, dchar ch) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_is_trigger(cast(GtkSourceCompletionProvider*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, ch);
    return _retval;
  }

  /**
      This function is used to determine if a key typed by the user should
      activate proposal (resulting in committing the text to the editor).
      
      This is useful when using languages where convention may lead to less
      typing by the user. One example may be the use of "." or "-" to expand
      a field access in the C programming language.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
        keyval = a keyval such as [gid.gdk4.types.KEY_period]
        state = a #GdkModifierType or 0
      Returns: 
  */
  override bool keyActivates(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal, uint keyval, gid.gdk4.types.ModifierType state) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_key_activates(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, keyval, state);
    return _retval;
  }

  /**
      Providers should return a list of alternates to proposal or null if
      there are no alternates available.
      
      This can be used by the completion view to allow the user to move laterally
      through similar proposals, such as overrides of methods by the same name.
  
      Params:
        context = a #GtkSourceCompletionContext
        proposal = a #GtkSourceCompletionProposal
      Returns: a #GPtrArray of #GtkSourceCompletionProposal or null.
  */
  override gid.gtksource5.completion_proposal.CompletionProposal[] listAlternates(gid.gtksource5.completion_context.CompletionContext context, gid.gtksource5.completion_proposal.CompletionProposal proposal) nothrow
  {
    GPtrArray* _cretval;
    _cretval = gtk_source_completion_provider_list_alternates(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.gtksource5.completion_proposal.CompletionProposal, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Asynchronously requests that the provider populates the completion
      results for context.
      
      For providers that would like to populate a [gid.gio2.list_model.ListModel] while those
      results are displayed to the user,
      [gid.gtksource5.completion_context.CompletionContext.setProposalsForProvider] may be used
      to reduce latency until the user sees results.
  
      Params:
        context = a #GtkSourceCompletionContext
        cancellable = a #GCancellable or null
        callback = a callback to execute upon completion
  */
  override void populateAsync(gid.gtksource5.completion_context.CompletionContext context, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_completion_provider_populate_async(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Completes an asynchronous operation to populate a completion provider.
  
      Params:
        result = a #GAsyncResult provided to callback
      Returns: a #GListModel of #GtkSourceCompletionProposal
      Throws: [ErrorWrap]
  */
  override gid.gio2.list_model.ListModel populateFinish(gid.gio2.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_source_completion_provider_populate_finish(cast(GtkSourceCompletionProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function can be used to filter results previously provided to
      the [gid.gtksource5.completion_context.CompletionContext] by the #GtkSourceCompletionProvider.
      
      This can happen as the user types additional text onto the word so
      that previously matched items may be removed from the list instead of
      generating new [gid.gio2.list_model.ListModel] of results.
  
      Params:
        context = a #GtkSourceCompletionContext
        model = a #GListModel
  */
  override void refilter(gid.gtksource5.completion_context.CompletionContext context, gid.gio2.list_model.ListModel model) nothrow
  {
    gtk_source_completion_provider_refilter(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource5.completion_provider.CompletionProvider (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource5_completion_provider_CompletionProvider(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDisplay", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPriority", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTitle", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsTrigger", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncKeyActivates", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListAlternates", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefilter", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource5.completion_provider.CompletionProvider vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource5_completion_provider_CompletionProvider(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "activate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDisplay", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "display");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPriority", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "get_priority");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTitle", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "get_title");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsTrigger", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "is_trigger");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncKeyActivates", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "key_activates");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListAlternates", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "list_alternates");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtksource5.completion_provider.CompletionProvider.vfuncPopulateAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "populate_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefilter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(iface, "refilter");
  }

  private static void _installIfaceVfunc_gid_gtksource5_completion_provider_CompletionProvider(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceCompletionProviderInterface*)iface;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(self, context, proposal);
            return;
          }

          try
          {
            _obj.vfuncActivate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "display":
      {
        static extern(C) void _vfuncDisplayTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkSourceCompletionCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.display)
              return (cast(typeof(&_vfuncDisplayTramp))_klass.display)(self, context, proposal, cell);
            return;
          }

          try
          {
            _obj.vfuncDisplay(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_cell.CompletionCell)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncDisplay");
          }
        }

        _klass.display = cast(typeof(_klass.display))&_vfuncDisplayTramp;
        break;
      }
      case "get_priority":
      {
        static extern(C) int _vfuncGetPriorityTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getPriority)
              return (cast(typeof(&_vfuncGetPriorityTramp))_klass.getPriority)(self, context);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetPriority(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncGetPriority");
          }
          return _retval;
        }

        _klass.getPriority = cast(typeof(_klass.getPriority))&_vfuncGetPriorityTramp;
        break;
      }
      case "get_title":
      {
        static extern(C) char* _vfuncGetTitleTramp(GtkSourceCompletionProvider* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getTitle)
              return (cast(typeof(&_vfuncGetTitleTramp))_klass.getTitle)(self);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetTitle();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncGetTitle");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getTitle = cast(typeof(_klass.getTitle))&_vfuncGetTitleTramp;
        break;
      }
      case "is_trigger":
      {
        static extern(C) gboolean _vfuncIsTriggerTramp(GtkSourceCompletionProvider* self, const(GtkTextIter)* iter, dchar ch) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.isTrigger)
              return (cast(typeof(&_vfuncIsTriggerTramp))_klass.isTrigger)(self, iter, ch);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsTrigger(iter ? new gid.gtk4.text_iter.TextIter(cast(void*)iter, No.Take) : null, ch);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncIsTrigger");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isTrigger = cast(typeof(_klass.isTrigger))&_vfuncIsTriggerTramp;
        break;
      }
      case "key_activates":
      {
        static extern(C) gboolean _vfuncKeyActivatesTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, uint keyval, GdkModifierType state) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.keyActivates)
              return (cast(typeof(&_vfuncKeyActivatesTramp))_klass.keyActivates)(self, context, proposal, keyval, state);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncKeyActivates(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take), keyval, state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncKeyActivates");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.keyActivates = cast(typeof(_klass.keyActivates))&_vfuncKeyActivatesTramp;
        break;
      }
      case "list_alternates":
      {
        static extern(C) GPtrArray* _vfuncListAlternatesTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.listAlternates)
              return (cast(typeof(&_vfuncListAlternatesTramp))_klass.listAlternates)(self, context, proposal);
            return typeof(return).init;
          }

          gid.gtksource5.completion_proposal.CompletionProposal[] _dretval;

          try
          {
            _dretval = _obj.vfuncListAlternates(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncListAlternates");
          }
          auto _retval = gPtrArrayFromD!(gid.gtksource5.completion_proposal.CompletionProposal, false)(_dretval);

          return _retval;
        }

        _klass.listAlternates = cast(typeof(_klass.listAlternates))&_vfuncListAlternatesTramp;
        break;
      }
      case "populate_finish":
      {
        static extern(C) GListModel* _vfuncPopulateFinishTramp(GtkSourceCompletionProvider* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.populateFinish)
              return (cast(typeof(&_vfuncPopulateFinishTramp))_klass.populateFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.gio2.list_model.ListModel _dretval;

          try
          {
            _dretval = _obj.vfuncPopulateFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.populateFinish = cast(typeof(_klass.populateFinish))&_vfuncPopulateFinishTramp;
        break;
      }
      case "refilter":
      {
        static extern(C) void _vfuncRefilterTramp(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GListModel* model) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.refilter)
              return (cast(typeof(&_vfuncRefilterTramp))_klass.refilter)(self, context, model);
            return;
          }

          try
          {
            _obj.vfuncRefilter(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(void*)model, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_provider.CompletionProvider.vfuncRefilter");
          }
        }

        _klass.refilter = cast(typeof(_klass.refilter))&_vfuncRefilterTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_provider.CompletionProvider]
template CompletionProviderGidBuilderT()
{
}
