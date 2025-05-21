/// Module for [StrptimeOptions] class
module arrow.strptime_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class StrptimeOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_strptime_options_get_type != &gidSymbolNotFound ? garrow_strptime_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StrptimeOptions self()
  {
    return this;
  }

  /**
      Get `errorIsNull` property.
      Returns: Return null on parsing errors if true or raise if false.
  */
  @property bool errorIsNull()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("error-is-null");
  }

  /**
      Set `errorIsNull` property.
      Params:
        propval = Return null on parsing errors if true or raise if false.
  */
  @property void errorIsNull(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("error-is-null", propval);
  }

  /**
      Get `format` property.
      Returns: The desired format string.
  */
  @property string format()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("format");
  }

  /**
      Set `format` property.
      Params:
        propval = The desired format string.
  */
  @property void format(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("format", propval);
  }

  /**
      Get `unit` property.
      Returns: The desired time resolution.
  */
  @property arrow.types.TimeUnit unit()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.TimeUnit)("unit");
  }

  /**
      Set `unit` property.
      Params:
        propval = The desired time resolution.
  */
  @property void unit(arrow.types.TimeUnit propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.TimeUnit)("unit", propval);
  }

  /** */
  this()
  {
    GArrowStrptimeOptions* _cretval;
    _cretval = garrow_strptime_options_new();
    this(_cretval, Yes.Take);
  }
}
