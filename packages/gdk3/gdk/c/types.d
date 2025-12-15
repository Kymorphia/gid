/// C types for gdk3 library
module gdk.c.types;

public import gid.basictypes;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import pango.c.types;
public import cairo.c.types;

/**
    Used to represent native events (XEvents for the X11
    backend, MSGs for Win32).
*/
alias GdkXEvent = void;

/**
    Positioning hints for aligning a window relative to a rectangle.
    
    These hints determine how the window should be positioned in the case that
    the window would fall off-screen if placed in its ideal position.
    
    For example, [gdk.types.AnchorHints.FlipX] will replace [gdk.types.Gravity.NorthWest] with
    [gdk.types.Gravity.NorthEast] and vice versa if the window extends beyond the left
    or right edges of the monitor.
    
    If [gdk.types.AnchorHints.SlideX] is set, the window can be shifted horizontally to fit
    on-screen. If [gdk.types.AnchorHints.ResizeX] is set, the window can be shrunken
    horizontally to fit.
    
    In general, when multiple flags are set, flipping should take precedence over
    sliding, which should take precedence over resizing.
*/
enum GdkAnchorHints : uint
{
  /**
      allow flipping anchors horizontally
  */
  FlipX = 1,

  /**
      allow flipping anchors vertically
  */
  FlipY = 2,

  /**
      allow sliding window horizontally
  */
  SlideX = 4,

  /**
      allow sliding window vertically
  */
  SlideY = 8,

  /**
      allow resizing window horizontally
  */
  ResizeX = 16,

  /**
      allow resizing window vertically
  */
  ResizeY = 32,

  /**
      allow flipping anchors on both axes
  */
  Flip = 3,

  /**
      allow sliding window on both axes
  */
  Slide = 12,

  /**
      allow resizing window on both axes
  */
  Resize = 48,
}

/**
    Flags describing the current capabilities of a device/tool.
*/
enum GdkAxisFlags : uint
{
  /**
      X axis is present
  */
  X = 2,

  /**
      Y axis is present
  */
  Y = 4,

  /**
      Pressure axis is present
  */
  Pressure = 8,

  /**
      X tilt axis is present
  */
  Xtilt = 16,

  /**
      Y tilt axis is present
  */
  Ytilt = 32,

  /**
      Wheel axis is present
  */
  Wheel = 64,

  /**
      Distance axis is present
  */
  Distance = 128,

  /**
      Z-axis rotation is present
  */
  Rotation = 256,

  /**
      Slider axis is present
  */
  Slider = 512,
}

/**
    An enumeration describing the way in which a device
    axis (valuator) maps onto the predefined valuator
    types that GTK+ understands.
    
    Note that the X and Y axes are not really needed; pointer devices
    report their location via the x/y members of events regardless. Whether
    X and Y are present as axes depends on the GDK backend.
*/
enum GdkAxisUse
{
  /**
      the axis is ignored.
  */
  Ignore = 0,

  /**
      the axis is used as the x axis.
  */
  X = 1,

  /**
      the axis is used as the y axis.
  */
  Y = 2,

  /**
      the axis is used for pressure information.
  */
  Pressure = 3,

  /**
      the axis is used for x tilt information.
  */
  Xtilt = 4,

  /**
      the axis is used for y tilt information.
  */
  Ytilt = 5,

  /**
      the axis is used for wheel information.
  */
  Wheel = 6,

  /**
      the axis is used for pen/tablet distance information. (Since: 3.22)
  */
  Distance = 7,

  /**
      the axis is used for pen rotation information. (Since: 3.22)
  */
  Rotation = 8,

  /**
      the axis is used for pen slider information. (Since: 3.22)
  */
  Slider = 9,

  /**
      a constant equal to the numerically highest axis value.
  */
  Last = 10,
}

/**
    A set of values describing the possible byte-orders
    for storing pixel values in memory.
*/
enum GdkByteOrder
{
  /**
      The values are stored with the least-significant byte
        first. For instance, the 32-bit value 0xffeecc would be stored
        in memory as 0xcc, 0xee, 0xff, 0x00.
  */
  LsbFirst = 0,

  /**
      The values are stored with the most-significant byte
        first. For instance, the 32-bit value 0xffeecc would be stored
        in memory as 0x00, 0xff, 0xee, 0xcc.
  */
  MsbFirst = 1,
}

/**
    Specifies the crossing mode for #GdkEventCrossing.
*/
enum GdkCrossingMode
{
  /**
      crossing because of pointer motion.
  */
  Normal = 0,

  /**
      crossing because a grab is activated.
  */
  Grab = 1,

  /**
      crossing because a grab is deactivated.
  */
  Ungrab = 2,

  /**
      crossing because a GTK+ grab is activated.
  */
  GtkGrab = 3,

  /**
      crossing because a GTK+ grab is deactivated.
  */
  GtkUngrab = 4,

  /**
      crossing because a GTK+ widget changed
        state (e.g. sensitivity).
  */
  StateChanged = 5,

  /**
      crossing because a touch sequence has begun,
        this event is synthetic as the pointer might have not left the window.
  */
  TouchBegin = 6,

  /**
      crossing because a touch sequence has ended,
        this event is synthetic as the pointer might have not left the window.
  */
  TouchEnd = 7,

  /**
      crossing because of a device switch (i.e.
        a mouse taking control of the pointer after a touch device), this event
        is synthetic as the pointer didn’t leave the window.
  */
  DeviceSwitch = 8,
}

/**
    Predefined cursors.
    
    Note that these IDs are directly taken from the X cursor font, and many
    of these cursors are either not useful, or are not available on other platforms.
    
    The recommended way to create cursors is to use [gdk.cursor.Cursor.newFromName].
*/
enum GdkCursorType
{
  /**
      ![](X_cursor.png)
  */
  XCursor = 0,

  /**
      ![](arrow.png)
  */
  Arrow = 2,

  /**
      ![](based_arrow_down.png)
  */
  BasedArrowDown = 4,

  /**
      ![](based_arrow_up.png)
  */
  BasedArrowUp = 6,

  /**
      ![](boat.png)
  */
  Boat = 8,

  /**
      ![](bogosity.png)
  */
  Bogosity = 10,

  /**
      ![](bottom_left_corner.png)
  */
  BottomLeftCorner = 12,

  /**
      ![](bottom_right_corner.png)
  */
  BottomRightCorner = 14,

  /**
      ![](bottom_side.png)
  */
  BottomSide = 16,

  /**
      ![](bottom_tee.png)
  */
  BottomTee = 18,

  /**
      ![](box_spiral.png)
  */
  BoxSpiral = 20,

  /**
      ![](center_ptr.png)
  */
  CenterPtr = 22,

  /**
      ![](circle.png)
  */
  Circle = 24,

  /**
      ![](clock.png)
  */
  Clock = 26,

  /**
      ![](coffee_mug.png)
  */
  CoffeeMug = 28,

  /**
      ![](cross.png)
  */
  Cross = 30,

  /**
      ![](cross_reverse.png)
  */
  CrossReverse = 32,

  /**
      ![](crosshair.png)
  */
  Crosshair = 34,

  /**
      ![](diamond_cross.png)
  */
  DiamondCross = 36,

  /**
      ![](dot.png)
  */
  Dot = 38,

  /**
      ![](dotbox.png)
  */
  Dotbox = 40,

  /**
      ![](double_arrow.png)
  */
  DoubleArrow = 42,

  /**
      ![](draft_large.png)
  */
  DraftLarge = 44,

  /**
      ![](draft_small.png)
  */
  DraftSmall = 46,

  /**
      ![](draped_box.png)
  */
  DrapedBox = 48,

  /**
      ![](exchange.png)
  */
  Exchange = 50,

  /**
      ![](fleur.png)
  */
  Fleur = 52,

  /**
      ![](gobbler.png)
  */
  Gobbler = 54,

  /**
      ![](gumby.png)
  */
  Gumby = 56,

  /**
      ![](hand1.png)
  */
  Hand1 = 58,

  /**
      ![](hand2.png)
  */
  Hand2 = 60,

  /**
      ![](heart.png)
  */
  Heart = 62,

  /**
      ![](icon.png)
  */
  Icon = 64,

  /**
      ![](iron_cross.png)
  */
  IronCross = 66,

  /**
      ![](left_ptr.png)
  */
  LeftPtr = 68,

  /**
      ![](left_side.png)
  */
  LeftSide = 70,

  /**
      ![](left_tee.png)
  */
  LeftTee = 72,

  /**
      ![](leftbutton.png)
  */
  Leftbutton = 74,

  /**
      ![](ll_angle.png)
  */
  LlAngle = 76,

  /**
      ![](lr_angle.png)
  */
  LrAngle = 78,

  /**
      ![](man.png)
  */
  Man = 80,

  /**
      ![](middlebutton.png)
  */
  Middlebutton = 82,

  /**
      ![](mouse.png)
  */
  Mouse = 84,

  /**
      ![](pencil.png)
  */
  Pencil = 86,

  /**
      ![](pirate.png)
  */
  Pirate = 88,

  /**
      ![](plus.png)
  */
  Plus = 90,

  /**
      ![](question_arrow.png)
  */
  QuestionArrow = 92,

  /**
      ![](right_ptr.png)
  */
  RightPtr = 94,

  /**
      ![](right_side.png)
  */
  RightSide = 96,

  /**
      ![](right_tee.png)
  */
  RightTee = 98,

  /**
      ![](rightbutton.png)
  */
  Rightbutton = 100,

  /**
      ![](rtl_logo.png)
  */
  RtlLogo = 102,

  /**
      ![](sailboat.png)
  */
  Sailboat = 104,

  /**
      ![](sb_down_arrow.png)
  */
  SbDownArrow = 106,

  /**
      ![](sb_h_double_arrow.png)
  */
  SbHDoubleArrow = 108,

  /**
      ![](sb_left_arrow.png)
  */
  SbLeftArrow = 110,

  /**
      ![](sb_right_arrow.png)
  */
  SbRightArrow = 112,

  /**
      ![](sb_up_arrow.png)
  */
  SbUpArrow = 114,

  /**
      ![](sb_v_double_arrow.png)
  */
  SbVDoubleArrow = 116,

  /**
      ![](shuttle.png)
  */
  Shuttle = 118,

  /**
      ![](sizing.png)
  */
  Sizing = 120,

  /**
      ![](spider.png)
  */
  Spider = 122,

  /**
      ![](spraycan.png)
  */
  Spraycan = 124,

  /**
      ![](star.png)
  */
  Star = 126,

  /**
      ![](target.png)
  */
  Target = 128,

  /**
      ![](tcross.png)
  */
  Tcross = 130,

  /**
      ![](top_left_arrow.png)
  */
  TopLeftArrow = 132,

  /**
      ![](top_left_corner.png)
  */
  TopLeftCorner = 134,

  /**
      ![](top_right_corner.png)
  */
  TopRightCorner = 136,

  /**
      ![](top_side.png)
  */
  TopSide = 138,

  /**
      ![](top_tee.png)
  */
  TopTee = 140,

  /**
      ![](trek.png)
  */
  Trek = 142,

  /**
      ![](ul_angle.png)
  */
  UlAngle = 144,

  /**
      ![](umbrella.png)
  */
  Umbrella = 146,

  /**
      ![](ur_angle.png)
  */
  UrAngle = 148,

  /**
      ![](watch.png)
  */
  Watch = 150,

  /**
      ![](xterm.png)
  */
  Xterm = 152,

  /**
      last cursor type
  */
  LastCursor = 153,

  /**
      Blank cursor. Since 2.16
  */
  BlankCursor = -2,

  /**
      type of cursors constructed with
        [gdk.cursor.Cursor.newFromPixbuf]
  */
  CursorIsPixmap = -1,
}

/**
    A pad feature.
*/
enum GdkDevicePadFeature
{
  /**
      a button
  */
  Button = 0,

  /**
      a ring-shaped interactive area
  */
  Ring = 1,

  /**
      a straight interactive area
  */
  Strip = 2,
}

