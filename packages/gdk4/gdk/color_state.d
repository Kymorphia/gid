/// Module for [ColorState] class
module gdk.color_state;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.cicp_params;
import gdk.types;
import gid.gid;
import gobject.boxed;
import gobject.object;

/**
    Provides information to interpret colors and pixels in a variety of ways.
    
    They are also known as
    [*color spaces*](https://en.wikipedia.org/wiki/Color_space).
    
    Crucially, GTK knows how to convert colors from one color
    state to another.
    
    [gdk.color_state.ColorState] objects are immutable and therefore threadsafe.
*/
class ColorState : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_color_state_get_type != &gidSymbolNotFound ? gdk_color_state_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorState self() nothrow
  {
    return this;
  }

  /**
      Create a [gdk.cicp_params.CicpParams] representing the colorstate.
      
      It is not guaranteed that every [gdk.color_state.ColorState] can be
      represented with Cicp parameters. If that is the case,
      this function returns `NULL`.
      Returns: A new [gdk.cicp_params.CicpParams]
  */
  gdk.cicp_params.CicpParams createCicpParams() nothrow
  {
    GdkCicpParams* _cretval;
    _cretval = gdk_color_state_create_cicp_params(cast(GdkColorState*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cicp_params.CicpParams)(cast(GdkCicpParams*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Compares two `GdkColorStates` for equality.
      
      Note that this function is not guaranteed to be perfect and two objects
      describing the same color state may compare not equal. However, different
      color states will never compare equal.
  
      Params:
        other = another `GdkColorStatee`
      Returns: true if the two color states compare equal
  */
  bool equal(gdk.color_state.ColorState other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_color_state_equal(cast(GdkColorState*)this._cPtr, other ? cast(GdkColorState*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Compares two `GdkColorStates` for equivalence.
      
      Two objects that represent the same color state should be equivalent,
      even though they may not be equal in the sense of [gdk.color_state.ColorState.equal].
  
      Params:
        other = another `GdkColorStatee`
      Returns: true if the two color states are equivalent
  */
  bool equivalent(gdk.color_state.ColorState other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_color_state_equivalent(cast(GdkColorState*)this._cPtr, other ? cast(GdkColorState*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the color state object representing the oklab color space.
      
      This is a perceptually uniform color state.
      Returns: the color state object for oklab
  */
  static gdk.color_state.ColorState getOklab() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_oklab();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the color state object representing the oklch color space.
      
      This is the polar variant of oklab, in which the hue is encoded as
      a polar coordinate.
      Returns: the color state object for oklch
  */
  static gdk.color_state.ColorState getOklch() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_oklch();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the color state object representing the linear rec2100 color space.
      
      This color state uses the primaries defined by BT.2020-2 and BT.2100-0 and a linear
      transfer function.
      
      It is equivalent to the [Cicp](class.CicpParams.html) tuple 9/8/0/1.
      
      See e.g. [the CSS HDR Module](https://drafts.csswg.org/css-color-hdr/#valdef-color-rec2100-linear)
      for details about this colorstate.
      Returns: the color state object for linearized rec2100
  */
  static gdk.color_state.ColorState getRec2100Linear() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_rec2100_linear();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the color state object representing the rec2100-pq color space.
      
      This color state uses the primaries defined by BT.2020-2 and BT.2100-0 and the transfer
      function defined by SMPTE ST 2084 and BT.2100-2.
      
      It is equivalent to the [Cicp](class.CicpParams.html) tuple 9/16/0/1.
      
      See e.g. [the CSS HDR Module](https://drafts.csswg.org/css-color-hdr/#valdef-color-rec2100-pq)
      for details about this colorstate.
      Returns: the color state object for rec2100-pq
  */
  static gdk.color_state.ColorState getRec2100Pq() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_rec2100_pq();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the color state object representing the sRGB color space.
      
      This color state uses the primaries defined by BT.709-6 and the transfer function
      defined by IEC 61966-2-1.
      
      It is equivalent to the [Cicp](class.CicpParams.html) tuple 1/13/0/1.
      
      See e.g. [the CSS Color Module](https://www.w3.org/TR/css-color-4/#predefined-sRGB)
      for details about this colorstate.
      Returns: the color state object for sRGB
  */
  static gdk.color_state.ColorState getSrgb() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_srgb();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the color state object representing the linearized sRGB color space.
      
      This color state uses the primaries defined by BT.709-6 and a linear transfer function.
      
      It is equivalent to the [Cicp](class.CicpParams.html) tuple 1/8/0/1.
      
      See e.g. [the CSS Color Module](https://www.w3.org/TR/css-color-4/#predefined-sRGB-linear)
      for details about this colorstate.
      Returns: the color state object for linearized sRGB
  */
  static gdk.color_state.ColorState getSrgbLinear() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_color_state_get_srgb_linear();
    auto _retval = _cretval ? new gdk.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
