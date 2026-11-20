/// Module for [MakeStructOptions] class
module arrow.make_struct_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class MakeStructOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_make_struct_options_get_type != &gidSymbolNotFound ? garrow_make_struct_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowMakeStructOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override MakeStructOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.make_struct_options.MakeStructOptions]
      Returns: New builder object
  */
  static MakeStructOptionsGidBuilder builder() nothrow
  {
    return new MakeStructOptionsGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowMakeStructOptions* _cretval;
    _cretval = garrow_make_struct_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a field to the struct options with the specified name, nullability,
      and optional metadata.
  
      Params:
        name = The name of the field to add.
        nullability = Whether the field is nullable.
        metadata = A #GHashTable for the field's
            metadata, or null.
  */
  void addField(string name, bool nullability, string[string] metadata = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    garrow_make_struct_options_add_field(cast(GArrowMakeStructOptions*)this._cPtr, _name, nullability, _metadata);
  }
}

/// Fluent builder implementation template for [arrow.make_struct_options.MakeStructOptions]
class MakeStructOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.make_struct_options.MakeStructOptions]
final class MakeStructOptionsGidBuilder : MakeStructOptionsGidBuilderImpl!MakeStructOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MakeStructOptions build() nothrow
  {
    return new MakeStructOptions(cast(void*)createGObject(MakeStructOptions._getGType), Yes.Take);
  }
}
