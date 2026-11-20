/// Module for [SplitOptions] class
module arrow.split_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SplitOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_split_options_get_type != &gidSymbolNotFound ? garrow_split_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowSplitOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override SplitOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.split_options.SplitOptions]
      Returns: New builder object
  */
  static SplitOptionsGidBuilder builder() nothrow
  {
    return new SplitOptionsGidBuilder;
  }

  /**
      Get `maxSplits` property.
      Returns: Maximum number of splits allowed, or unlimited when -1.
  */
  @property long maxSplits() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("max-splits");
  }

  /**
      Set `maxSplits` property.
      Params:
        propval = Maximum number of splits allowed, or unlimited when -1.
  */
  @property void maxSplits(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("max-splits", propval);
  }

  /**
      Get `reverse` property.
      Returns: Start splitting from the end of the string (only relevant when max_splits != -1).
  */
  @property bool reverse() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("reverse");
  }

  /**
      Set `reverse` property.
      Params:
        propval = Start splitting from the end of the string (only relevant when max_splits != -1).
  */
  @property void reverse(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("reverse", propval);
  }

  /** */
  this() nothrow
  {
    GArrowSplitOptions* _cretval;
    _cretval = garrow_split_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.split_options.SplitOptions]
class SplitOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `maxSplits` property.
      Params:
        propval = Maximum number of splits allowed, or unlimited when -1.
      Returns: Builder instance for fluent chaining
  */
  T maxSplits(long propval) nothrow
  {
    return setProperty("max-splits", propval);
  }

  /**
      Set `reverse` property.
      Params:
        propval = Start splitting from the end of the string (only relevant when max_splits != -1).
      Returns: Builder instance for fluent chaining
  */
  T reverse(bool propval) nothrow
  {
    return setProperty("reverse", propval);
  }
}

/// Fluent builder for [arrow.split_options.SplitOptions]
final class SplitOptionsGidBuilder : SplitOptionsGidBuilderImpl!SplitOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SplitOptions build() nothrow
  {
    return new SplitOptions(cast(void*)createGObject(SplitOptions._getGType), Yes.Take);
  }
}
