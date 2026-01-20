/// Module for [CompletionProposal] interface
module gtksource.completion_proposal;

public import gtksource.completion_proposal_iface_proxy;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
interface CompletionProposal
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
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
      with [gtksource.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([glib.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  */
  bool equal(gtksource.completion_proposal.CompletionProposal other);

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  */
  gio.icon.Icon getGicon();

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  */
  gdkpixbuf.pixbuf.Pixbuf getIcon();

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  */
  string getIconName();

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [glib.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  */
  string getInfo();

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gtksource.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [glib.global.gfree].
      Returns: a new string containing the label of proposal.
  */
  string getLabel();

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gtksource.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [glib.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  */
  string getMarkup();

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gtksource.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [glib.global.gfree].
      Returns: a new string containing the text of proposal.
  */
  string getText();

  /**
      Get the hash value of proposal. This is used to (together with
      [gtksource.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([glib.global.directHash]).
      Returns: The hash value of proposal.
  */
  uint hash();

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
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After);
}
