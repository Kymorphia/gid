module graphene.c.types;

public import gid.basictypes;
public import gobject.c.types;

/**
    Specify the order of the rotations on each axis.
  
  The `GRAPHENE_EULER_ORDER_DEFAULT` value is special, and is used
  as an alias for one of the other orders.
*/
enum graphene_euler_order_t
{
  /**
      Rotate in the default order; the
      default order is one of the following enumeration values
  */
  default_ = -1,

  /**
      Rotate in the X, Y, and Z order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SXYZ`
  */
  xyz = 0,

  /**
      Rotate in the Y, Z, and X order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SYZX`
  */
  yzx = 1,

  /**
      Rotate in the Z, X, and Y order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SZXY`
  */
  zxy = 2,

  /**
      Rotate in the X, Z, and Y order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SXZY`
  */
  xzy = 3,

  /**
      Rotate in the Y, X, and Z order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SYXZ`
  */
  yxz = 4,

  /**
      Rotate in the Z, Y, and X order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SZYX`
  */
  zyx = 5,

  /**
      Defines a static rotation along the X, Y, and Z axes (Since: 1.10)
  */
  sxyz = 6,

  /**
      Defines a static rotation along the X, Y, and X axes (Since: 1.10)
  */
  sxyx = 7,

  /**
      Defines a static rotation along the X, Z, and Y axes (Since: 1.10)
  */
  sxzy = 8,

  /**
      Defines a static rotation along the X, Z, and X axes (Since: 1.10)
  */
  sxzx = 9,

  /**
      Defines a static rotation along the Y, Z, and X axes (Since: 1.10)
  */
  syzx = 10,

  /**
      Defines a static rotation along the Y, Z, and Y axes (Since: 1.10)
  */
  syzy = 11,

  /**
      Defines a static rotation along the Y, X, and Z axes (Since: 1.10)
  */
  syxz = 12,

  /**
      Defines a static rotation along the Y, X, and Y axes (Since: 1.10)
  */
  syxy = 13,

  /**
      Defines a static rotation along the Z, X, and Y axes (Since: 1.10)
  */
  szxy = 14,

  /**
      Defines a static rotation along the Z, X, and Z axes (Since: 1.10)
  */
  szxz = 15,

  /**
      Defines a static rotation along the Z, Y, and X axes (Since: 1.10)
  */
  szyx = 16,

  /**
      Defines a static rotation along the Z, Y, and Z axes (Since: 1.10)
  */
  szyz = 17,

  /**
      Defines a relative rotation along the Z, Y, and X axes (Since: 1.10)
  */
  rzyx = 18,

  /**
      Defines a relative rotation along the X, Y, and X axes (Since: 1.10)
  */
  rxyx = 19,

  /**
      Defines a relative rotation along the Y, Z, and X axes (Since: 1.10)
  */
  ryzx = 20,

  /**
      Defines a relative rotation along the X, Z, and X axes (Since: 1.10)
  */
  rxzx = 21,

  /**
      Defines a relative rotation along the X, Z, and Y axes (Since: 1.10)
  */
  rxzy = 22,

  /**
      Defines a relative rotation along the Y, Z, and Y axes (Since: 1.10)
  */
  ryzy = 23,

  /**
      Defines a relative rotation along the Z, X, and Y axes (Since: 1.10)
  */
  rzxy = 24,

  /**
      Defines a relative rotation along the Y, X, and Y axes (Since: 1.10)
  */
  ryxy = 25,

  /**
      Defines a relative rotation along the Y, X, and Z axes (Since: 1.10)
  */
  ryxz = 26,

  /**
      Defines a relative rotation along the Z, X, and Z axes (Since: 1.10)
  */
  rzxz = 27,

  /**
      Defines a relative rotation along the X, Y, and Z axes (Since: 1.10)
  */
  rxyz = 28,

  /**
      Defines a relative rotation along the Z, Y, and Z axes (Since: 1.10)
  */
  rzyz = 29,
}

/**
    The type of intersection.
*/
enum graphene_ray_intersection_kind_t
{
  /**
      No intersection
  */
  none = 0,

  /**
      The ray is entering the intersected
      object
  */
  enter = 1,

  /**
      The ray is leaving the intersected
      object
  */
  leave = 2,
}

/**
    A 3D box, described as the volume between a minimum and
  a maximum vertices.
*/
struct graphene_box_t
{
  /** */
  graphene_vec3_t min;

  /** */
  graphene_vec3_t max;
}

