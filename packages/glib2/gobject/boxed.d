/// Module for [Boxed] class
module gobject.boxed;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;


/// Class wrapper for boxed types
/** */
abstract class Boxed
{
  void* _cInstancePtr; /// Pointer to the C boxed value

  /**
  * Constructor for wrapping a GObject boxed value
  * Params:
  *   boxPtr = The pointer to the boxed type instance
  *   owned = true if ownership of pointer should be taken by the D object, false to do a box copy of it
  */
  this(void* boxPtr, bool owned)
  {
    if (!boxPtr)
      throw new GidConstructException("Null instance pointer for " ~ typeid(this).name);

    if (!owned)
      this._cInstancePtr = g_boxed_copy(_gType, boxPtr);
    else
      this._cInstancePtr = boxPtr;
  }

  /**
  * Constructor for duplicating a wrapped boxed type value.
  */
  this(Boxed boxed)
  {
    this(boxed._cInstancePtr, false);
  }

  ~this()
  {
    if (_cInstancePtr) // Might be null if an exception occurred during construction
      g_boxed_free(_gType, _cInstancePtr);
  }

  /**
  * Get the GType of this boxed type.
  * Returns: The GObject GType
  */
  static GType _getGType()
  {
    return cast(GType)0; // Gets overridden by derived boxed types
  }

  /**
  * Boxed GType property.
  * Returns: The GType of the Boxed class.
  */
  @property GType _gType()
  {
    return _getGType;
  }

  /**
  * Convenience method to return `this` cast to a type. For use in D with statements.
  */
  Boxed self()
  {
    return this;
  }

  /**
  * Make a copy of the wrapped C boxed data.
  * Returns: Copy of the boxed type
  */
  void* copy_()
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
  static void* boxedCopy(T)(void* cBoxed)
  {
    return cBoxed ? g_boxed_copy(T._getGType, cBoxed) : null;
  }

  /**
  * Free a C boxed value using g_boxed_free.
  * Params:
  *   T = The D boxed type
  *   cBoxed = The C boxed pointer
  */
  static void boxedFree(T)(void* cBoxed)
  {
    if (cBoxed)
      g_boxed_free(T._getGType, cBoxed);
  }
}
