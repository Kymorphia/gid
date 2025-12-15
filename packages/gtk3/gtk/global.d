/// Global functions for gtk3 library
module gtk.global;

import cairo.context;
import cairo.surface;
import gdk.atom;
import gdk.color;
import gdk.device;
import gdk.display;
import gdk.drag_context;
import gdk.event;
import gdk.event_key;
import gdk.rectangle;
import gdk.screen;
import gdk.types;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import glib.error;
import glib.option_group;
import glib.scanner;
import gobject.object;
import gobject.types;
import gtk.accel_group;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_source;
import gtk.page_setup;
import gtk.print_settings;
import gtk.rc_style;
import gtk.selection_data;
import gtk.settings;
import gtk.spin_button;
import gtk.stock_item;
import gtk.style;
import gtk.style_context;
import gtk.target_entry;
import gtk.target_list;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;
import gtk.widget;
import gtk.window;
import pango.language;
import pango.layout;
import pango.types;


/**
    Finds the first accelerator in any #GtkAccelGroup attached
    to object that matches accel_key and accel_mods, and
    activates that accelerator.

    Params:
      object = the #GObject, usually a #GtkWindow, on which
            to activate the accelerator
      accelKey = accelerator keyval from a key event
      accelMods = keyboard state mask from a key event
    Returns: true if an accelerator was activated and handled
          this keypress
*/
bool accelGroupsActivate(gobject.object.ObjectWrap object, uint accelKey, gdk.types.ModifierType accelMods)
{
  bool _retval;
  _retval = cast(bool)gtk_accel_groups_activate(object ? cast(GObject*)object._cPtr(No.Dup) : null, accelKey, accelMods);
  return _retval;
}

/**
    Gets a list of all accel groups which are attached to object.

    Params:
      object = a #GObject, usually a #GtkWindow
    Returns: a list of
          all accel groups which are attached to object
*/
gtk.accel_group.AccelGroup[] accelGroupsFromObject(gobject.object.ObjectWrap object)
{
  GSList* _cretval;
  _cretval = gtk_accel_groups_from_object(object ? cast(GObject*)object._cPtr(No.Dup) : null);
  auto _retval = gSListToD!(gtk.accel_group.AccelGroup, GidOwnership.None)(cast(GSList*)_cretval);
  return _retval;
}

