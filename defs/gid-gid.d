//!kind gid Namespace
//!inhibit imports init funcs

public import std.typecons : Flag, No, Tuple, Yes;
public import std.traits : isCallable, Parameters, ParameterStorageClass, ParameterStorageClassTuple, ReturnType;

import core.exception : OutOfMemoryError;
import core.memory : GC;
import core.stdc.string : strlen;
public import core.stdc.string : memset;
import std.conv : to;
import std.string : toStringz;
import std.traits : hasMember, isScalarType;
import glib.c.functions;
import glib.c.types;
import gobject.object;
import gobject.c.functions;

/// Container ownership
enum GidOwnership
{
  None, /// No ownership transfer
  Container, /// Owns container
  Full, /// Owns container and the items in it
}

/**
 * Prevent the garbage collector from freeing or moving a memory region.
 * Necessary when passing data to C which might not have any remaining pointers to it in D heap memory.
 * Params:
 *   ptr = Pointer to anywhere inside the region to prevent collection/move of
 */
void ptrFreezeGC(const void* ptr)
{
  GC.addRoot(ptr);

  if (!GC.inFinalizer)
    GC.setAttr(ptr, GC.BlkAttr.NO_MOVE); // This call fails with an core.exception.InvalidMemoryOperationError if called during finalization
}

/**
 * Re-enable garbage collection and moving of a memory region which was frozen by ptrFreezeGC().
 * Params:
 *   ptr = Pointer to anywhere inside the region to re-enable garbage collection of
 */
void ptrThawGC(const void* ptr)
{
  GC.removeRoot(ptr);

  if (!GC.inFinalizer)
    GC.clrAttr(ptr, GC.BlkAttr.NO_MOVE); // This call fails with an core.exception.InvalidMemoryOperationError if called during finalization
}

/**
 * GDestroyNotify callback which can be used to re-enable garbage collection and moving for a memory region frozen by ptrFreezeGC().
 * Params:
 *   ptr = The data to re-enable garbage collection and moving of.
 */
extern(C) void ptrThawDestroyNotify(void* ptr)
{
  GC.removeRoot(ptr);
  GC.clrAttr(ptr, GC.BlkAttr.NO_MOVE);
}

/**
 * Duplicate a delegate in GC memory and freeze it so that it isn't garbage collected when still referenced from C code.
 * Params:
 *   dlg = Pointer to the delegate to freeze
 * Returns: The duplicated delegate which is added as a GC root
 */
void* freezeDelegate(void* dlg)
{
  auto dupDlg = GC.malloc((void delegate()).sizeof, GC.BlkAttr.NO_MOVE);
  *cast(void delegate()*)dupDlg = *cast(void delegate()*)dlg;
  ptrFreezeGC(dupDlg);
  return dupDlg;
}

/**
 * Unfreeze a delegate which was frozen with `freezeDelegate`, allowing it to be garbage collected
 * Params:
 *   dlg = The C heap memory allocated delegate
 */
extern(C) void thawDelegate(void* dlg)
{
  ptrThawGC(dlg);
}

/**
 * Convert a D string to a zero terminated C string, with allocation parameter.
 * Params:
 *   dstr = String to convert
 *   alloc = Yes.Alloc if string is being transferred to C (use g_malloc), No.Alloc for D allocation (no transfer)
 * Returns: Zero terminated C string (D or C allocation)
 */
char* toCString(string dstr, Flag!"Alloc" alloc)
{
  if (dstr is null)
    return null;

  if (alloc)
  {
    char* cstr = cast(char*)g_try_malloc(dstr.length + 1);

    if (!cstr)
      throw new OutOfMemoryError();

    cstr[0 .. dstr.length] = dstr[];
    cstr[dstr.length] = '\0';
    return cstr;
  }

  return cast(char*)dstr.toStringz;
}

/**
 * Convert a C string to a D string, with parameter to consume (free) the C string with g_free().
 * Params:
 *   cstr = Zero terminated C string
 *   free = Yes.Free to free the C string with g_free, No.Free to just copy it
 * Returns: The D string copy
 */
string fromCString(const(char)* cstr, Flag!"Free" free)
{
  if (!cstr)
    return null;

  string dstr = cstr[0 .. strlen(cstr)].dup;

  if (free && cstr)
    g_free(cast(void*)cstr);

  return dstr;
}

