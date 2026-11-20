/// Module for [JoinOptions] class
module arrow.join_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class JoinOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_join_options_get_type != &gidSymbolNotFound ? garrow_join_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowJoinOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override JoinOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.join_options.JoinOptions]
      Returns: New builder object
  */
  static JoinOptionsGidBuilder builder() nothrow
  {
    return new JoinOptionsGidBuilder;
  }

  /**
      Get `nullHandling` property.
      Returns: How to handle null values. (A null separator always results in a null output.)
  */
  @property arrow.types.JoinNullHandlingBehavior nullHandling() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.JoinNullHandlingBehavior)("null-handling");
  }

  /**
      Set `nullHandling` property.
      Params:
        propval = How to handle null values. (A null separator always results in a null output.)
  */
  @property void nullHandling(arrow.types.JoinNullHandlingBehavior propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.JoinNullHandlingBehavior)("null-handling", propval);
  }

  /**
      Get `nullReplacement` property.
      Returns: Replacement string for null values when null-handling is REPLACE.
  */
  @property string nullReplacement() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("null-replacement");
  }

  /**
      Set `nullReplacement` property.
      Params:
        propval = Replacement string for null values when null-handling is REPLACE.
  */
  @property void nullReplacement(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("null-replacement", propval);
  }

  /** */
  this() nothrow
  {
    GArrowJoinOptions* _cretval;
    _cretval = garrow_join_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.join_options.JoinOptions]
class JoinOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nullHandling` property.
      Params:
        propval = How to handle null values. (A null separator always results in a null output.)
      Returns: Builder instance for fluent chaining
  */
  T nullHandling(arrow.types.JoinNullHandlingBehavior propval) nothrow
  {
    return setProperty("null-handling", propval);
  }

  /**
      Set `nullReplacement` property.
      Params:
        propval = Replacement string for null values when null-handling is REPLACE.
      Returns: Builder instance for fluent chaining
  */
  T nullReplacement(string propval) nothrow
  {
    return setProperty("null-replacement", propval);
  }
}

/// Fluent builder for [arrow.join_options.JoinOptions]
final class JoinOptionsGidBuilder : JoinOptionsGidBuilderImpl!JoinOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  JoinOptions build() nothrow
  {
    return new JoinOptions(cast(void*)createGObject(JoinOptions._getGType), Yes.Take);
  }
}
