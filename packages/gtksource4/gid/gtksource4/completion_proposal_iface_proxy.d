/// Module for [CompletionProposalIfaceProxy] interface proxy object
module gid.gtksource4.completion_proposal_iface_proxy;

import gid.gobject2.object;
import gid.gtksource4.completion_proposal;
import gid.gtksource4.completion_proposal_mixin;

/// Proxy object for [gid.gtksource4.completion_proposal.CompletionProposal] interface when a GObject has no applicable D binding
class CompletionProposalIfaceProxy : IfaceProxy, gid.gtksource4.completion_proposal.CompletionProposal
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource4.completion_proposal.CompletionProposal);
  }

  mixin CompletionProposalT!();
}
