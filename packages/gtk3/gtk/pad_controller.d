/// Module for [PadController] class
module gtk.pad_controller;

import gdk.device;
import gid.gid;
import gio.action_group;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;
import gtk.window;

/**
    #GtkPadController is an event controller for the pads found in drawing
    tablets (The collection of buttons and tactile sensors often found around
    the stylus-sensitive area).
    
    These buttons and sensors have no implicit meaning, and by default they
    perform no action, this event controller is provided to map those to
    #GAction objects, thus letting the application give those a more semantic
    meaning.
    
    Buttons and sensors are not constrained to triggering a single action, some
    [gdk.types.InputSource.TabletPad] devices feature multiple "modes", all these input
    elements have one current mode, which may determine the final action
    being triggered. Pad devices often divide buttons and sensors into groups,
    all elements in a group share the same current mode, but different groups
    may have different modes. See [gdk.device_pad.DevicePad.getNGroups] and
    [gdk.device_pad.DevicePad.getGroupNModes].
    
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
class PadController : gtk.event_controller.EventController
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
    return cast(void function())gtk_pad_controller_get_type != &gidSymbolNotFound ? gtk_pad_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PadController self()
  {
    return this;
  }

  /**
      Get builder for [gtk.pad_controller.PadController]
      Returns: New builder object
  */
  static PadControllerGidBuilder builder()
  {
    return new PadControllerGidBuilder;
  }

  /** */
  @property gio.action_group.ActionGroup actionGroup()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.action_group.ActionGroup)("action-group");
  }

  /** */
  @property gdk.device.Device pad()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.device.Device)("pad");
  }

  /**
      Creates a new #GtkPadController that will associate events from pad to
      actions. A null pad may be provided so the controller manages all pad devices
      generically, it is discouraged to mix #GtkPadController objects with null
      and non-null pad argument on the same window, as execution order is not
      guaranteed.
      
      The #GtkPadController is created with no mapped actions. In order to map pad
      events to actions, use [gtk.pad_controller.PadController.setActionEntries] or
      [gtk.pad_controller.PadController.setAction].
  
      Params:
        window = a #GtkWindow
        group = #GActionGroup to trigger actions from
        pad = A [gdk.types.InputSource.TabletPad] device, or null to handle all pads
      Returns: A newly created #GtkPadController
  */
  this(gtk.window.Window window, gio.action_group.ActionGroup group, gdk.device.Device pad = null)
  {
    GtkPadController* _cretval;
    _cretval = gtk_pad_controller_new(window ? cast(GtkWindow*)window._cPtr(No.Dup) : null, group ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)group)._cPtr(No.Dup) : null, pad ? cast(GdkDevice*)pad._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
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
  void setAction(gtk.types.PadActionType type, int index, int mode, string label, string actionName)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _actionName = actionName.toCString(No.Alloc);
    gtk_pad_controller_set_action(cast(GtkPadController*)this._cPtr, type, index, mode, _label, _actionName);
  }
}

/// Fluent builder implementation template for [gtk.pad_controller.PadController]
class PadControllerGidBuilderImpl(T) : gtk.event_controller.EventControllerGidBuilderImpl!T
{

  /** */
  T actionGroup(gio.action_group.ActionGroup propval)
  {
    return setProperty("action-group", propval);
  }

  /** */
  T pad(gdk.device.Device propval)
  {
    return setProperty("pad", propval);
  }
}

/// Fluent builder for [gtk.pad_controller.PadController]
final class PadControllerGidBuilder : PadControllerGidBuilderImpl!PadControllerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PadController build()
  {
    return new PadController(cast(void*)createGObject(PadController._getGType), Yes.Take);
  }
}
