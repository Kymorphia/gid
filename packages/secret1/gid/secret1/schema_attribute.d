/// Module for [SchemaAttribute] class
module gid.secret1.schema_attribute;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.types;

/**
    An attribute in a #SecretSchema.
*/
class SchemaAttribute : gid.gobject2.boxed.BoxedWrap!(secret_schema_attribute_get_type)
{
  /**
      Create a `schema_attribute.SchemaAttribute` boxed type.
      Params:
        type = the type of the attribute
  */
  this(gid.secret1.types.SchemaAttributeType type = gid.secret1.types.SchemaAttributeType.init) nothrow
  {
    super(boxedNew!SecretSchemaAttribute(_getGType), Yes.Take);
    this.type = type;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override SchemaAttribute self() nothrow
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: name of the attribute
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(SecretSchemaAttribute*)this._cPtr).name);
  }

  /**
      Get `type` field.
      Returns: the type of the attribute
  */
  @property gid.secret1.types.SchemaAttributeType type() nothrow
  {
    return cast(gid.secret1.types.SchemaAttributeType)(cast(SecretSchemaAttribute*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the attribute
  */
  @property void type(gid.secret1.types.SchemaAttributeType propval) nothrow
  {
    (cast(SecretSchemaAttribute*)this._cPtr).type = cast(SecretSchemaAttributeType)propval;
  }
}
