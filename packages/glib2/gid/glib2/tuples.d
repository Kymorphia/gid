/// Module for [Tuples] struct
module gid.glib2.tuples;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    The #GTuples struct is used to return records (or tuples) from the
    #GRelation by [gid.glib2.relation.Relation.select]. It only contains one public
    member - the number of records that matched. To access the matched
    records, you must use [gid.glib2.tuples.Tuples.index].

    Deprecated: Rarely used API
*/
struct Tuples
{
  /**
      the number of records that matched.
  */
  uint len;

  /**
      Frees the records which were returned by [gid.glib2.relation.Relation.select]. This
      should always be called after [gid.glib2.relation.Relation.select] when you are
      finished with the records. The records are not removed from the
      #GRelation.
  
      Deprecated: Rarely used API
  */
  void destroy() nothrow
  {
    g_tuples_destroy(cast(GTuples*)&this);
  }

  /**
      Gets a field from the records returned by [gid.glib2.relation.Relation.select]. It
      returns the given field of the record at the given index. The
      returned value should not be changed.
  
      Params:
        index = the index of the record.
        field = the field to return.
      Returns: the field of the record.
  
      Deprecated: Rarely used API
  */
  void* index(int index, int field) nothrow
  {
    auto _retval = g_tuples_index(cast(GTuples*)&this, index, field);
    return _retval;
  }
}
