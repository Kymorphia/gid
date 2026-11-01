/// Module for [ComponentTransfer] class
module gsk.component_transfer;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    Specifies a transfer function for a color component to be applied
    while rendering.
    
    The available functions include linear, piecewise-linear,
    gamma and step functions.
    
    Note that the transfer function is applied to un-premultiplied
    values, and all results are clamped to the [0, 1] range.
*/
class ComponentTransfer : gobject.boxed.BoxedWrap!(gsk_component_transfer_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ComponentTransfer self() nothrow
  {
    return this;
  }

  /**
      Creates a new component transfer that applies
      a step function.
      
      The new value is computed as
      
          C' = values[k]
      
      where k is the smallest value such that
      
          k / n <= C < (k + 1) / n
      
      <figure>
        <picture>
          <source srcset="discrete-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: discrete" src="discrete-light.png">
        </picture>
      </figure>
  
      Params:
        values = Values
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newDiscrete(float[] values) nothrow
  {
    GskComponentTransfer* _cretval;
    uint _n;
    if (values)
      _n = cast(uint)values.length;

    auto _values = cast(float*)values.ptr;
    _cretval = gsk_component_transfer_new_discrete(_n, _values);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new component transfer that applies
      a gamma transform.
      
      The new value is computed as
      
          C' = amp * pow (C, exp) + ofs
      
      <figure>
        <picture>
          <source srcset="gamma-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: gamma" src="gamma-light.png">
        </picture>
      </figure>
  
      Params:
        amp = Amplitude
        exp = Exponent
        ofs = Offset
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newGamma(float amp, float exp, float ofs) nothrow
  {
    GskComponentTransfer* _cretval;
    _cretval = gsk_component_transfer_new_gamma(amp, exp, ofs);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new component transfer that doesn't
      change the component value.
      
      <figure>
        <picture>
          <source srcset="identity-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: identity" src="identity-light.png">
        </picture>
      </figure>
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newIdentity() nothrow
  {
    GskComponentTransfer* _cretval;
    _cretval = gsk_component_transfer_new_identity();
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new component transfer that limits
      the values of the component to `n` levels.
      
      The new value is computed as
      
          C' = (floor (C * n) + 0.5) / n
      
      <figure>
        <picture>
          <source srcset="levels-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: levels" src="levels-light.png">
        </picture>
      </figure>
  
      Params:
        n = Number of levels
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newLevels(float n) nothrow
  {
    GskComponentTransfer* _cretval;
    _cretval = gsk_component_transfer_new_levels(n);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new component transfer that applies
      a linear transform.
      
      The new value is computed as
      
          C' = C * m + b
      
      <figure>
        <picture>
          <source srcset="linear-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: linear" src="linear-light.png">
        </picture>
      </figure>
  
      Params:
        m = Slope
        b = Offset
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newLinear(float m, float b) nothrow
  {
    GskComponentTransfer* _cretval;
    _cretval = gsk_component_transfer_new_linear(m, b);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new component transfer that applies
      a piecewise linear function.
      
      The new value is computed as
      
          C' = values[k] + (C - k / (n - 1)) * n * (values[k + 1] - values[k])
      
      where k is the smallest value such that
      
          k / (n - 1) <= C < (k + 1) / (n - 1)
      
      <figure>
        <picture>
          <source srcset="table-dark.png" media="(prefers-color-scheme: dark)">
            <img alt="Component transfer: table" src="table-light.png">
        </picture>
      </figure>
  
      Params:
        values = Values
      Returns: a new [gsk.component_transfer.ComponentTransfer]
  */
  static gsk.component_transfer.ComponentTransfer newTable(float[] values) nothrow
  {
    GskComponentTransfer* _cretval;
    uint _n;
    if (values)
      _n = cast(uint)values.length;

    auto _values = cast(float*)values.ptr;
    _cretval = gsk_component_transfer_new_table(_n, _values);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of other.
      Returns: a newly allocated copy of other
  */
  gsk.component_transfer.ComponentTransfer copy() nothrow
  {
    GskComponentTransfer* _cretval;
    _cretval = gsk_component_transfer_copy(cast(const(GskComponentTransfer)*)this._cPtr);
    auto _retval = _cretval ? new gsk.component_transfer.ComponentTransfer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two component transfers for equality.
  
      Params:
        self = a component transfer
        other = another component transfer
      Returns: true if self and other are equal
  */
  static bool equal(const(void)* self, const(void)* other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_component_transfer_equal(self, other);
    return _retval;
  }
}
