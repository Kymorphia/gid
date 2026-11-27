/// Module for [CompletionProposal] interface mixin
module gid.gtksource4.completion_proposal_mixin;

public import gid.core.basictypes;
public import gid.gtksource4.completion_proposal;
public import gid.gtksource4.completion_proposal_iface_proxy;
public import gid.core.utils;
public import gid.gdkpixbuf2.pixbuf;
public import gid.gio2.icon;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource4.c.functions;
public import gid.gtksource4.c.types;
public import gid.gtksource4.types;

/** */
template CompletionProposalT()
{

  /**
      Emits the "changed" signal on proposal. This should be called by
      implementations whenever the name, icon or info of the proposal has
      changed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.changed)
      return;

    _klass.changed(cast(GtkSourceCompletionProposal*)this._cPtr);
  }

  /**
      Get whether two proposal objects are the same.  This is used to (together
      with [gid.gtksource4.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([gid.glib2.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEqual`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEqual(gid.gtksource4.completion_proposal.CompletionProposal other)
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.equal)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.equal(cast(GtkSourceCompletionProposal*)this._cPtr, other ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)other)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetGicon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetGicon()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getGicon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getGicon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gdkpixbuf2.pixbuf.Pixbuf vfuncGetIcon()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GdkPixbuf* _cretval;
    _cretval = _klass.getIcon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIconName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetIconName()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getIconName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getIconName(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [gid.glib2.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetInfo()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getInfo)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getInfo(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gid.gtksource4.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetLabel`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetLabel()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getLabel)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getLabel(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gid.gtksource4.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMarkup`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetMarkup()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getMarkup)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getMarkup(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gid.gtksource4.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the text of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetText()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getText)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getText(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the hash value of proposal. This is used to (together with
      [gid.gtksource4.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([gid.glib2.global.directHash]).
      Returns: The hash value of proposal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHash`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncHash()
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.hash)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.hash(cast(GtkSourceCompletionProposal*)this._cPtr);
    return _retval;
  }

  /**
      Emits the "changed" signal on proposal. This should be called by
      implementations whenever the name, icon or info of the proposal has
      changed.
  */
  override void changed() nothrow
  {
    gtk_source_completion_proposal_changed(cast(GtkSourceCompletionProposal*)this._cPtr);
  }

  /**
      Get whether two proposal objects are the same.  This is used to (together
      with [gid.gtksource4.completion_proposal.CompletionProposal.hash]) to match proposals in the
      completion model. By default, it uses direct equality ([gid.glib2.global.directEqual]).
  
      Params:
        other = a #GtkSourceCompletionProposal.
      Returns: true if proposal and object are the same proposal
  */
  override bool equal(gid.gtksource4.completion_proposal.CompletionProposal other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_completion_proposal_equal(cast(GtkSourceCompletionProposal*)this._cPtr, other ? cast(GtkSourceCompletionProposal*)(cast(gid.gobject2.object.ObjectWrap)other)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GIcon for the icon of proposal.
      Returns: A #GIcon with the icon of proposal.
  */
  override gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_completion_proposal_get_gicon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf for the icon of proposal.
      Returns: A #GdkPixbuf with the icon of proposal.
  */
  override gid.gdkpixbuf2.pixbuf.Pixbuf getIcon() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon(cast(GtkSourceCompletionProposal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of proposal.
      Returns: The icon name of proposal.
  */
  override string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_completion_proposal_get_icon_name(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets extra information associated to the proposal. This information will be
      used to present the user with extra, detailed information about the
      selected proposal. The returned string must be freed with [gid.glib2.global.gfree].
      Returns: a newly-allocated string containing
        extra information of proposal or null if no extra information is associated
        to proposal.
  */
  override string getInfo() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_info(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal. The label is shown in the list of proposals as
      plain text. If you need any markup (such as bold or italic text), you have
      to implement [gid.gtksource4.completion_proposal.CompletionProposal.getMarkup]. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal.
  */
  override string getLabel() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_label(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the label of proposal with markup. The label is shown in the list of
      proposals and may contain markup. This will be used instead of
      [gid.gtksource4.completion_proposal.CompletionProposal.getLabel] if implemented. The returned string
      must be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the label of proposal with markup.
  */
  override string getMarkup() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_markup(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the text of proposal. The text that is inserted into
      the text buffer when the proposal is activated by the default activation.
      You are free to implement a custom activation handler in the provider and
      not implement this function. For more information, see
      [gid.gtksource4.completion_provider.CompletionProvider.activateProposal]. The returned string must
      be freed with [gid.glib2.global.gfree].
      Returns: a new string containing the text of proposal.
  */
  override string getText() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_text(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the hash value of proposal. This is used to (together with
      [gid.gtksource4.completion_proposal.CompletionProposal.equal]) to match proposals in the completion
      model. By default, it uses a direct hash ([gid.glib2.global.directHash]).
      Returns: The hash value of proposal.
  */
  override uint hash() nothrow
  {
    uint _retval;
    _retval = gtk_source_completion_proposal_hash(cast(GtkSourceCompletionProposal*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the proposal has changed. The completion popup
        will react to this by updating the shown information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.completion_proposal.CompletionProposal completionProposal)`
  
          `completionProposal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.completion_proposal.CompletionProposal)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource4.completion_proposal.CompletionProposal (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource4_completion_proposal_CompletionProposal(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetGicon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInfo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLabel", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMarkup", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource4.completion_proposal.CompletionProposal vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource4_completion_proposal_CompletionProposal(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "equal");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetGicon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_gicon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetIconName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_info");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLabel", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_label");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMarkup", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_markup");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "get_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(iface, "hash");
  }

  private static void _installIfaceVfunc_gid_gtksource4_completion_proposal_CompletionProposal(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceCompletionProposalIface*)iface;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(proposal);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "equal":
      {
        static extern(C) gboolean _vfuncEqualTramp(GtkSourceCompletionProposal* proposal, GtkSourceCompletionProposal* other) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.equal)
              return (cast(typeof(&_vfuncEqualTramp))_klass.equal)(proposal, other);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEqual(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.completion_proposal.CompletionProposal)(cast(void*)other, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncEqual");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.equal = cast(typeof(_klass.equal))&_vfuncEqualTramp;
        break;
      }
      case "get_gicon":
      {
        static extern(C) GIcon* _vfuncGetGiconTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getGicon)
              return (cast(typeof(&_vfuncGetGiconTramp))_klass.getGicon)(proposal);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetGicon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetGicon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getGicon = cast(typeof(_klass.getGicon))&_vfuncGetGiconTramp;
        break;
      }
      case "get_icon":
      {
        static extern(C) GdkPixbuf* _vfuncGetIconTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(proposal);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf.Pixbuf _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GdkPixbuf*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "get_info":
      {
        static extern(C) char* _vfuncGetInfoTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getInfo)
              return (cast(typeof(&_vfuncGetInfoTramp))_klass.getInfo)(proposal);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetInfo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetInfo");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getInfo = cast(typeof(_klass.getInfo))&_vfuncGetInfoTramp;
        break;
      }
      case "get_label":
      {
        static extern(C) char* _vfuncGetLabelTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getLabel)
              return (cast(typeof(&_vfuncGetLabelTramp))_klass.getLabel)(proposal);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetLabel();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetLabel");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getLabel = cast(typeof(_klass.getLabel))&_vfuncGetLabelTramp;
        break;
      }
      case "get_markup":
      {
        static extern(C) char* _vfuncGetMarkupTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getMarkup)
              return (cast(typeof(&_vfuncGetMarkupTramp))_klass.getMarkup)(proposal);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetMarkup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetMarkup");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getMarkup = cast(typeof(_klass.getMarkup))&_vfuncGetMarkupTramp;
        break;
      }
      case "get_text":
      {
        static extern(C) char* _vfuncGetTextTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getText)
              return (cast(typeof(&_vfuncGetTextTramp))_klass.getText)(proposal);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetText();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncGetText");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getText = cast(typeof(_klass.getText))&_vfuncGetTextTramp;
        break;
      }
      case "hash":
      {
        static extern(C) uint _vfuncHashTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource4.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.hash)
              return (cast(typeof(&_vfuncHashTramp))_klass.hash)(proposal);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncHash();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.completion_proposal.CompletionProposal.vfuncHash");
          }
          return _retval;
        }

        _klass.hash = cast(typeof(_klass.hash))&_vfuncHashTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_proposal.CompletionProposal]
template CompletionProposalGidBuilderT()
{
}