/**
    Indicates the specific type of tool being used being a tablet. Such as an
    airbrush, pencil, etc.
*/
enum GdkDeviceToolType
{
  /**
      Tool is of an unknown type.
  */
  Unknown = 0,

  /**
      Tool is a standard tablet stylus.
  */
  Pen = 1,

  /**
      Tool is standard tablet eraser.
  */
  Eraser = 2,

  /**
      Tool is a brush stylus.
  */
  Brush = 3,

  /**
      Tool is a pencil stylus.
  */
  Pencil = 4,

  /**
      Tool is an airbrush stylus.
  */
  Airbrush = 5,

  /**
      Tool is a mouse.
  */
  Mouse = 6,

  /**
      Tool is a lens cursor.
  */
  Lens = 7,
}

/**
    Indicates the device type. See [above][GdkDeviceManager.description]
    for more information about the meaning of these device types.
*/
enum GdkDeviceType
{
  /**
      Device is a master (or virtual) device. There will
                               be an associated focus indicator on the screen.
  */
  Master = 0,

  /**
      Device is a slave (or physical) device.
  */
  Slave = 1,

  /**
      Device is a physical device, currently not attached to
                                 any virtual device.
  */
  Floating = 2,
}

/**
    Used in #GdkDragContext to indicate what the destination
    should do with the dropped data.
*/
enum GdkDragAction : uint
{
  /**
      Means nothing, and should not be used.
  */
  Default = 1,

  /**
      Copy the data.
  */
  Copy = 2,

  /**
      Move the data, i.e. first copy it, then delete
       it from the source using the DELETE target of the X selection protocol.
  */
  Move = 4,

  /**
      Add a link to the data. Note that this is only
       useful if source and destination agree on what it means.
  */
  Link = 8,

  /**
      Special action which tells the source that the
       destination will do something that the source doesn’t understand.
  */
  Private = 16,

  /**
      Ask the user what to do with the data.
  */
  Ask = 32,
}

/**
    Used in #GdkDragContext to the reason of a cancelled DND operation.
*/
enum GdkDragCancelReason
{
  /**
      There is no suitable drop target.
  */
  NoTarget = 0,

  /**
      Drag cancelled by the user
  */
  UserCancelled = 1,

  /**
      Unspecified error.
  */
  Error = 2,
}

/**
    Used in #GdkDragContext to indicate the protocol according to
    which DND is done.
*/
enum GdkDragProtocol
{
  /**
      no protocol.
  */
  None = 0,

  /**
      The Motif DND protocol. No longer supported
  */
  Motif = 1,

  /**
      The Xdnd protocol.
  */
  Xdnd = 2,

  /**
      An extension to the Xdnd protocol for
       unclaimed root window drops.
  */
  Rootwin = 3,

  /**
      The simple WM_DROPFILES protocol.
  */
  Win32Dropfiles = 4,

  /**
      The complex OLE2 DND protocol (not implemented).
  */
  Ole2 = 5,

  /**
      Intra-application DND.
  */
  Local = 6,

  /**
      Wayland DND protocol.
  */
  Wayland = 7,
}

/**
    A set of bit-flags to indicate which events a window is to receive.
    Most of these masks map onto one or more of the #GdkEventType event types
    above.
    
    See the [input handling overview][chap-input-handling] for details of
    [event masks][event-masks] and [event propagation][event-propagation].
    
    [gdk.types.EventMask.PointerMotionHintMask] is deprecated. It is a special mask
    to reduce the number of [gdk.types.EventType.MotionNotify] events received. When using
    [gdk.types.EventMask.PointerMotionHintMask], fewer [gdk.types.EventType.MotionNotify] events will
    be sent, some of which are marked as a hint (the is_hint member is
    true). To receive more motion events after a motion hint event,
    the application needs to asks for more, by calling
    [gdk.event.Event.requestMotions].
    
    Since GTK 3.8, motion events are already compressed by default, independent
    of this mechanism. This compression can be disabled with
    [gdk.window.Window.setEventCompression]. See the documentation of that function
    for details.
    
    If [gdk.types.EventMask.TouchMask] is enabled, the window will receive touch events
    from touch-enabled devices. Those will come as sequences of #GdkEventTouch
    with type [gdk.types.EventType.TouchUpdate], enclosed by two events with
    type [gdk.types.EventType.TouchBegin] and [gdk.types.EventType.TouchEnd] (or [gdk.types.EventType.TouchCancel]).
    [gdk.event.Event.getEventSequence] returns the event sequence for these
    events, so different sequences may be distinguished.
*/
enum GdkEventMask : uint
{
  /**
      receive expose events
  */
  ExposureMask = 2,

  /**
      receive all pointer motion events
  */
  PointerMotionMask = 4,

  /**
      deprecated. see the explanation above
  */
  PointerMotionHintMask = 8,

  /**
      receive pointer motion events while any button is pressed
  */
  ButtonMotionMask = 16,

  /**
      receive pointer motion events while 1 button is pressed
  */
  Button1MotionMask = 32,

  /**
      receive pointer motion events while 2 button is pressed
  */
  Button2MotionMask = 64,

  /**
      receive pointer motion events while 3 button is pressed
  */
  Button3MotionMask = 128,

  /**
      receive button press events
  */
  ButtonPressMask = 256,

  /**
      receive button release events
  */
  ButtonReleaseMask = 512,

  /**
      receive key press events
  */
  KeyPressMask = 1024,

  /**
      receive key release events
  */
  KeyReleaseMask = 2048,

  /**
      receive window enter events
  */
  EnterNotifyMask = 4096,

  /**
      receive window leave events
  */
  LeaveNotifyMask = 8192,

  /**
      receive focus change events
  */
  FocusChangeMask = 16384,

  /**
      receive events about window configuration change
  */
  StructureMask = 32768,

  /**
      receive property change events
  */
  PropertyChangeMask = 65536,

  /**
      receive visibility change events
  */
  VisibilityNotifyMask = 131072,

  /**
      receive proximity in events
  */
  ProximityInMask = 262144,

  /**
      receive proximity out events
  */
  ProximityOutMask = 524288,

  /**
      receive events about window configuration changes of
        child windows
  */
  SubstructureMask = 1048576,

  /**
      receive scroll events
  */
  ScrollMask = 2097152,

  /**
      receive touch events. Since 3.4
  */
  TouchMask = 4194304,

  /**
      receive smooth scrolling events. Since 3.4
  */
  SmoothScrollMask = 8388608,

  /**
      receive touchpad gesture events. Since 3.18
  */
  TouchpadGestureMask = 16777216,

  /**
      receive tablet pad events. Since 3.22
  */
  TabletPadMask = 33554432,

  /**
      the combination of all the above event masks.
  */
  AllEventsMask = 67108862,
}

/**
    Specifies the type of the event.
    
    Do not confuse these events with the signals that GTK+ widgets emit.
    Although many of these events result in corresponding signals being emitted,
    the events are often transformed or filtered along the way.
    
    In some language bindings, the values [gdk.types.EventType._2buttonPress] and
    [gdk.types.EventType._3buttonPress] would translate into something syntactically
    invalid (eg `Gdk.EventType.2ButtonPress`, where a
    symbol is not allowed to start with a number). In that case, the
    aliases [gdk.types.EventType.DoubleButtonPress] and [gdk.types.EventType.TripleButtonPress] can
    be used instead.
*/
enum GdkEventType
{
  /**
      a special code to indicate a null event.
  */
  Nothing = -1,

  /**
      the window manager has requested that the toplevel window be
        hidden or destroyed, usually when the user clicks on a special icon in the
        title bar.
  */
  Delete = 0,

  /**
      the window has been destroyed.
  */
  Destroy = 1,

  /**
      all or part of the window has become visible and needs to be
        redrawn.
  */
  Expose = 2,

  /**
      the pointer (usually a mouse) has moved.
  */
  MotionNotify = 3,

  /**
      a mouse button has been pressed.
  */
  ButtonPress = 4,

  /**
      a mouse button has been double-clicked (clicked twice
        within a short period of time). Note that each click also generates a
        [gdk.types.EventType.ButtonPress] event.
  */
  _2buttonPress = 5,

  /**
      alias for [gdk.types.EventType._2buttonPress], added in 3.6.
  */
  DoubleButtonPress = 5,

  /**
      a mouse button has been clicked 3 times in a short period
        of time. Note that each click also generates a [gdk.types.EventType.ButtonPress] event.
  */
  _3buttonPress = 6,

  /**
      alias for [gdk.types.EventType._3buttonPress], added in 3.6.
  */
  TripleButtonPress = 6,

  /**
      a mouse button has been released.
  */
  ButtonRelease = 7,

  /**
      a key has been pressed.
  */
  KeyPress = 8,

  /**
      a key has been released.
  */
  KeyRelease = 9,

  /**
      the pointer has entered the window.
  */
  EnterNotify = 10,

  /**
      the pointer has left the window.
  */
  LeaveNotify = 11,

  /**
      the keyboard focus has entered or left the window.
  */
  FocusChange = 12,

  /**
      the size, position or stacking order of the window has changed.
        Note that GTK+ discards these events for [gdk.types.WindowType.Child] windows.
  */
  Configure = 13,

  /**
      the window has been mapped.
  */
  Map = 14,

  /**
      the window has been unmapped.
  */
  Unmap = 15,

  /**
      a property on the window has been changed or deleted.
  */
  PropertyNotify = 16,

  /**
      the application has lost ownership of a selection.
  */
  SelectionClear = 17,

  /**
      another application has requested a selection.
  */
  SelectionRequest = 18,

  /**
      a selection has been received.
  */
  SelectionNotify = 19,

  /**
      an input device has moved into contact with a sensing
        surface (e.g. a touchscreen or graphics tablet).
  */
  ProximityIn = 20,

  /**
      an input device has moved out of contact with a sensing
        surface.
  */
  ProximityOut = 21,

  /**
      the mouse has entered the window while a drag is in progress.
  */
  DragEnter = 22,

  /**
      the mouse has left the window while a drag is in progress.
  */
  DragLeave = 23,

  /**
      the mouse has moved in the window while a drag is in
        progress.
  */
  DragMotion = 24,

  /**
      the status of the drag operation initiated by the window
        has changed.
  */
  DragStatus = 25,

  /**
      a drop operation onto the window has started.
  */
  DropStart = 26,

  /**
      the drop operation initiated by the window has completed.
  */
  DropFinished = 27,

  /**
      a message has been received from another application.
  */
  ClientEvent = 28,

  /**
      the window visibility status has changed.
  */
  VisibilityNotify = 29,

  /**
      the scroll wheel was turned
  */
  Scroll = 31,

  /**
      the state of a window has changed. See #GdkWindowState
        for the possible window states
  */
  WindowState = 32,

  /**
      a setting has been modified.
  */
  Setting = 33,

  /**
      the owner of a selection has changed. This event type
        was added in 2.6
  */
  OwnerChange = 34,

  /**
      a pointer or keyboard grab was broken. This event type
        was added in 2.8.
  */
  GrabBroken = 35,

  /**
      the content of the window has been changed. This event type
        was added in 2.14.
  */
  Damage = 36,

  /**
      A new touch event sequence has just started. This event
        type was added in 3.4.
  */
  TouchBegin = 37,

  /**
      A touch event sequence has been updated. This event type
        was added in 3.4.
  */
  TouchUpdate = 38,

  /**
      A touch event sequence has finished. This event type
        was added in 3.4.
  */
  TouchEnd = 39,

  /**
      A touch event sequence has been canceled. This event type
        was added in 3.4.
  */
  TouchCancel = 40,

  /**
      A touchpad swipe gesture event, the current state
        is determined by its phase field. This event type was added in 3.18.
  */
  TouchpadSwipe = 41,

  /**
      A touchpad pinch gesture event, the current state
        is determined by its phase field. This event type was added in 3.18.
  */
  TouchpadPinch = 42,

  /**
      A tablet pad button press event. This event type
        was added in 3.22.
  */
  PadButtonPress = 43,

  /**
      A tablet pad button release event. This event type
        was added in 3.22.
  */
  PadButtonRelease = 44,

