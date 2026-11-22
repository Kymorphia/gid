/// Module for [CompletionContext] class
module gid.gtksource5.completion_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_iter;
import gid.gtksource5.buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.completion;
import gid.gtksource5.completion_provider;
import gid.gtksource5.language;
import gid.gtksource5.types;
import gid.gtksource5.view;

/**
    The context of a completion.
    
    [gid.gtksource5.completion_context.CompletionContext] contains information about an attept to display
    completion proposals to the user based on typed text in the [gid.gtksource5.view.View].
    
    When typing, [gid.gtksource5.completion.Completion] may use registered
    [gid.gtksource5.completion_provider.CompletionProvider] to determine if there may be results which
    could be displayed. If so, a [gid.gtksource5.completion_context.CompletionContext] is created with
    information that is provided to the [gid.gtksource5.completion_provider.CompletionProvider] to populate
    results which might be useful to the user.
    
    [gid.gtksource5.completion_provider.CompletionProvider] are expected to provide [gid.gio2.list_model.ListModel] with
    [gid.gtksource5.completion_proposal.CompletionProposal] which may be joined together in a list of
    results for the user. They are also responsible for how the contents are
    displayed using [gid.gtksource5.completion_cell.CompletionCell] which allows for some level of
    customization.
*/
class CompletionContext : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
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
    return cast(void function())gtk_source_completion_context_get_type != &gidSymbolNotFound ? gtk_source_completion_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.completion_context.CompletionContext]
      Returns: New builder object
  */
  static CompletionContextGidBuilder builder() nothrow
  {
    return new CompletionContextGidBuilder;
  }

  /**
      Get `busy` property.
      Returns: The "busy" property is true while the completion context is
        populating completion proposals.
  */
  @property bool busy() nothrow
  {
    return getBusy();
  }

  /**
      Get `completion` property.
      Returns: The "completion" is the #GtkSourceCompletion that was used to create the context.
  */
  @property gid.gtksource5.completion.Completion completion() nothrow
  {
    return getCompletion();
  }

  /**
      Get `empty` property.
      Returns: The "empty" property is true when there are no results.
        
        It will be notified when the first result is added or the last
        result is removed.
  */
  @property bool empty() nothrow
  {
    return getEmpty();
  }

  mixin ListModelT!();

  /**
      Gets the mode for which the context was activated.
      Returns: 
  */
  gid.gtksource5.types.CompletionActivation getActivation() nothrow
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)this._cPtr);
    gid.gtksource5.types.CompletionActivation _retval = cast(gid.gtksource5.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Gets the bounds for the completion, which is the beginning of the
      current word (taking break characters into account) to the current
      insertion cursor.
      
      If begin is non-null, it will be set to the start position of the
      current word being completed.
      
      If end is non-null, it will be set to the insertion cursor for the
      current word being completed.
  
      Params:
        begin = a #GtkTextIter
        end = a #GtkTextIter
      Returns: true if the marks are still valid and begin or end was set.
  */
  bool getBounds(out gid.gtk4.text_iter.TextIter begin, out gid.gtk4.text_iter.TextIter end) nothrow
  {
    bool _retval;
    auto _begin = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_completion_context_get_bounds(cast(GtkSourceCompletionContext*)this._cPtr, _begin, _end);
    begin = new gid.gtk4.text_iter.TextIter(cast(void*)_begin, Yes.Take);
    end = new gid.gtk4.text_iter.TextIter(cast(void*)_end, Yes.Take);
    return _retval;
  }

  /**
      Gets the underlying buffer used by the context.
      
      This is a convenience function to get the buffer via the #GtkSourceCompletion
      property.
      Returns: a #GtkTextBuffer or null
  */
  gid.gtksource5.buffer.Buffer getBuffer() nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_completion_context_get_buffer(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the "busy" property. This is set to true while the completion
      context is actively fetching proposals from registered
      #GtkSourceCompletionProvider's.
      Returns: true if the context is busy
  */
  bool getBusy() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_context_get_busy(cast(GtkSourceCompletionContext*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkSourceCompletion that created the context.
      Returns: an #GtkSourceCompletion or null
  */
  gid.gtksource5.completion.Completion getCompletion() nothrow
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_completion_context_get_completion(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if any proposals have been provided to the context.
      
      Out of convenience, this function will return true if self is null.
      Returns: true if there are no proposals in the context
  */
  bool getEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_context_get_empty(cast(GtkSourceCompletionContext*)this._cPtr);
    return _retval;
  }

  /**
      Gets the language of the underlying buffer, if any.
      Returns: a #GtkSourceLanguage or null
  */
  gid.gtksource5.language.Language getLanguage() nothrow
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_completion_context_get_language(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GListModel associated with the provider.
      
      You can connect to #GtkSourceCompletionContext::model-changed to receive
      notifications about when the model has been replaced by a new model.
  
      Params:
        provider = a #GtkSourceCompletionProvider
      Returns: a #GListModel or null
  */
  gid.gio2.list_model.ListModel getProposalsForProvider(gid.gtksource5.completion_provider.CompletionProvider provider) nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_get_proposals_for_provider(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text view for the context.
      Returns: a #GtkSourceView or null
  */
  gid.gtksource5.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_context_get_view(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the word that is being completed up to the position of the insert mark.
      Returns: a string containing the current word
  */
  string getWord() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_context_get_word(cast(GtkSourceCompletionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the providers that are associated with the context.
      Returns: a #GListModel of #GtkSourceCompletionProvider
  */
  gid.gio2.list_model.ListModel listProviders() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_list_providers(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function allows providers to update their results for a context
      outside of a call to [gid.gtksource5.completion_provider.CompletionProvider.populateAsync].
      
      This can be used to immediately return results for a provider while it does
      additional asynchronous work. Doing so will allow the completions to
      update while the operation is in progress.
  
      Params:
        provider = an #GtkSourceCompletionProvider
        results = a #GListModel or null
  */
  void setProposalsForProvider(gid.gtksource5.completion_provider.CompletionProvider provider, gid.gio2.list_model.ListModel results = null) nothrow
  {
    gtk_source_completion_context_set_proposals_for_provider(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, results ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)results)._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ProviderModelChanged` signal.
  
      Emitted when a provider changes a model.
        
        This signal is primarily useful for #GtkSourceCompletionProvider's
        that want to track other providers in context. For example, it can
        be used to create a "top results" provider.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.completion_provider.CompletionProvider provider, gid.gio2.list_model.ListModel model, gid.gtksource5.completion_context.CompletionContext completionContext)`
  
          `provider` a #GtkSourceCompletionProvider (optional)
  
          `model` a #GListModel (optional)
  
          `completionContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectProviderModelChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.completion_provider.CompletionProvider)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.list_model.ListModel)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.completion_context.CompletionContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_context.CompletionContext.providerModelChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-model-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_context.CompletionContext]
class CompletionContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();

  /**
      Set `completion` property.
      Params:
        propval = The "completion" is the #GtkSourceCompletion that was used to create the context.
      Returns: Builder instance for fluent chaining
  */
  T completion(gid.gtksource5.completion.Completion propval) nothrow
  {
    return setProperty("completion", propval);
  }
}

/// Fluent builder for [gid.gtksource5.completion_context.CompletionContext]
final class CompletionContextGidBuilder : CompletionContextGidBuilderImpl!CompletionContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionContext build() nothrow
  {
    return new CompletionContext(cast(void*)createGObject(CompletionContext._getGType), Yes.Take);
  }
}
