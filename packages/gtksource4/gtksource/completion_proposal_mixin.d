/// Module for [CompletionProposal] interface mixin
module gtksource.completion_proposal_mixin;

public import gtksource.completion_proposal_iface_proxy;
public import gdkpixbuf.pixbuf;
public import gid.gid;
public import gio.icon;
public import gobject.dclosure;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.types;

/** */
template CompletionProposalT()
{

  /**
      Emits the "changed" signal on proposal. This should be called by
      implementations whenever the name, icon or info of the proposal has
      changed.
  */
  override void changed()
  {
    gtk_source_completion_proposal_changed(cast(GtkSourceCompletionProposal*)this._cPtr);
  }

  /**
      Get whether two proposal objects are the same.  This is used to (together
      with [gtksource.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([glib.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  */
  override bool equal(gtksource.completion_proposal.CompletionProposal other)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_proposal_equal(cast(GtkSourceCompletionProposal*)this._cPtr, other ? cast(GtkSourceCompletionProposal*)(cast(gobject.object.ObjectWrap)other)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  */
  override gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_proposal_get_gicon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  */
  override gdkpixbuf.pixbuf.Pixbuf getIcon()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  */
  override string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon_name(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [glib.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  */
  override string getInfo()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_info(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gtksource.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [glib.global.gfree].
      Returns: a new string containing the label of proposal.
  */
  override string getLabel()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_label(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gtksource.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [glib.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  */
  override string getMarkup()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_markup(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gtksource.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [glib.global.gfree].
      Returns: a new string containing the text of proposal.
  */
  override string getText()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_text(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the hash value of proposal. This is used to (together with
      [gtksource.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([glib.global.directHash]).
      Returns: The hash value of proposal.
  */
  override uint hash()
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
  
          $(D void callback(gtksource.completion_proposal.CompletionProposal completionProposal))
  
          `completionProposal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.completion_proposal.CompletionProposal)))
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
    return connectSignalClosure("changed", closure, after);
  }
}
