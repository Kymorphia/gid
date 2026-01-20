/// Module for [UserContentFilter] class
module webkit.user_content_filter;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A compiled set of rules which applied to resource loads.
*/
class UserContentFilter : gobject.boxed.Boxed
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
    return cast(void function())webkit_user_content_filter_get_type != &gidSymbolNotFound ? webkit_user_content_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserContentFilter self()
  {
    return this;
  }

  /**
      Obtain the identifier previously used to save the user_content_filter.
      
      Obtain the identifier previously used to save the user_content_filter in the
      #WebKitUserContentFilterStore.
      Returns: the identifier for the filter
  */
  string getIdentifier()
  {
    const(char)* _cretval;
    _cretval = webkit_user_content_filter_get_identifier(cast(WebKitUserContentFilter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
