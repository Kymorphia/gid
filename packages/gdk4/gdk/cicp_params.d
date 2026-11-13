/// Module for [CicpParams] class
module gdk.cicp_params;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.color_state;
import gdk.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/**
    Contains the parameters that define a colorstate with cicp parameters.
    
    Cicp parameters are specified in the ITU-T H.273
    [specification](https://www.itu.int/rec/T-REC-H.273/en).
    
    See the documentation of individual properties for supported values.
    
    The 'unspecified' value (2) is not treated in any special way, and
    must be replaced by a different value before creating a color state.
    
    [gdk.cicp_params.CicpParams] can be used as a builder object to construct a color
    state from Cicp data with [gdk.cicp_params.CicpParams.buildColorState].
    The function will return an error if the given parameters are not
    supported.
    
    You can obtain a [gdk.cicp_params.CicpParams] object from a color state with
    [gdk.color_state.ColorState.createCicpParams]. This can be used to
    create a variant of a color state, by changing just one of the cicp
    parameters, or just to obtain information about the color state.
*/
class CicpParams : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_cicp_params_get_type != &gidSymbolNotFound ? gdk_cicp_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkCicpParams";
  }

  /** Returns `this`, for use in `with` statements. */
  override CicpParams self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gdk.cicp_params.CicpParams]
      Returns: New builder object
  */
  static CicpParamsGidBuilder builder() nothrow
  {
    return new CicpParamsGidBuilder;
  }

  /**
      Get `colorPrimaries` property.
      Returns: The color primaries to use.
        
        Supported values:
        
        - 1: BT.709 / sRGB
        - 2: unspecified
        - 5: PAL
        - 6,7: BT.601 / NTSC
        - 9: BT.2020
        - 12: Display P3
  */
  @property uint colorPrimaries() nothrow
  {
    return getColorPrimaries();
  }

  /**
      Set `colorPrimaries` property.
      Params:
        propval = The color primaries to use.
          
          Supported values:
          
          - 1: BT.709 / sRGB
          - 2: unspecified
          - 5: PAL
          - 6,7: BT.601 / NTSC
          - 9: BT.2020
          - 12: Display P3
  */
  @property void colorPrimaries(uint propval) nothrow
  {
    setColorPrimaries(propval);
  }

  /**
      Get `matrixCoefficients` property.
      Returns: The matrix coefficients (for YUV to RGB conversion).
        
        Supported values:
        
        - 0: RGB
        - 1: BT.709
        - 2: unspecified
        - 5,6: BT.601
        - 9: BT.2020
  */
  @property uint matrixCoefficients() nothrow
  {
    return getMatrixCoefficients();
  }

  /**
      Set `matrixCoefficients` property.
      Params:
        propval = The matrix coefficients (for YUV to RGB conversion).
          
          Supported values:
          
          - 0: RGB
          - 1: BT.709
          - 2: unspecified
          - 5,6: BT.601
          - 9: BT.2020
  */
  @property void matrixCoefficients(uint propval) nothrow
  {
    setMatrixCoefficients(propval);
  }

  /**
      Get `range` property.
      Returns: Whether the data is using the full range of values.
        
        The range of the data.
  */
  @property gdk.types.CicpRange range() nothrow
  {
    return getRange();
  }

  /**
      Set `range` property.
      Params:
        propval = Whether the data is using the full range of values.
          
          The range of the data.
  */
  @property void range(gdk.types.CicpRange propval) nothrow
  {
    setRange(propval);
  }

  /**
      Get `transferFunction` property.
      Returns: The transfer function to use.
        
        Supported values:
        
        - 1,6,14,15: BT.709, BT.601, BT.2020
        - 2: unspecified
        - 4: gamma 2.2
        - 5: gamma 2.8
        - 8: linear
        - 13: sRGB
        - 16: BT.2100 PQ
        - 18: BT.2100 HLG
  */
  @property uint transferFunction() nothrow
  {
    return getTransferFunction();
  }

  /**
      Set `transferFunction` property.
      Params:
        propval = The transfer function to use.
          
          Supported values:
          
          - 1,6,14,15: BT.709, BT.601, BT.2020
          - 2: unspecified
          - 4: gamma 2.2
          - 5: gamma 2.8
          - 8: linear
          - 13: sRGB
          - 16: BT.2100 PQ
          - 18: BT.2100 HLG
  */
  @property void transferFunction(uint propval) nothrow
  {
    setTransferFunction(propval);
  }

  /**
      Creates a new [gdk.cicp_params.CicpParams] object.
      
      The initial values of the properties are the values for "undefined"
      and need to be set before a color state object can be built.
      Returns: a new [gdk.cicp_params.CicpParams]
  */
  this() nothrow
  {
    GdkCicpParams* _cretval;
    _cretval = gdk_cicp_params_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gdk.color_state.ColorState] object for the cicp parameters in self.
      
      Note that this may fail if the cicp parameters in self are not
      supported by GTK. In that case, `NULL` is returned, and error is set
      with an error message that can be presented to the user.
      Returns: A newly allocated [gdk.color_state.ColorState]
      Throws: [ErrorWrap]
  */
  gdk.color_state.ColorState buildColorState()
  {
    GdkColorState* _cretval;
    GError *_err;
    _cretval = gdk_cicp_params_build_color_state(cast(GdkCicpParams*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the value of the color-primaries property
      of self.
      Returns: the color-primaries value
  */
  uint getColorPrimaries() nothrow
  {
    uint _retval;
    _retval = gdk_cicp_params_get_color_primaries(cast(GdkCicpParams*)this._cPtr);
    return _retval;
  }

  /**
      Gets the matrix-coefficients property of self.
      Returns: the matrix-coefficients value
  */
  uint getMatrixCoefficients() nothrow
  {
    uint _retval;
    _retval = gdk_cicp_params_get_matrix_coefficients(cast(GdkCicpParams*)this._cPtr);
    return _retval;
  }

  /**
      Gets the range property of self.
      Returns: the range value
  */
  gdk.types.CicpRange getRange() nothrow
  {
    GdkCicpRange _cretval;
    _cretval = gdk_cicp_params_get_range(cast(GdkCicpParams*)this._cPtr);
    gdk.types.CicpRange _retval = cast(gdk.types.CicpRange)_cretval;
    return _retval;
  }

  /**
      Gets the transfer-function property of self.
      Returns: the transfer-function value
  */
  uint getTransferFunction() nothrow
  {
    uint _retval;
    _retval = gdk_cicp_params_get_transfer_function(cast(GdkCicpParams*)this._cPtr);
    return _retval;
  }

  /**
      Sets the color-primaries property of self.
  
      Params:
        colorPrimaries = the new color primaries value
  */
  void setColorPrimaries(uint colorPrimaries) nothrow
  {
    gdk_cicp_params_set_color_primaries(cast(GdkCicpParams*)this._cPtr, colorPrimaries);
  }

  /**
      self a [gdk.cicp_params.CicpParams]
      Sets the matrix-coefficients property of self.
  
      Params:
        matrixCoefficients = the new matrix-coefficients value
  */
  void setMatrixCoefficients(uint matrixCoefficients) nothrow
  {
    gdk_cicp_params_set_matrix_coefficients(cast(GdkCicpParams*)this._cPtr, matrixCoefficients);
  }

  /**
      Sets the range property of self
  
      Params:
        range = the range value
  */
  void setRange(gdk.types.CicpRange range) nothrow
  {
    gdk_cicp_params_set_range(cast(GdkCicpParams*)this._cPtr, range);
  }

  /**
      Sets the transfer-function property of self.
  
      Params:
        transferFunction = the new transfer-function value
  */
  void setTransferFunction(uint transferFunction) nothrow
  {
    gdk_cicp_params_set_transfer_function(cast(GdkCicpParams*)this._cPtr, transferFunction);
  }
}

/// Fluent builder implementation template for [gdk.cicp_params.CicpParams]
class CicpParamsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `colorPrimaries` property.
      Params:
        propval = The color primaries to use.
          
          Supported values:
          
          - 1: BT.709 / sRGB
          - 2: unspecified
          - 5: PAL
          - 6,7: BT.601 / NTSC
          - 9: BT.2020
          - 12: Display P3
      Returns: Builder instance for fluent chaining
  */
  T colorPrimaries(uint propval) nothrow
  {
    return setProperty("color-primaries", propval);
  }

  /**
      Set `matrixCoefficients` property.
      Params:
        propval = The matrix coefficients (for YUV to RGB conversion).
          
          Supported values:
          
          - 0: RGB
          - 1: BT.709
          - 2: unspecified
          - 5,6: BT.601
          - 9: BT.2020
      Returns: Builder instance for fluent chaining
  */
  T matrixCoefficients(uint propval) nothrow
  {
    return setProperty("matrix-coefficients", propval);
  }

  /**
      Set `range` property.
      Params:
        propval = Whether the data is using the full range of values.
          
          The range of the data.
      Returns: Builder instance for fluent chaining
  */
  T range(gdk.types.CicpRange propval) nothrow
  {
    return setProperty("range", propval);
  }

  /**
      Set `transferFunction` property.
      Params:
        propval = The transfer function to use.
          
          Supported values:
          
          - 1,6,14,15: BT.709, BT.601, BT.2020
          - 2: unspecified
          - 4: gamma 2.2
          - 5: gamma 2.8
          - 8: linear
          - 13: sRGB
          - 16: BT.2100 PQ
          - 18: BT.2100 HLG
      Returns: Builder instance for fluent chaining
  */
  T transferFunction(uint propval) nothrow
  {
    return setProperty("transfer-function", propval);
  }
}

/// Fluent builder for [gdk.cicp_params.CicpParams]
final class CicpParamsGidBuilder : CicpParamsGidBuilderImpl!CicpParamsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CicpParams build() nothrow
  {
    return new CicpParams(cast(void*)createGObject(CicpParams._getGType), Yes.Take);
  }
}
