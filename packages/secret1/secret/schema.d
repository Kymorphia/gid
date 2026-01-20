/// Module for [Schema] class
module secret.schema;

import gid.gid;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    Represents a set of attributes that are stored with an item.
    
    These schemas are used for interoperability between various services storing
    the same types of items.
    
    Each schema has a name like `org.gnome.keyring.NetworkPassword`, and defines a
    set of attributes, and types (string, integer, boolean) for those attributes.
    
    Attributes are stored as strings in the Secret Service, and the attribute types
    simply define standard ways to store integer and boolean values as strings.
    Attributes are represented in libsecret via a [glib.hash_table.HashTable] with
    string keys and values. Even for values that defined as an integer or boolean in
    the schema, the attribute values in the [glib.hash_table.HashTable] are strings.
    Boolean values are stored as the strings 'true' and 'false'. Integer values are
    stored in decimal, with a preceding negative sign for negative integers.
    
    Schemas are handled entirely on the client side by this library. The name of the
    schema is automatically stored as an attribute on the item.
    
    Normally when looking up passwords only those with matching schema names are
    returned. If the schema @flags contain the [secret.types.SchemaFlags.DontMatchName] flag,
    then lookups will not check that the schema name matches that on the item, only
    the schema's attributes are matched. This is useful when you are looking up
    items that are not stored by the libsecret library. Other libraries such as
    libgnome-keyring don't store the schema name.
    
    Additional schemas can be defined via the `struct@Schema` structure like this:
    
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
class Schema : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_schema_get_type != &gidSymbolNotFound ? secret_schema_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Schema self()
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: the dotted name of the schema
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(SecretSchema*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the dotted name of the schema
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(SecretSchema*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(SecretSchema*)this._cPtr).name);
  }

  /**
      Get `flags` field.
      Returns: flags for the schema
  */
  @property secret.types.SchemaFlags flags()
  {
    return cast(secret.types.SchemaFlags)(cast(SecretSchema*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags for the schema
  */
  @property void flags(secret.types.SchemaFlags propval)
  {
    (cast(SecretSchema*)this._cPtr).flags = cast(SecretSchemaFlags)propval;
  }
}
