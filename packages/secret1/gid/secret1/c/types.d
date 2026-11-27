/// C types for secret1 library
module gid.secret1.c.types;

public import gid.core.basictypes;
public import gid.gobject2.c.types;
public import gid.gio2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "Secret";

/// GIR namespace version of the binding
enum string _gidGirVersion = "1";

/**
    Flags which determine which parts of the #SecretBackend are initialized.
*/
@gidGir("BackendFlags")
enum SecretBackendFlags
{
  /**
      no flags for initializing the #SecretBackend
  */
  None = 0,

  /**
      establish a session for transfer of secrets
        while initializing the #SecretBackend
  */
  OpenSession = 2,

  /**
      load collections while initializing the
        #SecretBackend
  */
  LoadCollections = 4,
}

/**
    Flags for [gid.secret1.collection.Collection.create].
*/
@gidGir("CollectionCreateFlags")
enum SecretCollectionCreateFlags : uint
{
  /**
      no flags
  */
  None = 0,
}

/**
    Flags which determine which parts of the #SecretCollection proxy are initialized.
*/
@gidGir("CollectionFlags")
enum SecretCollectionFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      items have or should be loaded
  */
  LoadItems = 2,
}

/**
    Errors returned by the Secret Service.
    
    None of the errors are appropriate for display to the user. It is up to the
    application to handle them appropriately.
*/
@gidGir("Error")
enum SecretError
{
  /**
      received an invalid data or message from the Secret
        Service
  */
  Protocol = 1,

  /**
      the item or collection is locked and the operation
        cannot be performed
  */
  IsLocked = 2,

  /**
      no such item or collection found in the Secret
        Service
  */
  NoSuchObject = 3,

  /**
      a relevant item or collection already exists
  */
  AlreadyExists = 4,

  /**
      the file format is not valid
  */
  InvalidFileFormat = 5,

  /**
      the xdg:schema attribute of the table does not match the schema name
  */
  MismatchedSchema = 6,

  /**
      attribute contained in table not found in corresponding schema
  */
  NoMatchingAttribute = 7,

  /**
      attribute could not be parsed according to its type reported in the table's
      schema
  */
  WrongType = 8,

  /**
      attribute list passed to secret_attributes_validate has no elements to
      validate
  */
  EmptyTable = 9,
}

/**
    Flags for [gid.secret1.item.Item.create].
*/
@gidGir("ItemCreateFlags")
enum SecretItemCreateFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      replace an item with the same attributes.
  */
  Replace = 2,
}

/**
    Flags which determine which parts of the #SecretItem proxy are initialized.
*/
@gidGir("ItemFlags")
enum SecretItemFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      a secret has been (or should be) loaded for #SecretItem
  */
  LoadSecret = 2,
}

/**
    The type of an attribute in a `struct@SecretSchema`.
    
    Attributes are stored as strings in the Secret Service, and the attribute
    types simply define standard ways to store integer and boolean values as
    strings.
*/
@gidGir("SchemaAttributeType")
enum SecretSchemaAttributeType
{
  /**
      a utf-8 string attribute
  */
  String = 0,

  /**
      an integer attribute, stored as a decimal
  */
  Integer = 1,

  /**
      a boolean attribute, stored as 'true' or 'false'
  */
  Boolean = 2,
}

/**
    Flags for a #SecretSchema definition.
*/
@gidGir("SchemaFlags")
enum SecretSchemaFlags : uint
{
  /**
      no flags for the schema
  */
  None = 0,

  /**
      don't match the schema name when looking up or
        removing passwords
  */
  DontMatchName = 2,
}

