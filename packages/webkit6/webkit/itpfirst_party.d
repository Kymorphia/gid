/// Module for [ITPFirstParty] class
module webkit.itpfirst_party;

public import gid.basictypes;
import gid.gid;
import glib.date_time;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Describes a first party origin.
*/
class ITPFirstParty : gobject.boxed.BoxedWrap!(webkit_itp_first_party_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ITPFirstParty self() nothrow
  {
    return this;
  }

  /**
      Get the domain name of itp_first_party.
      Returns: the domain name
  */
  string getDomain() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_itp_first_party_get_domain(cast(WebKitITPFirstParty*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the last time a #WebKitITPThirdParty has been seen under itp_first_party.
      
      Each WebKitITPFirstParty is created by [webkit.itpthird_party.ITPThirdParty.getFirstParties] and
      therefore corresponds to exactly one #WebKitITPThirdParty.
      Returns: the last update time as a #GDateTime
  */
  glib.date_time.DateTime getLastUpdateTime() nothrow
  {
    GDateTime* _cretval;
    _cretval = webkit_itp_first_party_get_last_update_time(cast(WebKitITPFirstParty*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get whether itp_first_party has granted website data access to its #WebKitITPThirdParty.
      
      Each WebKitITPFirstParty is created by [webkit.itpthird_party.ITPThirdParty.getFirstParties] and
      therefore corresponds to exactly one #WebKitITPThirdParty.
      Returns: true if website data access has been granted, or false otherwise
  */
  bool getWebsiteDataAccessAllowed() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_itp_first_party_get_website_data_access_allowed(cast(WebKitITPFirstParty*)this._cPtr);
    return _retval;
  }
}
