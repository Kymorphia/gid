/// Module for [UserContentFilter] class
module gid.webkit6.user_content_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    A compiled set of rules which applied to resource loads.
*/
@gidGir("UserContentFilter")
class UserContentFilter : gid.gobject2.boxed.BoxedWrap!(webkit_user_content_filter_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override UserContentFilter self() nothrow
  {
    return this;
  }

  /**
      Obtain the identifier previously used to save the user_content_filter.
      
      Obtain the identifier previously used to save the user_content_filter in the
      #WebKitUserContentFilterStore.
      Returns: the identifier for the filter
  */
  string getIdentifier() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_user_content_filter_get_identifier(cast(WebKitUserContentFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
