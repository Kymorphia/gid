/// Module for [Relation] class
module gid.glib2.relation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    A [gid.glib2.relation.Relation] is a table of data which can be indexed on any number
    of fields, rather like simple database tables. A [gid.glib2.relation.Relation] contains
    a number of records, called tuples. Each record contains a number of
    fields. Records are not ordered, so it is not possible to find the
    record at a particular index.
    
    Note that [gid.glib2.relation.Relation] tables are currently limited to 2 fields.
    
    To create a [gid.glib2.relation.Relation], use [gid.glib2.relation.Relation.new_].
    
    To specify which fields should be indexed, use [gid.glib2.relation.Relation.index].
    Note that this must be called before any tuples are added to the
    [gid.glib2.relation.Relation].
    
    To add records to a [gid.glib2.relation.Relation] use [gid.glib2.relation.Relation.insert].
    
    To determine if a given record appears in a [gid.glib2.relation.Relation], use
    [gid.glib2.relation.Relation.exists]. Note that fields are compared directly, so
    pointers must point to the exact same position (i.e. different
    copies of the same string will not match.)
    
    To count the number of records which have a particular value in a
    given field, use [gid.glib2.relation.Relation.count].
    
    To get all the records which have a particular value in a given
    field, use [gid.glib2.relation.Relation.select]. To access fields of the resulting
    records, use [gid.glib2.tuples.Tuples.index]. To free the resulting records use
    [gid.glib2.tuples.Tuples.destroy].
    
    To delete all records which have a particular value in a given
    field, use [gid.glib2.relation.Relation.delete_].
    
    To destroy the [gid.glib2.relation.Relation], use [gid.glib2.relation.Relation.destroy].
    
    To help debug [gid.glib2.relation.Relation] objects, use [gid.glib2.relation.Relation.print].
    
    [gid.glib2.relation.Relation] has been marked as deprecated, since this API has never
    been fully implemented, is not very actively maintained and rarely
    used.

    Deprecated: Rarely used API
*/
class Relation : OpaqueWrap!(GRelation*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Returns the number of tuples in a #GRelation that have the given
      value in the given field.
  
      Params:
        key = the value to compare with.
        field = the field of each record to match.
      Returns: the number of matches.
  
      Deprecated: Rarely used API
  */
  int count(const(void)* key, int field) nothrow
  {
    int _retval;
    _retval = g_relation_count(cast(GRelation*)this._cPtr, key, field);
    return _retval;
  }

  /**
      Deletes any records from a #GRelation that have the given key value
      in the given field.
  
      Params:
        key = the value to compare with.
        field = the field of each record to match.
      Returns: the number of records deleted.
  
      Deprecated: Rarely used API
  */
  int delete_(const(void)* key, int field) nothrow
  {
    int _retval;
    _retval = g_relation_delete(cast(GRelation*)this._cPtr, key, field);
    return _retval;
  }

  /**
      Destroys the #GRelation, freeing all memory allocated. However, it
      does not free memory allocated for the tuple data, so you should
      free that first if appropriate.
  
      Deprecated: Rarely used API
  */
  void destroy() nothrow
  {
    g_relation_destroy(cast(GRelation*)this._cPtr);
  }

  /**
      Outputs information about all records in a #GRelation, as well as
      the indexes. It is for debugging.
  
      Deprecated: Rarely used API
  */
  void print() nothrow
  {
    g_relation_print(cast(GRelation*)this._cPtr);
  }
}
