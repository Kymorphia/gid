/// Module for [Size] class
module graphene.size;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/**
    A size.
*/
class Size : gobject.boxed.Boxed
{

  /**
      Create a `size.Size` boxed type.
      Params:
        width = the width
        height = the height
  */
  this(float width = 0.0, float height = 0.0)
  {
    super(gMalloc(graphene_size_t.sizeof), Yes.Take);
    this.width = width;
    this.height = height;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_size_get_type != &gidSymbolNotFound ? graphene_size_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Size self()
  {
    return this;
  }

  /**
      Get `width` field.
      Returns: the width
  */
  @property float width()
  {
    return (cast(graphene_size_t*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width
  */
  @property void width(float propval)
  {
    (cast(graphene_size_t*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height
  */
  @property float height()
  {
    return (cast(graphene_size_t*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height
  */
  @property void height(float propval)
  {
    (cast(graphene_size_t*)this._cPtr).height = propval;
  }

  /**
      Allocates a new #graphene_size_t.
      
      The contents of the returned value are undefined.
      Returns: the newly allocated #graphene_size_t
  */
  static graphene.size.Size alloc()
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_alloc();
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the two give #graphene_size_t are equal.
  
      Params:
        b = a #graphene_size_t
      Returns: `true` if the sizes are equal
  */
  bool equal(graphene.size.Size b)
  {
    bool _retval;
    _retval = cast(bool)graphene_size_equal(cast(const(graphene_size_t)*)this._cPtr, b ? cast(const(graphene_size_t)*)b._cPtr(No.Dup) : null);
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
    _cretval = graphene_size_init(cast(graphene_size_t*)this._cPtr, width, height);
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.Take) : null;
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
    _cretval = graphene_size_init_from_size(cast(graphene_size_t*)this._cPtr, src ? cast(const(graphene_size_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.Take) : null;
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
    graphene_size_t _res;
    graphene_size_interpolate(cast(const(graphene_size_t)*)this._cPtr, b ? cast(const(graphene_size_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.size.Size(cast(void*)&_res, No.Take);
  }

  /**
      Scales the components of a #graphene_size_t using the given factor.
  
      Params:
        factor = the scaling factor
        res = return location for the scaled size
  */
  void scale(float factor, out graphene.size.Size res)
  {
    graphene_size_t _res;
    graphene_size_scale(cast(const(graphene_size_t)*)this._cPtr, factor, &_res);
    res = new graphene.size.Size(cast(void*)&_res, No.Take);
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
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
