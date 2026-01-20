/// Module for [Relation] class
module glib.relation;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A [glib.relation.Relation] is a table of data which can be indexed on any number
    of fields, rather like simple database tables. A [glib.relation.Relation] contains
    a number of records, called tuples. Each record contains a number of
    fields. Records are not ordered, so it is not possible to find the
    record at a particular index.
    
    Note that [glib.relation.Relation] tables are currently limited to 2 fields.
    
    To create a [glib.relation.Relation], use [glib.relation.Relation.new_].
    
    To specify which fields should be indexed, use [glib.relation.Relation.index].
    Note that this must be called before any tuples are added to the
    [glib.relation.Relation].
    
    To add records to a [glib.relation.Relation] use [glib.relation.Relation.insert].
    
    To determine if a given record appears in a [glib.relation.Relation], use
    [glib.relation.Relation.exists]. Note that fields are compared directly, so
    pointers must point to the exact same position (i.e. different
    copies of the same string will not match.)
    
    To count the number of records which have a particular value in a
    given field, use [glib.relation.Relation.count].
    
    To get all the records which have a particular value in a given
    field, use [glib.relation.Relation.select]. To access fields of the resulting
    records, use [glib.tuples.Tuples.index]. To free the resulting records use
    [glib.tuples.Tuples.destroy].
    
    To delete all records which have a particular value in a given
    field, use [glib.relation.Relation.delete_].
    
    To destroy the [glib.relation.Relation], use [glib.relation.Relation.destroy].
    
    To help debug [glib.relation.Relation] objects, use [glib.relation.Relation.print].
    
    [glib.relation.Relation] has been marked as deprecated, since this API has never
    been fully implemented, is not very actively maintained and rarely
    used.

    Deprecated: Rarely used API
*/
class Relation
{
  GRelation* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.relation.Relation");

    _cInstancePtr = cast(GRelation*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
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
  int count(const(void)* key, int field)
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
  int delete_(const(void)* key, int field)
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
  void destroy()
  {
    g_relation_destroy(cast(GRelation*)this._cPtr);
  }

  /**
      Outputs information about all records in a #GRelation, as well as
      the indexes. It is for debugging.
  
      Deprecated: Rarely used API
  */
  void print()
  {
    g_relation_print(cast(GRelation*)this._cPtr);
  }
}