  /**
      A tablet pad axis event from a "ring". This event type was
        added in 3.22.
  */
  PadRing = 45,

  /**
      A tablet pad axis event from a "strip". This event type was
        added in 3.22.
  */
  PadStrip = 46,

  /**
      A tablet pad group mode change. This event type was
        added in 3.22.
  */
  PadGroupMode = 47,

  /**
      marks the end of the GdkEventType enumeration. Added in 2.18
  */
  EventLast = 48,
}

/**
    Specifies the result of applying a #GdkFilterFunc to a native event.
*/
enum GdkFilterReturn
{
  /**
      event not handled, continue processing.
  */
  Continue = 0,

  /**
      native event translated into a GDK event and stored
       in the `event` structure that was passed in.
  */
  Translate = 1,

  /**
      event handled, terminate processing.
  */
  Remove = 2,
}

/**
    #GdkFrameClockPhase is used to represent the different paint clock
    phases that can be requested. The elements of the enumeration
    correspond to the signals of #GdkFrameClock.
*/
enum GdkFrameClockPhase : uint
{
  /**
      no phase
  */
  None = 0,

  /**
      corresponds to GdkFrameClock::flush-events. Should not be handled by applications.
  */
  FlushEvents = 1,

  /**
      corresponds to GdkFrameClock::before-paint. Should not be handled by applications.
  */
  BeforePaint = 2,

  /**
      corresponds to GdkFrameClock::update.
  */
  Update = 4,

  /**
      corresponds to GdkFrameClock::layout.
  */
  Layout = 8,

  /**
      corresponds to GdkFrameClock::paint.
  */
  Paint = 16,

  /**
      corresponds to GdkFrameClock::resume-events. Should not be handled by applications.
  */
  ResumeEvents = 32,

  /**
      corresponds to GdkFrameClock::after-paint. Should not be handled by applications.
  */
  AfterPaint = 64,
}

/**
    Indicates which monitor (in a multi-head setup) a window should span over
    when in fullscreen mode.
*/
enum GdkFullscreenMode
{
  /**
      Fullscreen on current monitor only.
  */
  CurrentMonitor = 0,

  /**
      Span across all monitors when fullscreen.
  */
  AllMonitors = 1,
}

/**
    Error enumeration for #GdkGLContext.
*/
enum GdkGLError
{
  /**
      OpenGL support is not available
  */
  NotAvailable = 0,

  /**
      The requested visual format is not supported
  */
  UnsupportedFormat = 1,

  /**
      The requested profile is not supported
  */
  UnsupportedProfile = 2,
}

/**
    Defines how device grabs interact with other devices.
*/
enum GdkGrabOwnership
{
  /**
      All other devices’ events are allowed.
  */
  None = 0,

  /**
      Other devices’ events are blocked for the grab window.
  */
  Window = 1,

  /**
      Other devices’ events are blocked for the whole application.
  */
  Application = 2,
}

/**
    Returned by [gdk.device.Device.grab], [gdk.global.pointerGrab] and [gdk.global.keyboardGrab] to
    indicate success or the reason for the failure of the grab attempt.
*/
enum GdkGrabStatus
{
  /**
      the resource was successfully grabbed.
  */
  Success = 0,

  /**
      the resource is actively grabbed by another client.
  */
  AlreadyGrabbed = 1,

  /**
      the resource was grabbed more recently than the
       specified time.
  */
  InvalidTime = 2,

  /**
      the grab window or the @confine_to window are not
       viewable.
  */
  NotViewable = 3,

  /**
      the resource is frozen by an active grab of another client.
  */
  Frozen = 4,

  /**
      the grab failed for some other reason. Since 3.16
  */
  Failed = 5,
}

/**
    Defines the reference point of a window and the meaning of coordinates
    passed to [gtk.window.Window.move]. See [gtk.window.Window.move] and the "implementation
    notes" section of the
    [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
    specification for more details.
*/
enum GdkGravity
{
  /**
      the reference point is at the top left corner.
  */
  NorthWest = 1,

  /**
      the reference point is in the middle of the top edge.
  */
  North = 2,

  /**
      the reference point is at the top right corner.
  */
  NorthEast = 3,

  /**
      the reference point is at the middle of the left edge.
  */
  West = 4,

  /**
      the reference point is at the center of the window.
  */
  Center = 5,

  /**
      the reference point is at the middle of the right edge.
  */
  East = 6,

  /**
      the reference point is at the lower left corner.
  */
  SouthWest = 7,

  /**
      the reference point is at the middle of the lower edge.
  */
  South = 8,

  /**
      the reference point is at the lower right corner.
  */
  SouthEast = 9,

  /**
      the reference point is at the top left corner of the
       window itself, ignoring window manager decorations.
  */
  Static = 10,
}

/**
    An enumeration that describes the mode of an input device.
*/
enum GdkInputMode
{
  /**
      the device is disabled and will not report any events.
  */
  Disabled = 0,

  /**
      the device is enabled. The device’s coordinate space
                        maps to the entire screen.
  */
  Screen = 1,

  /**
      the device is enabled. The device’s coordinate space
                        is mapped to a single window. The manner in which this window
                        is chosen is undefined, but it will typically be the same
                        way in which the focus window for key events is determined.
  */
  Window = 2,
}

/**
    An enumeration describing the type of an input device in general terms.
*/
enum GdkInputSource
{
  /**
      the device is a mouse. (This will be reported for the core
                         pointer, even if it is something else, such as a trackball.)
  */
  Mouse = 0,

  /**
      the device is a stylus of a graphics tablet or similar device.
  */
  Pen = 1,

  /**
      the device is an eraser. Typically, this would be the other end
                          of a stylus on a graphics tablet.
  */
  Eraser = 2,

  /**
      the device is a graphics tablet “puck” or similar device.
  */
  Cursor = 3,

  /**
      the device is a keyboard.
  */
  Keyboard = 4,

  /**
      the device is a direct-input touch device, such
          as a touchscreen or tablet. This device type has been added in 3.4.
  */
  Touchscreen = 5,

  /**
      the device is an indirect touch device, such
          as a touchpad. This device type has been added in 3.4.
  */
  Touchpad = 6,

  /**
      the device is a trackpoint. This device type has been
          added in 3.22
  */
  Trackpoint = 7,

  /**
      the device is a "pad", a collection of buttons,
          rings and strips found in drawing tablets. This device type has been
          added in 3.22.
  */
  TabletPad = 8,
}

/**
    This enum is used with [gdk.keymap.Keymap.getModifierMask]
    in order to determine what modifiers the
    currently used windowing system backend uses for particular
    purposes. For example, on X11/Windows, the Control key is used for
    invoking menu shortcuts (accelerators), whereas on Apple computers
    it’s the Command key (which correspond to [gdk.types.ModifierType.ControlMask] and
    [gdk.types.ModifierType.Mod2Mask], respectively).
*/
enum GdkModifierIntent
{
  /**
      the primary modifier used to invoke
       menu accelerators.
  */
  PrimaryAccelerator = 0,

  /**
      the modifier used to invoke context menus.
       Note that mouse button 3 always triggers context menus. When this modifier
       is not 0, it additionally triggers context menus when used with mouse button 1.
  */
  ContextMenu = 1,

  /**
      the modifier used to extend selections
       using `modifier`-click or `modifier`-cursor-key
  */
  ExtendSelection = 2,

  /**
      the modifier used to modify selections,
       which in most cases means toggling the clicked item into or out of the selection.
  */
  ModifySelection = 3,

  /**
      when any of these modifiers is pressed, the
       key event cannot produce a symbol directly. This is meant to be used for
       input methods, and for use cases like typeahead search.
  */
  NoTextInput = 4,

  /**
      the modifier that switches between keyboard
       groups (AltGr on X11/Windows and Option/Alt on OS X).
  */
  ShiftGroup = 5,

  /**
      The set of modifier masks accepted
      as modifiers in accelerators. Needed because Command is mapped to MOD2 on
      OSX, which is widely used, but on X11 MOD2 is NumLock and using that for a
      mod key is problematic at best.
      Ref: https://bugzilla.gnome.org/show_bug.cgi?id=736125.
  */
  DefaultModMask = 6,
}

/**
    A set of bit-flags to indicate the state of modifier keys and mouse buttons
    in various event types. Typical modifier keys are Shift, Control, Meta,
    Super, Hyper, Alt, Compose, Apple, CapsLock or ShiftLock.
    
    Like the X Window System, GDK supports 8 modifier keys and 5 mouse buttons.
    
    Since 2.10, GDK recognizes which of the Meta, Super or Hyper keys are mapped
    to Mod2 - Mod5, and indicates this by setting [gdk.types.ModifierType.SuperMask],
    [gdk.types.ModifierType.HyperMask] or [gdk.types.ModifierType.MetaMask] in the state field of key events.
    
    Note that GDK may add internal values to events which include
    reserved values such as [gdk.types.ModifierType.ModifierReserved13Mask].  Your code
    should preserve and ignore them.  You can use [gdk.types.ModifierType.ModifierMask] to
    remove all reserved values.
    
    Also note that the GDK X backend interprets button press events for button
    4-7 as scroll events, so [gdk.types.ModifierType.Button4Mask] and [gdk.types.ModifierType.Button5Mask] will never
    be set.
*/
enum GdkModifierType : uint
{
  /**
      the Shift key.
  */
  ShiftMask = 1,

  /**
      a Lock key (depending on the modifier mapping of the
       X server this may either be CapsLock or ShiftLock).
  */
  LockMask = 2,

  /**
      the Control key.
  */
  ControlMask = 4,

  /**
      the fourth modifier key (it depends on the modifier
       mapping of the X server which key is interpreted as this modifier, but
       normally it is the Alt key).
  */
  Mod1Mask = 8,

  /**
      the fifth modifier key (it depends on the modifier
       mapping of the X server which key is interpreted as this modifier).
  */
  Mod2Mask = 16,

  /**
      the sixth modifier key (it depends on the modifier
       mapping of the X server which key is interpreted as this modifier).
  */
  Mod3Mask = 32,

  /**
      the seventh modifier key (it depends on the modifier
       mapping of the X server which key is interpreted as this modifier).
  */
  Mod4Mask = 64,

  /**
      the eighth modifier key (it depends on the modifier
       mapping of the X server which key is interpreted as this modifier).
  */
  Mod5Mask = 128,

  /**
      the first mouse button.
  */
  Button1Mask = 256,

  /**
      the second mouse button.
  */
  Button2Mask = 512,

  /**
      the third mouse button.
  */
  Button3Mask = 1024,

  /**
      the fourth mouse button.
  */
  Button4Mask = 2048,

  /**
      the fifth mouse button.
  */
  Button5Mask = 4096,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved13Mask = 8192,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved14Mask = 16384,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved15Mask = 32768,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved16Mask = 65536,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved17Mask = 131072,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved18Mask = 262144,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved19Mask = 524288,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved20Mask = 1048576,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved21Mask = 2097152,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved22Mask = 4194304,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved23Mask = 8388608,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved24Mask = 16777216,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved25Mask = 33554432,

  /**
      the Super modifier. Since 2.10
  */
  SuperMask = 67108864,

  /**
      the Hyper modifier. Since 2.10
  */
  HyperMask = 134217728,

  /**
      the Meta modifier. Since 2.10
  */
  MetaMask = 268435456,

  /**
      A reserved bit flag; do not use in your own code
  */
  ModifierReserved29Mask = 536870912,

  /**
      not used in GDK itself. GTK+ uses it to differentiate
       between (keyval, modifiers) pairs from key press and release events.
  */
  ReleaseMask = 1073741824,

  /**
      a mask covering all modifier types.
  */
  ModifierMask = 1543512063,
}

/**
    Specifies the kind of crossing for #GdkEventCrossing.
    
    See the X11 protocol specification of LeaveNotify for
    full details of crossing event generation.
*/
enum GdkNotifyType
{
  /**
      the window is entered from an ancestor or
        left towards an ancestor.
  */
  Ancestor = 0,

