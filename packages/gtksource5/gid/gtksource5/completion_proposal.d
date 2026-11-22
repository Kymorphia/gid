/// Module for [CompletionProposal] interface
module gid.gtksource5.completion_proposal;

public import gid.core.basictypes;
public import gid.gtksource5.completion_proposal_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Interface for completion proposals.
    
    This interface is used to denote that an object is capable of being
    a completion proposal for [gid.gtksource5.completion.Completion].
    
    Currently, no method or functions are required but additional methods
    may be added in the future. Proposals created by
    #GtkSourceCompletionProvider can use `func@GObject.IMPLEMENT_INTERFACE` to
    implement this with null for the interface init function.
*/
interface CompletionProposal : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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

/// Fluent builder implementation template for [gid.gtksource5.completion_proposal.CompletionProposal]
interface CompletionProposalGidBuilderImpl(T)
{
}
