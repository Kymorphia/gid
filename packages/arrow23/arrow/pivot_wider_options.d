/// Module for [PivotWiderOptions] class
module arrow.pivot_wider_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PivotWiderOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_pivot_wider_options_get_type != &gidSymbolNotFound ? garrow_pivot_wider_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowPivotWiderOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override PivotWiderOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.pivot_wider_options.PivotWiderOptions]
      Returns: New builder object
  */
  static PivotWiderOptionsGidBuilder builder() nothrow
  {
    return new PivotWiderOptionsGidBuilder;
  }

  /**
      Get `keyNames` property.
      Returns: The values expected in the pivot key column.
  */
  @property string[] keyNames() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string[])("key-names");
  }

  /**
      Set `keyNames` property.
      Params:
        propval = The values expected in the pivot key column.
  */
  @property void keyNames(string[] propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string[])("key-names", propval);
  }

  /**
      Get `unexpectedKeyBehavior` property.
      Returns: The behavior when pivot keys not in key_names are encountered.
  */
  @property arrow.types.PivotWiderUnexpectedKeyBehavior unexpectedKeyBehavior() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.PivotWiderUnexpectedKeyBehavior)("unexpected-key-behavior");
  }

  /**
      Set `unexpectedKeyBehavior` property.
      Params:
        propval = The behavior when pivot keys not in key_names are encountered.
  */
  @property void unexpectedKeyBehavior(arrow.types.PivotWiderUnexpectedKeyBehavior propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.PivotWiderUnexpectedKeyBehavior)("unexpected-key-behavior", propval);
  }

  /** */
  this() nothrow
  {
    GArrowPivotWiderOptions* _cretval;
    _cretval = garrow_pivot_wider_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.pivot_wider_options.PivotWiderOptions]
class PivotWiderOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `keyNames` property.
      Params:
        propval = The values expected in the pivot key column.
      Returns: Builder instance for fluent chaining
  */
  T keyNames(string[] propval) nothrow
  {
    return setProperty("key-names", propval);
  }

  /**
      Set `unexpectedKeyBehavior` property.
      Params:
        propval = The behavior when pivot keys not in key_names are encountered.
      Returns: Builder instance for fluent chaining
  */
  T unexpectedKeyBehavior(arrow.types.PivotWiderUnexpectedKeyBehavior propval) nothrow
  {
    return setProperty("unexpected-key-behavior", propval);
  }
}

/// Fluent builder for [arrow.pivot_wider_options.PivotWiderOptions]
final class PivotWiderOptionsGidBuilder : PivotWiderOptionsGidBuilderImpl!PivotWiderOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PivotWiderOptions build() nothrow
  {
    return new PivotWiderOptions(cast(void*)createGObject(PivotWiderOptions._getGType), Yes.Take);
  }
}
