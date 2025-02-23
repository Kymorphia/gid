module arrowdataset.types;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;


// Enums
alias SegmentEncoding = GADatasetSegmentEncoding;

/**
 * The major version.
 */
enum VERSION_MAJOR = 20;


/**
 * The micro version.
 */
enum VERSION_MICRO = 0;


/**
 * The minor version.
 */
enum VERSION_MINOR = 0;


/**
 * The version tag. Normally, it's an empty string. It's "SNAPSHOT"
 * for snapshot version.
 */
enum VERSION_TAG = "SNAPSHOT";