  /**
      the pointer moves between an ancestor and an
        inferior of the window.
  */
  Virtual = 1,

  /**
      the window is entered from an inferior or
        left towards an inferior.
  */
  Inferior = 2,

  /**
      the window is entered from or left towards
        a window which is neither an ancestor nor an inferior.
  */
  Nonlinear = 3,

  /**
      the pointer moves between two windows
        which are not ancestors of each other and the window is part of
        the ancestor chain between one of these windows and their least
        common ancestor.
  */
  NonlinearVirtual = 4,

  /**
      an unknown type of enter/leave event occurred.
  */
  Unknown = 5,
}

/**
    Specifies why a selection ownership was changed.
*/
enum GdkOwnerChange
{
  /**
      some other app claimed the ownership
  */
  NewOwner = 0,

  /**
      the window was destroyed
  */
  Destroy = 1,

  /**
      the client was closed
  */
  Close = 2,
}

/**
    Describes how existing data is combined with new data when
    using [gdk.global.propertyChange].
*/
enum GdkPropMode
{
  /**
      the new data replaces the existing data.
  */
  Replace = 0,

  /**
      the new data is prepended to the existing data.
  */
  Prepend = 1,

  /**
      the new data is appended to the existing data.
  */
  Append = 2,
}

/**
    Specifies the type of a property change for a #GdkEventProperty.
*/
enum GdkPropertyState
{
  /**
      the property value was changed.
  */
  NewValue = 0,

  /**
      the property was deleted.
  */
  Delete = 1,
}

/**
    Specifies the direction for #GdkEventScroll.
*/
enum GdkScrollDirection
{
  /**
      the window is scrolled up.
  */
  Up = 0,

  /**
      the window is scrolled down.
  */
  Down = 1,

  /**
      the window is scrolled to the left.
  */
  Left = 2,

  /**
      the window is scrolled to the right.
  */
  Right = 3,

  /**
      the scrolling is determined by the delta values
        in #GdkEventScroll. See [gdk.event.Event.getScrollDeltas]. Since: 3.4
  */
  Smooth = 4,
}

/**
    Flags describing the seat capabilities.
*/
enum GdkSeatCapabilities : uint
{
  /**
      No input capabilities
  */
  None = 0,

  /**
      The seat has a pointer (e.g. mouse)
  */
  Pointer = 1,

  /**
      The seat has touchscreen(s) attached
  */
  Touch = 2,

  /**
      The seat has drawing tablet(s) attached
  */
  TabletStylus = 4,

  /**
      The seat has keyboard(s) attached
  */
  Keyboard = 8,

  /**
      The union of all pointing capabilities
  */
  AllPointing = 7,

  /**
      The union of all capabilities
  */
  All = 15,
}

/**
    Specifies the kind of modification applied to a setting in a
    #GdkEventSetting.
*/
enum GdkSettingAction
{
  /**
      a setting was added.
  */
  New = 0,

  /**
      a setting was changed.
  */
  Changed = 1,

  /**
      a setting was deleted.
  */
  Deleted = 2,
}

/** */
enum GdkStatus
{
  /** */
  Ok = 0,

  /** */
  Error = -1,

  /** */
  ErrorParam = -2,

  /** */
  ErrorFile = -3,

  /** */
  ErrorMem = -4,
}

/**
    This enumeration describes how the red, green and blue components
    of physical pixels on an output device are laid out.
*/
enum GdkSubpixelLayout
{
  /**
      The layout is not known
  */
  Unknown = 0,

  /**
      Not organized in this way
  */
  None = 1,

  /**
      The layout is horizontal, the order is RGB
  */
  HorizontalRgb = 2,

  /**
      The layout is horizontal, the order is BGR
  */
  HorizontalBgr = 3,

  /**
      The layout is vertical, the order is RGB
  */
  VerticalRgb = 4,

  /**
      The layout is vertical, the order is BGR
  */
  VerticalBgr = 5,
}

/**
    Specifies the current state of a touchpad gesture. All gestures are
    guaranteed to begin with an event with phase [gdk.types.TouchpadGesturePhase.Begin],
    followed by 0 or several events with phase [gdk.types.TouchpadGesturePhase.Update].
    
    A finished gesture may have 2 possible outcomes, an event with phase
    [gdk.types.TouchpadGesturePhase.End] will be emitted when the gesture is
    considered successful, this should be used as the hint to perform any
    permanent changes.
    
    Cancelled gestures may be so for a variety of reasons, due to hardware
    or the compositor, or due to the gesture recognition layers hinting the
    gesture did not finish resolutely (eg. a 3rd finger being added during
    a pinch gesture). In these cases, the last event will report the phase
    [gdk.types.TouchpadGesturePhase.Cancel], this should be used as a hint
    to undo any visible/permanent changes that were done throughout the
    progress of the gesture.
    
    See also #GdkEventTouchpadSwipe and #GdkEventTouchpadPinch.
*/
enum GdkTouchpadGesturePhase
{
  /**
      The gesture has begun.
  */
  Begin = 0,

  /**
      The gesture has been updated.
  */
  Update = 1,

  /**
      The gesture was finished, changes
        should be permanently applied.
  */
  End = 2,

  /**
      The gesture was cancelled, all
        changes should be undone.
  */
  Cancel = 3,
}

/**
    Specifies the visiblity status of a window for a #GdkEventVisibility.
*/
enum GdkVisibilityState
{
  /**
      the window is completely visible.
  */
  Unobscured = 0,

  /**
      the window is partially visible.
  */
  Partial = 1,

  /**
      the window is not visible at all.
  */
  FullyObscured = 2,
}

/**
    A set of values that describe the manner in which the pixel values
    for a visual are converted into RGB values for display.
*/
enum GdkVisualType
{
  /**
      Each pixel value indexes a grayscale value
          directly.
  */
  StaticGray = 0,

  /**
      Each pixel is an index into a color map that
          maps pixel values into grayscale values. The color map can be
          changed by an application.
  */
  Grayscale = 1,

  /**
      Each pixel value is an index into a predefined,
          unmodifiable color map that maps pixel values into RGB values.
  */
  StaticColor = 2,

  /**
      Each pixel is an index into a color map that
          maps pixel values into rgb values. The color map can be changed by
          an application.
  */
  PseudoColor = 3,

  /**
      Each pixel value directly contains red, green,
          and blue components. Use [gdk.visual.Visual.getRedPixelDetails], etc,
          to obtain information about how the components are assembled into
          a pixel value.
  */
  TrueColor = 4,

  /**
      Each pixel value contains red, green, and blue
          components as for [gdk.types.VisualType.TrueColor], but the components are
          mapped via a color table into the final output table instead of
          being converted directly.
  */
  DirectColor = 5,
}

/**
    These are hints originally defined by the Motif toolkit.
    The window manager can use them when determining how to decorate
    the window. The hint must be set before mapping the window.
*/
enum GdkWMDecoration : uint
{
  /**
      all decorations should be applied.
  */
  All = 1,

  /**
      a frame should be drawn around the window.
  */
  Border = 2,

  /**
      the frame should have resize handles.
  */
  Resizeh = 4,

  /**
      a titlebar should be placed above the window.
  */
  Title = 8,

  /**
      a button for opening a menu should be included.
  */
  Menu = 16,

  /**
      a minimize button should be included.
  */
  Minimize = 32,

  /**
      a maximize button should be included.
  */
  Maximize = 64,
}

/**
    These are hints originally defined by the Motif toolkit. The window manager
    can use them when determining the functions to offer for the window. The
    hint must be set before mapping the window.
*/
enum GdkWMFunction : uint
{
  /**
      all functions should be offered.
  */
  All = 1,

  /**
      the window should be resizable.
  */
  Resize = 2,

  /**
      the window should be movable.
  */
  Move = 4,

  /**
      the window should be minimizable.
  */
  Minimize = 8,

  /**
      the window should be maximizable.
  */
  Maximize = 16,

  /**
      the window should be closable.
  */
  Close = 32,
}

/**
    Used to indicate which fields in the #GdkWindowAttr struct should be honored.
    For example, if you filled in the “cursor” and “x” fields of #GdkWindowAttr,
    pass “@GDK_WA_X | @GDK_WA_CURSOR” to [gdk.window.Window.new_]. Fields in
    #GdkWindowAttr not covered by a bit in this enum are required; for example,
    the @width/@height, @wclass, and @window_type fields are required, they have
    no corresponding flag in #GdkWindowAttributesType.
*/
enum GdkWindowAttributesType : uint
{
  /**
      Honor the title field
  */
  Title = 2,

  /**
      Honor the X coordinate field
  */
  X = 4,

  /**
      Honor the Y coordinate field
  */
  Y = 8,

  /**
      Honor the cursor field
  */
  Cursor = 16,

  /**
      Honor the visual field
  */
  Visual = 32,

  /**
      Honor the wmclass_class and wmclass_name fields
  */
  Wmclass = 64,

  /**
      Honor the override_redirect field
  */
  Noredir = 128,

  /**
      Honor the type_hint field
  */
  TypeHint = 256,
}

/**
    Determines a window edge or corner.
*/
enum GdkWindowEdge
{
  /**
      the top left corner.
  */
  NorthWest = 0,

  /**
      the top edge.
  */
  North = 1,

  /**
      the top right corner.
  */
  NorthEast = 2,

  /**
      the left edge.
  */
  West = 3,

  /**
      the right edge.
  */
  East = 4,

  /**
      the lower left corner.
  */
  SouthWest = 5,

  /**
      the lower edge.
  */
  South = 6,

  /**
      the lower right corner.
  */
  SouthEast = 7,
}

/**
    Used to indicate which fields of a #GdkGeometry struct should be paid
    attention to. Also, the presence/absence of @GDK_HINT_POS,
    @GDK_HINT_USER_POS, and @GDK_HINT_USER_SIZE is significant, though they don't
    directly refer to #GdkGeometry fields. @GDK_HINT_USER_POS will be set
    automatically by #GtkWindow if you call [gtk.window.Window.move].
    @GDK_HINT_USER_POS and @GDK_HINT_USER_SIZE should be set if the user
    specified a size/position using a --geometry command-line argument;
    [gtk.window.Window.parseGeometry] automatically sets these flags.
*/
enum GdkWindowHints : uint
{
  /**
      indicates that the program has positioned the window
  */
  Pos = 1,

  /**
      min size fields are set
  */
  MinSize = 2,

  /**
      max size fields are set
  */
  MaxSize = 4,

  /**
      base size fields are set
  */
  BaseSize = 8,

  /**
      aspect ratio fields are set
  */
  Aspect = 16,

  /**
      resize increment fields are set
  */
  ResizeInc = 32,

  /**
      window gravity field is set
  */
  WinGravity = 64,

  /**
      indicates that the window’s position was explicitly set
       by the user
  */
  UserPos = 128,

  /**
      indicates that the window’s size was explicitly set by
       the user
  */
  UserSize = 256,
}

/**
    Specifies the state of a toplevel window.
*/
enum GdkWindowState : uint
{
  /**
      the window is not shown.
  */
  Withdrawn = 1,

  /**
      the window is minimized.
  */
  Iconified = 2,

  /**
      the window is maximized.
  */
  Maximized = 4,

  /**
      the window is sticky.
  */
  Sticky = 8,

  /**
      the window is maximized without
        decorations.
  */
  Fullscreen = 16,

  /**
      the window is kept above other windows.
  */
  Above = 32,

  /**
      the window is kept below other windows.
  */
  Below = 64,

  /**
      the window is presented as focused (with active decorations).
  */
  Focused = 128,

  /**
      the window is in a tiled state, Since 3.10. Since 3.22.23, this
                               is deprecated in favor of per-edge information.
  */
  Tiled = 256,

  /**
      whether the top edge is tiled, Since 3.22.23
  */
  TopTiled = 512,

  /**
      whether the top edge is resizable, Since 3.22.23
  */
  TopResizable = 1024,

  /**
      whether the right edge is tiled, Since 3.22.23
  */
  RightTiled = 2048,

  /**
      whether the right edge is resizable, Since 3.22.23
  */
  RightResizable = 4096,

