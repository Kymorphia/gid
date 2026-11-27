/// Module for [CompletionProvider] interface mixin
module gid.gtksource4.completion_provider_mixin;

public import gid.core.basictypes;
public import gid.gtksource4.completion_provider;
public import gid.gtksource4.completion_provider_iface_proxy;
public import gid.core.utils;
public import gid.gdkpixbuf2.pixbuf;
public import gid.gio2.icon;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.text_iter;
public import gid.gtk3.widget;
public import gid.gtksource4.c.functions;
public import gid.gtksource4.c.types;
public import gid.gtksource4.completion_context;
public import gid.gtksource4.completion_info;
public import gid.gtksource4.completion_proposal;
public import gid.gtksource4.types;

/** */
template CompletionProviderT()
{

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
        iter = a #GtkTextIter. (modified in place, changes are seen by the caller)
      Returns: true to indicate that the proposal activation has been handled,
                 false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActivateProposal`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncActivateProposal(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtk3.text_iter.TextIter iter)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.activateProposal)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activateProposal(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get with what kind of activation the provider should be activated.
      Returns: a combination of #GtkSourceCompletionActivation.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActivation`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtksource4.types.CompletionActivation vfuncGetActivation()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getActivation)
      return typeof(return).init;

    GtkSourceCompletionActivation _cretval;
    _cretval = _klass.getActivation(cast(GtkSourceCompletionProvider*)this._cPtr);
    gid.gtksource4.types.CompletionActivation _retval = cast(gid.gtksource4.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetGicon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetGicon()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getGicon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getGicon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GdkPixbuf for the icon of the provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gdkpixbuf2.pixbuf.Pixbuf vfuncGetIcon()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GdkPixbuf* _cretval;
    _cretval = _klass.getIcon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of provider.
      Returns: The icon name to be used for the provider,
                 or null if the provider does not have a special icon.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIconName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetIconName()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getIconName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getIconName(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInfoWidget`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.widget.Widget vfuncGetInfoWidget(gid.gtksource4.completion_proposal.CompletionProposal proposal)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getInfoWidget)
      return typeof(return).init;

    GtkWidget* _cretval;
    _cretval = _klass.getInfoWidget(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the delay in milliseconds before starting interactive completion for
      this provider. A value of -1 indicates to use the default value as set
      by the #GtkSourceCompletion:auto-complete-delay property.
      Returns: the interactive delay in milliseconds.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInteractiveDelay`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetInteractiveDelay()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getInteractiveDelay)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getInteractiveDelay(cast(GtkSourceCompletionProvider*)this._cPtr);
    return _retval;
  }

  /**
      Get the name of the provider. This should be a translatable name for
      display to the user. For example: _("Document word completion provider"). The
      returned string must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the name of the provider.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getName(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the provider priority. The priority determines the order in which
      proposals appear in the completion popup. Higher priorities are sorted
      before lower priorities. The default priority is 0.
      Returns: the provider priority.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPriority`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetPriority()
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getPriority)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getPriority(cast(GtkSourceCompletionProvider*)this._cPtr);
    return _retval;
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStartIter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetStartIter(gid.gtksource4.completion_context.CompletionContext context, gid.gtksource4.completion_proposal.CompletionProposal proposal, out gid.gtk3.text_iter.TextIter iter)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.getStartIter)
      return typeof(return).init;

    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)_klass.getStartIter(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, _iter);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Get whether the provider match the context of completion detailed in
      context.
  
      Params:
        context = a #GtkSourceCompletionContext.
      Returns: true if provider matches the completion context, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMatch`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMatch(gid.gtksource4.completion_context.CompletionContext context)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.match)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.match(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Populate context with proposals from provider added with the
      [gid.gtksource4.completion_context.CompletionContext.addProposals] function.
  
      Params:
        context = a #GtkSourceCompletionContext.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPopulate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPopulate(gid.gtksource4.completion_context.CompletionContext context)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.populate)
      return;

    _klass.populate(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUpdateInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUpdateInfo(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtksource4.completion_info.CompletionInfo info)
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_provider.CompletionProvider._getGType);
    if (!_klass || !_klass.updateInfo)
      return;

    _klass.updateInfo(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, info ? cast(GtkSourceCompletionInfo*)info._cPtr(No.Dup) : null);
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
  override bool activateProposal(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_activate_proposal(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get with what kind of activation the provider should be activated.
      Returns: a combination of #GtkSourceCompletionActivation.
  */
  override gid.gtksource4.types.CompletionActivation getActivation() nothrow
  {
    GtkSourceCompletionActivation _cretval;
    _cretval = gtk_source_completion_provider_get_activation(cast(GtkSourceCompletionProvider*)this._cPtr);
    gid.gtksource4.types.CompletionActivation _retval = cast(gid.gtksource4.types.CompletionActivation)_cretval;
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_provider_get_gicon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GdkPixbuf for the icon of the provider.
      Returns: The icon to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override gid.gdkpixbuf2.pixbuf.Pixbuf getIcon() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_completion_provider_get_icon(cast(GtkSourceCompletionProvider*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of provider.
      Returns: The icon name to be used for the provider,
                 or null if the provider does not have a special icon.
  */
  override string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_provider_get_icon_name(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

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
  override gid.gtk3.widget.Widget getInfoWidget(gid.gtksource4.completion_proposal.CompletionProposal proposal) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_completion_provider_get_info_widget(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the delay in milliseconds before starting interactive completion for
      this provider. A value of -1 indicates to use the default value as set
      by the #GtkSourceCompletion:auto-complete-delay property.
      Returns: the interactive delay in milliseconds.
  */
  override int getInteractiveDelay() nothrow
  {
    int _retval;
    _retval = gtk_source_completion_provider_get_interactive_delay(cast(GtkSourceCompletionProvider*)this._cPtr);
    return _retval;
  }

  /**
      Get the name of the provider. This should be a translatable name for
      display to the user. For example: _("Document word completion provider"). The
      returned string must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the name of the provider.
  */
  override string getName() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_provider_get_name(cast(GtkSourceCompletionProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the provider priority. The priority determines the order in which
      proposals appear in the completion popup. Higher priorities are sorted
      before lower priorities. The default priority is 0.
      Returns: the provider priority.
  */
  override int getPriority() nothrow
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
  override bool getStartIter(gid.gtksource4.completion_context.CompletionContext context, gid.gtksource4.completion_proposal.CompletionProposal proposal, out gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_completion_provider_get_start_iter(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, _iter);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Get whether the provider match the context of completion detailed in
      context.
  
      Params:
        context = a #GtkSourceCompletionContext.
      Returns: true if provider matches the completion context, false otherwise.
  */
  override bool match(gid.gtksource4.completion_context.CompletionContext context) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_provider_match(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Populate context with proposals from provider added with the
      [gid.gtksource4.completion_context.CompletionContext.addProposals] function.
  
      Params:
        context = a #GtkSourceCompletionContext.
  */
  override void populate(gid.gtksource4.completion_context.CompletionContext context) nothrow
  {
    gtk_source_completion_provider_populate(cast(GtkSourceCompletionProvider*)this._cPtr, context ? cast(GtkSourceCompletionContext*)context._cPtr(No.Dup) : null);
  }

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
  override void updateInfo(gid.gtksource4.completion_proposal.CompletionProposal proposal, gid.gtksource4.completion_info.CompletionInfo info) nothrow
  {
    gtk_source_completion_provider_update_info(cast(GtkSourceCompletionProvider*)this._cPtr, proposal ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)proposal)._cPtr(No.Dup) : null, info ? cast(GtkSourceCompletionInfo*)info._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource4.completion_provider.CompletionProvider (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource4_completion_provider_CompletionProvider(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateProposal", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActivation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetGicon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInfoWidget", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInteractiveDelay", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPriority", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStartIter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMatch", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUpdateInfo", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource4.completion_provider.CompletionProvider vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource4_completion_provider_CompletionProvider(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateProposal", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "activate_proposal");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActivation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_activation");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetGicon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_gicon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtksource4.completion_provider.CompletionProvider.vfuncGetIconName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInfoWidget", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_info_widget");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInteractiveDelay", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_interactive_delay");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPriority", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_priority");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStartIter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "get_start_iter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMatch", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "match");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "populate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUpdateInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(iface, "update_info");
  }

  private static void _installIfaceVfunc_gid_gtksource4_completion_provider_CompletionProvider(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceCompletionProviderIface*)iface;

    switch (vfunc)
    {
      case "activate_proposal":
      {
        static extern(C) gboolean _vfuncActivateProposalTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.activateProposal)
              return (cast(typeof(&_vfuncActivateProposalTramp))_klass.activateProposal)(provider, proposal, iter);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncActivateProposal(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take), _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncActivateProposal");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.activateProposal = cast(typeof(_klass.activateProposal))&_vfuncActivateProposalTramp;
        break;
      }
      case "get_activation":
      {
        static extern(C) GtkSourceCompletionActivation _vfuncGetActivationTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getActivation)
              return (cast(typeof(&_vfuncGetActivationTramp))_klass.getActivation)(provider);
            return typeof(return).init;
          }

          gid.gtksource4.types.CompletionActivation _dretval;

          try
          {
            _dretval = _obj.vfuncGetActivation();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetActivation");
          }
          auto _retval = cast(GtkSourceCompletionActivation)_dretval;

          return _retval;
        }

        _klass.getActivation = cast(typeof(_klass.getActivation))&_vfuncGetActivationTramp;
        break;
      }
      case "get_gicon":
      {
        static extern(C) GIcon* _vfuncGetGiconTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getGicon)
              return (cast(typeof(&_vfuncGetGiconTramp))_klass.getGicon)(provider);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetGicon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetGicon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getGicon = cast(typeof(_klass.getGicon))&_vfuncGetGiconTramp;
        break;
      }
      case "get_icon":
      {
        static extern(C) GdkPixbuf* _vfuncGetIconTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(provider);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf.Pixbuf _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GdkPixbuf*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "get_info_widget":
      {
        static extern(C) GtkWidget* _vfuncGetInfoWidgetTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getInfoWidget)
              return (cast(typeof(&_vfuncGetInfoWidgetTramp))_klass.getInfoWidget)(provider, proposal);
            return typeof(return).init;
          }

          gid.gtk3.widget.Widget _dretval;

          try
          {
            _dretval = _obj.vfuncGetInfoWidget(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetInfoWidget");
          }
          auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getInfoWidget = cast(typeof(_klass.getInfoWidget))&_vfuncGetInfoWidgetTramp;
        break;
      }
      case "get_interactive_delay":
      {
        static extern(C) int _vfuncGetInteractiveDelayTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getInteractiveDelay)
              return (cast(typeof(&_vfuncGetInteractiveDelayTramp))_klass.getInteractiveDelay)(provider);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetInteractiveDelay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetInteractiveDelay");
          }
          return _retval;
        }

        _klass.getInteractiveDelay = cast(typeof(_klass.getInteractiveDelay))&_vfuncGetInteractiveDelayTramp;
        break;
      }
      case "get_name":
      {
        static extern(C) char* _vfuncGetNameTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getName)
              return (cast(typeof(&_vfuncGetNameTramp))_klass.getName)(provider);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetName();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetName");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getName = cast(typeof(_klass.getName))&_vfuncGetNameTramp;
        break;
      }
      case "get_priority":
      {
        static extern(C) int _vfuncGetPriorityTramp(GtkSourceCompletionProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getPriority)
              return (cast(typeof(&_vfuncGetPriorityTramp))_klass.getPriority)(provider);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetPriority();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetPriority");
          }
          return _retval;
        }

        _klass.getPriority = cast(typeof(_klass.getPriority))&_vfuncGetPriorityTramp;
        break;
      }
      case "get_start_iter":
      {
        static extern(C) gboolean _vfuncGetStartIterTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.getStartIter)
              return (cast(typeof(&_vfuncGetStartIterTramp))_klass.getStartIter)(provider, context, proposal, iter);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gtk3.text_iter.TextIter _iter;

          try
          {
            _dretval = _obj.vfuncGetStartIter(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_context.CompletionContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take), _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncGetStartIter");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
          {
            auto p_ = _iter._cPtr(Yes.Dup);
            *iter = *cast(GtkTextIter*)p_;
            gFree(p_);
          }

          return _retval;
        }

        _klass.getStartIter = cast(typeof(_klass.getStartIter))&_vfuncGetStartIterTramp;
        break;
      }
      case "match":
      {
        static extern(C) gboolean _vfuncMatchTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.match)
              return (cast(typeof(&_vfuncMatchTramp))_klass.match)(provider, context);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMatch(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_context.CompletionContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncMatch");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.match = cast(typeof(_klass.match))&_vfuncMatchTramp;
        break;
      }
      case "populate":
      {
        static extern(C) void _vfuncPopulateTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.populate)
              return (cast(typeof(&_vfuncPopulateTramp))_klass.populate)(provider, context);
            return;
          }

          try
          {
            _obj.vfuncPopulate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_context.CompletionContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncPopulate");
          }
        }

        _klass.populate = cast(typeof(_klass.populate))&_vfuncPopulateTramp;
        break;
      }
      case "update_info":
      {
        static extern(C) void _vfuncUpdateInfoTramp(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkSourceCompletionInfo* info) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtksource4.completion_provider.CompletionProvider._getGType);
            if (_klass && _klass.updateInfo)
              return (cast(typeof(&_vfuncUpdateInfoTramp))_klass.updateInfo)(provider, proposal, info);
            return;
          }

          try
          {
            _obj.vfuncUpdateInfo(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)proposal, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_info.CompletionInfo)(cast(void*)info, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_provider.CompletionProvider.vfuncUpdateInfo");
          }
        }

        _klass.updateInfo = cast(typeof(_klass.updateInfo))&_vfuncUpdateInfoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_provider.CompletionProvider]
template CompletionProviderGidBuilderT()
{
}
