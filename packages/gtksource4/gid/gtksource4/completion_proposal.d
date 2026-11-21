/// Module for [CompletionProposal] interface
module gid.gtksource4.completion_proposal;

public import gid.core.basictypes;
public import gid.gtksource4.completion_proposal_iface_proxy;
import gid.core.gid;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/** */
interface CompletionProposal : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_proposal_get_type != &gidSymbolNotFound ? gtk_source_completion_proposal_get_type() : cast(GType)0;
  }

  /**
      Emits the "changed" signal on proposal. This should be called by
      implementations whenever the name, icon or info of the proposal has
      changed.
  */
  void changed();

  /**
      Get whether two proposal objects are the same.  This is used to (together
      with [gid.gtksource4.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([gid.glib2.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  */
  bool equal(gid.gtksource4.completion_proposal.CompletionProposal other);

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  */
  gid.gio2.icon.Icon getGicon();

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getIcon();

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  */
  string getIconName();

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [gid.glib2.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  */
  string getInfo();

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gid.gtksource4.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal.
  */
  string getLabel();

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gid.gtksource4.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  */
  string getMarkup();

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gid.gtksource4.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the text of proposal.
  */
  string getText();

  /**
      Get the hash value of proposal. This is used to (together with
      [gid.gtksource4.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([gid.glib2.global.directHash]).
      Returns: The hash value of proposal.
  */
  uint hash();

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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_proposal.CompletionProposal]
interface CompletionProposalGidBuilderImpl(T)
{
}