/**
    Different types of schemas for storing secrets, intended for use with
    `func@get_schema`.
    
    ## @SECRET_SCHEMA_NOTE
    
    A predefined schema for personal passwords stored by the user in the
    password manager. This schema has no attributes, and the items are not
    meant to be used automatically by applications.
    
    When used to search for items using this schema, it will only match
    items that have the same schema. Items stored via libgnome-keyring with the
    `GNOME_KEYRING_ITEM_NOTE` item type will match.
    
    ## @SECRET_SCHEMA_COMPAT_NETWORK
    
    A predefined schema that is compatible with items stored via the
    libgnome-keyring 'network password' functions. This is meant to be used by
    applications migrating from libgnome-keyring which stored their secrets as
    'network passwords'. It is not recommended that new code use this schema.
    
    When used to search for items using this schema, it will only match
    items that have the same schema. Items stored via libgnome-keyring with the
    `GNOME_KEYRING_ITEM_NETWORK_PASSWORD` item type will match.
    
    The following attributes exist in the schema:
    
    ### Attributes:
    
    <table>
        <tr>
            <td><tt>user</tt>:</td>
            <td>The user name (string).</td>
        </tr>
        <tr>
            <td><tt>domain</tt>:</td>
            <td>The login domain or realm (string).</td></tr>
        <tr>
            <td><tt>object</tt>:</td>
            <td>The object or path (string).</td>
        </tr>
        <tr>
            <td><tt>protocol</tt>:</td>
            <td>The protocol (a string like 'http').</td>
        </tr>
        <tr>
            <td><tt>port</tt>:</td>
            <td>The network port (integer).</td>
        </tr>
        <tr>
            <td><tt>server</tt>:</td>
            <td>The hostname or server (string).</td>
        </tr>
        <tr>
            <td><tt>authtype</tt>:</td>
            <td>The authentication type (string).</td>
        </tr>
    </table>
*/
@gidGir("SchemaType")
enum SecretSchemaType
{
  /**
      Personal passwords
  */
  Note = 0,

  /**
      Network passwords from older
         libgnome-keyring storage
  */
  CompatNetwork = 1,
}

/**
    Various flags to be used with [gid.secret1.service.Service.search] and [gid.secret1.service.Service.searchSync].
*/
@gidGir("SearchFlags")
enum SecretSearchFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      all the items matching the search will be returned, instead of just the first one
  */
  All = 2,

  /**
      unlock locked items while searching
  */
  Unlock = 4,

  /**
      while searching load secrets for items that are not locked
  */
  LoadSecrets = 8,
}

/**
    Flags which determine which parts of the #SecretService proxy are initialized
    during a [gid.secret1.service.Service.get] or [gid.secret1.service.Service.open] operation.
*/
@gidGir("ServiceFlags")
enum SecretServiceFlags : uint
{
  /**
      no flags for initializing the #SecretService
  */
  None = 0,

  /**
      establish a session for transfer of secrets
        while initializing the #SecretService
  */
  OpenSession = 2,

  /**
      load collections while initializing the
        #SecretService
  */
  LoadCollections = 4,
}

/**
    #SecretBackend represents a backend implementation of password
    storage.
*/
struct SecretBackend;

/**
    The interface for #SecretBackend.
*/
struct SecretBackendInterface
{
  /**
      the parent interface
  */
  GTypeInterface parentIface;

  /**
      implementation of reinitialization step in constructor, optional
  */
  extern(C) void function(SecretBackend* self, SecretBackendFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ensureForFlags;

  /**
      implementation of reinitialization step in constructor, optional
  */
  extern(C) gboolean function(SecretBackend* self, GAsyncResult* result, GError** _err) ensureForFlagsFinish;

  /**
      implementation of `func@password_store`, required
  */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) store;

  /**
      implementation of `func@password_store_finish`, required
  */
  extern(C) gboolean function(SecretBackend* self, GAsyncResult* result, GError** _err) storeFinish;

  /**
      implementation of `func@password_lookup`, required
  */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookup;

  /**
      implementation of `func@password_lookup_finish`, required
  */
  extern(C) SecretValue* function(SecretBackend* self, GAsyncResult* result, GError** _err) lookupFinish;

  /**
      implementation of `func@password_clear`, required
  */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) clear;

  /**
      implementation of `func@password_clear_finish`, required
  */
  extern(C) gboolean function(SecretBackend* self, GAsyncResult* result, GError** _err) clearFinish;

  /**
      implementation of `func@password_search`, required
  */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) search;

  /**
      implementation of `func@password_search_finish`, required
  */
  extern(C) GList* function(SecretBackend* self, GAsyncResult* result, GError** _err) searchFinish;
}