/**
 * An alias for g_malloc0 for allocating memory for interfacing with glib.
 */
alias gMalloc = g_malloc0;

/**
 * Free a pointer allocated with malloc() but only if it is not null.
 */
alias gFree = g_free;

/**
 * Duplicate a zero terminate C string.
 * Params:
 *   s = The zero terminated string to duplicate
 * Returns: The duplicate string
 * Throws: OutOfMemoryError
 */
char* strdup(const(char)* s)
{
  if (!s)
    return null;

  auto len = strlen(s);

  if (auto dup = cast(char*)g_try_malloc(len))
  {
    dup[0 .. len] = s[0 .. len];
    return dup;
  }

  throw new OutOfMemoryError;
}

/**
 * Template to copy a D array for use by C.
 * Params:
 *   T = The array type
 *   alloc = Yes.Alloc to use g_malloc() to allocate the array, No.Alloc to use D memory (defaults to No)
 *   zeroTerm = Yes.ZeroTerminated if the resulting array should be zero terminated (defaults to No)
 *   array = The array to copy
 * Returns: C array or null if array is empty
 */
T* arrayDtoC(T, Flag!"Alloc" alloc = No.Alloc, Flag!"ZeroTerm" zeroTerm = No.ZeroTerm)(T[] array)
{
  if (array.length == 0)
    return null;

  T* retArray;

  static if (alloc)
  {
    static if (zeroTerm)
    {
      retArray = cast(T*)g_try_malloc((array.length + 1) * T.sizeof);

      if (retArray)
        memset(cast(void*)&retArray[array.length], 0, T.sizeof);
    }
    else
      retArray = cast(T*)g_try_malloc(array.length * T.sizeof);

    if (!retArray)
      throw new OutOfMemoryError;
  }
  else // No.Malloc, local D allocation
  {
    static if (zeroTerm)
    {
      retArray = new T[array.length + 1].ptr;
      memset(&retArray[array.length], 0, T.sizeof); // Zero terminate
    }
    else
      retArray = new T[array.length].ptr;
  }

  static if (hasMember!(T, "cPtrRef"))
  {
    foreach(i, elem; array)
      retArray[i] = elem.cPtrRef;
  }
  else static if (is(T : string))
  {
    foreach(i, elem; array)
      retarray[i] = toCString(array[i], alloc);
  }
  else
    retArray[0 .. array.length] = array[0 .. $];

  return retArray;
}

/**
 * Convert a GLib GByteArray to a D array.
 * Params:
 *   ownership = The ownership of the GArray, None (default): do nothing with it, Container: free container only, Full: unref
 *   gByteArray = The GArray instance
 * Returns: D array of the given type
 */
ubyte[] gByteArrayToD(GidOwnership ownership = GidOwnership.None)(GByteArray* gByteArray)
{
  ubyte[] a;

  if (!gByteArray)
    return a;

  a.length = gByteArray.len;
  a[0 .. $] = gByteArray.data[0 .. gByteArray.len];

  static if (ownership == GidOwnership.Full)
    g_byte_array_unref(gByteArray);
  else static if (ownership == GidOwnership.Container)
    g_byte_array_free(gByteArray, false); // Don't free the data (container only)

  return a;
}

/**
 * Convert a GLib GBytes to a D array.
 * Params:
 *   ownership = The ownership of the GBytes, None (default): do nothing with it, Container/Full: unref
 *   gBytes = The GBytes instance
 * Returns: D array of the given type
 */
ubyte[] gBytesToD(GidOwnership ownership = GidOwnership.None)(GBytes* gBytes)
{
  ubyte[] a;

  if (!gBytes)
    return a;

  a.length = g_bytes_get_size(gBytes);
  a[0 .. $] = (cast(ubyte*)g_bytes_get_data(gBytes, null))[0 .. a.length];

  static if (ownership != GidOwnership.None)
    g_bytes_unref(gBytes);

  return a;
}

/**
 * Convert a GLib GArray to a D array.
 * Params:
 *   T = The type of elements in the array
 *   ownership = The ownership of the GArray, None (default): do nothing with it, Container: free container only, Full: unref
 *   gArray = The GArray instance
 * Returns: D array of the given type
 */
