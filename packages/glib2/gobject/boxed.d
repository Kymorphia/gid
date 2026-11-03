/// Module for [Boxed] class
module gobject.boxed;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;


import glib.c.functions;
import glib.types;

/// Class wrapper for boxed types
/** */
abstract class Boxed : GidWrap
{
  void* _cInstancePtr; /// Pointer to the C boxed value

  /**
  * Constructor for wrapping a GObject boxed value
  * Params:
  *   boxPtr = The pointer to the boxed type instance
  *   take = Yes.Take if ownership of pointer should be taken by the D object, No.Take to do a box copy of it
  */
  this(void* boxPtr, Flag!"Take" take) nothrow
  {
    if (boxPtr)
      this._cInstancePtr = take ? boxPtr : g_boxed_copy(_gType, boxPtr);
  }

  /**
  * Constructor for duplicating a wrapped boxed type value.
  */
  this(Boxed boxed) nothrow
  {
    this(boxed._cInstancePtr, No.Take);
  }

  ~this() nothrow
  {
    if (!_cInstancePtr) // Might be null if an exception occurred during construction
      return;

    struct TypeAndBoxed
    {
      GType type;
      void* boxedPtr;
    }

    static extern(C) gboolean freeCb(void* data) nothrow
    {
      auto tab = cast(TypeAndBoxed*)data;
      g_boxed_free(tab.type, tab.boxedPtr);
      gFree(tab);
      return SOURCE_REMOVE;
    }

    // Ensure boxed free occurs in main context as some types are sensitive to this.
    // NOTE: If the main context is not executed again (such as during shutdown), this could leak (preferable to crashing).
    if (!g_main_context_is_owner(g_main_context_default())) // Not in main context?
    {
      auto tab = cast(TypeAndBoxed*)gMalloc(TypeAndBoxed.sizeof);
      tab.type = _gType;
      tab.boxedPtr = _cInstancePtr;
      g_main_context_invoke(null, &freeCb, cast(void*)tab); // Free later in main context
    }
    else
      g_boxed_free(_gType, _cInstancePtr); // Free now
  }

  /**
  * Get the GType of this boxed type.
  * Returns: The GObject GType
  */
  static GType _getGType() nothrow
  {
    return cast(GType)0; // Gets overridden by derived boxed types
  }

  /**
  * Boxed GType property.
  * Returns: The GType of the Boxed class.
  */
  @property GType _gType() nothrow
  {
    return _getGType;
  }

  /**
  * Convenience method to return `this` cast to a type. For use in D with statements.
  */
  Boxed self() nothrow
  {
    return this;
  }

  /**
  * Get the C boxed pointer.
  * Params:
  *   dup = Yes.Dup to return a copy of the boxed value which the caller owns, No.Dup to return the borrowed pointer
  * Returns: The C boxed pointer
  */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxedCopy(_gType, _cInstancePtr) : _cInstancePtr;
  }

  /**
  * Steal the C boxed value (see GidWrap._cSteal), the wrapper is left empty.
  * Returns: The C boxed pointer, owned by the caller
  */
  void* _cSteal() nothrow
  {
    auto ptr = _cInstancePtr;
    _cInstancePtr = null;
    return ptr;
  }
}

/**
* Template base class for boxed type wrapper classes, which provides the GType and the static C copy/free functions.
* Boxed types which derive from another boxed wrapper class (rather than directly from Boxed) define these members themselves.
* Params:
*   getTypeFunc = The C get_type() function for the boxed type
*/
abstract class BoxedWrap(alias getTypeFunc) : Boxed
{
  /**
  * Constructor for wrapping a GObject boxed value
  * Params:
  *   boxPtr = The pointer to the boxed type instance
  *   take = Yes.Take if ownership of pointer should be taken by the D object, No.Take to do a box copy of it
  */
  this(void* boxPtr, Flag!"Take" take) nothrow
  {
    super(boxPtr, take);
  }

  /**
  * Get the GType of this boxed type.
  * Returns: The GObject GType (0 if the get_type() function was not resolved)
  */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())getTypeFunc != &gidSymbolNotFound ? getTypeFunc() : cast(GType)0;
  }

  /**
  * Boxed GType property.
  * Returns: The GType of the Boxed class.
  */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
  * Copy a C boxed instance (null safe).
  * Params:
  *   ptr = The C boxed instance pointer
  * Returns: The copy
  */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /**
  * Free a C boxed instance (null safe).
  * Params:
  *   ptr = The C boxed instance pointer
  */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }
}