  /**
      whether the bottom edge is tiled, Since 3.22.23
  */
  BottomTiled = 8192,

  /**
      whether the bottom edge is resizable, Since 3.22.23
  */
  BottomResizable = 16384,

  /**
      whether the left edge is tiled, Since 3.22.23
  */
  LeftTiled = 32768,

  /**
      whether the left edge is resizable, Since 3.22.23
  */
  LeftResizable = 65536,
}

/**
    Describes the kind of window.
*/
enum GdkWindowType
{
  /**
      root window; this window has no parent, covers the entire
       screen, and is created by the window system
  */
  Root = 0,

  /**
      toplevel window (used to implement #GtkWindow)
  */
  Toplevel = 1,

  /**
      child window (used to implement e.g. #GtkEntry)
  */
  Child = 2,

  /**
      override redirect temporary window (used to implement
       #GtkMenu)
  */
  Temp = 3,

  /**
      foreign window (see gdk_window_foreign_new())
  */
  Foreign = 4,

  /**
      offscreen window (see
       [Offscreen Windows][OFFSCREEN-WINDOWS]). Since 2.18
  */
  Offscreen = 5,

  /**
      subsurface-based window; This window is visually
       tied to a toplevel, and is moved/stacked with it. Currently this window
       type is only implemented in Wayland. Since 3.14
  */
  Subsurface = 6,
}

/**
    These are hints for the window manager that indicate what type of function
    the window has. The window manager can use this when determining decoration
    and behaviour of the window. The hint must be set before mapping the window.
    
    See the [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
    specification for more details about window types.
*/
enum GdkWindowTypeHint
{
  /**
      Normal toplevel window.
  */
  Normal = 0,

  /**
      Dialog window.
  */
  Dialog = 1,

  /**
      Window used to implement a menu; GTK+ uses
       this hint only for torn-off menus, see #GtkTearoffMenuItem.
  */
  Menu = 2,

  /**
      Window used to implement toolbars.
  */
  Toolbar = 3,

  /**
      Window used to display a splash
       screen during application startup.
  */
  Splashscreen = 4,

  /**
      Utility windows which are not detached
       toolbars or dialogs.
  */
  Utility = 5,

  /**
      Used for creating dock or panel windows.
  */
  Dock = 6,

  /**
      Used for creating the desktop background
       window.
  */
  Desktop = 7,

  /**
      A menu that belongs to a menubar.
  */
  DropdownMenu = 8,

  /**
      A menu that does not belong to a menubar,
       e.g. a context menu.
  */
  PopupMenu = 9,

  /**
      A tooltip.
  */
  Tooltip = 10,

  /**
      A notification - typically a “bubble”
       that belongs to a status icon.
  */
  Notification = 11,

  /**
      A popup from a combo box.
  */
  Combo = 12,

  /**
      A window that is used to implement a DND cursor.
  */
  Dnd = 13,
}

/**
    @GDK_INPUT_OUTPUT windows are the standard kind of window you might expect.
    Such windows receive events and are also displayed on screen.
    @GDK_INPUT_ONLY windows are invisible; they are usually placed above other
    windows in order to trap or filter the events. You can’t draw on
    @GDK_INPUT_ONLY windows.
*/
enum GdkWindowWindowClass
{
  /**
      window for graphics and events
  */
  InputOutput = 0,

  /**
      window for events only
  */
  InputOnly = 1,
}

/**
    GdkAppLaunchContext is an implementation of #GAppLaunchContext that
    handles launching an application in a graphical context. It provides
    startup notification and allows to launch applications on a specific
    screen or workspace.
    
    ## Launching an application
    
    ```c
    GdkAppLaunchContext *context;
    
    context = gdk_display_get_app_launch_context (display);
    
    gdk_app_launch_context_set_screen (screen);
    gdk_app_launch_context_set_timestamp (event->time);
    
    if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
      g_warning ("Launching failed: %s\n", error->message);
    
    g_object_unref (context);
    ```
*/
struct GdkAppLaunchContext;

/**
    An opaque type representing a string as an index into a table
    of strings on the X server.
*/
alias GdkAtom = GdkAtom_st*;

struct GdkAtom_st;

/**
    A #GdkColor is used to describe a color,
    similar to the XColor struct used in the X11 drawing API.

    Deprecated: Use #GdkRGBA
*/
struct GdkColor
{
  /**
      For allocated colors, the pixel value used to
          draw this color on the screen. Not used anymore.
  */
  uint pixel;

  /**
      The red component of the color. This is
          a value between 0 and 65535, with 65535 indicating
          full intensity
  */
  ushort red;

  /**
      The green component of the color
  */
  ushort green;

  /**
      The blue component of the color
  */
  ushort blue;
}

/**
    A #GdkCursor represents a cursor. Its contents are private.
*/
struct GdkCursor;

/**
    The #GdkDevice object represents a single input device, such
    as a keyboard, a mouse, a touchpad, etc.
    
    See the #GdkDeviceManager documentation for more information
    about the various kinds of master and slave devices, and their
    relationships.
*/
struct GdkDevice;

/**
    In addition to a single pointer and keyboard for user interface input,
    GDK contains support for a variety of input devices, including graphics
    tablets, touchscreens and multiple pointers/keyboards interacting
    simultaneously with the user interface. Such input devices often have
    additional features, such as sub-pixel positioning information and
    additional device-dependent information.
    
    In order to query the device hierarchy and be aware of changes in the
    device hierarchy (such as virtual devices being created or removed, or
    physical devices being plugged or unplugged), GDK provides
    #GdkDeviceManager.
    
    By default, and if the platform supports it, GDK is aware of multiple
    keyboard/pointer pairs and multitouch devices. This behavior can be
    changed by calling [gdk.global.disableMultidevice] before [gdk.display.Display.open].
    There should rarely be a need to do that though, since GDK defaults
    to a compatibility mode in which it will emit just one enter/leave
    event pair for all devices on a window. To enable per-device
    enter/leave events and other multi-pointer interaction features,
    [gdk.window.Window.setSupportMultidevice] must be called on
    #GdkWindows (or [gtk.widget.Widget.setSupportMultidevice] on widgets).
    window. See the [gdk.window.Window.setSupportMultidevice] documentation
    for more information.
    
    On X11, multi-device support is implemented through XInput 2.
    Unless [gdk.global.disableMultidevice] is called, the XInput 2
    #GdkDeviceManager implementation will be used as the input source.
    Otherwise either the core or XInput 1 implementations will be used.
    
    For simple applications that don’t have any special interest in
    input devices, the so-called “client pointer”
    provides a reasonable approximation to a simple setup with a single
    pointer and keyboard. The device that has been set as the client
    pointer can be accessed via [gdk.device_manager.DeviceManager.getClientPointer].
    
    Conceptually, in multidevice mode there are 2 device types. Virtual
    devices (or master devices) are represented by the pointer cursors
    and keyboard foci that are seen on the screen. Physical devices (or
    slave devices) represent the hardware that is controlling the virtual
    devices, and thus have no visible cursor on the screen.
    
    Virtual devices are always paired, so there is a keyboard device for every
    pointer device. Associations between devices may be inspected through
    [gdk.device.Device.getAssociatedDevice].
    
    There may be several virtual devices, and several physical devices could
    be controlling each of these virtual devices. Physical devices may also
    be “floating”, which means they are not attached to any virtual device.
    
    # Master and slave devices
    
    ```
    carlos@sacarino:~$ xinput list
    ⎡ Virtual core pointer                          id=2    [master pointer  (3)]
    ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
    ⎜   ↳ Wacom ISDv4 E6 Pen stylus                 id=10   [slave  pointer  (2)]
    ⎜   ↳ Wacom ISDv4 E6 Finger touch               id=11   [slave  pointer  (2)]
    ⎜   ↳ SynPS/2 Synaptics TouchPad                id=13   [slave  pointer  (2)]
    ⎜   ↳ TPPS/2 IBM TrackPoint                     id=14   [slave  pointer  (2)]
    ⎜   ↳ Wacom ISDv4 E6 Pen eraser                 id=16   [slave  pointer  (2)]
    ⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
        ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
        ↳ Power Button                              id=6    [slave  keyboard (3)]
        ↳ Video Bus                                 id=7    [slave  keyboard (3)]
        ↳ Sleep Button                              id=8    [slave  keyboard (3)]
        ↳ Integrated Camera                         id=9    [slave  keyboard (3)]
        ↳ AT Translated Set 2 keyboard              id=12   [slave  keyboard (3)]
        ↳ ThinkPad Extra Buttons                    id=15   [slave  keyboard (3)]
    ```
    
    By default, GDK will automatically listen for events coming from all
    master devices, setting the #GdkDevice for all events coming from input
    devices. Events containing device information are #GDK_MOTION_NOTIFY,
    #GDK_BUTTON_PRESS, #GDK_2BUTTON_PRESS, #GDK_3BUTTON_PRESS,
    #GDK_BUTTON_RELEASE, #GDK_SCROLL, #GDK_KEY_PRESS, #GDK_KEY_RELEASE,
    #GDK_ENTER_NOTIFY, #GDK_LEAVE_NOTIFY, #GDK_FOCUS_CHANGE,
    #GDK_PROXIMITY_IN, #GDK_PROXIMITY_OUT, #GDK_DRAG_ENTER, #GDK_DRAG_LEAVE,
    #GDK_DRAG_MOTION, #GDK_DRAG_STATUS, #GDK_DROP_START, #GDK_DROP_FINISHED
    and #GDK_GRAB_BROKEN. When dealing with an event on a master device,
    it is possible to get the source (slave) device that the event originated
    from via [gdk.event.Event.getSourceDevice].
    
    On a standard session, all physical devices are connected by default to
    the "Virtual Core Pointer/Keyboard" master devices, hence routing all events
    through these. This behavior is only modified by device grabs, where the
    slave device is temporarily detached for as long as the grab is held, and
    more permanently by user modifications to the device hierarchy.
    
    On certain application specific setups, it may make sense
    to detach a physical device from its master pointer, and mapping it to
    an specific window. This can be achieved by the combination of
    [gdk.device.Device.grab] and [gdk.device.Device.setMode].
    
    In order to listen for events coming from devices
    other than a virtual device, [gdk.window.Window.setDeviceEvents] must be
    called. Generally, this function can be used to modify the event mask
    for any given device.
    
    Input devices may also provide additional information besides X/Y.
    For example, graphics tablets may also provide pressure and X/Y tilt
    information. This information is device-dependent, and may be
    queried through [gdk.device.Device.getAxis]. In multidevice mode, virtual
    devices will change axes in order to always represent the physical
    device that is routing events through it. Whenever the physical device
    changes, the #GdkDevice:n-axes property will be notified, and
    [gdk.device.Device.listAxes] will return the new device axes.
    
    Devices may also have associated “keys” or
    macro buttons. Such keys can be globally set to map into normal X
    keyboard events. The mapping is set using [gdk.device.Device.setKey].
    
    In GTK+ 3.20, a new #GdkSeat object has been introduced that
    supersedes #GdkDeviceManager and should be preferred in newly
    written code.
*/
struct GdkDeviceManager;

/**
    #GdkDevicePad is an interface implemented by devices of type
    [gdk.types.InputSource.TabletPad], it allows querying the features provided
    by the pad device.
    
    Tablet pads may contain one or more groups, each containing a subset
    of the buttons/rings/strips available. [gdk.device_pad.DevicePad.getNGroups]
    can be used to obtain the number of groups, [gdk.device_pad.DevicePad.getNFeatures]
    and [gdk.device_pad.DevicePad.getFeatureGroup] can be combined to find out the
    number of buttons/rings/strips the device has, and how are they grouped.
    
    Each of those groups have different modes, which may be used to map
    each individual pad feature to multiple actions. Only one mode is
    effective (current) for each given group, different groups may have
    different current modes. The number of available modes in a group can
    be found out through [gdk.device_pad.DevicePad.getGroupNModes], and the current
    mode for a given group will be notified through the #GdkEventPadGroupMode
    event.
*/
struct GdkDevicePad;

