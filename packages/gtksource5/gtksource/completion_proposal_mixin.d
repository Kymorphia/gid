/// Module for [CompletionProposal] interface mixin
module gtksource.completion_proposal_mixin;

public import gtksource.completion_proposal_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
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
      Returns: a newly allocated string, or null
  */
  override string getTypedText()
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_typed_text(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtksource.completion_proposal.CompletionProposal]
template CompletionProposalGidBuilderT()
{
}
