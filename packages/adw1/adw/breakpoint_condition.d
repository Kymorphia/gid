/// Module for [BreakpointCondition] class
module adw.breakpoint_condition;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.boxed;

/**
    Describes condition for an `class@Breakpoint`.
*/
class BreakpointCondition : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_breakpoint_condition_get_type != &gidSymbolNotFound ? adw_breakpoint_condition_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BreakpointCondition self()
  {
    return this;
  }

  /**
      Creates a condition that triggers when condition_1 and condition_2 are both
      true.
  
      Params:
        condition1 = first condition
        condition2 = second condition
      Returns: the newly created condition
  */
  static adw.breakpoint_condition.BreakpointCondition newAnd(adw.breakpoint_condition.BreakpointCondition condition1, adw.breakpoint_condition.BreakpointCondition condition2)
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_condition_new_and(condition1 ? cast(AdwBreakpointCondition*)condition1._cPtr(Yes.Dup) : null, condition2 ? cast(AdwBreakpointCondition*)condition2._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a condition that triggers on length changes.
  
      Params:
        type = the length type
        value = the length value
        unit = the length unit
      Returns: the newly created condition
  */
  static adw.breakpoint_condition.BreakpointCondition newLength(adw.types.BreakpointConditionLengthType type, double value, adw.types.LengthUnit unit)
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_condition_new_length(type, value, unit);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a condition that triggers when either condition_1 or condition_2 is
      true.
  
      Params:
        condition1 = first condition
        condition2 = second condition
      Returns: the newly created condition
  */
  static adw.breakpoint_condition.BreakpointCondition newOr(adw.breakpoint_condition.BreakpointCondition condition1, adw.breakpoint_condition.BreakpointCondition condition2)
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_condition_new_or(condition1 ? cast(AdwBreakpointCondition*)condition1._cPtr(Yes.Dup) : null, condition2 ? cast(AdwBreakpointCondition*)condition2._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a condition that triggers on ratio changes.
      
      The ratio is represented as width divided by height.
  
      Params:
        type = the ratio type
        width = ratio width
        height = ratio height
      Returns: the newly created condition
  */
  static adw.breakpoint_condition.BreakpointCondition newRatio(adw.types.BreakpointConditionRatioType type, int width, int height)
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_condition_new_ratio(type, width, height);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies self.
      Returns: a copy of self
  */
  adw.breakpoint_condition.BreakpointCondition copy()
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_condition_copy(cast(AdwBreakpointCondition*)this._cPtr);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a textual representation of self.
      
      The returned string can be parsed by [adw.breakpoint_condition.BreakpointCondition.parse].
      Returns: A newly allocated text string
  */
  string toString_()
  {
    char* _cretval;
    _cretval = adw_breakpoint_condition_to_string(cast(AdwBreakpointCondition*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses a condition from a string.
      
      Length conditions are specified as `<type>: <value>[<unit>]`, where:
      
      $(LIST
        * `<type>` can be `min-width`, `max-width`, `min-height` or `max-height`
        * `<value>` is a fractional number
        * `<unit>` can be `px`, `pt` or `sp`
      )
        
      If the unit is omitted, `px` is assumed.
      
      See [adw.breakpoint_condition.BreakpointCondition.newLength].
      
      Examples:
      
      $(LIST
        * `min-width: 500px`
        * `min-height: 400pt`
        * `max-width: 100sp`
        * `max-height: 500`
      )
        
      Ratio conditions are specified as `<type>: <width>[/<height>]`, where:
      
      $(LIST
        * `<type>` can be `min-aspect-ratio` or `max-aspect-ratio`
        * `<width>` and `<height>` are integer numbers
      )
        
      See [adw.breakpoint_condition.BreakpointCondition.newRatio].
      
      The ratio is represented as `<width>` divided by `<height>`.
      
      If `<height>` is omitted, it's assumed to be 1.
      
      Examples:
      
      $(LIST
        * `min-aspect-ratio: 4/3`
        * `max-aspect-ratio: 1`
      )
        
      The logical operators `and`, `or` can be used to compose a complex condition
      as follows:
      
      $(LIST
        * `<condition> and <condition>`: the condition is true when both
          `<condition>`s are true, same as when using
          [adw.breakpoint_condition.BreakpointCondition.newAnd]
        * `<condition> or <condition>`: the condition is true when either of the
          `<condition>`s is true, same as when using
          [adw.breakpoint_condition.BreakpointCondition.newOr]
      )
        
      Examples:
      
      $(LIST
        * `min-width: 400px and max-aspect-ratio: 4/3`
        * `max-width: 360sp or max-width: 360px`
      )
        
      Conditions can be further nested using parentheses, for example:
      
      $(LIST
        * `min-width: 400px and (max-aspect-ratio: 4/3 or max-height: 400px)`
      )
        
      If parentheses are omitted, the first operator takes priority.
  
      Params:
        str = the string specifying the condition
      Returns: the parsed condition
  */
  static adw.breakpoint_condition.BreakpointCondition parse(string str)
  {
    AdwBreakpointCondition* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = adw_breakpoint_condition_parse(_str);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
