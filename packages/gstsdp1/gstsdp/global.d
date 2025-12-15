/// Global functions for gstsdp1 library
module gstsdp.global;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;


/**
    Check if the given addr is a multicast address.

    Params:
      nettype = a network type
      addrtype = an address type
      addr = an address
    Returns: TRUE when addr is multicast.
*/
bool sdpAddressIsMulticast(string nettype, string addrtype, string addr)
{
  bool _retval;
  const(char)* _nettype = nettype.toCString(No.Alloc);
  const(char)* _addrtype = addrtype.toCString(No.Alloc);
  const(char)* _addr = addr.toCString(No.Alloc);
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
string sdpMakeKeymgmt(string uri, string base64)
{
  char* _cretval;
  const(char)* _uri = uri.toCString(No.Alloc);
  const(char)* _base64 = base64.toCString(No.Alloc);
  _cretval = gst_sdp_make_keymgmt(_uri, _base64);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
