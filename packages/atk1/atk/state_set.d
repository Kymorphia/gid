/// Module for [StateSet] class
module atk.state_set;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.object;

/**
    An AtkStateSet contains the states of an object.
    
    An AtkStateSet is a read-only representation of the full set of #AtkStates
    that apply to an object at a given time. This set is not meant to be
    modified, but rather created when #[atk.object.ObjectWrap.refStateSet] is called.
*/
class StateSet : gobject.object.ObjectWrap
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
    return cast(void function())atk_state_set_get_type != &gidSymbolNotFound ? atk_state_set_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StateSet self()
  {
    return this;
  }

  /**
      Creates a new empty state set.
      Returns: a new #AtkStateSet
  */
  this()
  {
    AtkStateSet* _cretval;
    _cretval = atk_state_set_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds the state of the specified type to the state set if it is not already
      present.
      
      Note that because an #AtkStateSet is a read-only object, this method should
      be used to add a state to a newly-created set which will then be returned by
      #atk_object_ref_state_set. It should not be used to modify the existing state
      of an object. See also #atk_object_notify_state_change.
  
      Params:
        type = an #AtkStateType
      Returns: true if  the state for type is not already in set.
  */
  bool addState(atk.types.StateType type)
  {
    bool _retval;
    _retval = cast(bool)atk_state_set_add_state(cast(AtkStateSet*)this._cPtr, type);
    return _retval;
  }

  /**
      Adds the states of the specified types to the state set.
      
      Note that because an #AtkStateSet is a read-only object, this method should
      be used to add states to a newly-created set which will then be returned by
      #atk_object_ref_state_set. It should not be used to modify the existing state
      of an object. See also #atk_object_notify_state_change.
  
      Params:
        types = an array of #AtkStateType
  */
  void addStates(atk.types.StateType[] types)
  {
    int _nTypes;
    if (types)
      _nTypes = cast(int)types.length;

    auto _types = cast(AtkStateType*)types.ptr;
    atk_state_set_add_states(cast(AtkStateSet*)this._cPtr, _types, _nTypes);
  }

  /**
      Constructs the intersection of the two sets, returning null if the
      intersection is empty.
  
      Params:
        compareSet = another #AtkStateSet
      Returns: a new #AtkStateSet which is the intersection of
        the two sets.
  */
  atk.state_set.StateSet andSets(atk.state_set.StateSet compareSet)
  {
    AtkStateSet* _cretval;
    _cretval = atk_state_set_and_sets(cast(AtkStateSet*)this._cPtr, compareSet ? cast(AtkStateSet*)compareSet._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.state_set.StateSet)(cast(AtkStateSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes all states from the state set.
  */
  void clearStates()
  {
    atk_state_set_clear_states(cast(AtkStateSet*)this._cPtr);
  }

  /**
      Checks whether the state for the specified type is in the specified set.
  
      Params:
        type = an #AtkStateType
      Returns: true if type is the state type is in set.
  */
  bool containsState(atk.types.StateType type)
  {
    bool _retval;
    _retval = cast(bool)atk_state_set_contains_state(cast(AtkStateSet*)this._cPtr, type);
    return _retval;
  }

  /**
      Checks whether the states for all the specified types are in the
      specified set.
  
      Params:
        types = an array of #AtkStateType
      Returns: true if all the states for type are in set.
  */
  bool containsStates(atk.types.StateType[] types)
  {
    bool _retval;
    int _nTypes;
    if (types)
      _nTypes = cast(int)types.length;

    auto _types = cast(AtkStateType*)types.ptr;
    _retval = cast(bool)atk_state_set_contains_states(cast(AtkStateSet*)this._cPtr, _types, _nTypes);
    return _retval;
  }

  /**
      Checks whether the state set is empty, i.e. has no states set.
      Returns: true if set has no states set, otherwise false
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)atk_state_set_is_empty(cast(AtkStateSet*)this._cPtr);
    return _retval;
  }

  /**
      Constructs the union of the two sets.
  
      Params:
        compareSet = another #AtkStateSet
      Returns: a new #AtkStateSet which is
        the union of the two sets, returning null is empty.
  */
  atk.state_set.StateSet orSets(atk.state_set.StateSet compareSet)
  {
    AtkStateSet* _cretval;
    _cretval = atk_state_set_or_sets(cast(AtkStateSet*)this._cPtr, compareSet ? cast(AtkStateSet*)compareSet._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.state_set.StateSet)(cast(AtkStateSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes the state for the specified type from the state set.
      
      Note that because an #AtkStateSet is a read-only object, this method should
      be used to remove a state to a newly-created set which will then be returned
      by #atk_object_ref_state_set. It should not be used to modify the existing
      state of an object. See also #atk_object_notify_state_change.
  
      Params:
        type = an #AtkType
      Returns: true if type was the state type is in set.
  */
  bool removeState(atk.types.StateType type)
  {
    bool _retval;
    _retval = cast(bool)atk_state_set_remove_state(cast(AtkStateSet*)this._cPtr, type);
    return _retval;
  }

  /**
      Constructs the exclusive-or of the two sets, returning null is empty.
      The set returned by this operation contains the states in exactly
      one of the two sets.
  
      Params:
        compareSet = another #AtkStateSet
      Returns: a new #AtkStateSet which contains the states
        which are in exactly one of the two sets.
  */
  atk.state_set.StateSet xorSets(atk.state_set.StateSet compareSet)
  {
    AtkStateSet* _cretval;
    _cretval = atk_state_set_xor_sets(cast(AtkStateSet*)this._cPtr, compareSet ? cast(AtkStateSet*)compareSet._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.state_set.StateSet)(cast(AtkStateSet*)_cretval, Yes.Take);
    return _retval;
  }
}
