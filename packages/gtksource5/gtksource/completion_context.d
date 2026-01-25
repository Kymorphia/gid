/// Module for [CompletionContext] class
module gtksource.completion_context;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.dclosure;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion;
import gtksource.completion_provider;
import gtksource.language;
import gtksource.types;
import gtksource.view;

/**
    The context of a completion.
    
    [gtksource.completion_context.CompletionContext] contains information about an attept to display
    completion proposals to the user based on typed text in the `class@View`.
    
    When typing, `class@Completion` may use registered
    `iface@CompletionProvider` to determine if there may be results which
    could be displayed. If so, a [gtksource.completion_context.CompletionContext] is created with
    information that is provided to the `iface@CompletionProvider` to populate
    results which might be useful to the user.
    
    `iface@CompletionProvider` are expected to provide [gio.list_model.ListModel] with
    `iface@CompletionProposal` which may be joined together in a list of
    results for the user. They are also responsible for how the contents are
    displayed using `class@CompletionCell` which allows for some level of
    customization.
*/
class CompletionContext : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())gtk_source_completion_context_get_type != &gidSymbolNotFound ? gtk_source_completion_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionContext self()
  {
    return this;
  }

  /**
      Get `busy` property.
      Returns: The "busy" property is true while the completion context is
        populating completion proposals.
  */
  @property bool busy()
  {
    return getBusy();
  }

  /**
      Get `empty` property.
      Returns: The "empty" property is true when there are no results.
        
        It will be notified when the first result is added or the last
        result is removed.
  */
  @property bool empty()
  {
    return getEmpty();
  }

  mixin ListModelT!();

  /**
      Gets the mode for which the context was activated.
      Returns: 
  */
  gtksource.types.CompletionActivation getActivation()
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)this._cPtr);
    gtksource.types.CompletionActivation _retval = cast(gtksource.types.CompletionActivation)_cretval;
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
  bool getBounds(out gtk.text_iter.TextIter begin, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    GtkTextIter _begin;
    GtkTextIter _end;
    _retval = cast(bool)gtk_source_completion_context_get_bounds(cast(GtkSourceCompletionContext*)this._cPtr, &_begin, &_end);
    begin = new gtk.text_iter.TextIter(cast(void*)&_begin, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
      Gets the underlying buffer used by the context.
      
      This is a convenience function to get the buffer via the #GtkSourceCompletion
      property.
      Returns: a #GtkTextBuffer or null
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_completion_context_get_buffer(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the "busy" property. This is set to true while the completion
      context is actively fetching proposals from registered
      #GtkSourceCompletionProvider's.
      Returns: true if the context is busy
  */
  bool getBusy()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_context_get_busy(cast(GtkSourceCompletionContext*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkSourceCompletion that created the context.
      Returns: an #GtkSourceCompletion or null
  */
  gtksource.completion.Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_completion_context_get_completion(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if any proposals have been provided to the context.
      
      Out of convenience, this function will return true if self is null.
      Returns: true if there are no proposals in the context
  */
  bool getEmpty()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_context_get_empty(cast(GtkSourceCompletionContext*)this._cPtr);
    return _retval;
  }

  /**
      Gets the language of the underlying buffer, if any.
      Returns: a #GtkSourceLanguage or null
  */
  gtksource.language.Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_completion_context_get_language(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
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
  gio.list_model.ListModel getProposalsForProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_get_proposals_for_provider(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text view for the context.
      Returns: a #GtkSourceView or null
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_context_get_view(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the word that is being completed up to the position of the insert mark.
      Returns: a string containing the current word
  */
  string getWord()
  {
    char* _cretval;
    _cretval = gtk_source_completion_context_get_word(cast(GtkSourceCompletionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the providers that are associated with the context.
      Returns: a #GListModel of #GtkSourceCompletionProvider
  */
  gio.list_model.ListModel listProviders()
  {
    GListModel* _cretval;
    _cretval = gtk_source_completion_context_list_providers(cast(GtkSourceCompletionContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function allows providers to update their results for a context
      outside of a call to [gtksource.completion_provider.CompletionProvider.populateAsync].
      
      This can be used to immediately return results for a provider while it does
      additional asynchronous work. Doing so will allow the completions to
      update while the operation is in progress.
  
      Params:
        provider = an #GtkSourceCompletionProvider
        results = a #GListModel or null
  */
  void setProposalsForProvider(gtksource.completion_provider.CompletionProvider provider, gio.list_model.ListModel results = null)
  {
    gtk_source_completion_context_set_proposals_for_provider(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, results ? cast(GListModel*)(cast(gobject.object.ObjectWrap)results)._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ProviderModelChanged` signal.
  
      Emitted when a provider changes a model.
        
        This signal is primarily useful for #GtkSourceCompletionProvider's
        that want to track other providers in context. For example, it can
        be used to create a "top results" provider.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion_provider.CompletionProvider provider, gio.list_model.ListModel model, gtksource.completion_context.CompletionContext completionContext))
  
          `provider` a #GtkSourceCompletionProvider (optional)
  
          `model` a #GListModel (optional)
  
          `completionContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProviderModelChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_provider.CompletionProvider)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.list_model.ListModel)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.completion_context.CompletionContext)))
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
    return connectSignalClosure("provider-model-changed", closure, after);
  }
}
