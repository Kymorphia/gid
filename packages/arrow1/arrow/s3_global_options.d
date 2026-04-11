/// Module for [S3GlobalOptions] class
module arrow.s3_global_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class S3GlobalOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_s3_global_options_get_type != &gidSymbolNotFound ? garrow_s3_global_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override S3GlobalOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.s3_global_options.S3GlobalOptions]
      Returns: New builder object
  */
  static S3GlobalOptionsGidBuilder builder()
  {
    return new S3GlobalOptionsGidBuilder;
  }

  /**
      Get `logLevel` property.
      Returns: The log level of S3 APIs.
  */
  @property arrow.types.S3LogLevel logLevel()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.S3LogLevel)("log-level");
  }

  /**
      Set `logLevel` property.
      Params:
        propval = The log level of S3 APIs.
  */
  @property void logLevel(arrow.types.S3LogLevel propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.S3LogLevel)("log-level", propval);
  }

  /** */
  this()
  {
    GArrowS3GlobalOptions* _cretval;
    _cretval = garrow_s3_global_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.s3_global_options.S3GlobalOptions]
class S3GlobalOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `logLevel` property.
      Params:
        propval = The log level of S3 APIs.
      Returns: Builder instance for fluent chaining
  */
  T logLevel(arrow.types.S3LogLevel propval)
  {
    return setProperty("log-level", propval);
  }
}

/// Fluent builder for [arrow.s3_global_options.S3GlobalOptions]
final class S3GlobalOptionsGidBuilder : S3GlobalOptionsGidBuilderImpl!S3GlobalOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  S3GlobalOptions build()
  {
    return new S3GlobalOptions(cast(void*)createGObject(S3GlobalOptions._getGType), Yes.Take);
  }
}
