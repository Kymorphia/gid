/// Module for [StrftimeOptions] class
module arrow.strftime_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class StrftimeOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_strftime_options_get_type != &gidSymbolNotFound ? garrow_strftime_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StrftimeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.strftime_options.StrftimeOptions]
      Returns: New builder object
  */
  static StrftimeOptionsGidBuilder builder()
  {
    return new StrftimeOptionsGidBuilder;
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
      Get `locale` property.
      Returns: The desired output locale string.
  */
  @property string locale()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("locale");
  }

  /**
      Set `locale` property.
      Params:
        propval = The desired output locale string.
  */
  @property void locale(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("locale", propval);
  }

  /** */
  this()
  {
    GArrowStrftimeOptions* _cretval;
    _cretval = garrow_strftime_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.strftime_options.StrftimeOptions]
class StrftimeOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `format` property.
      Params:
        propval = The desired format string.
      Returns: Builder instance for fluent chaining
  */
  T format(string propval)
  {
    return setProperty("format", propval);
  }

  /**
      Set `locale` property.
      Params:
        propval = The desired output locale string.
      Returns: Builder instance for fluent chaining
  */
  T locale(string propval)
  {
    return setProperty("locale", propval);
  }
}

/// Fluent builder for [arrow.strftime_options.StrftimeOptions]
final class StrftimeOptionsGidBuilder : StrftimeOptionsGidBuilderImpl!StrftimeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StrftimeOptions build()
  {
    return new StrftimeOptions(cast(void*)createGObject(StrftimeOptions._getGType), Yes.Take);
  }
}
