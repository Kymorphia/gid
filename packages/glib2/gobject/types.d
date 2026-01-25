/// D types for gobject2 library
module gobject.types;

import gid.gid;
import gobject.binding;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.object;
import gobject.param_spec;
import gobject.type_class;
import gobject.type_instance;
import gobject.value;


// Aliases

/** */
alias SignalCMarshaller = gobject.types.ClosureMarshal;

/** */
alias GType = gobject.c.types.GType;

// Enums

/** */
alias BindingFlags = GBindingFlags;

/** */
alias ConnectFlags = GConnectFlags;

/** */
alias ParamFlags = GParamFlags;

/** */
alias SignalFlags = GSignalFlags;

/** */
alias SignalMatchType = GSignalMatchType;

/** */
alias TypeDebugFlags = GTypeDebugFlags;

/** */
alias TypeFlags = GTypeFlags;

/** */
alias TypeFundamentalFlags = GTypeFundamentalFlags;

// Structs

/** */
alias ClosureNotifyData = GClosureNotifyData;

/** */
alias ParamSpecTypeInfo = GParamSpecTypeInfo;

/** */
alias SignalInvocationHint = GSignalInvocationHint;

/** */
alias TypeFundamentalInfo = GTypeFundamentalInfo;

// Callbacks

/**
    A callback function used by the type system to finalize those portions
    of a derived types class structure that were setup from the corresponding
    GBaseInitFunc() function.
    
    Class finalization basically works the inverse way in which class
    initialization is performed.
    
    See GClassInitFunc() for a discussion of the class initialization process.

    Params:
      gClass = The #GTypeClass structure to finalize
*/
alias BaseFinalizeFunc = void delegate(gobject.type_class.TypeClass gClass);

/**
    A callback function used by the type system to do base initialization
    of the class structures of derived types.
    
    This function is called as part of the initialization process of all derived
    classes and should reallocate or reset all dynamic class members copied over
    from the parent class.
    
    For example, class members (such as strings) that are not sufficiently
    handled by a plain memory copy of the parent class into the derived class
    have to be altered. See GClassInitFunc() for a discussion of the class
    initialization process.

    Params:
      gClass = The #GTypeClass structure to initialize
*/
alias BaseInitFunc = void delegate(gobject.type_class.TypeClass gClass);

/**
    A function to be called to transform from_value to to_value.
    
    If this is the transform_to function of a binding, then from_value
    is the source_property on the source object, and to_value is the
    target_property on the target object. If this is the
    transform_from function of a [gobject.types.BindingFlags.Bidirectional] binding,
    then those roles are reversed.

    Params:
      binding = a #GBinding
      fromValue = the #GValue containing the value to transform
      toValue = the #GValue in which to store the transformed value
    Returns: true if the transformation was successful, and false
        otherwise
*/
alias BindingTransformFunc = bool delegate(gobject.binding.Binding binding, gobject.value.Value fromValue, gobject.value.Value toValue);

/**
    This function is provided by the user and should produce a copy
    of the passed in boxed structure.

    Params:
      boxed = The boxed structure to be copied.
    Returns: The newly created copy of the boxed structure.
*/
alias BoxedCopyFunc = void* delegate(void* boxed);

/**
    This function is provided by the user and should free the boxed
    structure passed.

    Params:
      boxed = The boxed structure to be freed.
*/
alias BoxedFreeFunc = void delegate(void* boxed);

/**
    The type used for callback functions in structure definitions and function
    signatures.
    
    This doesn't mean that all callback functions must take no  parameters and
    return void. The required signature of a callback function is determined by
    the context in which is used (e.g. the signal to which it is connected).
    
    Use G_CALLBACK() to cast the callback function to a #GCallback.
*/
alias Callback = void delegate();

/**
    A callback function used by the type system to finalize a class.
    
    This function is rarely needed, as dynamically allocated class resources
    should be handled by GBaseInitFunc() and GBaseFinalizeFunc().
    
    Also, specification of a GClassFinalizeFunc() in the #GTypeInfo
    structure of a static type is invalid, because classes of static types
    will never be finalized (they are artificially kept alive when their
    reference count drops to zero).

    Params:
      gClass = The #GTypeClass structure to finalize
*/
alias ClassFinalizeFunc = void delegate(gobject.type_class.TypeClass gClass);

