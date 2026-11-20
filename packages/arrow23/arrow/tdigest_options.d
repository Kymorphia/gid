/// Module for [TDigestOptions] class
module arrow.tdigest_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class TDigestOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_tdigest_options_get_type != &gidSymbolNotFound ? garrow_tdigest_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowTDigestOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override TDigestOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.tdigest_options.TDigestOptions]
      Returns: New builder object
  */
  static TDigestOptionsGidBuilder builder() nothrow
  {
    return new TDigestOptionsGidBuilder;
  }

  /**
      Get `bufferSize` property.
      Returns: Input buffer size, default 500.
  */
  @property uint bufferSize() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("buffer-size");
  }

  /**
      Set `bufferSize` property.
      Params:
        propval = Input buffer size, default 500.
  */
  @property void bufferSize(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("buffer-size", propval);
  }

  /**
      Get `delta` property.
      Returns: Compression parameter, default 100.
  */
  @property uint delta() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("delta");
  }

  /**
      Set `delta` property.
      Params:
        propval = Compression parameter, default 100.
  */
  @property void delta(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("delta", propval);
  }

  /**
      Get `minCount` property.
      Returns: If less than this many non-null values are observed, emit null.
  */
  @property uint minCount() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-count");
  }

  /**
      Set `minCount` property.
      Params:
        propval = If less than this many non-null values are observed, emit null.
  */
  @property void minCount(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("min-count", propval);
  }

  /**
      Get `skipNulls` property.
      Returns: If true (the default), null values are ignored. Otherwise, if any
        value is null, emit null.
  */
  @property bool skipNulls() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("skip-nulls");
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = If true (the default), null values are ignored. Otherwise, if any
          value is null, emit null.
  */
  @property void skipNulls(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("skip-nulls", propval);
  }

  /** */
  this() nothrow
  {
    GArrowTDigestOptions* _cretval;
    _cretval = garrow_tdigest_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  double[] getQs() nothrow
  {
    const(double)* _cretval;
    size_t _cretlength;
    _cretval = garrow_tdigest_options_get_qs(cast(GArrowTDigestOptions*)this._cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  void setQ(double q) nothrow
  {
    garrow_tdigest_options_set_q(cast(GArrowTDigestOptions*)this._cPtr, q);
  }

  /** */
  void setQs(double[] qs) nothrow
  {
    size_t _n;
    if (qs)
      _n = cast(size_t)qs.length;

    auto _qs = cast(double*)qs.ptr;
    garrow_tdigest_options_set_qs(cast(GArrowTDigestOptions*)this._cPtr, _qs, _n);
  }
}

/// Fluent builder implementation template for [arrow.tdigest_options.TDigestOptions]
class TDigestOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `bufferSize` property.
      Params:
        propval = Input buffer size, default 500.
      Returns: Builder instance for fluent chaining
  */
  T bufferSize(uint propval) nothrow
  {
    return setProperty("buffer-size", propval);
  }

  /**
      Set `delta` property.
      Params:
        propval = Compression parameter, default 100.
      Returns: Builder instance for fluent chaining
  */
  T delta(uint propval) nothrow
  {
    return setProperty("delta", propval);
  }

  /**
      Set `minCount` property.
      Params:
        propval = If less than this many non-null values are observed, emit null.
      Returns: Builder instance for fluent chaining
  */
  T minCount(uint propval) nothrow
  {
    return setProperty("min-count", propval);
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = If true (the default), null values are ignored. Otherwise, if any
          value is null, emit null.
      Returns: Builder instance for fluent chaining
  */
  T skipNulls(bool propval) nothrow
  {
    return setProperty("skip-nulls", propval);
  }
}

/// Fluent builder for [arrow.tdigest_options.TDigestOptions]
final class TDigestOptionsGidBuilder : TDigestOptionsGidBuilderImpl!TDigestOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TDigestOptions build() nothrow
  {
    return new TDigestOptions(cast(void*)createGObject(TDigestOptions._getGType), Yes.Take);
  }
}
