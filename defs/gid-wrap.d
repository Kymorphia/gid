//!kind wrap Namespace
//!inhibit imports init funcs

/**
 * Base interface and class templates for giD wrapper classes of C types.
 * Publicly imported by gid.gid.
 */

import gid.gid;
import glib.c.functions : g_log;
import glib.c.types;
import gobject.c.types;

/**
 * Interface implemented by all giD wrapper classes of C types (ObjectWrap, Boxed, OpaqueWrap, ReffedWrap and StructWrap),
 * which provides uniform access to the C instance. GObject interfaces also extend it.
 *
 * Wrapper classes also have the following static members, which are not part of the interface:
 *   `static GType _getGType()` = The GType of the class (0 if it has none)
 *   `static void* _cDup(void* ptr)` = Copy (or add a reference to) a C instance (null safe), if the type is copyable
 *   `static void _cFree(void* ptr)` = Free (or remove a reference from) a C instance (null safe), if the type can be freed
 */
interface GidWrap
{
  /**
   * Get the C instance pointer.
   * Params:
   *   dup = Yes.Dup to return a copy or new reference which the caller owns (see _cDup), No.Dup to return the borrowed pointer
   * Returns: The C instance pointer
   */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow;

  /**
   * Steal the C instance, transferring the wrapper's ownership of it to the caller without a copy or an added
   * reference. Wrappers which own their C instance (Boxed, ReffedWrap and owning OpaqueWrap) are left empty (null C
   * instance, nothing is freed when destroyed), so they must not be used afterwards. Wrappers which can't give up their
   * C instance return a new reference or copy instead (see _cPtr(Yes.Dup)) and remain valid: ObjectWrap (the unique
   * D proxy of a GObject), StructWrap (inline structure) and borrowing OpaqueWrap.
   * Returns: The C instance pointer, owned by the caller (null if the wrapper is empty)
   */
  void* _cSteal() nothrow;

  /**
   * Get the GType of the instance.
   * Returns: The GType or 0 if the type has none
   */
  @property GType _gType() nothrow;
}

/**
 * Non-template root class of all Opaque structure wrappers, used for type checks (see OpaqueWrap).
 */
abstract class OpaqueWrapBase : GidWrap
{
}

/**
 * Base class template for Opaque structure wrappers. These wrap a pointer to a C structure which has no accessible
 * fields, can't be allocated by D, and can only be copied if it has a copy function.
 * Params:
 *   CT = The C pointer type of the structure (such as GVariantIter* or a pointer typedef like GdkAtom)
 *   freeFunc = C function used to free the structure when owned (void if none)
 *   copyFunc = C function used to copy the structure (void if none)
 */
class OpaqueWrap(CT, alias freeFunc = void, alias copyFunc = void) : OpaqueWrapBase
{
  enum bool _copyable = !is(copyFunc == void); /// true if the structure can be copied (has a copy function)

  CT _cInstancePtr; /// The C structure pointer
  bool _owned; /// true if the wrapper owns the C structure and frees it when destroyed (requires freeFunc)
  Object _owner; /// D object which owns a borrowed C structure, kept alive by this wrapper (null if none)

