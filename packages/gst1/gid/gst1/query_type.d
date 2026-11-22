/// Module for [QueryType] enum namespace
module gid.gst1.query_type;

import gid.core.utils;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [QueryType] enum
struct QueryType
{
  alias Enum = gid.gst1.types.QueryType; ///

  /**
      Gets the #GstQueryTypeFlags associated with type.
  
      Params:
        type = a #GstQueryType
      Returns: a #GstQueryTypeFlags.
  */
  static gid.gst1.types.QueryTypeFlags getFlags(gid.gst1.types.QueryType type) nothrow
  {
    GstQueryTypeFlags _cretval;
    _cretval = gst_query_type_get_flags(type);
    gid.gst1.types.QueryTypeFlags _retval = cast(gid.gst1.types.QueryTypeFlags)_cretval;
    return _retval;
  }

  /**
      Get a printable name for the given query type. Do not modify or free.
  
      Params:
        type = the query type
      Returns: a reference to the static name of the query.
  */
  static string getName(gid.gst1.types.QueryType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_query_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the unique quark for the given query type.
  
      Params:
        type = the query type
      Returns: the quark associated with the query type
  */
  static gid.glib2.types.Quark toQuark(gid.gst1.types.QueryType type) nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_query_type_to_quark(type);
    return _retval;
  }
}
