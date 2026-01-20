/// Module for [Completion] class
module gtksource.completion;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.text_iter;
import gtk.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_context;
import gtksource.completion_info;
import gtksource.completion_provider;
import gtksource.types;
import gtksource.view;

/** */
class Completion : gobject.object.ObjectWrap, gtk.buildable.Buildable
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
    return cast(void function())gtk_source_completion_get_type != &gidSymbolNotFound ? gtk_source_completion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Completion self()
  {
    return this;
  }

  /**
      Get `accelerators` property.
      Returns: Number of keyboard accelerators to show for the first proposals. For
        example, to activate the first proposal, the user can press
        <keycombo><keycap>Alt</keycap><keycap>1</keycap></keycombo>.
  */
  @property uint accelerators()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("accelerators");
  }

  /**
      Set `accelerators` property.
      Params:
        propval = Number of keyboard accelerators to show for the first proposals. For
          example, to activate the first proposal, the user can press
          <keycombo><keycap>Alt</keycap><keycap>1</keycap></keycombo>.
  */
  @property void accelerators(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("accelerators", propval);
  }

  /**
      Get `autoCompleteDelay` property.
      Returns: Determines the popup delay (in milliseconds) at which the completion
        will be shown for interactive completion.
  */
  @property uint autoCompleteDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("auto-complete-delay");
  }

  /**
      Set `autoCompleteDelay` property.
      Params:
        propval = Determines the popup delay (in milliseconds) at which the completion
          will be shown for interactive completion.
  */
  @property void autoCompleteDelay(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("auto-complete-delay", propval);
  }

  /**
      Get `proposalPageSize` property.
      Returns: The scroll page size of the proposals in the completion window. In
        other words, when <keycap>PageDown</keycap> or
        <keycap>PageUp</keycap> is pressed, the selected
        proposal becomes the one which is located one page size backward or
        forward.
        
        See also the #GtkSourceCompletion::move-cursor signal.
  */
  @property uint proposalPageSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("proposal-page-size");
  }

  /**
      Set `proposalPageSize` property.
      Params:
        propval = The scroll page size of the proposals in the completion window. In
          other words, when <keycap>PageDown</keycap> or
          <keycap>PageUp</keycap> is pressed, the selected
          proposal becomes the one which is located one page size backward or
          forward.
          
          See also the #GtkSourceCompletion::move-cursor signal.
  */
  @property void proposalPageSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("proposal-page-size", propval);
  }

  /**
      Get `providerPageSize` property.
      Returns: The scroll page size of the provider pages in the completion window.
        
        See the #GtkSourceCompletion::move-page signal.
  */
  @property uint providerPageSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("provider-page-size");
  }

  /**
      Set `providerPageSize` property.
      Params:
        propval = The scroll page size of the provider pages in the completion window.
          
          See the #GtkSourceCompletion::move-page signal.
  */
  @property void providerPageSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("provider-page-size", propval);
  }

  /**
      Get `rememberInfoVisibility` property.
      Returns: Determines whether the visibility of the info window should be
        saved when the completion is hidden, and restored when the completion
        is shown again.
  */
  @property bool rememberInfoVisibility()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("remember-info-visibility");
  }

  /**
      Set `rememberInfoVisibility` property.
      Params:
        propval = Determines whether the visibility of the info window should be
          saved when the completion is hidden, and restored when the completion
          is shown again.
  */
  @property void rememberInfoVisibility(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("remember-info-visibility", propval);
  }

  /**
      Get `selectOnShow` property.
      Returns: Determines whether the first proposal should be selected when the
        completion is first shown.
  */
  @property bool selectOnShow()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("select-on-show");
  }

  /**
      Set `selectOnShow` property.
      Params:
        propval = Determines whether the first proposal should be selected when the
          completion is first shown.
  */
  @property void selectOnShow(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("select-on-show", propval);
  }

  /**
      Get `showHeaders` property.
      Returns: Determines whether provider headers should be shown in the proposal
        list. It can be useful to disable when there is only one provider.
  */
  @property bool showHeaders()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-headers");
  }

  /**
      Set `showHeaders` property.
      Params:
        propval = Determines whether provider headers should be shown in the proposal
          list. It can be useful to disable when there is only one provider.
  */
  @property void showHeaders(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-headers", propval);
  }

  /**
      Get `showIcons` property.
      Returns: Determines whether provider and proposal icons should be shown in
        the completion popup.
  */
  @property bool showIcons()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-icons");
  }

  /**
      Set `showIcons` property.
      Params:
        propval = Determines whether provider and proposal icons should be shown in
          the completion popup.
  */
  @property void showIcons(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-icons", propval);
  }

  mixin BuildableT!();

  /**
      Add a new #GtkSourceCompletionProvider to the completion object. This will
      add a reference provider, so make sure to unref your own copy when you
      no longer need it.
  
      Params:
        provider = a #GtkSourceCompletionProvider.
      Returns: true if provider was successfully added, otherwise if error
                 is provided, it will be set with the error and false is returned.
      Throws: [ErrorWrap]
  */
  bool addProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_completion_add_provider(cast(GtkSourceCompletion*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Block interactive completion. This can be used to disable interactive
      completion when inserting or deleting text from the buffer associated with
      the completion. Use [gtksource.completion.Completion.unblockInteractive] to enable
      interactive completion again.
      
      This function may be called multiple times. It will continue to block
      interactive completion until [gtksource.completion.Completion.unblockInteractive]
      has been called the same number of times.
  */
  void blockInteractive()
  {
    gtk_source_completion_block_interactive(cast(GtkSourceCompletion*)this._cPtr);
  }

  /**
      Create a new #GtkSourceCompletionContext for completion. The position where
      the completion occurs can be specified by position. If position is null,
      the current cursor position will be used.
  
      Params:
        position = a #GtkTextIter, or null.
      Returns: a new #GtkSourceCompletionContext.
        The reference being returned is a 'floating' reference,
        so if you invoke [gtksource.completion.Completion.start] with this context
        you don't need to unref it.
  */
  gtksource.completion_context.CompletionContext createContext(gtk.text_iter.TextIter position)
  {
    GtkSourceCompletionContext* _cretval;
    _cretval = gtk_source_completion_create_context(cast(GtkSourceCompletion*)this._cPtr, cast(GtkTextIter*)&position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.completion_context.CompletionContext)(cast(GtkSourceCompletionContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      The info widget is the window where the completion displays optional extra
      information of the proposal.
      Returns: The #GtkSourceCompletionInfo window
                                  associated with completion.
  */
  gtksource.completion_info.CompletionInfo getInfoWindow()
  {
    GtkSourceCompletionInfo* _cretval;
    _cretval = gtk_source_completion_get_info_window(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.completion_info.CompletionInfo)(cast(GtkSourceCompletionInfo*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get list of providers registered on completion. The returned list is owned
      by the completion and should not be freed.
      Returns: list of #GtkSourceCompletionProvider.
  */
  gtksource.completion_provider.CompletionProvider[] getProviders()
  {
    GList* _cretval;
    _cretval = gtk_source_completion_get_providers(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gListToD!(gtksource.completion_provider.CompletionProvider, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      The #GtkSourceView associated with completion, or null if the view has been
      destroyed.
      Returns: The #GtkSourceView associated with
        completion, or null.
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_get_view(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Hides the completion if it is active (visible).
  */
  void hide()
  {
    gtk_source_completion_hide(cast(GtkSourceCompletion*)this._cPtr);
  }

  /**
      Remove provider from the completion.
  
      Params:
        provider = a #GtkSourceCompletionProvider.
      Returns: true if provider was successfully removed, otherwise if error
                 is provided, it will be set with the error and false is returned.
      Throws: [ErrorWrap]
  */
  bool removeProvider(gtksource.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_completion_remove_provider(cast(GtkSourceCompletion*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Starts a new completion with the specified #GtkSourceCompletionContext and
      a list of potential candidate providers for completion.
      
      It can be convenient for showing a completion on-the-fly, without the need to
      add or remove providers to the #GtkSourceCompletion.
      
      Another solution is to add providers with
      [gtksource.completion.Completion.addProvider], and implement
      [gtksource.completion_provider.CompletionProvider.match] for each provider.
  
      Params:
        providers = a list of #GtkSourceCompletionProvider, or null.
        context = The #GtkSourceCompletionContext
          with which to start the completion.
      Returns: true if it was possible to the show completion window.
  */
  bool start(gtksource.completion_provider.CompletionProvider[] providers, gtksource.completion_context.CompletionContext context)
  {
    bool _retval;
    auto _providers = gListFromD!(gtksource.completion_provider.CompletionProvider)(providers);
    scope(exit) containerFree!(GList*, gtksource.completion_provider.CompletionProvider, GidOwnership.None)(_providers);
    _retval = cast(bool)gtk_source_completion_start(cast(GtkSourceCompletion*)this._cPtr, _providers, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Unblock interactive completion. This can be used after using
      [gtksource.completion.Completion.blockInteractive] to enable interactive completion
      again.
  */
  void unblockInteractive()
  {
    gtk_source_completion_unblock_interactive(cast(GtkSourceCompletion*)this._cPtr);
  }

  /**
      Connect to `ActivateProposal` signal.
  
      The #GtkSourceCompletion::activate-proposal signal is a
        keybinding signal which gets emitted when the user initiates
        a proposal activation.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the proposal
        activation programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion.Completion completion))
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateProposal(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion.Completion)))
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
    return connectSignalClosure("activate-proposal", closure, after);
  }

  /**
      Connect to `Hide` signal.
  
      Emitted when the completion window is hidden. The default handler
        will actually hide the window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion.Completion completion))
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHide(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion.Completion)))
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
    return connectSignalClosure("hide", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The #GtkSourceCompletion::move-cursor signal is a keybinding
        signal which gets emitted when the user initiates a cursor
        movement.
        
        The <keycap>Up</keycap>, <keycap>Down</keycap>,
        <keycap>PageUp</keycap>, <keycap>PageDown</keycap>,
        <keycap>Home</keycap> and <keycap>End</keycap> keys are bound to the
        normal behavior expected by those keys.
        
        When step is equal to [gtk.types.ScrollStep.Pages], the page size is defined by
        the #GtkSourceCompletion:proposal-page-size property. It is used for
        the <keycap>PageDown</keycap> and <keycap>PageUp</keycap> keys.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion))
  
          `step` The #GtkScrollStep by which to move the cursor (optional)
  
          `num` The amount of steps to move the cursor (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.completion.Completion)))
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
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `MovePage` signal.
  
      The #GtkSourceCompletion::move-page signal is a keybinding
        signal which gets emitted when the user initiates a page
        movement (i.e. switches between provider pages).
        
        <keycombo><keycap>Control</keycap><keycap>Left</keycap></keycombo>
        is for going to the previous provider.
        <keycombo><keycap>Control</keycap><keycap>Right</keycap></keycombo>
        is for going to the next provider.
        <keycombo><keycap>Control</keycap><keycap>Home</keycap></keycombo>
        is for displaying all the providers.
        <keycombo><keycap>Control</keycap><keycap>End</keycap></keycombo>
        is for going to the last provider.
        
        When step is equal to #GTK_SCROLL_PAGES, the page size is defined by
        the #GtkSourceCompletion:provider-page-size property.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the page selection
        programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollStep step, int num, gtksource.completion.Completion completion))
  
          `step` The #GtkScrollStep by which to move the page (optional)
  
          `num` The amount of steps to move the page (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMovePage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.completion.Completion)))
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
    return connectSignalClosure("move-page", closure, after);
  }

  /**
      Connect to `PopulateContext` signal.
  
      Emitted just before starting to populate the completion with providers.
        You can use this signal to add additional attributes in the context.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion_context.CompletionContext context, gtksource.completion.Completion completion))
  
          `context` The #GtkSourceCompletionContext for the current completion (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopulateContext(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_context.CompletionContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.completion.Completion)))
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
    return connectSignalClosure("populate-context", closure, after);
  }

  /**
      Connect to `Show` signal.
  
      Emitted when the completion window is shown. The default handler
        will actually show the window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.completion.Completion completion))
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion.Completion)))
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
    return connectSignalClosure("show", closure, after);
  }
}