T[] gArrayGToD(T, GidOwnership ownership = GidOwnership.None)(GArray* gArray)
  if (containerTypeIsSupported!T)
{
  T[] a;

  if (!gArray)
    return a;

  assert(g_array_get_element_size(gArray) == containerTypeSize!T,
    "GArray element size " ~ g_array_get_element_size(gArray).to!string ~ " not equal to type " ~ T.stringof);

  a.length = gArray.len;

  static if (!isTypeSimple!T && !is(T == void*) && !is(T == const(void)*))
    foreach (i; 0 .. gArray.len)
      a[i] = cToD!T((cast(void**)gArray.data)[i]);
  else
    a[0 .. $] = (cast(T*)gArray.data)[0 .. gArray.len];

  static if (ownership == GidOwnership.Full)
    g_array_unref(gArray);
  else static if (ownership == GidOwnership.Container)
    g_array_free(gArray, false); // Don't free the data (container only)

  return a;
}

/**
 * Convert a GLib GPtrArray to a D array.
 * Params:
 *   T = The type of elements in the pointer array
 *   ownership = The ownership of the GPtrArray, None (default): do nothing with it, Container: free container only, Full: unref
 *   ptrArray = The pointer array instance
 * Returns: D array of the given type
 */
T[] gPtrArrayToD(T, GidOwnership ownership = GidOwnership.None)(GPtrArray* ptrArray)
  if (containerTypeIsSupported!T)
{
  T[] a;

  if (!ptrArray)
    return a;

  a.length = ptrArray.len;

  foreach (i; 0 .. ptrArray.len)
    a[i] = cToD!T(ptrArray.pdata[i]);

  static if (ownership == GidOwnership.Full)
    g_ptr_array_unref(ptrArray);
  else static if (ownership == GidOwnership.Container)
    g_ptr_array_free(ptrArray, false); // Don't free the data (container only)

  return a;
}

/**
 * Convert a GLib GList to a D array.
 * Params:
 *   T = The type of elements in the list
 *   ownership = The ownership of the GList, None (default): do nothing with it, Container: free list only, Full: free list and items
 *   list = The list
 * Returns: D array of the given type
 */
T[] gListToD(T, GidOwnership ownership = GidOwnership.None)(GList* list)
  if (containerTypeIsSupported!T)
{
  T[] a;

  for (auto n = list; n; )
  {
    a.length++;
    a[$ - 1] = cToD!T(n.data);

    static if (ownership == GidOwnership.Full && !is(T == void*) && !is(T == const(void)*))
      cValueFree!T(n.data);

    static if (ownership != GidOwnership.None)
    {
      auto tmp = n;
      n = g_list_remove_link(n, n);
      g_list_free_1(tmp);
    }
    else
      n = n.next;
  }

  return a;
}

/**
 * Convert a GLib GSList to a D array.
 * Params:
 *   T = The type of elements in the list
 *   ownership = The ownership of the GSList, None (default): do nothing with it, Container: free list only, Full: free list and items
 *   list = The list
 * Returns: D array of the given type
 */
T[] gSListToD(T, GidOwnership ownership = GidOwnership.None)(GSList* list)
  if (containerTypeIsSupported!T)
{
  T[] a;

  for (auto n = list; n; )
  {
    a.length++;
    a[$ - 1] = cToD!T(n.data);

    static if (ownership == GidOwnership.Full && !is(T == void*) && !is(T == const(void)*))
      cValueFree!T(n.data);

    static if (ownership != GidOwnership.None)
    {
      auto tmp = n;
      n = g_slist_remove_link(n, n);
      g_slist_free_1(tmp);
    }
    else
      n = n.next;
  }

  return a;
}

/**
 * Template to convert a GHashTable to a D associative array.
 *   `K`: The key D type
 *   `V`: The value D type
 *   `owned`: Set to true if caller takes ownership of hash (frees it), false to leave it alone (default)
 * Params:
 *   hash = The hash table to convert
 * Returns: The D associative array which is a copy of the data in hash
 */
