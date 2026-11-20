/// Module for [ReplaceSliceOptions] class
module arrow.replace_slice_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ReplaceSliceOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_replace_slice_options_get_type != &gidSymbolNotFound ? garrow_replace_slice_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowReplaceSliceOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ReplaceSliceOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.replace_slice_options.ReplaceSliceOptions]
      Returns: New builder object
  */
  static ReplaceSliceOptionsGidBuilder builder() nothrow
  {
    return new ReplaceSliceOptionsGidBuilder;
  }

  /**
      Get `replacement` property.
      Returns: String to replace the slice with.
  */
  @property string replacement() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("replacement");
  }

  /**
      Set `replacement` property.
      Params:
        propval = String to replace the slice with.
  */
  @property void replacement(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("replacement", propval);
  }

  /**
      Get `start` property.
      Returns: Index to start slicing at.
  */
  @property long start() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("start");
  }

  /**
      Set `start` property.
      Params:
        propval = Index to start slicing at.
  */
  @property void start(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("start", propval);
  }

  /**
      Get `stop` property.
      Returns: Index to stop slicing at.
  */
  @property long stop() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("stop");
  }

  /**
      Set `stop` property.
      Params:
        propval = Index to stop slicing at.
  */
  @property void stop(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("stop", propval);
  }

  /** */
  this() nothrow
  {
    GArrowReplaceSliceOptions* _cretval;
    _cretval = garrow_replace_slice_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.replace_slice_options.ReplaceSliceOptions]
class ReplaceSliceOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `replacement` property.
      Params:
        propval = String to replace the slice with.
      Returns: Builder instance for fluent chaining
  */
  T replacement(string propval) nothrow
  {
    return setProperty("replacement", propval);
  }

  /**
      Set `start` property.
      Params:
        propval = Index to start slicing at.
      Returns: Builder instance for fluent chaining
  */
  T start(long propval) nothrow
  {
    return setProperty("start", propval);
  }

  /**
      Set `stop` property.
      Params:
        propval = Index to stop slicing at.
      Returns: Builder instance for fluent chaining
  */
  T stop(long propval) nothrow
  {
    return setProperty("stop", propval);
  }
}

/// Fluent builder for [arrow.replace_slice_options.ReplaceSliceOptions]
final class ReplaceSliceOptionsGidBuilder : ReplaceSliceOptionsGidBuilderImpl!ReplaceSliceOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ReplaceSliceOptions build() nothrow
  {
    return new ReplaceSliceOptions(cast(void*)createGObject(ReplaceSliceOptions._getGType), Yes.Take);
  }
}