/**
    A callback function used by the type system to initialize the class
    of a specific type.
    
    This function should initialize all static class members.
    
    The initialization process of a class involves:
    
    $(LIST
      * Copying common members from the parent class over to the
        derived class structure.
      * Zero initialization of the remaining members not copied
        over from the parent class.
      * Invocation of the GBaseInitFunc() initializers of all parent
        types and the class' type.
      * Invocation of the class' GClassInitFunc() initializer.
    )
      
    Since derived classes are partially initialized through a memory copy
    of the parent class, the general rule is that GBaseInitFunc() and
    GBaseFinalizeFunc() should take care of necessary reinitialization
    and release of those class members that were introduced by the type
    that specified these GBaseInitFunc()/GBaseFinalizeFunc().
    GClassInitFunc() should only care about initializing static
    class members, while dynamic class members (such as allocated strings
    or reference counted resources) are better handled by a GBaseInitFunc()
    for this type, so proper initialization of the dynamic class members
    is performed for class initialization of derived types as well.
    
    An example may help to correspond the intend of the different class
    initializers:
    
    ```c
    typedef struct {
      GObjectClass parent_class;
      gint         static_integer;
      gchar       *dynamic_string;
    } TypeAClass;
    static void
    type_a_base_class_init (TypeAClass *class)
    {
      class->dynamic_string = g_strdup ("some string");
    }
    static void
    type_a_base_class_finalize (TypeAClass *class)
    {
      g_free (class->dynamic_string);
    }
    static void
    type_a_class_init (TypeAClass *class)
    {
      class->static_integer = 42;
    }
    
    typedef struct {
      TypeAClass   parent_class;
      gfloat       static_float;
      GString     *dynamic_gstring;
    } TypeBClass;
    static void
    type_b_base_class_init (TypeBClass *class)
    {
      class->dynamic_gstring = g_string_new ("some other string");
    }
    static void
    type_b_base_class_finalize (TypeBClass *class)
    {
      g_string_free (class->dynamic_gstring);
    }
    static void
    type_b_class_init (TypeBClass *class)
    {
      class->static_float = 3.14159265358979323846;
    }
    ```
    
    Initialization of TypeBClass will first cause initialization of
    TypeAClass (derived classes reference their parent classes, see
    [gobject.type_class.TypeClass.ref_] on this).
    
    Initialization of TypeAClass roughly involves zero-initializing its fields,
    then calling its GBaseInitFunc() type_a_base_class_init() to allocate
    its dynamic members (dynamic_string), and finally calling its GClassInitFunc()
    type_a_class_init() to initialize its static members (static_integer).
    The first step in the initialization process of TypeBClass is then
    a plain memory copy of the contents of TypeAClass into TypeBClass and
    zero-initialization of the remaining fields in TypeBClass.
    The dynamic members of TypeAClass within TypeBClass now need
    reinitialization which is performed by calling type_a_base_class_init()
    with an argument of TypeBClass.
    
    After that, the GBaseInitFunc() of TypeBClass, type_b_base_class_init()
    is called to allocate the dynamic members of TypeBClass (dynamic_gstring),
    and finally the GClassInitFunc() of TypeBClass, type_b_class_init(),
    is called to complete the initialization process with the static members
    (static_float).
    
    Corresponding finalization counter parts to the GBaseInitFunc() functions
    have to be provided to release allocated resources at class finalization
    time.

    Params:
      gClass = The #GTypeClass structure to initialize.
*/
alias ClassInitFunc = void delegate(gobject.type_class.TypeClass gClass);

/**
    The type used for marshaller functions.

    Params:
      closure = the #GClosure to which the marshaller belongs
      returnValue = a #GValue to store the return
         value. May be null if the callback of closure doesn't return a
         value.
      paramValues = an array of
         #GValues holding the arguments on which to invoke the
         callback of closure
      invocationHint = the invocation hint given as the
         last argument to [gobject.closure.Closure.invoke]
*/
alias ClosureMarshal = void delegate(gobject.closure.Closure closure, gobject.value.Value returnValue, gobject.value.Value[] paramValues, void* invocationHint);

