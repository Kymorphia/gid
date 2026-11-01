/// Module for [SchemaAttribute] class
module secret.schema_attribute;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    An attribute in a #SecretSchema.
*/
class SchemaAttribute : gobject.boxed.BoxedWrap!(secret_schema_attribute_get_type)
{
  /**
      Create a `schema_attribute.SchemaAttribute` boxed type.
      Params:
        type = the type of the attribute
  */
  this(secret.types.SchemaAttributeType type = secret.types.SchemaAttributeType.init) nothrow
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
  @property secret.types.SchemaAttributeType type() nothrow
  {
    return cast(secret.types.SchemaAttributeType)(cast(SecretSchemaAttribute*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the attribute
  */
  @property void type(secret.types.SchemaAttributeType propval) nothrow
  {
    (cast(SecretSchemaAttribute*)this._cPtr).type = cast(SecretSchemaAttributeType)propval;
  }
}