V[K] gHashTableToD(K, V, GidOwnership ownership = GidOwnership.None)(GHashTable* hash)
  if ((is(K == string) || is(K == const(void)*))
    && (is(V : gobject.object.ObjectWrap) || is(V == interface) || is(V == string) || is(V == void*)))
{
  GHashTableIter iter;
  void* key;
  void* value;
  V[K] map;

  for (g_hash_table_iter_init(&iter, hash); g_hash_table_iter_next(&iter, &key, &value); )
    map[cToD!K(key)] = cToD!V(value);

  static if (ownership == GidOwnership.Container)
  {
    g_hash_table_steal_all(hash);
    g_hash_table_destroy(hash);
  }
  else static if (ownership == GidOwnership.Full)
    g_hash_table_unref(hash);

  return map;
}

/**
 * Template to convert a D ubyte array to a GByteArray for passing to C functions
 * Params:
 *   a = The D array
 * Returns: New GArray which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GByteArray* gByteArrayFromD(ubyte[] a)
{
  auto gByteArray = g_byte_array_sized_new(cast(uint)a.length);

  if (a.length > 0)
    g_byte_array_append(gByteArray, a.ptr, cast(uint)a.length);

  return gByteArray;
}

/**
 * Template to convert a D ubyte array to a GBytes for passing to C functions
 * Params:
 *   a = The D array
 * Returns: New GBytes which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GBytes* gBytesFromD(ubyte[] a)
{
  return g_bytes_new(cast(const(void)*)a.ptr, a.length);
}

/**
 * Template to convert a D array to a GArray for passing to C functions
 * Params:
 *   T = Type of the array values
 *   zeroTerminated = Set to true to enable zero termination in GArray (defaults to false)
 *   a = The D array
 * Returns: New GArray which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GArray* gArrayGFromD(T, bool zeroTerminated = false)(T[] a)
  if (containerTypeIsSupported!T)
{
  auto gArray = g_array_sized_new(zeroTerminated, false, containerTypeSize!T, cast(uint)a.length);

  static if (!isTypeSimple!T && !is(T == void*) && !is(T == const(void)*))
  {
    extern(C) void clearFunc(void* elem)
    {
      cValueFree!T(*cast(void**)elem);
      *cast(void**)elem = null;
    }

    g_array_set_clear_func(gArray, &clearFunc);
    g_array_set_size(gArray, cast(uint)a.length);

    foreach (i; 0 .. a.length)
      dToC(a[i], cast(void*)&gArray.data[i * containerTypeSize!T]);
  }
  else
    g_array_append_vals(gArray, a.ptr, cast(uint)a.length);

  return gArray;
}

/**
 * Template to convert a D array to a GPtrArray for passing to C functions
 * Params:
 *   T = Type of the array values
 *   zeroTerminated = Set to true to enable zero termination in GPtrArray (defaults to false)
 *   a = The D array
 * Returns: New GPtrArray which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GPtrArray* gPtrArrayFromD(T, bool zeroTerminated = false)(T[] a)
  if (containerTypeIsSupported!T)
{
  auto gPtrArray = g_ptr_array_new();

  static if (!is(T == void*) && !is(T == const(void)*))
  {
    extern(C) void clearFunc(void* elem)
    {
      cValueFree!T(elem);
    }

    g_ptr_array_set_free_func(gPtrArray, &clearFunc);
  }

  g_ptr_array_set_size(gPtrArray, cast(int)a.length);

  static if (!isTypeSimple!T)
  {
    foreach (i; 0 .. a.length)
      dToC(a[i], cast(void*)&gPtrArray.pdata[i]);
  }
  else
  {
    foreach (i; 0 .. a.length)
      gPtrArray.pdata[i] = g_memdup2(cast(void*)&a[i], T.sizeof);
  }

  return gPtrArray;
}

/**
 * Template to convert a D array to a GList for passing to C functions
 * Params:
 *   T = Type of the array values
 *   a = The D array
 * Returns: New GList which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GList* gListFromD(T)(T[] a)
  if (containerTypeIsSupported!T && !isTypeSimple!T)
{
  GList* list;

  static if (!isTypeSimple!T)
  {
    foreach (i; 0 .. a.length)
    {
      list = g_list_prepend(list, null);
      dToC(a[i], cast(void*)&list.data);
    }
  }
  else
  {
    foreach (i; 0 .. a.length)
    {
      list = g_list_prepend(list, null);
      list.data = g_memdup2(cast(void*)&a[i], T.sizeof);
    }
  }

  return g_list_reverse(list); // Prepend and reverse for optimization purposes
}

/**
 * Template to convert a D array to a GSList for passing to C functions
 * Params:
 *   T = Type of the array values
 *   zeroTerminated = Set to true to enable zero termination in GArray (defaults to false)
 *   a = The D array
 * Returns: New GSList which should be freed with containerFree!() template (if ownership not taken by C code)
 */