/**
    Gets the modifier mask.
    
    The modifier mask determines which modifiers are considered significant
    for keyboard accelerators. See [gtk.global.acceleratorSetDefaultModMask].
    Returns: the default accelerator modifier mask
*/
gdk.types.ModifierType acceleratorGetDefaultModMask()
{
  GdkModifierType _cretval;
  _cretval = gtk_accelerator_get_default_mod_mask();
  gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask into a string
    which can be used to represent the accelerator to the user.

    Params:
      acceleratorKey = accelerator keyval
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated string representing the accelerator.
*/
string acceleratorGetLabel(uint acceleratorKey, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_get_label(acceleratorKey, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask
    into a (possibly translated) string that can be displayed to
    a user, similarly to [gtk.global.acceleratorGetLabel], but handling
    keycodes.
    
    This is only useful for system-level components, applications
    should use [gtk.global.acceleratorParse] instead.

    Params:
      display = a #GdkDisplay or null to use the default display
      acceleratorKey = accelerator keyval
      keycode = accelerator keycode
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated string representing the accelerator.
*/
string acceleratorGetLabelWithKeycode(gdk.display.Display display, uint acceleratorKey, uint keycode, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_get_label_with_keycode(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, acceleratorKey, keycode, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask into a string
    parseable by [gtk.global.acceleratorParse]. For example, if you pass in
    #GDK_KEY_q and #GDK_CONTROL_MASK, this function returns “<Control>q”.
    
    If you need to display accelerators in the user interface,
    see [gtk.global.acceleratorGetLabel].

    Params:
      acceleratorKey = accelerator keyval
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated accelerator name
*/
string acceleratorName(uint acceleratorKey, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_name(acceleratorKey, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask
    into a string parseable by [gtk.global.acceleratorParseWithKeycode],
    similarly to [gtk.global.acceleratorName] but handling keycodes.
    This is only useful for system-level components, applications
    should use [gtk.global.acceleratorParse] instead.

    Params:
      display = a #GdkDisplay or null to use the default display
      acceleratorKey = accelerator keyval
      keycode = accelerator keycode
      acceleratorMods = accelerator modifier mask
    Returns: a newly allocated accelerator name.
*/
string acceleratorNameWithKeycode(gdk.display.Display display, uint acceleratorKey, uint keycode, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_name_with_keycode(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, acceleratorKey, keycode, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Parses a string representing an accelerator. The format looks like
    “<Control>a” or “<Shift><Alt>F1” or “<Release>z” (the last one is
    for key release).
    
    The parser is fairly liberal and allows lower or upper case, and also
    abbreviations such as “<Ctl>” and “<Ctrl>”. Key names are parsed using
    [gdk.global.keyvalFromName]. For character keys the name is not the symbol,
    but the lowercase name, e.g. one would use “<Ctrl>minus” instead of
    “<Ctrl>-”.
    
    If the parse fails, accelerator_key and accelerator_mods will
    be set to 0 (zero).

    Params:
      accelerator = string representing an accelerator
      acceleratorKey = return location for accelerator
            keyval, or null
      acceleratorMods = return location for accelerator
            modifier mask, null
*/
void acceleratorParse(string accelerator, out uint acceleratorKey, out gdk.types.ModifierType acceleratorMods)
{
  const(char)* _accelerator = accelerator.toCString(No.Alloc);
  gtk_accelerator_parse(_accelerator, cast(uint*)&acceleratorKey, &acceleratorMods);
}

/**
    Parses a string representing an accelerator, similarly to
    [gtk.global.acceleratorParse] but handles keycodes as well. This is only
    useful for system-level components, applications should use
    [gtk.global.acceleratorParse] instead.
    
    If accelerator_codes is given and the result stored in it is non-null,
    the result must be freed with [glib.global.gfree].
    
    If a keycode is present in the accelerator and no accelerator_codes
    is given, the parse will fail.
    
    If the parse fails, accelerator_key, accelerator_mods and
    accelerator_codes will be set to 0 (zero).

    Params:
      accelerator = string representing an accelerator
      acceleratorKey = return location for accelerator
            keyval, or null
      acceleratorCodes = return location for accelerator keycodes, or null
      acceleratorMods = return location for accelerator
            modifier mask, null
*/
void acceleratorParseWithKeycode(string accelerator, out uint acceleratorKey, out uint[] acceleratorCodes, out gdk.types.ModifierType acceleratorMods)
{
  const(char)* _accelerator = accelerator.toCString(No.Alloc);
  uint* _acceleratorCodes;
  gtk_accelerator_parse_with_keycode(_accelerator, cast(uint*)&acceleratorKey, &_acceleratorCodes, &acceleratorMods);
  uint _lenacceleratorCodes;
  if (_acceleratorCodes)
  {
    for (; _acceleratorCodes[_lenacceleratorCodes] != 0; _lenacceleratorCodes++)
    {
    }
  }
  acceleratorCodes.length = _lenacceleratorCodes;
  acceleratorCodes[0 .. $] = (cast(uint*)_acceleratorCodes)[0 .. _lenacceleratorCodes];
  gFree(cast(void*)_acceleratorCodes);
}

/**
    Sets the modifiers that will be considered significant for keyboard
    accelerators. The default mod mask depends on the GDK backend in use,
    but will typically include #GDK_CONTROL_MASK | #GDK_SHIFT_MASK |
    #GDK_MOD1_MASK | #GDK_SUPER_MASK | #GDK_HYPER_MASK | #GDK_META_MASK.
    In other words, Control, Shift, Alt, Super, Hyper and Meta. Other
    modifiers will by default be ignored by #GtkAccelGroup.
    
    You must include at least the three modifiers Control, Shift
    and Alt in any value you pass to this function.
    
    The default mod mask should be changed on application startup,
    before using any accelerator groups.

    Params:
      defaultModMask = accelerator modifier mask
*/
void acceleratorSetDefaultModMask(gdk.types.ModifierType defaultModMask)
{
  gtk_accelerator_set_default_mod_mask(defaultModMask);
}

/**
    Determines whether a given keyval and modifier mask constitute
    a valid keyboard accelerator. For example, the #GDK_KEY_a keyval
    plus #GDK_CONTROL_MASK is valid - this is a “Ctrl+a” accelerator.
    But, you can't, for instance, use the #GDK_KEY_Control_L keyval
    as an accelerator.

    Params:
      keyval = a GDK keyval
      modifiers = modifier mask
    Returns: true if the accelerator is valid
*/
bool acceleratorValid(uint keyval, gdk.types.ModifierType modifiers)
{
  bool _retval;
  _retval = cast(bool)gtk_accelerator_valid(keyval, modifiers);
  return _retval;
}

/**
    Returns true if dialogs are expected to use an alternative
    button order on the screen screen. See
    [gtk.dialog.Dialog.setAlternativeButtonOrder] for more details
    about alternative button order.
    
    If you need to use this function, you should probably connect
    to the ::notify:gtk-alternative-button-order signal on the
    #GtkSettings object associated to screen, in order to be
    notified if the button order setting changes.

    Params:
      screen = a #GdkScreen, or null to use the default screen
    Returns: Whether the alternative button order should be used

    Deprecated: Deprecated
*/
bool alternativeDialogButtonOrder(gdk.screen.Screen screen = null)
{
  bool _retval;
  _retval = cast(bool)gtk_alternative_dialog_button_order(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Find a key binding matching keyval and modifiers and activate the
    binding on object.

    Params:
      object = object to activate when binding found
      keyval = key value of the binding
      modifiers = key modifier of the binding
    Returns: true if a binding was found and activated
*/
bool bindingsActivate(gobject.object.ObjectWrap object, uint keyval, gdk.types.ModifierType modifiers)
{
  bool _retval;
  _retval = cast(bool)gtk_bindings_activate(object ? cast(GObject*)object._cPtr(No.Dup) : null, keyval, modifiers);
  return _retval;
}

/**
    Looks up key bindings for object to find one matching
    event, and if one was found, activate it.

    Params:
      object = a #GObject (generally must be a widget)
      event = a #GdkEventKey
    Returns: true if a matching key binding was found
*/
bool bindingsActivateEvent(gobject.object.ObjectWrap object, gdk.event_key.EventKey event)
{
  bool _retval;
  _retval = cast(bool)gtk_bindings_activate_event(object ? cast(GObject*)object._cPtr(No.Dup) : null, event ? cast(GdkEventKey*)event._cPtr : null);
  return _retval;
}

/**
    This function is supposed to be called in #GtkWidget::draw
    implementations for widgets that support multiple windows.
    cr must be untransformed from invoking of the draw function.
    This function will return true if the contents of the given
    window are supposed to be drawn and false otherwise. Note
    that when the drawing was not initiated by the windowing
    system this function will return true for all windows, so
    you need to draw the bottommost window first. Also, do not
    use “else if” statements to check which window should be drawn.

    Params:
      cr = a cairo context
      window = the window to check. window may not be an input-only
                 window.
    Returns: true if window should be drawn
*/
bool cairoShouldDrawWindow(cairo.context.Context cr, gdk.window.Window window)
{
  bool _retval;
  _retval = cast(bool)gtk_cairo_should_draw_window(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Transforms the given cairo context cr that from widget-relative
    coordinates to window-relative coordinates.
    If the widget’s window is not an ancestor of window, no
    modification will be applied.
    
    This is the inverse to the transformation GTK applies when
    preparing an expose event to be emitted with the #GtkWidget::draw
    signal. It is intended to help porting multiwindow widgets from
    GTK+ 2 to the rendering architecture of GTK+ 3.

    Params:
      cr = the cairo context to transform
      widget = the widget the context is currently centered for
      window = the window to transform the context to
*/
void cairoTransformToWindow(cairo.context.Context cr, gtk.widget.Widget widget, gdk.window.Window window)
{
  gtk_cairo_transform_to_window(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
}

/**
    Checks that the GTK+ library in use is compatible with the
    given version. Generally you would pass in the constants
    #GTK_MAJOR_VERSION, #GTK_MINOR_VERSION, #GTK_MICRO_VERSION
    as the three arguments to this function; that produces
    a check that the library in use is compatible with
    the version of GTK+ the application or module was compiled
    against.
    
    Compatibility is defined by two things: first the version
    of the running library is newer than the version
    required_major.required_minor.required_micro. Second
    the running library must be binary compatible with the
    version required_major.required_minor.required_micro
    (same major version.)
    
    This function is primarily for GTK+ modules; the module
    can call this function to check that it wasn’t loaded
    into an incompatible version of GTK+. However, such a
    check isn’t completely reliable, since the module may be
    linked against an old version of GTK+ and calling the
    old version of [gtk.global.checkVersion], but still get loaded
    into an application using a newer version of GTK+.

    Params:
      requiredMajor = the required major version
      requiredMinor = the required minor version
      requiredMicro = the required micro version
    Returns: null if the GTK+ library is compatible with the
        given version, or a string describing the version mismatch.
        The returned string is owned by GTK+ and should not be modified
        or freed.
*/
string checkVersion(uint requiredMajor, uint requiredMinor, uint requiredMicro)
{
  const(char)* _cretval;
  _cretval = gtk_check_version(requiredMajor, requiredMinor, requiredMicro);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Adds a GTK+ grab on device, so all the events on device and its
    associated pointer or keyboard (if any) are delivered to widget.
    If the block_others parameter is true, any other devices will be
    unable to interact with widget during the grab.

    Params:
      widget = a #GtkWidget
      device = a #GdkDevice to grab on.
      blockOthers = true to prevent other devices to interact with widget.
*/
void deviceGrabAdd(gtk.widget.Widget widget, gdk.device.Device device, bool blockOthers)
{
  gtk_device_grab_add(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, blockOthers);
}

/**
    Removes a device grab from the given widget.
    
    You have to pair calls to [gtk.global.deviceGrabAdd] and
    [gtk.global.deviceGrabRemove].

    Params:
      widget = a #GtkWidget
      device = a #GdkDevice
*/
void deviceGrabRemove(gtk.widget.Widget widget, gdk.device.Device device)
{
  gtk_device_grab_remove(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
}

/**
    Prevents [gtk.global.init_], [gtk.global.initCheck], [gtk.global.initWithArgs] and
    [gtk.global.parseArgs] from automatically
    calling `setlocale (LC_ALL, "")`. You would
    want to use this function if you wanted to set the locale for
    your program to something other than the user’s locale, or if
    you wanted to set different values for different locale categories.
    
    Most programs should not need to call this function.
*/
void disableSetlocale()
{
  gtk_disable_setlocale();
}

/**
    Distributes extra_space to child sizes by bringing smaller
    children up to natural size first.
    
    The remaining space will be added to the minimum_size member of the
    GtkRequestedSize struct. If all sizes reach their natural size then
    the remaining space is returned.

    Params:
      extraSpace = Extra space to redistribute among children after subtracting
                      minimum sizes and any child padding from the overall allocation
      nRequestedSizes = Number of requests to fit into the allocation
      sizes = An array of structs with a client pointer and a minimum/natural size
                in the orientation of the allocation.
    Returns: The remainder of extra_space after redistributing space
      to sizes.
*/
int distributeNaturalAllocation(int extraSpace, uint nRequestedSizes, gtk.types.RequestedSize sizes)
{
  int _retval;
  _retval = gtk_distribute_natural_allocation(extraSpace, nRequestedSizes, &sizes);
  return _retval;
}

/**
    Cancels an ongoing drag operation on the source side.
    
    If you want to be able to cancel a drag operation in this way,
    you need to keep a pointer to the drag context, either from an
    explicit call to [gtk.widget.Widget.dragBeginWithCoordinates], or by
    connecting to #GtkWidget::drag-begin.
    
    If context does not refer to an ongoing drag operation, this
    function does nothing.
    
    If a drag is cancelled in this way, the result argument of
    #GtkWidget::drag-failed is set to GTK_DRAG_RESULT_ERROR.

    Params:
      context = a #GdkDragContext, as e.g. returned by [gtk.widget.Widget.dragBeginWithCoordinates]
*/
void dragCancel(gdk.drag_context.DragContext context)
{
  gtk_drag_cancel(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
}

/**
    Informs the drag source that the drop is finished, and
    that the data of the drag will no longer be required.

    Params:
      context = the drag context
      success = a flag indicating whether the drop was successful
      del = a flag indicating whether the source should delete the
          original data. (This should be true for a move)
      time = the timestamp from the #GtkWidget::drag-drop signal
*/
void dragFinish(gdk.drag_context.DragContext context, bool success, bool del, uint time)
{
  gtk_drag_finish(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, success, del, time);
}

/**
    Determines the source widget for a drag.

    Params:
      context = a (destination side) drag context
    Returns: if the drag is occurring
          within a single application, a pointer to the source widget.
          Otherwise, null.
*/
gtk.widget.Widget dragGetSourceWidget(gdk.drag_context.DragContext context)
{
  GtkWidget* _cretval;
  _cretval = gtk_drag_get_source_widget(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    Sets the icon for a particular drag to the default
    icon.

    Params:
      context = the context for a drag (This must be called
            with a  context for the source side of a drag)
*/
void dragSetIconDefault(gdk.drag_context.DragContext context)
{
  gtk_drag_set_icon_default(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
}

/**
    Sets the icon for a given drag from the given icon.
    See the documentation for [gtk.global.dragSetIconName]
    for more details about using icons in drag and drop.

    Params:
      context = the context for a drag (This must be called
            with a context for the source side of a drag)
      icon = a #GIcon
      hotX = the X offset of the hotspot within the icon
      hotY = the Y offset of the hotspot within the icon
*/
void dragSetIconGicon(gdk.drag_context.DragContext context, gio.icon.Icon icon, int hotX, int hotY)
{
  gtk_drag_set_icon_gicon(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, hotX, hotY);
}

/**
    Sets the icon for a given drag from a named themed icon. See
    the docs for #GtkIconTheme for more details. Note that the
    size of the icon depends on the icon theme (the icon is
    loaded at the symbolic size #GTK_ICON_SIZE_DND), thus
    hot_x and hot_y have to be used with care.

    Params:
      context = the context for a drag (This must be called
            with a context for the source side of a drag)
      iconName = name of icon to use
      hotX = the X offset of the hotspot within the icon
      hotY = the Y offset of the hotspot within the icon
*/
void dragSetIconName(gdk.drag_context.DragContext context, string iconName, int hotX, int hotY)
{
  const(char)* _iconName = iconName.toCString(No.Alloc);
  gtk_drag_set_icon_name(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, _iconName, hotX, hotY);
}

/**
    Sets pixbuf as the icon for a given drag.

    Params:
      context = the context for a drag (This must be called
                   with a  context for the source side of a drag)
      pixbuf = the #GdkPixbuf to use as the drag icon
      hotX = the X offset within widget of the hotspot
      hotY = the Y offset within widget of the hotspot
*/
void dragSetIconPixbuf(gdk.drag_context.DragContext context, gdkpixbuf.pixbuf.Pixbuf pixbuf, int hotX, int hotY)
{
  gtk_drag_set_icon_pixbuf(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null, hotX, hotY);
}

/**
    Sets the icon for a given drag from a stock ID.

    Params:
      context = the context for a drag (This must be called
                   with a  context for the source side of a drag)
      stockId = the ID of the stock icon to use for the drag
      hotX = the X offset within the icon of the hotspot
      hotY = the Y offset within the icon of the hotspot

    Deprecated: Use [gtk.global.dragSetIconName] instead.
*/
void dragSetIconStock(gdk.drag_context.DragContext context, string stockId, int hotX, int hotY)
{
  const(char)* _stockId = stockId.toCString(No.Alloc);
  gtk_drag_set_icon_stock(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, _stockId, hotX, hotY);
}

/**
    Sets surface as the icon for a given drag. GTK+ retains
    references for the arguments, and will release them when
    they are no longer needed.
    
    To position the surface relative to the mouse, use
    [cairo.surface.Surface.setDeviceOffset] on surface. The mouse
    cursor will be positioned at the (0,0) coordinate of the
    surface.

    Params:
      context = the context for a drag (This must be called
            with a context for the source side of a drag)
      surface = the surface to use as icon
*/
void dragSetIconSurface(gdk.drag_context.DragContext context, cairo.surface.Surface surface)
{
  gtk_drag_set_icon_surface(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
}

/**
    Changes the icon for drag operation to a given widget.
    GTK+ will not destroy the widget, so if you don’t want
    it to persist, you should connect to the “drag-end”
    signal and destroy it yourself.

    Params:
      context = the context for a drag. (This must be called
                  with a context for the source side of a drag)
      widget = a widget to use as an icon
      hotX = the X offset within widget of the hotspot
      hotY = the Y offset within widget of the hotspot
*/
void dragSetIconWidget(gdk.drag_context.DragContext context, gtk.widget.Widget widget, int hotX, int hotY)
{
  gtk_drag_set_icon_widget(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, hotX, hotY);
}

/**
    Draws a text caret on cr at location. This is not a style function
    but merely a convenience function for drawing the standard cursor shape.

    Params:
      widget = a #GtkWidget
      cr = cairo context to draw to
      location = location where to draw the cursor (location->width is ignored)
      isPrimary = if the cursor should be the primary cursor color.
      direction = whether the cursor is left-to-right or
                    right-to-left. Should never be #GTK_TEXT_DIR_NONE
      drawArrow = true to draw a directional arrow on the
               cursor. Should be false unless the cursor is split.

    Deprecated: Use [gtk.global.renderInsertionCursor] instead.
*/
void drawInsertionCursor(gtk.widget.Widget widget, cairo.context.Context cr, gdk.rectangle.Rectangle location, bool isPrimary, gtk.types.TextDirection direction, bool drawArrow)
{
  gtk_draw_insertion_cursor(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, location ? cast(const(GdkRectangle)*)location._cPtr(No.Dup) : null, isPrimary, direction, drawArrow);
}

/**
    Checks if any events are pending.
    
    This can be used to update the UI and invoke timeouts etc.
    while doing some time intensive computation.
    
    ## Updating the UI during a long computation
    
    ```c
     // computation going on...
    
     while (gtk_events_pending ())
       gtk_main_iteration ();
    
     // ...computation continued
    ```
    Returns: true if any events are pending, false otherwise
*/
bool eventsPending()
{
  bool _retval;
  _retval = cast(bool)gtk_events_pending();
  return _retval;
}

/**
    Analogical to [gtk.global.true_], this function does nothing
    but always returns false.
    Returns: false
*/
bool false_()
{
  bool _retval;
  _retval = cast(bool)gtk_false();
  return _retval;
}

/**
    Returns the binary age as passed to `libtool`
    when building the GTK+ library the process is running against.
    If `libtool` means nothing to you, don't
    worry about it.
    Returns: the binary age of the GTK+ library
*/
uint getBinaryAge()
{
  uint _retval;
  _retval = gtk_get_binary_age();
  return _retval;
}

/**
    Obtains a copy of the event currently being processed by GTK+.
    
    For example, if you are handling a #GtkButton::clicked signal,
    the current event will be the #GdkEventButton that triggered
    the ::clicked signal.
    Returns: a copy of the current event, or
          null if there is no current event. The returned event must be
          freed with [gdk.event.Event.free].
*/
gdk.event.Event getCurrentEvent()
{
  GdkEvent* _cretval;
  _cretval = gtk_get_current_event();
  auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    If there is a current event and it has a device, return that
    device, otherwise return null.
    Returns: a #GdkDevice, or null
*/
gdk.device.Device getCurrentEventDevice()
{
  GdkDevice* _cretval;
  _cretval = gtk_get_current_event_device();
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
  return _retval;
}

/**
    If there is a current event and it has a state field, place
    that state field in state and return true, otherwise return
    false.

    Params:
      state = a location to store the state of the current event
    Returns: true if there was a current event and it
          had a state field
*/
bool getCurrentEventState(out gdk.types.ModifierType state)
{
  bool _retval;
  _retval = cast(bool)gtk_get_current_event_state(&state);
  return _retval;
}

/**
    If there is a current event and it has a timestamp,
    return that timestamp, otherwise return `GDK_CURRENT_TIME`.
    Returns: the timestamp from the current event,
          or `GDK_CURRENT_TIME`.
*/
uint getCurrentEventTime()
{
  uint _retval;
  _retval = gtk_get_current_event_time();
  return _retval;
}

/**
    Returns the GTK+ debug flags.
    
    This function is intended for GTK+ modules that want
    to adjust their debug output based on GTK+ debug flags.
    Returns: the GTK+ debug flags.
*/
uint getDebugFlags()
{
  uint _retval;
  _retval = gtk_get_debug_flags();
  return _retval;
}

/**
    Returns the #PangoLanguage for the default language currently in
    effect. (Note that this can change over the life of an
    application.) The default language is derived from the current
    locale. It determines, for example, whether GTK+ uses the
    right-to-left or left-to-right text direction.
    
    This function is equivalent to [pango.language.Language.getDefault].
    See that function for details.
    Returns: the default language as a #PangoLanguage,
          must not be freed
*/
pango.language.Language getDefaultLanguage()
{
  PangoLanguage* _cretval;
  _cretval = gtk_get_default_language();
  auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    If event is null or the event was not associated with any widget,
    returns null, otherwise returns the widget that received the event
    originally.

    Params:
      event = a #GdkEvent
    Returns: the widget that originally
          received event, or null
*/
gtk.widget.Widget getEventWidget(gdk.event.Event event)
{
  GtkWidget* _cretval;
  _cretval = gtk_get_event_widget(event ? cast(GdkEvent*)event._cPtr : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    Returns the interface age as passed to `libtool`
    when building the GTK+ library the process is running against.
    If `libtool` means nothing to you, don't
    worry about it.
    Returns: the interface age of the GTK+ library
*/
uint getInterfaceAge()
{
  uint _retval;
  _retval = gtk_get_interface_age();
  return _retval;
}

/**
    Get the direction of the current locale. This is the expected
    reading direction for text and UI.
    
    This function depends on the current locale being set with
    setlocale() and will default to setting the [gtk.types.TextDirection.Ltr]
    direction otherwise. [gtk.types.TextDirection.None] will never be returned.
    
    GTK+ sets the default text direction according to the locale
    during [gtk.global.init_], and you should normally use
    [gtk.widget.Widget.getDirection] or [gtk.widget.Widget.getDefaultDirection]
    to obtain the current direcion.
    
    This function is only needed rare cases when the locale is
    changed after GTK+ has already been initialized. In this case,
    you can use it to update the default text direction as follows:
    
    ```c
    setlocale (LC_ALL, new_locale);
    direction = gtk_get_locale_direction ();
    gtk_widget_set_default_direction (direction);
    ```
    Returns: the #GtkTextDirection of the current locale
*/
gtk.types.TextDirection getLocaleDirection()
{
  GtkTextDirection _cretval;
  _cretval = gtk_get_locale_direction();
  gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
  return _retval;
}

/**
    Returns the major version number of the GTK+ library.
    (e.g. in GTK+ version 3.1.5 this is 3.)
    
    This function is in the library, so it represents the GTK+ library
    your code is running against. Contrast with the #GTK_MAJOR_VERSION
    macro, which represents the major version of the GTK+ headers you
    have included when compiling your code.
    Returns: the major version number of the GTK+ library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = gtk_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the GTK+ library.
    (e.g. in GTK+ version 3.1.5 this is 5.)
    
    This function is in the library, so it represents the GTK+ library
    your code is are running against. Contrast with the
    #GTK_MICRO_VERSION macro, which represents the micro version of the
    GTK+ headers you have included when compiling your code.
    Returns: the micro version number of the GTK+ library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = gtk_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the GTK+ library.
    (e.g. in GTK+ version 3.1.5 this is 1.)
    
    This function is in the library, so it represents the GTK+ library
    your code is are running against. Contrast with the
    #GTK_MINOR_VERSION macro, which represents the minor version of the
    GTK+ headers you have included when compiling your code.
    Returns: the minor version number of the GTK+ library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = gtk_get_minor_version();
  return _retval;
}

/**
    Returns a #GOptionGroup for the commandline arguments recognized
    by GTK+ and GDK.
    
    You should add this group to your #GOptionContext
    with [glib.option_context.OptionContext.addGroup], if you are using
    [glib.option_context.OptionContext.parse] to parse your commandline arguments.

    Params:
      openDefaultDisplay = whether to open the default display
            when parsing the commandline arguments
    Returns: a #GOptionGroup for the commandline
          arguments recognized by GTK+
*/
glib.option_group.OptionGroup getOptionGroup(bool openDefaultDisplay)
{
  GOptionGroup* _cretval;
  _cretval = gtk_get_option_group(openDefaultDisplay);
  auto _retval = _cretval ? new glib.option_group.OptionGroup(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Queries the current grab of the default window group.
    Returns: The widget which currently
          has the grab or null if no grab is active
*/
gtk.widget.Widget grabGetCurrent()
{
  GtkWidget* _cretval;
  _cretval = gtk_grab_get_current();
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    Removes the key snooper function with the given id.

    Params:
      snooperHandlerId = Identifies the key snooper to remove

    Deprecated: Key snooping should not be done. Events should
          be handled by widgets.
*/
void keySnooperRemove(uint snooperHandlerId)
{
  gtk_key_snooper_remove(snooperHandlerId);
}

/**
    Runs the main loop until [gtk.global.mainQuit] is called.
    
    You can nest calls to [gtk.global.main]. In that case [gtk.global.mainQuit]
    will make the innermost invocation of the main loop return.
*/
void main()
{
  gtk_main();
}

/**
    Processes a single GDK event.
    
    This is public only to allow filtering of events between GDK and GTK+.
    You will not usually need to call this function directly.
    
    While you should not call this function directly, you might want to
    know how exactly events are handled. So here is what this function
    does with the event:
    
    1. Compress enter/leave notify events. If the event passed build an
       enter/leave pair together with the next event (peeked from GDK), both
       events are thrown away. This is to avoid a backlog of (de-)highlighting
       widgets crossed by the pointer.
    
    2. Find the widget which got the event. If the widget can’t be determined
       the event is thrown away unless it belongs to a INCR transaction.
    
    3. Then the event is pushed onto a stack so you can query the currently
       handled event with [gtk.global.getCurrentEvent].
    
    4. The event is sent to a widget. If a grab is active all events for widgets
       that are not in the contained in the grab widget are sent to the latter
       with a few exceptions:
       $(LIST
            * Deletion and destruction events are still sent to the event widget for
              obvious reasons.
            * Events which directly relate to the visual representation of the event
              widget.
            * Leave events are delivered to the event widget if there was an enter
              event delivered to it before without the paired leave event.
            * Drag events are not redirected because it is unclear what the semantics
              of that would be.
       )
       Another point of interest might be that all key events are first passed
       through the key snooper functions if there are any. Read the description
       of [gtk.global.keySnooperInstall] if you need this feature.
    
    5. After finishing the delivery the event is popped from the event stack.

    Params:
      event = An event to process (normally passed by GDK)
*/
void mainDoEvent(gdk.event.Event event)
{
  gtk_main_do_event(event ? cast(GdkEvent*)event._cPtr : null);
}

/**
    Runs a single iteration of the mainloop.
    
    If no events are waiting to be processed GTK+ will block
    until the next event is noticed. If you don’t want to block
    look at [gtk.global.mainIterationDo] or check if any events are
    pending with [gtk.global.eventsPending] first.
    Returns: true if [gtk.global.mainQuit] has been called for the
          innermost mainloop
*/
bool mainIteration()
{
  bool _retval;
  _retval = cast(bool)gtk_main_iteration();
  return _retval;
}

/**
    Runs a single iteration of the mainloop.
    If no events are available either return or block depending on
    the value of blocking.

    Params:
      blocking = true if you want GTK+ to block if no events are pending
    Returns: true if [gtk.global.mainQuit] has been called for the
          innermost mainloop
*/
bool mainIterationDo(bool blocking)
{
  bool _retval;
  _retval = cast(bool)gtk_main_iteration_do(blocking);
  return _retval;
}

/**
    Asks for the current nesting level of the main loop.
    Returns: the nesting level of the current invocation
          of the main loop
*/
uint mainLevel()
{
  uint _retval;
  _retval = gtk_main_level();
  return _retval;
}

/**
    Makes the innermost invocation of the main loop return
    when it regains control.
*/
void mainQuit()
{
  gtk_main_quit();
}

/**
    Draws an arrow in the given rectangle on cr using the given
    parameters. arrow_type determines the direction of the arrow.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      arrowType = the type of arrow to draw
      fill = true if the arrow tip should be filled
      x = x origin of the rectangle to draw the arrow in
      y = y origin of the rectangle to draw the arrow in
      width = width of the rectangle to draw the arrow in
      height = height of the rectangle to draw the arrow in

    Deprecated: Use [gtk.global.renderArrow] instead
*/
void paintArrow(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, gtk.types.ArrowType arrowType, bool fill, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_arrow(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, arrowType, fill, x, y, width, height);
}

/**
    Draws a box on cr with the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the box
      y = y origin of the box
      width = the width of the box
      height = the height of the box

    Deprecated: Use [gtk.global.renderFrame] and [gtk.global.renderBackground] instead
*/
void paintBox(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_box(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a box in cr using the given style and state and shadow type,
    leaving a gap in one side.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle
      y = y origin of the rectangle
      width = width of the rectangle
      height = width of the rectangle
      gapSide = side in which to leave the gap
      gapX = starting position of the gap
      gapWidth = width of the gap

    Deprecated: Use [gtk.global.renderFrameGap] instead
*/
void paintBoxGap(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height, gtk.types.PositionType gapSide, int gapX, int gapWidth)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_box_gap(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide, gapX, gapWidth);
}

/**
    Draws a check button indicator in the given rectangle on cr with
    the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle to draw the check in
      y = y origin of the rectangle to draw the check in
      width = the width of the rectangle to draw the check in
      height = the height of the rectangle to draw the check in

    Deprecated: Use [gtk.global.renderCheck] instead
*/
void paintCheck(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_check(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a diamond in the given rectangle on window using the given
    parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle to draw the diamond in
      y = y origin of the rectangle to draw the diamond in
      width = width of the rectangle to draw the diamond in
      height = height of the rectangle to draw the diamond in

    Deprecated: Use cairo instead
*/
void paintDiamond(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_diamond(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws an expander as used in #GtkTreeView. `x` and `y` specify the
    center the expander. The size of the expander is determined by the
    “expander-size” style property of widget.  (If widget is not
    specified or doesn’t have an “expander-size” property, an
    unspecified default size will be used, since the caller doesn't
    have sufficient information to position the expander, this is
    likely not useful.) The expander is expander_size pixels tall
    in the collapsed position and expander_size pixels wide in the
    expanded position.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      widget = the widget
      detail = a style detail
      x = the x position to draw the expander at
      y = the y position to draw the expander at
      expanderStyle = the style to draw the expander in; determines
          whether the expander is collapsed, expanded, or in an
          intermediate state.

    Deprecated: Use [gtk.global.renderExpander] instead
*/
void paintExpander(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, int x, int y, gtk.types.ExpanderStyle expanderStyle)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_expander(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, expanderStyle);
}

/**
    Draws an extension, i.e. a notebook tab.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the extension
      y = y origin of the extension
      width = width of the extension
      height = width of the extension
      gapSide = the side on to which the extension is attached

    Deprecated: Use [gtk.global.renderExtension] instead
*/
void paintExtension(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height, gtk.types.PositionType gapSide)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_extension(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide);
}

/**
    Draws a flat box on cr with the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the box
      y = y origin of the box
      width = the width of the box
      height = the height of the box

    Deprecated: Use [gtk.global.renderFrame] and [gtk.global.renderBackground] instead
*/
void paintFlatBox(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_flat_box(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a focus indicator around the given rectangle on cr using the
    given style.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      widget = the widget
      detail = a style detail
      x = the x origin of the rectangle around which to draw a focus indicator
      y = the y origin of the rectangle around which to draw a focus indicator
      width = the width of the rectangle around which to draw a focus indicator
      height = the height of the rectangle around which to draw a focus indicator

    Deprecated: Use [gtk.global.renderFocus] instead
*/
void paintFocus(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_focus(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a handle as used in #GtkHandleBox and #GtkPaned.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the handle
      y = y origin of the handle
      width = with of the handle
      height = height of the handle
      orientation = the orientation of the handle

    Deprecated: Use [gtk.global.renderHandle] instead
*/
void paintHandle(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height, gtk.types.Orientation orientation)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_handle(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, orientation);
}

/**
    Draws a horizontal line from (x1, `y`) to (x2, `y`) in cr
    using the given style and state.

    Params:
      style = a #GtkStyle
      cr = a #caio_t
      stateType = a state
      widget = the widget
      detail = a style detail
      x1 = the starting x coordinate
      x2 = the ending x coordinate
      y = the y coordinate

    Deprecated: Use [gtk.global.renderLine] instead
*/
void paintHline(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, int x1, int x2, int y)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_hline(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x1, x2, y);
}

/**
    Draws a layout on cr using the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      useText = whether to use the text or foreground
                   graphics context of style
      widget = the widget
      detail = a style detail
      x = x origin
      y = y origin
      layout = the layout to draw

    Deprecated: Use [gtk.global.renderLayout] instead
*/
void paintLayout(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, bool useText, gtk.widget.Widget widget, string detail, int x, int y, pango.layout.Layout layout)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_layout(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, useText, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}

/**
    Draws a radio button indicator in the given rectangle on cr with
    the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle to draw the option in
      y = y origin of the rectangle to draw the option in
      width = the width of the rectangle to draw the option in
      height = the height of the rectangle to draw the option in

    Deprecated: Use [gtk.global.renderOption] instead
*/
void paintOption(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_option(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a resize grip in the given rectangle on cr using the given
    parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      widget = the widget
      detail = a style detail
      edge = the edge in which to draw the resize grip
      x = the x origin of the rectangle in which to draw the resize grip
      y = the y origin of the rectangle in which to draw the resize grip
      width = the width of the rectangle in which to draw the resize grip
      height = the height of the rectangle in which to draw the resize grip

    Deprecated: Use [gtk.global.renderHandle] instead
*/
void paintResizeGrip(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, gdk.types.WindowEdge edge, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_resize_grip(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, edge, x, y, width, height);
}

/**
    Draws a shadow around the given rectangle in cr
    using the given style and state and shadow type.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle
      y = y origin of the rectangle
      width = width of the rectangle
      height = width of the rectangle

    Deprecated: Use [gtk.global.renderFrame] instead
*/
void paintShadow(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_shadow(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a shadow around the given rectangle in cr
    using the given style and state and shadow type, leaving a
    gap in one side.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle
      y = y origin of the rectangle
      width = width of the rectangle
      height = width of the rectangle
      gapSide = side in which to leave the gap
      gapX = starting position of the gap
      gapWidth = width of the gap

    Deprecated: Use [gtk.global.renderFrameGap] instead
*/
void paintShadowGap(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height, gtk.types.PositionType gapSide, int gapX, int gapWidth)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_shadow_gap(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, gapSide, gapX, gapWidth);
}

/**
    Draws a slider in the given rectangle on cr using the
    given style and orientation.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = a shadow
      widget = the widget
      detail = a style detail
      x = the x origin of the rectangle in which to draw a slider
      y = the y origin of the rectangle in which to draw a slider
      width = the width of the rectangle in which to draw a slider
      height = the height of the rectangle in which to draw a slider
      orientation = the orientation to be used

    Deprecated: Use [gtk.global.renderSlider] instead
*/
void paintSlider(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height, gtk.types.Orientation orientation)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_slider(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height, orientation);
}

/**
    Draws a spinner on window using the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      widget = the widget (may be null)
      detail = a style detail (may be null)
      step = the nth step
      x = the x origin of the rectangle in which to draw the spinner
      y = the y origin of the rectangle in which to draw the spinner
      width = the width of the rectangle in which to draw the spinner
      height = the height of the rectangle in which to draw the spinner

    Deprecated: Use [gtk.global.renderIcon] and the #GtkStyleContext
        you are drawing instead
*/
void paintSpinner(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, uint step, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_spinner(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, step, x, y, width, height);
}

/**
    Draws an option menu tab (i.e. the up and down pointing arrows)
    in the given rectangle on cr using the given parameters.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      shadowType = the type of shadow to draw
      widget = the widget
      detail = a style detail
      x = x origin of the rectangle to draw the tab in
      y = y origin of the rectangle to draw the tab in
      width = the width of the rectangle to draw the tab in
      height = the height of the rectangle to draw the tab in

    Deprecated: Use cairo instead
*/
void paintTab(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.types.ShadowType shadowType, gtk.widget.Widget widget, string detail, int x, int y, int width, int height)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_tab(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, shadowType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, x, y, width, height);
}

/**
    Draws a vertical line from (`x`, y1_) to (`x`, y2_) in cr
    using the given style and state.

    Params:
      style = a #GtkStyle
      cr = a #cairo_t
      stateType = a state
      widget = the widget
      detail = a style detail
      y1 = the starting y coordinate
      y2 = the ending y coordinate
      x = the x coordinate

    Deprecated: Use [gtk.global.renderLine] instead
*/
void paintVline(gtk.style.Style style, cairo.context.Context cr, gtk.types.StateType stateType, gtk.widget.Widget widget, string detail, int y1, int y2, int x)
{
  const(char)* _detail = detail.toCString(No.Alloc);
  gtk_paint_vline(style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, stateType, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail, y1, y2, x);
}

/**
    Runs a page setup dialog, letting the user modify the values from
    page_setup. If the user cancels the dialog, the returned #GtkPageSetup
    is identical to the passed in page_setup, otherwise it contains the
    modifications done in the dialog.
    
    Note that this function may use a recursive mainloop to show the page
    setup dialog. See [gtk.global.printRunPageSetupDialogAsync] if this is
    a problem.

    Params:
      parent = transient parent
      pageSetup = an existing #GtkPageSetup
      settings = a #GtkPrintSettings
    Returns: a new #GtkPageSetup
*/
gtk.page_setup.PageSetup printRunPageSetupDialog(gtk.window.Window parent, gtk.page_setup.PageSetup pageSetup, gtk.print_settings.PrintSettings settings)
{
  GtkPageSetup* _cretval;
  _cretval = gtk_print_run_page_setup_dialog(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
  return _retval;
}

/**
    Runs a page setup dialog, letting the user modify the values from page_setup.
    
    In contrast to [gtk.global.printRunPageSetupDialog], this function  returns after
    showing the page setup dialog on platforms that support this, and calls done_cb
    from a signal handler for the ::response signal of the dialog.

    Params:
      parent = transient parent, or null
      pageSetup = an existing #GtkPageSetup, or null
      settings = a #GtkPrintSettings
      doneCb = a function to call when the user saves
                  the modified page setup
*/
void printRunPageSetupDialogAsync(gtk.window.Window parent, gtk.page_setup.PageSetup pageSetup, gtk.print_settings.PrintSettings settings, gtk.types.PageSetupDoneFunc doneCb)
{
  extern(C) void _doneCbCallback(GtkPageSetup* pageSetup, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gtk.types.PageSetupDoneFunc*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(void*)pageSetup, No.Take));
  }
  auto _doneCbCB = doneCb ? &_doneCbCallback : null;

  auto _doneCb = doneCb ? freezeDelegate(cast(void*)&doneCb) : null;
  gtk_print_run_page_setup_dialog_async(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null, _doneCbCB, _doneCb);
}

/**
    Sends an event to a widget, propagating the event to parent widgets
    if the event remains unhandled.
    
    Events received by GTK+ from GDK normally begin in [gtk.global.mainDoEvent].
    Depending on the type of event, existence of modal dialogs, grabs, etc.,
    the event may be propagated; if so, this function is used.
    
    [gtk.global.propagateEvent] calls [gtk.widget.Widget.event] on each widget it
    decides to send the event to. So [gtk.widget.Widget.event] is the lowest-level
    function; it simply emits the #GtkWidget::event and possibly an
    event-specific signal on a widget. [gtk.global.propagateEvent] is a bit
    higher-level, and [gtk.global.mainDoEvent] is the highest level.
    
    All that said, you most likely don’t want to use any of these
    functions; synthesizing events is rarely needed. There are almost
    certainly better ways to achieve your goals. For example, use
    [gdk.window.Window.invalidateRect] or [gtk.widget.Widget.queueDraw] instead
    of making up expose events.

    Params:
      widget = a #GtkWidget
      event = an event
*/
void propagateEvent(gtk.widget.Widget widget, gdk.event.Event event)
{
  gtk_propagate_event(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr : null);
}

/**
    Adds a file to the list of files to be parsed at the
    end of [gtk.global.init_].

    Params:
      filename = the pathname to the file. If filename
           is not absolute, it is searched in the current directory.

    Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
*/
void rcAddDefaultFile(string filename)
{
  const(char)* _filename = filename.toCString(No.Alloc);
  gtk_rc_add_default_file(_filename);
}

/**
    Searches for a theme engine in the GTK+ search path. This function
    is not useful for applications and should not be used.

    Params:
      moduleFile = name of a theme engine
    Returns: The filename, if found (must be
        freed with [glib.global.gfree]), otherwise null.

    Deprecated: Use #GtkCssProvider instead.
*/
string rcFindModuleInPath(string moduleFile)
{
  char* _cretval;
  const(char)* _moduleFile = moduleFile.toCString(No.Alloc);
  _cretval = gtk_rc_find_module_in_path(_moduleFile);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Looks up a file in pixmap path for the specified #GtkSettings.
    If the file is not found, it outputs a warning message using
    g_warning() and returns null.

    Params:
      settings = a #GtkSettings
      scanner = Scanner used to get line number information for the
          warning message, or null
      pixmapFile = name of the pixmap file to locate.
    Returns: the filename.

    Deprecated: Use #GtkCssProvider instead.
*/
string rcFindPixmapInPath(gtk.settings.Settings settings, glib.scanner.Scanner scanner, string pixmapFile)
{
  char* _cretval;
  const(char)* _pixmapFile = pixmapFile.toCString(No.Alloc);
  _cretval = gtk_rc_find_pixmap_in_path(settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null, scanner ? cast(GScanner*)scanner._cPtr : null, _pixmapFile);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Retrieves the current list of RC files that will be parsed
    at the end of [gtk.global.init_].
    Returns: A null-terminated array of filenames.  This memory is owned
          by GTK+ and must not be freed by the application.  If you want
          to store this information, you should make a copy.

    Deprecated: Use #GtkStyleContext instead
*/
string[] rcGetDefaultFiles()
{
  char** _cretval;
  _cretval = gtk_rc_get_default_files();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Obtains the path to the IM modules file. See the documentation
    of the `GTK_IM_MODULE_FILE`
    environment variable for more details.
    Returns: a newly-allocated string containing the
         name of the file listing the IM modules available for loading

    Deprecated: Use #GtkCssProvider instead.
*/
string rcGetImModuleFile()
{
  char* _cretval;
  _cretval = gtk_rc_get_im_module_file();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Obtains the path in which to look for IM modules. See the documentation
    of the `GTK_PATH`
    environment variable for more details about looking up modules. This
    function is useful solely for utilities supplied with GTK+ and should
    not be used by applications under normal circumstances.
    Returns: a newly-allocated string containing the
         path in which to look for IM modules.

    Deprecated: Use #GtkCssProvider instead.
*/
string rcGetImModulePath()
{
  char* _cretval;
  _cretval = gtk_rc_get_im_module_path();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a directory in which GTK+ looks for theme engines.
    For full information about the search for theme engines,
    see the docs for `GTK_PATH` in [Running GTK+ Applications][gtk-running].
    Returns: the directory. (Must be freed with [glib.global.gfree])

    Deprecated: Use #GtkCssProvider instead.
*/
string rcGetModuleDir()
{
  char* _cretval;
  _cretval = gtk_rc_get_module_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Finds all matching RC styles for a given widget,
    composites them together, and then creates a
    #GtkStyle representing the composite appearance.
    (GTK+ actually keeps a cache of previously
    created styles, so a new style may not be
    created.)

    Params:
      widget = a #GtkWidget
    Returns: the resulting style. No refcount is added
        to the returned style, so if you want to save this style around,
        you should add a reference yourself.

    Deprecated: Use #GtkStyleContext instead
*/
gtk.style.Style rcGetStyle(gtk.widget.Widget widget)
{
  GtkStyle* _cretval;
  _cretval = gtk_rc_get_style(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style.Style)(cast(GtkStyle*)_cretval, No.Take);
  return _retval;
}

/**
    Creates up a #GtkStyle from styles defined in a RC file by providing
    the raw components used in matching. This function may be useful
    when creating pseudo-widgets that should be themed like widgets but
    don’t actually have corresponding GTK+ widgets. An example of this
    would be items inside a GNOME canvas widget.
    
    The action of [gtk.global.rcGetStyle] is similar to:
    ```c
     gtk_widget_path (widget, NULL, &path, NULL);
     gtk_widget_class_path (widget, NULL, &class_path, NULL);
     gtk_rc_get_style_by_paths (gtk_widget_get_settings (widget),
                                path, class_path,
                                G_OBJECT_TYPE (widget));
    ```

    Params:
      settings = a #GtkSettings object
      widgetPath = the widget path to use when looking up the
            style, or null if no matching against the widget path should be done
      classPath = the class path to use when looking up the style,
            or null if no matching against the class path should be done.
      type = a type that will be used along with parent types of this type
            when matching against class styles, or #G_TYPE_NONE
    Returns: A style created by matching
          with the supplied paths, or null if nothing matching was
          specified and the default style should be used. The returned
          value is owned by GTK+ as part of an internal cache, so you
          must call [gobject.object.ObjectWrap.ref_] on the returned value if you want to
          keep a reference to it.

    Deprecated: Use #GtkStyleContext instead
*/
gtk.style.Style rcGetStyleByPaths(gtk.settings.Settings settings, string widgetPath, string classPath, gobject.types.GType type)
{
  GtkStyle* _cretval;
  const(char)* _widgetPath = widgetPath.toCString(No.Alloc);
  const(char)* _classPath = classPath.toCString(No.Alloc);
  _cretval = gtk_rc_get_style_by_paths(settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null, _widgetPath, _classPath, type);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style.Style)(cast(GtkStyle*)_cretval, No.Take);
  return _retval;
}

/**
    Returns the standard directory in which themes should
    be installed. (GTK+ does not actually use this directory
    itself.)
    Returns: The directory (must be freed with [glib.global.gfree]).

    Deprecated: Use #GtkCssProvider instead.
*/
string rcGetThemeDir()
{
  char* _cretval;
  _cretval = gtk_rc_get_theme_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Parses a given resource file.

    Params:
      filename = the filename of a file to parse. If filename is not absolute, it
         is searched in the current directory.

    Deprecated: Use #GtkCssProvider instead.
*/
void rcParse(string filename)
{
  const(char)* _filename = filename.toCString(No.Alloc);
  gtk_rc_parse(_filename);
}

/**
    Parses a color in the format expected
    in a RC file.
    
    Note that theme engines should use [gtk.global.rcParseColorFull] in
    order to support symbolic colors.

    Params:
      scanner = a #GScanner
      color = a pointer to a #GdkColor in which to store
            the result
    Returns: `G_TOKEN_NONE` if parsing succeeded, otherwise the token
          that was expected but not found

    Deprecated: Use #GtkCssProvider instead
*/
uint rcParseColor(glib.scanner.Scanner scanner, out gdk.color.Color color)
{
  uint _retval;
  GdkColor _color;
  _retval = gtk_rc_parse_color(scanner ? cast(GScanner*)scanner._cPtr : null, &_color);
  color = new gdk.color.Color(cast(void*)&_color, No.Take);
  return _retval;
}

/**
    Parses a color in the format expected
    in a RC file. If style is not null, it will be consulted to resolve
    references to symbolic colors.

    Params:
      scanner = a #GScanner
      style = a #GtkRcStyle, or null
      color = a pointer to a #GdkColor in which to store
            the result
    Returns: `G_TOKEN_NONE` if parsing succeeded, otherwise the token
          that was expected but not found

    Deprecated: Use #GtkCssProvider instead
*/
uint rcParseColorFull(glib.scanner.Scanner scanner, gtk.rc_style.RcStyle style, out gdk.color.Color color)
{
  uint _retval;
  GdkColor _color;
  _retval = gtk_rc_parse_color_full(scanner ? cast(GScanner*)scanner._cPtr : null, style ? cast(GtkRcStyle*)style._cPtr(No.Dup) : null, &_color);
  color = new gdk.color.Color(cast(void*)&_color, No.Take);
  return _retval;
}

/**
    Parses a #GtkPathPriorityType variable from the format expected
    in a RC file.

    Params:
      scanner = a #GScanner (must be initialized for parsing an RC file)
      priority = A pointer to #GtkPathPriorityType variable in which
         to store the result.
    Returns: `G_TOKEN_NONE` if parsing succeeded, otherwise the token
        that was expected but not found.

    Deprecated: Use #GtkCssProvider instead
*/
uint rcParsePriority(glib.scanner.Scanner scanner, out gtk.types.PathPriorityType priority)
{
  uint _retval;
  _retval = gtk_rc_parse_priority(scanner ? cast(GScanner*)scanner._cPtr : null, &priority);
  return _retval;
}

/**
    Parses a #GtkStateType variable from the format expected
    in a RC file.

    Params:
      scanner = a #GScanner (must be initialized for parsing an RC file)
      state = A pointer to a #GtkStateType variable in which to
         store the result.
    Returns: `G_TOKEN_NONE` if parsing succeeded, otherwise the token
        that was expected but not found.

    Deprecated: Use #GtkCssProvider instead
*/
uint rcParseState(glib.scanner.Scanner scanner, out gtk.types.StateType state)
{
  uint _retval;
  _retval = gtk_rc_parse_state(scanner ? cast(GScanner*)scanner._cPtr : null, &state);
  return _retval;
}

/**
    Parses resource information directly from a string.

    Params:
      rcString = a string to parse.

    Deprecated: Use #GtkCssProvider instead.
*/
void rcParseString(string rcString)
{
  const(char)* _rcString = rcString.toCString(No.Alloc);
  gtk_rc_parse_string(_rcString);
}

/**
    If the modification time on any previously read file for the
    default #GtkSettings has changed, discard all style information
    and then reread all previously read RC files.
    Returns: true if the files were reread.

    Deprecated: Use #GtkCssProvider instead.
*/
bool rcReparseAll()
{
  bool _retval;
  _retval = cast(bool)gtk_rc_reparse_all();
  return _retval;
}

/**
    If the modification time on any previously read file
    for the given #GtkSettings has changed, discard all style information
    and then reread all previously read RC files.

    Params:
      settings = a #GtkSettings
      forceLoad = load whether or not anything changed
    Returns: true if the files were reread.

    Deprecated: Use #GtkCssProvider instead.
*/
bool rcReparseAllForSettings(gtk.settings.Settings settings, bool forceLoad)
{
  bool _retval;
  _retval = cast(bool)gtk_rc_reparse_all_for_settings(settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null, forceLoad);
  return _retval;
}

/**
    This function recomputes the styles for all widgets that use a
    particular #GtkSettings object. (There is one #GtkSettings object
    per #GdkScreen, see [gtk.settings.Settings.getForScreen]); It is useful
    when some global parameter has changed that affects the appearance
    of all widgets, because when a widget gets a new style, it will
    both redraw and recompute any cached information about its
    appearance. As an example, it is used when the default font size
    set by the operating system changes. Note that this function
    doesn’t affect widgets that have a style set explicitly on them
    with [gtk.widget.Widget.setStyle].

    Params:
      settings = a #GtkSettings

    Deprecated: Use #GtkCssProvider instead.
*/
void rcResetStyles(gtk.settings.Settings settings)
{
  gtk_rc_reset_styles(settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null);
}

/**
    Sets the list of files that GTK+ will read at the
    end of [gtk.global.init_].

    Params:
      filenames = A
            null-terminated list of filenames.

    Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
*/
void rcSetDefaultFiles(string[] filenames)
{
  char*[] _tmpfilenames;
  foreach (s; filenames)
    _tmpfilenames ~= s.toCString(No.Alloc);
  _tmpfilenames ~= null;
  char** _filenames = _tmpfilenames.ptr;
  gtk_rc_set_default_files(_filenames);
}

/**
    Renders an activity indicator (such as in #GtkSpinner).
    The state [gtk.types.StateFlags.Checked] determines whether there is
    activity going on.

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderActivity(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_activity(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders an arrow pointing to angle.
    
    Typical arrow rendering at 0, 1⁄2 π;, π; and 3⁄2 π:
    
    ![](arrows.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      angle = arrow angle from 0 to 2 * `G_PI`, being 0 the arrow pointing to the north
      x = X origin of the render area
      y = Y origin of the render area
      size = square side for render area
*/
void renderArrow(gtk.style_context.StyleContext context, cairo.context.Context cr, double angle, double x, double y, double size)
{
  gtk_render_arrow(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, angle, x, y, size);
}

/**
    Renders the background of an element.
    
    Typical background rendering, showing the effect of
    `background-image`, `border-width` and `border-radius`:
    
    ![](background.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderBackground(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_background(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Returns the area that will be affected (i.e. drawn to) when
    calling [gtk.global.renderBackground] for the given context and
    rectangle.

    Params:
      context = a #GtkStyleContext
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
      outClip = return location for the clip
*/
void renderBackgroundGetClip(gtk.style_context.StyleContext context, double x, double y, double width, double height, out gdk.rectangle.Rectangle outClip)
{
  GdkRectangle _outClip;
  gtk_render_background_get_clip(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, x, y, width, height, &_outClip);
  outClip = new gdk.rectangle.Rectangle(cast(void*)&_outClip, No.Take);
}

/**
    Renders a checkmark (as in a #GtkCheckButton).
    
    The [gtk.types.StateFlags.Checked] state determines whether the check is
    on or off, and [gtk.types.StateFlags.Inconsistent] determines whether it
    should be marked as undefined.
    
    Typical checkmark rendering:
    
    ![](checks.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderCheck(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_check(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders an expander (as used in #GtkTreeView and #GtkExpander) in the area
    defined by `x`, `y`, width, height. The state [gtk.types.StateFlags.Checked]
    determines whether the expander is collapsed or expanded.
    
    Typical expander rendering:
    
    ![](expanders.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderExpander(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_expander(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a extension (as in a #GtkNotebook tab) in the rectangle
    defined by `x`, `y`, width, height. The side where the extension
    connects to is defined by gap_side.
    
    Typical extension rendering:
    
    ![](extensions.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
      gapSide = side where the gap is
*/
void renderExtension(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height, gtk.types.PositionType gapSide)
{
  gtk_render_extension(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, gapSide);
}

/**
    Renders a focus indicator on the rectangle determined by `x`, `y`, width, height.
    
    Typical focus rendering:
    
    ![](focus.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderFocus(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_focus(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a frame around the rectangle defined by `x`, `y`, width, height.
    
    Examples of frame rendering, showing the effect of `border-image`,
    `border-color`, `border-width`, `border-radius` and junctions:
    
    ![](frames.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderFrame(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_frame(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a frame around the rectangle defined by (`x`, `y`, width, height),
    leaving a gap on one side. `x`y0_gap and `x`y1_gap will mean X coordinates
    for [gtk.types.PositionType.Top] and [gtk.types.PositionType.Bottom] gap sides, and Y coordinates for
    [gtk.types.PositionType.Left] and [gtk.types.PositionType.Right].
    
    Typical rendering of a frame with a gap:
    
    ![](frame-gap.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
      gapSide = side where the gap is
      xy0Gap = initial coordinate (X or Y depending on gap_side) for the gap
      xy1Gap = end coordinate (X or Y depending on gap_side) for the gap

    Deprecated: Use [gtk.global.renderFrame] instead. Themes can create gaps
          by omitting borders via CSS.
*/
void renderFrameGap(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height, gtk.types.PositionType gapSide, double xy0Gap, double xy1Gap)
{
  gtk_render_frame_gap(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, gapSide, xy0Gap, xy1Gap);
}

/**
    Renders a handle (as in #GtkHandleBox, #GtkPaned and
    #GtkWindow’s resize grip), in the rectangle
    determined by `x`, `y`, width, height.
    
    Handles rendered for the paned and grip classes:
    
    ![](handles.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderHandle(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_handle(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders the icon in pixbuf at the specified `x` and `y` coordinates.
    
    This function will render the icon in pixbuf at exactly its size,
    regardless of scaling factors, which may not be appropriate when
    drawing on displays with high pixel densities.
    
    You probably want to use [gtk.global.renderIconSurface] instead, if you
    already have a Cairo surface.

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      pixbuf = a #GdkPixbuf containing the icon to draw
      x = X position for the pixbuf
      y = Y position for the pixbuf
*/
void renderIcon(gtk.style_context.StyleContext context, cairo.context.Context cr, gdkpixbuf.pixbuf.Pixbuf pixbuf, double x, double y)
{
  gtk_render_icon(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null, x, y);
}

/**
    Renders the icon specified by source at the given size, returning the result
    in a pixbuf.

    Params:
      context = a #GtkStyleContext
      source = the #GtkIconSource specifying the icon to render
      size = the size (#GtkIconSize) to render the icon at.
               A size of `(GtkIconSize) -1` means render at the size of the source
               and don’t scale.
    Returns: a newly-created #GdkPixbuf containing the rendered icon

    Deprecated: Use [gtk.icon_theme.IconTheme.loadIcon] instead.
*/
gdkpixbuf.pixbuf.Pixbuf renderIconPixbuf(gtk.style_context.StyleContext context, gtk.icon_source.IconSource source, gtk.types.IconSize size)
{
  GdkPixbuf* _cretval;
  _cretval = gtk_render_icon_pixbuf(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null, size);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
  return _retval;
}

/**
    Renders the icon in surface at the specified `x` and `y` coordinates.

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      surface = a #cairo_surface_t containing the icon to draw
      x = X position for the icon
      y = Y position for the incon
*/
void renderIconSurface(gtk.style_context.StyleContext context, cairo.context.Context cr, cairo.surface.Surface surface, double x, double y)
{
  gtk_render_icon_surface(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, x, y);
}

/**
    Draws a text caret on cr at the specified index of layout.

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin
      y = Y origin
      layout = the #PangoLayout of the text
      index = the index in the #PangoLayout
      direction = the #PangoDirection of the text
*/
void renderInsertionCursor(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, pango.layout.Layout layout, int index, pango.types.Direction direction)
{
  gtk_render_insertion_cursor(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null, index, direction);
}

/**
    Renders layout on the coordinates `x`, `y`

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin
      y = Y origin
      layout = the #PangoLayout to render
*/
void renderLayout(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, pango.layout.Layout layout)
{
  gtk_render_layout(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}

/**
    Renders a line from (x0, y0) to (x1, y1).

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x0 = X coordinate for the origin of the line
      y0 = Y coordinate for the origin of the line
      x1 = X coordinate for the end of the line
      y1 = Y coordinate for the end of the line
*/
void renderLine(gtk.style_context.StyleContext context, cairo.context.Context cr, double x0, double y0, double x1, double y1)
{
  gtk_render_line(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x0, y0, x1, y1);
}

/**
    Renders an option mark (as in a #GtkRadioButton), the [gtk.types.StateFlags.Checked]
    state will determine whether the option is on or off, and
    [gtk.types.StateFlags.Inconsistent] whether it should be marked as undefined.
    
    Typical option mark rendering:
    
    ![](options.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderOption(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_option(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a slider (as in #GtkScale) in the rectangle defined by `x`, `y`,
    width, height. orientation defines whether the slider is vertical
    or horizontal.
    
    Typical slider rendering:
    
    ![](sliders.png)

    Params:
      context = a #GtkStyleContext
      cr = a #cairo_t
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
      orientation = orientation of the slider
*/
void renderSlider(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height, gtk.types.Orientation orientation)
{
  gtk_render_slider(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, orientation);
}

/**
    Converts a color from RGB space to HSV.
    
    Input values must be in the [0.0, 1.0] range;
    output values will be in the same range.

    Params:
      r = Red
      g = Green
      b = Blue
      h = Return value for the hue component
      s = Return value for the saturation component
      v = Return value for the value component
*/
void rgbToHsv(double r, double g, double b, out double h, out double s, out double v)
{
  gtk_rgb_to_hsv(r, g, b, cast(double*)&h, cast(double*)&s, cast(double*)&v);
}

/**
    Appends a specified target to the list of supported targets for a
    given widget and selection.

    Params:
      widget = a #GtkWidget
      selection = the selection
      target = target to add.
      info = A unsigned integer which will be passed back to the application.
*/
void selectionAddTarget(gtk.widget.Widget widget, gdk.atom.Atom selection, gdk.atom.Atom target, uint info)
{
  gtk_selection_add_target(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, target ? cast(GdkAtom)target._cPtr : null, info);
}

/**
    Prepends a table of targets to the list of supported targets
    for a given widget and selection.

    Params:
      widget = a #GtkWidget
      selection = the selection
      targets = a table of targets to add
*/
void selectionAddTargets(gtk.widget.Widget widget, gdk.atom.Atom selection, gtk.target_entry.TargetEntry[] targets)
{
  uint _ntargets;
  if (targets)
    _ntargets = cast(uint)targets.length;

  GtkTargetEntry[] _tmptargets;
  foreach (obj; targets)
    _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
  const(GtkTargetEntry)* _targets = _tmptargets.ptr;
  gtk_selection_add_targets(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, _targets, _ntargets);
}

/**
    Remove all targets registered for the given selection for the
    widget.

    Params:
      widget = a #GtkWidget
      selection = an atom representing a selection
*/
void selectionClearTargets(gtk.widget.Widget widget, gdk.atom.Atom selection)
{
  gtk_selection_clear_targets(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null);
}

/**
    Requests the contents of a selection. When received,
    a “selection-received” signal will be generated.

    Params:
      widget = The widget which acts as requestor
      selection = Which selection to get
      target = Form of information desired (e.g., STRING)
      time = Time of request (usually of triggering event)
               In emergency, you could use #GDK_CURRENT_TIME
    Returns: true if requested succeeded. false if we could not process
               request. (e.g., there was already a request in process for
               this widget).
*/
bool selectionConvert(gtk.widget.Widget widget, gdk.atom.Atom selection, gdk.atom.Atom target, uint time)
{
  bool _retval;
  _retval = cast(bool)gtk_selection_convert(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, target ? cast(GdkAtom)target._cPtr : null, time);
  return _retval;
}

/**
    Claims ownership of a given selection for a particular widget,
    or, if widget is null, release ownership of the selection.

    Params:
      widget = a #GtkWidget, or null.
      selection = an interned atom representing the selection to claim
      time = timestamp with which to claim the selection
    Returns: true if the operation succeeded
*/
bool selectionOwnerSet(gtk.widget.Widget widget, gdk.atom.Atom selection, uint time)
{
  bool _retval;
  _retval = cast(bool)gtk_selection_owner_set(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, time);
  return _retval;
}

/**
    Claim ownership of a given selection for a particular widget, or,
    if widget is null, release ownership of the selection.

    Params:
      display = the #GdkDisplay where the selection is set
      widget = new selection owner (a #GtkWidget), or null.
      selection = an interned atom representing the selection to claim.
      time = timestamp with which to claim the selection
    Returns: TRUE if the operation succeeded
*/
bool selectionOwnerSetForDisplay(gdk.display.Display display, gtk.widget.Widget widget, gdk.atom.Atom selection, uint time)
{
  bool _retval;
  _retval = cast(bool)gtk_selection_owner_set_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, time);
  return _retval;
}

/**
    Removes all handlers and unsets ownership of all
    selections for a widget. Called when widget is being
    destroyed. This function will not generally be
    called by applications.

    Params:
      widget = a #GtkWidget
*/
void selectionRemoveAll(gtk.widget.Widget widget)
{
  gtk_selection_remove_all(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
}

/**
    Sets the GTK+ debug flags.

    Params:
      flags = 
*/
void setDebugFlags(uint flags)
{
  gtk_set_debug_flags(flags);
}

/**
    A convenience function for launching the default application
    to show the uri. Like [gtk.global.showUriOnWindow], but takes a screen
    as transient parent instead of a window.
    
    Note that this function is deprecated as it does not pass the necessary
    information for helpers to parent their dialog properly, when run from
    sandboxed applications for example.

    Params:
      screen = screen to show the uri on
            or null for the default screen
      uri = the uri to show
      timestamp = a timestamp to prevent focus stealing
    Returns: true on success, false on error
    Throws: [ErrorWrap]

    Deprecated: Use [gtk.global.showUriOnWindow] instead.
*/
bool showUri(gdk.screen.Screen screen, string uri, uint timestamp)
{
  bool _retval;
  const(char)* _uri = uri.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)gtk_show_uri(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, _uri, timestamp, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    This is a convenience function for launching the default application
    to show the uri. The uri must be of a form understood by GIO (i.e. you
    need to install gvfs to get support for uri schemes such as http://
    or ftp://, as only local files are handled by GIO itself).
    Typical examples are
    $(LIST
      * `file:///home/gnome/pict.jpg`
      * `http://www.gnome.org`
      * `mailto:megnome.org`
    )
      
    Ideally the timestamp is taken from the event triggering
    the [gtk.global.showUri] call. If timestamp is not known you can take
    `GDK_CURRENT_TIME`.
    
    This is the recommended call to be used as it passes information
    necessary for sandbox helpers to parent their dialogs properly.

    Params:
      parent = parent window
      uri = the uri to show
      timestamp = a timestamp to prevent focus stealing
    Returns: true on success, false on error
    Throws: [ErrorWrap]
*/
bool showUriOnWindow(gtk.window.Window parent, string uri, uint timestamp)
{
  bool _retval;
  const(char)* _uri = uri.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)gtk_show_uri_on_window(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, _uri, timestamp, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Retrieves a list of all known stock IDs added to a #GtkIconFactory
    or registered with [gtk.global.stockAdd]. The list must be freed with [glib.slist.SList.free],
    and each string in the list must be freed with [glib.global.gfree].
    Returns: a list of known stock IDs
*/
string[] stockListIds()
{
  GSList* _cretval;
  _cretval = gtk_stock_list_ids();
  auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
    Fills item with the registered values for stock_id, returning true
    if stock_id was known.

    Params:
      stockId = a stock item name
      item = stock item to initialize with values
    Returns: true if item was initialized
*/
bool stockLookup(string stockId, out gtk.stock_item.StockItem item)
{
  bool _retval;
  const(char)* _stockId = stockId.toCString(No.Alloc);
  GtkStockItem _item;
  _retval = cast(bool)gtk_stock_lookup(_stockId, &_item);
  item = new gtk.stock_item.StockItem(cast(void*)&_item, No.Take);
  return _retval;
}

/**
    Sets a function to be used for translating the label of
    a stock item.
    
    If no function is registered for a translation domain,
    [glib.global.dgettext] is used.
    
    The function is used for all stock items whose
    translation_domain matches domain. Note that it is possible
    to use strings different from the actual gettext translation domain
    of your application for this, as long as your #GtkTranslateFunc uses
    the correct domain when calling dgettext(). This can be useful, e.g.
    when dealing with message contexts:
    
    ```c
    GtkStockItem items[] = {
     { MY_ITEM1, NC_("odd items", "Item 1"), 0, 0, "odd-item-domain" },
     { MY_ITEM2, NC_("even items", "Item 2"), 0, 0, "even-item-domain" },
    };
    
    gchar *
    my_translate_func (const gchar *msgid,
                       gpointer     data)
    {
      gchar *msgctxt = data;
    
      return (gchar*)g_dpgettext2 (GETTEXT_PACKAGE, msgctxt, msgid);
    }
    
    ...
    
    gtk_stock_add (items, G_N_ELEMENTS (items));
    gtk_stock_set_translate_func ("odd-item-domain", my_translate_func, "odd items");
    gtk_stock_set_translate_func ("even-item-domain", my_translate_func, "even items");
    ```

    Params:
      domain = the translation domain for which func shall be used
      func = a #GtkTranslateFunc
*/
void stockSetTranslateFunc(string domain, gtk.types.TranslateFunc func)
{
  extern(C) char* _funcCallback(const(char)* path, void* funcData)
  {
    string _dretval;
    auto _dlg = cast(gtk.types.TranslateFunc*)funcData;
    string _path = path.fromCString(No.Free);

    _dretval = (*_dlg)(_path);
    char* _retval = _dretval.toCString(Yes.Alloc);

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;

  const(char)* _domain = domain.toCString(No.Alloc);
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  gtk_stock_set_translate_func(_domain, _funcCB, _func, _funcDestroyCB);
}

/**
    This function frees a target table as returned by
    [gtk.global.targetTableNewFromList]

    Params:
      targets = a #GtkTargetEntry array
*/
void targetTableFree(gtk.target_entry.TargetEntry[] targets)
{
  int _nTargets;
  if (targets)
    _nTargets = cast(int)targets.length;

  GtkTargetEntry[] _tmptargets;
  foreach (obj; targets)
    _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
  GtkTargetEntry* _targets = _tmptargets.ptr;
  gtk_target_table_free(_targets, _nTargets);
}

/**
    This function creates an #GtkTargetEntry array that contains the
    same targets as the passed `list`. The returned table is newly
    allocated and should be freed using [gtk.global.targetTableFree] when no
    longer needed.

    Params:
      list = a #GtkTargetList
    Returns: the new table.
*/
gtk.target_entry.TargetEntry[] targetTableNewFromList(gtk.target_list.TargetList list)
{
  GtkTargetEntry* _cretval;
  int _cretlength;
  _cretval = gtk_target_table_new_from_list(list ? cast(GtkTargetList*)list._cPtr(No.Dup) : null, &_cretlength);
  gtk.target_entry.TargetEntry[] _retval;

  if (_cretval)
  {
    _retval = new gtk.target_entry.TargetEntry[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new gtk.target_entry.TargetEntry(cast(void*)&_cretval[i], Yes.Take);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Create a simple window with window title window_title and
    text contents dialog_text.
    The window will quit any running [gtk.global.main]-loop when destroyed, and it
    will automatically be destroyed upon test function teardown.

    Params:
      windowTitle = Title of the window to be displayed.
      dialogText = Text inside the window to be displayed.
    Returns: a widget pointer to the newly created GtkWindow.

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
gtk.widget.Widget testCreateSimpleWindow(string windowTitle, string dialogText)
{
  GtkWidget* _cretval;
  const(char)* _windowTitle = windowTitle.toCString(No.Alloc);
  const(char)* _dialogText = dialogText.toCString(No.Alloc);
  _cretval = gtk_test_create_simple_window(_windowTitle, _dialogText);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    This function will search widget and all its descendants for a GtkLabel
    widget with a text string matching label_pattern.
    The label_pattern may contain asterisks “*” and question marks “?” as
    placeholders, [glib.global.patternMatch] is used for the matching.
    Note that locales other than "C“ tend to alter (translate” label strings,
    so this function is genrally only useful in test programs with
    predetermined locales, see [gtk.global.testInit] for more details.

    Params:
      widget = Valid label or container widget.
      labelPattern = Shell-glob pattern to match a label string.
    Returns: a GtkLabel widget if any is found.
*/
gtk.widget.Widget testFindLabel(gtk.widget.Widget widget, string labelPattern)
{
  GtkWidget* _cretval;
  const(char)* _labelPattern = labelPattern.toCString(No.Alloc);
  _cretval = gtk_test_find_label(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _labelPattern);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    This function will search siblings of base_widget and siblings of its
    ancestors for all widgets matching widget_type.
    Of the matching widgets, the one that is geometrically closest to
    base_widget will be returned.
    The general purpose of this function is to find the most likely “action”
    widget, relative to another labeling widget. Such as finding a
    button or text entry widget, given its corresponding label widget.

    Params:
      baseWidget = Valid widget, part of a widget hierarchy
      widgetType = Type of a aearched for sibling widget
    Returns: a widget of type widget_type if any is found.
*/
gtk.widget.Widget testFindSibling(gtk.widget.Widget baseWidget, gobject.types.GType widgetType)
{
  GtkWidget* _cretval;
  _cretval = gtk_test_find_sibling(baseWidget ? cast(GtkWidget*)baseWidget._cPtr(No.Dup) : null, widgetType);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    This function will search the descendants of widget for a widget
    of type widget_type that has a label matching label_pattern next
    to it. This is most useful for automated GUI testing, e.g. to find
    the “OK” button in a dialog and synthesize clicks on it.
    However see [gtk.global.testFindLabel], [gtk.global.testFindSibling] and
    [gtk.global.testWidgetClick] for possible caveats involving the search of
    such widgets and synthesizing widget events.

    Params:
      widget = Container widget, usually a GtkWindow.
      labelPattern = Shell-glob pattern to match a label string.
      widgetType = Type of a aearched for label sibling widget.
    Returns: a valid widget if any is found or null.
*/
gtk.widget.Widget testFindWidget(gtk.widget.Widget widget, string labelPattern, gobject.types.GType widgetType)
{
  GtkWidget* _cretval;
  const(char)* _labelPattern = labelPattern.toCString(No.Alloc);
  _cretval = gtk_test_find_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _labelPattern, widgetType);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
  return _retval;
}

/**
    Return the type ids that have been registered after
    calling [gtk.global.testRegisterAllTypes].
    Returns: 0-terminated array of type ids
*/
gobject.types.GType[] testListAllTypes()
{
  const(GType)* _cretval;
  uint _cretlength;
  _cretval = gtk_test_list_all_types(&_cretlength);
  gobject.types.GType[] _retval;

  if (_cretval)
  {
    _retval = cast(gobject.types.GType[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Force registration of all core Gtk+ and Gdk object types.
    This allowes to refer to any of those object types via
    [gobject.global.typeFromName] after calling this function.
*/
void testRegisterAllTypes()
{
  gtk_test_register_all_types();
}

/**
    Retrive the literal adjustment value for GtkRange based
    widgets and spin buttons. Note that the value returned by
    this function is anything between the lower and upper bounds
    of the adjustment belonging to widget, and is not a percentage
    as passed in to [gtk.global.testSliderSetPerc].

    Params:
      widget = valid widget pointer.
    Returns: gtk_adjustment_get_value (adjustment) for an adjustment belonging to widget.

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
double testSliderGetValue(gtk.widget.Widget widget)
{
  double _retval;
  _retval = gtk_test_slider_get_value(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  return _retval;
}

/**
    This function will adjust the slider position of all GtkRange
    based widgets, such as scrollbars or scales, it’ll also adjust
    spin buttons. The adjustment value of these widgets is set to
    a value between the lower and upper limits, according to the
    percentage argument.

    Params:
      widget = valid widget pointer.
      percentage = value between 0 and 100.

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
void testSliderSetPerc(gtk.widget.Widget widget, double percentage)
{
  gtk_test_slider_set_perc(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, percentage);
}

/**
    This function will generate a button click in the upwards or downwards
    spin button arrow areas, usually leading to an increase or decrease of
    spin button’s value.

    Params:
      spinner = valid GtkSpinButton widget.
      button = Number of the pointer button for the event, usually 1, 2 or 3.
      upwards = true for upwards arrow click, false for downwards arrow click.
    Returns: whether all actions neccessary for the button click simulation were carried out successfully.

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
bool testSpinButtonClick(gtk.spin_button.SpinButton spinner, uint button, bool upwards)
{
  bool _retval;
  _retval = cast(bool)gtk_test_spin_button_click(spinner ? cast(GtkSpinButton*)spinner._cPtr(No.Dup) : null, button, upwards);
  return _retval;
}

/**
    Retrive the text string of widget if it is a GtkLabel,
    GtkEditable (entry and text widgets) or GtkTextView.

    Params:
      widget = valid widget pointer.
    Returns: new 0-terminated C string, needs to be released with [glib.global.gfree].

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
string testTextGet(gtk.widget.Widget widget)
{
  char* _cretval;
  _cretval = gtk_test_text_get(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Set the text string of widget to string if it is a GtkLabel,
    GtkEditable (entry and text widgets) or GtkTextView.

    Params:
      widget = valid widget pointer.
      string_ = a 0-terminated C string

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
void testTextSet(gtk.widget.Widget widget, string string_)
{
  const(char)* _string_ = string_.toCString(No.Alloc);
  gtk_test_text_set(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _string_);
}

/**
    This function will generate a button click (button press and button
    release event) in the middle of the first GdkWindow found that belongs
    to widget.
    For windowless widgets like #GtkButton (which returns false from
    [gtk.widget.Widget.getHasWindow]), this will often be an
    input-only event window. For other widgets, this is usually widget->window.
    Certain caveats should be considered when using this function, in
    particular because the mouse pointer is warped to the button click
    location, see [gdk.global.testSimulateButton] for details.

    Params:
      widget = Widget to generate a button click on.
      button = Number of the pointer button for the event, usually 1, 2 or 3.
      modifiers = Keyboard modifiers the event is setup with.
    Returns: whether all actions neccessary for the button click simulation were carried out successfully.

    Deprecated: This testing infrastructure is phased out in favor of reftests.
*/
bool testWidgetClick(gtk.widget.Widget widget, uint button, gdk.types.ModifierType modifiers)
{
  bool _retval;
  _retval = cast(bool)gtk_test_widget_click(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, button, modifiers);
  return _retval;
}

/**
    This function will generate keyboard press and release events in
    the middle of the first GdkWindow found that belongs to widget.
    For windowless widgets like #GtkButton (which returns false from
    [gtk.widget.Widget.getHasWindow]), this will often be an
    input-only event window. For other widgets, this is usually widget->window.
    Certain caveats should be considered when using this function, in
    particular because the mouse pointer is warped to the key press
    location, see [gdk.global.testSimulateKey] for details.

    Params:
      widget = Widget to generate a key press and release on.
      keyval = A Gdk keyboard value.
      modifiers = Keyboard modifiers the event is setup with.
    Returns: whether all actions neccessary for the key event simulation were carried out successfully.
*/
bool testWidgetSendKey(gtk.widget.Widget widget, uint keyval, gdk.types.ModifierType modifiers)
{
  bool _retval;
  _retval = cast(bool)gtk_test_widget_send_key(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, keyval, modifiers);
  return _retval;
}

/**
    Enters the main loop and waits for widget to be “drawn”. In this
    context that means it waits for the frame clock of widget to have
    run a full styling, layout and drawing cycle.
    
    This function is intended to be used for syncing with actions that
    depend on widget relayouting or on interaction with the display
    server.

    Params:
      widget = the widget to wait for
*/
void testWidgetWaitForDraw(gtk.widget.Widget widget)
{
  gtk_test_widget_wait_for_draw(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
}

/**
    Obtains a tree_model and path from selection data of target type
    `GTK_TREE_MODEL_ROW`. Normally called from a drag_data_received handler.
    This function can only be used if selection_data originates from the same
    process that’s calling this function, because a pointer to the tree model
    is being passed around. If you aren’t in the same process, then you'll
    get memory corruption. In the #GtkTreeDragDest drag_data_received handler,
    you can assume that selection data of type `GTK_TREE_MODEL_ROW` is
    in from the current process. The returned path must be freed with
    [gtk.tree_path.TreePath.free].

    Params:
      selectionData = a #GtkSelectionData
      treeModel = a #GtkTreeModel
      path = row in tree_model
    Returns: true if selection_data had target type `GTK_TREE_MODEL_ROW` and
       is otherwise valid
*/
bool treeGetRowDragData(gtk.selection_data.SelectionData selectionData, out gtk.tree_model.TreeModel treeModel, out gtk.tree_path.TreePath path)
{
  bool _retval;
  GtkTreeModel* _treeModel;
  GtkTreePath* _path;
  _retval = cast(bool)gtk_tree_get_row_drag_data(selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, &_treeModel, &_path);
  treeModel = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(_treeModel, No.Take);
  path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
  return _retval;
}

/**
    Sets selection data of target type `GTK_TREE_MODEL_ROW`. Normally used
    in a drag_data_get handler.

    Params:
      selectionData = some #GtkSelectionData
      treeModel = a #GtkTreeModel
      path = a row in tree_model
    Returns: true if the #GtkSelectionData had the proper target type to allow us to set a tree row
*/
bool treeSetRowDragData(gtk.selection_data.SelectionData selectionData, gtk.tree_model.TreeModel treeModel, gtk.tree_path.TreePath path)
{
  bool _retval;
  _retval = cast(bool)gtk_tree_set_row_drag_data(selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, treeModel ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  return _retval;
}

/**
    All this function does it to return true.
    
    This can be useful for example if you want to inhibit the deletion
    of a window. Of course you should not do this as the user expects
    a reaction from clicking the close icon of the window...
    
    ## A persistent window
    
    ```c
    #include <gtk/gtk.h>
    
    int
    main (int argc, char **argv)
    {
      GtkWidget *win, *but;
      const char *text = "Close yourself. I mean it!";
    
      gtk_init (&argc, &argv);
    
      win = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      g_signal_connect (win,
                        "delete-event",
                        G_CALLBACK (gtk_true),
                        NULL);
      g_signal_connect (win, "destroy",
                        G_CALLBACK (gtk_main_quit),
                        NULL);
    
      but = gtk_button_new_with_label (text);
      g_signal_connect_swapped (but, "clicked",
                                G_CALLBACK (gtk_object_destroy),
                                win);
      gtk_container_add (GTK_CONTAINER (win), but);
    
      gtk_widget_show_all (win);
    
      gtk_main ();
    
      return 0;
    }
    ```
    Returns: true
*/
bool true_()
{
  bool _retval;
  _retval = cast(bool)gtk_true();
  return _retval;
}
