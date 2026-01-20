/// Module for [PixbufModulePattern] class
module gdkpixbuf.pixbuf_module_pattern;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.types;
import gid.gid;

/**
    The signature prefix for a module.
    
    The signature of a module is a set of prefixes. Prefixes are encoded as
    pairs of ordinary strings, where the second string, called the mask, if
    not `NULL`, must be of the same length as the first one and may contain
    ' ', '!', 'x', 'z', and 'n' to indicate bytes that must be matched,
    not matched, "don't-care"-bytes, zeros and non-zeros, respectively.
    
    Each prefix has an associated integer that describes the relevance of
    the prefix, with 0 meaning a mismatch and 100 a "perfect match".
    
    Starting with gdk-pixbuf 2.8, the first byte of the mask may be '*',
    indicating an unanchored pattern that matches not only at the beginning,
    but also in the middle. Versions prior to 2.8 will interpret the '*'
    like an 'x'.
    
    The signature of a module is stored as an array of
    `GdkPixbufModulePatterns`. The array is terminated by a pattern
    where the `prefix` is `NULL`.
    
    ```c
    GdkPixbufModulePattern *signature[] = {
      { "abcdx", " !x z", 100 },
      { "bla", NULL,  90 },
      { NULL, NULL, 0 }
    };
    ```
    
    In the example above, the signature matches e.g. "auud\0" with
    relevance 100, and "blau" with relevance 90.
*/
class PixbufModulePattern
{
  GdkPixbufModulePattern _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdkpixbuf.pixbuf_module_pattern.PixbufModulePattern");

    _cInstance = *cast(GdkPixbufModulePattern*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `prefix` field.
      Returns: the prefix for this pattern
  */
  @property string prefix()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModulePattern*)this._cPtr).prefix);
  }

  /**
      Set `prefix` field.
      Params:
        propval = the prefix for this pattern
  */
  @property void prefix(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModulePattern*)this._cPtr).prefix);
    dToC(propval, cast(void*)&(cast(GdkPixbufModulePattern*)this._cPtr).prefix);
  }

  /**
      Get `mask` field.
      Returns: mask containing bytes which modify how the prefix is matched against
         test data
  */
  @property string mask()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModulePattern*)this._cPtr).mask);
  }

  /**
      Set `mask` field.
      Params:
        propval = mask containing bytes which modify how the prefix is matched against
           test data
  */
  @property void mask(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModulePattern*)this._cPtr).mask);
    dToC(propval, cast(void*)&(cast(GdkPixbufModulePattern*)this._cPtr).mask);
  }

  /**
      Get `relevance` field.
      Returns: relevance of this pattern
  */
  @property int relevance()
  {
    return (cast(GdkPixbufModulePattern*)this._cPtr).relevance;
  }

  /**
      Set `relevance` field.
      Params:
        propval = relevance of this pattern
  */
  @property void relevance(int propval)
  {
    (cast(GdkPixbufModulePattern*)this._cPtr).relevance = propval;
  }
}
