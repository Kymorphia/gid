/// Module for [CompletionProvider] interface mixin
module gid.gtksource5.completion_provider_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.completion_provider_iface_proxy;
public import gid.core.gid;
public import gid.gdk4.types;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.list_model;
public import gid.gio2.types;
public import gid.glib2.error;
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
}

/// Fluent builder implementation template for [gid.gtksource5.completion_provider.CompletionProvider]
template CompletionProviderGidBuilderT()
{
}
