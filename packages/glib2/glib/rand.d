/// Module for [Rand] class
module glib.rand;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    The GRand struct is an opaque data structure. It should only be
    accessed through the g_rand_* functions.
*/
class Rand : gobject.boxed.Boxed
{

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
    return cast(void function())g_rand_get_type != &gidSymbolNotFound ? g_rand_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Rand self()
  {
    return this;
  }

  /**
      Creates a new random number generator initialized with a seed taken
      either from `/dev/urandom` (if existing) or from the current time
      (as a fallback).
      
      On Windows, the seed is taken from rand_s().
      Returns: the new #GRand
  */
  this()
  {
    GRand* _cretval;
    _cretval = g_rand_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new random number generator initialized with seed.
  
      Params:
        seed = a value to initialize the random number generator
      Returns: the new #GRand
  */
  static glib.rand.Rand newWithSeed(uint seed)
  {
    GRand* _cretval;
    _cretval = g_rand_new_with_seed(seed);
    auto _retval = _cretval ? new glib.rand.Rand(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new random number generator initialized with seed.
  
      Params:
        seed = an array of seeds to initialize the random number generator
      Returns: the new #GRand
  */
  static glib.rand.Rand newWithSeedArray(uint[] seed)
  {
    GRand* _cretval;
    uint _seedLength;
    if (seed)
      _seedLength = cast(uint)seed.length;

    auto _seed = cast(const(uint)*)seed.ptr;
    _cretval = g_rand_new_with_seed_array(_seed, _seedLength);
    auto _retval = _cretval ? new glib.rand.Rand(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies a #GRand into a new one with the same exact state as before.
      This way you can take a snapshot of the random number generator for
      replaying later.
      Returns: the new #GRand
  */
  glib.rand.Rand copy()
  {
    GRand* _cretval;
    _cretval = g_rand_copy(cast(GRand*)this._cPtr);
    auto _retval = _cretval ? new glib.rand.Rand(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the next random #gdouble from rand_ equally distributed over
      the range [0..1).
      Returns: a random number
  */
  double double_()
  {
    double _retval;
    _retval = g_rand_double(cast(GRand*)this._cPtr);
    return _retval;
  }

  /**
      Returns the next random #gdouble from rand_ equally distributed over
      the range [begin..end).
  
      Params:
        begin = lower closed bound of the interval
        end = upper open bound of the interval
      Returns: a random number
  */
  double doubleRange(double begin, double end)
  {
    double _retval;
    _retval = g_rand_double_range(cast(GRand*)this._cPtr, begin, end);
    return _retval;
  }

  /**
      Returns the next random #guint32 from rand_ equally distributed over
      the range [0..2^32-1].
      Returns: a random number
  */
  uint int_()
  {
    uint _retval;
    _retval = g_rand_int(cast(GRand*)this._cPtr);
    return _retval;
  }

  /**
      Returns the next random #gint32 from rand_ equally distributed over
      the range [begin..end-1].
  
      Params:
        begin = lower closed bound of the interval
        end = upper open bound of the interval
      Returns: a random number
  */
  int intRange(int begin, int end)
  {
    int _retval;
    _retval = g_rand_int_range(cast(GRand*)this._cPtr, begin, end);
    return _retval;
  }

  /**
      Sets the seed for the random number generator #GRand to seed.
  
      Params:
        seed = a value to reinitialize the random number generator
  */
  void setSeed(uint seed)
  {
    g_rand_set_seed(cast(GRand*)this._cPtr, seed);
  }

  /**
      Initializes the random number generator by an array of longs.
      Array can be of arbitrary size, though only the first 624 values
      are taken.  This function is useful if you have many low entropy
      seeds, or if you require more then 32 bits of actual entropy for
      your application.
  
      Params:
        seed = array to initialize with
  */
  void setSeedArray(uint[] seed)
  {
    uint _seedLength;
    if (seed)
      _seedLength = cast(uint)seed.length;

    auto _seed = cast(const(uint)*)seed.ptr;
    g_rand_set_seed_array(cast(GRand*)this._cPtr, _seed, _seedLength);
  }
}
