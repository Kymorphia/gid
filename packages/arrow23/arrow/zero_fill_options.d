/// Module for [ZeroFillOptions] class
module arrow.zero_fill_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ZeroFillOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_zero_fill_options_get_type != &gidSymbolNotFound ? garrow_zero_fill_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowZeroFillOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ZeroFillOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.zero_fill_options.ZeroFillOptions]
      Returns: New builder object
  */
  static ZeroFillOptionsGidBuilder builder() nothrow
  {
    return new ZeroFillOptionsGidBuilder;
  }

  /**
      Get `padding` property.
      Returns: What to pad the string with. Should be one codepoint (Unicode).
  */
  @property string padding() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("padding");
  }

  /**
      Set `padding` property.
      Params:
        propval = What to pad the string with. Should be one codepoint (Unicode).
  */
  @property void padding(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("padding", propval);
  }

  /**
      Get `width` property.
      Returns: The desired string length.
  */
  @property long width() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("width");
  }

  /**
      Set `width` property.
      Params:
        propval = The desired string length.
  */
  @property void width(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("width", propval);
  }

  /** */
  this() nothrow
  {
    GArrowZeroFillOptions* _cretval;
    _cretval = garrow_zero_fill_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.zero_fill_options.ZeroFillOptions]
class ZeroFillOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `padding` property.
      Params:
        propval = What to pad the string with. Should be one codepoint (Unicode).
      Returns: Builder instance for fluent chaining
  */
  T padding(string propval) nothrow
  {
    return setProperty("padding", propval);
  }

  /**
      Set `width` property.
      Params:
        propval = The desired string length.
      Returns: Builder instance for fluent chaining
  */
  T width(long propval) nothrow
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [arrow.zero_fill_options.ZeroFillOptions]
final class ZeroFillOptionsGidBuilder : ZeroFillOptionsGidBuilderImpl!ZeroFillOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ZeroFillOptions build() nothrow
  {
    return new ZeroFillOptions(cast(void*)createGObject(ZeroFillOptions._getGType), Yes.Take);
  }
}
