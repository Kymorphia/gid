/// Module for [Numeric] class
module gda.numeric;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    Holds numbers represented as strings.
    
    This struct must be considered as opaque. Any access to its members must use its
    accessors added since version 5.0.2.
*/
class Numeric : gobject.boxed.Boxed
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
    return cast(void function())gda_numeric_get_type != &gidSymbolNotFound ? gda_numeric_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Numeric self()
  {
    return this;
  }

  /**
      Get `number` field.
      Returns: a string representing a number
  */
  @property string number()
  {
    return cToD!(string)(cast(void*)(cast(GdaNumeric*)this._cPtr).number);
  }

  /**
      Set `number` field.
      Params:
        propval = a string representing a number
  */
  @property void number(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaNumeric*)this._cPtr).number);
    dToC(propval, cast(void*)&(cast(GdaNumeric*)this._cPtr).number);
  }

  /**
      Get `precision` field.
      Returns: precision to use when @number is converted (not implemented jet)
  */
  @property glong precision()
  {
    return (cast(GdaNumeric*)this._cPtr).precision;
  }

  /**
      Set `precision` field.
      Params:
        propval = precision to use when @number is converted (not implemented jet)
  */
  @property void precision(glong propval)
  {
    (cast(GdaNumeric*)this._cPtr).precision = propval;
  }

  /**
      Get `width` field.
      Returns: not implemented jet
  */
  @property glong width()
  {
    return (cast(GdaNumeric*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = not implemented jet
  */
  @property void width(glong propval)
  {
    (cast(GdaNumeric*)this._cPtr).width = propval;
  }

  /**
      Creates a new #GdaNumeric with defaults.
      Returns: a new #GdaNumeric.
  */
  this()
  {
    GdaNumeric* _cretval;
    _cretval = gda_numeric_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GdaNumeric structure from an existing one.
      Returns: a newly allocated #GdaNumeric which contains a copy of information in boxed.
        
        Free-function: gda_numeric_free
  */
  gda.numeric.Numeric copy()
  {
    GdaNumeric* _cretval;
    _cretval = gda_numeric_copy(cast(GdaNumeric*)this._cPtr);
    auto _retval = _cretval ? new gda.numeric.Numeric(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  double getDouble()
  {
    double _retval;
    _retval = gda_numeric_get_double(cast(const(GdaNumeric)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the precision of a #GdaNumeric.
      Returns: an integer with the precision of a #GdaNumeric.
  */
  glong getPrecision()
  {
    glong _retval;
    _retval = gda_numeric_get_precision(cast(const(GdaNumeric)*)this._cPtr);
    return _retval;
  }

  /**
      Get the string representation of numeric, in the C locale format (dot as a fraction separator).
      Returns: a new string representing the stored valued in numeric
  */
  string getString()
  {
    char* _cretval;
    _cretval = gda_numeric_get_string(cast(const(GdaNumeric)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the width of a #GdaNumeric. (Not yet implemented).
      Returns: an integer with the width of a #GdaNumeric. (Not jet implemented).
  */
  glong getWidth()
  {
    glong _retval;
    _retval = gda_numeric_get_width(cast(const(GdaNumeric)*)this._cPtr);
    return _retval;
  }

  /**
      Sets numeric using a #gdouble represented by number.
  
      Params:
        number = a #gdouble
  */
  void setDouble(double number)
  {
    gda_numeric_set_double(cast(GdaNumeric*)this._cPtr, number);
  }

  /**
      Sets numeric with a number represented by str, in the C locale format (dot as a fraction separator).
  
      Params:
        str = a string representing a number, in the C locale format
  */
  void setFromString(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gda_numeric_set_from_string(cast(GdaNumeric*)this._cPtr, _str);
  }

  /**
      Sets the precision of a #GdaNumeric.
  
      Params:
        precision = a #glong
  */
  void setPrecision(glong precision)
  {
    gda_numeric_set_precision(cast(GdaNumeric*)this._cPtr, precision);
  }

  /**
      Sets the width of a #GdaNumeric. (Not yet implemented).
  
      Params:
        width = a #glong
  */
  void setWidth(glong width)
  {
    gda_numeric_set_width(cast(GdaNumeric*)this._cPtr, width);
  }
}
