/// Module for [HSTSEnforcer] class
module soup.hstsenforcer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.hstspolicy;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    Automatic HTTP Strict Transport Security enforcing for `class@Session`.
    
    A #SoupHSTSEnforcer stores HSTS policies and enforces them when
    required. #SoupHSTSEnforcer implements `iface@SessionFeature`, so you
    can add an HSTS enforcer to a session with
    [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType].
    
    #SoupHSTSEnforcer keeps track of all the HTTPS destinations that,
    when connected to, return the Strict-Transport-Security header with
    valid values. #SoupHSTSEnforcer will forget those destinations
    upon expiry or when the server requests it.
    
    When the `class@Session` the #SoupHSTSEnforcer is attached to queues or
    restarts a message, the #SoupHSTSEnforcer will rewrite the URI to HTTPS if
    the destination is a known HSTS host and is contacted over an insecure
    transport protocol (HTTP). Users of #SoupHSTSEnforcer are advised to listen
    to changes in the `property@Message:uri` property in order to be aware of
    changes in the message URI.
    
    Note that #SoupHSTSEnforcer does not support any form of long-term
    HSTS policy persistence. See `class@HSTSEnforcerDB` for a persistent
    enforcer.
*/
class HSTSEnforcer : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_hsts_enforcer_get_type != &gidSymbolNotFound ? soup_hsts_enforcer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HSTSEnforcer self()
  {
    return this;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupHSTSEnforcer.
      
      The base #SoupHSTSEnforcer class does not support persistent storage of HSTS
      policies, see `classHSTSEnforcerDB` for that.
      Returns: a new #SoupHSTSEnforcer
  */
  this()
  {
    SoupHSTSEnforcer* _cretval;
    _cretval = soup_hsts_enforcer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets a list of domains for which there are policies in enforcer.
  
      Params:
        sessionPolicies = whether to include session policies
      Returns: a newly allocated
          list of domains. Use [glib.list.List.freeFull] and `funcGLib.free` to free the
          list.
  */
  string[] getDomains(bool sessionPolicies)
  {
    GList* _cretval;
    _cretval = soup_hsts_enforcer_get_domains(cast(SoupHSTSEnforcer*)this._cPtr, sessionPolicies);
    auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets a list with the policies in enforcer.
  
      Params:
        sessionPolicies = whether to include session policies
      Returns: a newly
          allocated list of policies. Use [glib.list.List.freeFull] and
          [soup.hstspolicy.HSTSPolicy.free] to free the list.
  */
  soup.hstspolicy.HSTSPolicy[] getPolicies(bool sessionPolicies)
  {
    GList* _cretval;
    _cretval = soup_hsts_enforcer_get_policies(cast(SoupHSTSEnforcer*)this._cPtr, sessionPolicies);
    auto _retval = gListToD!(soup.hstspolicy.HSTSPolicy, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets whether hsts_enforcer has a currently valid policy for domain.
  
      Params:
        domain = a domain.
      Returns: true if access to domain should happen over HTTPS, false
          otherwise.
  */
  bool hasValidPolicy(string domain)
  {
    bool _retval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _retval = cast(bool)soup_hsts_enforcer_has_valid_policy(cast(SoupHSTSEnforcer*)this._cPtr, _domain);
    return _retval;
  }

  /**
      Gets whether hsts_enforcer stores policies persistenly.
      Returns: true if hsts_enforcer storage is persistent or false otherwise.
  */
  bool isPersistent()
  {
    bool _retval;
    _retval = cast(bool)soup_hsts_enforcer_is_persistent(cast(SoupHSTSEnforcer*)this._cPtr);
    return _retval;
  }

  /**
      Sets policy to hsts_enforcer.
      
      If policy is expired, any existing HSTS policy for its host will be removed
      instead. If a policy existed for this host, it will be replaced. Otherwise,
      the new policy will be inserted. If the policy is a session policy, that is,
      one created with [soup.hstspolicy.HSTSPolicy.newSessionPolicy], the policy will not
      expire and will be enforced during the lifetime of hsts_enforcer's
      `classSession`.
  
      Params:
        policy = the policy of the HSTS host
  */
  void setPolicy(soup.hstspolicy.HSTSPolicy policy)
  {
    soup_hsts_enforcer_set_policy(cast(SoupHSTSEnforcer*)this._cPtr, policy ? cast(SoupHSTSPolicy*)policy._cPtr(No.Dup) : null);
  }

  /**
      Sets a session policy for domain.
      
      A session policy is a policy that is permanent to the lifetime of
      hsts_enforcer's `classSession` and doesn't expire.
  
      Params:
        domain = policy domain or hostname
        includeSubdomains = true if the policy applies on sub domains
  */
  void setSessionPolicy(string domain, bool includeSubdomains)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    soup_hsts_enforcer_set_session_policy(cast(SoupHSTSEnforcer*)this._cPtr, _domain, includeSubdomains);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when hsts_enforcer changes.
        
        If a policy has been added,
        new_policy will contain the newly-added policy and
        old_policy will be null. If a policy has been deleted,
        old_policy will contain the to-be-deleted policy and
        new_policy will be null. If a policy has been changed,
        old_policy will contain its old value, and new_policy its
        new value.
        
        Note that you shouldn't modify the policies from a callback to
        this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.hstspolicy.HSTSPolicy oldPolicy, soup.hstspolicy.HSTSPolicy newPolicy, soup.hstsenforcer.HSTSEnforcer hSTSEnforcer))
  
          `oldPolicy` the old #SoupHSTSPolicy value (optional)
  
          `newPolicy` the new #SoupHSTSPolicy value (optional)
  
          `hSTSEnforcer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == soup.hstspolicy.HSTSPolicy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == soup.hstspolicy.HSTSPolicy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : soup.hstsenforcer.HSTSEnforcer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