  /**
   * Constructor.
   * Params:
   *   ptr = The C structure pointer
   *   take = Yes.Take to take ownership of the structure (freed with freeFunc), No.Take to borrow it
   */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(CT)ptr;
    _owned = take;
  }

  /**
   * Constructor which borrows a C structure owned by another D object.
   * Params:
   *   ptr = The C structure pointer
   *   owner = D object which owns the C structure (kept alive by this wrapper), null if it is otherwise kept alive
   */
  this(void* ptr, Object owner) nothrow
  {
    _cInstancePtr = cast(CT)ptr;
    _owner = owner;
  }

  static if (!is(freeFunc == void))
  {
    ~this() nothrow
    {
      if (_owned && _cInstancePtr)
        cValueFreeInMainContext(cast(void*)_cInstancePtr, cast(GDestroyNotify)cFuncPtr!freeFunc());
    }

    /**
     * Free a C structure.
     * Params:
     *   ptr = The C structure pointer (nothing is done if null)
     */
    static void _cFree(void* ptr) nothrow
    {
      if (ptr)
        freeFunc(cast(CT)ptr);
    }
  }

  static if (_copyable)
  {
    /**
     * Copy a C structure.
     * Params:
     *   ptr = The C structure pointer
     * Returns: The copy, owned by the caller (null if ptr is null)
     */
    static void* _cDup(void* ptr) nothrow
    {
      return ptr ? cast(void*)copyFunc(cast(CT)ptr) : null;
    }
  }

  /**
   * Get the C structure pointer.
   * Params:
   *   dup = Yes.Dup to return a copy of the structure which the caller owns (only valid for copyable types),
   *     No.Dup to return the borrowed pointer
   * Returns: The C structure pointer
   */
  override void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    static if (_copyable)
      return dup ? _cDup(cast(void*)_cInstancePtr) : cast(void*)_cInstancePtr;
    else
    {
      assert(!dup, "Opaque type " ~ typeof(this).stringof ~ " can't be copied");
      return cast(void*)_cInstancePtr;
    }
  }

  /**
   * Steal the C structure (see GidWrap._cSteal). An owned structure is handed over and the wrapper is left empty,
   * a borrowed structure is copied (only valid for copyable types).
   * Returns: The C structure pointer, owned by the caller
   */
  override void* _cSteal() nothrow
  {
    if (!_owned)
      return _cPtr(Yes.Dup);

    auto ptr = cast(void*)_cInstancePtr;
    _cInstancePtr = null;
    _owned = false;
    return ptr;
  }

  /** Get the GType (Opaque types have none). Returns: 0 */
  static GType _getGType() nothrow
  {
    return cast(GType)0;
  }

  /** Get the GType of the instance (Opaque types have none). Returns: 0 */
  override @property GType _gType() nothrow
  {
    return cast(GType)0;
  }
}

/**
 * Non-template root class of all Reffed structure wrappers, used for type checks (see ReffedWrap).
 */
abstract class ReffedWrapBase : GidWrap
{
}

/**
 * Base class template for Reffed structure wrappers. These wrap a pointer to a reference counted C structure
 * (non-GObject) with ref and unref functions. Only root Reffed classes extend this, Reffed subclasses extend their parent.
 * Params:
 *   CT = The C pointer type of the structure (such as GVariant*)
 *   refFunc = C function used to add a reference
 *   unrefFunc = C function used to remove a reference
 */
class ReffedWrap(CT, alias refFunc, alias unrefFunc) : ReffedWrapBase
{
  CT _cInstancePtr; /// The C structure pointer (the wrapper holds a reference)

  /**
   * Constructor.
   * Params:
   *   ptr = The C structure pointer
   *   take = Yes.Take to take ownership of the reference, No.Take to add a new reference
   */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(CT)ptr;

    if (!take && ptr)
      refFunc(_cInstancePtr);
  }

  ~this() nothrow
  {
    if (_cInstancePtr)
      cValueFreeInMainContext(cast(void*)_cInstancePtr, cast(GDestroyNotify)cFuncPtr!unrefFunc());
  }

  /**
   * Get the C structure pointer.
   * Params:
   *   dup = Yes.Dup to add a reference which the caller owns, No.Dup to return the borrowed pointer
   * Returns: The C structure pointer
   */
  override void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? _cDup(cast(void*)_cInstancePtr) : cast(void*)_cInstancePtr;
  }

  /**
   * Steal the C structure reference (see GidWrap._cSteal), the wrapper is left empty.
   * Returns: The C structure pointer with the wrapper's reference, owned by the caller
   */
  override void* _cSteal() nothrow
  {
    auto ptr = cast(void*)_cInstancePtr;
    _cInstancePtr = null;
    return ptr;
  }

  /**
   * Add a reference to a C structure.
   * Params:
   *   ptr = The C structure pointer
   * Returns: ptr, with a new reference owned by the caller (null if ptr is null)
   */
  static void* _cDup(void* ptr) nothrow
  {
    if (ptr)
      refFunc(cast(CT)ptr);

    return ptr;
  }

  /**
   * Remove a reference from a C structure.
   * Params:
   *   ptr = The C structure pointer (nothing is done if null)
   */
  static void _cFree(void* ptr) nothrow
  {
    if (ptr)
      unrefFunc(cast(CT)ptr);
  }

  /** Get the GType (overridden by Reffed types which have one). Returns: The GType or 0 */
  static GType _getGType() nothrow
  {
    return cast(GType)0;
  }

  /** Get the GType of the instance (overridden by Reffed types which have one). Returns: The GType or 0 */
  override @property GType _gType() nothrow
  {
    return cast(GType)0;
  }
}

