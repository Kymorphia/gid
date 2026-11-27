/// Module for [HSTSEnforcer] class
module gid.soup3.hstsenforcer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.hstspolicy;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Automatic HTTP Strict Transport Security enforcing for [gid.soup3.session.Session].
    
    A [gid.soup3.hstsenforcer.HSTSEnforcer] stores HSTS policies and enforces them when
    required. [gid.soup3.hstsenforcer.HSTSEnforcer] implements [gid.soup3.session_feature.SessionFeature], so you
    can add an HSTS enforcer to a session with
    [gid.soup3.session.Session.addFeature] or [gid.soup3.session.Session.addFeatureByType].
    
    [gid.soup3.hstsenforcer.HSTSEnforcer] keeps track of all the HTTPS destinations that,
    when connected to, return the Strict-Transport-Security header with
    valid values. [gid.soup3.hstsenforcer.HSTSEnforcer] will forget those destinations
    upon expiry or when the server requests it.
    
    When the [gid.soup3.session.Session] the [gid.soup3.hstsenforcer.HSTSEnforcer] is attached to queues or
    restarts a message, the [gid.soup3.hstsenforcer.HSTSEnforcer] will rewrite the URI to HTTPS if
    the destination is a known HSTS host and is contacted over an insecure
    transport protocol (HTTP). Users of [gid.soup3.hstsenforcer.HSTSEnforcer] are advised to listen
    to changes in the [gid.soup3.message.Message.uri] property in order to be aware of
    changes in the message URI.
    
    Note that [gid.soup3.hstsenforcer.HSTSEnforcer] does not support any form of long-term
    HSTS policy persistence. See [gid.soup3.hstsenforcer_db.HSTSEnforcerDB] for a persistent
    enforcer.
