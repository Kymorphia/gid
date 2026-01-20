/// Module for [CompletionContext] class
module gtksource.completion_context;

import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_proposal;
import gtksource.completion_provider;
import gtksource.types;

/** */
class CompletionContext : gobject.initially_unowned.InitiallyUnowned
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
      Get `activation` property.
      Returns: The completion activation
  */
  @property gtksource.types.CompletionActivation activation()
  {
    return getActivation();
  }

  /**
      Set `activation` property.
      Params:
        propval = The completion activation
  */
  @property void activation(gtksource.types.CompletionActivation propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtksource.types.CompletionActivation)("activation", propval);
  }

  /**
      Get `iter` property.
      Returns: The #GtkTextIter at which the completion is invoked.
  */
  @property gtk.text_iter.TextIter iter()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.text_iter.TextIter)("iter");
  }

  /**
      Set `iter` property.
      Params:
        propval = The #GtkTextIter at which the completion is invoked.
  */
  @property void iter(gtk.text_iter.TextIter propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.text_iter.TextIter)("iter", propval);
  }

  /**
      Providers can use this function to add proposals to the completion. They
      can do so asynchronously by means of the finished argument. Providers must
      ensure that they always call this function with finished set to true
      once each population (even if no proposals need to be added).
      Population occurs when the [gtksource.completion_provider.CompletionProvider.populate]
      function is called.
  
      Params:
        provider = a #GtkSourceCompletionProvider.
        proposals = The list of proposals to add.
        finished = Whether the provider is finished adding proposals.
  */
  void addProposals(gtksource.completion_provider.CompletionProvider provider, gtksource.completion_proposal.CompletionProposal[] proposals, bool finished)
  {
    auto _proposals = gListFromD!(gtksource.completion_proposal.CompletionProposal)(proposals);
    scope(exit) containerFree!(GList*, gtksource.completion_proposal.CompletionProposal, GidOwnership.None)(_proposals);
    gtk_source_completion_context_add_proposals(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, _proposals, finished);
  }

  /**
      Get the context activation.
      Returns: The context activation.
  */
  gtksource.types.CompletionActivation getActivation()
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)this._cPtr);
    gtksource.types.CompletionActivation _retval = cast(gtksource.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Get the iter at which the completion was invoked. Providers can use this
      to determine how and if to match proposals.
  
      Params:
        iter = a #GtkTextIter.
      Returns: true if iter is correctly set, false otherwise.
  */
  bool getIter(out gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_context_get_iter(cast(GtkSourceCompletionContext*)this._cPtr, cast(GtkTextIter*)&iter);
    return _retval;
  }

  /**
      Connect to `Cancelled` signal.
  
      Emitted when the current population of proposals has been cancelled.
        Providers adding proposals asynchronously should connect to this signal
        to know when to cancel running proposal queries.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion_context.CompletionContext completionContext))
  
          `completionContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_context.CompletionContext)))
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
    return connectSignalClosure("cancelled", closure, after);
  }
}
