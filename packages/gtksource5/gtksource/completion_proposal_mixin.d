module gtksource.completion_proposal_mixin;

public import gtksource.completion_proposal_iface_proxy;
public import gid.gid;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.types;

/**
    Interface for completion proposals.
  
  This interface is used to denote that an object is capable of being
  a completion proposal for `class@Completion`.
  
  Currently, no method or functions are required but additional methods
  may be added in the future. Proposals created by
  #GtkSourceCompletionProvider can use `func@GObject.IMPLEMENT_INTERFACE` to
  implement this with null for the interface init function.
*/
template CompletionProposalT()
{

  /**
      Gets the typed-text for the proposal, if supported by the implementation.
    
    Implementing this virtual-function is optional, but can be useful to allow
    external tooling to compare results.
    Returns:     a newly allocated string, or null
  */
  override string getTypedText()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_typed_text(cast(GtkSourceCompletionProposal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
