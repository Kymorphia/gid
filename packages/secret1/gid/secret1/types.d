/// D types for secret1 library
module gid.secret1.types;

import gid.core.utils;
import gid.secret1.c.functions;
import gid.secret1.c.types;


// Enums

/** */
alias BackendFlags = SecretBackendFlags;

/** */
alias CollectionCreateFlags = SecretCollectionCreateFlags;

/** */
alias CollectionFlags = SecretCollectionFlags;

/** */
alias Error = SecretError;

/** */
alias ItemCreateFlags = SecretItemCreateFlags;

/** */
alias ItemFlags = SecretItemFlags;

/** */
alias SchemaAttributeType = SecretSchemaAttributeType;

/** */
alias SchemaFlags = SecretSchemaFlags;

/** */
alias SchemaType = SecretSchemaType;

/** */
alias SearchFlags = SecretSearchFlags;

/** */
alias ServiceFlags = SecretServiceFlags;

/**
    Extension point for the secret backend.
*/
enum BACKEND_EXTENSION_POINT_NAME = "secret-backend";

/**
    An alias to the default collection.
    
    This can be passed to `func@password_store` [gid.secret1.collection.Collection.forAlias].
*/
enum COLLECTION_DEFAULT = "default";

/**
    An alias to the session collection, which will be cleared when the user ends
    the session.
    
    This can be passed to `func@password_store`, [gid.secret1.collection.Collection.forAlias] or
    similar functions.
*/
enum COLLECTION_SESSION = "session";

/**
    The major version of libsecret.
*/
enum MAJOR_VERSION = 0;

/**
    The micro version of libsecret.
*/
enum MICRO_VERSION = 7;

/**
    The minor version of libsecret.
*/
enum MINOR_VERSION = 21;
