/// Module for [Size] struct
module gid.graphene1.size;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.types;

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

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())graphene_size_get_type != &gidSymbolNotFound ? graphene_size_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Checks whether the two give #graphene_size_t are equal.
  
      Params:
        b = a #graphene_size_t
      Returns: `true` if the sizes are equal
  */
  bool equal(gid.graphene1.size.Size b) nothrow
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
  gid.graphene1.size.Size init_(float width, float height) nothrow
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init(cast(graphene_size_t*)&this, width, height);
    gid.graphene1.size.Size _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.size.Size*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_size_t using the width and height of
      the given `s`rc.
  
      Params:
        src = a #graphene_size_t
      Returns: the initialized #graphene_size_t
  */
  gid.graphene1.size.Size initFromSize(gid.graphene1.size.Size src) nothrow
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init_from_size(cast(graphene_size_t*)&this, cast(const(graphene_size_t)*)&src);
    gid.graphene1.size.Size _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.size.Size*)_cretval;
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
  void interpolate(gid.graphene1.size.Size b, double factor, out gid.graphene1.size.Size res) nothrow
  {
    graphene_size_interpolate(cast(const(graphene_size_t)*)&this, cast(const(graphene_size_t)*)&b, factor, cast(graphene_size_t*)&res);
  }

  /**
      Scales the components of a #graphene_size_t using the given factor.
  
      Params:
        factor = the scaling factor
        res = return location for the scaled size
  */
  void scale(float factor, out gid.graphene1.size.Size res) nothrow
  {
    graphene_size_scale(cast(const(graphene_size_t)*)&this, factor, cast(graphene_size_t*)&res);
  }

  /**
      A constant pointer to a zero #graphene_size_t, useful for
      equality checks and interpolations.
      Returns: a constant size
  */
  static gid.graphene1.size.Size zero() nothrow
  {
    const(graphene_size_t)* _cretval;
    _cretval = graphene_size_zero();
    gid.graphene1.size.Size _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.size.Size*)_cretval;
    return _retval;
  }
}
