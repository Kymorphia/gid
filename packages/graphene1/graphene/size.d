/// Module for [Size] struct
module graphene.size;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/**
    A size.
*/
struct Size
{
  /**
      the width
  */
  float width;

  /**
      the height
  */
  float height;

  /**
      Checks whether the two give #graphene_size_t are equal.
  
      Params:
        b = a #graphene_size_t
      Returns: `true` if the sizes are equal
  */
  bool equal(graphene.size.Size b)
  {
    bool _retval;
    _retval = cast(bool)graphene_size_equal(cast(const(graphene_size_t)*)&this, cast(const(graphene_size_t)*)&b);
    return _retval;
  }

  /**
      Initializes a #graphene_size_t using the given width and height.
  
      Params:
        width = the width
        height = the height
      Returns: the initialized #graphene_size_t
  */
  graphene.size.Size init_(float width, float height)
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init(cast(graphene_size_t*)&this, width, height);
    graphene.size.Size _retval;
    if (_cretval)
      _retval = *cast(graphene.size.Size*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_size_t using the width and height of
      the given `s`rc.
  
      Params:
        src = a #graphene_size_t
      Returns: the initialized #graphene_size_t
  */
  graphene.size.Size initFromSize(graphene.size.Size src)
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init_from_size(cast(graphene_size_t*)&this, cast(const(graphene_size_t)*)&src);
    graphene.size.Size _retval;
    if (_cretval)
      _retval = *cast(graphene.size.Size*)_cretval;
    return _retval;
  }

  /**
      Linearly interpolates the two given #graphene_size_t using the given
      interpolation factor.
  
      Params:
        b = a #graphene_size_t
        factor = the linear interpolation factor
        res = return location for the interpolated size
  */
  void interpolate(graphene.size.Size b, double factor, out graphene.size.Size res)
  {
    graphene_size_interpolate(cast(const(graphene_size_t)*)&this, cast(const(graphene_size_t)*)&b, factor, cast(graphene_size_t*)&res);
  }

  /**
      Scales the components of a #graphene_size_t using the given factor.
  
      Params:
        factor = the scaling factor
        res = return location for the scaled size
  */
  void scale(float factor, out graphene.size.Size res)
  {
    graphene_size_scale(cast(const(graphene_size_t)*)&this, factor, cast(graphene_size_t*)&res);
  }

  /**
      A constant pointer to a zero #graphene_size_t, useful for
      equality checks and interpolations.
      Returns: a constant size
  */
  static graphene.size.Size zero()
  {
    const(graphene_size_t)* _cretval;
    _cretval = graphene_size_zero();
    graphene.size.Size _retval;
    if (_cretval)
      _retval = *cast(graphene.size.Size*)_cretval;
    return _retval;
  }
}
