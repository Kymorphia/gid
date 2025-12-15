/// Module for [Variant] class
module glib.variant;

import gid.gid;
import glib.bytes;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import glib.variant_type;


import glib.variant_builder;
import glib.variant_type;

import std.conv : to;
import std.traits : isSomeString, isTypeTuple;
import std.typecons : Tuple;
import std.variant : StdVariant = Variant;

/**
    [glib.variant.Variant] is a variant datatype; it can contain one or more values
    along with information about the type of the values.
    
    A [glib.variant.Variant] may contain simple types, like an integer, or a boolean value;
    or complex types, like an array of two strings, or a dictionary of key
    value pairs. A [glib.variant.Variant] is also immutable: once it’s been created neither
    its type nor its content can be modified further.
    
    [glib.variant.Variant] is useful whenever data needs to be serialized, for example when
    sending method parameters in D-Bus, or when saving settings using
    [[gio.settings.Settings]](../gio/class.Settings.html).
    
    When creating a new [glib.variant.Variant], you pass the data you want to store in it
    along with a string representing the type of data you wish to pass to it.
    
    For instance, if you want to create a [glib.variant.Variant] holding an integer value you
    can use:
    
    ```c
    GVariant *v = g_variant_new ("u", 40);
    ```
    
    The string `u` in the first argument tells [glib.variant.Variant] that the data passed to
    the constructor (`40`) is going to be an unsigned integer.
    
    More advanced examples of [glib.variant.Variant] in use can be found in documentation for
    [[glib.variant.Variant] format strings](gvariant-format-strings.html#pointers).
    
    The range of possible values is determined by the type.
    
    The type system used by [glib.variant.Variant] is [glib.variant_type.VariantType].
    
    [glib.variant.Variant] instances always have a type and a value (which are given
    at construction time).  The type and value of a [glib.variant.Variant] instance
    can never change other than by the [glib.variant.Variant] itself being
    destroyed.  A [glib.variant.Variant] cannot contain a pointer.
    
    [glib.variant.Variant] is reference counted using [glib.variant.Variant.ref_] and
    [glib.variant.Variant.unref].  [glib.variant.Variant] also has floating reference counts —
    see [glib.variant.Variant.refSink].
    
    [glib.variant.Variant] is completely threadsafe.  A [glib.variant.Variant] instance can be
    concurrently accessed in any way from any number of threads without
    problems.
    
    [glib.variant.Variant] is heavily optimised for dealing with data in serialized
    form.  It works particularly well with data located in memory-mapped
    files.  It can perform nearly all deserialization operations in a
    small constant time, usually touching only a single memory page.
    Serialized [glib.variant.Variant] data can also be sent over the network.
    
    [glib.variant.Variant] is largely compatible with D-Bus.  Almost all types of
    [glib.variant.Variant] instances can be sent over D-Bus.  See [glib.variant_type.VariantType] for
    exceptions.  (However, [glib.variant.Variant]’s serialization format is not the same
    as the serialization format of a D-Bus message body: use
    [GDBusMessage](../gio/class.DBusMessage.html), in the GIO library, for those.)
    
    For space-efficiency, the [glib.variant.Variant] serialization format does not
    automatically include the variant’s length, type or endianness,
    which must either be implied from context (such as knowledge that a
    particular file format always contains a little-endian
    `G_VARIANT_TYPE_VARIANT` which occupies the whole length of the file)
    or supplied out-of-band (for instance, a length, type and/or endianness
    indicator could be placed at the beginning of a file, network message
    or network stream).
    
    A [glib.variant.Variant]’s size is limited mainly by any lower level operating
    system constraints, such as the number of bits in [gobject.types.size_t].  For
    example, it is reasonable to have a 2GB file mapped into memory
    with [glib.mapped_file.MappedFile], and call [glib.variant.Variant.newFromData] on
    it.
    
    For convenience to C programmers, [glib.variant.Variant] features powerful
    varargs-based value construction and destruction.  This feature is
    designed to be embedded in other libraries.
    
    There is a Python-inspired text language for describing [glib.variant.Variant]
    values.  [glib.variant.Variant] includes a printer for this language and a parser
    with type inferencing.
    
    ## Memory Use
    
    [glib.variant.Variant] tries to be quite efficient with respect to memory use.
    This section gives a rough idea of how much memory is used by the
    current implementation.  The information here is subject to change
    in the future.
    
    The memory allocated by [glib.variant.Variant] can be grouped into 4 broad
    purposes: memory for serialized data, memory for the type
    information cache, buffer management memory and memory for the
    [glib.variant.Variant] structure itself.
    
    ## Serialized Data Memory
    
    This is the memory that is used for storing [glib.variant.Variant] data in
    serialized form.  This is what would be sent over the network or
    what would end up on disk, not counting any indicator of the
    endianness, or of the length or type of the top-level variant.
    
    The amount of memory required to store a boolean is 1 byte. 16,
    32 and 64 bit integers and double precision floating point numbers
    use their ‘natural’ size.  Strings (including object path and
    signature strings) are stored with a nul terminator, and as such
    use the length of the string plus 1 byte.
    
    ‘Maybe’ types use no space at all to represent the null value and
    use the same amount of space (sometimes plus one byte) as the
    equivalent non-maybe-typed value to represent the non-null case.
    
    Arrays use the amount of space required to store each of their
    members, concatenated.  Additionally, if the items stored in an
    array are not of a fixed-size (ie: strings, other arrays, etc)
    then an additional framing offset is stored for each item.  The
    size of this offset is either 1, 2 or 4 bytes depending on the
    overall size of the container.  Additionally, extra padding bytes
    are added as required for alignment of child values.
    
    Tuples (including dictionary entries) use the amount of space
    required to store each of their members, concatenated, plus one
    framing offset (as per arrays) for each non-fixed-sized item in
    the tuple, except for the last one.  Additionally, extra padding
    bytes are added as required for alignment of child values.
    
    Variants use the same amount of space as the item inside of the
    variant, plus 1 byte, plus the length of the type string for the
    item inside the variant.
    
    As an example, consider a dictionary mapping strings to variants.
    In the case that the dictionary is empty, 0 bytes are required for
    the serialization.
    
    If we add an item ‘width’ that maps to the int32 value of 500 then
    we will use 4 bytes to store the int32 (so 6 for the variant
    containing it) and 6 bytes for the string.  The variant must be
    aligned to 8 after the 6 bytes of the string, so that’s 2 extra
    bytes.  6 (string) + 2 (padding) + 6 (variant) is 14 bytes used
    for the dictionary entry.  An additional 1 byte is added to the
    array as a framing offset making a total of 15 bytes.
    
    If we add another entry, ‘title’ that maps to a nullable string
    that happens to have a value of null, then we use 0 bytes for the
    null value (and 3 bytes for the variant to contain it along with
    its type string) plus 6 bytes for the string.  Again, we need 2
    padding bytes.  That makes a total of 6 + 2 + 3 = 11 bytes.
    
    We now require extra padding between the two items in the array.
    After the 14 bytes of the first item, that’s 2 bytes required.
    We now require 2 framing offsets for an extra two
    bytes. 14 + 2 + 11 + 2 = 29 bytes to encode the entire two-item
    dictionary.
    
    ## Type Information Cache
    
    For each [glib.variant.Variant] type that currently exists in the program a type
    information structure is kept in the type information cache.  The
    type information structure is required for rapid deserialization.
    
    Continuing with the above example, if a [glib.variant.Variant] exists with the
    type `a{sv}` then a type information struct will exist for
    `a{sv}`, `{sv}`, `s`, and `v`.  Multiple uses of the same type
    will share the same type information.  Additionally, all
    single-digit types are stored in read-only static memory and do
    not contribute to the writable memory footprint of a program using
    [glib.variant.Variant].
    
    Aside from the type information structures stored in read-only
    memory, there are two forms of type information.  One is used for
    container types where there is a single element type: arrays and
    maybe types.  The other is used for container types where there
    are multiple element types: tuples and dictionary entries.
    
    Array type info structures are `6 * sizeof (void *)`, plus the
    memory required to store the type string itself.  This means that
    on 32-bit systems, the cache entry for `a{sv}` would require 30
    bytes of memory (plus allocation overhead).
    
    Tuple type info structures are `6 * sizeof (void *)`, plus `4 *
    sizeof (void *)` for each item in the tuple, plus the memory
    required to store the type string itself.  A 2-item tuple, for
    example, would have a type information structure that consumed
    writable memory in the size of `14 * sizeof (void *)` (plus type
    string)  This means that on 32-bit systems, the cache entry for
    `{sv}` would require 61 bytes of memory (plus allocation overhead).
    
    This means that in total, for our `a{sv}` example, 91 bytes of
    type information would be allocated.
    
    The type information cache, additionally, uses a [glib.hash_table.HashTable] to
    store and look up the cached items and stores a pointer to this
    hash table in static storage.  The hash table is freed when there
    are zero items in the type cache.
    
    Although these sizes may seem large it is important to remember
    that a program will probably only have a very small number of
    different types of values in it and that only one type information
    structure is required for many different values of the same type.
    
    ## Buffer Management Memory
    
    [glib.variant.Variant] uses an internal buffer management structure to deal
    with the various different possible sources of serialized data
    that it uses.  The buffer is responsible for ensuring that the
    correct call is made when the data is no longer in use by
    [glib.variant.Variant].  This may involve a `func@GLib.free` or
    even [glib.mapped_file.MappedFile.unref].
    
    One buffer management structure is used for each chunk of
    serialized data.  The size of the buffer management structure
    is `4 * (void *)`.  On 32-bit systems, that’s 16 bytes.
    
    ## GVariant structure
    
    The size of a [glib.variant.Variant] structure is `6 * (void *)`.  On 32-bit
    systems, that’s 24 bytes.
    
    [glib.variant.Variant] structures only exist if they are explicitly created
    with API calls.  For example, if a [glib.variant.Variant] is constructed out of
    serialized data for the example given above (with the dictionary)
    then although there are 9 individual values that comprise the
    entire dictionary (two keys, two values, two variants containing
    the values, two dictionary entries, plus the dictionary itself),
    only 1 [glib.variant.Variant] instance exists — the one referring to the
    dictionary.
    
    If calls are made to start accessing the other values then
    [glib.variant.Variant] instances will exist for those values only for as long
    as they are in use (ie: until you call [glib.variant.Variant.unref]).  The
    type information is shared.  The serialized data and the buffer
    management structure for that serialized data is shared by the
    child.
    
    ## Summary
    
    To put the entire example together, for our dictionary mapping
    strings to variants (with two entries, as given above), we are
    using 91 bytes of memory for type information, 29 bytes of memory
    for the serialized data, 16 bytes for buffer management and 24
    bytes for the [glib.variant.Variant] instance, or a total of 160 bytes, plus
    allocation overhead.  If we were to use [glib.variant.Variant.getChildValue]
    to access the two dictionary entries, we would use an additional 48
    bytes.  If we were to have other dictionaries of the same type, we
    would use more memory for the serialized data and buffer
    management for those dictionaries, but the type information would
    be shared.
*/
class Variant
{
  GVariant* cInstancePtr;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.variant.Variant");

