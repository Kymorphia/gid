/// Module for [RelationSet] class
module atk.relation_set;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.relation;
import atk.types;
import gid.gid;
import gobject.object;

/**
    A set of AtkRelations, normally the set of
     AtkRelations which an AtkObject has.
    
    The AtkRelationSet held by an object establishes its relationships
    with objects beyond the normal "parent/child" hierarchical
    relationships that all user interface objects have.
    AtkRelationSets establish whether objects are labelled or
    controlled by other components, share group membership with other
    components (for instance within a radio-button group), or share
    content which "flows" between them, among other types of possible
    relationships.
*/
class RelationSet : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_relation_set_get_type != &gidSymbolNotFound ? atk_relation_set_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RelationSet self()
  {
    return this;
  }

  /**
      Creates a new empty relation set.
      Returns: a new #AtkRelationSet
  */
  this()
  {
    AtkRelationSet* _cretval;
    _cretval = atk_relation_set_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a new relation to the current relation set if it is not already
      present.
      This function ref's the AtkRelation so the caller of this function
      should unref it to ensure that it will be destroyed when the AtkRelationSet
      is destroyed.
  
      Params:
        relation = an #AtkRelation
  */
  void add(atk.relation.Relation relation)
  {
    atk_relation_set_add(cast(AtkRelationSet*)this._cPtr, relation ? cast(AtkRelation*)relation._cPtr(No.Dup) : null);
  }

  /**
      Add a new relation of the specified type with the specified target to
      the current relation set if the relation set does not contain a relation
      of that type. If it is does contain a relation of that typea the target
      is added to the relation.
  
      Params:
        relationship = an #AtkRelationType
        target = an #AtkObject
  */
  void addRelationByType(atk.types.RelationType relationship, atk.object.ObjectWrap target)
  {
    atk_relation_set_add_relation_by_type(cast(AtkRelationSet*)this._cPtr, relationship, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
  }

  /**
      Determines whether the relation set contains a relation that matches the
      specified type.
  
      Params:
        relationship = an #AtkRelationType
      Returns: true if relationship is the relationship type of a relation
        in set, false otherwise
  */
  bool contains(atk.types.RelationType relationship)
  {
    bool _retval;
    _retval = cast(bool)atk_relation_set_contains(cast(AtkRelationSet*)this._cPtr, relationship);
    return _retval;
  }

  /**
      Determines whether the relation set contains a relation that
      matches the specified pair formed by type relationship and object
      target.
  
      Params:
        relationship = an #AtkRelationType
        target = an #AtkObject
      Returns: true if set contains a relation with the relationship
        type relationship with an object target, false otherwise
  */
  bool containsTarget(atk.types.RelationType relationship, atk.object.ObjectWrap target)
  {
    bool _retval;
    _retval = cast(bool)atk_relation_set_contains_target(cast(AtkRelationSet*)this._cPtr, relationship, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines the number of relations in a relation set.
      Returns: an integer representing the number of relations in the set.
  */
  int getNRelations()
  {
    int _retval;
    _retval = atk_relation_set_get_n_relations(cast(AtkRelationSet*)this._cPtr);
    return _retval;
  }

  /**
      Determines the relation at the specified position in the relation set.
  
      Params:
        i = a gint representing a position in the set, starting from 0.
      Returns: a #AtkRelation, which is the relation at
        position i in the set.
  */
  atk.relation.Relation getRelation(int i)
  {
    AtkRelation* _cretval;
    _cretval = atk_relation_set_get_relation(cast(AtkRelationSet*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.relation.Relation)(cast(AtkRelation*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds a relation that matches the specified type.
  
      Params:
        relationship = an #AtkRelationType
      Returns: an #AtkRelation, which is a relation matching the
        specified type.
  */
  atk.relation.Relation getRelationByType(atk.types.RelationType relationship)
  {
    AtkRelation* _cretval;
    _cretval = atk_relation_set_get_relation_by_type(cast(AtkRelationSet*)this._cPtr, relationship);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.relation.Relation)(cast(AtkRelation*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a relation from the relation set.
      This function unref's the #AtkRelation so it will be deleted unless there
      is another reference to it.
  
      Params:
        relation = an #AtkRelation
  */
  void remove(atk.relation.Relation relation)
  {
    atk_relation_set_remove(cast(AtkRelationSet*)this._cPtr, relation ? cast(AtkRelation*)relation._cPtr(No.Dup) : null);
  }
}
