/// D types for parquet23 library
module parquet.types;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;


/**
    The major version.
*/
enum VERSION_MAJOR = 23;

/**
    The micro version.
*/
enum VERSION_MICRO = 1;

/**
    The minor version.
*/
enum VERSION_MINOR = 0;

/**
    The version tag. Normally, it's an empty string. It's "SNAPSHOT"
    for snapshot version.
*/
enum VERSION_TAG = "";
