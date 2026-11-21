/// Module for [RoundedRect] class
module gid.gsk4.rounded_rect;

public import gid.core.basictypes;
import gid.core.gid;
import gid.graphene1.point;
import gid.graphene1.rect;
import gid.graphene1.size;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.types;

/**
    A rectangular region with rounded corners.
    
    Application code should normalize rectangles using
    [gid.gsk4.rounded_rect.RoundedRect.normalize]; this function will ensure that
    the bounds of the rectangle are normalized and ensure that the corner
    values are positive and the corners do not overlap.
    
    All functions taking a [gid.gsk4.rounded_rect.RoundedRect] as an argument will internally
    operate on a normalized copy; all functions returning a [gid.gsk4.rounded_rect.RoundedRect]
    will always return a normalized one.
    
    The algorithm used for normalizing corner sizes is described in
    [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
*/
class RoundedRect : StructWrap!(GskRoundedRect)
{
  /**
      Create a `rounded_rect.RoundedRect` wrap type.
      Params:
        corner = the size of the 4 rounded corners
  */
  this(gid.graphene1.size.Size[4] corner = (gid.graphene1.size.Size[4]).init) nothrow
  {
    this.corner = corner;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `bounds` field.
      Returns: the bounds of the rectangle
  */
  @property gid.graphene1.rect.Rect bounds() nothrow
  {
    return cToD!(gid.graphene1.rect.Rect)(cast(void*)&(cast(GskRoundedRect*)this._cPtr).bounds);
  }

  /**
      Get `corner` field.
      Returns: the size of the 4 rounded corners
  */
  @property gid.graphene1.size.Size[4] corner() nothrow
  {
    return *cast(gid.graphene1.size.Size[4]*)&(cast(GskRoundedRect*)this._cPtr).corner;
  }

  /**
      Set `corner` field.
      Params:
        propval = the size of the 4 rounded corners
  */
  @property void corner(gid.graphene1.size.Size[4] propval) nothrow
  {
    (cast(GskRoundedRect*)this._cPtr).corner = *cast(graphene_size_t[4]*)&propval;
  }

  /**
      Checks if the given point is inside the rounded rectangle.
  
      Params:
        point = the point to check
      Returns: true if the point is inside the rounded rectangle
  */
  bool containsPoint(gid.graphene1.point.Point point) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_contains_point(cast(const(GskRoundedRect)*)this._cPtr, cast(const(graphene_point_t)*)&point);
    return _retval;
  }

  /**
      Checks if the given rectangle is contained inside the rounded rectangle.
  
      Params:
        rect = the rectangle to check
      Returns: true if the rect is fully contained inside the rounded rectangle
  */
  bool containsRect(gid.graphene1.rect.Rect rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_contains_rect(cast(const(GskRoundedRect)*)this._cPtr, rect ? cast(const(graphene_rect_t)*)rect._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initializes a rounded rectangle with the given values.
      
      This function will implicitly normalize the rounded rectangle
      before returning.
  
      Params:
        bounds = a [gid.graphene1.rect.Rect] describing the bounds
        topLeft = the rounding radius of the top left corner
        topRight = the rounding radius of the top right corner
        bottomRight = the rounding radius of the bottom right corner
        bottomLeft = the rounding radius of the bottom left corner
      Returns: the initialized rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect init_(gid.graphene1.rect.Rect bounds, gid.graphene1.size.Size topLeft, gid.graphene1.size.Size topRight, gid.graphene1.size.Size bottomRight, gid.graphene1.size.Size bottomLeft) nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init(cast(GskRoundedRect*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_size_t)*)&topLeft, cast(const(graphene_size_t)*)&topRight, cast(const(graphene_size_t)*)&bottomRight, cast(const(graphene_size_t)*)&bottomLeft);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Initializes a rounded rectangle with a copy.
      
      This function will not normalize the rounded rectangle,
      so make sure the source is normalized.
  
      Params:
        src = another rounded rectangle
      Returns: the initialized rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect initCopy(gid.gsk4.rounded_rect.RoundedRect src) nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init_copy(cast(GskRoundedRect*)this._cPtr, src ? cast(const(GskRoundedRect)*)src._cPtr : null);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Initializes a rounded rectangle to the given bounds
      and sets the radius of all four corners equally.
  
      Params:
        bounds = a [gid.graphene1.rect.Rect]
        radius = the border radius
      Returns: the initialized rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect initFromRect(gid.graphene1.rect.Rect bounds, float radius) nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_init_from_rect(cast(GskRoundedRect*)this._cPtr, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, radius);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Checks if part a rectangle is contained
      inside the rounded rectangle.
  
      Params:
        rect = the rectangle to check
      Returns: true if the rect intersects with the rounded rectangle
  */
  bool intersectsRect(gid.graphene1.rect.Rect rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_intersects_rect(cast(const(GskRoundedRect)*)this._cPtr, rect ? cast(const(graphene_rect_t)*)rect._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if all corners of a rounded rectangle are right angles
      and the rectangle covers all of its bounds.
      
      This information can be used to decide if [gid.gsk4.clip_node.ClipNode.new_]
      or [gid.gsk4.rounded_clip_node.RoundedClipNode.new_] should be called.
      Returns: true if the rounded rectangle is rectilinear
  */
  bool isRectilinear() nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_rounded_rect_is_rectilinear(cast(const(GskRoundedRect)*)this._cPtr);
    return _retval;
  }

  /**
      Normalizes a rounded rectangle.
      
      This function will ensure that the bounds of the rounded rectangle
      are normalized and ensure that the corner values are positive
      and the corners do not overlap.
      Returns: the normalized rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect normalize() nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_normalize(cast(GskRoundedRect*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Offsets the rounded rectangle's origin by dx and dy.
      
      The size and corners of the rounded rectangle are unchanged.
  
      Params:
        dx = the horizontal offset
        dy = the vertical offset
      Returns: the offset rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect offset(float dx, float dy) nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_offset(cast(GskRoundedRect*)this._cPtr, dx, dy);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Shrinks (or grows) a rounded rectangle by moving the 4 sides
      according to the offsets given.
      
      The corner radii will be changed in a way that tries to keep
      the center of the corner circle intact. This emulates CSS behavior.
      
      This function also works for growing rounded rectangles
      if you pass negative values for the top, right, bottom or left.
  
      Params:
        top = how far to move the top side downwards
        right = how far to move the right side to the left
        bottom = how far to move the bottom side upwards
        left = how far to move the left side to the right
      Returns: the resized rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect shrink(float top, float right, float bottom, float left) nothrow
  {
    GskRoundedRect* _cretval;
    _cretval = gsk_rounded_rect_shrink(cast(GskRoundedRect*)this._cPtr, top, right, bottom, left);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }
}
