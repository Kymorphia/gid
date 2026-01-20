/// D types for atk1 library
module atk.types;

import atk.c.functions;
import atk.c.types;
import atk.key_event_struct;
import atk.object;
import atk.property_values;
import gid.gid;


// Aliases

/** */
alias State = AtkState;

// Enums

/** */
alias CoordType = AtkCoordType;

/** */
alias HyperlinkStateFlags = AtkHyperlinkStateFlags;

/** */
alias KeyEventType = AtkKeyEventType;

/** */
alias Layer = AtkLayer;

/** */
alias Live = AtkLive;

/** */
alias RelationType = AtkRelationType;

/** */
alias Role = AtkRole;

/** */
alias ScrollType = AtkScrollType;

/** */
alias StateType = AtkStateType;

/** */
alias TextAttribute = AtkTextAttribute;

/** */
alias TextBoundary = AtkTextBoundary;

/** */
alias TextClipType = AtkTextClipType;

/** */
alias TextGranularity = AtkTextGranularity;

/** */
alias ValueType = AtkValueType;

// Structs

/** */
alias Rectangle = AtkRectangle;

/** */
alias TextRectangle = AtkTextRectangle;

// Callbacks

/**
    A function which is called when an object emits a matching event,
    as used in #atk_add_focus_tracker.
    Currently the only events for which object-specific handlers are
    supported are events of type "focus:".  Most clients of ATK will prefer to
    attach signal handlers for the various ATK signals instead.
    
    see `idatk_add_focus_tracker`

    Params:
      obj = An #AtkObject instance for whom the callback will be called when
        the specified event (e.g. 'focus:') takes place.
*/
alias EventListener = void delegate(atk.object.ObjectWrap obj);

/**
    An #AtkEventListenerInit function is a special function that is
    called in order to initialize the per-object event registration system
    used by #AtkEventListener, if any preparation is required.
    
    see `idatk_focus_tracker_init`
*/
alias EventListenerInit = void delegate();

/**
    The type of callback function used for
    [atk.component.Component.addFocusHandler] and
    [atk.component.Component.removeFocusHandler]

    Params:
      object = the #AtkObject that receives/lose the focus
      focusIn = TRUE if the object receives the focus

    Deprecated: Deprecated with [atk.component.Component.addFocusHandler]
      and [atk.component.Component.removeFocusHandler]. See those
      methods for more information.
*/
alias FocusHandler = void delegate(atk.object.ObjectWrap object, bool focusIn);

/**
    An AtkFunction is a function definition used for padding which has
    been added to class and interface structures to allow for expansion
    in the future.
    Returns: not used
*/
alias Function = bool delegate();

/**
    An #AtkKeySnoopFunc is a type of callback which is called whenever a key event occurs,
    if registered via atk_add_key_event_listener.  It allows for pre-emptive
    interception of key events via the return code as described below.

    Params:
      event = an AtkKeyEventStruct containing information about the key event for which
        notification is being given.
    Returns: TRUE (nonzero) if the event emission should be stopped and the event
      discarded without being passed to the normal GUI recipient; FALSE (zero) if the
      event dispatch to the client application should proceed as normal.
      
      see `idatk_add_key_event_listener`
*/
alias KeySnoopFunc = int delegate(atk.key_event_struct.KeyEventStruct event);

/**
    An AtkPropertyChangeHandler is a function which is executed when an
    AtkObject's property changes value. It is specified in a call to
    [atk.object.ObjectWrap.connectPropertyChangeHandler].

    Params:
      obj = atkobject which property changes
      vals = values changed

    Deprecated: Since 2.12.
*/
alias PropertyChangeHandler = void delegate(atk.object.ObjectWrap obj, atk.property_values.PropertyValues vals);

/**
    Like [atk.global.getBinaryAge], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum BINARY_AGE = 25210;

/**
    Like [atk.global.getInterfaceAge], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum INTERFACE_AGE = 1;

/**
    Like [atk.global.getMajorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 2;

/**
    Like [atk.global.getMicroVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 0;

/**
    Like [atk.global.getMinorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 52;

/**
    A macro that should be defined by the user prior to including
    the atk/atk.h header.
    The definition should be one of the predefined ATK version
    macros: `ATK_VERSION_2_12`, `ATK_VERSION_2_14`,...
    
    This macro defines the earliest version of ATK that the package is
    required to be able to compile against.
    
    If the compiler is configured to warn about the use of deprecated
    functions, then using functions that were deprecated in version
    `ATK_VERSION_MIN_REQUIRED` or earlier will cause warnings (but
    using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;
