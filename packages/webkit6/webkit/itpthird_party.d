/// Module for [ITPThirdParty] class
module webkit.itpthird_party;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.itpfirst_party;
import webkit.types;

/**
    Describes a third party origin.
*/
class ITPThirdParty : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_itp_third_party_get_type != &gidSymbolNotFound ? webkit_itp_third_party_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ITPThirdParty self()
  {
    return this;
  }

  /**
      Get the domain name of itp_third_party.
      Returns: the domain name
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = webkit_itp_third_party_get_domain(cast(WebKitITPThirdParty*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the list of #WebKitITPFirstParty under which itp_third_party has been seen.
      Returns: a #GList of #WebKitITPFirstParty
  */
  webkit.itpfirst_party.ITPFirstParty[] getFirstParties()
  {
    GList* _cretval;
    _cretval = webkit_itp_third_party_get_first_parties(cast(WebKitITPThirdParty*)this._cPtr);
    auto _retval = gListToD!(webkit.itpfirst_party.ITPFirstParty, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
