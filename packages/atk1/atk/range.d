/// Module for [Range] class
module atk.range;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.boxed;

/**
    A given range or subrange, to be used with #AtkValue
    
    #AtkRange are used on #AtkValue, in order to represent the full
    range of a given component (for example an slider or a range
    control), or to define each individual subrange this full range is
    splitted if available. See #AtkValue documentation for further
    details.
*/
class Range : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_range_get_type != &gidSymbolNotFound ? atk_range_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Range self()
  {
    return this;
  }

  /**
      Creates a new #AtkRange.
  
      Params:
        lowerLimit = inferior limit for this range
        upperLimit = superior limit for this range
        description = human readable description of this range.
      Returns: a new #AtkRange
  */
  this(double lowerLimit, double upperLimit, string description)
  {
    AtkRange* _cretval;
    const(char)* _description = description.toCString(No.Alloc);
    _cretval = atk_range_new(lowerLimit, upperLimit, _description);
    this(_cretval, Yes.Take);
  }

  /**
      Returns a new #AtkRange that is a exact copy of src
      Returns: a new #AtkRange copy of src
  */
  atk.range.Range copy()
  {
    AtkRange* _cretval;
    _cretval = atk_range_copy(cast(AtkRange*)this._cPtr);
    auto _retval = _cretval ? new atk.range.Range(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the human readable description of range
      Returns: the human-readable description of range
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = atk_range_get_description(cast(AtkRange*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the lower limit of range
      Returns: the lower limit of range
  */
  double getLowerLimit()
  {
    double _retval;
    _retval = atk_range_get_lower_limit(cast(AtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Returns the upper limit of range
      Returns: the upper limit of range
  */
  double getUpperLimit()
  {
    double _retval;
    _retval = atk_range_get_upper_limit(cast(AtkRange*)this._cPtr);
    return _retval;
  }
}