/** */
struct GdkDevicePadInterface;

/** */
struct GdkDeviceTool;

/**
    #GdkDisplay objects purpose are two fold:
    
    $(LIST
      * To manage and provide information about input devices (pointers and keyboards)
      
      * To manage and provide information about the available #GdkScreens
    )
      
    GdkDisplay objects are the GDK representation of an X Display,
    which can be described as a workstation consisting of
    a keyboard, a pointing device (such as a mouse) and one or more
    screens.
    It is used to open and keep track of various GdkScreen objects
    currently instantiated by the application. It is also used to
    access the keyboard(s) and mouse pointer(s) of the display.
    
    Most of the input device handling has been factored out into
    the separate #GdkDeviceManager object. Every display has a
    device manager, which you can obtain using
    [gdk.display.Display.getDeviceManager].
*/
struct GdkDisplay;

/**
    The purpose of the #GdkDisplayManager singleton object is to offer
    notification when displays appear or disappear or the default display
    changes.
    
    You can use [gdk.display_manager.DisplayManager.get] to obtain the #GdkDisplayManager
    singleton, but that should be rarely necessary. Typically, initializing
    GTK+ opens a display that you can work with without ever accessing the
    #GdkDisplayManager.
    
    The GDK library can be built with support for multiple backends.
    The #GdkDisplayManager object determines which backend is used
    at runtime.
    
    When writing backend-specific code that is supposed to work with
    multiple GDK backends, you have to consider both compile time and
    runtime. At compile time, use the #GDK_WINDOWING_X11, #GDK_WINDOWING_WIN32
    macros, etc. to find out which backends are present in the GDK library
    you are building your application against. At runtime, use type-check
    macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
    
    ## Backend-specific code ## {#backend-specific}
    
    ```c
    #ifdef GDK_WINDOWING_X11
      if (GDK_IS_X11_DISPLAY (display))
        {
          // make X11-specific calls here
        }
      else
    #endif
    #ifdef GDK_WINDOWING_QUARTZ
      if (GDK_IS_QUARTZ_DISPLAY (display))
        {
          // make Quartz-specific calls here
        }
      else
    #endif
      g_error ("Unsupported GDK backend");
    ```
*/
struct GdkDisplayManager;

/** */
struct GdkDragContext;

/**
    #GdkDrawingContext is an object that represents the current drawing
    state of a #GdkWindow.
    
    It's possible to use a #GdkDrawingContext to draw on a #GdkWindow
    via rendering API like Cairo or OpenGL.
    
    A #GdkDrawingContext can only be created by calling [gdk.window.Window.beginDrawFrame]
    and will be valid until a call to [gdk.window.Window.endDrawFrame].
    
    #GdkDrawingContext is available since GDK 3.22
*/
struct GdkDrawingContext;

/** */
struct GdkDrawingContextClass;

/**
    A #GdkEvent contains a union of all of the event types,
    and allows access to the data fields in a number of ways.
    
    The event type is always the first field in all of the event types, and
    can always be accessed with the following code, no matter what type of
    event it is:
    ```c
      GdkEvent *event;
      GdkEventType type;
    
      type = event->type;
    ```
    
    To access other fields of the event, the pointer to the event
    can be cast to the appropriate event type, or the union member
    name can be used. For example if the event type is [gdk.types.EventType.ButtonPress]
    then the x coordinate of the button press can be accessed with:
    ```c
      GdkEvent *event;
      gdouble x;
    
      x = ((GdkEventButton*)event)->x;
    ```
    or:
    ```c
      GdkEvent *event;
      gdouble x;
    
      x = event->button.x;
    ```
*/
union GdkEvent
{
  /**
      the #GdkEventType
  */
  GdkEventType type;

  /**
      a #GdkEventAny
  */
  GdkEventAny any;

  /**
      a #GdkEventExpose
  */
  GdkEventExpose expose;

  /**
      a #GdkEventVisibility
  */
  GdkEventVisibility visibility;

  /**
      a #GdkEventMotion
  */
  GdkEventMotion motion;

  /**
      a #GdkEventButton
  */
  GdkEventButton button;

  /**
      a #GdkEventTouch
  */
  GdkEventTouch touch;

  /**
      a #GdkEventScroll
  */
  GdkEventScroll scroll;

  /**
      a #GdkEventKey
  */
  GdkEventKey key;

  /**
      a #GdkEventCrossing
  */
  GdkEventCrossing crossing;

  /**
      a #GdkEventFocus
  */
  GdkEventFocus focusChange;

  /**
      a #GdkEventConfigure
  */
  GdkEventConfigure configure;

  /**
      a #GdkEventProperty
  */
  GdkEventProperty property;

  /**
      a #GdkEventSelection
  */
  GdkEventSelection selection;

  /**
      a #GdkEventOwnerChange
  */
  GdkEventOwnerChange ownerChange;

  /**
      a #GdkEventProximity
  */
  GdkEventProximity proximity;

  /**
      a #GdkEventDND
  */
  GdkEventDND dnd;

  /**
      a #GdkEventWindowState
  */
  GdkEventWindowState windowState;

  /**
      a #GdkEventSetting
  */
  GdkEventSetting setting;

  /**
      a #GdkEventGrabBroken
  */
  GdkEventGrabBroken grabBroken;

  /**
      a #GdkEventTouchpadSwipe
  */
  GdkEventTouchpadSwipe touchpadSwipe;

  /**
      a #GdkEventTouchpadPinch
  */
  GdkEventTouchpadPinch touchpadPinch;

  /**
      a #GdkEventPadButton
  */
  GdkEventPadButton padButton;

  /**
      a #GdkEventPadAxis
  */
  GdkEventPadAxis padAxis;

  /**
      a #GdkEventPadGroupMode
  */
  GdkEventPadGroupMode padGroupMode;
}

/**
    Contains the fields which are common to all event structs.
    Any event pointer can safely be cast to a pointer to a #GdkEventAny to
    access these fields.
*/
struct GdkEventAny
{
  /**
      the type of the event.
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;
}

/**
    Used for button press and button release events. The
    @type field will be one of [gdk.types.EventType.ButtonPress],
    [gdk.types.EventType._2buttonPress], [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease],
    
    Double and triple-clicks result in a sequence of events being received.
    For double-clicks the order of events will be:
    
    $(LIST
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._2buttonPress]
      * [gdk.types.EventType.ButtonRelease]
    )
      
    Note that the first click is received just like a normal
    button press, while the second click results in a [gdk.types.EventType._2buttonPress]
    being received just after the [gdk.types.EventType.ButtonPress].
    
    Triple-clicks are very similar to double-clicks, except that
    [gdk.types.EventType._3buttonPress] is inserted after the third click. The order of the
    events is:
    
    $(LIST
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._2buttonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._3buttonPress]
      * [gdk.types.EventType.ButtonRelease]
    )
      
    For a double click to occur, the second button press must occur within
    1/4 of a second of the first. For a triple click to occur, the third
    button press must also occur within 1/2 second of the first button press.
*/
struct GdkEventButton
{
  /**
      the type of the event ([gdk.types.EventType.ButtonPress], [gdk.types.EventType._2buttonPress],
        [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
        the mouse.
  */
  double* axes;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the button which was pressed or released, numbered from 1 to 5.
        Normally button 1 is the left mouse button, 2 is the middle button,
        and 3 is the right button. On 2-button mice, the middle button can
        often be simulated by pressing both mouse buttons together.
  */
  uint button;

  /**
      the master device that the event originated from. Use
      [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
        screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
        screen.
  */
  double yRoot;
}

/**
    Generated when a window size or position has changed.
*/
struct GdkEventConfigure
{
  /**
      the type of the event ([gdk.types.EventType.Configure]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new x coordinate of the window, relative to its parent.
  */
  int x;

  /**
      the new y coordinate of the window, relative to its parent.
  */
  int y;

  /**
      the new width of the window.
  */
  int width;

  /**
      the new height of the window.
  */
  int height;
}

/**
    Generated when the pointer enters or leaves a window.
*/
struct GdkEventCrossing
{
  /**
      the type of the event ([gdk.types.EventType.EnterNotify] or [gdk.types.EventType.LeaveNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the window that was entered or left.
  */
  GdkWindow* subwindow;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      the x coordinate of the pointer relative to the root of the screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the screen.
  */
  double yRoot;

  /**
      the crossing mode ([gdk.types.CrossingMode.Normal], [gdk.types.CrossingMode.Grab],
       [gdk.types.CrossingMode.Ungrab], [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab] or
       [gdk.types.CrossingMode.StateChanged]).  [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab],
       and [gdk.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
       never native.
  */
  GdkCrossingMode mode;

  /**
      the kind of crossing that happened ([gdk.types.NotifyType.Inferior],
       [gdk.types.NotifyType.Ancestor], [gdk.types.NotifyType.Virtual], [gdk.types.NotifyType.Nonlinear] or
       [gdk.types.NotifyType.NonlinearVirtual]).
  */
  GdkNotifyType detail;

  /**
      true if @window is the focus window or an inferior.
  */
  gboolean focus;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated during DND operations.
*/
struct GdkEventDND
{
  /**
      the type of the event ([gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
        [gdk.types.EventType.DragMotion], [gdk.types.EventType.DragStatus], [gdk.types.EventType.DropStart] or
        [gdk.types.EventType.DropFinished]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the #GdkDragContext for the current DND operation.
  */
  GdkDragContext* context;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the root of the
        screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  short xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
        screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  short yRoot;
}

/**
    Generated when all or part of a window becomes visible and needs to be
    redrawn.
*/
struct GdkEventExpose
{
  /**
      the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      bounding box of @region.
  */
  GdkRectangle area;

  /**
      the region that needs to be redrawn.
  */
  cairo_region_t* region;

  /**
      the number of contiguous [gdk.types.EventType.Expose] events following this one.
        The only use for this is “exposure compression”, i.e. handling all
        contiguous [gdk.types.EventType.Expose] events in one go, though GDK performs some
        exposure compression so this is not normally needed.
  */
  int count;
}

/**
    Describes a change of keyboard focus.
*/
struct GdkEventFocus
{
  /**
      the type of the event ([gdk.types.EventType.FocusChange]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      true if the window has gained the keyboard focus, false if
        it has lost the focus.
  */
  short in_;
}

/**
    Generated when a pointer or keyboard grab is broken. On X11, this happens
    when the grab window becomes unviewable (i.e. it or one of its ancestors
    is unmapped), or if the same application grabs the pointer or keyboard
    again. Note that implicit grabs (which are initiated by button presses)
    can also cause #GdkEventGrabBroken events.
*/
struct GdkEventGrabBroken
{
  /**
      the type of the event ([gdk.types.EventType.GrabBroken])
  */
  GdkEventType type;

  /**
      the window which received the event, i.e. the window
        that previously owned the grab
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      true if a keyboard grab was broken, false if a pointer
        grab was broken
  */
  gboolean keyboard;

  /**
      true if the broken grab was implicit
  */
  gboolean implicit;

  /**
      If this event is caused by another grab in the same
        application, @grab_window contains the new grab window. Otherwise
        @grab_window is null.
  */
  GdkWindow* grabWindow;
}

/**
    Describes a key press or key release event.
*/
struct GdkEventKey
{
  /**
      the type of the event ([gdk.types.EventType.KeyPress] or [gdk.types.EventType.KeyRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the key that was pressed or released. See the
        `gdk/gdkkeysyms.h` header file for a
        complete list of GDK key codes.
  */
  uint keyval;

  /**
      the length of @string.
  */
  int length;

  /**
      a string containing an approximation of the text that
        would result from this keypress. The only correct way to handle text
        input of text is using input methods (see #GtkIMContext), so this
        field is deprecated and should never be used.
        ([gdk.global.unicodeToKeyval] provides a non-deprecated way of getting
        an approximate translation for a key.) The string is encoded in the
        encoding of the current locale (Note: this for backwards compatibility:
        strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
        In some cases, the translation of the key code will be a single
        NUL byte, in which case looking at @length is necessary to distinguish
        it from the an empty translation.
  */
  char* string_;