*/
@gidGir("HSTSEnforcer", "HSTSEnforcerClass")
class HSTSEnforcer : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_hsts_enforcer_get_type != &gidSymbolNotFound ? soup_hsts_enforcer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupHSTSEnforcer";
  }

  /** Returns `this`, for use in `with` statements. */
  override HSTSEnforcer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.hstsenforcer.HSTSEnforcer]
      Returns: New builder object
  */
  static HSTSEnforcerGidBuilder builder() nothrow
  {
    return new HSTSEnforcerGidBuilder;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new [gid.soup3.hstsenforcer.HSTSEnforcer].
      
      The base [gid.soup3.hstsenforcer.HSTSEnforcer] class does not support persistent storage of HSTS
      policies, see [gid.soup3.hstsenforcer_db.HSTSEnforcerDB] for that.
      Returns: a new #SoupHSTSEnforcer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      SoupHSTSEnforcer* _cretval;
      _cretval = soup_hsts_enforcer_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      The class closure for the [gid.soup3.hstsenforcer.HSTSEnforcer.changed] signal.
  
      Params:
        oldPolicy =  (modified in place, changes are seen by the caller)
        newPolicy =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChanged(gid.soup3.hstspolicy.HSTSPolicy oldPolicy, gid.soup3.hstspolicy.HSTSPolicy newPolicy)
  {
    auto _klass = cast(SoupHSTSEnforcerClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(SoupHSTSEnforcer*)this._cPtr, oldPolicy ? cast(SoupHSTSPolicy*)oldPolicy._cPtr(No.Dup) : null, newPolicy ? cast(SoupHSTSPolicy*)newPolicy._cPtr(No.Dup) : null);
  }

  /**
      Gets whether hsts_enforcer has a currently valid policy for domain.
  
      Params:
        domain = a domain.
      Returns: true if access to domain should happen over HTTPS, false
          otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHasValidPolicy` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncHasValidPolicy(string domain)
  {
    auto _klass = cast(SoupHSTSEnforcerClass*)_vfuncClass;
    if (!_klass.hasValidPolicy)
      return typeof(return).init;

    bool _retval;
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.hasValidPolicy(cast(SoupHSTSEnforcer*)this._cPtr, _domain);
    return _retval;
  }

  /**
      Gets whether hsts_enforcer stores policies persistenly.
      Returns: true if hsts_enforcer storage is persistent or false otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsPersistent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsPersistent()
  {
    auto _klass = cast(SoupHSTSEnforcerClass*)_vfuncClass;
    if (!_klass.isPersistent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isPersistent(cast(SoupHSTSEnforcer*)this._cPtr);
    return _retval;
  }

  /**
      Gets a list of domains for which there are policies in enforcer.
  
      Params:
        sessionPolicies = whether to include session policies
      Returns: a newly allocated
          list of domains. Use [gid.glib2.list.List.freeFull] and `funcGLib.free` to free the
          list.
  */
  string[] getDomains(bool sessionPolicies) nothrow
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
          allocated list of policies. Use [gid.glib2.list.List.freeFull] and
          [gid.soup3.hstspolicy.HSTSPolicy.free] to free the list.
  */
  gid.soup3.hstspolicy.HSTSPolicy[] getPolicies(bool sessionPolicies) nothrow
  {
    GList* _cretval;
    _cretval = soup_hsts_enforcer_get_policies(cast(SoupHSTSEnforcer*)this._cPtr, sessionPolicies);
    auto _retval = gListToD!(gid.soup3.hstspolicy.HSTSPolicy, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets whether hsts_enforcer has a currently valid policy for domain.
  
      Params:
        domain = a domain.
      Returns: true if access to domain should happen over HTTPS, false
          otherwise.
  */
  bool hasValidPolicy(string domain) nothrow
  {
    bool _retval;
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)soup_hsts_enforcer_has_valid_policy(cast(SoupHSTSEnforcer*)this._cPtr, _domain);
    return _retval;
  }

  /**
      Gets whether hsts_enforcer stores policies persistenly.
      Returns: true if hsts_enforcer storage is persistent or false otherwise.
  */
  bool isPersistent() nothrow
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
      one created with [gid.soup3.hstspolicy.HSTSPolicy.newSessionPolicy], the policy will not
      expire and will be enforced during the lifetime of hsts_enforcer's
      [gid.soup3.session.Session].
  
      Params:
        policy = the policy of the HSTS host
  */
  void setPolicy(gid.soup3.hstspolicy.HSTSPolicy policy) nothrow
  {
    soup_hsts_enforcer_set_policy(cast(SoupHSTSEnforcer*)this._cPtr, policy ? cast(SoupHSTSPolicy*)policy._cPtr(No.Dup) : null);
  }

  /**
      Sets a session policy for domain.
      
      A session policy is a policy that is permanent to the lifetime of
      hsts_enforcer's [gid.soup3.session.Session] and doesn't expire.
  
      Params:
        domain = policy domain or hostname
        includeSubdomains = true if the policy applies on sub domains
  */
  void setSessionPolicy(string domain, bool includeSubdomains) nothrow
  {
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
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
  
          `void callback(gid.soup3.hstspolicy.HSTSPolicy oldPolicy, gid.soup3.hstspolicy.HSTSPolicy newPolicy, gid.soup3.hstsenforcer.HSTSEnforcer hSTSEnforcer)`
  
          `oldPolicy` the old #SoupHSTSPolicy value (optional)
  
          `newPolicy` the new #SoupHSTSPolicy value (optional)
  
          `hSTSEnforcer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.soup3.hstspolicy.HSTSPolicy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.soup3.hstspolicy.HSTSPolicy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.hstsenforcer.HSTSEnforcer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.hstsenforcer.HSTSEnforcer.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from HSTSEnforcer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.hstsenforcer.HSTSEnforcer), T.stringof ~ " is not derived from gid.soup3.hstsenforcer.HSTSEnforcer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.soup3.hstsenforcer.HSTSEnforcer))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHasValidPolicy", true)[0]) == gid.soup3.hstsenforcer.HSTSEnforcer))
      _installVfunc(klass, "has_valid_policy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsPersistent", true)[0]) == gid.soup3.hstsenforcer.HSTSEnforcer))
      _installVfunc(klass, "is_persistent");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupHSTSEnforcerClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(SoupHSTSEnforcer* enforcer, SoupHSTSPolicy* oldPolicy, SoupHSTSPolicy* newPolicy) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.soup3.hstsenforcer.HSTSEnforcer)(cast(void*)enforcer);
          if (!_obj)
          {
            auto _klass = cast(SoupHSTSEnforcerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enforcer);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(enforcer, oldPolicy, newPolicy);
            return;
          }

          auto _oldPolicy = oldPolicy ? new gid.soup3.hstspolicy.HSTSPolicy(cast(void*)oldPolicy, Yes.Take)._cBorrow : null;
          auto _newPolicy = newPolicy ? new gid.soup3.hstspolicy.HSTSPolicy(cast(void*)newPolicy, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncChanged(_oldPolicy, _newPolicy);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.hstsenforcer.HSTSEnforcer.vfuncChanged");
          }
          if (_oldPolicy)
            _oldPolicy._cUnborrow;
          if (_newPolicy)
            _newPolicy._cUnborrow;

        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "has_valid_policy":
      {
        static extern(C) gboolean _vfuncHasValidPolicyTramp(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.soup3.hstsenforcer.HSTSEnforcer)(cast(void*)hstsEnforcer);
          if (!_obj)
          {
            auto _klass = cast(SoupHSTSEnforcerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hstsEnforcer);
            if (_klass.hasValidPolicy)
              return (cast(typeof(&_vfuncHasValidPolicyTramp))_klass.hasValidPolicy)(hstsEnforcer, domain);
            return typeof(return).init;
          }

          bool _dretval;
          string _domain = domain.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncHasValidPolicy(_domain);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.hstsenforcer.HSTSEnforcer.vfuncHasValidPolicy");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasValidPolicy = cast(typeof(_klass.hasValidPolicy))&_vfuncHasValidPolicyTramp;
        break;
      }
      case "is_persistent":
      {
        static extern(C) gboolean _vfuncIsPersistentTramp(SoupHSTSEnforcer* hstsEnforcer) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.soup3.hstsenforcer.HSTSEnforcer)(cast(void*)hstsEnforcer);
          if (!_obj)
          {
            auto _klass = cast(SoupHSTSEnforcerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hstsEnforcer);
            if (_klass.isPersistent)
              return (cast(typeof(&_vfuncIsPersistentTramp))_klass.isPersistent)(hstsEnforcer);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsPersistent();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.hstsenforcer.HSTSEnforcer.vfuncIsPersistent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isPersistent = cast(typeof(_klass.isPersistent))&_vfuncIsPersistentTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.hstsenforcer.HSTSEnforcer]
class HSTSEnforcerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [gid.soup3.hstsenforcer.HSTSEnforcer]
final class HSTSEnforcerGidBuilder : HSTSEnforcerGidBuilderImpl!HSTSEnforcerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HSTSEnforcer build() nothrow
  {
    return new HSTSEnforcer(cast(void*)createGObject(HSTSEnforcer._getGType), Yes.Take);
  }
}
