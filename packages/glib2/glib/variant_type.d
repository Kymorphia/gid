/// Module for [VariantType] class
module glib.variant_type;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;


import glib.variant;
import std.traits : isSomeString;
import std.typecons : isTuple;

/**
    A type in the [glib.variant.Variant] type system.
    
    This section introduces the [glib.variant.Variant] type system. It is based, in
    large part, on the D-Bus type system, with two major changes and
    some minor lifting of restrictions. The
    [D-Bus specification](http://dbus.freedesktop.org/doc/dbus-specification.html),
    therefore, provides a significant amount of
    information that is useful when working with [glib.variant.Variant].
    
    The first major change with respect to the D-Bus type system is the
    introduction of maybe (or ‘nullable’) types.  Any type in [glib.variant.Variant]
    can be converted to a maybe type, in which case, `nothing` (or `null`)
    becomes a valid value.  Maybe types have been added by introducing the
    character `m` to type strings.
    
    The second major change is that the [glib.variant.Variant] type system supports
    the concept of ‘indefinite types’ — types that are less specific than
    the normal types found in D-Bus.  For example, it is possible to speak
    of ‘an array of any type’ in [glib.variant.Variant], where the D-Bus type system
    would require you to speak of ‘an array of integers’ or ‘an array of
    strings’.  Indefinite types have been added by introducing the
    characters `*`, `?` and `r` to type strings.
    
    Finally, all arbitrary restrictions relating to the complexity of
    types are lifted along with the restriction that dictionary entries
    may only appear nested inside of arrays.
    
    Just as in D-Bus, [glib.variant.Variant] types are described with strings (‘type
    strings’).  Subject to the differences mentioned above, these strings
    are of the same form as those found in D-Bus.  Note, however: D-Bus
    always works in terms of messages and therefore individual type
    strings appear nowhere in its interface.  Instead, ‘signatures’
    are a concatenation of the strings of the type of each argument in a
    message.  [glib.variant.Variant] deals with single values directly so
    [glib.variant.Variant] type strings always describe the type of exactly one
    value.  This means that a D-Bus signature string is generally not a valid
    [glib.variant.Variant] type string — except in the case that it is the signature
    of a message containing exactly one argument.
    
    An indefinite type is similar in spirit to what may be called an
    abstract type in other type systems.  No value can exist that has an
    indefinite type as its type, but values can exist that have types
    that are subtypes of indefinite types.  That is to say,
    [glib.variant.Variant.getType] will never return an indefinite type, but
    calling [glib.variant.Variant.isOfType] with an indefinite type may return
    true.  For example, you cannot have a value that represents ‘an
    array of no particular type’, but you can have an ‘array of integers’
    which certainly matches the type of ‘an array of no particular type’,
    since ‘array of integers’ is a subtype of ‘array of no particular
    type’.
    
    This is similar to how instances of abstract classes may not
    directly exist in other type systems, but instances of their
    non-abstract subtypes may.  For example, in GTK, no object that has
    the type of [[gtk.widget.Widget]](https://docs.gtk.org/gtk4/class.Widget.html) can
    exist (since [gtk.widget.Widget] is an abstract class), but a [[gtk.window.Window]](https://docs.gtk.org/gtk4/class.Window.html)
    can certainly be instantiated, and you would say that a [gtk.window.Window] is a
    [gtk.widget.Widget] (since [gtk.window.Window] is a subclass of [gtk.widget.Widget]).
    
    Two types may not be compared by value; use [glib.variant_type.VariantType.equal]
    or [glib.variant_type.VariantType.isSubtypeOf]  May be copied using
    [glib.variant_type.VariantType.copy] and freed using [glib.variant_type.VariantType.free].
    
    ## GVariant Type Strings
    
    A [glib.variant.Variant] type string can be any of the following:
    
    $(LIST
      * any basic type string (listed below)
      * `v`, `r` or `*`
      * one of the characters `a` or `m`, followed by another type string
      * the character `(`, followed by a concatenation of zero or more other
        type strings, followed by the character `)`
      * the character `{`, followed by a basic type string (see below),
        followed by another type string, followed by the character `}`
    )
      
    A basic type string describes a basic type (as per
    [glib.variant_type.VariantType.isBasic]) and is always a single character in
    length. The valid basic type strings are `b`, `y`, `n`, `q`, `i`, `u`, `x`,
    `t`, `h`, `d`, `s`, `o`, `g` and `?`.
    
    The above definition is recursive to arbitrary depth. `aaaaai` and
    `(ui(nq((y)))s)` are both valid type strings, as is
    `a(aa(ui)(qna{ya(yd)}))`. In order to not hit memory limits,
    [glib.variant.Variant] imposes a limit on recursion depth of 65 nested
    containers. This is the limit in the D-Bus specification (64) plus one to
    allow a [[gio.dbus_message.DBusMessage]](../gio/class.DBusMessage.html) to be nested in
    a top-level tuple.
    
    The meaning of each of the characters is as follows:
    
    $(LIST
      * `b`: the type string of `G_VARIANT_TYPE_BOOLEAN`; a boolean value.
      * `y`: the type string of `G_VARIANT_TYPE_BYTE`; a byte.
      * `n`: the type string of `G_VARIANT_TYPE_INT16`; a signed 16 bit integer.
      * `q`: the type string of `G_VARIANT_TYPE_UINT16`; an unsigned 16 bit integer.
      * `i`: the type string of `G_VARIANT_TYPE_INT32`; a signed 32 bit integer.
      * `u`: the type string of `G_VARIANT_TYPE_UINT32`; an unsigned 32 bit integer.
      * `x`: the type string of `G_VARIANT_TYPE_INT64`; a signed 64 bit integer.
      * `t`: the type string of `G_VARIANT_TYPE_UINT64`; an unsigned 64 bit integer.
      * `h`: the type string of `G_VARIANT_TYPE_HANDLE`; a signed 32 bit value
        that, by convention, is used as an index into an array of file
        descriptors that are sent alongside a D-Bus message.
      * `d`: the type string of `G_VARIANT_TYPE_DOUBLE`; a double precision
        floating point value.
      * `s`: the type string of `G_VARIANT_TYPE_STRING`; a string.
      * `o`: the type string of `G_VARIANT_TYPE_OBJECT_PATH`; a string in the form
        of a D-Bus object path.
      * `g`: the type string of `G_VARIANT_TYPE_SIGNATURE`; a string in the form of
        a D-Bus type signature.
      * `?`: the type string of `G_VARIANT_TYPE_BASIC`; an indefinite type that
        is a supertype of any of the basic types.
      * `v`: the type string of `G_VARIANT_TYPE_VARIANT`; a container type that
        contain any other type of value.
      * `a`: used as a prefix on another type string to mean an array of that
        type; the type string `ai`, for example, is the type of an array of
        signed 32-bit integers.
      * `m`: used as a prefix on another type string to mean a ‘maybe’, or
        ‘nullable’, version of that type; the type string `ms`, for example,
        is the type of a value that maybe contains a string, or maybe contains
        nothing.
      * `()`: used to enclose zero or more other concatenated type strings to
        create a tuple type; the type string `(is)`, for example, is the type of
        a pair of an integer and a string.
      * `r`: the type string of `G_VARIANT_TYPE_TUPLE`; an indefinite type that is
        a supertype of any tuple type, regardless of the number of items.
      * `{}`: used to enclose a basic type string concatenated with another type
        string to create a dictionary entry type, which usually appears inside of
        an array to form a dictionary; the type string `a{sd}`, for example, is
        the type of a dictionary that maps strings to double precision floating
        point values.
      
        The first type (the basic type) is the key type and the second type is
        the value type. The reason that the first type is restricted to being a
        basic type is so that it can easily be hashed.
      * `*`: the type string of `G_VARIANT_TYPE_ANY`; the indefinite type that is
        a supertype of all types.  Note that, as with all type strings, this
        character represents exactly one type. It cannot be used inside of tuples
        to mean ‘any number of items’.
    )
      
    Any type string of a container that contains an indefinite type is,
    itself, an indefinite type. For example, the type string `a*`
    (corresponding to `G_VARIANT_TYPE_ARRAY`) is an indefinite type
    that is a supertype of every array type. `(*s)` is a supertype
    of all tuples that contain exactly two items where the second
    item is a string.
    
    `a{?*}` is an indefinite type that is a supertype of all arrays
    containing dictionary entries where the key is any basic type and
    the value is any type at all.  This is, by definition, a dictionary,
    so this type string corresponds to `G_VARIANT_TYPE_DICTIONARY`. Note
    that, due to the restriction that the key of a dictionary entry must
    be a basic type, `{**}` is not a valid type string.
*/
class VariantType : Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_variant_type_get_gtype != &gidSymbolNotFound ? g_variant_type_get_gtype() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VariantType self()
  {
    return this;
  }

  /**
  * Template for creating a new VariantType from one or more D types
  * Params:
  *   T = One or more D types to create a VariantType for
  * Returns: New variant type
  */
  static VariantType create(T...)()
  {
    return new VariantType(getStr!T);
  }

  /**
  * Template to get a variant type string from one or more D types (type strings are concatenated)
  * Params:
  *   T = One or more D types to create a VariantType for
  * Returns: Variant type string which can be used with VariantType
  */
  static string getStr(T...)()
  {
    char[] typeStr;

    foreach (Arg; T)
    {
      static if (is(Arg == bool))
        typeStr ~= "b";
      else static if (is(Arg == byte) || is(Arg == ubyte))
        typeStr ~= "y";
      else static if (is(Arg == short))
        typeStr ~= "n";
      else static if (is(Arg == ushort))
        typeStr ~= "q";
      else static if (is(Arg == int))
        typeStr ~= "i";
      else static if (is(Arg == uint))
        typeStr ~= "u";
      else static if (is(Arg == long))
        typeStr ~= "x";
      else static if (is(Arg == ulong))
        typeStr ~= "t";
      else static if (is(Arg == float) || is(Arg == double))
        typeStr ~= "d";
      else static if (isSomeString!Arg)
        typeStr ~= "s";
      else static if (is(Arg : E[], E))
        typeStr ~= "a" ~ getStr!E;
      else static if (is(Arg : V[K], V, K))
        typeStr ~= "a{" ~ getStr!K ~ getStr!V ~ "}";
      else static if (is(Arg : glib.variant.Variant))
        typeStr ~= "v";
      else static if (isTuple!Arg)
        typeStr ~= "r";
      else
        static assert(false, "Unsupported type for Variant creation: " ~ Arg.stringof);
    }

    return cast(string)typeStr;
  }

  /**
      Creates a new #GVariantType corresponding to the type string given
      by type_string.  It is appropriate to call [glib.variant_type.VariantType.free] on
      the return value.
      
      It is a programmer error to call this function with an invalid type
      string.  Use [glib.variant_type.VariantType.stringIsValid] if you are unsure.
  
      Params:
        typeString = a valid GVariant type string
      Returns: a new #GVariantType
  */
  this(string typeString)
  {
    GVariantType* _cretval;
    const(char)* _typeString = typeString.toCString(No.Alloc);
    _cretval = g_variant_type_new(_typeString);
    this(_cretval, Yes.Take);
  }

  /**
      Constructs the type corresponding to an array of elements of the
      type type.
      
      It is appropriate to call [glib.variant_type.VariantType.free] on the return value.
  
      Params:
        element = a #GVariantType
      Returns: a new array #GVariantType
        
        Since 2.24
  */
  static glib.variant_type.VariantType newArray(glib.variant_type.VariantType element)
  {
    GVariantType* _cretval;
    _cretval = g_variant_type_new_array(element ? cast(const(GVariantType)*)element._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs the type corresponding to a dictionary entry with a key
      of type key and a value of type value.
      
      It is appropriate to call [glib.variant_type.VariantType.free] on the return value.
  
      Params:
        key = a basic #GVariantType
        value = a #GVariantType
      Returns: a new dictionary entry #GVariantType
        
        Since 2.24
  */
  static glib.variant_type.VariantType newDictEntry(glib.variant_type.VariantType key, glib.variant_type.VariantType value)
  {
    GVariantType* _cretval;
    _cretval = g_variant_type_new_dict_entry(key ? cast(const(GVariantType)*)key._cPtr(No.Dup) : null, value ? cast(const(GVariantType)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs the type corresponding to a maybe instance containing
      type type or Nothing.
      
      It is appropriate to call [glib.variant_type.VariantType.free] on the return value.
  
      Params:
        element = a #GVariantType
      Returns: a new maybe #GVariantType
        
        Since 2.24
  */
  static glib.variant_type.VariantType newMaybe(glib.variant_type.VariantType element)
  {
    GVariantType* _cretval;
    _cretval = g_variant_type_new_maybe(element ? cast(const(GVariantType)*)element._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new tuple type, from items.
      
      length is the number of items in items, or -1 to indicate that
      items is null-terminated.
      
      It is appropriate to call [glib.variant_type.VariantType.free] on the return value.
  
      Params:
        items = an array of #GVariantTypes, one for each item
      Returns: a new tuple #GVariantType
        
        Since 2.24
  */
  static glib.variant_type.VariantType newTuple(glib.variant_type.VariantType[] items)
  {
    GVariantType* _cretval;
    int _length;
    if (items)
      _length = cast(int)items.length;

    GVariantType*[] _tmpitems;
    foreach (obj; items)
      _tmpitems ~= cast(GVariantType*)obj._cPtr;
    const(GVariantType*)* _items = _tmpitems.ptr;

    _cretval = g_variant_type_new_tuple(_items, _length);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Makes a copy of a #GVariantType.  It is appropriate to call
      [glib.variant_type.VariantType.free] on the return value.  type may not be null.
      Returns: a new #GVariantType
        
        Since 2.24
  */
  glib.variant_type.VariantType copy()
  {
    GVariantType* _cretval;
    _cretval = g_variant_type_copy(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a newly-allocated copy of the type string corresponding to
      type.  The returned string is nul-terminated.  It is appropriate to
      call [glib.global.gfree] on the return value.
      Returns: the corresponding type string
        
        Since 2.24
  */
  string dupString()
  {
    char* _cretval;
    _cretval = g_variant_type_dup_string(cast(const(GVariantType)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Determines the element type of an array or maybe type.
      
      This function may only be used with array or maybe types.
      Returns: the element type of type
        
        Since 2.24
  */
  glib.variant_type.VariantType element()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_type_element(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Compares type1 and type2 for equality.
      
      Only returns true if the types are exactly equal.  Even if one type
      is an indefinite type and the other is a subtype of it, false will
      be returned if they are not exactly equal.  If you want to check for
      subtypes, use [glib.variant_type.VariantType.isSubtypeOf].
      
      The argument types of type1 and type2 are only #gconstpointer to
      allow use with #GHashTable without function pointer casting.  For
      both arguments, a valid #GVariantType must be provided.
  
      Params:
        type2 = a #GVariantType
      Returns: true if type1 and type2 are exactly equal
        
        Since 2.24
  */
  bool equal(glib.variant_type.VariantType type2)
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_equal(cast(GVariantType*)this._cPtr, type2 ? cast(GVariantType*)type2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines the first item type of a tuple or dictionary entry
      type.
      
      This function may only be used with tuple or dictionary entry types,
      but must not be used with the generic tuple type
      `G_VARIANT_TYPE_TUPLE`.
      
      In the case of a dictionary entry type, this returns the type of
      the key.
      
      null is returned in case of type being `G_VARIANT_TYPE_UNIT`.
      
      This call, together with [glib.variant_type.VariantType.next] provides an iterator
      interface over tuple and dictionary entry types.
      Returns: the first item type of type, or null
        
        Since 2.24
  */
  glib.variant_type.VariantType first()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_type_first(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the length of the type string corresponding to the given
      type.  This function must be used to determine the valid extent of
      the memory region returned by [glib.variant_type.VariantType.peekString].
      Returns: the length of the corresponding type string
        
        Since 2.24
  */
  size_t getStringLength()
  {
    size_t _retval;
    _retval = g_variant_type_get_string_length(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Hashes type.
      
      The argument type of type is only #gconstpointer to allow use with
      #GHashTable without function pointer casting.  A valid
      #GVariantType must be provided.
      Returns: the hash value
        
        Since 2.24
  */
  uint hash()
  {
    uint _retval;
    _retval = g_variant_type_hash(cast(GVariantType*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is an array type.  This is true if the
      type string for type starts with an 'a'.
      
      This function returns true for any indefinite type for which every
      definite subtype is an array type -- `G_VARIANT_TYPE_ARRAY`, for
      example.
      Returns: true if type is an array type
        
        Since 2.24
  */
  bool isArray()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_array(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is a basic type.
      
      Basic types are booleans, bytes, integers, doubles, strings, object
      paths and signatures.
      
      Only a basic type may be used as the key of a dictionary entry.
      
      This function returns false for all indefinite types except
      `G_VARIANT_TYPE_BASIC`.
      Returns: true if type is a basic type
        
        Since 2.24
  */
  bool isBasic()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_basic(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is a container type.
      
      Container types are any array, maybe, tuple, or dictionary
      entry types plus the variant type.
      
      This function returns true for any indefinite type for which every
      definite subtype is a container -- `G_VARIANT_TYPE_ARRAY`, for
      example.
      Returns: true if type is a container type
        
        Since 2.24
  */
  bool isContainer()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_container(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is definite (ie: not indefinite).
      
      A type is definite if its type string does not contain any indefinite
      type characters ('*', '?', or 'r').
      
      A #GVariant instance may not have an indefinite type, so calling
      this function on the result of [glib.variant.Variant.getType] will always
      result in true being returned.  Calling this function on an
      indefinite type like `G_VARIANT_TYPE_ARRAY`, however, will result in
      false being returned.
      Returns: true if type is definite
        
        Since 2.24
  */
  bool isDefinite()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_definite(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is a dictionary entry type.  This is
      true if the type string for type starts with a '{'.
      
      This function returns true for any indefinite type for which every
      definite subtype is a dictionary entry type --
      `G_VARIANT_TYPE_DICT_ENTRY`, for example.
      Returns: true if type is a dictionary entry type
        
        Since 2.24
  */
  bool isDictEntry()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_dict_entry(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is a maybe type.  This is true if the
      type string for type starts with an 'm'.
      
      This function returns true for any indefinite type for which every
      definite subtype is a maybe type -- `G_VARIANT_TYPE_MAYBE`, for
      example.
      Returns: true if type is a maybe type
        
        Since 2.24
  */
  bool isMaybe()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_maybe(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Checks if type is a subtype of supertype.
      
      This function returns true if type is a subtype of supertype.  All
      types are considered to be subtypes of themselves.  Aside from that,
      only indefinite types can have subtypes.
  
      Params:
        supertype = a #GVariantType
      Returns: true if type is a subtype of supertype
        
        Since 2.24
  */
  bool isSubtypeOf(glib.variant_type.VariantType supertype)
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_subtype_of(cast(const(GVariantType)*)this._cPtr, supertype ? cast(const(GVariantType)*)supertype._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines if the given type is a tuple type.  This is true if the
      type string for type starts with a '(' or if type is
      `G_VARIANT_TYPE_TUPLE`.
      
      This function returns true for any indefinite type for which every
      definite subtype is a tuple type -- `G_VARIANT_TYPE_TUPLE`, for
      example.
      Returns: true if type is a tuple type
        
        Since 2.24
  */
  bool isTuple()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_tuple(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the given type is the variant type.
      Returns: true if type is the variant type
        
        Since 2.24
  */
  bool isVariant()
  {
    bool _retval;
    _retval = cast(bool)g_variant_type_is_variant(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines the key type of a dictionary entry type.
      
      This function may only be used with a dictionary entry type.  Other
      than the additional restriction, this call is equivalent to
      [glib.variant_type.VariantType.first].
      Returns: the key type of the dictionary entry
        
        Since 2.24
  */
  glib.variant_type.VariantType key()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_type_key(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Determines the number of items contained in a tuple or
      dictionary entry type.
      
      This function may only be used with tuple or dictionary entry types,
      but must not be used with the generic tuple type
      `G_VARIANT_TYPE_TUPLE`.
      
      In the case of a dictionary entry type, this function will always
      return 2.
      Returns: the number of items in type
        
        Since 2.24
  */
  size_t nItems()
  {
    size_t _retval;
    _retval = g_variant_type_n_items(cast(const(GVariantType)*)this._cPtr);
    return _retval;
  }

  /**
      Determines the next item type of a tuple or dictionary entry
      type.
      
      type must be the result of a previous call to
      [glib.variant_type.VariantType.first] or [glib.variant_type.VariantType.next].
      
      If called on the key type of a dictionary entry then this call
      returns the value type.  If called on the value type of a dictionary
      entry then this call returns null.
      
      For tuples, null is returned when type is the last item in a tuple.
      Returns: the next #GVariantType after type, or null
        
        Since 2.24
  */
  glib.variant_type.VariantType next()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_type_next(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Determines the value type of a dictionary entry type.
      
      This function may only be used with a dictionary entry type.
      Returns: the value type of the dictionary entry
        
        Since 2.24
  */
  glib.variant_type.VariantType value()
  {
    const(GVariantType)* _cretval;
    _cretval = g_variant_type_value(cast(const(GVariantType)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static glib.variant_type.VariantType checked(string typeString)
  {
    const(GVariantType)* _cretval;
    const(char)* _typeString = typeString.toCString(No.Alloc);
    _cretval = g_variant_type_checked_(_typeString);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static size_t stringGetDepth(string typeString)
  {
    size_t _retval;
    const(char)* _typeString = typeString.toCString(No.Alloc);
    _retval = g_variant_type_string_get_depth_(_typeString);
    return _retval;
  }

  /**
      Checks if type_string is a valid GVariant type string.  This call is
      equivalent to calling [glib.variant_type.VariantType.stringScan] and confirming
      that the following character is a nul terminator.
  
      Params:
        typeString = a pointer to any string
      Returns: true if type_string is exactly one valid type string
        
        Since 2.24
  */
  static bool stringIsValid(string typeString)
  {
    bool _retval;
    const(char)* _typeString = typeString.toCString(No.Alloc);
    _retval = cast(bool)g_variant_type_string_is_valid(_typeString);
    return _retval;
  }

  /**
      Scan for a single complete and valid GVariant type string in string.
      The memory pointed to by limit (or bytes beyond it) is never
      accessed.
      
      If a valid type string is found, endptr is updated to point to the
      first character past the end of the string that was found and true
      is returned.
      
      If there is no valid type string starting at string, or if the type
      string does not end before limit then false is returned.
      
      For the simple case of checking if a string is a valid type string,
      see [glib.variant_type.VariantType.stringIsValid].
  
      Params:
        string_ = a pointer to any string
        limit = the end of string, or null
        endptr = location to store the end pointer, or null
      Returns: true if a valid type string was found
  */
  static bool stringScan(string string_, string limit, out string endptr)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    const(char)* _limit = limit.toCString(No.Alloc);
    char* _endptr;
    _retval = cast(bool)g_variant_type_string_scan(_string_, _limit, &_endptr);
    endptr = _endptr.fromCString(Yes.Free);
    return _retval;
  }
}