  /**
      the raw code of the key that was pressed or released.
  */
  ushort hardwareKeycode;

  /**
      the keyboard group.
  */
  ubyte group;

  /**
      a flag that indicates if @hardware_keycode is mapped to a
        modifier. Since 2.10
  */
  uint isModifier;
}

/**
    Generated when the pointer moves.
*/
struct GdkEventMotion
{
  /**
      the type of the event.
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
        the mouse.
  */
  double* axes;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      set to 1 if this event is just a hint, see the
        [gdk.types.EventMask.PointerMotionHintMask] value of #GdkEventMask.
  */
  short isHint;

  /**
      the master device that the event originated from. Use
      [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
        screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
        screen.
  */
  double yRoot;
}

/**
    Generated when the owner of a selection changes. On X11, this
    information is only available if the X server supports the XFIXES
    extension.
*/
struct GdkEventOwnerChange
{
  /**
      the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new owner of the selection, or null if there is none
  */
  GdkWindow* owner;

  /**
      the reason for the ownership change as a #GdkOwnerChange value
  */
  GdkOwnerChange reason;

  /**
      the atom identifying the selection
  */
  GdkAtom selection;

  /**
      the timestamp of the event
  */
  uint time;

  /**
      the time at which the selection ownership was taken
        over
  */
  uint selectionTime;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] interaction with tactile sensors.
*/
struct GdkEventPadAxis
{
  /**
      the type of the event ([gdk.types.EventType.PadRing] or [gdk.types.EventType.PadStrip]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group the ring/strip belongs to. A [gdk.types.InputSource.TabletPad]
        device may have one or more groups containing a set of buttons/rings/strips
        each.
  */
  uint group;

  /**
      number of strip/ring that was interacted. This number is 0-indexed.
  */
  uint index;

  /**
      The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
        device may have different current modes.
  */
  uint mode;

  /**
      The current value for the given axis.
  */
  double value;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] button presses and releases.
*/
struct GdkEventPadButton
{
  /**
      the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
        may have one or more groups containing a set of buttons/rings/strips each.
  */
  uint group;

  /**
      The pad button that was pressed.
  */
  uint button;

  /**
      The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
        device may have different current modes.
  */
  uint mode;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] mode switches in a group.
*/
struct GdkEventPadGroupMode
{
  /**
      the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
        device may have one or more groups containing a set of buttons/rings/strips
        each.
  */
  uint group;

  /**
      The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
        device may have different current modes.
  */
  uint mode;
}

/**
    Describes a property change on a window.
*/
struct GdkEventProperty
{
  /**
      the type of the event ([gdk.types.EventType.PropertyNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the property that was changed.
  */
  GdkAtom atom;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      whether the property was changed
        ([gdk.types.PropertyState.NewValue]) or deleted ([gdk.types.PropertyState.Delete]).
  */
  GdkPropertyState state;
}

/**
    Proximity events are generated when using GDK’s wrapper for the
    XInput extension. The XInput extension is an add-on for standard X
    that allows you to use nonstandard devices such as graphics tablets.
    A proximity event indicates that the stylus has moved in or out of
    contact with the tablet, or perhaps that the user’s finger has moved
    in or out of contact with a touch screen.
    
    This event type will be used pretty rarely. It only is important for
    XInput aware programs that are drawing their own cursor.
*/
struct GdkEventProximity
{
  /**
      the type of the event ([gdk.types.EventType.ProximityIn] or [gdk.types.EventType.ProximityOut]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the master device that the event originated from. Use
      [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;
}

/**
    Generated from button presses for the buttons 4 to 7. Wheel mice are
    usually configured to generate button press events for buttons 4 and 5
    when the wheel is turned.
    
    Some GDK backends can also generate “smooth” scroll events, which
    can be recognized by the [gdk.types.ScrollDirection.Smooth] scroll direction. For
    these, the scroll deltas can be obtained with
    [gdk.event.Event.getScrollDeltas].
*/
struct GdkEventScroll
{
  /**
      the type of the event ([gdk.types.EventType.Scroll]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the direction to scroll to (one of [gdk.types.ScrollDirection.Up],
        [gdk.types.ScrollDirection.Down], [gdk.types.ScrollDirection.Left], [gdk.types.ScrollDirection.Right] or
        [gdk.types.ScrollDirection.Smooth]).
  */
  GdkScrollDirection direction;

  /**
      the master device that the event originated from. Use
      [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
        screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
        screen.
  */
  double yRoot;

  /**
      the x coordinate of the scroll delta
  */
  double deltaX;

  /**
      the y coordinate of the scroll delta
  */
  double deltaY;

  /** */
  uint isStop;
}

/**
    Generated when a selection is requested or ownership of a selection
    is taken over by another client application.
*/
struct GdkEventSelection
{
  /**
      the type of the event ([gdk.types.EventType.SelectionClear],
        [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the selection.
  */
  GdkAtom selection;

  /**
      the target to which the selection should be converted.
  */
  GdkAtom target;

  /**
      the property in which to place the result of the conversion.
  */
  GdkAtom property;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the window on which to place @property or null if none.
  */
  GdkWindow* requestor;
}

/** */
struct GdkEventSequence;

/**
    Generated when a setting is modified.
*/
struct GdkEventSetting
{
  /**
      the type of the event ([gdk.types.EventType.Setting]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      what happened to the setting ([gdk.types.SettingAction.New],
        [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  GdkSettingAction action;

  /**
      the name of the setting.
  */
  char* name;
}

/**
    Used for touch events.
    @type field will be one of [gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
    [gdk.types.EventType.TouchEnd] or [gdk.types.EventType.TouchCancel].
    
    Touch events are grouped into sequences by means of the @sequence
    field, which can also be obtained with [gdk.event.Event.getEventSequence].
    Each sequence begins with a [gdk.types.EventType.TouchBegin] event, followed by
    any number of [gdk.types.EventType.TouchUpdate] events, and ends with a [gdk.types.EventType.TouchEnd]
    (or [gdk.types.EventType.TouchCancel]) event. With multitouch devices, there may be
    several active sequences at the same time.
*/
struct GdkEventTouch
{
  /**
      the type of the event ([gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
        [gdk.types.EventType.TouchEnd], [gdk.types.EventType.TouchCancel])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
        the mouse
  */
  double* axes;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType
  */
  GdkModifierType state;

  /**
      the event sequence that the event belongs to
  */
  GdkEventSequence* sequence;

  /**
      whether the event should be used for emulating
        pointer event
  */
  gboolean emulatingPointer;

  /**
      the master device that the event originated from. Use
      [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
        screen
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
        screen
  */
  double yRoot;
}

/**
    Generated during touchpad swipe gestures.
*/
struct GdkEventTouchpadPinch
{
  /**
      the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly
  */
  byte sendEvent;

  /**
      the current phase of the gesture
  */
  byte phase;

  /**
      The number of fingers triggering the pinch
  */
  byte nFingers;

  /**
      the time of the event in milliseconds
  */
  uint time;

  /**
      The X coordinate of the pointer
  */
  double x;

  /**
      The Y coordinate of the pointer
  */
  double y;

  /**
      Movement delta in the X axis of the swipe focal point
  */
  double dx;

  /**
      Movement delta in the Y axis of the swipe focal point
  */
  double dy;

  /**
      The angle change in radians, negative angles
        denote counter-clockwise movements
  */
  double angleDelta;

  /**
      The current scale, relative to that at the time of
        the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  double scale;

  /**
      The X coordinate of the pointer, relative to the
        root of the screen.
  */
  double xRoot;

  /**
      The Y coordinate of the pointer, relative to the
        root of the screen.
  */
  double yRoot;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated during touchpad swipe gestures.
*/
struct GdkEventTouchpadSwipe
{
  /**
      the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly
  */
  byte sendEvent;

  /**
      the current phase of the gesture
  */
  byte phase;

  /**
      The number of fingers triggering the swipe
  */
  byte nFingers;

  /**
      the time of the event in milliseconds
  */
  uint time;

  /**
      The X coordinate of the pointer
  */
  double x;

  /**
      The Y coordinate of the pointer
  */
  double y;

  /**
      Movement delta in the X axis of the swipe focal point
  */
  double dx;

  /**
      Movement delta in the Y axis of the swipe focal point
  */
  double dy;

  /**
      The X coordinate of the pointer, relative to the
        root of the screen.
  */
  double xRoot;

  /**
      The Y coordinate of the pointer, relative to the
        root of the screen.
  */
  double yRoot;

  /**
      a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated when the window visibility status has changed.

    Deprecated: Modern composited windowing systems with pervasive
          transparency make it impossible to track the visibility of a window
          reliably, so this event can not be guaranteed to provide useful
          information.
*/
struct GdkEventVisibility
{
  /**
      the type of the event ([gdk.types.EventType.VisibilityNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new visibility state ([gdk.types.VisibilityState.FullyObscured],
        [gdk.types.VisibilityState.Partial] or [gdk.types.VisibilityState.Unobscured]).
  */
  GdkVisibilityState state;
}

/**
    Generated when the state of a toplevel window changes.
*/
struct GdkEventWindowState
{
  /**
      the type of the event ([gdk.types.EventType.WindowState]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      mask specifying what flags have changed.
  */
  GdkWindowState changedMask;

