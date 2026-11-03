//!kind wrap Namespace
//!inhibit imports init funcs

/**
 * Base interface and class templates for giD wrapper classes of C types.
 * Publicly imported by gid.gid.
 */

import gid.gid;
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
 */
class StructWrap(CT, alias copyFunc = void) : StructWrapBase
{
  CT _cInstance; /// The C structure

  /** Constructor with a zero initialized C structure. */
  this() nothrow
  {
  }

  /**
   * Constructor.
   * Params:
   *   ptr = Pointer to the C structure to copy
   *   take = Yes.Take to free the C structure pointer with g_free() after copying it, No.Take to leave it alone
   */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(CT*)ptr;

    if (take)
      gFree(ptr);
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
    return dup ? _cDup(cast(void*)&_cInstance) : cast(void*)&_cInstance;
  }

  /**
   * Steal the C structure (see GidWrap._cSteal). The structure is held inline by the wrapper, so a copy is returned.
   * Returns: A copy of the C structure, owned by the caller
   */
  override void* _cSteal() nothrow
  {
    return _cDup(cast(void*)&_cInstance);
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
      return cast(void*)copyFunc(cast(CT*)ptr);
    else
      return cast(void*)mallocDup(cast(CT*)ptr);
  }

  /**
   * Free a C structure copy (from _cDup or C allocated), with g_free().
   * Params:
   *   ptr = The C structure pointer (nothing is done if null)
   */
  static void _cFree(void* ptr) nothrow
  {
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