/**
 * Non-template root class of all Wrap structure wrappers, used for type checks (see StructWrap).
 */
abstract class StructWrapBase : GidWrap
{
}

/**
 * Base class template for Wrap structure wrappers. These hold a copy of a C structure inline, which can be
 * allocated by D and copied with a shallow copy (or a copy function if provided).
 * Params:
 *   CT = The C structure type (not a pointer)
 *   copyFunc = C function used to copy the structure (void to use a shallow GLib allocated copy)
 *   freeFunc = C function used to free a copy from copyFunc (void if none). If set, owned structures received from C
 *     are held as C allocated copies (deep copies with copyFunc), freed with freeFunc, instead of inline copies.
 */
class StructWrap(CT, alias copyFunc = void, alias freeFunc = void) : StructWrapBase
{
  enum bool _cAllocated = !is(freeFunc == void); /// true if owned C structures are C allocated (copyFunc/freeFunc)
  static assert(!_cAllocated || !is(copyFunc == void), "StructWrap freeFunc requires a copyFunc");

  CT _cInstance; /// The C structure (owned copy, unused when borrowed or C allocated)
  CT* _cBorrowed; /// Borrowed C structure owned by _owner (null if the inline copy is used)
  Object _owner; /// D object kept alive by this wrapper: owner of the borrowed C structure, or the source of an inline
                 /// copy whose fields may reference D memory kept alive by the source (see _dup)
  CT* _cOwned; /// C allocated structure owned by this wrapper, freed with freeFunc (only if _cAllocated)

  /** Constructor with a zero initialized C structure. */
  this() nothrow
  {
  }

  /**
   * Constructor.
   * Params:
   *   ptr = Pointer to the C structure to copy
   *   take = Yes.Take to take ownership of the C structure pointer (freed with g_free() after copying it, or held and
   *     freed with freeFunc if _cAllocated), No.Take to copy it and leave it alone
   */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    static if (_cAllocated)
      _cOwned = cast(CT*)(take ? ptr : _cDup(ptr));
    else
    {
      _cInstance = *cast(CT*)ptr;

      if (take)
        gFree(ptr);
    }
  }

  static if (_cAllocated)
  {
    ~this() nothrow
    {
      if (_cOwned)
        cValueFreeInMainContext(cast(void*)_cOwned, cast(GDestroyNotify)cFuncPtr!freeFunc());
    }
  }

  /**
   * Constructor which borrows a C structure owned by another D object (not copied, changes are made to the C structure).
   * Params:
   *   ptr = Pointer to the C structure to borrow
   *   owner = D object which owns the C structure (kept alive by this wrapper), null if it is otherwise kept alive
   */
  this(void* ptr, Object owner) nothrow
  {
    _cBorrowed = cast(CT*)ptr;
    _owner = owner;
  }

  /**
   * Check if a field setter which stores D owned memory (kept alive by this wrapper) in the C structure must be
   * refused. A borrowed C structure may outlive this wrapper, so a critical message is logged and the setter does nothing.
   * Params:
   *   field = Name of the field being set (for the log message)
   * Returns: true if the structure is borrowed and the value must not be stored
   */
  protected bool _refuseBorrowedStore(string field) nothrow
  {
    if (!_cBorrowed && !_cOwned) // A C allocated structure's fields are freed by freeFunc
      return false;

    g_log("Gid", GLogLevelFlags.LevelCritical, "Refusing to store D memory in field '%.*s' of borrowed structure %.*s",
      cast(int)field.length, field.ptr, cast(int)CT.stringof.length, CT.stringof.ptr);
    return true;
  }

  /**
   * Get a pointer to the C structure.
   * Params:
   *   dup = Yes.Dup to return a GLib allocated copy of the structure (caller owns it), No.Dup to return a pointer
   *     to the structure held by this object
   * Returns: The C structure pointer
   */
  override void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    auto ptr = _cBorrowed ? cast(void*)_cBorrowed : _cOwned ? cast(void*)_cOwned : cast(void*)&_cInstance;
    return dup ? _cDup(ptr) : ptr;
  }

  /**
   * Duplicate the structure into a new wrapper which owns its copy, for example to keep the values of a borrowed
   * structure after it becomes invalid. A C structure (borrowed or C allocated) is deep copied if the type has copy and
   * free functions (see _cAllocated), otherwise the copy is shallow and pointer fields still point at the memory of
   * the original. A structure held inline by D is copied inline (never passed to the copy function) and the copy keeps
   * this wrapper alive, since its fields may reference D memory kept alive by this wrapper.
   * Returns: The new wrapper (not borrowed)
   */
  T _dup(this T)() nothrow
  {
    if (_cBorrowed || _cOwned) // C memory
      return new T(_cPtr, No.Take);

    auto copy = new T(null, cast(Object)this); // A null borrowed pointer selects the inline structure
    copy._cInstance = _cInstance;
    return copy;
  }

  /**
   * Steal the C structure (see GidWrap._cSteal). The structure is held inline or borrowed, so a copy is returned.
   * Returns: A copy of the C structure, owned by the caller
   */
  override void* _cSteal() nothrow
  {
    return _cDup(_cPtr);
  }

  /**
   * Copy a C structure (shallow GLib allocated copy, unless the type has a copy function).
   * Params:
   *   ptr = The C structure pointer
   * Returns: The copy, owned by the caller (null if ptr is null)
   */
  static void* _cDup(void* ptr) nothrow
  {
    if (!ptr)
      return null;

    static if (!is(copyFunc == void))
      return cast(void*)copyFunc(cast(Parameters!copyFunc[0])ptr);
    else
      return cast(void*)mallocDup(cast(CT*)ptr);
  }

  /**
   * Free a C structure copy (from _cDup or C allocated), with freeFunc if set, g_free() otherwise.
   * Params:
   *   ptr = The C structure pointer (nothing is done if null)
   */
  static void _cFree(void* ptr) nothrow
  {
    static if (_cAllocated)
    {
      if (ptr)
        freeFunc(cast(Parameters!freeFunc[0])ptr);
    }
    else
      gFree(ptr);
  }

  /** Get the GType (Wrap types have none). Returns: 0 */
  static GType _getGType() nothrow
  {
    return cast(GType)0;
  }

  /** Get the GType of the instance (Wrap types have none). Returns: 0 */
  override @property GType _gType() nothrow
  {
    return cast(GType)0;
  }
}