  /**
      the new window state, a combination of
        #GdkWindowState bits.
  */
  GdkWindowState newWindowState;
}

/**
    A #GdkFrameClock tells the application when to update and repaint a
    window. This may be synced to the vertical refresh rate of the
    monitor, for example. Even when the frame clock uses a simple timer
    rather than a hardware-based vertical sync, the frame clock helps
    because it ensures everything paints at the same time (reducing the
    total number of frames). The frame clock can also automatically
    stop painting when it knows the frames will not be visible, or
    scale back animation framerates.
    
    #GdkFrameClock is designed to be compatible with an OpenGL-based
    implementation or with mozRequestAnimationFrame in Firefox,
    for example.
    
    A frame clock is idle until someone requests a frame with
    [gdk.frame_clock.FrameClock.requestPhase]. At some later point that makes
    sense for the synchronization being implemented, the clock will
    process a frame and emit signals for each phase that has been
    requested. (See the signals of the #GdkFrameClock class for
    documentation of the phases. [gdk.types.FrameClockPhase.Update] and the
    #GdkFrameClock::update signal are most interesting for application
    writers, and are used to update the animations, using the frame time
    given by [gdk.frame_clock.FrameClock.getFrameTime].
    
    The frame time is reported in microseconds and generally in the same
    timescale as [glib.global.getMonotonicTime], however, it is not the same
    as [glib.global.getMonotonicTime]. The frame time does not advance during
    the time a frame is being painted, and outside of a frame, an attempt
    is made so that all calls to [gdk.frame_clock.FrameClock.getFrameTime] that
    are called at a “similar” time get the same value. This means that
    if different animations are timed by looking at the difference in
    time between an initial value from [gdk.frame_clock.FrameClock.getFrameTime]
    and the value inside the #GdkFrameClock::update signal of the clock,
    they will stay exactly synchronized.
*/
struct GdkFrameClock;

/** */
struct GdkFrameClockClass;

/** */
struct GdkFrameClockPrivate;

/**
    A #GdkFrameTimings object holds timing information for a single frame
    of the application’s displays. To retrieve #GdkFrameTimings objects,
    use [gdk.frame_clock.FrameClock.getTimings] or [gdk.frame_clock.FrameClock.getCurrentTimings].
    The information in #GdkFrameTimings is useful for precise synchronization
    of video with the event or audio streams, and for measuring
    quality metrics for the application’s display, such as latency and jitter.
*/
struct GdkFrameTimings;

/**
    #GdkGLContext is an object representing the platform-specific
    OpenGL drawing context.
    
    #GdkGLContexts are created for a #GdkWindow using
    [gdk.window.Window.createGlContext], and the context will match
    the #GdkVisual of the window.
    
    A #GdkGLContext is not tied to any particular normal framebuffer.
    For instance, it cannot draw to the #GdkWindow back buffer. The GDK
    repaint system is in full control of the painting to that. Instead,
    you can create render buffers or textures and use [gdk.global.cairoDrawFromGl]
    in the draw function of your widget to draw them. Then GDK will handle
    the integration of your rendering with that of other widgets.
    
    Support for #GdkGLContext is platform-specific, context creation
    can fail, returning null context.
    
    A #GdkGLContext has to be made "current" in order to start using
    it, otherwise any OpenGL call will be ignored.
    
    ## Creating a new OpenGL context ##
    
    In order to create a new #GdkGLContext instance you need a
    #GdkWindow, which you typically get during the realize call
    of a widget.
    
    A #GdkGLContext is not realized until either [gdk.glcontext.GLContext.makeCurrent],
    or until it is realized using [gdk.glcontext.GLContext.realize]. It is possible to
    specify details of the GL context like the OpenGL version to be used, or
    whether the GL context should have extra state validation enabled after
    calling [gdk.window.Window.createGlContext] by calling [gdk.glcontext.GLContext.realize].
    If the realization fails you have the option to change the settings of the
    #GdkGLContext and try again.
    
    ## Using a GdkGLContext ##
    
    You will need to make the #GdkGLContext the current context
    before issuing OpenGL calls; the system sends OpenGL commands to
    whichever context is current. It is possible to have multiple
    contexts, so you always need to ensure that the one which you
    want to draw with is the current one before issuing commands:
    
    ```c
      gdk_gl_context_make_current (context);
    ```
    
    You can now perform your drawing using OpenGL commands.
    
    You can check which #GdkGLContext is the current one by using
    [gdk.glcontext.GLContext.getCurrent]; you can also unset any #GdkGLContext
    that is currently set by calling [gdk.glcontext.GLContext.clearCurrent].
*/
struct GdkGLContext;

/**
    The #GdkGeometry struct gives the window manager information about
    a window’s geometry constraints. Normally you would set these on
    the GTK+ level using [gtk.window.Window.setGeometryHints]. #GtkWindow
    then sets the hints on the #GdkWindow it creates.
    
    [gdk.window.Window.setGeometryHints] expects the hints to be fully valid already
    and simply passes them to the window manager; in contrast,
    [gtk.window.Window.setGeometryHints] performs some interpretation. For example,
    #GtkWindow will apply the hints to the geometry widget instead of the
    toplevel window, if you set a geometry widget. Also, the
    @min_width/@min_height/@max_width/@max_height fields may be set to -1, and
    #GtkWindow will substitute the size request of the window or geometry widget.
    If the minimum size hint is not provided, #GtkWindow will use its requisition
    as the minimum size. If the minimum size is provided and a geometry widget is
    set, #GtkWindow will take the minimum size as the minimum size of the
    geometry widget rather than the entire window. The base size is treated
    similarly.
    
    The canonical use-case for [gtk.window.Window.setGeometryHints] is to get a
    terminal widget to resize properly. Here, the terminal text area should be
    the geometry widget; #GtkWindow will then automatically set the base size to
    the size of other widgets in the terminal window, such as the menubar and
    scrollbar. Then, the @width_inc and @height_inc fields should be set to the
    size of one character in the terminal. Finally, the base size should be set
    to the size of one character. The net effect is that the minimum size of the
    terminal will have a 1x1 character terminal area, and only terminal sizes on
    the “character grid” will be allowed.
    
    Here’s an example of how the terminal example would be implemented, assuming
    a terminal area widget called “terminal” and a toplevel window “toplevel”:
    
    ```c
    	GdkGeometry hints;
    
    	hints.base_width = terminal->char_width;
            hints.base_height = terminal->char_height;
            hints.min_width = terminal->char_width;
            hints.min_height = terminal->char_height;
            hints.width_inc = terminal->char_width;
            hints.height_inc = terminal->char_height;
    
     gtk_window_set_geometry_hints (GTK_WINDOW (toplevel),
                                    GTK_WIDGET (terminal),
                                    &hints,
                                    GDK_HINT_RESIZE_INC |
                                    GDK_HINT_MIN_SIZE |
                                    GDK_HINT_BASE_SIZE);
    ```
    
    The other useful fields are the @min_aspect and @max_aspect fields; these
    contain a width/height ratio as a floating point number. If a geometry widget
    is set, the aspect applies to the geometry widget rather than the entire
    window. The most common use of these hints is probably to set @min_aspect and
    @max_aspect to the same value, thus forcing the window to keep a constant
    aspect ratio.
*/
struct GdkGeometry
{
  /**
      minimum width of window (or -1 to use requisition, with
       #GtkWindow only)
  */
  int minWidth;

  /**
      minimum height of window (or -1 to use requisition, with
       #GtkWindow only)
  */
  int minHeight;

  /**
      maximum width of window (or -1 to use requisition, with
       #GtkWindow only)
  */
  int maxWidth;

  /**
      maximum height of window (or -1 to use requisition, with
       #GtkWindow only)
  */
  int maxHeight;

  /**
      allowed window widths are @base_width + @width_inc * N where N
       is any integer (-1 allowed with #GtkWindow)
  */
  int baseWidth;

  /**
      allowed window widths are @base_height + @height_inc * N where
       N is any integer (-1 allowed with #GtkWindow)
  */
  int baseHeight;

  /**
      width resize increment
  */
  int widthInc;

  /**
      height resize increment
  */
  int heightInc;

  /**
      minimum width/height ratio
  */
  double minAspect;

  /**
      maximum width/height ratio
  */
  double maxAspect;

  /**
      window gravity, see [gtk.window.Window.setGravity]
  */
  GdkGravity winGravity;
}

/**
    A #GdkKeymap defines the translation from keyboard state
    (including a hardware key, a modifier mask, and active keyboard group)
    to a keyval. This translation has two phases. The first phase is
    to determine the effective keyboard group and level for the keyboard
    state; the second phase is to look up the keycode/group/level triplet
    in the keymap and see what keyval it corresponds to.
*/
struct GdkKeymap;

/**
    A #GdkKeymapKey is a hardware key that can be mapped to a keyval.
*/
struct GdkKeymapKey
{
  /**
      the hardware keycode. This is an identifying number for a
        physical key.
  */
  uint keycode;

  /**
      indicates movement in a horizontal direction. Usually groups are used
        for two different languages. In group 0, a key might have two English
        characters, and in group 1 it might have two Hebrew characters. The Hebrew
        characters will be printed on the key next to the English characters.
  */
  int group;

  /**
      indicates which symbol on the key will be used, in a vertical direction.
        So on a standard US keyboard, the key with the number “1” on it also has the
        exclamation point ("!") character on it. The level indicates whether to use
        the “1” or the “!” symbol. The letter keys are considered to have a lowercase
        letter at level 0, and an uppercase letter at level 1, though only the
        uppercase letter is printed.
  */
  int level;
}

/** */
struct GdkMonitorClass;

/**
    GdkMonitor objects represent the individual outputs that are
    associated with a #GdkDisplay. GdkDisplay has APIs to enumerate
    monitors with [gdk.display.Display.getNMonitors] and [gdk.display.Display.getMonitor], and
    to find particular monitors with [gdk.display.Display.getPrimaryMonitor] or
    [gdk.display.Display.getMonitorAtWindow].
    
    GdkMonitor was introduced in GTK+ 3.22 and supersedes earlier
    APIs in GdkScreen to obtain monitor-related information.
*/
struct GdkMonitor;

/**
    Defines the x and y coordinates of a point.
*/
struct GdkPoint
{
  /**
      the x coordinate of the point.
  */
  int x;

  /**
      the y coordinate of the point.
  */
  int y;
}

/**
    A #GdkRGBA is used to represent a (possibly translucent)
    color, in a way that is compatible with cairo’s notion of color.
*/
struct GdkRGBA
{
  /**
      The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  double red;

  /**
      The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  double green;

  /**
      The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  double blue;

  /**
      The opacity of the color from 0.0 for completely translucent to
        1.0 for opaque
  */
  double alpha;
}

/**
    Defines the position and size of a rectangle. It is identical to
    #cairo_rectangle_int_t.
*/
struct GdkRectangle
{
  /** */
  int x;

  /** */
  int y;

  /** */
  int width;

  /** */
  int height;
}

/**
    #GdkScreen objects are the GDK representation of the screen on
    which windows can be displayed and on which the pointer moves.
    X originally identified screens with physical screens, but
    nowadays it is more common to have a single #GdkScreen which
    combines several physical monitors (see [gdk.screen.Screen.getNMonitors]).
    
    GdkScreen is used throughout GDK and GTK+ to specify which screen
    the top level windows are to be displayed on. it is also used to
    query the screen specification and default settings such as
    the default visual ([gdk.screen.Screen.getSystemVisual]), the dimensions
    of the physical monitors ([gdk.screen.Screen.getMonitorGeometry]), etc.
*/
struct GdkScreen;

/**
    The #GdkSeat object represents a collection of input devices
    that belong to a user.
*/
struct GdkSeat
{
  /** */
  GObject parentInstance;
}

/**
    A #GdkTimeCoord stores a single event in a motion history.
*/
struct GdkTimeCoord
{
  /**
      The timestamp for this event.
  */
  uint time;

  /**
      the values of the device’s axes.
  */
  double[128] axes;
}

/**
    A #GdkVisual contains information about
    a particular visual.
*/
struct GdkVisual;

/** */
struct GdkWindow;

/**
    Attributes to use for a newly-created window.
*/
struct GdkWindowAttr
{
  /**
      title of the window (for toplevel windows)
  */
  char* title;

  /**
      event mask (see [gdk.window.Window.setEvents])
  */
  int eventMask;

  /**
      X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  int x;

  /**
      Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  int y;

  /**
      width of window
  */
  int width;

  /**
      height of window
  */
  int height;

  /**
      #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
       window that receives events)
  */
  GdkWindowWindowClass wclass;

  /**
      #GdkVisual for window
  */
  GdkVisual* visual;

  /**
      type of window
  */
  GdkWindowType windowType;

  /**
      cursor for the window (see [gdk.window.Window.setCursor])
  */
  GdkCursor* cursor;

  /**
      don’t use (see [gtk.window.Window.setWmclass])
  */
  char* wmclassName;

  /**
      don’t use (see [gtk.window.Window.setWmclass])
  */
  char* wmclassClass;

  /**
      true to bypass the window manager
  */
  gboolean overrideRedirect;

  /**
      a hint of the function of the window
  */
  GdkWindowTypeHint typeHint;
}

/** */
struct GdkWindowClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GdkWindow* function(GdkWindow* window, double x, double y) pickEmbeddedChild;

  /** */
  extern(C) void function(GdkWindow* window, double offscreenX, double offscreenY, double* embedderX, double* embedderY) toEmbedder;

  /** */
  extern(C) void function(GdkWindow* window, double embedderX, double embedderY, double* offscreenX, double* offscreenY) fromEmbedder;

  /** */
  extern(C) cairo_surface_t* function(GdkWindow* window, int width, int height) createSurface;

  /** */
  extern(C) void function() GdkReserved1;

  /** */
  extern(C) void function() GdkReserved2;

  /** */
  extern(C) void function() GdkReserved3;

  /** */
  extern(C) void function() GdkReserved4;

  /** */
  extern(C) void function() GdkReserved5;

  /** */
  extern(C) void function() GdkReserved6;

  /** */
  extern(C) void function() GdkReserved7;

  /** */
  extern(C) void function() GdkReserved8;
}

/** */
struct GdkWindowRedirect;

alias extern(C) void function(GdkEvent* event, void* data) GdkEventFunc;

alias extern(C) GdkFilterReturn function(GdkXEvent* xevent, GdkEvent* event, void* data) GdkFilterFunc;

alias extern(C) void function(GdkSeat* seat, GdkWindow* window, void* userData) GdkSeatGrabPrepareFunc;

alias extern(C) gboolean function(GdkWindow* window, void* userData) GdkWindowChildFunc;

alias extern(C) void function(GdkWindow* window, cairo_region_t* region) GdkWindowInvalidateHandlerFunc;