GSList* gSListFromD(T)(T[] a)
  if (containerTypeIsSupported!T)
{
  GSList* list;

  static if (!isTypeSimple!T)
  {
    foreach (i; 0 .. a.length)
    {
      list = g_slist_prepend(list, null);
      dToC(a[i], cast(void*)&list.data);
    }
  }
  else
  {
    foreach (i; 0 .. a.length)
    {
      list = g_slist_prepend(list, null);
      list.data = g_memdup2(cast(void*)&a[i], T.sizeof);
    }
  }

  return g_slist_reverse(list); // Prepend and reverse for optimization purposes
}

/**
 * Convert a D map to a GHashTable.
 * Params:
 *   K = The key type
 *   V = The value type
 *   map = The D map
 * Returns: A newly allocated GHashTable.
 */
GHashTable* gHashTableFromD(K, V)(V[K] map)
  if ((is(K == string) || is(K == const(void)*))
    && (is(V : gobject.object.ObjectWrap) || is(V == interface) || is(V == string) || is(V == void*)))
{
  GDestroyNotify valDestroyFunc;

  static if (is(V : gobject.object.ObjectWrap) || is(T == interface))
    valDestroyFunc = cast(GDestroyNotify)g_object_unref;
  else static if (is(V : string))
    valDestroyFunc = g_free;

  GHashTable* hash;

  static if (is(K : string))
    hash = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, valDestroyFunc);
  else
    hash = g_hash_table_new_full(g_direct_hash, g_direct_equal, null, valDestroyFunc);

  foreach (k, v; map)
  {
    void* keyptr;
    void* valptr;

    dToC!K(k, &keyptr);
    dToC!V(v, &valptr);
    g_hash_table_insert(hash, keyptr, valptr);
  }

  return hash;
}

/**
 * Check if a type is supported for the purpose of transforming between C and D containers
 * Params:
 *   T = The type to check
 * Returns: true if the type can be used for container C to/from D transformation
 */
bool containerTypeIsSupported(T)()
{
  return is(T : gobject.object.ObjectWrap) || is(T == interface) || is(T == string) || isTypeCopyableStruct!T || isTypeSimple!T
    || is(T == void*) || is(T == const(void)*);
}

/**
 * Get the size required for the type of an element for a container.
 * Params:
 *   T = The type
 * Returns: The element size in bytes
 */
uint containerTypeSize(T)()
  if (containerTypeIsSupported!T)
{
  static if (isTypeSimple!T)
    return T.sizeof;
  else
    return (void*).sizeof;
}

/**
 * Free a GLib container type.
 * Params:
 *   CT = The C struct type pointer of the container type
 *   T = The type of the item stored in the container
 *   ownership = The ownership of the container from the perspective of a called C function
 *     (None is the default and frees container and items, Container frees only the container, Full does nothing)
 *   container = The GLib C container pointer
 */
void containerFree(CT, T, GidOwnership ownership = GidOwnership.None)(CT container)
{
  static if (ownership == GidOwnership.Full)
    return;

  static if (is(CT == GByteArray*))
  {
    if (ownership == GidOwnership.None)
      g_byte_array_unref(container);
    else // GidOwnership.Container
      g_byte_array_free(container, false);
  }
  else static if (is(CT == GBytes*))
  {
    if (ownership != GidOwnership.None)
      g_bytes_unref(container);
  }
  else static if (is(CT == GArray*))
  {
    if (ownership == GidOwnership.None)
      g_array_unref(container);
    else // GidOwnership.Container
      g_array_free(container, false);
  }
  else static if (is(CT == GPtrArray*))
  {
    if (ownership == GidOwnership.None)
      g_ptr_array_unref(container);
    else // GidOwnership.Container
      g_ptr_array_free(container, false);
  }
  else static if (is(CT == GList*))
  {
    static if (ownership == GidOwnership.None)
    {
      for (auto n = container; n; )
      {
        auto tmp = n;
        n = n.next;
        cValueFree!T(tmp.data);
        g_list_free_1(tmp);
      }
    }
    else
      g_list_free(container);
  }
  else static if (is(CT == GSList*))
  {
    static if (ownership == GidOwnership.None)
    {
      for (auto n = container; n; )
      {
        auto tmp = n;
        n = n.next;
        cValueFree!T(tmp.data);
        g_slist_free_1(tmp);
      }
    }
    else
      g_slist_free(container);
  }
  else static if (is(CT == GHashTable*))
  {
    static if (ownership == GidOwnership.Container)
      g_hash_table_steal_all(container);

    g_hash_table_destroy(container);
  }
  else
    assert(0, "containerFree: unsupported container type " ~ CT.stringof);
}

