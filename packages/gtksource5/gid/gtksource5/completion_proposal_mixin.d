/// Module for [CompletionProposal] interface mixin
module gid.gtksource5.completion_proposal_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.completion_proposal_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource5.c.functions;
public import gid.gtksource5.c.types;
public import gid.gtksource5.types;

/**
    Interface for completion proposals.
    
    This interface is used to denote that an object is capable of being
    a completion proposal for [gid.gtksource5.completion.Completion].
    
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTypedText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetTypedText()
  {
    auto _klass = cast(GtkSourceCompletionProposalInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.completion_proposal.CompletionProposal._getGType);
    if (!_klass || !_klass.getTypedText)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getTypedText(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the typed-text for the proposal, if supported by the implementation.
      
      Implementing this virtual-function is optional, but can be useful to allow
      external tooling to compare results.
      Returns: a newly allocated string, or null
  */
  override string getTypedText() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_completion_proposal_get_typed_text(cast(GtkSourceCompletionProposal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource5.completion_proposal.CompletionProposal (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource5_completion_proposal_CompletionProposal(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypedText", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource5.completion_proposal.CompletionProposal vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource5_completion_proposal_CompletionProposal(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypedText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_completion_proposal_CompletionProposal(iface, "get_typed_text");
  }

  private static void _installIfaceVfunc_gid_gtksource5_completion_proposal_CompletionProposal(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceCompletionProposalInterface*)iface;

    switch (vfunc)
    {
      case "get_typed_text":
      {
        static extern(C) char* _vfuncGetTypedTextTramp(GtkSourceCompletionProposal* proposal) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)proposal);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceCompletionProposalInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proposal), gid.gtksource5.completion_proposal.CompletionProposal._getGType);
            if (_klass && _klass.getTypedText)
              return (cast(typeof(&_vfuncGetTypedTextTramp))_klass.getTypedText)(proposal);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetTypedText();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.completion_proposal.CompletionProposal.vfuncGetTypedText");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getTypedText = cast(typeof(_klass.getTypedText))&_vfuncGetTypedTextTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_proposal.CompletionProposal]
template CompletionProposalGidBuilderT()
{
}
