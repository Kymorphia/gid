/// Module for [Completion] class
module gid.gtksource4.completion;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.text_iter;
import gid.gtk3.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.completion_context;
import gid.gtksource4.completion_info;
import gid.gtksource4.completion_proposal;
import gid.gtksource4.completion_provider;
import gid.gtksource4.types;
import gid.gtksource4.view;

/** */
@gidGir("Completion", "CompletionClass")
class Completion : gid.gobject2.object.ObjectWrap, gid.gtk3.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_get_type != &gidSymbolNotFound ? gtk_source_completion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletion";
  }

  /** Returns `this`, for use in `with` statements. */
  override Completion self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.completion.Completion]
      Returns: New builder object
  */
  static CompletionGidBuilder builder() nothrow
  {
    return new CompletionGidBuilder;
  }

  /**
      Get `accelerators` property.
      Returns: Number of keyboard accelerators to show for the first proposals. For
        example, to activate the first proposal, the user can press
        <keycombo><keycap>Alt</keycap><keycap>1</keycap></keycombo>.
  */
  @property uint accelerators() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("accelerators");
  }

  /**
      Set `accelerators` property.
      Params:
        propval = Number of keyboard accelerators to show for the first proposals. For
          example, to activate the first proposal, the user can press
          <keycombo><keycap>Alt</keycap><keycap>1</keycap></keycombo>.
  */
  @property void accelerators(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("accelerators", propval);
  }

  /**
      Get `autoCompleteDelay` property.
      Returns: Determines the popup delay (in milliseconds) at which the completion
        will be shown for interactive completion.
  */
  @property uint autoCompleteDelay() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("auto-complete-delay");
  }

  /**
      Set `autoCompleteDelay` property.
      Params:
        propval = Determines the popup delay (in milliseconds) at which the completion
          will be shown for interactive completion.
  */
  @property void autoCompleteDelay(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("auto-complete-delay", propval);
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
  @property uint proposalPageSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("proposal-page-size");
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
  @property void proposalPageSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("proposal-page-size", propval);
  }

  /**
      Get `providerPageSize` property.
      Returns: The scroll page size of the provider pages in the completion window.
        
        See the #GtkSourceCompletion::move-page signal.
  */
  @property uint providerPageSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("provider-page-size");
  }

  /**
      Set `providerPageSize` property.
      Params:
        propval = The scroll page size of the provider pages in the completion window.
          
          See the #GtkSourceCompletion::move-page signal.
  */
  @property void providerPageSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("provider-page-size", propval);
  }

  /**
      Get `rememberInfoVisibility` property.
      Returns: Determines whether the visibility of the info window should be
        saved when the completion is hidden, and restored when the completion
        is shown again.
  */
  @property bool rememberInfoVisibility() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("remember-info-visibility");
  }

  /**
      Set `rememberInfoVisibility` property.
      Params:
        propval = Determines whether the visibility of the info window should be
          saved when the completion is hidden, and restored when the completion
          is shown again.
  */
  @property void rememberInfoVisibility(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("remember-info-visibility", propval);
  }

  /**
      Get `selectOnShow` property.
      Returns: Determines whether the first proposal should be selected when the
        completion is first shown.
  */
  @property bool selectOnShow() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("select-on-show");
  }

  /**
      Set `selectOnShow` property.
      Params:
        propval = Determines whether the first proposal should be selected when the
          completion is first shown.
  */
  @property void selectOnShow(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("select-on-show", propval);
  }

  /**
      Get `showHeaders` property.
      Returns: Determines whether provider headers should be shown in the proposal
        list. It can be useful to disable when there is only one provider.
  */
  @property bool showHeaders() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-headers");
  }

  /**
      Set `showHeaders` property.
      Params:
        propval = Determines whether provider headers should be shown in the proposal
          list. It can be useful to disable when there is only one provider.
  */
  @property void showHeaders(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-headers", propval);
  }

  /**
      Get `showIcons` property.
      Returns: Determines whether provider and proposal icons should be shown in
        the completion popup.
  */
  @property bool showIcons() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-icons");
  }

  /**
      Set `showIcons` property.
      Params:
        propval = Determines whether provider and proposal icons should be shown in
          the completion popup.
  */
  @property void showIcons(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-icons", propval);
  }

  /**
      Get `view` property.
      Returns: The #GtkSourceView bound to the completion object.
  */
  @property gid.gtksource4.view.View view() nothrow
  {
    return getView();
  }

  mixin BuildableT!();

  /** */
  protected void vfuncActivateProposal()
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.activateProposal)
      return;

    _klass.activateProposal(cast(GtkSourceCompletion*)this._cPtr);
  }

  /**
      Hides the completion if it is active (visible).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHide` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncHide()
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.hide)
      return;

    _klass.hide(cast(GtkSourceCompletion*)this._cPtr);
  }

  /** */
  protected void vfuncMoveCursor(gid.gtk3.types.ScrollStep step, int num)
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkSourceCompletion*)this._cPtr, step, num);
  }

  /** */
  protected void vfuncMovePage(gid.gtk3.types.ScrollStep step, int num)
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.movePage)
      return;

    _klass.movePage(cast(GtkSourceCompletion*)this._cPtr, step, num);
  }

  /** */
  protected void vfuncPopulateContext(gid.gtksource4.completion_context.CompletionContext context)
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.populateContext)
      return;

    _klass.populateContext(cast(GtkSourceCompletion*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  protected bool vfuncProposalActivated(gid.gtksource4.completion_provider.CompletionProvider provider, gid.gtksource4.completion_proposal.CompletionProposal proposal)
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.proposalActivated)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposalActivated(cast(GtkSourceCompletion*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncShow()
  {
    auto _klass = cast(GtkSourceCompletionClass*)_vfuncClass;
    if (!_klass.show)
      return;

    _klass.show(cast(GtkSourceCompletion*)this._cPtr);
  }

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
  bool addProvider(gid.gtksource4.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_completion_add_provider(cast(GtkSourceCompletion*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Block interactive completion. This can be used to disable interactive
      completion when inserting or deleting text from the buffer associated with
      the completion. Use [gid.gtksource5.completion.Completion.unblockInteractive] to enable
      interactive completion again.
      
      This function may be called multiple times. It will continue to block
      interactive completion until [gid.gtksource5.completion.Completion.unblockInteractive]
      has been called the same number of times.
  */
  void blockInteractive() nothrow
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
        so if you invoke [gid.gtksource4.completion.Completion.start] with this context
        you don't need to unref it.
  */
  gid.gtksource4.completion_context.CompletionContext createContext(gid.gtk3.text_iter.TextIter position = null) nothrow
  {
    GtkSourceCompletionContext* _cretval;
    _cretval = gtk_source_completion_create_context(cast(GtkSourceCompletion*)this._cPtr, position ? cast(GtkTextIter*)position._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_context.CompletionContext)(cast(GtkSourceCompletionContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      The info widget is the window where the completion displays optional extra
      information of the proposal.
      Returns: The #GtkSourceCompletionInfo window
                                  associated with completion.
  */
  gid.gtksource4.completion_info.CompletionInfo getInfoWindow() nothrow
  {
    GtkSourceCompletionInfo* _cretval;
    _cretval = gtk_source_completion_get_info_window(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_info.CompletionInfo)(cast(GtkSourceCompletionInfo*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get list of providers registered on completion. The returned list is owned
      by the completion and should not be freed.
      Returns: list of #GtkSourceCompletionProvider.
  */
  gid.gtksource4.completion_provider.CompletionProvider[] getProviders() nothrow
  {
    GList* _cretval;
    _cretval = gtk_source_completion_get_providers(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gListToD!(gid.gtksource4.completion_provider.CompletionProvider, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      The #GtkSourceView associated with completion, or null if the view has been
      destroyed.
      Returns: The #GtkSourceView associated with
        completion, or null.
  */
  gid.gtksource4.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_completion_get_view(cast(GtkSourceCompletion*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Hides the completion if it is active (visible).
  */
  void hide() nothrow
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
  bool removeProvider(gid.gtksource4.completion_provider.CompletionProvider provider)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_completion_remove_provider(cast(GtkSourceCompletion*)this._cPtr, provider ? cast(GtkSourceCompletionProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Starts a new completion with the specified #GtkSourceCompletionContext and
      a list of potential candidate providers for completion.
      
      It can be convenient for showing a completion on-the-fly, without the need to
      add or remove providers to the #GtkSourceCompletion.
      
      Another solution is to add providers with
      [gid.gtksource5.completion.Completion.addProvider], and implement
      [gid.gtksource4.completion_provider.CompletionProvider.match] for each provider.
  
      Params:
        providers = a list of #GtkSourceCompletionProvider, or null.
        context = The #GtkSourceCompletionContext
          with which to start the completion.
      Returns: true if it was possible to the show completion window.
  */
  bool start(gid.gtksource4.completion_provider.CompletionProvider[] providers, gid.gtksource4.completion_context.CompletionContext context) nothrow
  {
    bool _retval;
    auto _providers = gListFromD!(gid.gtksource4.completion_provider.CompletionProvider)(providers);
    scope(exit) containerFree!(GList*, gid.gtksource4.completion_provider.CompletionProvider, GidOwnership.None)(_providers);
    _retval = cast(bool)gtk_source_completion_start(cast(GtkSourceCompletion*)this._cPtr, _providers, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Unblock interactive completion. This can be used after using
      [gid.gtksource5.completion.Completion.blockInteractive] to enable interactive completion
      again.
  */
  void unblockInteractive() nothrow
  {
    gtk_source_completion_unblock_interactive(cast(GtkSourceCompletion*)this._cPtr);
  }

  /**
      Connect to `ActivateProposal` signal.
  
      The #GtkSourceCompletion::activate-proposal signal is a
        keybinding signal which gets emitted when the user initiates
        a proposal activation.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the proposal
        activation programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.completion.Completion completion)`
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateProposal(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.activateProposal");
      }
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
  
          `void callback(gid.gtksource4.completion.Completion completion)`
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHide(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.hide");
      }
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
        
        When step is equal to [gid.gtk4.types.ScrollStep.Pages], the page size is defined by
        the #GtkSourceCompletion:proposal-page-size property. It is used for
        the <keycap>PageDown</keycap> and <keycap>PageUp</keycap> keys.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the cursor
        programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ScrollStep step, int num, gid.gtksource4.completion.Completion completion)`
  
          `step` The #GtkScrollStep by which to move the cursor (optional)
  
          `num` The amount of steps to move the cursor (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.moveCursor");
      }
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
        [gid.gobject2.global.signalEmitByName] if they need to control the page selection
        programmatically.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ScrollStep step, int num, gid.gtksource4.completion.Completion completion)`
  
          `step` The #GtkScrollStep by which to move the page (optional)
  
          `num` The amount of steps to move the page (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMovePage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.movePage");
      }
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
  
          `void callback(gid.gtksource4.completion_context.CompletionContext context, gid.gtksource4.completion.Completion completion)`
  
          `context` The #GtkSourceCompletionContext for the current completion (optional)
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopulateContext(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion_context.CompletionContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.populateContext");
      }
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
  
          `void callback(gid.gtksource4.completion.Completion completion)`
  
          `completion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion.Completion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.show");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Completion
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtksource4.completion.Completion), T.stringof ~ " is not derived from gid.gtksource4.completion.Completion");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateProposal", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "activate_proposal");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHide", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "hide");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMovePage", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "move_page");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulateContext", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "populate_context");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposalActivated", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "proposal_activated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShow", true)[0]) == gid.gtksource4.completion.Completion))
      _installVfunc(klass, "show");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceCompletionClass*)klass;

    switch (vfunc)
    {
      case "activate_proposal":
      {
        static extern(C) void _vfuncActivateProposalTramp(GtkSourceCompletion* completion) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.activateProposal)
              return (cast(typeof(&_vfuncActivateProposalTramp))_klass.activateProposal)(completion);
            return;
          }

          try
          {
            _obj.vfuncActivateProposal();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncActivateProposal");
          }
        }

        _klass.activateProposal = cast(typeof(_klass.activateProposal))&_vfuncActivateProposalTramp;
        break;
      }
      case "hide":
      {
        static extern(C) void _vfuncHideTramp(GtkSourceCompletion* completion) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.hide)
              return (cast(typeof(&_vfuncHideTramp))_klass.hide)(completion);
            return;
          }

          try
          {
            _obj.vfuncHide();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncHide");
          }
        }

        _klass.hide = cast(typeof(_klass.hide))&_vfuncHideTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) void _vfuncMoveCursorTramp(GtkSourceCompletion* completion, GtkScrollStep step, int num) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(completion, step, num);
            return;
          }

          try
          {
            _obj.vfuncMoveCursor(step, num);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncMoveCursor");
          }
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "move_page":
      {
        static extern(C) void _vfuncMovePageTramp(GtkSourceCompletion* completion, GtkScrollStep step, int num) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.movePage)
              return (cast(typeof(&_vfuncMovePageTramp))_klass.movePage)(completion, step, num);
            return;
          }

          try
          {
            _obj.vfuncMovePage(step, num);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncMovePage");
          }
        }

        _klass.movePage = cast(typeof(_klass.movePage))&_vfuncMovePageTramp;
        break;
      }
      case "populate_context":
      {
        static extern(C) void _vfuncPopulateContextTramp(GtkSourceCompletion* completion, GtkSourceCompletionContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.populateContext)
              return (cast(typeof(&_vfuncPopulateContextTramp))_klass.populateContext)(completion, context);
            return;
          }

          try
          {
            _obj.vfuncPopulateContext(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_context.CompletionContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncPopulateContext");
          }
        }

        _klass.populateContext = cast(typeof(_klass.populateContext))&_vfuncPopulateContextTramp;
        break;
      }
      case "proposal_activated":
      {
        static extern(C) gboolean _vfuncProposalActivatedTramp(GtkSourceCompletion* completion, GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.proposalActivated)
              return (cast(typeof(&_vfuncProposalActivatedTramp))_klass.proposalActivated)(completion, provider, proposal);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncProposalActivated(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_provider.CompletionProvider)(cast(void*)provider, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncProposalActivated");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.proposalActivated = cast(typeof(_klass.proposalActivated))&_vfuncProposalActivatedTramp;
        break;
      }
      case "show":
      {
        static extern(C) void _vfuncShowTramp(GtkSourceCompletion* completion) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtksource4.completion.Completion)(cast(void*)completion);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)completion);
            if (_klass.show)
              return (cast(typeof(&_vfuncShowTramp))_klass.show)(completion);
            return;
          }

          try
          {
            _obj.vfuncShow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion.Completion.vfuncShow");
          }
        }

        _klass.show = cast(typeof(_klass.show))&_vfuncShowTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion.Completion]
class CompletionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `accelerators` property.
      Params:
        propval = Number of keyboard accelerators to show for the first proposals. For
          example, to activate the first proposal, the user can press
          <keycombo><keycap>Alt</keycap><keycap>1</keycap></keycombo>.
      Returns: Builder instance for fluent chaining
  */
  T accelerators(uint propval) nothrow
  {
    return setProperty("accelerators", propval);
  }

  /**
      Set `autoCompleteDelay` property.
      Params:
        propval = Determines the popup delay (in milliseconds) at which the completion
          will be shown for interactive completion.
      Returns: Builder instance for fluent chaining
  */
  T autoCompleteDelay(uint propval) nothrow
  {
    return setProperty("auto-complete-delay", propval);
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
      Returns: Builder instance for fluent chaining
  */
  T proposalPageSize(uint propval) nothrow
  {
    return setProperty("proposal-page-size", propval);
  }

  /**
      Set `providerPageSize` property.
      Params:
        propval = The scroll page size of the provider pages in the completion window.
          
          See the #GtkSourceCompletion::move-page signal.
      Returns: Builder instance for fluent chaining
  */
  T providerPageSize(uint propval) nothrow
  {
    return setProperty("provider-page-size", propval);
  }

  /**
      Set `rememberInfoVisibility` property.
      Params:
        propval = Determines whether the visibility of the info window should be
          saved when the completion is hidden, and restored when the completion
          is shown again.
      Returns: Builder instance for fluent chaining
  */
  T rememberInfoVisibility(bool propval) nothrow
  {
    return setProperty("remember-info-visibility", propval);
  }

  /**
      Set `selectOnShow` property.
      Params:
        propval = Determines whether the first proposal should be selected when the
          completion is first shown.
      Returns: Builder instance for fluent chaining
  */
  T selectOnShow(bool propval) nothrow
  {
    return setProperty("select-on-show", propval);
  }

  /**
      Set `showHeaders` property.
      Params:
        propval = Determines whether provider headers should be shown in the proposal
          list. It can be useful to disable when there is only one provider.
      Returns: Builder instance for fluent chaining
  */
  T showHeaders(bool propval) nothrow
  {
    return setProperty("show-headers", propval);
  }

  /**
      Set `showIcons` property.
      Params:
        propval = Determines whether provider and proposal icons should be shown in
          the completion popup.
      Returns: Builder instance for fluent chaining
  */
  T showIcons(bool propval) nothrow
  {
    return setProperty("show-icons", propval);
  }

  /**
      Set `view` property.
      Params:
        propval = The #GtkSourceView bound to the completion object.
      Returns: Builder instance for fluent chaining
  */
  T view(gid.gtksource4.view.View propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.gtksource4.completion.Completion]
final class CompletionGidBuilder : CompletionGidBuilderImpl!CompletionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Completion build() nothrow
  {
    return new Completion(cast(void*)createGObject(Completion._getGType), Yes.Take);
  }
}
