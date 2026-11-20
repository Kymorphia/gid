/// Module for [DictionaryEncodeOptions] class
module arrow.dictionary_encode_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DictionaryEncodeOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_dictionary_encode_options_get_type != &gidSymbolNotFound ? garrow_dictionary_encode_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDictionaryEncodeOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override DictionaryEncodeOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.dictionary_encode_options.DictionaryEncodeOptions]
      Returns: New builder object
  */
  static DictionaryEncodeOptionsGidBuilder builder() nothrow
  {
    return new DictionaryEncodeOptionsGidBuilder;
  }

  /**
      Get `nullEncodingBehavior` property.
      Returns: How null values will be encoded.
  */
  @property arrow.types.DictionaryEncodeNullEncodingBehavior nullEncodingBehavior() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.DictionaryEncodeNullEncodingBehavior)("null-encoding-behavior");
  }

  /**
      Set `nullEncodingBehavior` property.
      Params:
        propval = How null values will be encoded.
  */
  @property void nullEncodingBehavior(arrow.types.DictionaryEncodeNullEncodingBehavior propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.DictionaryEncodeNullEncodingBehavior)("null-encoding-behavior", propval);
  }

  /** */
  this() nothrow
  {
    GArrowDictionaryEncodeOptions* _cretval;
    _cretval = garrow_dictionary_encode_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.dictionary_encode_options.DictionaryEncodeOptions]
class DictionaryEncodeOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nullEncodingBehavior` property.
      Params:
        propval = How null values will be encoded.
      Returns: Builder instance for fluent chaining
  */
  T nullEncodingBehavior(arrow.types.DictionaryEncodeNullEncodingBehavior propval) nothrow
  {
    return setProperty("null-encoding-behavior", propval);
  }
}

/// Fluent builder for [arrow.dictionary_encode_options.DictionaryEncodeOptions]
final class DictionaryEncodeOptionsGidBuilder : DictionaryEncodeOptionsGidBuilderImpl!DictionaryEncodeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DictionaryEncodeOptions build() nothrow
  {
    return new DictionaryEncodeOptions(cast(void*)createGObject(DictionaryEncodeOptions._getGType), Yes.Take);
  }
}
