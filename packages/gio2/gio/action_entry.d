/// Module for [ActionEntry] class
module gio.action_entry;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.action_entry.ActionEntry");

    _cInstance = *cast(GActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: the name of the action
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the action
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GActionEntry*)this._cPtr).name);
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
  @property ActivateFuncType activate()
  {
    return (cast(GActionEntry*)this._cPtr).activate;
  }

  /**
      Get `parameterType` field.
      Returns: the type of the parameter that must be passed to the
                         activate function for this action, given as a single
                         GVariant type string (or null for no parameter)
  */
  @property string parameterType()
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
  @property void parameterType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).parameterType);
    dToC(propval, cast(void*)&(cast(GActionEntry*)this._cPtr).parameterType);
  }

  /**
      Get `state` field.
      Returns: the initial state for this action, given in
                [GVariant text format][gvariant-text].  The state is parsed
                with no extra type information, so type tags must be added to
                the string if they are necessary.  Stateless actions should
                give null here.
  */
  @property string state()
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
  @property void state(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)this._cPtr).state);
    dToC(propval, cast(void*)&(cast(GActionEntry*)this._cPtr).state);
  }

  /** Function alias for field `changeState` */
  alias ChangeStateFuncType = extern(C) void function(GSimpleAction* action, GVariant* value, void* userData);

  /**
      Get `changeState` field.
      Returns: the callback to connect to the "change-state" signal
                       of the action.  All stateful actions should provide a
                       handler here; stateless actions should not.
  */
  @property ChangeStateFuncType changeState()
  {
    return (cast(GActionEntry*)this._cPtr).changeState;
  }
}
