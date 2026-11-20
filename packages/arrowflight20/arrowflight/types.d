/// D types for arrowflight20 library
module arrowflight.types;

import arrowflight.c.functions;
import arrowflight.c.types;
import gid.gid;


// Callbacks

/**
    It is called with each header name/value pair, together with the
    user_data parameter which is passed to
    [arrowflight.call_options.CallOptions.foreachHeader] and so on.

    Params:
      name = A header name.
      value = The value corresponding to the name.
*/
alias HeaderFunc = void delegate(string name, string value);

/**
    The major version.
*/
enum VERSION_MAJOR = 20;

/**
    The micro version.
*/
enum VERSION_MICRO = 0;

/**
    The minor version.
*/
enum VERSION_MINOR = 0;

/**
    The version tag. Normally, it's an empty string. It's "SNAPSHOT"
    for snapshot version.
*/
enum VERSION_TAG = "";
