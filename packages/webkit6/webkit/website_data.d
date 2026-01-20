/// Module for [WebsiteData] class
module webkit.website_data;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Data stored locally by a web site.
    
    WebKitWebsiteData represents data stored in the client by a particular website.
    A website is normally a set of URLs grouped by domain name. You can get the website name,
    which is usually the domain, with [webkit.website_data.WebsiteData.getName].
    Documents loaded from the file system, like file:// URIs, are all grouped in the same WebKitWebsiteData
    with the name "Local files".
    
    A website can store different types of data in the client side. #WebKitWebsiteDataTypes is an enum containing
    all the possible data types; use [webkit.website_data.WebsiteData.getTypes] to get the bitmask of data types.
    It's also possible to know the size of the data stored for some of the #WebKitWebsiteDataTypes by using
    [webkit.website_data.WebsiteData.getSize].
    
    A list of WebKitWebsiteData can be retrieved with [webkit.website_data_manager.WebsiteDataManager.fetch]. See #WebKitWebsiteDataManager
    for more information.
*/
class WebsiteData : gobject.boxed.Boxed
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
    return cast(void function())webkit_website_data_get_type != &gidSymbolNotFound ? webkit_website_data_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteData self()
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
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_get_name(cast(WebKitWebsiteData*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the size of the data of types types in a #WebKitWebsiteData.
      
      Note that currently the data size is only known for [webkit.types.WebsiteDataTypes.DiskCache] data type
      so for all other types 0 will be returned.
  
      Params:
        types = a bitmask  of #WebKitWebsiteDataTypes
      Returns: the size of website_data for the given types.
  */
  ulong getSize(webkit.types.WebsiteDataTypes types)
  {
    ulong _retval;
    _retval = webkit_website_data_get_size(cast(WebKitWebsiteData*)this._cPtr, types);
    return _retval;
  }

  /**
      Gets the types of data stored in the client for a #WebKitWebsiteData.
      
      These are the
      types actually present, not the types queried with [webkit.website_data_manager.WebsiteDataManager.fetch].
      Returns: a bitmask of #WebKitWebsiteDataTypes in website_data
  */
  webkit.types.WebsiteDataTypes getTypes()
  {
    WebKitWebsiteDataTypes _cretval;
    _cretval = webkit_website_data_get_types(cast(WebKitWebsiteData*)this._cPtr);
    webkit.types.WebsiteDataTypes _retval = cast(webkit.types.WebsiteDataTypes)_cretval;
    return _retval;
  }
}