/**
    A proxy object representing a collection of secrets in the Secret Service.
    
    #SecretCollection represents a collection of secret items stored in the
    Secret Service.
    
    A collection can be in a locked or unlocked state. Use
    `method@SecretService.lock` or `method@SecretService.unlock` to lock or
    unlock the collection.
    
    Use the `property@SecretCollection:items` property or
    `method@SecretCollection.get_items` to lookup the items in the collection.
    There may not be any items exposed when the collection is locked.
*/
struct SecretCollection
{
  /** */
  GDBusProxy parent;

  /** */
  SecretCollectionPrivate* pv;
}

/**
    The class for #SecretCollection.
*/
struct SecretCollectionClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[8] padding;
}

/** */
@gidGir("CollectionPrivate")
struct SecretCollectionPrivate;

/**
    A secret item
    
    #SecretItem represents a secret item stored in the Secret Service.
    
    Each item has a value, represented by a [gid.secret1.value.Value], which can be
    retrieved by [gid.secret1.item.Item.getSecret] or set by [gid.secret1.item.Item.setSecret].
    The item is only available when the item is not locked.
    
    Items can be locked or unlocked using the [gid.secret1.service.Service.lock] or
    [gid.secret1.service.Service.unlock] functions. The Secret Service may not be able to
    unlock individual items, and may unlock an entire collection when a single
    item is unlocked.
    
    Each item has a set of attributes, which are used to locate the item later.
    These are not stored or transferred in a secure manner. Each attribute has
    a string name and a string value. Use [gid.secret1.service.Service.search] to search for
    items based on their attributes, and [gid.secret1.item.Item.setAttributes] to change
    the attributes associated with an item.
    
    Items can be created with [gid.secret1.item.Item.create] or [gid.secret1.service.Service.store].
*/
struct SecretItem
{
  /** */
  GDBusProxy parentInstance;

  /** */
  SecretItemPrivate* pv;
}

/**
    The class for #SecretItem.
*/
struct SecretItemClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[4] padding;
}

/** */
@gidGir("ItemPrivate")
struct SecretItemPrivate;

/**
    A prompt in the Service
    
    A proxy object representing a prompt that the Secret Service will display
    to the user.
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a #SecretPrompt object is created by this library, and
    passed to the [gid.secret1.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the [gid.secret1.service.Service] class.
*/
struct SecretPrompt
{
  /** */
  GDBusProxy parentInstance;

  /** */
  SecretPromptPrivate* pv;
}

/**
    The class for #SecretPrompt.
*/
struct SecretPromptClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[8] padding;
}

/** */
@gidGir("PromptPrivate")
struct SecretPromptPrivate;

/**
    A read-only view of a secret item in the Secret Service.
    
    #SecretRetrievable provides a read-only view of a secret item
    stored in the Secret Service.
    
    Each item has a value, represented by a [gid.secret1.value.Value], which can be
    retrieved by [gid.secret1.retrievable.Retrievable.retrieveSecret] and
    [gid.secret1.retrievable.Retrievable.retrieveSecretFinish].
*/
struct SecretRetrievable;

/**
    The interface for #SecretRetrievable.
*/
struct SecretRetrievableInterface
{
  /**
      the parent interface
  */
  GTypeInterface parentIface;

  /**
      implementation of [gid.secret1.retrievable.Retrievable.retrieveSecret],
        required
  */
  extern(C) void function(SecretRetrievable* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) retrieveSecret;

  /**
      implementation of
        [gid.secret1.retrievable.Retrievable.retrieveSecretFinish], required
  */
  extern(C) SecretValue* function(SecretRetrievable* self, GAsyncResult* result, GError** _err) retrieveSecretFinish;
}

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
struct SecretSchema
{
  /**
      the dotted name of the schema
  */
  const(char)* name;

  /**
      flags for the schema
  */
  SecretSchemaFlags flags;

  /**
      the attribute names and types of those attributes
  */
  SecretSchemaAttribute[32] attributes;

  /** */
  int reserved;

  /** */
  void* reserved1;

  /** */
  void* reserved2;

  /** */
  void* reserved3;

  /** */
  void* reserved4;

