//!class Boxed pre
//!kind Boxed Boxed
//!inhibit init funcs

import glib.c.functions;
import glib.types;

/// Class wrapper for boxed types
abstract class Boxed
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
   * Make a copy of the wrapped C boxed data.
   * Returns: Copy of the boxed type
   */
  void* boxCopy() nothrow
  {
    return _cInstancePtr ? cast(void*)g_boxed_copy(_gType, _cInstancePtr) : null;
  }

  /**
   * Copy a C boxed value using g_boxed_copy.
   * Params:
   *   T = The D boxed type
   *   cBoxed = The C boxed pointer
   * Returns: A copy of the boxed type
   */
  static void* boxedCopy(T)(void* cBoxed) nothrow
  {
    return cBoxed ? g_boxed_copy(T._getGType, cBoxed) : null;
  }

  /**
   * Free a C boxed value using g_boxed_free.
   * Params:
   *   T = The D boxed type
   *   cBoxed = The C boxed pointer
   */
  static void boxedFree(T)(void* cBoxed) nothrow
  {
    if (cBoxed)
      g_boxed_free(T._getGType, cBoxed);
  }
}
