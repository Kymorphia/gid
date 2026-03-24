/// Module for [CompletionProposal] interface
module gtksource.completion_proposal;

public import gtksource.completion_proposal_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Interface for completion proposals.
    
    This interface is used to denote that an object is capable of being
    a completion proposal for `class@Completion`.
    
    Currently, no method or functions are required but additional methods
    may be added in the future. Proposals created by
    #GtkSourceCompletionProvider can use `func@GObject.IMPLEMENT_INTERFACE` to
    implement this with null for the interface init function.
*/
interface CompletionProposal
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_proposal_get_type != &gidSymbolNotFound ? gtk_source_completion_proposal_get_type() : cast(GType)0;
  }

  /**
      Gets the typed-text for the proposal, if supported by the implementation.
      
      Implementing this virtual-function is optional, but can be useful to allow
      external tooling to compare results.
      Returns: a newly allocated string, or null
  */
  string getTypedText();
}

interface CompletionProposalGidBuilderImpl(T)
{
}
