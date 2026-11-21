/// Module for [CompletionProvider] interface
module gid.gtksource4.completion_provider;

public import gid.core.basictypes;
public import gid.gtksource4.completion_provider_iface_proxy;
import gid.core.gid;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.text_iter;
import gid.gtk3.widget;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.completion_context;
import gid.gtksource4.completion_info;
import gid.gtksource4.completion_proposal;
import gid.gtksource4.types;

/** */
interface CompletionProvider : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_provider_get_type != &gidSymbolNotFound ? gtk_source_completion_provider_get_type() : cast(GType)0;
  }

  /**
      Activate proposal at iter. When this functions returns false, the default
      activation of proposal will take place which replaces the word at iter
      with the text of proposal (see [gid.gtksource4.completion_proposal.CompletionProposal.getText]).
      
      Here is how the default activation selects the boundaries of the word to
      replace. The end of the word is iter. For the start of the word, it depends
      on whether a start iter is defined for proposal (see
      [gid.gtksource4.completion_provider.CompletionProvider.getStartIter]). If a start iter is defined,
      the start of the word is the start iter. Else, the word (as long as possible)
      will contain only alphanumerical and the "_" characters.
  
      Params:
        proposal = a #GtkSourceCompletionProposal.
        iter = a #GtkTextIter.
      Returns: true to indicate that the proposal activation has been handled,
                 false otherwise.
  */
  bool activateProposal(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtk3.text_iter.TextIter iter);

  /**
      Get with what kind of activation the provider should be activated.
      Returns: a combination of #GtkSourceCompletionActivation.
  */
  gid.gtksource4.types.CompletionActivation getActivation();

  /**
      Gets the #GIcon for the icon of provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  gid.gio2.icon.Icon getGicon();

  /**
      Get the #GdkPixbuf for the icon of the provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getIcon();

  /**
      Gets the icon name of provider.
      Returns: The icon name to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  string getIconName();

  /**
      Get a customized info widget to show extra information of a proposal.
      This allows for customized widgets on a proposal basis, although in general
      providers will have the same custom widget for all their proposals and
      proposal can be ignored. The implementation of this function is optional.
      
      If this function is not implemented, the default widget is a #GtkLabel. The
      return value of [gid.gtksource4.completion_proposal.CompletionProposal.getInfo] is used as the
      content of the #GtkLabel.
      
      <note>
        <para>
          If implemented, [gid.gtksource4.completion_provider.CompletionProvider.updateInfo]
          <emphasis>must</emphasis> also be implemented.
        </para>
      </note>
  
      Params:
        proposal = a currently selected #GtkSourceCompletionProposal.
      Returns: a custom #GtkWidget to show extra
        information about proposal, or null if the provider does not have a special
        info widget.
  */
  gid.gtk3.widget.Widget getInfoWidget(gid.gtksource4.completion_proposal.CompletionProposal proposal);

  /**
      Get the delay in milliseconds before starting interactive completion for
      this provider. A value of -1 indicates to use the default value as set
      by the #GtkSourceCompletion:auto-complete-delay property.
      Returns: the interactive delay in milliseconds.
  */
  int getInteractiveDelay();

  /**
      Get the name of the provider. This should be a translatable name for
      display to the user. For example: _("Document word completion provider"). The
      returned string must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the name of the provider.
  */
  string getName();

  /**
      Get the provider priority. The priority determines the order in which
      proposals appear in the completion popup. Higher priorities are sorted
      before lower priorities. The default priority is 0.
      Returns: the provider priority.
  */
  int getPriority();

  /**
      Get the #GtkTextIter at which the completion for proposal starts. When
      implemented, this information is used to position the completion window
      accordingly when a proposal is selected in the completion window. The
      proposal text inside the completion window is aligned on iter.
      
      If this function is not implemented, the word boundary is taken to position
      the completion window. See [gid.gtksource4.completion_provider.CompletionProvider.activateProposal]
      for an explanation on the word boundaries.
      
      When the proposal is activated, the default handler uses iter as the start
      of the word to replace. See
      [gid.gtksource4.completion_provider.CompletionProvider.activateProposal] for more information.
  
      Params:
        context = a #GtkSourceCompletionContext.
        proposal = a #GtkSourceCompletionProposal.
        iter = a #GtkTextIter.
      Returns: true if iter was set for proposal, false otherwise.
  */
  bool getStartIter(gid.gtksource4.completion_context.CompletionContext context, gid.gtksource4.completion_proposal.CompletionProposal proposal, out gid.gtk3.text_iter.TextIter iter);

  /**
      Get whether the provider match the context of completion detailed in
      context.
  
      Params:
        context = a #GtkSourceCompletionContext.
      Returns: true if provider matches the completion context, false otherwise.
  */
  bool match(gid.gtksource4.completion_context.CompletionContext context);

  /**
      Populate context with proposals from provider added with the
      [gid.gtksource4.completion_context.CompletionContext.addProposals] function.
  
      Params:
        context = a #GtkSourceCompletionContext.
  */
  void populate(gid.gtksource4.completion_context.CompletionContext context);

  /**
      Update extra information shown in info for proposal.
      
      <note>
        <para>
          This function <emphasis>must</emphasis> be implemented when
          [gid.gtksource4.completion_provider.CompletionProvider.getInfoWidget] is implemented.
        </para>
      </note>
  
      Params:
        proposal = a #GtkSourceCompletionProposal.
        info = a #GtkSourceCompletionInfo.
  */
  void updateInfo(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtksource4.completion_info.CompletionInfo info);
}

/// Fluent builder implementation template for [gid.gtksource4.completion_provider.CompletionProvider]
interface CompletionProviderGidBuilderImpl(T)
{
}
