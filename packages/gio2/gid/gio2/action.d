/// Module for [Action] interface
module gid.gio2.action;

public import gid.core.basictypes;
public import gid.gio2.action_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.gid_builder;

/**
    [gid.gio2.action.Action] represents a single named action.
    
    The main interface to an action is that it can be activated with
    [gid.gio2.action.Action.activate]. This results in the 'activate' signal being
    emitted. An activation has a [gid.glib2.variant.Variant] parameter (which may be
    `NULL`). The correct type for the parameter is determined by a static
    parameter type (which is given at construction time).
    
    An action may optionally have a state, in which case the state may be
    set with [gid.gio2.action.Action.changeState]. This call takes a [gid.glib2.variant.Variant]. The
    correct type for the state is determined by a static state type
    (which is given at construction time).
    
    The state may have a hint associated with it, specifying its valid
    range.
    
    [gid.gio2.action.Action] is merely the interface to the concept of an action, as
    described above.  Various implementations of actions exist, including
    [gid.gio2.simple_action.SimpleAction].
    
    In all cases, the implementing class is responsible for storing the
    name of the action, the parameter type, the enabled state, the optional
    state type and the state and emitting the appropriate signals when these
    change. The implementor is responsible for filtering calls to
    [gid.gio2.action.Action.activate] and [gid.gio2.action.Action.changeState]
    for type safety and for the state being enabled.
    
    Probably the only useful thing to do with a [gid.gio2.action.Action] is to put it
    inside of a [gid.gio2.simple_action_group.SimpleActionGroup].
*/
interface Action : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_action_get_type != &gidSymbolNotFound ? g_action_get_type() : cast(GType)0;
  }

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
        
        If the action is disabled then calls to [gid.gio2.action.Action.activate] and
        [gid.gio2.action.Action.changeState] have no effect.
  */
  @property bool enabled() nothrow;

  /**
      Get `name` property.
      Returns: The name of the action.  This is mostly meaningful for identifying
        the action once it has been added to a [gid.gio2.action_group.ActionGroup]. It is immutable.
  */
  @property string name() nothrow;

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
        action. This is immutable, and may be `NULL` if no parameter is needed when
        activating the action.
  */
  @property gid.glib2.variant_type.VariantType parameterType() nothrow;

  /**
      Get `state` property.
      Returns: The state of the action, or `NULL` if the action is stateless.
  */
  @property gid.glib2.variant.Variant state() nothrow;

  /**
      Get `stateType` property.
      Returns: The [gid.glib2.variant_type.VariantType] of the state that the action has, or `NULL` if the
        action is stateless. This is immutable.
  */
  @property gid.glib2.variant_type.VariantType stateType() nothrow;

  /**
      Checks if action_name is valid.
      
      action_name is valid if it consists only of alphanumeric characters,
      plus `-` and `.`.  The empty string is not a valid action name.
      
      It is an error to call this function with a non-UTF-8 action_name.
      action_name must not be `NULL`.
  
      Params:
        actionName = a potential action name
      Returns: `TRUE` if action_name is valid
  */
  static bool nameIsValid(string actionName) nothrow
  {
    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
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
      target value is parsed using [gid.glib2.variant.Variant.parse].  If a tuple-typed
      value is desired, it must be specified in the same way, resulting in
      two sets of parens, for example: `app.action((1,2,3))`.  A string
      target can be specified this way as well: `app.action('target')`.
      For strings, this third format must be used if target value is
      empty or contains characters other than alphanumerics, `-` and `.`.
      
      If this function returns `TRUE`, a non-`NULL` value is guaranteed to be returned
      in action_name (if a pointer is passed in). A `NULL` value may still be
      returned in target_value, as the detailed_name may not contain a target.
      
      If returned, the [gid.glib2.variant.Variant] in target_value is guaranteed to not be floating.
  
      Params:
        detailedName = a detailed action name
        actionName = the action name
        targetValue = the target value,
            or `NULL` for no target
      Returns: `TRUE` if successful, else `FALSE` with error set
      Throws: [ErrorWrap]
  */
  static bool parseDetailedName(string detailedName, out string actionName, out gid.glib2.variant.Variant targetValue)
  {
    bool _retval;
    const(char)* _detailedName = detailedName.toCString!(No.Malloc, No.Nullable);
    char* _actionName;
    GVariant* _targetValue;
    GError *_err;
    _retval = cast(bool)g_action_parse_detailed_name(_detailedName, &_actionName, &_targetValue, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    actionName = _actionName.fromCString!(Yes.Free);
    if (_targetValue)
      targetValue = new gid.glib2.variant.Variant(cast(void*)_targetValue, Yes.Take);
    return _retval;
  }

  /**
      Formats a detailed action name from action_name and target_value.
      
      It is an error to call this function with an invalid action name.
      
      This function is the opposite of [gid.gio2.action.Action.parseDetailedName].
      It will produce a string that can be parsed back to the action_name
      and target_value by that function.
      
      See that function for the types of strings that will be printed by
      this function.
  
      Params:
        actionName = a valid action name
        targetValue = a [gid.glib2.variant.Variant] target value, or `NULL`
      Returns: a detailed format string
  */
  static string printDetailedName(string actionName, gid.glib2.variant.Variant targetValue = null) nothrow
  {
    char* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_print_detailed_name(_actionName, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }









  /**
      Activates the action.
      
      parameter must be the correct type of parameter for the action (ie:
      the parameter type given at construction time).  If the parameter
      type was `NULL` then parameter must also be `NULL`.
      
      If the parameter [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        parameter = the parameter to the activation
  */
  void activate(gid.glib2.variant.Variant parameter = null);

  /**
      Request for the state of action to be changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gid.gio2.action.Action.getStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gid.gio2.action.Action.getStateHint].
      
      If the value [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        value = the new state
  */
  void changeState(gid.glib2.variant.Variant value);

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
      
      When activating the action using [gid.gio2.action.Action.activate], the
      [gid.glib2.variant.Variant] given to that function must be of the type returned by
      this function.
      
      In the case that this function returns `NULL`, you must not give any
      [gid.glib2.variant.Variant], but `NULL` instead.
      Returns: the parameter type
  */
  gid.glib2.variant_type.VariantType getParameterType();

  /**
      Queries the current state of action.
      
      If the action is not stateful then `NULL` will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gid.gio2.action.Action.getStateType].
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the current state of the action
  */
  gid.glib2.variant.Variant getState();

  /**
      Requests a hint about the valid range of values for the state of
      action.
      
      If `NULL` is returned it either means that the action is not stateful
      or that there is no hint about the valid range of values for the
      state of the action.
      
      If a [gid.glib2.variant.Variant] array is returned then each item in the array is a
      possible value for the state.  If a [gid.glib2.variant.Variant] pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound
      of valid values for the state.
      
      In any case, the information is merely a hint.  It may be possible to
      have a state value outside of the hinted range and setting a value
      within the range may fail.
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the state range hint
  */
  gid.glib2.variant.Variant getStateHint();

  /**
      Queries the type of the state of action.
      
      If the action is stateful (e.g. created with
      [gid.gio2.simple_action.SimpleAction.newStateful]) then this function returns the
      [gid.glib2.variant_type.VariantType] of the state.  This is the type of the initial value
      given as the state. All calls to [gid.gio2.action.Action.changeState] must give a
      [gid.glib2.variant.Variant] of this type and [gid.gio2.action.Action.getState] will return a
      [gid.glib2.variant.Variant] of the same type.
      
      If the action is not stateful (e.g. created with [gid.gio2.simple_action.SimpleAction.new_])
      then this function will return `NULL`. In that case, [gid.gio2.action.Action.getState]
      will return `NULL` and you must not call [gid.gio2.action.Action.changeState].
      Returns: the state type, if the action is stateful
  */
  gid.glib2.variant_type.VariantType getStateType();
}

/// Fluent builder implementation template for [gid.gio2.action.Action]
interface ActionGidBuilderImpl(T)
{
}
