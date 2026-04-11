/// Module for [UTF8NormalizeOptions] class
module arrow.utf8_normalize_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class UTF8NormalizeOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_utf8_normalize_options_get_type != &gidSymbolNotFound ? garrow_utf8_normalize_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UTF8NormalizeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.utf8_normalize_options.UTF8NormalizeOptions]
      Returns: New builder object
  */
  static UTF8NormalizeOptionsGidBuilder builder()
  {
    return new UTF8NormalizeOptionsGidBuilder;
  }

  /**
      Get `form` property.
      Returns: The Unicode normalization form to apply.
  */
  @property arrow.types.UTF8NormalizeForm form()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.UTF8NormalizeForm)("form");
  }

  /**
      Set `form` property.
      Params:
        propval = The Unicode normalization form to apply.
  */
  @property void form(arrow.types.UTF8NormalizeForm propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.UTF8NormalizeForm)("form", propval);
  }

  /** */
  this()
  {
    GArrowUTF8NormalizeOptions* _cretval;
    _cretval = garrow_utf8_normalize_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.utf8_normalize_options.UTF8NormalizeOptions]
class UTF8NormalizeOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `form` property.
      Params:
        propval = The Unicode normalization form to apply.
      Returns: Builder instance for fluent chaining
  */
  T form(arrow.types.UTF8NormalizeForm propval)
  {
    return setProperty("form", propval);
  }
}

/// Fluent builder for [arrow.utf8_normalize_options.UTF8NormalizeOptions]
final class UTF8NormalizeOptionsGidBuilder : UTF8NormalizeOptionsGidBuilderImpl!UTF8NormalizeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UTF8NormalizeOptions build()
  {
    return new UTF8NormalizeOptions(cast(void*)createGObject(UTF8NormalizeOptions._getGType), Yes.Take);
  }
}
