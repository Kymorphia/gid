/// Module for [CompletionProposalIfaceProxy] interface proxy object
module gtksource.completion_proposal_iface_proxy;

import gobject.object;
import gtksource.completion_proposal;
import gtksource.completion_proposal_mixin;

/// Proxy object for [gtksource.completion_proposal.CompletionProposal] interface when a GObject has no applicable D binding
class CompletionProposalIfaceProxy : IfaceProxy, gtksource.completion_proposal.CompletionProposal
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtksource.completion_proposal.CompletionProposal);
  }

  mixin CompletionProposalT!();
}
