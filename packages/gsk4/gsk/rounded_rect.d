/// Module for [RoundedRect] class
module gsk.rounded_rect;

import gid.gid;
import graphene.point;
import graphene.rect;
import graphene.size;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    A rectangular region with rounded corners.
    
    Application code should normalize rectangles using
    [gsk.rounded_rect.RoundedRect.normalize]; this function will ensure that
    the bounds of the rectangle are normalized and ensure that the corner
    values are positive and the corners do not overlap.
    
    All functions taking a [gsk.rounded_rect.RoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [gsk.rounded_rect.RoundedRect]
    will always return a normalized one.
    
    The algorithm used for normalizing corner sizes is described in
    [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
*/
class RoundedRect
{
  GskRoundedRect cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.rounded_rect.RoundedRect");

    cInstance = *cast(GskRoundedRect*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `bounds` field.
      Returns: the bounds of the rectangle
  */
  @property graphene.rect.Rect bounds()
  {
    return cToD!(graphene.rect.Rect)(cast(void*)&(cast(GskRoundedRect*)this._cPtr).bounds);
  }

  /**
      Checks if the given point is inside the rounded rectangle.
  
      Params:
        point = the point to check
      Returns: true if the point is inside the rounded rectangle
  */
  bool containsPoint(graphene.point.Point point)
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_contains_point(cast(const(GskRoundedRect)*)this._cPtr, point ? cast(const(graphene_point_t)*)point._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the given rect is contained inside the rounded rectangle.
  
      Params:
        rect = the rectangle to check
      Returns: true if the rect is fully contained inside the rounded rectangle
  */
  bool containsRect(graphene.rect.Rect rect)
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_contains_rect(cast(const(GskRoundedRect)*)this._cPtr, rect ? cast(const(graphene_rect_t)*)rect._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initializes the given [gsk.rounded_rect.RoundedRect] with the given values.
      
      This function will implicitly normalize the [gsk.rounded_rect.RoundedRect]
      before returning.
  
      Params:
        bounds = a [graphene.rect.Rect] describing the bounds
        topLeft = the rounding radius of the top left corner
        topRight = the rounding radius of the top right corner
        bottomRight = the rounding radius of the bottom right corner
        bottomLeft = the rounding radius of the bottom left corner
      Returns: the initialized rectangle
  */
  gsk.rounded_rect.RoundedRect init_(graphene.rect.Rect bounds, graphene.size.Size topLeft, graphene.size.Size topRight, graphene.size.Size bottomRight, graphene.size.Size bottomLeft)
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init(cast(GskRoundedRect*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, topLeft ? cast(const(graphene_size_t)*)topLeft._cPtr(No.Dup) : null, topRight ? cast(const(graphene_size_t)*)topRight._cPtr(No.Dup) : null, bottomRight ? cast(const(graphene_size_t)*)bottomRight._cPtr(No.Dup) : null, bottomLeft ? cast(const(graphene_size_t)*)bottomLeft._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes self using the given src rectangle.
      
      This function will not normalize the [gsk.rounded_rect.RoundedRect],
      so make sure the source is normalized.
  
      Params:
        src = a [gsk.rounded_rect.RoundedRect]
      Returns: the initialized rectangle
  */
  gsk.rounded_rect.RoundedRect initCopy(gsk.rounded_rect.RoundedRect src)
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init_copy(cast(GskRoundedRect*)this._cPtr, src ? cast(const(GskRoundedRect)*)src._cPtr : null);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes self to the given bounds and sets the radius
      of all four corners to radius.
  
      Params:
        bounds = a [graphene.rect.Rect]
        radius = the border radius
      Returns: the initialized rectangle
  */
  gsk.rounded_rect.RoundedRect initFromRect(graphene.rect.Rect bounds, float radius)
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init_from_rect(cast(GskRoundedRect*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, radius);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if part of the given rect is contained inside the rounded rectangle.
  
      Params:
        rect = the rectangle to check
      Returns: true if the rect intersects with the rounded rectangle
  */
  bool intersectsRect(graphene.rect.Rect rect)
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_intersects_rect(cast(const(GskRoundedRect)*)this._cPtr, rect ? cast(const(graphene_rect_t)*)rect._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if all corners of self are right angles and the
      rectangle covers all of its bounds.
      
      This information can be used to decide if [gsk.clip_node.ClipNode.new_]
      or [gsk.rounded_clip_node.RoundedClipNode.new_] should be called.
      Returns: true if the rectangle is rectilinear
  */
  bool isRectilinear()
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_is_rectilinear(cast(const(GskRoundedRect)*)this._cPtr);
    return _retval;
  }

  /**
      Normalizes the passed rectangle.
      
      This function will ensure that the bounds of the rectangle
      are normalized and ensure that the corner values are positive
      and the corners do not overlap.
      Returns: the normalized rectangle
  */
  gsk.rounded_rect.RoundedRect normalize()
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_normalize(cast(GskRoundedRect*)this._cPtr);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Offsets the bound's origin by dx and dy.
      
      The size and corners of the rectangle are unchanged.
  
      Params:
        dx = the horizontal offset
        dy = the vertical offset
      Returns: the offset rectangle
  */
  gsk.rounded_rect.RoundedRect offset(float dx, float dy)
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_offset(cast(GskRoundedRect*)this._cPtr, dx, dy);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Shrinks (or grows) the given rectangle by moving the 4 sides
      according to the offsets given.
      
      The corner radii will be changed in a way that tries to keep
      the center of the corner circle intact. This emulates CSS behavior.
      
      This function also works for growing rectangles if you pass
      negative values for the top, right, bottom or left.
  
      Params:
        top = How far to move the top side downwards
        right = How far to move the right side to the left
        bottom = How far to move the bottom side upwards
        left = How far to move the left side to the right
      Returns: the resized [gsk.rounded_rect.RoundedRect]
  */
  gsk.rounded_rect.RoundedRect shrink(float top, float right, float bottom, float left)
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_shrink(cast(GskRoundedRect*)this._cPtr, top, right, bottom, left);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }
}
