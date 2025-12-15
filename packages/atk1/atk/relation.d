/// Module for [Relation] class
module atk.relation;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;
import gobject.value_array;

/**
    An object used to describe a relation between a
     object and one or more other objects.
    
    An AtkRelation describes a relation between an object and one or
    more other objects. The actual relations that an object has with
    other objects are defined as an AtkRelationSet, which is a set of
    AtkRelations.
*/
class Relation : gobject.object.ObjectWrap
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
    return cast(void function())atk_relation_get_type != &gidSymbolNotFound ? atk_relation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Relation self()
  {
    return this;
  }

  /** */
  @property atk.types.RelationType relationType()
  {
    return getRelationType();
  }

  /** */
  @property void relationType(atk.types.RelationType propval)
  {
    gobject.object.ObjectWrap.setProperty!(atk.types.RelationType)("relation-type", propval);
  }

  /** */
  @property gobject.value_array.ValueArray target()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.value_array.ValueArray)("target");
  }

  /** */
  @property void target(gobject.value_array.ValueArray propval)
  {
    gobject.object.ObjectWrap.setProperty!(gobject.value_array.ValueArray)("target", propval);
  }

  /**
      Create a new relation for the specified key and the specified list
      of targets.  See also [atk.object.ObjectWrap.addRelationship].
  
      Params:
        targets = an array of pointers to
           #AtkObjects
        relationship = an #AtkRelationType with which to create the new
           #AtkRelation
      Returns: a pointer to a new #AtkRelation
  */
  this(atk.object.ObjectWrap[] targets, atk.types.RelationType relationship)
  {
    AtkRelation* _cretval;
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    AtkObject*[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= obj ? cast(AtkObject*)obj._cPtr : null;
    AtkObject** _targets = cast(AtkObject**)_tmptargets.ptr;
    _cretval = atk_relation_new(_targets, _nTargets, relationship);
    this(_cretval, Yes.Take);
  }

  /**
      Adds the specified AtkObject to the target for the relation, if it is
      not already present.  See also [atk.object.ObjectWrap.addRelationship].
  
      Params:
        target = an #AtkObject
  */
  void addTarget(atk.object.ObjectWrap target)
  {
    atk_relation_add_target(cast(AtkRelation*)this._cPtr, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
  }

  /**
      Gets the type of relation
      Returns: the type of relation
  */
  atk.types.RelationType getRelationType()
  {
    AtkRelationType _cretval;
    _cretval = atk_relation_get_relation_type(cast(AtkRelation*)this._cPtr);
    atk.types.RelationType _retval = cast(atk.types.RelationType)_cretval;
    return _retval;
  }

  /**
      Gets the target list of relation
      Returns: the target list of relation
  */
  atk.object.ObjectWrap[] getTarget()
  {
    GPtrArray* _cretval;
    _cretval = atk_relation_get_target(cast(AtkRelation*)this._cPtr);
    auto _retval = gPtrArrayToD!(atk.object.ObjectWrap, GidOwnership.None)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Remove the specified AtkObject from the target for the relation.
  
      Params:
        target = an #AtkObject
      Returns: TRUE if the removal is successful.
  */
  bool removeTarget(atk.object.ObjectWrap target)
  {
    bool _retval;
    _retval = cast(bool)atk_relation_remove_target(cast(AtkRelation*)this._cPtr, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
    return _retval;
  }
}
