/// Module for [Binary] class
module gda.binary;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/** */
class Binary : gobject.boxed.Boxed
{

  /**
      Create a `binary.Binary` boxed type.
      Params:
        binaryLength = length of @data
  */
  this(glong binaryLength = glong.init)
  {
    super(gMalloc(GdaBinary.sizeof), Yes.Take);
    this.binaryLength = binaryLength;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_binary_get_type != &gidSymbolNotFound ? gda_binary_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Binary self()
  {
    return this;
  }

  /**
      Get `binaryLength` field.
      Returns: length of @data
  */
  @property glong binaryLength()
  {
    return (cast(GdaBinary*)this._cPtr).binaryLength;
  }

  /**
      Set `binaryLength` field.
      Params:
        propval = length of @data
  */
  @property void binaryLength(glong propval)
  {
    (cast(GdaBinary*)this._cPtr).binaryLength = propval;
  }

  /**
      Converts all the non printable characters of bin->data into the "\xyz" representation
      where "xyz" is the octal representation of the byte, and the '\' (backslash) character
      is converted to "\\". Printable characters (defined by g_ascii_isprint()) as well as newline
      character are not converted.
      
      Note that the backslash and newline characters are considered as printable characters and
      will not be represented by the "\xyz" representation.
      
      Use this function to get a representation as much readable by humans as possible of a binary
      chunk. Note that this function is internally called when transforming a binary value to
      a string for example when using [gobject.value.Value.transform] or [gda.global.valueStringify].
  
      Params:
        maxlen = a maximum len used to truncate, or `0` for no maximum length
      Returns: a new string from bin
  */
  string toString_(uint maxlen)
  {
    char* _cretval;
    _cretval = gda_binary_to_string(cast(const(GdaBinary)*)this._cPtr, maxlen);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new #GdaBinary structure from an existing one.
  
      Params:
        boxed = source to get a copy from.
      Returns: a newly allocated #GdaBinary which contains a copy of information in boxed.
        
        Free-function: gda_binary_free
  */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_binary_copy(boxed);
    return _retval;
  }

  /**
      Deallocates all memory associated to the given #GdaBinary.
  
      Params:
        boxed = #GdaBinary to free.
  */
  static void free(void* boxed = null)
  {
    gda_binary_free(boxed);
  }
}
