/// Module for [Relation] class
module gid.atk1.relation;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value_array;

/**
    An object used to describe a relation between a
     object and one or more other objects.
    
    An AtkRelation describes a relation between an object and one or
    more other objects. The actual relations that an object has with
    other objects are defined as an AtkRelationSet, which is a set of
    AtkRelations.
*/
class Relation : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_relation_get_type != &gidSymbolNotFound ? atk_relation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkRelation";
  }

  /** Returns `this`, for use in `with` statements. */
  override Relation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.relation.Relation]
      Returns: New builder object
  */
  static RelationGidBuilder builder() nothrow
  {
    return new RelationGidBuilder;
  }

  /** */
  @property gid.atk1.types.RelationType relationType() nothrow
  {
    return getRelationType();
  }

  /** */
  @property void relationType(gid.atk1.types.RelationType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.atk1.types.RelationType)("relation-type", propval);
  }

  /** */
  @property gid.gobject2.value_array.ValueArray target() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.value_array.ValueArray)("target");
  }

  /** */
  @property void target(gid.gobject2.value_array.ValueArray propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gobject2.value_array.ValueArray)("target", propval);
  }

  /**
      Create a new relation for the specified key and the specified list
      of targets.  See also [gid.atk1.object.ObjectWrap.addRelationship].
  
      Params:
        targets = an array of pointers to
           #AtkObjects
        relationship = an #AtkRelationType with which to create the new
           #AtkRelation
      Returns: a pointer to a new #AtkRelation
  */
  this(gid.atk1.object.ObjectWrap[] targets, gid.atk1.types.RelationType relationship) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      AtkRelation* _cretval;
      int _nTargets;
      if (targets)
        _nTargets = cast(int)targets.length;

      auto _targets_arr = new AtkObject*[](targets.length);
      auto _targets = cast(AtkObject**)_targets_arr.ptr;
      foreach (i, obj; targets) _targets[i] = obj ? cast(AtkObject*)obj._cPtr(No.Dup) : null;
      _cretval = atk_relation_new(_targets, _nTargets, relationship);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds the specified AtkObject to the target for the relation, if it is
      not already present.  See also [gid.atk1.object.ObjectWrap.addRelationship].
  
      Params:
        target = an #AtkObject
  */
  void addTarget(gid.atk1.object.ObjectWrap target) nothrow
  {
    atk_relation_add_target(cast(AtkRelation*)this._cPtr, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
  }

  /**
      Gets the type of relation
      Returns: the type of relation
  */
  gid.atk1.types.RelationType getRelationType() nothrow
  {
    AtkRelationType _cretval;
    _cretval = atk_relation_get_relation_type(cast(AtkRelation*)this._cPtr);
    gid.atk1.types.RelationType _retval = cast(gid.atk1.types.RelationType)_cretval;
    return _retval;
  }

  /**
      Gets the target list of relation
      Returns: the target list of relation
  */
  gid.atk1.object.ObjectWrap[] getTarget() nothrow
  {
    GPtrArray* _cretval;
    _cretval = atk_relation_get_target(cast(AtkRelation*)this._cPtr);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.None)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Remove the specified AtkObject from the target for the relation.
  
      Params:
        target = an #AtkObject
      Returns: TRUE if the removal is successful.
  */
  bool removeTarget(gid.atk1.object.ObjectWrap target) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_relation_remove_target(cast(AtkRelation*)this._cPtr, target ? cast(AtkObject*)target._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.atk1.relation.Relation]
class RelationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T relationType(gid.atk1.types.RelationType propval) nothrow
  {
    return setProperty("relation-type", propval);
  }

  /** */
  T target(gid.gobject2.value_array.ValueArray propval) nothrow
  {
    return setProperty("target", propval);
  }
}

/// Fluent builder for [gid.atk1.relation.Relation]
final class RelationGidBuilder : RelationGidBuilderImpl!RelationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Relation build() nothrow
  {
    return new Relation(cast(void*)createGObject(Relation._getGType), Yes.Take);
  }
}
