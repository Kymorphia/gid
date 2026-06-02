/// Module for [StructFieldOptions] class
module arrow.struct_field_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class StructFieldOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_field_options_get_type != &gidSymbolNotFound ? garrow_struct_field_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructFieldOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.struct_field_options.StructFieldOptions]
      Returns: New builder object
  */
  static StructFieldOptionsGidBuilder builder() nothrow
  {
    return new StructFieldOptionsGidBuilder;
  }

  /** */
  @property string fieldRef() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("field-ref");
  }

  /** */
  this() nothrow
  {
    GArrowStructFieldOptions* _cretval;
    _cretval = garrow_struct_field_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void setFieldRef(string fieldRef)
  {
    const(char)* _fieldRef = fieldRef.toCString(No.Alloc);
    GError *_err;
    garrow_struct_field_options_set_field_ref(cast(GArrowStructFieldOptions*)this._cPtr, _fieldRef, &_err);
    if (_err)
      throw new ErrorWrap(_err);
  }
}

/// Fluent builder implementation template for [arrow.struct_field_options.StructFieldOptions]
class StructFieldOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.struct_field_options.StructFieldOptions]
final class StructFieldOptionsGidBuilder : StructFieldOptionsGidBuilderImpl!StructFieldOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StructFieldOptions build() nothrow
  {
    return new StructFieldOptions(cast(void*)createGObject(StructFieldOptions._getGType), Yes.Take);
  }
}
