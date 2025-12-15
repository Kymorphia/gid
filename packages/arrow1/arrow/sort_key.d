/// Module for [SortKey] class
module arrow.sort_key;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class SortKey : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sort_key_get_type != &gidSymbolNotFound ? garrow_sort_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SortKey self()
  {
    return this;
  }

  /**
      Get `target` property.
      Returns: A name or dot path for the sort target.
      
          dot_path = '.' name
                   | '[' digit+ ']'
                   | dot_path+
  */
  @property string target()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("target");
  }

  /** */
  this(string target, arrow.types.SortOrder order)
  {
    GArrowSortKey* _cretval;
    const(char)* _target = target.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_sort_key_new(_target, order, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.sort_key.SortKey otherSortKey)
  {
    bool _retval;
    _retval = cast(bool)garrow_sort_key_equal(cast(GArrowSortKey*)this._cPtr, otherSortKey ? cast(GArrowSortKey*)otherSortKey._cPtr(No.Dup) : null);
    return _retval;
  }
}
