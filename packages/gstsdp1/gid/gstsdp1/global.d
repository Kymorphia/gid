/// Global functions for gstsdp1 library
module gid.gstsdp1.global;

import gid.core.gid;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.types;


/**
    Check if the given addr is a multicast address.

    Params:
      nettype = a network type
      addrtype = an address type
      addr = an address
    Returns: TRUE when addr is multicast.
*/
bool sdpAddressIsMulticast(string nettype, string addrtype, string addr) nothrow
{
  bool _retval;
  const(char)* _nettype = nettype.toCString!(No.Malloc, No.Nullable);
  const(char)* _addrtype = addrtype.toCString!(No.Malloc, No.Nullable);
  const(char)* _addr = addr.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)gst_sdp_address_is_multicast(_nettype, _addrtype, _addr);
  return _retval;
}

/**
    Makes key management data

    Params:
      uri = a #gchar URI
      base64 = a #gchar base64-encoded key data
    Returns: a #gchar key-mgmt data,
*/
string sdpMakeKeymgmt(string uri, string base64) nothrow
{
  char* _cretval;
  const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
  const(char)* _base64 = base64.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_sdp_make_keymgmt(_uri, _base64);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}
