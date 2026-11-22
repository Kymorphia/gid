/// Module for [CompletionContext] class
module gid.gtksource4.completion_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk3.text_iter;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.completion;
import gid.gtksource4.completion_proposal;
import gid.gtksource4.completion_provider;
import gid.gtksource4.types;

/** */
class CompletionContext : gid.gobject2.initially_unowned.InitiallyUnowned
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
      Get builder for [gid.gtksource4.completion_context.CompletionContext]
      Returns: New builder object
  */
  static CompletionContextGidBuilder builder() nothrow
  {
    return new CompletionContextGidBuilder;
  }

  /**
      Get `activation` property.
      Returns: The completion activation
  */
  @property gid.gtksource4.types.CompletionActivation activation() nothrow
  {
    return getActivation();
  }

  /**
      Set `activation` property.
      Params:
        propval = The completion activation
  */
  @property void activation(gid.gtksource4.types.CompletionActivation propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtksource4.types.CompletionActivation)("activation", propval);
  }

  /**
      Get `completion` property.
      Returns: The #GtkSourceCompletion associated with the context.
  */
  @property gid.gtksource4.completion.Completion completion() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtksource4.completion.Completion)("completion");
  }

  /**
      Get `iter` property.
      Returns: The #GtkTextIter at which the completion is invoked.
  */
  @property gid.gtk3.text_iter.TextIter iter() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.text_iter.TextIter)("iter");
  }

  /**
      Set `iter` property.
      Params:
        propval = The #GtkTextIter at which the completion is invoked.
  */
  @property void iter(gid.gtk3.text_iter.TextIter propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.text_iter.TextIter)("iter", propval);
  }

  /**
      Providers can use this function to add proposals to the completion. They
      can do so asynchronously by means of the finished argument. Providers must
      ensure that they always call this function with finished set to true
      once each population (even if no proposals need to be added).
      Population occurs when the [gid.gtksource4.completion_provider.CompletionProvider.populate]
      function is called.
  
      Params:
        provider = a #GtkSourceCompletionProvider.
        proposals = The list of proposals to add.
        finished = Whether the provider is finished adding proposals.
  */
  void addProposals(gid.gtksource4.completion_provider.CompletionProvider provider, gid.gtksource4.completion_proposal.CompletionProposal[] proposals, bool finished) nothrow
  {
    auto _proposals = gListFromD!(gid.gtksource4.completion_proposal.CompletionProposal)(proposals);
    scope(exit) containerFree!(GList*, gid.gtksource4.completion_proposal.CompletionProposal, GidOwnership.None)(_proposals);
    gtk_source_completion_context_add_proposals(cast(GtkSourceCompletionContext*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, _proposals, finished);
  }

  /**
      Get the context activation.
      Returns: The context activation.
  */
  gid.gtksource4.types.CompletionActivation getActivation() nothrow
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_context_get_activation(cast(GtkSourceCompletionContext*)this._cPtr);
    gid.gtksource4.types.CompletionActivation _retval = cast(gid.gtksource4.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Get the iter at which the completion was invoked. Providers can use this
      to determine how and if to match proposals.
  
      Params:
        iter = a #GtkTextIter.
      Returns: true if iter is correctly set, false otherwise.
  */
  bool getIter(out gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_completion_context_get_iter(cast(GtkSourceCompletionContext*)this._cPtr, _iter);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Cancelled` signal.
  
      Emitted when the current population of proposals has been cancelled.
        Providers adding proposals asynchronously should connect to this signal
        to know when to cancel running proposal queries.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.completion_context.CompletionContext completionContext)`
  
          `completionContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancelled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion_context.CompletionContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_context.CompletionContext.cancelled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancelled", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_context.CompletionContext]
class CompletionContextGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /**
      Set `activation` property.
      Params:
        propval = The completion activation
      Returns: Builder instance for fluent chaining
  */
  T activation(gid.gtksource4.types.CompletionActivation propval) nothrow
  {
    return setProperty("activation", propval);
  }

  /**
      Set `completion` property.
      Params:
        propval = The #GtkSourceCompletion associated with the context.
      Returns: Builder instance for fluent chaining
  */
  T completion(gid.gtksource4.completion.Completion propval) nothrow
  {
    return setProperty("completion", propval);
  }

  /**
      Set `iter` property.
      Params:
        propval = The #GtkTextIter at which the completion is invoked.
      Returns: Builder instance for fluent chaining
  */
  T iter(gid.gtk3.text_iter.TextIter propval) nothrow
  {
    return setProperty("iter", propval);
  }
}

/// Fluent builder for [gid.gtksource4.completion_context.CompletionContext]
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
