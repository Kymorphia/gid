/// Module for [ActionEntry] class
module gio.action_entry;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    This struct defines a single action.  It is for use with
    [gio.action_map.ActionMap.addActionEntries].
    
    The order of the items in the structure are intended to reflect
    frequency of use.  It is permissible to use an incomplete initialiser
    in order to leave some of the later values as null.  All values
    after @name are optional.  Additional optional fields may be added in
    the future.
    
    See [gio.action_map.ActionMap.addActionEntries] for an example.
*/
class ActionEntry
{
  GActionEntry _cInstance;

  /**
      Create a `action_entry.ActionEntry` wrap type.
      Params:
        name = the name of the action
        parameterType = the type of the parameter that must be passed to the
                           activate function for this action, given as a single
                           GVariant type string (or null for no parameter)
        state = the initial state for this action, given in
                  [GVariant text format][gvariant-text].  The state is parsed
                  with no extra type information, so type tags must be added to
                  the string if they are necessary.  Stateless actions should
                  give null here.
  */
  this(string name = string.init, string parameterType = string.init, string state = string.init) nothrow
  {
    this.name = name;
    this.parameterType = parameterType;
    this.state = state;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `name` field.
      Returns: the name of the action
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the action
  */
  @property void name(string propval) nothrow
  {
    (cast(GActionEntry*)this._cPtr).name = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /** Function alias for field `activate` */
  alias ActivateFuncType = extern(C) void function(GSimpleAction* action, GVariant* parameter, void* userData);

  /**
      Get `activate` field.
      Returns: the callback to connect to the "activate" signal of the
                   action.  Since GLib 2.40, this can be null for stateful
                   actions, in which case the default handler is used.  For
                   boolean-stated actions with no parameter, this is a
                   toggle.  For other state types (and parameter type equal
                   to the state type) this will be a function that
                   just calls @change_state (which you should provide).
  */
  @property ActivateFuncType activate() nothrow
  {
    return (cast(GActionEntry*)this._cPtr).activate;
  }

  /**
      Get `parameterType` field.
      Returns: the type of the parameter that must be passed to the
                         activate function for this action, given as a single
                         GVariant type string (or null for no parameter)
  */
  @property string parameterType() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).parameterType);
  }

  /**
      Set `parameterType` field.
      Params:
        propval = the type of the parameter that must be passed to the
                           activate function for this action, given as a single
                           GVariant type string (or null for no parameter)
  */
  @property void parameterType(string propval) nothrow
  {
    (cast(GActionEntry*)this._cPtr).parameterType = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `state` field.
      Returns: the initial state for this action, given in
                [GVariant text format][gvariant-text].  The state is parsed
                with no extra type information, so type tags must be added to
                the string if they are necessary.  Stateless actions should
                give null here.
  */
  @property string state() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).state);
  }

  /**
      Set `state` field.
      Params:
        propval = the initial state for this action, given in
                  [GVariant text format][gvariant-text].  The state is parsed
                  with no extra type information, so type tags must be added to
                  the string if they are necessary.  Stateless actions should
                  give null here.
  */
  @property void state(string propval) nothrow
  {
    (cast(GActionEntry*)this._cPtr).state = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /** Function alias for field `changeState` */
  alias ChangeStateFuncType = extern(C) void function(GSimpleAction* action, GVariant* value, void* userData);

  /**
      Get `changeState` field.
      Returns: the callback to connect to the "change-state" signal
                       of the action.  All stateful actions should provide a
                       handler here; stateless actions should not.
  */
  @property ChangeStateFuncType changeState() nothrow
  {
    return (cast(GActionEntry*)this._cPtr).changeState;
  }
}
