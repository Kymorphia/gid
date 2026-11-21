/// Module for [CompletionProposal] interface mixin
module gid.gtksource4.completion_proposal_mixin;

public import gid.core.basictypes;
public import gid.gtksource4.completion_proposal_iface_proxy;
public import gid.core.gid;
public import gid.gdkpixbuf2.pixbuf;
public import gid.gio2.icon;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource4.c.functions;
public import gid.gtksource4.c.types;
public import gid.gtksource4.types;

/** */
template CompletionProposalT()
{

  /**
      Emits the "changed" signal on proposal. This should be called by
      implementations whenever the name, icon or info of the proposal has
      changed.
  */
  override void changed() nothrow
  {
    gtk_source_completion_proposal_changed(cast(GtkSourceCompletionProposal*)this._cPtr);
  }

  /**
      Get whether two proposal objects are the same.  This is used to (together
      with [gid.gtksource4.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([gid.glib2.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  */
  override bool equal(gid.gtksource4.completion_proposal.CompletionProposal other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_proposal_equal(cast(GtkSourceCompletionProposal*)this._cPtr, other ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)other)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  */
  override gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_proposal_get_gicon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  */
  override gid.gdkpixbuf2.pixbuf.Pixbuf getIcon() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  */
  override string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon_name(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [gid.glib2.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  */
  override string getInfo() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_info(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gid.gtksource4.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal.
  */
  override string getLabel() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_label(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gid.gtksource4.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  */
  override string getMarkup() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_markup(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gid.gtksource4.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the text of proposal.
  */
  override string getText() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_text(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the hash value of proposal. This is used to (together with
      [gid.gtksource4.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([gid.glib2.global.directHash]).
      Returns: The hash value of proposal.
  */
  override uint hash() nothrow
  {
    uint _retval;
    _retval = gtk_source_completion_proposal_hash(cast(GtkSourceCompletionProposal*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the proposal has changed. The completion popup
        will react to this by updating the shown information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.completion_proposal.CompletionProposal completionProposal)`
  
          `completionProposal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion_proposal.CompletionProposal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_proposal.CompletionProposal]
template CompletionProposalGidBuilderT()
{
}
