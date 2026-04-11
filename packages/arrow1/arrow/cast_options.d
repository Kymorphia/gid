/// Module for [CastOptions] class
module arrow.cast_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class CastOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_cast_options_get_type != &gidSymbolNotFound ? garrow_cast_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CastOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.cast_options.CastOptions]
      Returns: New builder object
  */
  static CastOptionsGidBuilder builder()
  {
    return new CastOptionsGidBuilder;
  }

  /**
      Get `allowDecimalTruncate` property.
      Returns: Whether truncating decimal value is allowed or not.
  */
  @property bool allowDecimalTruncate()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-decimal-truncate");
  }

  /**
      Set `allowDecimalTruncate` property.
      Params:
        propval = Whether truncating decimal value is allowed or not.
  */
  @property void allowDecimalTruncate(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-decimal-truncate", propval);
  }

  /**
      Get `allowFloatTruncate` property.
      Returns: Whether truncating float value is allowed or not.
  */
  @property bool allowFloatTruncate()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-float-truncate");
  }

  /**
      Set `allowFloatTruncate` property.
      Params:
        propval = Whether truncating float value is allowed or not.
  */
  @property void allowFloatTruncate(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-float-truncate", propval);
  }

  /**
      Get `allowIntOverflow` property.
      Returns: Whether integer overflow is allowed or not.
  */
  @property bool allowIntOverflow()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-int-overflow");
  }

  /**
      Set `allowIntOverflow` property.
      Params:
        propval = Whether integer overflow is allowed or not.
  */
  @property void allowIntOverflow(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-int-overflow", propval);
  }

  /**
      Get `allowInvalidUtf8` property.
      Returns: Whether invalid UTF-8 string value is allowed or not.
  */
  @property bool allowInvalidUtf8()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-invalid-utf8");
  }

  /**
      Set `allowInvalidUtf8` property.
      Params:
        propval = Whether invalid UTF-8 string value is allowed or not.
  */
  @property void allowInvalidUtf8(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-invalid-utf8", propval);
  }

  /**
      Get `allowTimeOverflow` property.
      Returns: Whether time overflow is allowed or not.
  */
  @property bool allowTimeOverflow()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-time-overflow");
  }

  /**
      Set `allowTimeOverflow` property.
      Params:
        propval = Whether time overflow is allowed or not.
  */
  @property void allowTimeOverflow(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-time-overflow", propval);
  }

  /**
      Get `allowTimeTruncate` property.
      Returns: Whether truncating time value is allowed or not.
  */
  @property bool allowTimeTruncate()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-time-truncate");
  }

  /**
      Set `allowTimeTruncate` property.
      Params:
        propval = Whether truncating time value is allowed or not.
  */
  @property void allowTimeTruncate(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-time-truncate", propval);
  }

  /**
      Get `toDataType` property.
      Returns: The #GArrowDataType being casted to.
  */
  @property arrow.data_type.DataType toDataType()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.data_type.DataType)("to-data-type");
  }

  /**
      Set `toDataType` property.
      Params:
        propval = The #GArrowDataType being casted to.
  */
  @property void toDataType(arrow.data_type.DataType propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.data_type.DataType)("to-data-type", propval);
  }

  /** */
  this()
  {
    GArrowCastOptions* _cretval;
    _cretval = garrow_cast_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.cast_options.CastOptions]
class CastOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `allowDecimalTruncate` property.
      Params:
        propval = Whether truncating decimal value is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowDecimalTruncate(bool propval)
  {
    return setProperty("allow-decimal-truncate", propval);
  }

  /**
      Set `allowFloatTruncate` property.
      Params:
        propval = Whether truncating float value is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowFloatTruncate(bool propval)
  {
    return setProperty("allow-float-truncate", propval);
  }

  /**
      Set `allowIntOverflow` property.
      Params:
        propval = Whether integer overflow is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowIntOverflow(bool propval)
  {
    return setProperty("allow-int-overflow", propval);
  }

  /**
      Set `allowInvalidUtf8` property.
      Params:
        propval = Whether invalid UTF-8 string value is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowInvalidUtf8(bool propval)
  {
    return setProperty("allow-invalid-utf8", propval);
  }

  /**
      Set `allowTimeOverflow` property.
      Params:
        propval = Whether time overflow is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowTimeOverflow(bool propval)
  {
    return setProperty("allow-time-overflow", propval);
  }

  /**
      Set `allowTimeTruncate` property.
      Params:
        propval = Whether truncating time value is allowed or not.
      Returns: Builder instance for fluent chaining
  */
  T allowTimeTruncate(bool propval)
  {
    return setProperty("allow-time-truncate", propval);
  }

  /**
      Set `toDataType` property.
      Params:
        propval = The #GArrowDataType being casted to.
      Returns: Builder instance for fluent chaining
  */
  T toDataType(arrow.data_type.DataType propval)
  {
    return setProperty("to-data-type", propval);
  }
}

/// Fluent builder for [arrow.cast_options.CastOptions]
final class CastOptionsGidBuilder : CastOptionsGidBuilderImpl!CastOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CastOptions build()
  {
    return new CastOptions(cast(void*)createGObject(CastOptions._getGType), Yes.Take);
  }
}
