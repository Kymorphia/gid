/// Module for [CompletionProvider] interface mixin
module gtksource.completion_provider_mixin;

public import gtksource.completion_provider_iface_proxy;
public import gdkpixbuf.pixbuf;
public import gid.gid;
public import gio.icon;
public import gobject.object;
public import gtk.text_iter;
public import gtk.widget;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.completion_context;
public import gtksource.completion_info;
public import gtksource.completion_proposal;
public import gtksource.types;

/** */
template CompletionProviderT()
{

  /**
      Activate proposal at iter. When this functions returns false, the default
      activation of proposal will take place which replaces the word at iter
      with the text of proposal (see [gtksource.completion_proposal.CompletionProposal.getText]).
      
      Here is how the default activation selects the boundaries of the word to
      replace. The end of the word is iter. For the start of the word, it depends
      on whether a start iter is defined for proposal (see
      [gtksource.completion_provider.CompletionProvider.getStartIter]). If a start iter is defined,
      the start of the word is the start iter. Else, the word (as long as possible)
      will contain only alphanumerical and the "_" characters.
  
      Params:
        proposal = a #GtkSourceCompletionProposal.
        iter = a #GtkTextIter.
      Returns: true to indicate that the proposal activation has been handled,
                 false otherwise.
  */
  override bool activateProposal(gtksource.completion_proposal.CompletionProposal proposal, gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_activate_proposal(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gobject.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get with what kind of activation the provider should be activated.
      Returns: a combination of #GtkSourceCompletionActivation.
  */
  override gtksource.types.CompletionActivation getActivation()
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_provider_get_activation(cast(GtkSourceCompletionProvider*)this._cPtr);
    gtksource.types.CompletionActivation _retval = cast(gtksource.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_provider_get_gicon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GdkPixbuf for the icon of the provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override gdkpixbuf.pixbuf.Pixbuf getIcon()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_completion_provider_get_icon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of provider.
      Returns: The icon name to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_provider_get_icon_name(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get a customized info widget to show extra information of a proposal.
      This allows for customized widgets on a proposal basis, although in general
      providers will have the same custom widget for all their proposals and
      proposal can be ignored. The implementation of this function is optional.
      
      If this function is not implemented, the default widget is a #GtkLabel. The
      return value of [gtksource.completion_proposal.CompletionProposal.getInfo] is used as the
      content of the #GtkLabel.
      
      <note>
        <para>
          If implemented, [gtksource.completion_provider.CompletionProvider.updateInfo]
          <emphasis>must</emphasis> also be implemented.
        </para>
      </note>
  
      Params:
        proposal = a currently selected #GtkSourceCompletionProposal.
      Returns: a custom #GtkWidget to show extra
        information about proposal, or null if the provider does not have a special
        info widget.
  */
  override gtk.widget.Widget getInfoWidget(gtksource.completion_proposal.CompletionProposal proposal)
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_completion_provider_get_info_widget(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gobject.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the delay in milliseconds before starting interactive completion for
      this provider. A value of -1 indicates to use the default value as set
      by the #GtkSourceCompletion:auto-complete-delay property.
      Returns: the interactive delay in milliseconds.
  */
  override int getInteractiveDelay()
  {
    int _retval;
    _retval = gtk_source_completion_provider_get_interactive_delay(cast(GtkSourceCompletionProvider*)this._cPtr);
    return _retval;
  }

  /**
      Get the name of the provider. This should be a translatable name for
      display to the user. For example: _("Document word completion provider"). The
      returned string must be freed with [glib.global.gfree].
      Returns: a new string containing the name of the provider.
  */
  override string getName()
  {
    char* _cretval;
    _cretval = gtk_source_completion_provider_get_name(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the provider priority. The priority determines the order in which
      proposals appear in the completion popup. Higher priorities are sorted
      before lower priorities. The default priority is 0.
      Returns: the provider priority.
  */
  override int getPriority()
  {
    int _retval;
    _retval = gtk_source_completion_provider_get_priority(cast(GtkSourceCompletionProvider*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GtkTextIter at which the completion for proposal starts. When
      implemented, this information is used to position the completion window
      accordingly when a proposal is selected in the completion window. The
      proposal text inside the completion window is aligned on iter.
      
      If this function is not implemented, the word boundary is taken to position
      the completion window. See [gtksource.completion_provider.CompletionProvider.activateProposal]
      for an explanation on the word boundaries.
      
      When the proposal is activated, the default handler uses iter as the start
      of the word to replace. See
      [gtksource.completion_provider.CompletionProvider.activateProposal] for more information.
  
      Params:
        context = a #GtkSourceCompletionContext.
        proposal = a #GtkSourceCompletionProposal.
        iter = a #GtkTextIter.
      Returns: true if iter was set for proposal, false otherwise.
  */
  override bool getStartIter(gtksource.completion_context.CompletionContext context, gtksource.completion_proposal.CompletionProposal proposal, out gtk.text_iter.TextIter iter)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_source_completion_provider_get_start_iter(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gobject.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, &_iter);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Get whether the provider match the context of completion detailed in
      context.
  
      Params:
        context = a #GtkSourceCompletionContext.
      Returns: true if provider matches the completion context, false otherwise.
  */
  override bool match(gtksource.completion_context.CompletionContext context)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_match(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Populate context with proposals from provider added with the
      [gtksource.completion_context.CompletionContext.addProposals] function.
  
      Params:
        context = a #GtkSourceCompletionContext.
  */
  override void populate(gtksource.completion_context.CompletionContext context)
  {
    gtk_source_completion_provider_populate(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Update extra information shown in info for proposal.
      
      <note>
        <para>
          This function <emphasis>must</emphasis> be implemented when
          [gtksource.completion_provider.CompletionProvider.getInfoWidget] is implemented.
        </para>
      </note>
  
      Params:
        proposal = a #GtkSourceCompletionProposal.
        info = a #GtkSourceCompletionInfo.
  */
  override void updateInfo(gtksource.completion_proposal.CompletionProposal proposal, gtksource.completion_info.CompletionInfo info)
  {
    gtk_source_completion_provider_update_info(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gobject.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, info ? cast(GtkSourceCompletionInfo*)info._cPtr(No.Dup) : null);
  }
}
