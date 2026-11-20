/// Module for [ListSliceOptions] class
module arrow.list_slice_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ListSliceOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_list_slice_options_get_type != &gidSymbolNotFound ? garrow_list_slice_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowListSliceOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListSliceOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.list_slice_options.ListSliceOptions]
      Returns: New builder object
  */
  static ListSliceOptionsGidBuilder builder() nothrow
  {
    return new ListSliceOptionsGidBuilder;
  }

  /**
      Get `returnFixedSizeList` property.
      Returns: Whether to return a FixedSizeListArray. If
        #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_TRUE and stop is after a list element's
        length, nulls will be appended to create the requested slice size. If
        #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_AUTO (default), will return whatever type
        it got in.
  */
  @property arrow.types.ListSliceReturnFixedSizeList returnFixedSizeList() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.ListSliceReturnFixedSizeList)("return-fixed-size-list");
  }

  /**
      Set `returnFixedSizeList` property.
      Params:
        propval = Whether to return a FixedSizeListArray. If
          #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_TRUE and stop is after a list element's
          length, nulls will be appended to create the requested slice size. If
          #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_AUTO (default), will return whatever type
          it got in.
  */
  @property void returnFixedSizeList(arrow.types.ListSliceReturnFixedSizeList propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.ListSliceReturnFixedSizeList)("return-fixed-size-list", propval);
  }

  /**
      Get `start` property.
      Returns: The start of list slicing.
  */
  @property long start() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("start");
  }

  /**
      Set `start` property.
      Params:
        propval = The start of list slicing.
  */
  @property void start(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("start", propval);
  }

  /**
      Get `step` property.
      Returns: Slicing step.
  */
  @property long step() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("step");
  }

  /**
      Set `step` property.
      Params:
        propval = Slicing step.
  */
  @property void step(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("step", propval);
  }

  /**
      Get `stop` property.
      Returns: Optional stop of list slicing. If not set (value is
        [arrow.types.LIST_SLICE_OPTIONS_STOP_UNSPECIFIED]), then slice to end.
  */
  @property long stop() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("stop");
  }

  /**
      Set `stop` property.
      Params:
        propval = Optional stop of list slicing. If not set (value is
          [arrow.types.LIST_SLICE_OPTIONS_STOP_UNSPECIFIED]), then slice to end.
  */
  @property void stop(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("stop", propval);
  }

  /** */
  this() nothrow
  {
    GArrowListSliceOptions* _cretval;
    _cretval = garrow_list_slice_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.list_slice_options.ListSliceOptions]
class ListSliceOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `returnFixedSizeList` property.
      Params:
        propval = Whether to return a FixedSizeListArray. If
          #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_TRUE and stop is after a list element's
          length, nulls will be appended to create the requested slice size. If
          #GARROW_LIST_SLICE_RETURN_FIXED_SIZE_LIST_AUTO (default), will return whatever type
          it got in.
      Returns: Builder instance for fluent chaining
  */
  T returnFixedSizeList(arrow.types.ListSliceReturnFixedSizeList propval) nothrow
  {
    return setProperty("return-fixed-size-list", propval);
  }

  /**
      Set `start` property.
      Params:
        propval = The start of list slicing.
      Returns: Builder instance for fluent chaining
  */
  T start(long propval) nothrow
  {
    return setProperty("start", propval);
  }

  /**
      Set `step` property.
      Params:
        propval = Slicing step.
      Returns: Builder instance for fluent chaining
  */
  T step(long propval) nothrow
  {
    return setProperty("step", propval);
  }

  /**
      Set `stop` property.
      Params:
        propval = Optional stop of list slicing. If not set (value is
          [arrow.types.LIST_SLICE_OPTIONS_STOP_UNSPECIFIED]), then slice to end.
      Returns: Builder instance for fluent chaining
  */
  T stop(long propval) nothrow
  {
    return setProperty("stop", propval);
  }
}

/// Fluent builder for [arrow.list_slice_options.ListSliceOptions]
final class ListSliceOptionsGidBuilder : ListSliceOptionsGidBuilderImpl!ListSliceOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListSliceOptions build() nothrow
  {
    return new ListSliceOptions(cast(void*)createGObject(ListSliceOptions._getGType), Yes.Take);
  }
}
