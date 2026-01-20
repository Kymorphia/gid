/// Module for [Binary] struct
module gda.binary;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
struct Binary
{
  /**
      the actual data as an array
  */
  ubyte* data;

  /**
      length of @data
  */
  glong binaryLength;

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
    _cretval = gda_binary_to_string(cast(const(GdaBinary)*)&this, maxlen);
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
