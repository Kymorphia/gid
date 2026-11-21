/// Module for [Schema] class
module gid.secret1.schema;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.schema_attribute;
import gid.secret1.types;

/**
    Represents a set of attributes that are stored with an item.
    
    These schemas are used for interoperability between various services storing
    the same types of items.
    
    Each schema has a name like `org.gnome.keyring.NetworkPassword`, and defines a
    set of attributes, and types (string, integer, boolean) for those attributes.
    
    Attributes are stored as strings in the Secret Service, and the attribute types
    simply define standard ways to store integer and boolean values as strings.
    Attributes are represented in libsecret via a [gid.glib2.hash_table.HashTable] with
    string keys and values. Even for values that defined as an integer or boolean in
    the schema, the attribute values in the [gid.glib2.hash_table.HashTable] are strings.
    Boolean values are stored as the strings 'true' and 'false'. Integer values are
    stored in decimal, with a preceding negative sign for negative integers.
    
    Schemas are handled entirely on the client side by this library. The name of the
    schema is automatically stored as an attribute on the item.
    
    Normally when looking up passwords only those with matching schema names are
    returned. If the schema @flags contain the [gid.secret1.types.SchemaFlags.DontMatchName] flag,
    then lookups will not check that the schema name matches that on the item, only
    the schema's attributes are matched. This is useful when you are looking up
    items that are not stored by the libsecret library. Other libraries such as
    libgnome-keyring don't store the schema name.
    
    Additional schemas can be defined via the [gid.secret1.schema.Schema] structure like this:
    
    ```c
    // in a header:
    
    const SecretSchema * example_get_schema (void) G_GNUC_CONST;
    
    #define EXAMPLE_SCHEMA  example_get_schema ()
    
    
    // in a .c file
    
    const SecretSchema *
    example_get_schema (void)
    {
        static const SecretSchema the_schema = {
            "org.example.Password", SECRET_SCHEMA_NONE,
            {
                {  "number", SECRET_SCHEMA_ATTRIBUTE_INTEGER },
                {  "string", SECRET_SCHEMA_ATTRIBUTE_STRING },
                {  "even", SECRET_SCHEMA_ATTRIBUTE_BOOLEAN },
                {  NULL, 0 },
            }
        };
        return &the_schema;
    }
    ```
*/
class Schema : gid.gobject2.boxed.BoxedWrap!(secret_schema_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Schema self() nothrow
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: the dotted name of the schema
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(SecretSchema*)this._cPtr).name);
  }

  /**
      Get `flags` field.
      Returns: flags for the schema
  */
  @property gid.secret1.types.SchemaFlags flags() nothrow
  {
    return cast(gid.secret1.types.SchemaFlags)(cast(SecretSchema*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags for the schema
  */
  @property void flags(gid.secret1.types.SchemaFlags propval) nothrow
  {
    (cast(SecretSchema*)this._cPtr).flags = cast(SecretSchemaFlags)propval;
  }

  /**
      Get `attributes` field.
      Returns: the attribute names and types of those attributes
  */
  @property gid.secret1.schema_attribute.SchemaAttribute[32] attributes() nothrow
  {
    gid.secret1.schema_attribute.SchemaAttribute[32] _retval;
    foreach (i; 0 .. 32)
      _retval[i] = new gid.secret1.schema_attribute.SchemaAttribute(cast(void*)&(cast(SecretSchema*)this._cPtr).attributes[i], No.Take);
    return _retval;
  }

  /**
      Using this function is not normally necessary from C code. This is useful
      for constructing #SecretSchema structures in bindings.
      
      A schema represents a set of attributes that are stored with an item. These
      schemas are used for interoperability between various services storing the
      same types of items.
      
      Each schema has an name like `org.gnome.keyring.NetworkPassword`, and
      defines a set of attributes names, and types (string, integer, boolean) for
      those attributes.
      
      Each key in the attributes table should be a attribute name strings, and
      the values in the table should be integers from the [gid.secret1.types.SchemaAttributeType]
      enumeration, representing the attribute type for each attribute name.
      
      Normally when looking up passwords only those with matching schema names are
      returned. If the schema flags contain the [gid.secret1.types.SchemaFlags.DontMatchName] flag,
      then lookups will not check that the schema name matches that on the item, only
      the schema's attributes are matched. This is useful when you are looking up items
      that are not stored by the libsecret library. Other libraries such as libgnome-keyring
      don't store the schema name.
  
      Params:
        name = the dotted name of the schema
        flags = the flags for the schema
        attributeNamesAndTypes = the attribute names and types of those attributes
      Returns: the new schema, which should be unreferenced with
          [gid.secret1.schema.Schema.unref] when done
  */
  static gid.secret1.schema.Schema new_(string name, gid.secret1.types.SchemaFlags flags, gid.secret1.types.SchemaAttributeType[string] attributeNamesAndTypes) nothrow
  {
    SecretSchema* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    auto _attributeNamesAndTypes = gHashTableFromD!(string, gid.secret1.types.SchemaAttributeType)(attributeNamesAndTypes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributeNamesAndTypes);
    _cretval = secret_schema_newv(_name, flags, _attributeNamesAndTypes);
    auto _retval = _cretval ? new gid.secret1.schema.Schema(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
