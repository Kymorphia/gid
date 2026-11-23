/// Module for [PadController] class
module gid.gtk3.pad_controller;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.device;
import gid.gio2.action_group;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.event_controller;
import gid.gtk3.pad_action_entry;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    #GtkPadController is an event controller for the pads found in drawing
    tablets (The collection of buttons and tactile sensors often found around
    the stylus-sensitive area).
    
    These buttons and sensors have no implicit meaning, and by default they
    perform no action, this event controller is provided to map those to
    #GAction objects, thus letting the application give those a more semantic
    meaning.
    
    Buttons and sensors are not constrained to triggering a single action, some
    [gid.gdk4.types.InputSource.TabletPad] devices feature multiple "modes", all these input
    elements have one current mode, which may determine the final action
    being triggered. Pad devices often divide buttons and sensors into groups,
    all elements in a group share the same current mode, but different groups
    may have different modes. See [gid.gdk4.device_pad.DevicePad.getNGroups] and
    [gid.gdk4.device_pad.DevicePad.getGroupNModes].
    
    Each of the actions that a given button/strip/ring performs for a given
    mode is defined by #GtkPadActionEntry, it contains an action name that
    will be looked up in the given #GActionGroup and activated whenever the
    specified input element and mode are triggered.
    
    A simple example of #GtkPadController usage, assigning button 1 in all
    modes and pad devices to an "invert-selection" action:
    ```
      GtkPadActionEntry *pad_actions[] = {
        { GTK_PAD_ACTION_BUTTON, 1, -1, "Invert selection", "pad-actions.invert-selection" },
        …
      };
    
      …
      action_group = g_simple_action_group_new ();
      action = g_simple_action_new ("pad-actions.invert-selection", NULL);
      g_signal_connect (action, "activate", on_invert_selection_activated, NULL);
      g_action_map_add_action (G_ACTION_MAP (action_group), action);
      …
      pad_controller = gtk_pad_controller_new (window, action_group, NULL);
    ```
    
    The actions belonging to rings/strips will be activated with a parameter
    of type `G_VARIANT_TYPE_DOUBLE` bearing the value of the given axis, it
    is required that those are made stateful and accepting this #GVariantType.
*/
class PadController : gid.gtk3.event_controller.EventController
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_pad_controller_get_type != &gidSymbolNotFound ? gtk_pad_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPadController";
  }

  /** Returns `this`, for use in `with` statements. */
  override PadController self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.pad_controller.PadController]
      Returns: New builder object
  */
  static PadControllerGidBuilder builder() nothrow
  {
    return new PadControllerGidBuilder;
  }

  /** */
  @property gid.gio2.action_group.ActionGroup actionGroup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.action_group.ActionGroup)("action-group");
  }

  /** */
  @property gid.gdk3.device.Device pad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.device.Device)("pad");
  }

  /**
      Creates a new #GtkPadController that will associate events from pad to
      actions. A null pad may be provided so the controller manages all pad devices
      generically, it is discouraged to mix #GtkPadController objects with null
      and non-null pad argument on the same window, as execution order is not
      guaranteed.
      
      The #GtkPadController is created with no mapped actions. In order to map pad
      events to actions, use [gid.gtk4.pad_controller.PadController.setActionEntries] or
      [gid.gtk4.pad_controller.PadController.setAction].
  
      Params:
        window = a #GtkWindow
        group = #GActionGroup to trigger actions from
        pad = A [gid.gdk4.types.InputSource.TabletPad] device, or null to handle all pads
      Returns: A newly created #GtkPadController
  */
  this(gid.gtk3.window.Window window, gid.gio2.action_group.ActionGroup group, gid.gdk3.device.Device pad = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkPadController* _cretval;
      _cretval = gtk_pad_controller_new(window ? cast(GtkWindow*)window._cPtr(No.Dup) : null, group ? cast(GActionGroup*)(cast(gid.gobject2.object.ObjectWrap)group)._cPtr(No.Dup) : null, pad ? cast(GdkDevice*)pad._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds an individual action to controller. This action will only be activated
      if the given button/ring/strip number in index is interacted while
      the current mode is mode. -1 may be used for simple cases, so the action
      is triggered on all modes.
      
      The given label should be considered user-visible, so internationalization
      rules apply. Some windowing systems may be able to use those for user
      feedback.
  
      Params:
        type = the type of pad feature that will trigger this action
        index = the 0-indexed button/ring/strip number that will trigger this action
        mode = the mode that will trigger this action, or -1 for all modes.
        label = Human readable description of this action, this string should
            be deemed user-visible.
        actionName = action name that will be activated in the #GActionGroup
  */
  void setAction(gid.gtk3.types.PadActionType type, int index, int mode, string label, string actionName) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gtk_pad_controller_set_action(cast(GtkPadController*)this._cPtr, type, index, mode, _label, _actionName);
  }

  /**
      This is a convenience function to add a group of action entries on
      controller. See #GtkPadActionEntry and [gid.gtk4.pad_controller.PadController.setAction].
  
      Params:
        entries = the action entries to set on controller
  */
  void setActionEntries(gid.gtk3.pad_action_entry.PadActionEntry[] entries) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    auto _entries_arr = new GtkPadActionEntry[](entries.length);
    auto _entries = _entries_arr.ptr;
    foreach (i, obj; entries) _entries[i] = *cast(GtkPadActionEntry*)obj._cPtr;
    gtk_pad_controller_set_action_entries(cast(GtkPadController*)this._cPtr, _entries, _nEntries);
  }
}

/// Fluent builder implementation template for [gid.gtk3.pad_controller.PadController]
class PadControllerGidBuilderImpl(T) : gid.gtk3.event_controller.EventControllerGidBuilderImpl!T
{

  /** */
  T actionGroup(gid.gio2.action_group.ActionGroup propval) nothrow
  {
    return setProperty("action-group", propval);
  }

  /** */
  T pad(gid.gdk3.device.Device propval) nothrow
  {
    return setProperty("pad", propval);
  }
}

/// Fluent builder for [gid.gtk3.pad_controller.PadController]
final class PadControllerGidBuilder : PadControllerGidBuilderImpl!PadControllerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PadController build() nothrow
  {
    return new PadController(cast(void*)createGObject(PadController._getGType), Yes.Take);
  }
}
