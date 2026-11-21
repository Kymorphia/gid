/// Module for [ITPThirdParty] class
module gid.webkit6.itpthird_party;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.itpfirst_party;
import gid.webkit6.types;

/**
    Describes a third party origin.
*/
class ITPThirdParty : gid.gobject2.boxed.BoxedWrap!(webkit_itp_third_party_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ITPThirdParty self() nothrow
  {
    return this;
  }

  /**
      Get the domain name of itp_third_party.
      Returns: the domain name
  */
  string getDomain() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_itp_third_party_get_domain(cast(WebKitITPThirdParty*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the list of #WebKitITPFirstParty under which itp_third_party has been seen.
      Returns: a #GList of #WebKitITPFirstParty
  */
  gid.webkit6.itpfirst_party.ITPFirstParty[] getFirstParties() nothrow
  {
    GList* _cretval;
    _cretval = webkit_itp_third_party_get_first_parties(cast(WebKitITPThirdParty*)this._cPtr);
    auto _retval = gListToD!(gid.webkit6.itpfirst_party.ITPFirstParty, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