/**
    Describe a rotation using Euler angles.
  
  The contents of the #graphene_euler_t structure are private
  and should never be accessed directly.
*/
struct graphene_euler_t
{
  /** */
  graphene_vec3_t angles;

  /** */
  graphene_euler_order_t order;
}

/**
    A 3D volume delimited by 2D clip planes.
  
  The contents of the [graphene.frustum.Frustum] are private, and should not be
  modified directly.
*/
struct graphene_frustum_t
{
  /** */
  graphene_plane_t[6] planes;
}

/**
    A structure capable of holding a 4x4 matrix.
  
  The contents of the #graphene_matrix_t structure are private and
  should never be accessed directly.
*/
struct graphene_matrix_t
{
  /** */
  graphene_simd4x4f_t value;
}

/**
    A 2D plane that extends infinitely in a 3D volume.
  
  The contents of the [graphene.plane.Plane] are private, and should not be
  modified directly.
*/
struct graphene_plane_t
{
  /** */
  graphene_vec3_t normal;

  /** */
  float constant;
}

/**
    A point with two coordinates.
*/
struct graphene_point_t
{
  /**
      the X coordinate of the point
  */
  float x;

  /**
      the Y coordinate of the point
  */
  float y;
}

/**
    A point with three components: X, Y, and Z.
*/
struct graphene_point3d_t
{
  /**
      the X coordinate
  */
  float x;

  /**
      the Y coordinate
  */
  float y;

  /**
      the Z coordinate
  */
  float z;
}

/**
    A 4 vertex quadrilateral, as represented by four #graphene_point_t.
  
  The contents of a #graphene_quad_t are private and should never be
  accessed directly.
*/
struct graphene_quad_t
{
  /** */
  graphene_point_t[4] points;
}

/**
    A quaternion.
  
  The contents of the #graphene_quaternion_t structure are private
  and should never be accessed directly.
*/
struct graphene_quaternion_t
{
  /** */
  float x;

  /** */
  float y;

  /** */
  float z;

  /** */
  float w;
}

/**
    A ray emitted from an origin in a given direction.
  
  The contents of the [graphene.ray.Ray] structure are private, and should not
  be modified directly.
*/
struct graphene_ray_t
{
  /** */
  graphene_vec3_t origin;

  /** */
  graphene_vec3_t direction;
}

/**
    The location and size of a rectangle region.
  
  The width and height of a #graphene_rect_t can be negative; for instance,
  a #graphene_rect_t with an origin of [ 0, 0 ] and a size of [ 10, 10 ] is
  equivalent to a #graphene_rect_t with an origin of [ 10, 10 ] and a size
  of [ -10, -10 ].
  
  Application code can normalize rectangles using [graphene.rect.Rect.normalize];
  this function will ensure that the width and height of a rectangle are
  positive values. All functions taking a #graphene_rect_t as an argument
  will internally operate on a normalized copy; all functions returning a
  #graphene_rect_t will always return a normalized rectangle.
*/
struct graphene_rect_t
{
  /**
      the coordinates of the origin of the rectangle
  */
  graphene_point_t origin;

  /**
      the size of the rectangle
  */
  graphene_size_t size;
}

/** */
struct graphene_simd4f_t
{
  /** */
  float x;

  /** */
  float y;

  /** */
  float z;

  /** */
  float w;
}

/** */
struct graphene_simd4x4f_t
{
  /** */
  graphene_simd4f_t x;

  /** */
  graphene_simd4f_t y;

  /** */
  graphene_simd4f_t z;

  /** */
  graphene_simd4f_t w;
}

/**
    A size.
*/
struct graphene_size_t
{
  /**
      the width
  */
  float width;

  /**
      the height
  */
  float height;
}

/**
    A sphere, represented by its center and radius.
*/
struct graphene_sphere_t
{
  /** */
  graphene_vec3_t center;

  /** */
  float radius;
}

/**
    A triangle.
*/
struct graphene_triangle_t
{
  /** */
  graphene_vec3_t a;

  /** */
  graphene_vec3_t b;

  /** */
  graphene_vec3_t c;
}

/**
    A structure capable of holding a vector with two dimensions, x and y.
  
  The contents of the #graphene_vec2_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec2_t
{
  /** */
  graphene_simd4f_t value;
}

/**
    A structure capable of holding a vector with three dimensions: x, y, and z.
  
  The contents of the #graphene_vec3_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec3_t
{
  /** */
  graphene_simd4f_t value;
}

/**
    A structure capable of holding a vector with four dimensions: x, y, z, and w.
  
  The contents of the #graphene_vec4_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec4_t
{
  /** */
  graphene_simd4f_t value;
}

