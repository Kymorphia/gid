/// Module for [Action] interface
module gio.action;

public import gio.action_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.variant;
import glib.variant_type;

/**
    [gio.action.Action] represents a single named action.
    
    The main interface to an action is that it can be activated with
    [gio.action.Action.activate]. This results in the 'activate' signal being
    emitted. An activation has a [glib.variant.Variant] parameter (which may be
    `NULL`). The correct type for the parameter is determined by a static
    parameter type (which is given at construction time).
    
    An action may optionally have a state, in which case the state may be
    set with [gio.action.Action.changeState]. This call takes a #GVariant. The
    correct type for the state is determined by a static state type
    (which is given at construction time).
    
    The state may have a hint associated with it, specifying its valid
    range.
    
    [gio.action.Action] is merely the interface to the concept of an action, as
    described above.  Various implementations of actions exist, including
    [gio.simple_action.SimpleAction].
    
    In all cases, the implementing class is responsible for storing the
    name of the action, the parameter type, the enabled state, the optional
    state type and the state and emitting the appropriate signals when these
    change. The implementor is responsible for filtering calls to
    [gio.action.Action.activate] and [gio.action.Action.changeState]
    for type safety and for the state being enabled.
    
    Probably the only useful thing to do with a [gio.action.Action] is to put it
    inside of a [gio.simple_action_group.SimpleActionGroup].
*/
interface Action
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_action_get_type != &gidSymbolNotFound ? g_action_get_type() : cast(GType)0;
  }

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
      
      If the action is disabled then calls to [gio.action.Action.activate] and
      [gio.action.Action.changeState] have no effect.
  */
  @property bool enabled();

  /**
      Get `name` property.
      Returns: The name of the action.  This is mostly meaningful for identifying
      the action once it has been added to a #GActionGroup. It is immutable.
  */
  @property string name();

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
      action. This is immutable, and may be null if no parameter is needed when
      activating the action.
  */
  @property glib.variant_type.VariantType parameterType();

  /**
      Get `state` property.
      Returns: The state of the action, or null if the action is stateless.
  */
  @property glib.variant.Variant state();

  /**
      Get `stateType` property.
      Returns: The #GVariantType of the state that the action has, or null if the
      action is stateless. This is immutable.
  */
  @property glib.variant_type.VariantType stateType();

  /**
      Checks if action_name is valid.
      
      action_name is valid if it consists only of alphanumeric characters,
      plus '-' and '.'.  The empty string is not a valid action name.
      
      It is an error to call this function with a non-utf8 action_name.
      action_name must not be null.
  
      Params:
        actionName = a potential action name
      Returns: true if action_name is valid
  */
  static bool nameIsValid(string actionName)
  {
    bool _retval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _retval = cast(bool)g_action_name_is_valid(_actionName);
    return _retval;
  }

  /**
      Parses a detailed action name into its separate name and target
      components.
      
      Detailed action names can have three formats.
      
      The first format is used to represent an action name with no target
      value and consists of just an action name containing no whitespace
      nor the characters `:`, `(` or `)`.  For example: `app.action`.
      
      The second format is used to represent an action with a target value
      that is a non-empty string consisting only of alphanumerics, plus `-`
      and `.`.  In that case, the action name and target value are
      separated by a double colon (`::`).  For example:
      `app.action::target`.
      
      The third format is used to represent an action with any type of
      target value, including strings.  The target value follows the action
      name, surrounded in parens.  For example: `app.action(42)`.  The
      target value is parsed using [glib.variant.Variant.parse].  If a tuple-typed
      value is desired, it must be specified in the same way, resulting in
      two sets of parens, for example: `app.action((1,2,3))`.  A string
      target can be specified this way as well: `app.action('target')`.
      For strings, this third format must be used if target value is
      empty or contains characters other than alphanumerics, `-` and `.`.
      
      If this function returns true, a non-null value is guaranteed to be returned
      in action_name (if a pointer is passed in). A null value may still be
      returned in target_value, as the detailed_name may not contain a target.
      
      If returned, the #GVariant in target_value is guaranteed to not be floating.
  
      Params:
        detailedName = a detailed action name
        actionName = the action name
        targetValue = the target value,
            or null for no target
      Returns: true if successful, else false with error set
      Throws: [ErrorWrap]
  */
  static bool parseDetailedName(string detailedName, out string actionName, out glib.variant.Variant targetValue)
  {
    bool _retval;
    const(char)* _detailedName = detailedName.toCString(No.Alloc);
    char* _actionName;
    GVariant* _targetValue;
    GError *_err;
    _retval = cast(bool)g_action_parse_detailed_name(_detailedName, &_actionName, &_targetValue, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    actionName = _actionName.fromCString(Yes.Free);
    targetValue = new glib.variant.Variant(cast(void*)_targetValue, Yes.Take);
    return _retval;
  }

  /**
      Formats a detailed action name from action_name and target_value.
      
      It is an error to call this function with an invalid action name.
      
      This function is the opposite of [gio.action.Action.parseDetailedName].
      It will produce a string that can be parsed back to the action_name
      and target_value by that function.
      
      See that function for the types of strings that will be printed by
      this function.
  
      Params:
        actionName = a valid action name
        targetValue = a #GVariant target value, or null
      Returns: a detailed format string
  */
  static string printDetailedName(string actionName, glib.variant.Variant targetValue = null)
  {
    char* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_action_print_detailed_name(_actionName, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Activates the action.
      
      parameter must be the correct type of parameter for the action (ie:
      the parameter type given at construction time).  If the parameter
      type was null then parameter must also be null.
      
      If the parameter GVariant is floating, it is consumed.
  
      Params:
        parameter = the parameter to the activation
  */
  void activate(glib.variant.Variant parameter = null);

  /**
      Request for the state of action to be changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gio.action.Action.getStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gio.action.Action.getStateHint].
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        value = the new state
  */
  void changeState(glib.variant.Variant value);

  /**
      Checks if action is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
      Returns: whether the action is enabled
  */
  bool getEnabled();

  /**
      Queries the name of action.
      Returns: the name of the action
  */
  string getName();

  /**
      Queries the type of the parameter that must be given when activating
      action.
      
      When activating the action using [gio.action.Action.activate], the #GVariant
      given to that function must be of the type returned by this function.
      
      In the case that this function returns null, you must not give any
      #GVariant, but null instead.
      Returns: the parameter type
  */
  glib.variant_type.VariantType getParameterType();

  /**
      Queries the current state of action.
      
      If the action is not stateful then null will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gio.action.Action.getStateType].
      
      The return value (if non-null) should be freed with
      [glib.variant.Variant.unref] when it is no longer required.
      Returns: the current state of the action
  */
  glib.variant.Variant getState();

  /**
      Requests a hint about the valid range of values for the state of
      action.
      
      If null is returned it either means that the action is not stateful
      or that there is no hint about the valid range of values for the
      state of the action.
      
      If a #GVariant array is returned then each item in the array is a
      possible value for the state.  If a #GVariant pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound
      of valid values for the state.
      
      In any case, the information is merely a hint.  It may be possible to
      have a state value outside of the hinted range and setting a value
      within the range may fail.
      
      The return value (if non-null) should be freed with
      [glib.variant.Variant.unref] when it is no longer required.
      Returns: the state range hint
  */
  glib.variant.Variant getStateHint();

  /**
      Queries the type of the state of action.
      
      If the action is stateful (e.g. created with
      [gio.simple_action.SimpleAction.newStateful]) then this function returns the
      #GVariantType of the state.  This is the type of the initial value
      given as the state. All calls to [gio.action.Action.changeState] must give a
      #GVariant of this type and [gio.action.Action.getState] will return a
      #GVariant of the same type.
      
      If the action is not stateful (e.g. created with [gio.simple_action.SimpleAction.new_])
      then this function will return null. In that case, [gio.action.Action.getState]
      will return null and you must not call [gio.action.Action.changeState].
      Returns: the state type, if the action is stateful
  */
  glib.variant_type.VariantType getStateType();
}
