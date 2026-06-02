/// Module for [QueryType] enum namespace
module gst.query_type;

import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [QueryType] enum
struct QueryType
{
  alias Enum = gst.types.QueryType; ///

  /**
      Gets the #GstQueryTypeFlags associated with type.
  
      Params:
        type = a #GstQueryType
      Returns: a #GstQueryTypeFlags.
  */
  static gst.types.QueryTypeFlags getFlags(gst.types.QueryType type) nothrow
  {
    GstQueryTypeFlags _cretval;
    _cretval = gst_query_type_get_flags(type);
    gst.types.QueryTypeFlags _retval = cast(gst.types.QueryTypeFlags)_cretval;
    return _retval;
  }

  /**
      Get a printable name for the given query type. Do not modify or free.
  
      Params:
        type = the query type
      Returns: a reference to the static name of the query.
  */
  static string getName(gst.types.QueryType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_query_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the unique quark for the given query type.
  
      Params:
        type = the query type
      Returns: the quark associated with the query type
  */
  static glib.types.Quark toQuark(gst.types.QueryType type) nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_query_type_to_quark(type);
    return _retval;
  }
}
