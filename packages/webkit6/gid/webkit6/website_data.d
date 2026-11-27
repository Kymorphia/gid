/// Module for [WebsiteData] class
module gid.webkit6.website_data;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Data stored locally by a web site.
    
    WebKitWebsiteData represents data stored in the client by a particular website.
    A website is normally a set of URLs grouped by domain name. You can get the website name,
    which is usually the domain, with [gid.webkit6.website_data.WebsiteData.getName].
    Documents loaded from the file system, like file:// URIs, are all grouped in the same WebKitWebsiteData
    with the name "Local files".
    
    A website can store different types of data in the client side. #WebKitWebsiteDataTypes is an enum containing
    all the possible data types; use [gid.webkit6.website_data.WebsiteData.getTypes] to get the bitmask of data types.
    It's also possible to know the size of the data stored for some of the #WebKitWebsiteDataTypes by using
    [gid.webkit6.website_data.WebsiteData.getSize].
    
    A list of WebKitWebsiteData can be retrieved with [gid.webkit6.website_data_manager.WebsiteDataManager.fetch]. See #WebKitWebsiteDataManager
    for more information.
*/
@gidGir("WebsiteData")
class WebsiteData : gid.gobject2.boxed.BoxedWrap!(webkit_website_data_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteData self() nothrow
  {
    return this;
  }

  /**
      Gets the name of #WebKitWebsiteData.
      
      This is the website name, normally represented by
      a domain or host name. All local documents are grouped in the same #WebKitWebsiteData using
      the name "Local files".
      Returns: the website name of website_data.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_get_name(cast(WebKitWebsiteData*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the size of the data of types types in a #WebKitWebsiteData.
      
      Note that currently the data size is only known for the [gid.webkit6.types.WebsiteDataTypes.DiskCache],
      [gid.webkit6.types.WebsiteDataTypes.LocalStorage], [gid.webkit6.types.WebsiteDataTypes.IndexeddbDatabases] and
      [gid.webkit6.types.WebsiteDataTypes.DomCache] data types, so for all other types 0 will be returned.
  
      Params:
        types = a bitmask  of #WebKitWebsiteDataTypes
      Returns: the size of website_data for the given types.
  */
  ulong getSize(gid.webkit6.types.WebsiteDataTypes types) nothrow
  {
    ulong _retval;
    _retval = webkit_website_data_get_size(cast(WebKitWebsiteData*)this._cPtr, types);
    return _retval;
  }

  /**
      Gets the types of data stored in the client for a #WebKitWebsiteData.
      
      These are the
      types actually present, not the types queried with [gid.webkit6.website_data_manager.WebsiteDataManager.fetch].
      Returns: a bitmask of #WebKitWebsiteDataTypes in website_data
  */
  gid.webkit6.types.WebsiteDataTypes getTypes() nothrow
  {
    WebKitWebsiteDataTypes _cretval;
    _cretval = webkit_website_data_get_types(cast(WebKitWebsiteData*)this._cPtr);
    gid.webkit6.types.WebsiteDataTypes _retval = cast(gid.webkit6.types.WebsiteDataTypes)_cretval;
    return _retval;
  }
}