/**
    The type used for the various notification callbacks which can be registered
    on closures.

    Params:
      closure = the #GClosure on which the notification is emitted
*/
alias ClosureNotify = void delegate(gobject.closure.Closure closure);

/**
    A callback function used by the type system to initialize a new
    instance of a type.
    
    This function initializes all instance members and allocates any resources
    required by it.
    
    Initialization of a derived instance involves calling all its parent
    types instance initializers, so the class member of the instance
    is altered during its initialization to always point to the class that
    belongs to the type the current initializer was introduced for.
    
    The extended members of instance are guaranteed to have been filled with
    zeros before this function is called.

    Params:
      instance = The instance to initialize
      gClass = The class of the type the instance is
           created for
*/
alias InstanceInitFunc = void delegate(gobject.type_instance.TypeInstance instance, gobject.type_class.TypeClass gClass);

/**
    The type of the finalize function of #GObjectClass.

    Params:
      object = the #GObject being finalized
*/
alias ObjectFinalizeFunc = void delegate(gobject.object.ObjectWrap object);

/**
    The type of the get_property function of #GObjectClass.

    Params:
      object = a #GObject
      propertyId = the numeric id under which the property was registered with
         [gobject.object_class.ObjectClass.installProperty].
      value = a #GValue to return the property value in
      pspec = the #GParamSpec describing the property
*/
alias ObjectGetPropertyFunc = void delegate(gobject.object.ObjectWrap object, uint propertyId, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

/**
    The type of the set_property function of #GObjectClass.

    Params:
      object = a #GObject
      propertyId = the numeric id under which the property was registered with
         [gobject.object_class.ObjectClass.installProperty].
      value = the new value for the property
      pspec = the #GParamSpec describing the property
*/
alias ObjectSetPropertyFunc = void delegate(gobject.object.ObjectWrap object, uint propertyId, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

/**
    The signal accumulator is a special callback function that can be used
    to collect return values of the various callbacks that are called
    during a signal emission.
    
    The signal accumulator is specified at signal creation time, if it is
    left null, no accumulation of callback return values is performed.
    The return value of signal emissions is then the value returned by the
    last callback.

    Params:
      ihint = Signal invocation hint, see #GSignalInvocationHint.
      returnAccu = Accumulator to collect callback return values in, this
         is the return value of the current signal emission.
      handlerReturn = A #GValue holding the return value of the signal handler.
    Returns: The accumulator function returns whether the signal emission
       should be aborted. Returning true will continue with
       the signal emission. Returning false will abort the current emission.
       Since 2.62, returning false will skip to the CLEANUP stage. In this case,
       emission will occur as normal in the CLEANUP stage and the handler's
       return value will be accumulated.
*/
alias SignalAccumulator = bool delegate(gobject.types.SignalInvocationHint ihint, gobject.value.Value returnAccu, gobject.value.Value handlerReturn);

/**
    A simple function pointer to get invoked when the signal is emitted.
    
    Emission hooks allow you to tie a hook to the signal type, so that it will
    trap all emissions of that signal, from any object.
    
    You may not attach these to signals created with the `G_SIGNAL_NO_HOOKS` flag.

    Params:
      ihint = Signal invocation hint, see #GSignalInvocationHint.
      paramValues = the instance on which
         the signal was emitted, followed by the parameters of the emission.
    Returns: whether it wants to stay connected. If it returns false, the signal
       hook is disconnected (and destroyed).
*/
alias SignalEmissionHook = bool delegate(gobject.types.SignalInvocationHint ihint, gobject.value.Value[] paramValues);

/**
    A callback function used for notification when the state
    of a toggle reference changes.
    
    See also: [gobject.object.ObjectWrap.addToggleRef]

    Params:
      object = The object on which [gobject.object.ObjectWrap.addToggleRef] was called.
      isLastRef = true if the toggle reference is now the
         last reference to the object. false if the toggle
         reference was the last reference and there are now other
         references.
*/
alias ToggleNotify = void delegate(gobject.object.ObjectWrap object, bool isLastRef);

/**
    A callback function which is called when the reference count of a class
    drops to zero.
    
    It may use [gobject.type_class.TypeClass.ref_] to prevent the class from being freed. You
    should not call [gobject.type_class.TypeClass.unref] from a #GTypeClassCacheFunc function
    to prevent infinite recursion, use [gobject.type_class.TypeClass.unrefUncached] instead.
    
    The functions have to check the class id passed in to figure
    whether they actually want to cache the class of this type, since all
    classes are routed through the same #GTypeClassCacheFunc chain.

    Params:
      gClass = The #GTypeClass structure which is
           unreferenced
    Returns: true to stop further #GTypeClassCacheFuncs from being
       called, false to continue
*/
alias TypeClassCacheFunc = bool delegate(gobject.type_class.TypeClass gClass);

/**
    Copies the content of a #GValue into another.
    
    The dest_value is a #GValue with zero-filled data section and src_value
    is a properly initialized #GValue of same type, or derived type.
    
    The purpose of this function is to copy the contents of src_value
    into dest_value in a way, that even after src_value has been freed, the
    contents of dest_value remain valid. String type example:
    
    ```c
    dest_value->data[0].v_pointer = g_strdup (src_value->data[0].v_pointer);
    ```

    Params:
      srcValue = the value to copy
      destValue = the location of the copy
*/
alias TypeValueCopyFunc = void delegate(gobject.value.Value srcValue, out gobject.value.Value destValue);

/**
    Frees any old contents that might be left in the `value->data` array of
    the given value.
    
    No resources may remain allocated through the #GValue contents after this
    function returns. E.g. for our above string type:
    
    ```c
    // only free strings without a specific flag for static storage
    if (!(value->data[1].v_uint & G_VALUE_NOCOPY_CONTENTS))
      g_free (value->data[0].v_pointer);
    ```

    Params:
      value = the value to free
*/
alias TypeValueFreeFunc = void delegate(gobject.value.Value value);

/**
    Initializes the value contents by setting the fields of the `value->data`
    array.
    
    The data array of the #GValue passed into this function was zero-filled
    with `memset()`, so no care has to be taken to free any old contents.
    For example, in the case of a string value that may never be null, the
    implementation might look like:
    
    ```c
    value->data[0].v_pointer = g_strdup ("");
    ```

    Params:
      value = the value to initialize
*/
alias TypeValueInitFunc = void delegate(gobject.value.Value value);

/**
    If the value contents fit into a pointer, such as objects or strings,
    return this pointer, so the caller can peek at the current contents.
    
    To extend on our above string example:
    
    ```c
    return value->data[0].v_pointer;
    ```

    Params:
      value = the value to peek
    Returns: a pointer to the value contents
*/
alias TypeValuePeekPointerFunc = void* delegate(gobject.value.Value value);

/**
    The type of value transformation functions which can be registered with
    [gobject.value.Value.registerTransformFunc].
    
    dest_value will be initialized to the correct destination type.

    Params:
      srcValue = Source value.
      destValue = Target value.
*/
alias ValueTransform = void delegate(gobject.value.Value srcValue, gobject.value.Value destValue);

/**
    A #GWeakNotify function can be added to an object as a callback that gets
    triggered when the object is finalized.
    
    Since the object is already being disposed when the #GWeakNotify is called,
    there's not much you could do with the object, apart from e.g. using its
    address as hash-index or the like.
    
    In particular, this means it’s invalid to call [gobject.object.ObjectWrap.ref_],
    [gobject.weak_ref.WeakRef.init_], [gobject.weak_ref.WeakRef.set], [gobject.object.ObjectWrap.addToggleRef],
    [gobject.object.ObjectWrap.weakRef], [gobject.object.ObjectWrap.addWeakPointer] or any function which calls
    them on the object from this callback.

    Params:
      whereTheObjectWas = the object being disposed
*/
alias WeakNotify = void delegate(gobject.object.ObjectWrap whereTheObjectWas);

/**
    Mask containing the bits of #GParamSpec.flags which are reserved for GLib.
*/
enum PARAM_MASK = 255;

/**
    #GParamFlags value alias for `G_PARAM_STATIC_NAME` | `G_PARAM_STATIC_NICK` | `G_PARAM_STATIC_BLURB`.
    
    It is recommended to use this for all properties by default, as it allows for
    internal performance improvements in GObject.
    
    It is very rare that a property would have a dynamically constructed name,
    nickname or blurb.
    
    Since 2.13.0
*/
enum PARAM_STATIC_STRINGS = 224;

/**
    Minimum shift count to be used for user defined flags, to be stored in
    #GParamSpec.flags. The maximum allowed is 10.
*/
enum PARAM_USER_SHIFT = 8;

/**
    A mask for all #GSignalFlags bits.
*/
enum SIGNAL_FLAGS_MASK = 511;

/**
    A mask for all #GSignalMatchType bits.
*/
enum SIGNAL_MATCH_MASK = 63;

/**
    A bit in the type number that's supposed to be left untouched.
*/
enum TYPE_FLAG_RESERVED_ID_BIT = 1;

/**
    An integer constant that represents the number of identifiers reserved
    for types that are assigned at compile-time.
*/
enum TYPE_FUNDAMENTAL_MAX = 1020;

/**
    Shift value used in converting numbers to type IDs.
*/
enum TYPE_FUNDAMENTAL_SHIFT = 2;

/**
    First fundamental type number to create a new fundamental type id with
    G_TYPE_MAKE_FUNDAMENTAL() reserved for BSE.
*/
enum TYPE_RESERVED_BSE_FIRST = 32;

/**
    Last fundamental type number reserved for BSE.
*/
enum TYPE_RESERVED_BSE_LAST = 48;

/**
    First fundamental type number to create a new fundamental type id with
    G_TYPE_MAKE_FUNDAMENTAL() reserved for GLib.
*/
enum TYPE_RESERVED_GLIB_FIRST = 22;

/**
    Last fundamental type number reserved for GLib.
*/
enum TYPE_RESERVED_GLIB_LAST = 31;

/**
    First available fundamental type number to create new fundamental
    type id with G_TYPE_MAKE_FUNDAMENTAL().
*/
enum TYPE_RESERVED_USER_FIRST = 49;

/**
    The maximal number of #GTypeCValues which can be collected for a
    single #GValue.
*/
enum VALUE_COLLECT_FORMAT_MAX_LENGTH = 8;

/**
    For string values, indicates that the string contained is canonical and will
    exist for the duration of the process. See [gobject.value.Value.setInternedString].
*/
enum VALUE_INTERNED_STRING = 268435456;

/**
    If passed to G_VALUE_COLLECT(), allocated data won't be copied
    but used verbatim. This does not affect ref-counted types like
    objects. This does not affect usage of [gobject.value.Value.copy], the data will
    be copied if it is not ref-counted.
*/
enum VALUE_NOCOPY_CONTENTS = 134217728;

enum GTypeFundamentalShift = 2; /// Fundamental GType shift value (G_TYPE_FUNDAMENTAL_SHIFT)

/// Fundamental GType values as an enum
enum GTypeEnum
{
  Invalid = 0 << GTypeFundamentalShift,
  None = 1 << GTypeFundamentalShift,
  Interface = 2 << GTypeFundamentalShift,
  Char = 3 << GTypeFundamentalShift,
  Uchar = 4 << GTypeFundamentalShift,
  Boolean = 5 << GTypeFundamentalShift,
  Int = 6 << GTypeFundamentalShift,
  Uint = 7 << GTypeFundamentalShift,
  Long = 8 << GTypeFundamentalShift,
  Ulong = 9 << GTypeFundamentalShift,
  Int64 = 10 << GTypeFundamentalShift,
  Uint64 = 11 << GTypeFundamentalShift,
  Enum = 12 << GTypeFundamentalShift,
  Flags = 13 << GTypeFundamentalShift,
  Float = 14 << GTypeFundamentalShift,
  Double = 15 << GTypeFundamentalShift,
  String = 16 << GTypeFundamentalShift,
  Pointer = 17 << GTypeFundamentalShift,
  Boxed = 18 << GTypeFundamentalShift,
  Param = 19 << GTypeFundamentalShift,
  Object = 20 << GTypeFundamentalShift,
  Variant = 21 << GTypeFundamentalShift,
}