  /** */
  void* reserved5;

  /** */
  void* reserved6;

  /** */
  void* reserved7;
}

/**
    An attribute in a #SecretSchema.
*/
struct SecretSchemaAttribute
{
  /**
      name of the attribute
  */
  const(char)* name;

  /**
      the type of the attribute
  */
  SecretSchemaAttributeType type;
}

/**
    A proxy object representing the Secret Service.
    
    A #SecretService object either represents an implementation of the
    [`org.freedesktop.Secret`](https://specifications.freedesktop.org/secret-service/latest/)
    D-Bus service or a file that is encrypted using a master secret that was
    provided by the
    [secret portal](https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.Secret.html).
    
    Normally a single #SecretService object can be shared between multiple
    callers. The [gid.secret1.service.Service.get] method is used to access this #SecretService
    object. If a new independent #SecretService object is required, use
    [gid.secret1.service.Service.open].
    
    In order to securely transfer secrets to the Sercret Service, a session
    is established. This session can be established while initializing a
    #SecretService object by passing the [gid.secret1.types.ServiceFlags.OpenSession] flag
    to the [gid.secret1.service.Service.get] or [gid.secret1.service.Service.open] functions. In order to
    establish a session on an already existing #SecretService, use the
    [gid.secret1.service.Service.ensureSession] function.
    
    To search for items, use the [gid.secret1.service.Service.search] method.
    
    Multiple collections can exist in the Secret Service, each of which contains
    secret items. In order to instantiate [gid.secret1.collection.Collection] objects which
    represent those collections while initializing a #SecretService then pass
    the [gid.secret1.types.ServiceFlags.LoadCollections] flag to the [gid.secret1.service.Service.get] or
    [gid.secret1.service.Service.open] functions. In order to establish a session on an already
    existing #SecretService, use the [gid.secret1.service.Service.loadCollections] function.
    To access the list of collections use [gid.secret1.service.Service.getCollections].
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a [gid.secret1.prompt.Prompt] object is created by this library, and
    passed to the [gid.secret1.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the #SecretService class.
*/
struct SecretService
{
  /** */
  GDBusProxy parent;

  /** */
  SecretServicePrivate* pv;
}

/**
    The class for #SecretService.
*/
struct SecretServiceClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /**
      the [gid.gobject2.types.size_t] of the [gid.secret1.collection.Collection] objects
        instantiated by the #SecretService proxy
  */
  GType collectionGtype;

  /**
      the [gid.gobject2.types.size_t] of the [gid.secret1.item.Item] objects
        instantiated by the #SecretService proxy
  */
  GType itemGtype;

  /**
      called to perform synchronous prompting when necessary
  */
  extern(C) GVariant* function(SecretService* self, SecretPrompt* prompt, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) promptSync;

  /**
      called to perform asynchronous prompting when necessary
  */
  extern(C) void function(SecretService* self, SecretPrompt* prompt, const(GVariantType)* returnType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) promptAsync;

  /**
      called to complete an asynchronous prompt operation
  */
  extern(C) GVariant* function(SecretService* self, GAsyncResult* result, GError** _err) promptFinish;

  /**
      called to get the GObject type for collections
        instantiated by the #SecretService proxy
  */
  extern(C) GType function(SecretService* self) getCollectionGtype;

  /**
      called to get the GObject type for collections
        instantiated by the #SecretService proxy
  */
  extern(C) GType function(SecretService* self) getItemGtype;

  /** */
  void*[14] padding;
}

/** */
@gidGir("ServicePrivate")
struct SecretServicePrivate;

/**
    A value containing a secret
    
    A #SecretValue contains a password or other secret value.
    
    Use [gid.secret1.value.Value.get] to get the actual secret data, such as a password.
    The secret data is not necessarily null-terminated, unless the content type
    is "text/plain".
    
    Each #SecretValue has a content type. For passwords, this is `text/plain`.
    Use [gid.secret1.value.Value.getContentType] to look at the content type.
    
    #SecretValue is reference counted and immutable. The secret data is only
    freed when all references have been released via [gid.secret1.value.Value.unref].
*/
struct SecretValue;

