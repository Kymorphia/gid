/// Module for [PadOptions] class
module arrow.pad_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PadOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_pad_options_get_type != &gidSymbolNotFound ? garrow_pad_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowPadOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override PadOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.pad_options.PadOptions]
      Returns: New builder object
  */
  static PadOptionsGidBuilder builder() nothrow
  {
    return new PadOptionsGidBuilder;
  }

  /**
      Get `leanLeftOnOddPadding` property.
      Returns: What to do if there is an odd number of padding characters (in case of centered
        padding). Defaults to aligning on the left (i.e. adding the extra padding character
        on the right).
  */
  @property bool leanLeftOnOddPadding() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("lean-left-on-odd-padding");
  }

  /**
      Set `leanLeftOnOddPadding` property.
      Params:
        propval = What to do if there is an odd number of padding characters (in case of centered
          padding). Defaults to aligning on the left (i.e. adding the extra padding character
          on the right).
  */
  @property void leanLeftOnOddPadding(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("lean-left-on-odd-padding", propval);
  }

  /**
      Get `padding` property.
      Returns: What to pad the string with. Should be one codepoint (Unicode)/byte (ASCII).
  */
  @property string padding() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("padding");
  }

  /**
      Set `padding` property.
      Params:
        propval = What to pad the string with. Should be one codepoint (Unicode)/byte (ASCII).
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
    GArrowPadOptions* _cretval;
    _cretval = garrow_pad_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.pad_options.PadOptions]
class PadOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `leanLeftOnOddPadding` property.
      Params:
        propval = What to do if there is an odd number of padding characters (in case of centered
          padding). Defaults to aligning on the left (i.e. adding the extra padding character
          on the right).
      Returns: Builder instance for fluent chaining
  */
  T leanLeftOnOddPadding(bool propval) nothrow
  {
    return setProperty("lean-left-on-odd-padding", propval);
  }

  /**
      Set `padding` property.
      Params:
        propval = What to pad the string with. Should be one codepoint (Unicode)/byte (ASCII).
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

/// Fluent builder for [arrow.pad_options.PadOptions]
final class PadOptionsGidBuilder : PadOptionsGidBuilderImpl!PadOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PadOptions build() nothrow
  {
    return new PadOptions(cast(void*)createGObject(PadOptions._getGType), Yes.Take);
  }
}