/**
 * Scope of a mapped C structure (a caller allocated structure filled by a map function, such as gst_buffer_map(),
 * which must be released with a matching unmap function). Returned by generated map functions (see the "gid-unmap"
 * definitions attribute). The structure is unmapped by unmap() or when the scope is destroyed, at most once.
 * The scope can't be copied and should be a local variable (a scope stored in a GC allocated object would be
 * unmapped by the GC finalizer at an indeterminate time and thread). The mapped structure is held inline by a
 * wrapper of type T (accessed with `alias this`), which keeps its memory valid, but its data is only valid while mapped.
 * Params:
 *   T = The StructWrap class of the mapped structure
 *   unmapFunc = C unmap function, called with the structure pointer or with the source and structure pointers
 *   S = The class of the mapped source object (kept alive while mapped and passed to unmapFunc if it has 2 parameters)
 */
struct MapScope(T, alias unmapFunc, S)
{
  @disable this(this);

  private T _wrap; // Wrapper holding the C structure inline (a GC object has a stable address)
  private S _source; // Source object, kept alive while mapped
  bool _mapped; /// true while the structure is mapped (set by the map function)

  ~this() nothrow
  {
    unmap;
  }

  /**
   * Prepare the scope before the map function is called (used by generated map functions).
   * Params:
   *   source = The source object which is mapped
   * Returns: The C structure pointer to pass to the map function
   */
  void* _begin(S source) nothrow
  {
    unmap;
    _wrap = new T(null, cast(Object)null); // A null borrowed pointer selects the inline structure
    _source = source;
    return _wrap._cPtr;
  }

  /// Returns: true if the structure is mapped
  @property bool mapped() const nothrow
  {
    return _mapped;
  }

  /// Unmap the structure (does nothing if it isn't mapped)
  void unmap() nothrow
  {
    if (!_mapped)
      return;

    _mapped = false;

    static if (Parameters!unmapFunc.length == 2)
      unmapFunc(cast(Parameters!unmapFunc[0])_source._cPtr, cast(Parameters!unmapFunc[1])_wrap._cPtr);
    else
      unmapFunc(cast(Parameters!unmapFunc[0])_wrap._cPtr);

    _source = null;
  }

  /// Returns: The wrapper of the mapped structure (its data is only valid while mapped)
  @property T value() nothrow
  {
    return _wrap;
  }

  alias value this;
}
