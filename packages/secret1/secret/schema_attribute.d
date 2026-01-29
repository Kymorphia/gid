/// Module for [SchemaAttribute] class
module secret.schema_attribute;

import gid.gid;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    An attribute in a #SecretSchema.
*/
class SchemaAttribute : gobject.boxed.Boxed
{

  /**
      Create a `schema_attribute.SchemaAttribute` boxed type.
      Params:
        name = name of the attribute
        type = the type of the attribute
  */
  this(string name = string.init, secret.types.SchemaAttributeType type = secret.types.SchemaAttributeType.init)
  {
    super(gMalloc(SecretSchemaAttribute.sizeof), Yes.Take);
    this.name = name;
    this.type = type;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_schema_attribute_get_type != &gidSymbolNotFound ? secret_schema_attribute_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SchemaAttribute self()
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: name of the attribute
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(SecretSchemaAttribute*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = name of the attribute
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(SecretSchemaAttribute*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(SecretSchemaAttribute*)this._cPtr).name);
  }

  /**
      Get `type` field.
      Returns: the type of the attribute
  */
  @property secret.types.SchemaAttributeType type()
  {
    return cast(secret.types.SchemaAttributeType)(cast(SecretSchemaAttribute*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the attribute
  */
  @property void type(secret.types.SchemaAttributeType propval)
  {
    (cast(SecretSchemaAttribute*)this._cPtr).type = cast(SecretSchemaAttributeType)propval;
  }
}
