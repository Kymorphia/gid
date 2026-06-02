/// Module for [TokenValue] class
module glib.token_value;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    A union holding the value of the token.
*/
class TokenValue
{
  GTokenValue _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GTokenValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `vIdentifier` field.
      Returns: token identifier value
  */
  @property string vIdentifier() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vIdentifier);
  }

  /**
      Set `vIdentifier` field.
      Params:
        propval = token identifier value
  */
  @property void vIdentifier(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vIdentifier);
    dToC(propval, cast(void*)&(cast(GTokenValue*)this._cPtr).vIdentifier);
  }

  /**
      Get `vBinary` field.
      Returns: token binary integer value
  */
  @property gulong vBinary() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vBinary;
  }

  /**
      Set `vBinary` field.
      Params:
        propval = token binary integer value
  */
  @property void vBinary(gulong propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vBinary = propval;
  }

  /**
      Get `vOctal` field.
      Returns: octal integer value
  */
  @property gulong vOctal() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vOctal;
  }

  /**
      Set `vOctal` field.
      Params:
        propval = octal integer value
  */
  @property void vOctal(gulong propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vOctal = propval;
  }

  /**
      Get `vInt` field.
      Returns: integer value
  */
  @property gulong vInt() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vInt;
  }

  /**
      Set `vInt` field.
      Params:
        propval = integer value
  */
  @property void vInt(gulong propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vInt = propval;
  }

  /**
      Get `vInt64` field.
      Returns: 64-bit integer value
  */
  @property ulong vInt64() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vInt64;
  }

  /**
      Set `vInt64` field.
      Params:
        propval = 64-bit integer value
  */
  @property void vInt64(ulong propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vInt64 = propval;
  }

  /**
      Get `vFloat` field.
      Returns: floating point value
  */
  @property double vFloat() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vFloat;
  }

  /**
      Set `vFloat` field.
      Params:
        propval = floating point value
  */
  @property void vFloat(double propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vFloat = propval;
  }

  /**
      Get `vHex` field.
      Returns: hex integer value
  */
  @property gulong vHex() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vHex;
  }

  /**
      Set `vHex` field.
      Params:
        propval = hex integer value
  */
  @property void vHex(gulong propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vHex = propval;
  }

  /**
      Get `vString` field.
      Returns: string value
  */
  @property string vString() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vString);
  }

  /**
      Set `vString` field.
      Params:
        propval = string value
  */
  @property void vString(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vString);
    dToC(propval, cast(void*)&(cast(GTokenValue*)this._cPtr).vString);
  }

  /**
      Get `vComment` field.
      Returns: comment value
  */
  @property string vComment() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vComment);
  }

  /**
      Set `vComment` field.
      Params:
        propval = comment value
  */
  @property void vComment(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GTokenValue*)this._cPtr).vComment);
    dToC(propval, cast(void*)&(cast(GTokenValue*)this._cPtr).vComment);
  }

  /**
      Get `vChar` field.
      Returns: character value
  */
  @property ubyte vChar() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vChar;
  }

  /**
      Set `vChar` field.
      Params:
        propval = character value
  */
  @property void vChar(ubyte propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vChar = propval;
  }

  /**
      Get `vError` field.
      Returns: error value
  */
  @property uint vError() nothrow
  {
    return (cast(GTokenValue*)this._cPtr).vError;
  }

  /**
      Set `vError` field.
      Params:
        propval = error value
  */
  @property void vError(uint propval) nothrow
  {
    (cast(GTokenValue*)this._cPtr).vError = propval;
  }
}