    cInstancePtr = cast(GVariant*)ptr;

    if (!take)
      g_variant_ref_sink(cInstancePtr);
  }

  ~this()
  {
    g_variant_unref(cInstancePtr);
  }


  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      g_variant_ref_sink(cInstancePtr);

    return cInstancePtr;
  }
  /**
  * Template to create a new Variant from a single D value.
  * Params:
  *   T = The D type to create the variant from
  *   val = The value to assign
  */
  this(T)(T val)
  if (isTypeTuple!T && !is(T == void*))
  { // Somewhat counter-intuitive.. We don't "own" a reference, it is floating, so pass false to sink it.
    this(cast(void*)createVariant(val), No.Take);
  }

  /**
  * Template to create a new Variant from multiple D values.
  * Params:
  *   T = The D types to create the variant from
  *   vals = The values to assign
  */
  this(T...)(T vals)
  if (isTypeTuple!T && vals.length > 1 && !is(T[0] == void*))
  {
    this(createVariant!T(vals), No.Take);
  }

  /**
  * Template to create a new tuple Variant from one or more values.
  * Params:
  *   T = The D types to create the tuple variant from
  *   vals = The values to assign
  */
  static Variant newTuple(T...)(T vals)
  if (isTypeTuple!T)
  {
    return new Variant(createVariantTuple!T(vals), No.Take);
  }

  /** */
  override bool opEquals(Object other)
  {
    if (auto otherVariant = cast(Variant)other)
      return equal(otherVariant);
    else
      return this.opEquals(other);
  }

  /** */
  override int opCmp(Object other)
  {
    if (auto otherVariant = cast(Variant)other)
      return compare(otherVariant);
    else
      return this.opCmp(other);
  }

  /** */
  override string toString()
  {
    return print(true);
  }

  /**
  * Template to get a single value from a Variant
  * Params:
  *   T = The D type of the value to get
  * Returns: The single value of the Variant of type `T`
  */
  T get(T)()
  {
    return getVal!T(cast(GVariant*)_cPtr);
  }

  /**
  * Template to get multiple values from a container Variant.
  * Params:
  *   T = The D types of the values to get
  * Returns: A tuple containing the values from the Variant of the specified types
  */
  auto get(T...)()
  if (T.length > 1)
  {
    return getItems!T;
  }

  /**
  * Template to get one or more values from a container Variant.
  * Params:
  *   T = The D types of the values to get
  * Returns: A tuple containing the values from the Variant of the specified types
  */
  auto getItems(T...)()
  {
    Tuple!T vals;

    foreach (i, E; T)
      vals[i] = getChildValue(i).get!E;

    return vals;
  }

  /**
      Creates a new #GVariant array from children.
      
      child_type must be non-null if n_children is zero.  Otherwise, the
      child type is determined by inspecting the first element of the
      children array.  If child_type is non-null then it must be a
      definite type.
      
      The items of the array are taken from the children array.  No entry
      in the children array may be null.
      
      All items in the array must have the same type, which must be the
      same as child_type, if given.
      
      If the children are floating references (see [glib.variant.Variant.refSink]), the
      new instance takes ownership of them as if via [glib.variant.Variant.refSink].
  
      Params:
        childType = the element type of the new array
        children = an array of
                     #GVariant pointers, the children
      Returns: a floating reference to a new #GVariant array
  */
  static glib.variant.Variant newArray(glib.variant_type.VariantType childType = null, glib.variant.Variant[] children = null)
  {
    GVariant* _cretval;
    size_t _nChildren;
    if (children)
      _nChildren = cast(size_t)children.length;

    GVariant*[] _tmpchildren;
    foreach (obj; children)
      _tmpchildren ~= obj ? cast(GVariant*)obj._cPtr : null;
    const(GVariant*)* _children = cast(const(GVariant*)*)_tmpchildren.ptr;
    _cretval = g_variant_new_array(childType ? cast(const(GVariantType)*)childType._cPtr(No.Dup) : null, _children, _nChildren);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new boolean #GVariant instance -- either true or false.
  
      Params:
        value = a #gboolean value
      Returns: a floating reference to a new boolean #GVariant instance
  */
  static glib.variant.Variant newBoolean(bool value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_boolean(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new byte #GVariant instance.
  
      Params:
        value = a #guint8 value
      Returns: a floating reference to a new byte #GVariant instance
  */
  static glib.variant.Variant newByte(ubyte value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_byte(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates an array-of-bytes #GVariant with the contents of string.
      This function is just like [glib.variant.Variant.newString] except that the
      string need not be valid UTF-8.
      
      The nul terminator character at the end of the string is stored in
      the array.
  
      Params:
        string_ = a normal
                   nul-terminated string in no particular encoding
      Returns: a floating reference to a new bytestring #GVariant instance
  */
  static glib.variant.Variant newBytestring(string string_)
  {
    GVariant* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_variant_new_bytestring(_string_);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Constructs an array of bytestring #GVariant from the given array of
      strings.
      
      If length is -1 then strv is null-terminated.
  
      Params:
        strv = an array of strings
      Returns: a new floating #GVariant instance
  */
  static glib.variant.Variant newBytestringArray(string[] strv)
  {
    GVariant* _cretval;
    ptrdiff_t _length;
    if (strv)
      _length = cast(ptrdiff_t)strv.length;

    char*[] _tmpstrv;
    foreach (s; strv)
      _tmpstrv ~= s.toCString(No.Alloc);
    const(char*)* _strv = _tmpstrv.ptr;
    _cretval = g_variant_new_bytestring_array(_strv, _length);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new dictionary entry #GVariant. key and value must be
      non-null. key must be a value of a basic type (ie: not a container).
      
      If the key or value are floating references (see [glib.variant.Variant.refSink]),
      the new instance takes ownership of them as if via [glib.variant.Variant.refSink].
  
      Params:
        key = a basic #GVariant, the key
        value = a #GVariant, the value
      Returns: a floating reference to a new dictionary entry #GVariant
  */
  static glib.variant.Variant newDictEntry(glib.variant.Variant key, glib.variant.Variant value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_dict_entry(key ? cast(GVariant*)key._cPtr(No.Dup) : null, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new double #GVariant instance.
  
      Params:
        value = a #gdouble floating point value
      Returns: a floating reference to a new double #GVariant instance
  */
  static glib.variant.Variant newDouble(double value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_double(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Constructs a new array #GVariant instance, where the elements are
      of element_type type.
      
      elements must be an array with fixed-sized elements.  Numeric types are
      fixed-size as are tuples containing only other fixed-sized types.
      
      element_size must be the size of a single element in the array.
      For example, if calling this function for an array of 32-bit integers,
      you might say sizeof(gint32). This value isn't used except for the purpose
      of a double-check that the form of the serialized data matches the caller's
      expectation.
      
      n_elements must be the length of the elements array.
  
      Params:
        elementType = the #GVariantType of each element
        elements = a pointer to the fixed array of contiguous elements
        nElements = the number of elements
        elementSize = the size of each element
      Returns: a floating reference to a new array #GVariant instance
  */
  static glib.variant.Variant newFixedArray(glib.variant_type.VariantType elementType, const(void)* elements, size_t nElements, size_t elementSize)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_fixed_array(elementType ? cast(const(GVariantType)*)elementType._cPtr(No.Dup) : null, elements, nElements, elementSize);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Constructs a new serialized-mode #GVariant instance.  This is the
      inner interface for creation of new serialized values that gets
      called from various functions in gvariant.c.
      
      A reference is taken on bytes.
      
      The data in bytes must be aligned appropriately for the type being loaded.
      Otherwise this function will internally create a copy of the memory (since
      GLib 2.60) or (in older versions) fail and exit the process.
  
      Params:
        type = a #GVariantType
        bytes = a #GBytes
        trusted = if the contents of bytes are trusted
      Returns: a new #GVariant with a floating reference
  */
  static glib.variant.Variant newFromBytes(glib.variant_type.VariantType type, glib.bytes.Bytes bytes, bool trusted)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_from_bytes(type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, trusted);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new handle #GVariant instance.
      
      By convention, handles are indexes into an array of file descriptors
      that are sent alongside a D-Bus message.  If you're not interacting
      with D-Bus, you probably don't need them.
  
      Params:
        value = a #gint32 value
      Returns: a floating reference to a new handle #GVariant instance
  */
  static glib.variant.Variant newHandle(int value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_handle(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new int16 #GVariant instance.
  
      Params:
        value = a #gint16 value
      Returns: a floating reference to a new int16 #GVariant instance
  */
  static glib.variant.Variant newInt16(short value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_int16(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new int32 #GVariant instance.
  
      Params:
        value = a #gint32 value
      Returns: a floating reference to a new int32 #GVariant instance
  */
  static glib.variant.Variant newInt32(int value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_int32(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new int64 #GVariant instance.
  
      Params:
        value = a #gint64 value
      Returns: a floating reference to a new int64 #GVariant instance
  */
  static glib.variant.Variant newInt64(long value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_int64(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Depending on if child is null, either wraps child inside of a
      maybe container or creates a Nothing instance for the given type.
      
      At least one of child_type and child must be non-null.
      If child_type is non-null then it must be a definite type.
      If they are both non-null then child_type must be the type
      of child.
      
      If child is a floating reference (see [glib.variant.Variant.refSink]), the new
      instance takes ownership of child.
  
      Params:
        childType = the #GVariantType of the child, or null
        child = the child value, or null
      Returns: a floating reference to a new #GVariant maybe instance
  */
  static glib.variant.Variant newMaybe(glib.variant_type.VariantType childType = null, glib.variant.Variant child = null)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_maybe(childType ? cast(const(GVariantType)*)childType._cPtr(No.Dup) : null, child ? cast(GVariant*)child._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a D-Bus object path #GVariant with the contents of object_path.
      object_path must be a valid D-Bus object path.  Use
      [glib.variant.Variant.isObjectPath] if you're not sure.
  
      Params:
        objectPath = a normal C nul-terminated string
      Returns: a floating reference to a new object path #GVariant instance
  */
  static glib.variant.Variant newObjectPath(string objectPath)
  {
    GVariant* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_variant_new_object_path(_objectPath);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Constructs an array of object paths #GVariant from the given array of
      strings.
      
      Each string must be a valid #GVariant object path; see
      [glib.variant.Variant.isObjectPath].
      
      If length is -1 then strv is null-terminated.
  
      Params:
        strv = an array of strings
      Returns: a new floating #GVariant instance
  */
  static glib.variant.Variant newObjv(string[] strv)
  {
    GVariant* _cretval;
    ptrdiff_t _length;
    if (strv)
      _length = cast(ptrdiff_t)strv.length;

    const(char)*[] _tmpstrv;
    foreach (s; strv)
      _tmpstrv ~= s.toCString(No.Alloc);
    const(char*)* _strv = _tmpstrv.ptr;
    _cretval = g_variant_new_objv(_strv, _length);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a D-Bus type signature #GVariant with the contents of
      string.  string must be a valid D-Bus type signature.  Use
      [glib.variant.Variant.isSignature] if you're not sure.
  
      Params:
        signature = a normal C nul-terminated string
      Returns: a floating reference to a new signature #GVariant instance
  */
  static glib.variant.Variant newSignature(string signature)
  {
    GVariant* _cretval;
    const(char)* _signature = signature.toCString(No.Alloc);
    _cretval = g_variant_new_signature(_signature);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a string #GVariant with the contents of string.
      
      string must be valid UTF-8, and must not be null. To encode
      potentially-null strings, use [glib.variant.Variant.new_] with `ms` as the
      [format string][gvariant-format-strings-maybe-types].
  
      Params:
        string_ = a normal UTF-8 nul-terminated string
      Returns: a floating reference to a new string #GVariant instance
  */
  static glib.variant.Variant newString(string string_)
  {
    GVariant* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_variant_new_string(_string_);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Constructs an array of strings #GVariant from the given array of
      strings.
      
      If length is -1 then strv is null-terminated.
  
      Params:
        strv = an array of strings
      Returns: a new floating #GVariant instance
  */
  static glib.variant.Variant newStrv(string[] strv)
  {
    GVariant* _cretval;
    ptrdiff_t _length;
    if (strv)
      _length = cast(ptrdiff_t)strv.length;

    const(char)*[] _tmpstrv;
    foreach (s; strv)
      _tmpstrv ~= s.toCString(No.Alloc);
    const(char*)* _strv = _tmpstrv.ptr;
    _cretval = g_variant_new_strv(_strv, _length);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new tuple #GVariant out of the items in children.  The
      type is determined from the types of children.  No entry in the
      children array may be null.
      
      If n_children is 0 then the unit tuple is constructed.
      
      If the children are floating references (see [glib.variant.Variant.refSink]), the
      new instance takes ownership of them as if via [glib.variant.Variant.refSink].
  
      Params:
        children = the items to make the tuple out of
      Returns: a floating reference to a new #GVariant tuple
  */
  static glib.variant.Variant newTuple(glib.variant.Variant[] children)
  {
    GVariant* _cretval;
    size_t _nChildren;
    if (children)
      _nChildren = cast(size_t)children.length;

    GVariant*[] _tmpchildren;
    foreach (obj; children)
      _tmpchildren ~= obj ? cast(GVariant*)obj._cPtr : null;
    const(GVariant*)* _children = cast(const(GVariant*)*)_tmpchildren.ptr;
    _cretval = g_variant_new_tuple(_children, _nChildren);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new uint16 #GVariant instance.
  
      Params:
        value = a #guint16 value
      Returns: a floating reference to a new uint16 #GVariant instance
  */
  static glib.variant.Variant newUint16(ushort value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_uint16(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new uint32 #GVariant instance.
  
      Params:
        value = a #guint32 value
      Returns: a floating reference to a new uint32 #GVariant instance
  */
  static glib.variant.Variant newUint32(uint value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_uint32(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Creates a new uint64 #GVariant instance.
  
      Params:
        value = a #guint64 value
      Returns: a floating reference to a new uint64 #GVariant instance
  */
  static glib.variant.Variant newUint64(ulong value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_uint64(value);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Boxes value.  The result is a #GVariant instance representing a
      variant containing the original value.
      
      If child is a floating reference (see [glib.variant.Variant.refSink]), the new
      instance takes ownership of child.
  
      Params:
        value = a #GVariant instance
      Returns: a floating reference to a new variant #GVariant instance
  */
  static glib.variant.Variant newVariant(glib.variant.Variant value)
  {
    GVariant* _cretval;
    _cretval = g_variant_new_variant(value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Performs a byteswapping operation on the contents of value.  The
      result is that all multi-byte numeric data contained in value is
      byteswapped.  That includes 16, 32, and 64bit signed and unsigned
      integers as well as file handles and double precision floating point
      values.
      
      This function is an identity mapping on any value that does not
      contain multi-byte numeric data.  That include strings, booleans,
      bytes and containers containing only these things (recursively).
      
      While this function can safely handle untrusted, non-normal data, it is
      recommended to check whether the input is in normal form beforehand, using
      [glib.variant.Variant.isNormalForm], and to reject non-normal inputs if your
      application can be strict about what inputs it rejects.
      
      The returned value is always in normal form and is marked as trusted.
      A full, not floating, reference is returned.
      Returns: the byteswapped form of value
  */
  glib.variant.Variant byteswap()
  {
    GVariant* _cretval;
    _cretval = g_variant_byteswap(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if calling [glib.variant.Variant.get] with format_string on value would
      be valid from a type-compatibility standpoint.  format_string is
      assumed to be a valid format string (from a syntactic standpoint).
      
      If copy_only is true then this function additionally checks that it
      would be safe to call [glib.variant.Variant.unref] on value immediately after
      the call to [glib.variant.Variant.get] without invalidating the result.  This is
      only possible if deep copies are made (ie: there are no pointers to
      the data inside of the soon-to-be-freed #GVariant instance).  If this
      check fails then a g_critical() is printed and false is returned.
      
      This function is meant to be used by functions that wish to provide
      varargs accessors to #GVariant values of uncertain values (eg:
      [glib.variant.Variant.lookup] or [gio.menu_model.MenuModel.getItemAttribute]).
  
      Params:
        formatString = a valid #GVariant format string
        copyOnly = true to ensure the format string makes deep copies
      Returns: true if format_string is safe to use
  */
  bool checkFormatString(string formatString, bool copyOnly)
  {
    bool _retval;
    const(char)* _formatString = formatString.toCString(No.Alloc);
    _retval = cast(bool)g_variant_check_format_string(cast(GVariant*)this._cPtr, _formatString, copyOnly);
    return _retval;
  }

  /**
      Classifies value according to its top-level type.
      Returns: the #GVariantClass of value
  */
  glib.types.VariantClass classify()
  {
    GVariantClass _cretval;
    _cretval = g_variant_classify(cast(GVariant*)this._cPtr);
    glib.types.VariantClass _retval = cast(glib.types.VariantClass)_cretval;
    return _retval;
  }

  /**
      Compares one and two.
      
      The types of one and two are #gconstpointer only to allow use of
      this function with #GTree, #GPtrArray, etc.  They must each be a
      #GVariant.
      
      Comparison is only defined for basic types (ie: booleans, numbers,
      strings).  For booleans, false is less than true.  Numbers are
      ordered in the usual way.  Strings are in ASCII lexographical order.
      
      It is a programmer error to attempt to compare container values or
      two values that have types that are not exactly equal.  For example,
      you cannot compare a 32-bit signed integer with a 32-bit unsigned
      integer.  Also note that this function is not particularly
      well-behaved when it comes to comparison of doubles; in particular,
      the handling of incomparable values (ie: NaN) is undefined.
      
      If you only require an equality comparison, [glib.variant.Variant.equal] is more
      general.
  
      Params:
        two = a #GVariant instance of the same type
      Returns: negative value if a < b;
                 zero if a = b;
                 positive value if a > b.
  */
  int compare(glib.variant.Variant two)
  {
    int _retval;
    _retval = g_variant_compare(cast(GVariant*)this._cPtr, two ? cast(GVariant*)two._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Similar to [glib.variant.Variant.getBytestring] except that instead of
      returning a constant string, the string is duplicated.
      
      The return value must be freed using [glib.global.gfree].
      Returns: a newly allocated string
  */
  ubyte[] dupBytestring()
  {
    ubyte* _cretval;
    size_t _cretlength;
    _cretval = g_variant_dup_bytestring(cast(GVariant*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the contents of an array of array of bytes #GVariant.  This call
      makes a deep copy; the return result should be released with
      [glib.global.strfreev].
      
      If length is non-null then the number of elements in the result is
      stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of strings
  */
  string[] dupBytestringArray()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = g_variant_dup_bytestring_array(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the contents of an array of object paths #GVariant.  This call
      makes a deep copy; the return result should be released with
      [glib.global.strfreev].
      
      If length is non-null then the number of elements in the result
      is stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of strings
  */
  string[] dupObjv()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = g_variant_dup_objv(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the contents of an array of strings #GVariant.  This call
      makes a deep copy; the return result should be released with
      [glib.global.strfreev].
      
      If length is non-null then the number of elements in the result
      is stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of strings
  */
  string[] dupStrv()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = g_variant_dup_strv(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Checks if one and two have the same type and value.
      
      The types of one and two are #gconstpointer only to allow use of
      this function with #GHashTable.  They must each be a #GVariant.
  
      Params:
        two = a #GVariant instance
      Returns: true if one and two are equal
  */
  bool equal(glib.variant.Variant two)
  {
    bool _retval;
    _retval = cast(bool)g_variant_equal(cast(GVariant*)this._cPtr, two ? cast(GVariant*)two._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the boolean value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_BOOLEAN`.
      Returns: true or false
  */
  bool getBoolean()
  {
    bool _retval;
    _retval = cast(bool)g_variant_get_boolean(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the byte value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_BYTE`.
      Returns: a #guint8
  */
  ubyte getByte()
  {
    ubyte _retval;
    _retval = g_variant_get_byte(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the string value of a #GVariant instance with an
      array-of-bytes type.  The string has no particular encoding.
      
      If the array does not end with a nul terminator character, the empty
      string is returned.  For this reason, you can always trust that a
      non-null nul-terminated string will be returned by this function.
      
      If the array contains a nul terminator character somewhere other than
      the last byte then the returned string is the string, up to the first
      such nul character.
      
      [glib.variant.Variant.getFixedArray] should be used instead if the array contains
      arbitrary data that could not be nul-terminated or could contain nul bytes.
      
      It is an error to call this function with a value that is not an
      array of bytes.
      
      The return value remains valid as long as value exists.
      Returns: the constant string
  */
  string getBytestring()
  {
    const(char)* _cretval;
    _cretval = g_variant_get_bytestring(cast(GVariant*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the contents of an array of array of bytes #GVariant.  This call
      makes a shallow copy; the return result should be released with
      [glib.global.gfree], but the individual strings must not be modified.
      
      If length is non-null then the number of elements in the result is
      stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of constant strings
  */
  string[] getBytestringArray()
  {
    const(char*)* _cretval;
    size_t _cretlength;
    _cretval = g_variant_get_bytestring_array(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Reads a child item out of a container #GVariant instance.  This
      includes variants, maybes, arrays, tuples and dictionary
      entries.  It is an error to call this function on any other type of
      #GVariant.
      
      It is an error if index_ is greater than the number of child items
      in the container.  See [glib.variant.Variant.nChildren].
      
      The returned value is never floating.  You should free it with
      [glib.variant.Variant.unref] when you're done with it.
      
      Note that values borrowed from the returned child are not guaranteed to
      still be valid after the child is freed even if you still hold a reference
      to value, if value has not been serialized at the time this function is
      called. To avoid this, you can serialize value by calling
      [glib.variant.Variant.getData] and optionally ignoring the return value.
      
      There may be implementation specific restrictions on deeply nested values,
      which would result in the unit tuple being returned as the child value,
      instead of further nested children. #GVariant is guaranteed to handle
      nesting up to at least 64 levels.
      
      This function is O(1).
  
      Params:
        index = the index of the child to fetch
      Returns: the child at the specified index
  */
  glib.variant.Variant getChildValue(size_t index)
  {
    GVariant* _cretval;
    _cretval = g_variant_get_child_value(cast(GVariant*)this._cPtr, index);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a pointer to the serialized form of a #GVariant instance.
      The returned data may not be in fully-normalised form if read from an
      untrusted source.  The returned data must not be freed; it remains
      valid for as long as value exists.
      
      If value is a fixed-sized value that was deserialized from a
      corrupted serialized container then null may be returned.  In this
      case, the proper thing to do is typically to use the appropriate
      number of nul bytes in place of value.  If value is not fixed-sized
      then null is never returned.
      
      In the case that value is already in serialized form, this function
      is O(1).  If the value is not already in serialized form,
      serialization occurs implicitly and is approximately O(n) in the size
      of the result.
      
      To deserialize the data returned by this function, in addition to the
      serialized data, you must know the type of the #GVariant, and (if the
      machine might be different) the endianness of the machine that stored
      it. As a result, file formats or network messages that incorporate
      serialized #GVariants must include this information either
      implicitly (for instance "the file always contains a
      `G_VARIANT_TYPE_VARIANT` and it is always in little-endian order") or
      explicitly (by storing the type and/or endianness in addition to the
      serialized data).
      Returns: the serialized form of value, or null
  */
  const(void)* getData()
  {
    auto _retval = g_variant_get_data(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns a pointer to the serialized form of a #GVariant instance.
      The semantics of this function are exactly the same as
      [glib.variant.Variant.getData], except that the returned #GBytes holds
      a reference to the variant data.
      Returns: A new #GBytes representing the variant data
  */
  glib.bytes.Bytes getDataAsBytes()
  {
    GBytes* _cretval;
    _cretval = g_variant_get_data_as_bytes(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the double precision floating point value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_DOUBLE`.
      Returns: a #gdouble
  */
  double getDouble()
  {
    double _retval;
    _retval = g_variant_get_double(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 32-bit signed integer value of value.
      
      It is an error to call this function with a value of any type other
      than `G_VARIANT_TYPE_HANDLE`.
      
      By convention, handles are indexes into an array of file descriptors
      that are sent alongside a D-Bus message.  If you're not interacting
      with D-Bus, you probably don't need them.
      Returns: a #gint32
  */
  int getHandle()
  {
    int _retval;
    _retval = g_variant_get_handle(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 16-bit signed integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_INT16`.
      Returns: a #gint16
  */
  short getInt16()
  {
    short _retval;
    _retval = g_variant_get_int16(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 32-bit signed integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_INT32`.
      Returns: a #gint32
  */
  int getInt32()
  {
    int _retval;
    _retval = g_variant_get_int32(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 64-bit signed integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_INT64`.
      Returns: a #gint64
  */
  long getInt64()
  {
    long _retval;
    _retval = g_variant_get_int64(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Given a maybe-typed #GVariant instance, extract its value.  If the
      value is Nothing, then this function returns null.
      Returns: the contents of value, or null
  */
  glib.variant.Variant getMaybe()
  {
    GVariant* _cretval;
    _cretval = g_variant_get_maybe(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a #GVariant instance that has the same value as value and is
      trusted to be in normal form.
      
      If value is already trusted to be in normal form then a new
      reference to value is returned.
      
      If value is not already trusted, then it is scanned to check if it
      is in normal form.  If it is found to be in normal form then it is
      marked as trusted and a new reference to it is returned.
      
      If value is found not to be in normal form then a new trusted
      #GVariant is created with the same value as value. The non-normal parts of
      value will be replaced with default values which are guaranteed to be in
      normal form.
      
      It makes sense to call this function if you've received #GVariant
      data from untrusted sources and you want to ensure your serialized
      output is definitely in normal form.
      
      If value is already in normal form, a new reference will be returned
      (which will be floating if value is floating). If it is not in normal form,
      the newly created #GVariant will be returned with a single non-floating
      reference. Typically, [glib.variant.Variant.takeRef] should be called on the return
      value from this function to guarantee ownership of a single non-floating
      reference to it.
      Returns: a trusted #GVariant
  */
  glib.variant.Variant getNormalForm()
  {
    GVariant* _cretval;
    _cretval = g_variant_get_normal_form(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the contents of an array of object paths #GVariant.  This call
      makes a shallow copy; the return result should be released with
      [glib.global.gfree], but the individual strings must not be modified.
      
      If length is non-null then the number of elements in the result
      is stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of constant strings
  */
  string[] getObjv()
  {
    const(char*)* _cretval;
    size_t _cretlength;
    _cretval = g_variant_get_objv(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines the number of bytes that would be required to store value
      with [glib.variant.Variant.store].
      
      If value has a fixed-sized type then this function always returned
      that fixed size.
      
      In the case that value is already in serialized form or the size has
      already been calculated (ie: this function has been called before)
      then this function is O(1).  Otherwise, the size is calculated, an
      operation which is approximately O(n) in the number of values
      involved.
      Returns: the serialized size of value
  */
  size_t getSize()
  {
    size_t _retval;
    _retval = g_variant_get_size(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the string value of a #GVariant instance with a string
      type.  This includes the types `G_VARIANT_TYPE_STRING`,
      `G_VARIANT_TYPE_OBJECT_PATH` and `G_VARIANT_TYPE_SIGNATURE`.
      
      The string will always be UTF-8 encoded, will never be null, and will never
      contain nul bytes.
      
      If length is non-null then the length of the string (in bytes) is
      returned there.  For trusted values, this information is already
      known.  Untrusted values will be validated and, if valid, a strlen() will be
      performed. If invalid, a default value will be returned — for
      `G_VARIANT_TYPE_OBJECT_PATH`, this is `"/"`, and for other types it is the
      empty string.
      
      It is an error to call this function with a value of any type
      other than those three.
      
      The return value remains valid as long as value exists.
      Returns: the constant string, UTF-8 encoded
  */
  string getString()
  {
    char* _cretval;
    size_t _cretlength;
    _cretval = g_variant_get_string(cast(GVariant*)this._cPtr, &_cretlength);
    string _retval;

    if (_cretval)
    {
      _retval = cast(string)_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Gets the contents of an array of strings #GVariant.  This call
      makes a shallow copy; the return result should be released with
      [glib.global.gfree], but the individual strings must not be modified.
      
      If length is non-null then the number of elements in the result
      is stored there.  In any case, the resulting array will be
      null-terminated.
      
      For an empty array, length will be set to 0 and a pointer to a
      null pointer will be returned.
      Returns: an array of constant strings
  */
  string[] getStrv()
  {
    const(char*)* _cretval;
    size_t _cretlength;
    _cretval = g_variant_get_strv(cast(GVariant*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines the type of value.
      
      The return value is valid for the lifetime of value and must not
      be freed.
      Returns: a #GVariantType
  */
  glib.variant_type.VariantType getType()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_get_type(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the type string of value.  Unlike the result of calling
      [glib.variant_type.VariantType.peekString], this string is nul-terminated.  This
      string belongs to #GVariant and must not be freed.
      Returns: the type string for the type of value
  */
  string getTypeString()
  {
    const(char)* _cretval;
    _cretval = g_variant_get_type_string(cast(GVariant*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the 16-bit unsigned integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_UINT16`.
      Returns: a #guint16
  */
  ushort getUint16()
  {
    ushort _retval;
    _retval = g_variant_get_uint16(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 32-bit unsigned integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_UINT32`.
      Returns: a #guint32
  */
  uint getUint32()
  {
    uint _retval;
    _retval = g_variant_get_uint32(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the 64-bit unsigned integer value of value.
      
      It is an error to call this function with a value of any type
      other than `G_VARIANT_TYPE_UINT64`.
      Returns: a #guint64
  */
  ulong getUint64()
  {
    ulong _retval;
    _retval = g_variant_get_uint64(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Unboxes value.  The result is the #GVariant instance that was
      contained in value.
      Returns: the item contained in the variant
  */
  glib.variant.Variant getVariant()
  {
    GVariant* _cretval;
    _cretval = g_variant_get_variant(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a hash value for a #GVariant instance.
      
      The output of this function is guaranteed to be the same for a given
      value only per-process.  It may change between different processor
      architectures or even different versions of GLib.  Do not use this
      function as a basis for building protocols or file formats.
      
      The type of value is #gconstpointer only to allow use of this
      function with #GHashTable.  value must be a #GVariant.
      Returns: a hash value corresponding to value
  */
  uint hash()
  {
    uint _retval;
    _retval = g_variant_hash(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Checks if value is a container.
      Returns: true if value is a container
  */
  bool isContainer()
  {
    bool _retval;
    _retval = cast(bool)g_variant_is_container(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether value has a floating reference count.
      
      This function should only ever be used to assert that a given variant
      is or is not floating, or for debug purposes. To acquire a reference
      to a variant that might be floating, always use [glib.variant.Variant.refSink]
      or [glib.variant.Variant.takeRef].
      
      See [glib.variant.Variant.refSink] for more information about floating reference
      counts.
      Returns: whether value is floating
  */
  bool isFloating()
  {
    bool _retval;
    _retval = cast(bool)g_variant_is_floating(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Checks if value is in normal form.
      
      The main reason to do this is to detect if a given chunk of
      serialized data is in normal form: load the data into a #GVariant
      using [glib.variant.Variant.newFromData] and then use this function to
      check.
      
      If value is found to be in normal form then it will be marked as
      being trusted.  If the value was already marked as being trusted then
      this function will immediately return true.
      
      There may be implementation specific restrictions on deeply nested values.
      GVariant is guaranteed to handle nesting up to at least 64 levels.
      Returns: true if value is in normal form
  */
  bool isNormalForm()
  {
    bool _retval;
    _retval = cast(bool)g_variant_is_normal_form(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a value has a type matching the provided type.
  
      Params:
        type = a #GVariantType
      Returns: true if the type of value matches type
  */
  bool isOfType(glib.variant_type.VariantType type)
  {
    bool _retval;
    _retval = cast(bool)g_variant_is_of_type(cast(GVariant*)this._cPtr, type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Looks up a value in a dictionary #GVariant.
      
      This function works with dictionaries of the type a{s*} (and equally
      well with type a{o*}, but we only further discuss the string case
      for sake of clarity).
      
      In the event that dictionary has the type a{sv}, the expected_type
      string specifies what type of value is expected to be inside of the
      variant. If the value inside the variant has a different type then
      null is returned. In the event that dictionary has a value type other
      than v then expected_type must directly match the value type and it is
      used to unpack the value directly or an error occurs.
      
      In either case, if key is not found in dictionary, null is returned.
      
      If the key is found and the value has the correct type, it is
      returned.  If expected_type was specified then any non-null return
      value will have this type.
      
      This function is currently implemented with a linear scan.  If you
      plan to do many lookups then #GVariantDict may be more efficient.
  
      Params:
        key = the key to look up in the dictionary
        expectedType = a #GVariantType, or null
      Returns: the value of the dictionary key, or null
  */
  glib.variant.Variant lookupValue(string key, glib.variant_type.VariantType expectedType = null)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_variant_lookup_value(cast(GVariant*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Determines the number of children in a container #GVariant instance.
      This includes variants, maybes, arrays, tuples and dictionary
      entries.  It is an error to call this function on any other type of
      #GVariant.
      
      For variants, the return value is always 1.  For values with maybe
      types, it is always zero or one.  For arrays, it is the length of the
      array.  For tuples it is the number of tuple items (which depends
      only on the type).  For dictionary entries, it is always 2
      
      This function is O(1).
      Returns: the number of children in the container
  */
  size_t nChildren()
  {
    size_t _retval;
    _retval = g_variant_n_children(cast(GVariant*)this._cPtr);
    return _retval;
  }

  /**
      Pretty-prints value in the format understood by [glib.variant.Variant.parse].
      
      The format is described [here][gvariant-text].
      
      If type_annotate is true, then type information is included in
      the output.
  
      Params:
        typeAnnotate = true if type information should be included in
                          the output
      Returns: a newly-allocated string holding the result.
  */
  string print(bool typeAnnotate)
  {
    char* _cretval;
    _cretval = g_variant_print(cast(GVariant*)this._cPtr, typeAnnotate);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      #GVariant uses a floating reference count system.  All functions with
      names starting with `g_variant_new_` return floating
      references.
      
      Calling [glib.variant.Variant.refSink] on a #GVariant with a floating reference
      will convert the floating reference into a full reference.  Calling
      [glib.variant.Variant.refSink] on a non-floating #GVariant results in an
      additional normal reference being added.
      
      In other words, if the value is floating, then this call "assumes
      ownership" of the floating reference, converting it to a normal
      reference.  If the value is not floating, then this call adds a
      new normal reference increasing the reference count by one.
      
      All calls that result in a #GVariant instance being inserted into a
      container will call [glib.variant.Variant.refSink] on the instance.  This means
      that if the value was just created (and has only its floating
      reference) then the container will assume sole ownership of the value
      at that point and the caller will not need to unreference it.  This
      makes certain common styles of programming much easier while still
      maintaining normal refcounting semantics in situations where values
      are not floating.
      Returns: the same value
  */
  glib.variant.Variant refSink()
  {
    GVariant* _cretval;
    _cretval = g_variant_ref_sink(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Stores the serialized form of value at data.  data should be
      large enough.  See [glib.variant.Variant.getSize].
      
      The stored data is in machine native byte order but may not be in
      fully-normalised form if read from an untrusted source.  See
      [glib.variant.Variant.getNormalForm] for a solution.
      
      As with [glib.variant.Variant.getData], to be able to deserialize the
      serialized variant successfully, its type and (if the destination
      machine might be different) its endianness must also be available.
      
      This function is approximately O(n) in the size of data.
  
      Params:
        data = the location to store the serialized data at
  */
  void store(void* data)
  {
    g_variant_store(cast(GVariant*)this._cPtr, data);
  }

  /**
      If value is floating, sink it.  Otherwise, do nothing.
      
      Typically you want to use [glib.variant.Variant.refSink] in order to
      automatically do the correct thing with respect to floating or
      non-floating references, but there is one specific scenario where
      this function is helpful.
      
      The situation where this function is helpful is when creating an API
      that allows the user to provide a callback function that returns a
      #GVariant.  We certainly want to allow the user the flexibility to
      return a non-floating reference from this callback (for the case
      where the value that is being returned already exists).
      
      At the same time, the style of the #GVariant API makes it likely that
      for newly-created #GVariant instances, the user can be saved some
      typing if they are allowed to return a #GVariant with a floating
      reference.
      
      Using this function on the return value of the user's callback allows
      the user to do whichever is more convenient for them.  The caller
      will always receives exactly one full reference to the value: either
      the one that was returned in the first place, or a floating reference
      that has been converted to a full reference.
      
      This function has an odd interaction when combined with
      [glib.variant.Variant.refSink] running at the same time in another thread on
      the same #GVariant instance.  If [glib.variant.Variant.refSink] runs first then
      the result will be that the floating reference is converted to a hard
      reference.  If [glib.variant.Variant.takeRef] runs first then the result will
      be that the floating reference is converted to a hard reference and
      an additional reference on top of that one is added.  It is best to
      avoid this situation.
      Returns: the same value
  */
  glib.variant.Variant takeRef()
  {
    GVariant* _cretval;
    _cretval = g_variant_take_ref(cast(GVariant*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Determines if a given string is a valid D-Bus object path.  You
      should ensure that a string is a valid D-Bus object path before
      passing it to [glib.variant.Variant.newObjectPath].
      
      A valid object path starts with `/` followed by zero or more
      sequences of characters separated by `/` characters.  Each sequence
      must contain only the characters `[A-Z][a-z][0-9]_`.  No sequence
      (including the one following the final `/` character) may be empty.
  
      Params:
        string_ = a normal C nul-terminated string
      Returns: true if string is a D-Bus object path
  */
  static bool isObjectPath(string string_)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _retval = cast(bool)g_variant_is_object_path(_string_);
    return _retval;
  }

  /**
      Determines if a given string is a valid D-Bus type signature.  You
      should ensure that a string is a valid D-Bus type signature before
      passing it to [glib.variant.Variant.newSignature].
      
      D-Bus type signatures consist of zero or more definite #GVariantType
      strings in sequence.
  
      Params:
        string_ = a normal C nul-terminated string
      Returns: true if string is a D-Bus type signature
  */
  static bool isSignature(string string_)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _retval = cast(bool)g_variant_is_signature(_string_);
    return _retval;
  }

  /**
      Pretty-prints a message showing the context of a #GVariant parse
      error within the string for which parsing was attempted.
      
      The resulting string is suitable for output to the console or other
      monospace media where newlines are treated in the usual way.
      
      The message will typically look something like one of the following:
      
      ```
      unterminated string constant:
        (1, 2, 3, 'abc
                  ^^^^
      ```
      
      or
      
      ```
      unable to find a common type:
        [1, 2, 3, 'str']
         ^        ^^^^^
      ```
      
      The format of the message may change in a future version.
      
      error must have come from a failed attempt to [glib.variant.Variant.parse] and
      source_str must be exactly the same string that caused the error.
      If source_str was not nul-terminated when you passed it to
      [glib.variant.Variant.parse] then you must add nul termination before using this
      function.
  
      Params:
        error = a #GError from the #GVariantParseError domain
        sourceStr = the string that was given to the parser
      Returns: the printed message
  */
  static string parseErrorPrintContext(glib.error.ErrorWrap error, string sourceStr)
  {
    char* _cretval;
    const(char)* _sourceStr = sourceStr.toCString(No.Alloc);
    _cretval = g_variant_parse_error_print_context(error ? cast(GError*)error._cPtr : null, _sourceStr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  static glib.types.Quark parseErrorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_variant_parse_error_quark();
    return _retval;
  }
}

class VariantParseException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.variant.Variant.parseErrorQuark, cast(int)code, msg);
  }

  alias Code = VariantParseError;
}

/**
* Template to create a GVariant from a single D value.
* Params:
*   T = The type of the value
*   val = The value to assign to the new Variant.
* Returns: New variant C instance with floating reference
*/
GVariant* createVariant(T)(T val)
{
  static if (is(T == bool))
    return g_variant_new_boolean(val);
  else static if (is(T == byte) || is(T == ubyte))
    return g_variant_new_byte(cast(ubyte)val);
  else static if (is(T == short))
    return g_variant_new_int16(val);
  else static if (is(T == ushort))
    return g_variant_new_uint16(val);
  else static if (is(T == int))
    return g_variant_new_int32(val);
  else static if (is(T == uint))
    return g_variant_new_uint32(val);
  else static if (is(T == long))
    return g_variant_new_int64(val);
  else static if (is(T == ulong))
    return g_variant_new_uint64(val);
  else static if (is(T == float) || is(T == double))
    return g_variant_new_double(val);
  else static if (isSomeString!T)
    return g_variant_new_string(toCString(val.to!string, No.Alloc));
  else static if (is(T : E[], E))
  {
    auto variantType = g_variant_type_new(VariantType.getStr!T.toCString(No.Alloc)); // ++ new
    GVariantBuilder builder;
    g_variant_builder_init(&builder, variantType);
    g_variant_type_free(variantType); // -- free

    foreach (item; val)
      g_variant_builder_add_value(&builder, createVariant(item)); // !! takes over floating reference of new GVariant

    return g_variant_builder_end(&builder);
  }
  else static if (is(T : V[K], V, K)) // Dictionary
  {
    auto variantType = g_variant_type_new(VariantType.getStr!T.toCString(No.Alloc)); // ++ new
    GVariantBuilder builder;
    g_variant_builder_init(&builder, variantType);
    g_variant_type_free(variantType); // -- free

    foreach (k, v; val)
      g_variant_builder_add_value(&builder, g_variant_new_dict_entry(createVariant(k), createVariant(v))); // !! takes over floating reference of new GVariant

    return g_variant_builder_end(&builder);
  }
  else static if (is(T : Variant))
    return g_variant_new_variant(cast(GVariant*)val._cPtr);
  else static if (is(T == GVariant*))
    return g_variant_new_variant(val);
  else static if (is(T == StdVariant)) // std.variant.Variant (only basic types supported currently)
  {
    if (val.type is typeid(bool))
      return createVariant(val.get!bool);
    else if (val.type is typeid(byte) || val.type is typeid(ubyte))
      return createVariant(val.coerce!byte);
    else if (val.type is typeid(short))
      return createVariant(val.get!short);
    else if (val.type is typeid(ushort))
      return createVariant(val.get!ushort);
    else if (val.type is typeid(int))
      return createVariant(val.get!int);
    else if (val.type is typeid(uint))
      return createVariant(val.get!uint);
    else if (val.type is typeid(long))
      return createVariant(val.get!long);
    else if (val.type is typeid(ulong))
      return createVariant(val.get!ulong);
    else if (val.type is typeid(float) || val.type is typeid(double))
      return createVariant(val.coerce!double);
    else if (val.type is typeid(string) || val.type is typeid(wstring) || val.type is typeid(dstring))
      return createVariant(val.coerce!string);
    else
      assert(false, "Variant.createVariant does not support D Variant type " ~ val.type.to!string);
  }
  else static if (isTypeTuple!T)
    return createVariant(val.expand);
  else
    static assert(false, "Unsupported type for Variant.createVariant: " ~ T.stringof);
}

/**
* Template to create a new tuple GVariant from multiple D values.
* Params:
*   T = The D types to create the variant from
*   vals = The values to assign
* Returns: New variant C instance with floating reference
*/
GVariant* createVariant(T...)(T vals)
if (vals.length > 1)
{
  return createVariantTuple!T(vals);
}

/**
* Template to create a new tuple GVariant from one or more D values.
* Params:
*   T = The D types to create the variant from
*   vals = The values to assign
* Returns: New variant C instance with floating reference
*/
GVariant* createVariantTuple(T...)(T vals)
{
  auto variantType = g_variant_type_new("r"); // ++ new
  GVariantBuilder builder;
  g_variant_builder_init(&builder, variantType);
  g_variant_type_free(variantType); // -- free

  foreach (v; vals)
    g_variant_builder_add_value(&builder, createVariant(v)); // !! takes over floating reference of new GVariant

  return g_variant_builder_end(&builder);
}

/**
* Template to get a single value from a GVariant
* Params:
*   T = D type of the value to get
*   v = GVariant struct pointer
* Returns: The single variant value of type `T`
*/
T getVal(T)(GVariant* v)
{
  static if (is(T == bool))
    return g_variant_get_boolean(v);
  else static if (is(T == byte) || is(T == ubyte))
    return cast(T)g_variant_get_byte(v);
  else static if (is(T == short))
    return g_variant_get_int16(v);
  else static if (is(T == ushort))
    return g_variant_get_uint16(v);
  else static if (is(T == int))
    return g_variant_get_int32(v);
  else static if (is(T == uint))
    return g_variant_get_uint32(v);
  else static if (is(T == long))
    return g_variant_get_int64(v);
  else static if (is(T == ulong))
    return g_variant_get_uint64(v);
  else static if (is(T == float) || is(T == double))
    return cast(T)g_variant_get_double(v);
  else static if (isSomeString!T)
    return fromCString(g_variant_get_string(v, null), No.Free); // g_variant_get_string second argument is an optional output length parameter
  else static if (is(T : E[], E))
  {
    T valArray;
    valArray.length = g_variant_n_children(v);

    foreach (i; 0 .. valArray.length)
      valArray[i] = getVal!E(g_variant_get_child_value(v, i));

    return valArray;
  }
  else static if (is(T : V[K], V, K)) // Dictionary
  {
    T dict;

    foreach (i; 0 .. g_variant_n_children(v))
    {
      auto dv = g_variant_get_child_value(v, i);
      dict[getVal!K(g_variant_get_child_value(dv, 0))] = getVal!V(g_variant_get_child_value(dv, 1)); // GVariant dict entries hold 2 values (key, value)
    }

    return dict;
  }
  else static if ((is(T : Variant)))
    return new Variant(v, No.Take);
  else static if ((is(T == GVariant*)))
    return g_variant_get_variant(v);
  else static if (is(T == StdVariant)) // std.variant.Variant (only basic types supported currently)
  {
    if (g_variant_type_is_basic(g_variant_get_type(v)))
    {
      switch (g_variant_get_type_string(v)[0])
      {
        case 'b':
        return Variant(getVal!bool(v));
        case 'y':
        return Variant(cast(T)getVal!byte(v));
        case 'n':
        return Variant(getVal!short(v));
        case 'q':
        return Variant(getVal!ushort(v));
        case 'i':
        return Variant(getVal!int(v));
        case 'u':
        return Variant(getVal!uint(v));
        case 'x':
        return Variant(getVal!long(v));
        case 't':
        return Variant(getVal!ulong(v));
        case 'd':
        return Variant(getVal!double(v));
        case 's':
        return Variant(getVal!string(v));
        default:
        assert(false, "Variant.getVal has unexpected type string");
      }
    }
  }
  else static if (isTypeTuple!T)
    return getVal(val.expand);
  else
    static assert(false, "Unsupported type for Variant.getVal: " ~ T.stringof);
}

/**
* Template to get multiple values from a GVariant
* Params:
*   T = D types of the values to get
*   v = GVariant struct pointer
* Returns: A tuple containing the values from the Variant of the specified types
*/
auto getVal(T...)(GVariant* v)
if (T.length > 1)
{
  return getValTuple!T(v);
}

/**
* Template to get one or more values from a container GVariant
* Params:
*   T = D types of the values to get
*   v = GVariant struct pointer
* Returns: A tuple containing the values from the container Variant of the specified types
*/
auto getValTuple(T...)(GVariant* v)
{
  Tuple!T vals;

  foreach (i, E; T)
    vals[i] = getVal!E(g_variant_get_child_value(v, i));

  return vals;
}
