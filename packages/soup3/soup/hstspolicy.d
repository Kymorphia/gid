/// Module for [HSTSPolicy] class
module soup.hstspolicy;

import gid.gid;
import glib.date_time;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.types;

/**
    #SoupHSTSPolicy implements HTTP policies, as described by
    [RFC 6797](http://tools.ietf.org/html/rfc6797).
    
    @domain represents the host that this policy applies to. The domain
    must be IDNA-canonicalized. [soup.hstspolicy.HSTSPolicy.new_] and related methods
    will do this for you.
    
    @max_age contains the 'max-age' value from the Strict Transport
    Security header and indicates the time to live of this policy,
    in seconds.
    
    @expires will be non-null if the policy has been set by the host and
    hence has an expiry time. If @expires is null, it indicates that the
    policy is a permanent session policy set by the user agent.
    
    If @include_subdomains is true, the Strict Transport Security policy
    must also be enforced on subdomains of @domain.
*/
class HSTSPolicy : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_hsts_policy_get_type != &gidSymbolNotFound ? soup_hsts_policy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HSTSPolicy self()
  {
    return this;
  }

  /**
      Creates a new #SoupHSTSPolicy with the given attributes.
      
      domain is a domain on which the strict transport security policy
      represented by this object must be enforced.
      
      max_age is used to set the "expires" attribute on the policy; pass
      [soup.types.HSTS_POLICY_MAX_AGE_PAST] for an already-expired policy, or a
      lifetime in seconds.
      
      If include_subdomains is true, the strict transport security policy
      must also be enforced on all subdomains of domain.
  
      Params:
        domain = policy domain or hostname
        maxAge = max age of the policy
        includeSubdomains = true if the policy applies on subdomains
      Returns: a new #SoupHSTSPolicy.
  */
  this(string domain, gulong maxAge, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new(_domain, maxAge, includeSubdomains);
    this(_cretval, Yes.Take);
  }

  /**
      Parses msg's first "Strict-Transport-Security" response header and
      returns a #SoupHSTSPolicy.
  
      Params:
        msg = a #SoupMessage
      Returns: a new #SoupHSTSPolicy, or null if no valid
          "Strict-Transport-Security" response header was found.
  */
  static soup.hstspolicy.HSTSPolicy newFromResponse(soup.message.Message msg)
  {
    SoupHSTSPolicy* _cretval;
    _cretval = soup_hsts_policy_new_from_response(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new soup.hstspolicy.HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Full version of [soup.hstspolicy.HSTSPolicy.new_], to use with an existing
      expiration date.
      
      See [soup.hstspolicy.HSTSPolicy.new_] for details.
  
      Params:
        domain = policy domain or hostname
        maxAge = max age of the policy
        expires = the date of expiration of the policy or null for a permanent policy
        includeSubdomains = true if the policy applies on subdomains
      Returns: a new #SoupHSTSPolicy.
  */
  static soup.hstspolicy.HSTSPolicy newFull(string domain, gulong maxAge, glib.date_time.DateTime expires, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new_full(_domain, maxAge, expires ? cast(GDateTime*)expires._cPtr(No.Dup) : null, includeSubdomains);
    auto _retval = _cretval ? new soup.hstspolicy.HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new session #SoupHSTSPolicy with the given attributes.
      
      A session policy is a policy that is valid during the lifetime of
      the `classHSTSEnforcer` it is added to. Contrary to regular policies,
      it has no expiration date and is not stored in persistent
      enforcers. These policies are useful for user-agent to load their
      own or user-defined rules.
      
      domain is a domain on which the strict transport security policy
      represented by this object must be enforced.
      
      If include_subdomains is true, the strict transport security policy
      must also be enforced on all subdomains of domain.
  
      Params:
        domain = policy domain or hostname
        includeSubdomains = true if the policy applies on sub domains
      Returns: a new #SoupHSTSPolicy.
  */
  static soup.hstspolicy.HSTSPolicy newSessionPolicy(string domain, bool includeSubdomains)
  {
    SoupHSTSPolicy* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = soup_hsts_policy_new_session_policy(_domain, includeSubdomains);
    auto _retval = _cretval ? new soup.hstspolicy.HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies policy.
      Returns: a copy of policy
  */
  soup.hstspolicy.HSTSPolicy copy()
  {
    SoupHSTSPolicy* _cretval;
    _cretval = soup_hsts_policy_copy(cast(SoupHSTSPolicy*)this._cPtr);
    auto _retval = _cretval ? new soup.hstspolicy.HSTSPolicy(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tests if policy1 and policy2 are equal.
  
      Params:
        policy2 = a #SoupHSTSPolicy
      Returns: whether the policies are equal.
  */
  bool equal(soup.hstspolicy.HSTSPolicy policy2)
  {
    bool _retval;
    _retval = cast(bool)soup_hsts_policy_equal(cast(SoupHSTSPolicy*)this._cPtr, policy2 ? cast(SoupHSTSPolicy*)policy2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets policy's domain.
      Returns: policy's domain.
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = soup_hsts_policy_get_domain(cast(SoupHSTSPolicy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the expiration date for policy.
      Returns: A #GDateTime or null if unset
  */
  glib.date_time.DateTime getExpires()
  {
    GDateTime* _cretval;
    _cretval = soup_hsts_policy_get_expires(cast(SoupHSTSPolicy*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the max age for policy.
      Returns: Max age in seconds
  */
  gulong getMaxAge()
  {
    gulong _retval;
    _retval = soup_hsts_policy_get_max_age(cast(SoupHSTSPolicy*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether policy include its subdomains.
      Returns: true if policy includes subdomains, false otherwise.
  */
  bool includesSubdomains()
  {
    bool _retval;
    _retval = cast(bool)soup_hsts_policy_includes_subdomains(cast(SoupHSTSPolicy*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether policy is expired.
      
      Permanent policies never expire.
      Returns: true if policy is expired, false otherwise.
  */
  bool isExpired()
  {
    bool _retval;
    _retval = cast(bool)soup_hsts_policy_is_expired(cast(SoupHSTSPolicy*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether policy is a non-permanent, non-expirable session policy.
      
      See [soup.hstspolicy.HSTSPolicy.newSessionPolicy] for details.
      Returns: true if policy is permanent, false otherwise
  */
  bool isSessionPolicy()
  {
    bool _retval;
    _retval = cast(bool)soup_hsts_policy_is_session_policy(cast(SoupHSTSPolicy*)this._cPtr);
    return _retval;
  }
}
