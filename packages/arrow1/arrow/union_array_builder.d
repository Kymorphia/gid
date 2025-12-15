/// Module for [UnionArrayBuilder] class
module arrow.union_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class UnionArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_union_array_builder_get_type != &gidSymbolNotFound ? garrow_union_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnionArrayBuilder self()
  {
    return this;
  }

  /** */
  byte appendChild(arrow.array_builder.ArrayBuilder child, string fieldName = null)
  {
    byte _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = garrow_union_array_builder_append_child(cast(GArrowUnionArrayBuilder*)this._cPtr, child ? cast(GArrowArrayBuilder*)child._cPtr(No.Dup) : null, _fieldName);
    return _retval;
  }

  /**
      Append an element to the union array.
      
      If builder is #GArrowDenseUnionArrayBuilder, this must be followed by an
      append to the appropriate child builder.
      
      If builder is #GArrowSparseUnionArrayBuilder, this must be
      followed by appends to all child builders. The corresponding child
      builder must be appended to independently after this method is
      called, and all other child builders must have null or empty value
      appended.
  
      Params:
        value = A type ID value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValue(byte value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_union_array_builder_append_value(cast(GArrowUnionArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
