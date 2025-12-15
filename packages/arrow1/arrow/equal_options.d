/// Module for [EqualOptions] class
module arrow.equal_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class EqualOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_equal_options_get_type != &gidSymbolNotFound ? garrow_equal_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EqualOptions self()
  {
    return this;
  }

  /**
      Get `absoluteTolerance` property.
      Returns: The absolute tolerance for approximate comparison of
      floating-point values.
  */
  @property double absoluteTolerance()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("absolute-tolerance");
  }

  /**
      Set `absoluteTolerance` property.
      Params:
        propval = The absolute tolerance for approximate comparison of
        floating-point values.
  */
  @property void absoluteTolerance(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("absolute-tolerance", propval);
  }

  /**
      Get `approx` property.
      Returns: Whether or not approximate comparison is used.
  */
  @property bool approx()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("approx");
  }

  /**
      Set `approx` property.
      Params:
        propval = Whether or not approximate comparison is used.
  */
  @property void approx(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("approx", propval);
  }

  /**
      Get `nansEqual` property.
      Returns: Whether or not NaNs are considered equal.
  */
  @property bool nansEqual()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("nans-equal");
  }

  /**
      Set `nansEqual` property.
      Params:
        propval = Whether or not NaNs are considered equal.
  */
  @property void nansEqual(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("nans-equal", propval);
  }

  /** */
  this()
  {
    GArrowEqualOptions* _cretval;
    _cretval = garrow_equal_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool isApprox()
  {
    bool _retval;
    _retval = cast(bool)garrow_equal_options_is_approx(cast(GArrowEqualOptions*)this._cPtr);
    return _retval;
  }
}
