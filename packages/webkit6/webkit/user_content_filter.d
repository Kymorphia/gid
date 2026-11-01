/// Module for [UserContentFilter] class
module webkit.user_content_filter;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A compiled set of rules which applied to resource loads.
*/
class UserContentFilter : gobject.boxed.BoxedWrap!(webkit_user_content_filter_get_type)
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
