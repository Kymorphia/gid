/// Module for [SetLookupOptions] class
module arrow.set_lookup_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SetLookupOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_set_lookup_options_get_type != &gidSymbolNotFound ? garrow_set_lookup_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SetLookupOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrow.set_lookup_options.SetLookupOptions]
  Returns: New builder object
  */
  static SetLookupOptionsGidBuilder builder()
  {
    return new SetLookupOptionsGidBuilder;
  }

  /**
      Get `skipNulls` property.
      Returns: Whether NULLs are skipped or not.
  */
  @property bool skipNulls()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("skip-nulls");
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = Whether NULLs are skipped or not.
  */
  @property void skipNulls(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("skip-nulls", propval);
  }

  /**
      Get `valueSet` property.
      Returns: The set of values to look up input values into.
  */
  @property arrow.datum.Datum valueSet()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.datum.Datum)("value-set");
  }

  /**
      Set `valueSet` property.
      Params:
        propval = The set of values to look up input values into.
  */
  @property void valueSet(arrow.datum.Datum propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.datum.Datum)("value-set", propval);
  }

  /** */
  this(arrow.datum.Datum valueSet = null)
  {
    GArrowSetLookupOptions* _cretval;
    _cretval = garrow_set_lookup_options_new(valueSet ? cast(GArrowDatum*)valueSet._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class SetLookupOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `skipNulls` property.
      Params:
        propval = Whether NULLs are skipped or not.
      Returns: Builder instance for fluent chaining
  */
  T skipNulls(bool propval)
  {
    return setProperty("skip-nulls", propval);
  }

  /**
      Set `valueSet` property.
      Params:
        propval = The set of values to look up input values into.
      Returns: Builder instance for fluent chaining
  */
  T valueSet(arrow.datum.Datum propval)
  {
    return setProperty("value-set", propval);
  }
}

/// Fluent builder for [arrow.set_lookup_options.SetLookupOptions]
final class SetLookupOptionsGidBuilder : SetLookupOptionsGidBuilderImpl!SetLookupOptionsGidBuilder
{
  SetLookupOptions build()
  {
    return new SetLookupOptions(cast(void*)createGObject(SetLookupOptions._getGType), Yes.Take);
  }
}