/**
 * Check if a type is a Boxed or Reffed type
 * Params:
 *   T = Type to check
 * Returns: true if type is a boxed or reffed type
 */
bool isTypeCopyableStruct(T)()
{
  return __traits(compiles, {auto c = new T(cast(void*)null, No.Take); c._cPtr(Yes.Dup);});
}

/**
 * Check if a type is considered a simple container type (can be copied directly)
 * Params:
 *   T = The D type to check
 * Returns: bool if type is considered simple
 */
bool isTypeSimple(T)()
{
  return isScalarType!T || is(T == struct) || is(T == union);
}

/**
* Template to copy a D value from a C value.
* Params:
*   T = The D value type
*   data = Pointer to the C value
* Returns: D value which is a copy of the C value
*/
T cToD(T)(void* data)
  if (containerTypeIsSupported!T)
{
  static if (is(T : gobject.object.ObjectWrap) || is(T == interface))
    return gobject.object.ObjectWrap._getDObject!T(data, No.Take);
  else static if (is(T == string))
    return fromCString(cast(const(char)*)data, No.Free);
  else static if (isTypeCopyableStruct!T)
    return new T(data, No.Take);
  else static if (is(T == void*) || is(T == const(void)*))
    return data;
  else static if (isTypeSimple!T)
    return *(cast(T*)data);
  else
    assert(0);
}

/**
* Template to copy a C value from a D value.
* Params:
*   T = The D value type
*   val = The D value to copy
*   data = Pointer to the location to store the C value
*/
void dToC(T)(T val, void* data)
  if (containerTypeIsSupported!T)
{
  static if (is(T : gobject.object.ObjectWrap) || isTypeCopyableStruct!T)
    *(cast(void**)data) = val._cPtr(Yes.Dup);
  else static if (is(T == interface))
  {
    if (auto objG = cast(gobject.object.ObjectWrap)val)
      *(cast(void**)data) = objG._cPtr(Yes.Dup);
    else
      assert(0, "Object implementing " ~ T.stringof ~ " interface is not an ObjectWrap");
  }
  else static if (is(T == string))
    *cast(char**)data = toCString(val, Yes.Alloc); // Transfer the string to C (use g_malloc)
  else static if (is(T == void*) || is(T == const(void)*))
    *(cast(void**)data) = cast(void*)val;
  else static if (isTypeSimple!T)
    *(cast(T*)data) = val;
  else
    assert(0);
}

/**
 * Free a C value. The value type is defined by the equivalent D template type T. Does nothing if the type does not need to be freed.
 * Params:
 *   T = The D type counterpart
 *   data = Pointer to the C value
 */
void cValueFree(T)(void* data)
  if (containerTypeIsSupported!T)
{
  static if (is(T : gobject.object.ObjectWrap) || is(T == interface))
    gobject.object.ObjectWrap._unref(data);
  else static if (isBoxed!T)
    boxedFree!T(data);
  else static if (__traits(compiles, T._unref(data))) // Reffed types
    T._unref(data);
  else static if (is(T : string) || isTypeSimple!T)
    gFree(data);
}


/**
 * Check if a type is a boxed struct or class.
 * Params:
 *   T = The type to check
 * Returns: true if T is a boxed type (just checks if it has a boxCopy member)
 */
bool isBoxed(T)()
{
  return hasMember!(T, "boxCopy");
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

/// Exception class used for ObjectWrap constructor errors
class GidConstructException : Exception
{
  this(string msg)
  {
    super(msg);
  }
}
