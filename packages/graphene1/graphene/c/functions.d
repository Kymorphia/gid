/// C functions for graphene1 library
module graphene.c.functions;

public import gid.basictypes;
import gid.loader;
import graphene.c.types;
public import gobject.c.types;

version(Windows)
  private immutable LIBS = ["libgraphene-1.0-0.dll;graphene-1.0-0.dll;graphene-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgraphene-1.0.0.dylib"];
else
  private immutable LIBS = ["libgraphene-1.0.so.0;libgraphene-1.0.so"];

__gshared extern(C) nothrow
{
  // Box
  GType function() c_graphene_box_get_type; ///
  graphene_box_t* function() c_graphene_box_alloc; ///
  bool function(const(graphene_box_t)* a, const(graphene_box_t)* b) c_graphene_box_contains_box; ///
  bool function(const(graphene_box_t)* box, const(graphene_point3d_t)* point) c_graphene_box_contains_point; ///
  bool function(const(graphene_box_t)* a, const(graphene_box_t)* b) c_graphene_box_equal; ///
  void function(const(graphene_box_t)* box, const(graphene_point3d_t)* point, graphene_box_t* res) c_graphene_box_expand; ///
  void function(const(graphene_box_t)* box, float scalar, graphene_box_t* res) c_graphene_box_expand_scalar; ///
  void function(const(graphene_box_t)* box, const(graphene_vec3_t)* vec, graphene_box_t* res) c_graphene_box_expand_vec3; ///
  void function(graphene_box_t* box) c_graphene_box_free; ///
  void function(const(graphene_box_t)* box, graphene_sphere_t* sphere) c_graphene_box_get_bounding_sphere; ///
  void function(const(graphene_box_t)* box, graphene_point3d_t* center) c_graphene_box_get_center; ///
  float function(const(graphene_box_t)* box) c_graphene_box_get_depth; ///
  float function(const(graphene_box_t)* box) c_graphene_box_get_height; ///
  void function(const(graphene_box_t)* box, graphene_point3d_t* max) c_graphene_box_get_max; ///
  void function(const(graphene_box_t)* box, graphene_point3d_t* min) c_graphene_box_get_min; ///
  void function(const(graphene_box_t)* box, graphene_vec3_t* size) c_graphene_box_get_size; ///
  void function(const(graphene_box_t)* box, graphene_vec3_t* vertices) c_graphene_box_get_vertices; ///
  float function(const(graphene_box_t)* box) c_graphene_box_get_width; ///
  graphene_box_t* function(graphene_box_t* box, const(graphene_point3d_t)* min, const(graphene_point3d_t)* max) c_graphene_box_init; ///
  graphene_box_t* function(graphene_box_t* box, const(graphene_box_t)* src) c_graphene_box_init_from_box; ///
  graphene_box_t* function(graphene_box_t* box, uint nPoints, const(graphene_point3d_t)* points) c_graphene_box_init_from_points; ///
  graphene_box_t* function(graphene_box_t* box, const(graphene_vec3_t)* min, const(graphene_vec3_t)* max) c_graphene_box_init_from_vec3; ///
  graphene_box_t* function(graphene_box_t* box, uint nVectors, const(graphene_vec3_t)* vectors) c_graphene_box_init_from_vectors; ///
  bool function(const(graphene_box_t)* a, const(graphene_box_t)* b, graphene_box_t* res) c_graphene_box_intersection; ///
  void function(const(graphene_box_t)* a, const(graphene_box_t)* b, graphene_box_t* res) c_graphene_box_union; ///
  const(graphene_box_t)* function() c_graphene_box_empty; ///
  const(graphene_box_t)* function() c_graphene_box_infinite; ///
  const(graphene_box_t)* function() c_graphene_box_minus_one; ///
  const(graphene_box_t)* function() c_graphene_box_one; ///
  const(graphene_box_t)* function() c_graphene_box_one_minus_one; ///
  const(graphene_box_t)* function() c_graphene_box_zero; ///

  // Euler
  GType function() c_graphene_euler_get_type; ///
  graphene_euler_t* function() c_graphene_euler_alloc; ///
  bool function(const(graphene_euler_t)* a, const(graphene_euler_t)* b) c_graphene_euler_equal; ///
  void function(graphene_euler_t* e) c_graphene_euler_free; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_alpha; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_beta; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_gamma; ///
  graphene_euler_order_t function(const(graphene_euler_t)* e) c_graphene_euler_get_order; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_x; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_y; ///
  float function(const(graphene_euler_t)* e) c_graphene_euler_get_z; ///
  graphene_euler_t* function(graphene_euler_t* e, float x, float y, float z) c_graphene_euler_init; ///
  graphene_euler_t* function(graphene_euler_t* e, const(graphene_euler_t)* src) c_graphene_euler_init_from_euler; ///
  graphene_euler_t* function(graphene_euler_t* e, const(graphene_matrix_t)* m, graphene_euler_order_t order) c_graphene_euler_init_from_matrix; ///
  graphene_euler_t* function(graphene_euler_t* e, const(graphene_quaternion_t)* q, graphene_euler_order_t order) c_graphene_euler_init_from_quaternion; ///
  graphene_euler_t* function(graphene_euler_t* e, float x, float y, float z, graphene_euler_order_t order) c_graphene_euler_init_from_radians; ///
  graphene_euler_t* function(graphene_euler_t* e, const(graphene_vec3_t)* v, graphene_euler_order_t order) c_graphene_euler_init_from_vec3; ///
  graphene_euler_t* function(graphene_euler_t* e, float x, float y, float z, graphene_euler_order_t order) c_graphene_euler_init_with_order; ///
  void function(const(graphene_euler_t)* e, graphene_euler_order_t order, graphene_euler_t* res) c_graphene_euler_reorder; ///
  void function(const(graphene_euler_t)* e, graphene_matrix_t* res) c_graphene_euler_to_matrix; ///
  void function(const(graphene_euler_t)* e, graphene_quaternion_t* res) c_graphene_euler_to_quaternion; ///
  void function(const(graphene_euler_t)* e, graphene_vec3_t* res) c_graphene_euler_to_vec3; ///

  // Frustum
  GType function() c_graphene_frustum_get_type; ///
  graphene_frustum_t* function() c_graphene_frustum_alloc; ///
  bool function(const(graphene_frustum_t)* f, const(graphene_point3d_t)* point) c_graphene_frustum_contains_point; ///
  bool function(const(graphene_frustum_t)* a, const(graphene_frustum_t)* b) c_graphene_frustum_equal; ///
  void function(graphene_frustum_t* f) c_graphene_frustum_free; ///
  void function(const(graphene_frustum_t)* f, graphene_plane_t* planes) c_graphene_frustum_get_planes; ///
  graphene_frustum_t* function(graphene_frustum_t* f, const(graphene_plane_t)* p0, const(graphene_plane_t)* p1, const(graphene_plane_t)* p2, const(graphene_plane_t)* p3, const(graphene_plane_t)* p4, const(graphene_plane_t)* p5) c_graphene_frustum_init; ///
  graphene_frustum_t* function(graphene_frustum_t* f, const(graphene_frustum_t)* src) c_graphene_frustum_init_from_frustum; ///
  graphene_frustum_t* function(graphene_frustum_t* f, const(graphene_matrix_t)* matrix) c_graphene_frustum_init_from_matrix; ///
  bool function(const(graphene_frustum_t)* f, const(graphene_box_t)* box) c_graphene_frustum_intersects_box; ///
  bool function(const(graphene_frustum_t)* f, const(graphene_sphere_t)* sphere) c_graphene_frustum_intersects_sphere; ///

  // Matrix
  GType function() c_graphene_matrix_get_type; ///
  graphene_matrix_t* function() c_graphene_matrix_alloc; ///
  bool function(const(graphene_matrix_t)* m, graphene_vec3_t* translate, graphene_vec3_t* scale, graphene_quaternion_t* rotate, graphene_vec3_t* shear, graphene_vec4_t* perspective) c_graphene_matrix_decompose; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_determinant; ///
  bool function(const(graphene_matrix_t)* a, const(graphene_matrix_t)* b) c_graphene_matrix_equal; ///
  bool function(const(graphene_matrix_t)* a, const(graphene_matrix_t)* b) c_graphene_matrix_equal_fast; ///
  void function(graphene_matrix_t* m) c_graphene_matrix_free; ///
  void function(const(graphene_matrix_t)* m, uint index, graphene_vec4_t* res) c_graphene_matrix_get_row; ///
  float function(const(graphene_matrix_t)* m, uint row, uint col) c_graphene_matrix_get_value; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_x_scale; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_x_translation; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_y_scale; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_y_translation; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_z_scale; ///
  float function(const(graphene_matrix_t)* m) c_graphene_matrix_get_z_translation; ///
  graphene_matrix_t* function(graphene_matrix_t* m, double xx, double yx, double xy, double yy, double x0, double y0) c_graphene_matrix_init_from_2d; ///
  graphene_matrix_t* function(graphene_matrix_t* m, const(float)* v) c_graphene_matrix_init_from_float; ///
  graphene_matrix_t* function(graphene_matrix_t* m, const(graphene_matrix_t)* src) c_graphene_matrix_init_from_matrix; ///
  graphene_matrix_t* function(graphene_matrix_t* m, const(graphene_vec4_t)* v0, const(graphene_vec4_t)* v1, const(graphene_vec4_t)* v2, const(graphene_vec4_t)* v3) c_graphene_matrix_init_from_vec4; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float left, float right, float bottom, float top, float zNear, float zFar) c_graphene_matrix_init_frustum; ///
  graphene_matrix_t* function(graphene_matrix_t* m) c_graphene_matrix_init_identity; ///
  graphene_matrix_t* function(graphene_matrix_t* m, const(graphene_vec3_t)* eye, const(graphene_vec3_t)* center, const(graphene_vec3_t)* up) c_graphene_matrix_init_look_at; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float left, float right, float top, float bottom, float zNear, float zFar) c_graphene_matrix_init_ortho; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float fovy, float aspect, float zNear, float zFar) c_graphene_matrix_init_perspective; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float angle, const(graphene_vec3_t)* axis) c_graphene_matrix_init_rotate; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float x, float y, float z) c_graphene_matrix_init_scale; ///
  graphene_matrix_t* function(graphene_matrix_t* m, float xSkew, float ySkew) c_graphene_matrix_init_skew; ///
  graphene_matrix_t* function(graphene_matrix_t* m, const(graphene_point3d_t)* p) c_graphene_matrix_init_translate; ///
  void function(const(graphene_matrix_t)* a, const(graphene_matrix_t)* b, double factor, graphene_matrix_t* res) c_graphene_matrix_interpolate; ///
  bool function(const(graphene_matrix_t)* m, graphene_matrix_t* res) c_graphene_matrix_inverse; ///
  bool function(const(graphene_matrix_t)* m) c_graphene_matrix_is_2d; ///
  bool function(const(graphene_matrix_t)* m) c_graphene_matrix_is_backface_visible; ///
  bool function(const(graphene_matrix_t)* m) c_graphene_matrix_is_identity; ///
  bool function(const(graphene_matrix_t)* m) c_graphene_matrix_is_singular; ///
  void function(const(graphene_matrix_t)* a, const(graphene_matrix_t)* b, graphene_matrix_t* res) c_graphene_matrix_multiply; ///
  bool function(const(graphene_matrix_t)* a, const(graphene_matrix_t)* b, float epsilon) c_graphene_matrix_near; ///
  void function(const(graphene_matrix_t)* m, graphene_matrix_t* res) c_graphene_matrix_normalize; ///
  void function(const(graphene_matrix_t)* m, float depth, graphene_matrix_t* res) c_graphene_matrix_perspective; ///
  void function(const(graphene_matrix_t)* m) c_graphene_matrix_print; ///
  void function(const(graphene_matrix_t)* m, const(graphene_point_t)* p, graphene_point_t* res) c_graphene_matrix_project_point; ///
  void function(const(graphene_matrix_t)* m, const(graphene_rect_t)* r, graphene_quad_t* res) c_graphene_matrix_project_rect; ///
  void function(const(graphene_matrix_t)* m, const(graphene_rect_t)* r, graphene_rect_t* res) c_graphene_matrix_project_rect_bounds; ///
  void function(graphene_matrix_t* m, float angle, const(graphene_vec3_t)* axis) c_graphene_matrix_rotate; ///
  void function(graphene_matrix_t* m, const(graphene_euler_t)* e) c_graphene_matrix_rotate_euler; ///
  void function(graphene_matrix_t* m, const(graphene_quaternion_t)* q) c_graphene_matrix_rotate_quaternion; ///
  void function(graphene_matrix_t* m, float angle) c_graphene_matrix_rotate_x; ///
  void function(graphene_matrix_t* m, float angle) c_graphene_matrix_rotate_y; ///
  void function(graphene_matrix_t* m, float angle) c_graphene_matrix_rotate_z; ///
  void function(graphene_matrix_t* m, float factorX, float factorY, float factorZ) c_graphene_matrix_scale; ///
  void function(graphene_matrix_t* m, float factor) c_graphene_matrix_skew_xy; ///
  void function(graphene_matrix_t* m, float factor) c_graphene_matrix_skew_xz; ///
  void function(graphene_matrix_t* m, float factor) c_graphene_matrix_skew_yz; ///
  bool function(const(graphene_matrix_t)* m, double* xx, double* yx, double* xy, double* yy, double* x0, double* y0) c_graphene_matrix_to_2d; ///
  void function(const(graphene_matrix_t)* m, float* v) c_graphene_matrix_to_float; ///
  void function(const(graphene_matrix_t)* m, const(graphene_rect_t)* r, graphene_rect_t* res) c_graphene_matrix_transform_bounds; ///
  void function(const(graphene_matrix_t)* m, const(graphene_box_t)* b, graphene_box_t* res) c_graphene_matrix_transform_box; ///
  void function(const(graphene_matrix_t)* m, const(graphene_point_t)* p, graphene_point_t* res) c_graphene_matrix_transform_point; ///
  void function(const(graphene_matrix_t)* m, const(graphene_point3d_t)* p, graphene_point3d_t* res) c_graphene_matrix_transform_point3d; ///
  void function(const(graphene_matrix_t)* m, const(graphene_ray_t)* r, graphene_ray_t* res) c_graphene_matrix_transform_ray; ///
  void function(const(graphene_matrix_t)* m, const(graphene_rect_t)* r, graphene_quad_t* res) c_graphene_matrix_transform_rect; ///
  void function(const(graphene_matrix_t)* m, const(graphene_sphere_t)* s, graphene_sphere_t* res) c_graphene_matrix_transform_sphere; ///
  void function(const(graphene_matrix_t)* m, const(graphene_vec3_t)* v, graphene_vec3_t* res) c_graphene_matrix_transform_vec3; ///
  void function(const(graphene_matrix_t)* m, const(graphene_vec4_t)* v, graphene_vec4_t* res) c_graphene_matrix_transform_vec4; ///
  void function(graphene_matrix_t* m, const(graphene_point3d_t)* pos) c_graphene_matrix_translate; ///
  void function(const(graphene_matrix_t)* m, graphene_matrix_t* res) c_graphene_matrix_transpose; ///
  void function(const(graphene_matrix_t)* projection, const(graphene_matrix_t)* modelview, const(graphene_point3d_t)* point, graphene_point3d_t* res) c_graphene_matrix_unproject_point3d; ///
  void function(const(graphene_matrix_t)* m, const(graphene_rect_t)* r, const(graphene_rect_t)* bounds, graphene_rect_t* res) c_graphene_matrix_untransform_bounds; ///
  bool function(const(graphene_matrix_t)* m, const(graphene_point_t)* p, const(graphene_rect_t)* bounds, graphene_point_t* res) c_graphene_matrix_untransform_point; ///

  // Plane
  GType function() c_graphene_plane_get_type; ///
  graphene_plane_t* function() c_graphene_plane_alloc; ///
  float function(const(graphene_plane_t)* p, const(graphene_point3d_t)* point) c_graphene_plane_distance; ///
  bool function(const(graphene_plane_t)* a, const(graphene_plane_t)* b) c_graphene_plane_equal; ///
  void function(graphene_plane_t* p) c_graphene_plane_free; ///
  float function(const(graphene_plane_t)* p) c_graphene_plane_get_constant; ///
  void function(const(graphene_plane_t)* p, graphene_vec3_t* normal) c_graphene_plane_get_normal; ///
  graphene_plane_t* function(graphene_plane_t* p, const(graphene_vec3_t)* normal, float constant) c_graphene_plane_init; ///
  graphene_plane_t* function(graphene_plane_t* p, const(graphene_plane_t)* src) c_graphene_plane_init_from_plane; ///
  graphene_plane_t* function(graphene_plane_t* p, const(graphene_vec3_t)* normal, const(graphene_point3d_t)* point) c_graphene_plane_init_from_point; ///
  graphene_plane_t* function(graphene_plane_t* p, const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, const(graphene_point3d_t)* c) c_graphene_plane_init_from_points; ///
  graphene_plane_t* function(graphene_plane_t* p, const(graphene_vec4_t)* src) c_graphene_plane_init_from_vec4; ///
  void function(const(graphene_plane_t)* p, graphene_plane_t* res) c_graphene_plane_negate; ///
  void function(const(graphene_plane_t)* p, graphene_plane_t* res) c_graphene_plane_normalize; ///
  void function(const(graphene_plane_t)* p, const(graphene_matrix_t)* matrix, const(graphene_matrix_t)* normalMatrix, graphene_plane_t* res) c_graphene_plane_transform; ///

  // Point
  GType function() c_graphene_point_get_type; ///
  graphene_point_t* function() c_graphene_point_alloc; ///
  float function(const(graphene_point_t)* a, const(graphene_point_t)* b, float* dX, float* dY) c_graphene_point_distance; ///
  bool function(const(graphene_point_t)* a, const(graphene_point_t)* b) c_graphene_point_equal; ///
  void function(graphene_point_t* p) c_graphene_point_free; ///
  graphene_point_t* function(graphene_point_t* p, float x, float y) c_graphene_point_init; ///
  graphene_point_t* function(graphene_point_t* p, const(graphene_point_t)* src) c_graphene_point_init_from_point; ///
  graphene_point_t* function(graphene_point_t* p, const(graphene_vec2_t)* src) c_graphene_point_init_from_vec2; ///
  void function(const(graphene_point_t)* a, const(graphene_point_t)* b, double factor, graphene_point_t* res) c_graphene_point_interpolate; ///
  bool function(const(graphene_point_t)* a, const(graphene_point_t)* b, float epsilon) c_graphene_point_near; ///
  void function(const(graphene_point_t)* p, graphene_vec2_t* v) c_graphene_point_to_vec2; ///
  const(graphene_point_t)* function() c_graphene_point_zero; ///

  // Point3D
  GType function() c_graphene_point3d_get_type; ///
  graphene_point3d_t* function() c_graphene_point3d_alloc; ///
  void function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, graphene_point3d_t* res) c_graphene_point3d_cross; ///
  float function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, graphene_vec3_t* delta) c_graphene_point3d_distance; ///
  float function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b) c_graphene_point3d_dot; ///
  bool function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b) c_graphene_point3d_equal; ///
  void function(graphene_point3d_t* p) c_graphene_point3d_free; ///
  graphene_point3d_t* function(graphene_point3d_t* p, float x, float y, float z) c_graphene_point3d_init; ///
  graphene_point3d_t* function(graphene_point3d_t* p, const(graphene_point3d_t)* src) c_graphene_point3d_init_from_point; ///
  graphene_point3d_t* function(graphene_point3d_t* p, const(graphene_vec3_t)* v) c_graphene_point3d_init_from_vec3; ///
  void function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, double factor, graphene_point3d_t* res) c_graphene_point3d_interpolate; ///
  float function(const(graphene_point3d_t)* p) c_graphene_point3d_length; ///
  bool function(const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, float epsilon) c_graphene_point3d_near; ///
  void function(const(graphene_point3d_t)* p, graphene_point3d_t* res) c_graphene_point3d_normalize; ///
  void function(const(graphene_point3d_t)* p, const(graphene_rect_t)* viewport, float zNear, float zFar, graphene_point3d_t* res) c_graphene_point3d_normalize_viewport; ///
  void function(const(graphene_point3d_t)* p, float factor, graphene_point3d_t* res) c_graphene_point3d_scale; ///
  void function(const(graphene_point3d_t)* p, graphene_vec3_t* v) c_graphene_point3d_to_vec3; ///
  const(graphene_point3d_t)* function() c_graphene_point3d_zero; ///

  // Quad
  GType function() c_graphene_quad_get_type; ///
  graphene_quad_t* function() c_graphene_quad_alloc; ///
  void function(const(graphene_quad_t)* q, graphene_rect_t* r) c_graphene_quad_bounds; ///
  bool function(const(graphene_quad_t)* q, const(graphene_point_t)* p) c_graphene_quad_contains; ///
  void function(graphene_quad_t* q) c_graphene_quad_free; ///
  const(graphene_point_t)* function(const(graphene_quad_t)* q, uint index) c_graphene_quad_get_point; ///
  graphene_quad_t* function(graphene_quad_t* q, const(graphene_point_t)* p1, const(graphene_point_t)* p2, const(graphene_point_t)* p3, const(graphene_point_t)* p4) c_graphene_quad_init; ///
  graphene_quad_t* function(graphene_quad_t* q, const(graphene_point_t)* points) c_graphene_quad_init_from_points; ///
  graphene_quad_t* function(graphene_quad_t* q, const(graphene_rect_t)* r) c_graphene_quad_init_from_rect; ///

  // Quaternion
  GType function() c_graphene_quaternion_get_type; ///
  graphene_quaternion_t* function() c_graphene_quaternion_alloc; ///
  void function(const(graphene_quaternion_t)* a, const(graphene_quaternion_t)* b, graphene_quaternion_t* res) c_graphene_quaternion_add; ///
  float function(const(graphene_quaternion_t)* a, const(graphene_quaternion_t)* b) c_graphene_quaternion_dot; ///
  bool function(const(graphene_quaternion_t)* a, const(graphene_quaternion_t)* b) c_graphene_quaternion_equal; ///
  void function(graphene_quaternion_t* q) c_graphene_quaternion_free; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, float x, float y, float z, float w) c_graphene_quaternion_init; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, float angle, const(graphene_vec3_t)* axis) c_graphene_quaternion_init_from_angle_vec3; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, float degX, float degY, float degZ) c_graphene_quaternion_init_from_angles; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, const(graphene_euler_t)* e) c_graphene_quaternion_init_from_euler; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, const(graphene_matrix_t)* m) c_graphene_quaternion_init_from_matrix; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, const(graphene_quaternion_t)* src) c_graphene_quaternion_init_from_quaternion; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, float radX, float radY, float radZ) c_graphene_quaternion_init_from_radians; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q, const(graphene_vec4_t)* src) c_graphene_quaternion_init_from_vec4; ///
  graphene_quaternion_t* function(graphene_quaternion_t* q) c_graphene_quaternion_init_identity; ///
  void function(const(graphene_quaternion_t)* q, graphene_quaternion_t* res) c_graphene_quaternion_invert; ///
  void function(const(graphene_quaternion_t)* a, const(graphene_quaternion_t)* b, graphene_quaternion_t* res) c_graphene_quaternion_multiply; ///
  void function(const(graphene_quaternion_t)* q, graphene_quaternion_t* res) c_graphene_quaternion_normalize; ///
  void function(const(graphene_quaternion_t)* q, float factor, graphene_quaternion_t* res) c_graphene_quaternion_scale; ///
  void function(const(graphene_quaternion_t)* a, const(graphene_quaternion_t)* b, float factor, graphene_quaternion_t* res) c_graphene_quaternion_slerp; ///
  void function(const(graphene_quaternion_t)* q, float* angle, graphene_vec3_t* axis) c_graphene_quaternion_to_angle_vec3; ///
  void function(const(graphene_quaternion_t)* q, float* degX, float* degY, float* degZ) c_graphene_quaternion_to_angles; ///
  void function(const(graphene_quaternion_t)* q, graphene_matrix_t* m) c_graphene_quaternion_to_matrix; ///
  void function(const(graphene_quaternion_t)* q, float* radX, float* radY, float* radZ) c_graphene_quaternion_to_radians; ///
  void function(const(graphene_quaternion_t)* q, graphene_vec4_t* res) c_graphene_quaternion_to_vec4; ///

  // Ray
  GType function() c_graphene_ray_get_type; ///
  graphene_ray_t* function() c_graphene_ray_alloc; ///
  bool function(const(graphene_ray_t)* a, const(graphene_ray_t)* b) c_graphene_ray_equal; ///
  void function(graphene_ray_t* r) c_graphene_ray_free; ///
  void function(const(graphene_ray_t)* r, const(graphene_point3d_t)* p, graphene_point3d_t* res) c_graphene_ray_get_closest_point_to_point; ///
  void function(const(graphene_ray_t)* r, graphene_vec3_t* direction) c_graphene_ray_get_direction; ///
  float function(const(graphene_ray_t)* r, const(graphene_plane_t)* p) c_graphene_ray_get_distance_to_plane; ///
  float function(const(graphene_ray_t)* r, const(graphene_point3d_t)* p) c_graphene_ray_get_distance_to_point; ///
  void function(const(graphene_ray_t)* r, graphene_point3d_t* origin) c_graphene_ray_get_origin; ///
  void function(const(graphene_ray_t)* r, float t, graphene_point3d_t* position) c_graphene_ray_get_position_at; ///
  graphene_ray_t* function(graphene_ray_t* r, const(graphene_point3d_t)* origin, const(graphene_vec3_t)* direction) c_graphene_ray_init; ///
  graphene_ray_t* function(graphene_ray_t* r, const(graphene_ray_t)* src) c_graphene_ray_init_from_ray; ///
  graphene_ray_t* function(graphene_ray_t* r, const(graphene_vec3_t)* origin, const(graphene_vec3_t)* direction) c_graphene_ray_init_from_vec3; ///
  graphene_ray_intersection_kind_t function(const(graphene_ray_t)* r, const(graphene_box_t)* b, float* tOut) c_graphene_ray_intersect_box; ///
  graphene_ray_intersection_kind_t function(const(graphene_ray_t)* r, const(graphene_sphere_t)* s, float* tOut) c_graphene_ray_intersect_sphere; ///
  graphene_ray_intersection_kind_t function(const(graphene_ray_t)* r, const(graphene_triangle_t)* t, float* tOut) c_graphene_ray_intersect_triangle; ///
  bool function(const(graphene_ray_t)* r, const(graphene_box_t)* b) c_graphene_ray_intersects_box; ///
  bool function(const(graphene_ray_t)* r, const(graphene_sphere_t)* s) c_graphene_ray_intersects_sphere; ///
  bool function(const(graphene_ray_t)* r, const(graphene_triangle_t)* t) c_graphene_ray_intersects_triangle; ///

  // Rect
  GType function() c_graphene_rect_get_type; ///
  bool function(const(graphene_rect_t)* r, const(graphene_point_t)* p) c_graphene_rect_contains_point; ///
  bool function(const(graphene_rect_t)* a, const(graphene_rect_t)* b) c_graphene_rect_contains_rect; ///
  bool function(const(graphene_rect_t)* a, const(graphene_rect_t)* b) c_graphene_rect_equal; ///
  void function(const(graphene_rect_t)* r, const(graphene_point_t)* p, graphene_rect_t* res) c_graphene_rect_expand; ///
  void function(graphene_rect_t* r) c_graphene_rect_free; ///
  float function(const(graphene_rect_t)* r) c_graphene_rect_get_area; ///
  void function(const(graphene_rect_t)* r, graphene_point_t* p) c_graphene_rect_get_bottom_left; ///
  void function(const(graphene_rect_t)* r, graphene_point_t* p) c_graphene_rect_get_bottom_right; ///
  void function(const(graphene_rect_t)* r, graphene_point_t* p) c_graphene_rect_get_center; ///
  float function(const(graphene_rect_t)* r) c_graphene_rect_get_height; ///
  void function(const(graphene_rect_t)* r, graphene_point_t* p) c_graphene_rect_get_top_left; ///
  void function(const(graphene_rect_t)* r, graphene_point_t* p) c_graphene_rect_get_top_right; ///
  void function(const(graphene_rect_t)* r, graphene_vec2_t* vertices) c_graphene_rect_get_vertices; ///
  float function(const(graphene_rect_t)* r) c_graphene_rect_get_width; ///
  float function(const(graphene_rect_t)* r) c_graphene_rect_get_x; ///
  float function(const(graphene_rect_t)* r) c_graphene_rect_get_y; ///
  graphene_rect_t* function(graphene_rect_t* r, float x, float y, float width, float height) c_graphene_rect_init; ///
  graphene_rect_t* function(graphene_rect_t* r, const(graphene_rect_t)* src) c_graphene_rect_init_from_rect; ///
  graphene_rect_t* function(graphene_rect_t* r, float dX, float dY) c_graphene_rect_inset; ///
  void function(const(graphene_rect_t)* r, float dX, float dY, graphene_rect_t* res) c_graphene_rect_inset_r; ///
  void function(const(graphene_rect_t)* a, const(graphene_rect_t)* b, double factor, graphene_rect_t* res) c_graphene_rect_interpolate; ///
  bool function(const(graphene_rect_t)* a, const(graphene_rect_t)* b, graphene_rect_t* res) c_graphene_rect_intersection; ///
  graphene_rect_t* function(graphene_rect_t* r) c_graphene_rect_normalize; ///
  void function(const(graphene_rect_t)* r, graphene_rect_t* res) c_graphene_rect_normalize_r; ///
  graphene_rect_t* function(graphene_rect_t* r, float dX, float dY) c_graphene_rect_offset; ///
  void function(const(graphene_rect_t)* r, float dX, float dY, graphene_rect_t* res) c_graphene_rect_offset_r; ///
  void function(const(graphene_rect_t)* r, graphene_rect_t* res) c_graphene_rect_round; ///
  void function(const(graphene_rect_t)* r, graphene_rect_t* res) c_graphene_rect_round_extents; ///
  graphene_rect_t* function(graphene_rect_t* r) c_graphene_rect_round_to_pixel; ///
  void function(const(graphene_rect_t)* r, float sH, float sV, graphene_rect_t* res) c_graphene_rect_scale; ///
  void function(const(graphene_rect_t)* a, const(graphene_rect_t)* b, graphene_rect_t* res) c_graphene_rect_union; ///
  graphene_rect_t* function() c_graphene_rect_alloc; ///
  const(graphene_rect_t)* function() c_graphene_rect_zero; ///

  // Size
  GType function() c_graphene_size_get_type; ///
  graphene_size_t* function() c_graphene_size_alloc; ///
  bool function(const(graphene_size_t)* a, const(graphene_size_t)* b) c_graphene_size_equal; ///
  void function(graphene_size_t* s) c_graphene_size_free; ///
  graphene_size_t* function(graphene_size_t* s, float width, float height) c_graphene_size_init; ///
  graphene_size_t* function(graphene_size_t* s, const(graphene_size_t)* src) c_graphene_size_init_from_size; ///
  void function(const(graphene_size_t)* a, const(graphene_size_t)* b, double factor, graphene_size_t* res) c_graphene_size_interpolate; ///
  void function(const(graphene_size_t)* s, float factor, graphene_size_t* res) c_graphene_size_scale; ///
  const(graphene_size_t)* function() c_graphene_size_zero; ///

  // Sphere
  GType function() c_graphene_sphere_get_type; ///
  graphene_sphere_t* function() c_graphene_sphere_alloc; ///
  bool function(const(graphene_sphere_t)* s, const(graphene_point3d_t)* point) c_graphene_sphere_contains_point; ///
  float function(const(graphene_sphere_t)* s, const(graphene_point3d_t)* point) c_graphene_sphere_distance; ///
  bool function(const(graphene_sphere_t)* a, const(graphene_sphere_t)* b) c_graphene_sphere_equal; ///
  void function(graphene_sphere_t* s) c_graphene_sphere_free; ///
  void function(const(graphene_sphere_t)* s, graphene_box_t* box) c_graphene_sphere_get_bounding_box; ///
  void function(const(graphene_sphere_t)* s, graphene_point3d_t* center) c_graphene_sphere_get_center; ///
  float function(const(graphene_sphere_t)* s) c_graphene_sphere_get_radius; ///
  graphene_sphere_t* function(graphene_sphere_t* s, const(graphene_point3d_t)* center, float radius) c_graphene_sphere_init; ///
  graphene_sphere_t* function(graphene_sphere_t* s, uint nPoints, const(graphene_point3d_t)* points, const(graphene_point3d_t)* center) c_graphene_sphere_init_from_points; ///
  graphene_sphere_t* function(graphene_sphere_t* s, uint nVectors, const(graphene_vec3_t)* vectors, const(graphene_point3d_t)* center) c_graphene_sphere_init_from_vectors; ///
  bool function(const(graphene_sphere_t)* s) c_graphene_sphere_is_empty; ///
  void function(const(graphene_sphere_t)* s, const(graphene_point3d_t)* point, graphene_sphere_t* res) c_graphene_sphere_translate; ///

  // Triangle
  GType function() c_graphene_triangle_get_type; ///
  graphene_triangle_t* function() c_graphene_triangle_alloc; ///
  bool function(const(graphene_triangle_t)* t, const(graphene_point3d_t)* p) c_graphene_triangle_contains_point; ///
  bool function(const(graphene_triangle_t)* a, const(graphene_triangle_t)* b) c_graphene_triangle_equal; ///
  void function(graphene_triangle_t* t) c_graphene_triangle_free; ///
  float function(const(graphene_triangle_t)* t) c_graphene_triangle_get_area; ///
  bool function(const(graphene_triangle_t)* t, const(graphene_point3d_t)* p, graphene_vec2_t* res) c_graphene_triangle_get_barycoords; ///
  void function(const(graphene_triangle_t)* t, graphene_box_t* res) c_graphene_triangle_get_bounding_box; ///
  void function(const(graphene_triangle_t)* t, graphene_point3d_t* res) c_graphene_triangle_get_midpoint; ///
  void function(const(graphene_triangle_t)* t, graphene_vec3_t* res) c_graphene_triangle_get_normal; ///
  void function(const(graphene_triangle_t)* t, graphene_plane_t* res) c_graphene_triangle_get_plane; ///
  void function(const(graphene_triangle_t)* t, graphene_point3d_t* a, graphene_point3d_t* b, graphene_point3d_t* c) c_graphene_triangle_get_points; ///
  bool function(const(graphene_triangle_t)* t, const(graphene_point3d_t)* p, const(graphene_vec2_t)* uvA, const(graphene_vec2_t)* uvB, const(graphene_vec2_t)* uvC, graphene_vec2_t* res) c_graphene_triangle_get_uv; ///
  void function(const(graphene_triangle_t)* t, graphene_vec3_t* a, graphene_vec3_t* b, graphene_vec3_t* c) c_graphene_triangle_get_vertices; ///
  graphene_triangle_t* function(graphene_triangle_t* t, const(float)* a, const(float)* b, const(float)* c) c_graphene_triangle_init_from_float; ///
  graphene_triangle_t* function(graphene_triangle_t* t, const(graphene_point3d_t)* a, const(graphene_point3d_t)* b, const(graphene_point3d_t)* c) c_graphene_triangle_init_from_point3d; ///
  graphene_triangle_t* function(graphene_triangle_t* t, const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, const(graphene_vec3_t)* c) c_graphene_triangle_init_from_vec3; ///

  // Vec2
  GType function() c_graphene_vec2_get_type; ///
  graphene_vec2_t* function() c_graphene_vec2_alloc; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_add; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_divide; ///
  float function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b) c_graphene_vec2_dot; ///
  bool function(const(graphene_vec2_t)* v1, const(graphene_vec2_t)* v2) c_graphene_vec2_equal; ///
  void function(graphene_vec2_t* v) c_graphene_vec2_free; ///
  float function(const(graphene_vec2_t)* v) c_graphene_vec2_get_x; ///
  float function(const(graphene_vec2_t)* v) c_graphene_vec2_get_y; ///
  graphene_vec2_t* function(graphene_vec2_t* v, float x, float y) c_graphene_vec2_init; ///
  graphene_vec2_t* function(graphene_vec2_t* v, const(float)* src) c_graphene_vec2_init_from_float; ///
  graphene_vec2_t* function(graphene_vec2_t* v, const(graphene_vec2_t)* src) c_graphene_vec2_init_from_vec2; ///
  void function(const(graphene_vec2_t)* v1, const(graphene_vec2_t)* v2, double factor, graphene_vec2_t* res) c_graphene_vec2_interpolate; ///
  float function(const(graphene_vec2_t)* v) c_graphene_vec2_length; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_max; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_min; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_multiply; ///
  bool function(const(graphene_vec2_t)* v1, const(graphene_vec2_t)* v2, float epsilon) c_graphene_vec2_near; ///
  void function(const(graphene_vec2_t)* v, graphene_vec2_t* res) c_graphene_vec2_negate; ///
  void function(const(graphene_vec2_t)* v, graphene_vec2_t* res) c_graphene_vec2_normalize; ///
  void function(const(graphene_vec2_t)* v, float factor, graphene_vec2_t* res) c_graphene_vec2_scale; ///
  void function(const(graphene_vec2_t)* a, const(graphene_vec2_t)* b, graphene_vec2_t* res) c_graphene_vec2_subtract; ///
  void function(const(graphene_vec2_t)* v, float* dest) c_graphene_vec2_to_float; ///
  const(graphene_vec2_t)* function() c_graphene_vec2_one; ///
  const(graphene_vec2_t)* function() c_graphene_vec2_x_axis; ///
  const(graphene_vec2_t)* function() c_graphene_vec2_y_axis; ///
  const(graphene_vec2_t)* function() c_graphene_vec2_zero; ///

  // Vec3
  GType function() c_graphene_vec3_get_type; ///
  graphene_vec3_t* function() c_graphene_vec3_alloc; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_add; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_cross; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_divide; ///
  float function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b) c_graphene_vec3_dot; ///
  bool function(const(graphene_vec3_t)* v1, const(graphene_vec3_t)* v2) c_graphene_vec3_equal; ///
  void function(graphene_vec3_t* v) c_graphene_vec3_free; ///
  float function(const(graphene_vec3_t)* v) c_graphene_vec3_get_x; ///
  void function(const(graphene_vec3_t)* v, graphene_vec2_t* res) c_graphene_vec3_get_xy; ///
  void function(const(graphene_vec3_t)* v, graphene_vec3_t* res) c_graphene_vec3_get_xy0; ///
  void function(const(graphene_vec3_t)* v, graphene_vec4_t* res) c_graphene_vec3_get_xyz0; ///
  void function(const(graphene_vec3_t)* v, graphene_vec4_t* res) c_graphene_vec3_get_xyz1; ///
  void function(const(graphene_vec3_t)* v, float w, graphene_vec4_t* res) c_graphene_vec3_get_xyzw; ///
  float function(const(graphene_vec3_t)* v) c_graphene_vec3_get_y; ///
  float function(const(graphene_vec3_t)* v) c_graphene_vec3_get_z; ///
  graphene_vec3_t* function(graphene_vec3_t* v, float x, float y, float z) c_graphene_vec3_init; ///
  graphene_vec3_t* function(graphene_vec3_t* v, const(float)* src) c_graphene_vec3_init_from_float; ///
  graphene_vec3_t* function(graphene_vec3_t* v, const(graphene_vec3_t)* src) c_graphene_vec3_init_from_vec3; ///
  void function(const(graphene_vec3_t)* v1, const(graphene_vec3_t)* v2, double factor, graphene_vec3_t* res) c_graphene_vec3_interpolate; ///
  float function(const(graphene_vec3_t)* v) c_graphene_vec3_length; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_max; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_min; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_multiply; ///
  bool function(const(graphene_vec3_t)* v1, const(graphene_vec3_t)* v2, float epsilon) c_graphene_vec3_near; ///
  void function(const(graphene_vec3_t)* v, graphene_vec3_t* res) c_graphene_vec3_negate; ///
  void function(const(graphene_vec3_t)* v, graphene_vec3_t* res) c_graphene_vec3_normalize; ///
  void function(const(graphene_vec3_t)* v, float factor, graphene_vec3_t* res) c_graphene_vec3_scale; ///
  void function(const(graphene_vec3_t)* a, const(graphene_vec3_t)* b, graphene_vec3_t* res) c_graphene_vec3_subtract; ///
  void function(const(graphene_vec3_t)* v, float* dest) c_graphene_vec3_to_float; ///
  const(graphene_vec3_t)* function() c_graphene_vec3_one; ///
  const(graphene_vec3_t)* function() c_graphene_vec3_x_axis; ///
  const(graphene_vec3_t)* function() c_graphene_vec3_y_axis; ///
  const(graphene_vec3_t)* function() c_graphene_vec3_z_axis; ///
  const(graphene_vec3_t)* function() c_graphene_vec3_zero; ///

  // Vec4
  GType function() c_graphene_vec4_get_type; ///
  graphene_vec4_t* function() c_graphene_vec4_alloc; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_add; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_divide; ///
  float function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b) c_graphene_vec4_dot; ///
  bool function(const(graphene_vec4_t)* v1, const(graphene_vec4_t)* v2) c_graphene_vec4_equal; ///
  void function(graphene_vec4_t* v) c_graphene_vec4_free; ///
  float function(const(graphene_vec4_t)* v) c_graphene_vec4_get_w; ///
  float function(const(graphene_vec4_t)* v) c_graphene_vec4_get_x; ///
  void function(const(graphene_vec4_t)* v, graphene_vec2_t* res) c_graphene_vec4_get_xy; ///
  void function(const(graphene_vec4_t)* v, graphene_vec3_t* res) c_graphene_vec4_get_xyz; ///
  float function(const(graphene_vec4_t)* v) c_graphene_vec4_get_y; ///
  float function(const(graphene_vec4_t)* v) c_graphene_vec4_get_z; ///
  graphene_vec4_t* function(graphene_vec4_t* v, float x, float y, float z, float w) c_graphene_vec4_init; ///
  graphene_vec4_t* function(graphene_vec4_t* v, const(float)* src) c_graphene_vec4_init_from_float; ///
  graphene_vec4_t* function(graphene_vec4_t* v, const(graphene_vec2_t)* src, float z, float w) c_graphene_vec4_init_from_vec2; ///
  graphene_vec4_t* function(graphene_vec4_t* v, const(graphene_vec3_t)* src, float w) c_graphene_vec4_init_from_vec3; ///
  graphene_vec4_t* function(graphene_vec4_t* v, const(graphene_vec4_t)* src) c_graphene_vec4_init_from_vec4; ///
  void function(const(graphene_vec4_t)* v1, const(graphene_vec4_t)* v2, double factor, graphene_vec4_t* res) c_graphene_vec4_interpolate; ///
  float function(const(graphene_vec4_t)* v) c_graphene_vec4_length; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_max; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_min; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_multiply; ///
  bool function(const(graphene_vec4_t)* v1, const(graphene_vec4_t)* v2, float epsilon) c_graphene_vec4_near; ///
  void function(const(graphene_vec4_t)* v, graphene_vec4_t* res) c_graphene_vec4_negate; ///
  void function(const(graphene_vec4_t)* v, graphene_vec4_t* res) c_graphene_vec4_normalize; ///
  void function(const(graphene_vec4_t)* v, float factor, graphene_vec4_t* res) c_graphene_vec4_scale; ///
  void function(const(graphene_vec4_t)* a, const(graphene_vec4_t)* b, graphene_vec4_t* res) c_graphene_vec4_subtract; ///
  void function(const(graphene_vec4_t)* v, float* dest) c_graphene_vec4_to_float; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_one; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_w_axis; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_x_axis; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_y_axis; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_z_axis; ///
  const(graphene_vec4_t)* function() c_graphene_vec4_zero; ///
}

// Box

/** */
alias graphene_box_get_type = c_graphene_box_get_type;

/** */
alias graphene_box_alloc = c_graphene_box_alloc;

/** */
alias graphene_box_contains_box = c_graphene_box_contains_box;

/** */
alias graphene_box_contains_point = c_graphene_box_contains_point;

/** */
alias graphene_box_equal = c_graphene_box_equal;

/** */
alias graphene_box_expand = c_graphene_box_expand;

/** */
alias graphene_box_expand_scalar = c_graphene_box_expand_scalar;

/** */
alias graphene_box_expand_vec3 = c_graphene_box_expand_vec3;

/** */
alias graphene_box_free = c_graphene_box_free;

/** */
alias graphene_box_get_bounding_sphere = c_graphene_box_get_bounding_sphere;

/** */
alias graphene_box_get_center = c_graphene_box_get_center;

/** */
alias graphene_box_get_depth = c_graphene_box_get_depth;

/** */
alias graphene_box_get_height = c_graphene_box_get_height;

/** */
alias graphene_box_get_max = c_graphene_box_get_max;

/** */
alias graphene_box_get_min = c_graphene_box_get_min;

/** */
alias graphene_box_get_size = c_graphene_box_get_size;

/** */
alias graphene_box_get_vertices = c_graphene_box_get_vertices;

/** */
alias graphene_box_get_width = c_graphene_box_get_width;

/** */
alias graphene_box_init = c_graphene_box_init;

/** */
alias graphene_box_init_from_box = c_graphene_box_init_from_box;

/** */
alias graphene_box_init_from_points = c_graphene_box_init_from_points;

/** */
alias graphene_box_init_from_vec3 = c_graphene_box_init_from_vec3;

/** */
alias graphene_box_init_from_vectors = c_graphene_box_init_from_vectors;

/** */
alias graphene_box_intersection = c_graphene_box_intersection;

/** */
alias graphene_box_union = c_graphene_box_union;

/** */
alias graphene_box_empty = c_graphene_box_empty;

/** */
alias graphene_box_infinite = c_graphene_box_infinite;

/** */
alias graphene_box_minus_one = c_graphene_box_minus_one;

/** */
alias graphene_box_one = c_graphene_box_one;

/** */
alias graphene_box_one_minus_one = c_graphene_box_one_minus_one;

/** */
alias graphene_box_zero = c_graphene_box_zero;

// Euler

/** */
alias graphene_euler_get_type = c_graphene_euler_get_type;

/** */
alias graphene_euler_alloc = c_graphene_euler_alloc;

/** */
alias graphene_euler_equal = c_graphene_euler_equal;

/** */
alias graphene_euler_free = c_graphene_euler_free;

/** */
alias graphene_euler_get_alpha = c_graphene_euler_get_alpha;

/** */
alias graphene_euler_get_beta = c_graphene_euler_get_beta;

/** */
alias graphene_euler_get_gamma = c_graphene_euler_get_gamma;

/** */
alias graphene_euler_get_order = c_graphene_euler_get_order;

/** */
alias graphene_euler_get_x = c_graphene_euler_get_x;

/** */
alias graphene_euler_get_y = c_graphene_euler_get_y;

/** */
alias graphene_euler_get_z = c_graphene_euler_get_z;

/** */
alias graphene_euler_init = c_graphene_euler_init;

/** */
alias graphene_euler_init_from_euler = c_graphene_euler_init_from_euler;

/** */
alias graphene_euler_init_from_matrix = c_graphene_euler_init_from_matrix;

/** */
alias graphene_euler_init_from_quaternion = c_graphene_euler_init_from_quaternion;

/** */
alias graphene_euler_init_from_radians = c_graphene_euler_init_from_radians;

/** */
alias graphene_euler_init_from_vec3 = c_graphene_euler_init_from_vec3;

/** */
alias graphene_euler_init_with_order = c_graphene_euler_init_with_order;

/** */
alias graphene_euler_reorder = c_graphene_euler_reorder;

/** */
alias graphene_euler_to_matrix = c_graphene_euler_to_matrix;

/** */
alias graphene_euler_to_quaternion = c_graphene_euler_to_quaternion;

/** */
alias graphene_euler_to_vec3 = c_graphene_euler_to_vec3;

// Frustum

/** */
alias graphene_frustum_get_type = c_graphene_frustum_get_type;

/** */
alias graphene_frustum_alloc = c_graphene_frustum_alloc;

/** */
alias graphene_frustum_contains_point = c_graphene_frustum_contains_point;

/** */
alias graphene_frustum_equal = c_graphene_frustum_equal;

/** */
alias graphene_frustum_free = c_graphene_frustum_free;

/** */
alias graphene_frustum_get_planes = c_graphene_frustum_get_planes;

/** */
alias graphene_frustum_init = c_graphene_frustum_init;

/** */
alias graphene_frustum_init_from_frustum = c_graphene_frustum_init_from_frustum;

/** */
alias graphene_frustum_init_from_matrix = c_graphene_frustum_init_from_matrix;

/** */
alias graphene_frustum_intersects_box = c_graphene_frustum_intersects_box;

/** */
alias graphene_frustum_intersects_sphere = c_graphene_frustum_intersects_sphere;

// Matrix

/** */
alias graphene_matrix_get_type = c_graphene_matrix_get_type;

/** */
alias graphene_matrix_alloc = c_graphene_matrix_alloc;

/** */
alias graphene_matrix_decompose = c_graphene_matrix_decompose;

/** */
alias graphene_matrix_determinant = c_graphene_matrix_determinant;

/** */
alias graphene_matrix_equal = c_graphene_matrix_equal;

/** */
alias graphene_matrix_equal_fast = c_graphene_matrix_equal_fast;

/** */
alias graphene_matrix_free = c_graphene_matrix_free;

/** */
alias graphene_matrix_get_row = c_graphene_matrix_get_row;

/** */
alias graphene_matrix_get_value = c_graphene_matrix_get_value;

/** */
alias graphene_matrix_get_x_scale = c_graphene_matrix_get_x_scale;

/** */
alias graphene_matrix_get_x_translation = c_graphene_matrix_get_x_translation;

/** */
alias graphene_matrix_get_y_scale = c_graphene_matrix_get_y_scale;

/** */
alias graphene_matrix_get_y_translation = c_graphene_matrix_get_y_translation;

/** */
alias graphene_matrix_get_z_scale = c_graphene_matrix_get_z_scale;

/** */
alias graphene_matrix_get_z_translation = c_graphene_matrix_get_z_translation;

/** */
alias graphene_matrix_init_from_2d = c_graphene_matrix_init_from_2d;

/** */
alias graphene_matrix_init_from_float = c_graphene_matrix_init_from_float;

/** */
alias graphene_matrix_init_from_matrix = c_graphene_matrix_init_from_matrix;

/** */
alias graphene_matrix_init_from_vec4 = c_graphene_matrix_init_from_vec4;

/** */
alias graphene_matrix_init_frustum = c_graphene_matrix_init_frustum;

/** */
alias graphene_matrix_init_identity = c_graphene_matrix_init_identity;

/** */
alias graphene_matrix_init_look_at = c_graphene_matrix_init_look_at;

/** */
alias graphene_matrix_init_ortho = c_graphene_matrix_init_ortho;

/** */
alias graphene_matrix_init_perspective = c_graphene_matrix_init_perspective;

/** */
alias graphene_matrix_init_rotate = c_graphene_matrix_init_rotate;

/** */
alias graphene_matrix_init_scale = c_graphene_matrix_init_scale;

/** */
alias graphene_matrix_init_skew = c_graphene_matrix_init_skew;

/** */
alias graphene_matrix_init_translate = c_graphene_matrix_init_translate;

/** */
alias graphene_matrix_interpolate = c_graphene_matrix_interpolate;

/** */
alias graphene_matrix_inverse = c_graphene_matrix_inverse;

/** */
alias graphene_matrix_is_2d = c_graphene_matrix_is_2d;

/** */
alias graphene_matrix_is_backface_visible = c_graphene_matrix_is_backface_visible;

/** */
alias graphene_matrix_is_identity = c_graphene_matrix_is_identity;

/** */
alias graphene_matrix_is_singular = c_graphene_matrix_is_singular;

/** */
alias graphene_matrix_multiply = c_graphene_matrix_multiply;

/** */
alias graphene_matrix_near = c_graphene_matrix_near;

/** */
alias graphene_matrix_normalize = c_graphene_matrix_normalize;

/** */
alias graphene_matrix_perspective = c_graphene_matrix_perspective;

/** */
alias graphene_matrix_print = c_graphene_matrix_print;

/** */
alias graphene_matrix_project_point = c_graphene_matrix_project_point;

/** */
alias graphene_matrix_project_rect = c_graphene_matrix_project_rect;

/** */
alias graphene_matrix_project_rect_bounds = c_graphene_matrix_project_rect_bounds;

/** */
alias graphene_matrix_rotate = c_graphene_matrix_rotate;

/** */
alias graphene_matrix_rotate_euler = c_graphene_matrix_rotate_euler;

/** */
alias graphene_matrix_rotate_quaternion = c_graphene_matrix_rotate_quaternion;

/** */
alias graphene_matrix_rotate_x = c_graphene_matrix_rotate_x;

/** */
alias graphene_matrix_rotate_y = c_graphene_matrix_rotate_y;

/** */
alias graphene_matrix_rotate_z = c_graphene_matrix_rotate_z;

/** */
alias graphene_matrix_scale = c_graphene_matrix_scale;

/** */
alias graphene_matrix_skew_xy = c_graphene_matrix_skew_xy;

/** */
alias graphene_matrix_skew_xz = c_graphene_matrix_skew_xz;

/** */
alias graphene_matrix_skew_yz = c_graphene_matrix_skew_yz;

/** */
alias graphene_matrix_to_2d = c_graphene_matrix_to_2d;

/** */
alias graphene_matrix_to_float = c_graphene_matrix_to_float;

/** */
alias graphene_matrix_transform_bounds = c_graphene_matrix_transform_bounds;

/** */
alias graphene_matrix_transform_box = c_graphene_matrix_transform_box;

/** */
alias graphene_matrix_transform_point = c_graphene_matrix_transform_point;

/** */
alias graphene_matrix_transform_point3d = c_graphene_matrix_transform_point3d;

/** */
alias graphene_matrix_transform_ray = c_graphene_matrix_transform_ray;

/** */
alias graphene_matrix_transform_rect = c_graphene_matrix_transform_rect;

/** */
alias graphene_matrix_transform_sphere = c_graphene_matrix_transform_sphere;

/** */
alias graphene_matrix_transform_vec3 = c_graphene_matrix_transform_vec3;

/** */
alias graphene_matrix_transform_vec4 = c_graphene_matrix_transform_vec4;

/** */
alias graphene_matrix_translate = c_graphene_matrix_translate;

/** */
alias graphene_matrix_transpose = c_graphene_matrix_transpose;

/** */
alias graphene_matrix_unproject_point3d = c_graphene_matrix_unproject_point3d;

/** */
alias graphene_matrix_untransform_bounds = c_graphene_matrix_untransform_bounds;

/** */
alias graphene_matrix_untransform_point = c_graphene_matrix_untransform_point;

// Plane

/** */
alias graphene_plane_get_type = c_graphene_plane_get_type;

/** */
alias graphene_plane_alloc = c_graphene_plane_alloc;

/** */
alias graphene_plane_distance = c_graphene_plane_distance;

/** */
alias graphene_plane_equal = c_graphene_plane_equal;

/** */
alias graphene_plane_free = c_graphene_plane_free;

/** */
alias graphene_plane_get_constant = c_graphene_plane_get_constant;

/** */
alias graphene_plane_get_normal = c_graphene_plane_get_normal;

/** */
alias graphene_plane_init = c_graphene_plane_init;

/** */
alias graphene_plane_init_from_plane = c_graphene_plane_init_from_plane;

/** */
alias graphene_plane_init_from_point = c_graphene_plane_init_from_point;

/** */
alias graphene_plane_init_from_points = c_graphene_plane_init_from_points;

/** */
alias graphene_plane_init_from_vec4 = c_graphene_plane_init_from_vec4;

/** */
alias graphene_plane_negate = c_graphene_plane_negate;

/** */
alias graphene_plane_normalize = c_graphene_plane_normalize;

/** */
alias graphene_plane_transform = c_graphene_plane_transform;

// Point

/** */
alias graphene_point_get_type = c_graphene_point_get_type;

/** */
alias graphene_point_alloc = c_graphene_point_alloc;

/** */
alias graphene_point_distance = c_graphene_point_distance;

/** */
alias graphene_point_equal = c_graphene_point_equal;

/** */
alias graphene_point_free = c_graphene_point_free;

/** */
alias graphene_point_init = c_graphene_point_init;

/** */
alias graphene_point_init_from_point = c_graphene_point_init_from_point;

/** */
alias graphene_point_init_from_vec2 = c_graphene_point_init_from_vec2;

/** */
alias graphene_point_interpolate = c_graphene_point_interpolate;

/** */
alias graphene_point_near = c_graphene_point_near;

/** */
alias graphene_point_to_vec2 = c_graphene_point_to_vec2;

/** */
alias graphene_point_zero = c_graphene_point_zero;

// Point3D

/** */
alias graphene_point3d_get_type = c_graphene_point3d_get_type;

/** */
alias graphene_point3d_alloc = c_graphene_point3d_alloc;

/** */
alias graphene_point3d_cross = c_graphene_point3d_cross;

/** */
alias graphene_point3d_distance = c_graphene_point3d_distance;

/** */
alias graphene_point3d_dot = c_graphene_point3d_dot;

/** */
alias graphene_point3d_equal = c_graphene_point3d_equal;

/** */
alias graphene_point3d_free = c_graphene_point3d_free;

/** */
alias graphene_point3d_init = c_graphene_point3d_init;

/** */
alias graphene_point3d_init_from_point = c_graphene_point3d_init_from_point;

/** */
alias graphene_point3d_init_from_vec3 = c_graphene_point3d_init_from_vec3;

/** */
alias graphene_point3d_interpolate = c_graphene_point3d_interpolate;

/** */
alias graphene_point3d_length = c_graphene_point3d_length;

/** */
alias graphene_point3d_near = c_graphene_point3d_near;

/** */
alias graphene_point3d_normalize = c_graphene_point3d_normalize;

/** */
alias graphene_point3d_normalize_viewport = c_graphene_point3d_normalize_viewport;

/** */
alias graphene_point3d_scale = c_graphene_point3d_scale;

/** */
alias graphene_point3d_to_vec3 = c_graphene_point3d_to_vec3;

/** */
alias graphene_point3d_zero = c_graphene_point3d_zero;

// Quad

/** */
alias graphene_quad_get_type = c_graphene_quad_get_type;

/** */
alias graphene_quad_alloc = c_graphene_quad_alloc;

/** */
alias graphene_quad_bounds = c_graphene_quad_bounds;

/** */
alias graphene_quad_contains = c_graphene_quad_contains;

/** */
alias graphene_quad_free = c_graphene_quad_free;

/** */
alias graphene_quad_get_point = c_graphene_quad_get_point;

/** */
alias graphene_quad_init = c_graphene_quad_init;

/** */
alias graphene_quad_init_from_points = c_graphene_quad_init_from_points;

/** */
alias graphene_quad_init_from_rect = c_graphene_quad_init_from_rect;

// Quaternion

/** */
alias graphene_quaternion_get_type = c_graphene_quaternion_get_type;

/** */
alias graphene_quaternion_alloc = c_graphene_quaternion_alloc;

/** */
alias graphene_quaternion_add = c_graphene_quaternion_add;

/** */
alias graphene_quaternion_dot = c_graphene_quaternion_dot;

/** */
alias graphene_quaternion_equal = c_graphene_quaternion_equal;

/** */
alias graphene_quaternion_free = c_graphene_quaternion_free;

/** */
alias graphene_quaternion_init = c_graphene_quaternion_init;

/** */
alias graphene_quaternion_init_from_angle_vec3 = c_graphene_quaternion_init_from_angle_vec3;

/** */
alias graphene_quaternion_init_from_angles = c_graphene_quaternion_init_from_angles;

/** */
alias graphene_quaternion_init_from_euler = c_graphene_quaternion_init_from_euler;

/** */
alias graphene_quaternion_init_from_matrix = c_graphene_quaternion_init_from_matrix;

/** */
alias graphene_quaternion_init_from_quaternion = c_graphene_quaternion_init_from_quaternion;

/** */
alias graphene_quaternion_init_from_radians = c_graphene_quaternion_init_from_radians;

/** */
alias graphene_quaternion_init_from_vec4 = c_graphene_quaternion_init_from_vec4;

/** */
alias graphene_quaternion_init_identity = c_graphene_quaternion_init_identity;

/** */
alias graphene_quaternion_invert = c_graphene_quaternion_invert;

/** */
alias graphene_quaternion_multiply = c_graphene_quaternion_multiply;

/** */
alias graphene_quaternion_normalize = c_graphene_quaternion_normalize;

/** */
alias graphene_quaternion_scale = c_graphene_quaternion_scale;

/** */
alias graphene_quaternion_slerp = c_graphene_quaternion_slerp;

/** */
alias graphene_quaternion_to_angle_vec3 = c_graphene_quaternion_to_angle_vec3;

/** */
alias graphene_quaternion_to_angles = c_graphene_quaternion_to_angles;

/** */
alias graphene_quaternion_to_matrix = c_graphene_quaternion_to_matrix;

/** */
alias graphene_quaternion_to_radians = c_graphene_quaternion_to_radians;

/** */
alias graphene_quaternion_to_vec4 = c_graphene_quaternion_to_vec4;

// Ray

/** */
alias graphene_ray_get_type = c_graphene_ray_get_type;

/** */
alias graphene_ray_alloc = c_graphene_ray_alloc;

/** */
alias graphene_ray_equal = c_graphene_ray_equal;

/** */
alias graphene_ray_free = c_graphene_ray_free;

/** */
alias graphene_ray_get_closest_point_to_point = c_graphene_ray_get_closest_point_to_point;

/** */
alias graphene_ray_get_direction = c_graphene_ray_get_direction;

/** */
alias graphene_ray_get_distance_to_plane = c_graphene_ray_get_distance_to_plane;

/** */
alias graphene_ray_get_distance_to_point = c_graphene_ray_get_distance_to_point;

/** */
alias graphene_ray_get_origin = c_graphene_ray_get_origin;

/** */
alias graphene_ray_get_position_at = c_graphene_ray_get_position_at;

/** */
alias graphene_ray_init = c_graphene_ray_init;

/** */
alias graphene_ray_init_from_ray = c_graphene_ray_init_from_ray;

/** */
alias graphene_ray_init_from_vec3 = c_graphene_ray_init_from_vec3;

/** */
alias graphene_ray_intersect_box = c_graphene_ray_intersect_box;

/** */
alias graphene_ray_intersect_sphere = c_graphene_ray_intersect_sphere;

/** */
alias graphene_ray_intersect_triangle = c_graphene_ray_intersect_triangle;

/** */
alias graphene_ray_intersects_box = c_graphene_ray_intersects_box;

/** */
alias graphene_ray_intersects_sphere = c_graphene_ray_intersects_sphere;

/** */
alias graphene_ray_intersects_triangle = c_graphene_ray_intersects_triangle;

// Rect

/** */
alias graphene_rect_get_type = c_graphene_rect_get_type;

/** */
alias graphene_rect_contains_point = c_graphene_rect_contains_point;

/** */
alias graphene_rect_contains_rect = c_graphene_rect_contains_rect;

/** */
alias graphene_rect_equal = c_graphene_rect_equal;

/** */
alias graphene_rect_expand = c_graphene_rect_expand;

/** */
alias graphene_rect_free = c_graphene_rect_free;

/** */
alias graphene_rect_get_area = c_graphene_rect_get_area;

/** */
alias graphene_rect_get_bottom_left = c_graphene_rect_get_bottom_left;

/** */
alias graphene_rect_get_bottom_right = c_graphene_rect_get_bottom_right;

/** */
alias graphene_rect_get_center = c_graphene_rect_get_center;

/** */
alias graphene_rect_get_height = c_graphene_rect_get_height;

/** */
alias graphene_rect_get_top_left = c_graphene_rect_get_top_left;

/** */
alias graphene_rect_get_top_right = c_graphene_rect_get_top_right;

/** */
alias graphene_rect_get_vertices = c_graphene_rect_get_vertices;

/** */
alias graphene_rect_get_width = c_graphene_rect_get_width;

/** */
alias graphene_rect_get_x = c_graphene_rect_get_x;

/** */
alias graphene_rect_get_y = c_graphene_rect_get_y;

/** */
alias graphene_rect_init = c_graphene_rect_init;

/** */
alias graphene_rect_init_from_rect = c_graphene_rect_init_from_rect;

/** */
alias graphene_rect_inset = c_graphene_rect_inset;

/** */
alias graphene_rect_inset_r = c_graphene_rect_inset_r;

/** */
alias graphene_rect_interpolate = c_graphene_rect_interpolate;

/** */
alias graphene_rect_intersection = c_graphene_rect_intersection;

/** */
alias graphene_rect_normalize = c_graphene_rect_normalize;

/** */
alias graphene_rect_normalize_r = c_graphene_rect_normalize_r;

/** */
alias graphene_rect_offset = c_graphene_rect_offset;

/** */
alias graphene_rect_offset_r = c_graphene_rect_offset_r;

/** */
alias graphene_rect_round = c_graphene_rect_round;

/** */
alias graphene_rect_round_extents = c_graphene_rect_round_extents;

/** */
alias graphene_rect_round_to_pixel = c_graphene_rect_round_to_pixel;

/** */
alias graphene_rect_scale = c_graphene_rect_scale;

/** */
alias graphene_rect_union = c_graphene_rect_union;

/** */
alias graphene_rect_alloc = c_graphene_rect_alloc;

/** */
alias graphene_rect_zero = c_graphene_rect_zero;

// Size

/** */
alias graphene_size_get_type = c_graphene_size_get_type;

/** */
alias graphene_size_alloc = c_graphene_size_alloc;

/** */
alias graphene_size_equal = c_graphene_size_equal;

/** */
alias graphene_size_free = c_graphene_size_free;

/** */
alias graphene_size_init = c_graphene_size_init;

/** */
alias graphene_size_init_from_size = c_graphene_size_init_from_size;

/** */
alias graphene_size_interpolate = c_graphene_size_interpolate;

/** */
alias graphene_size_scale = c_graphene_size_scale;

/** */
alias graphene_size_zero = c_graphene_size_zero;

// Sphere

/** */
alias graphene_sphere_get_type = c_graphene_sphere_get_type;

/** */
alias graphene_sphere_alloc = c_graphene_sphere_alloc;

/** */
alias graphene_sphere_contains_point = c_graphene_sphere_contains_point;

/** */
alias graphene_sphere_distance = c_graphene_sphere_distance;

/** */
alias graphene_sphere_equal = c_graphene_sphere_equal;

/** */
alias graphene_sphere_free = c_graphene_sphere_free;

/** */
alias graphene_sphere_get_bounding_box = c_graphene_sphere_get_bounding_box;

/** */
alias graphene_sphere_get_center = c_graphene_sphere_get_center;

/** */
alias graphene_sphere_get_radius = c_graphene_sphere_get_radius;

/** */
alias graphene_sphere_init = c_graphene_sphere_init;

/** */
alias graphene_sphere_init_from_points = c_graphene_sphere_init_from_points;

/** */
alias graphene_sphere_init_from_vectors = c_graphene_sphere_init_from_vectors;

/** */
alias graphene_sphere_is_empty = c_graphene_sphere_is_empty;

/** */
alias graphene_sphere_translate = c_graphene_sphere_translate;

// Triangle

/** */
alias graphene_triangle_get_type = c_graphene_triangle_get_type;

/** */
alias graphene_triangle_alloc = c_graphene_triangle_alloc;

/** */
alias graphene_triangle_contains_point = c_graphene_triangle_contains_point;

/** */
alias graphene_triangle_equal = c_graphene_triangle_equal;

/** */
alias graphene_triangle_free = c_graphene_triangle_free;

/** */
alias graphene_triangle_get_area = c_graphene_triangle_get_area;

/** */
alias graphene_triangle_get_barycoords = c_graphene_triangle_get_barycoords;

/** */
alias graphene_triangle_get_bounding_box = c_graphene_triangle_get_bounding_box;

/** */
alias graphene_triangle_get_midpoint = c_graphene_triangle_get_midpoint;

/** */
alias graphene_triangle_get_normal = c_graphene_triangle_get_normal;

/** */
alias graphene_triangle_get_plane = c_graphene_triangle_get_plane;

/** */
alias graphene_triangle_get_points = c_graphene_triangle_get_points;

/** */
alias graphene_triangle_get_uv = c_graphene_triangle_get_uv;

/** */
alias graphene_triangle_get_vertices = c_graphene_triangle_get_vertices;

/** */
alias graphene_triangle_init_from_float = c_graphene_triangle_init_from_float;

/** */
alias graphene_triangle_init_from_point3d = c_graphene_triangle_init_from_point3d;

/** */
alias graphene_triangle_init_from_vec3 = c_graphene_triangle_init_from_vec3;

// Vec2

/** */
alias graphene_vec2_get_type = c_graphene_vec2_get_type;

/** */
alias graphene_vec2_alloc = c_graphene_vec2_alloc;

/** */
alias graphene_vec2_add = c_graphene_vec2_add;

/** */
alias graphene_vec2_divide = c_graphene_vec2_divide;

/** */
alias graphene_vec2_dot = c_graphene_vec2_dot;

/** */
alias graphene_vec2_equal = c_graphene_vec2_equal;

/** */
alias graphene_vec2_free = c_graphene_vec2_free;

/** */
alias graphene_vec2_get_x = c_graphene_vec2_get_x;

/** */
alias graphene_vec2_get_y = c_graphene_vec2_get_y;

/** */
alias graphene_vec2_init = c_graphene_vec2_init;

/** */
alias graphene_vec2_init_from_float = c_graphene_vec2_init_from_float;

/** */
alias graphene_vec2_init_from_vec2 = c_graphene_vec2_init_from_vec2;

/** */
alias graphene_vec2_interpolate = c_graphene_vec2_interpolate;

/** */
alias graphene_vec2_length = c_graphene_vec2_length;

/** */
alias graphene_vec2_max = c_graphene_vec2_max;

/** */
alias graphene_vec2_min = c_graphene_vec2_min;

/** */
alias graphene_vec2_multiply = c_graphene_vec2_multiply;

/** */
alias graphene_vec2_near = c_graphene_vec2_near;

/** */
alias graphene_vec2_negate = c_graphene_vec2_negate;

/** */
alias graphene_vec2_normalize = c_graphene_vec2_normalize;

/** */
alias graphene_vec2_scale = c_graphene_vec2_scale;

/** */
alias graphene_vec2_subtract = c_graphene_vec2_subtract;

/** */
alias graphene_vec2_to_float = c_graphene_vec2_to_float;

/** */
alias graphene_vec2_one = c_graphene_vec2_one;

/** */
alias graphene_vec2_x_axis = c_graphene_vec2_x_axis;

/** */
alias graphene_vec2_y_axis = c_graphene_vec2_y_axis;

/** */
alias graphene_vec2_zero = c_graphene_vec2_zero;

// Vec3

/** */
alias graphene_vec3_get_type = c_graphene_vec3_get_type;

/** */
alias graphene_vec3_alloc = c_graphene_vec3_alloc;

/** */
alias graphene_vec3_add = c_graphene_vec3_add;

/** */
alias graphene_vec3_cross = c_graphene_vec3_cross;

/** */
alias graphene_vec3_divide = c_graphene_vec3_divide;

/** */
alias graphene_vec3_dot = c_graphene_vec3_dot;

/** */
alias graphene_vec3_equal = c_graphene_vec3_equal;

/** */
alias graphene_vec3_free = c_graphene_vec3_free;

/** */
alias graphene_vec3_get_x = c_graphene_vec3_get_x;

/** */
alias graphene_vec3_get_xy = c_graphene_vec3_get_xy;

/** */
alias graphene_vec3_get_xy0 = c_graphene_vec3_get_xy0;

/** */
alias graphene_vec3_get_xyz0 = c_graphene_vec3_get_xyz0;

/** */
alias graphene_vec3_get_xyz1 = c_graphene_vec3_get_xyz1;

/** */
alias graphene_vec3_get_xyzw = c_graphene_vec3_get_xyzw;

/** */
alias graphene_vec3_get_y = c_graphene_vec3_get_y;

/** */
alias graphene_vec3_get_z = c_graphene_vec3_get_z;

/** */
alias graphene_vec3_init = c_graphene_vec3_init;

/** */
alias graphene_vec3_init_from_float = c_graphene_vec3_init_from_float;

/** */
alias graphene_vec3_init_from_vec3 = c_graphene_vec3_init_from_vec3;

/** */
alias graphene_vec3_interpolate = c_graphene_vec3_interpolate;

/** */
alias graphene_vec3_length = c_graphene_vec3_length;

/** */
alias graphene_vec3_max = c_graphene_vec3_max;

/** */
alias graphene_vec3_min = c_graphene_vec3_min;

/** */
alias graphene_vec3_multiply = c_graphene_vec3_multiply;

/** */
alias graphene_vec3_near = c_graphene_vec3_near;

/** */
alias graphene_vec3_negate = c_graphene_vec3_negate;

/** */
alias graphene_vec3_normalize = c_graphene_vec3_normalize;

/** */
alias graphene_vec3_scale = c_graphene_vec3_scale;

/** */
alias graphene_vec3_subtract = c_graphene_vec3_subtract;

/** */
alias graphene_vec3_to_float = c_graphene_vec3_to_float;

/** */
alias graphene_vec3_one = c_graphene_vec3_one;

/** */
alias graphene_vec3_x_axis = c_graphene_vec3_x_axis;

/** */
alias graphene_vec3_y_axis = c_graphene_vec3_y_axis;

/** */
alias graphene_vec3_z_axis = c_graphene_vec3_z_axis;

/** */
alias graphene_vec3_zero = c_graphene_vec3_zero;

// Vec4

/** */
alias graphene_vec4_get_type = c_graphene_vec4_get_type;

/** */
alias graphene_vec4_alloc = c_graphene_vec4_alloc;

/** */
alias graphene_vec4_add = c_graphene_vec4_add;

/** */
alias graphene_vec4_divide = c_graphene_vec4_divide;

/** */
alias graphene_vec4_dot = c_graphene_vec4_dot;

/** */
alias graphene_vec4_equal = c_graphene_vec4_equal;

/** */
alias graphene_vec4_free = c_graphene_vec4_free;

/** */
alias graphene_vec4_get_w = c_graphene_vec4_get_w;

/** */
alias graphene_vec4_get_x = c_graphene_vec4_get_x;

/** */
alias graphene_vec4_get_xy = c_graphene_vec4_get_xy;

/** */
alias graphene_vec4_get_xyz = c_graphene_vec4_get_xyz;

/** */
alias graphene_vec4_get_y = c_graphene_vec4_get_y;

/** */
alias graphene_vec4_get_z = c_graphene_vec4_get_z;

/** */
alias graphene_vec4_init = c_graphene_vec4_init;

/** */
alias graphene_vec4_init_from_float = c_graphene_vec4_init_from_float;

/** */
alias graphene_vec4_init_from_vec2 = c_graphene_vec4_init_from_vec2;

/** */
alias graphene_vec4_init_from_vec3 = c_graphene_vec4_init_from_vec3;

/** */
alias graphene_vec4_init_from_vec4 = c_graphene_vec4_init_from_vec4;

/** */
alias graphene_vec4_interpolate = c_graphene_vec4_interpolate;

/** */
alias graphene_vec4_length = c_graphene_vec4_length;

/** */
alias graphene_vec4_max = c_graphene_vec4_max;

/** */
alias graphene_vec4_min = c_graphene_vec4_min;

/** */
alias graphene_vec4_multiply = c_graphene_vec4_multiply;

/** */
alias graphene_vec4_near = c_graphene_vec4_near;

/** */
alias graphene_vec4_negate = c_graphene_vec4_negate;

/** */
alias graphene_vec4_normalize = c_graphene_vec4_normalize;

/** */
alias graphene_vec4_scale = c_graphene_vec4_scale;

/** */
alias graphene_vec4_subtract = c_graphene_vec4_subtract;

/** */
alias graphene_vec4_to_float = c_graphene_vec4_to_float;

/** */
alias graphene_vec4_one = c_graphene_vec4_one;

/** */
alias graphene_vec4_w_axis = c_graphene_vec4_w_axis;

/** */
alias graphene_vec4_x_axis = c_graphene_vec4_x_axis;

/** */
alias graphene_vec4_y_axis = c_graphene_vec4_y_axis;

/** */
alias graphene_vec4_z_axis = c_graphene_vec4_z_axis;

/** */
alias graphene_vec4_zero = c_graphene_vec4_zero;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Box
  gidLink(cast(void**)&graphene_box_get_type, "graphene_box_get_type", libs);
  gidLink(cast(void**)&graphene_box_alloc, "graphene_box_alloc", libs);
  gidLink(cast(void**)&graphene_box_contains_box, "graphene_box_contains_box", libs);
  gidLink(cast(void**)&graphene_box_contains_point, "graphene_box_contains_point", libs);
  gidLink(cast(void**)&graphene_box_equal, "graphene_box_equal", libs);
  gidLink(cast(void**)&graphene_box_expand, "graphene_box_expand", libs);
  gidLink(cast(void**)&graphene_box_expand_scalar, "graphene_box_expand_scalar", libs);
  gidLink(cast(void**)&graphene_box_expand_vec3, "graphene_box_expand_vec3", libs);
  gidLink(cast(void**)&graphene_box_free, "graphene_box_free", libs);
  gidLink(cast(void**)&graphene_box_get_bounding_sphere, "graphene_box_get_bounding_sphere", libs);
  gidLink(cast(void**)&graphene_box_get_center, "graphene_box_get_center", libs);
  gidLink(cast(void**)&graphene_box_get_depth, "graphene_box_get_depth", libs);
  gidLink(cast(void**)&graphene_box_get_height, "graphene_box_get_height", libs);
  gidLink(cast(void**)&graphene_box_get_max, "graphene_box_get_max", libs);
  gidLink(cast(void**)&graphene_box_get_min, "graphene_box_get_min", libs);
  gidLink(cast(void**)&graphene_box_get_size, "graphene_box_get_size", libs);
  gidLink(cast(void**)&graphene_box_get_vertices, "graphene_box_get_vertices", libs);
  gidLink(cast(void**)&graphene_box_get_width, "graphene_box_get_width", libs);
  gidLink(cast(void**)&graphene_box_init, "graphene_box_init", libs);
  gidLink(cast(void**)&graphene_box_init_from_box, "graphene_box_init_from_box", libs);
  gidLink(cast(void**)&graphene_box_init_from_points, "graphene_box_init_from_points", libs);
  gidLink(cast(void**)&graphene_box_init_from_vec3, "graphene_box_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_box_init_from_vectors, "graphene_box_init_from_vectors", libs);
  gidLink(cast(void**)&graphene_box_intersection, "graphene_box_intersection", libs);
  gidLink(cast(void**)&graphene_box_union, "graphene_box_union", libs);
  gidLink(cast(void**)&graphene_box_empty, "graphene_box_empty", libs);
  gidLink(cast(void**)&graphene_box_infinite, "graphene_box_infinite", libs);
  gidLink(cast(void**)&graphene_box_minus_one, "graphene_box_minus_one", libs);
  gidLink(cast(void**)&graphene_box_one, "graphene_box_one", libs);
  gidLink(cast(void**)&graphene_box_one_minus_one, "graphene_box_one_minus_one", libs);
  gidLink(cast(void**)&graphene_box_zero, "graphene_box_zero", libs);

  // Euler
  gidLink(cast(void**)&graphene_euler_get_type, "graphene_euler_get_type", libs);
  gidLink(cast(void**)&graphene_euler_alloc, "graphene_euler_alloc", libs);
  gidLink(cast(void**)&graphene_euler_equal, "graphene_euler_equal", libs);
  gidLink(cast(void**)&graphene_euler_free, "graphene_euler_free", libs);
  gidLink(cast(void**)&graphene_euler_get_alpha, "graphene_euler_get_alpha", libs);
  gidLink(cast(void**)&graphene_euler_get_beta, "graphene_euler_get_beta", libs);
  gidLink(cast(void**)&graphene_euler_get_gamma, "graphene_euler_get_gamma", libs);
  gidLink(cast(void**)&graphene_euler_get_order, "graphene_euler_get_order", libs);
  gidLink(cast(void**)&graphene_euler_get_x, "graphene_euler_get_x", libs);
  gidLink(cast(void**)&graphene_euler_get_y, "graphene_euler_get_y", libs);
  gidLink(cast(void**)&graphene_euler_get_z, "graphene_euler_get_z", libs);
  gidLink(cast(void**)&graphene_euler_init, "graphene_euler_init", libs);
  gidLink(cast(void**)&graphene_euler_init_from_euler, "graphene_euler_init_from_euler", libs);
  gidLink(cast(void**)&graphene_euler_init_from_matrix, "graphene_euler_init_from_matrix", libs);
  gidLink(cast(void**)&graphene_euler_init_from_quaternion, "graphene_euler_init_from_quaternion", libs);
  gidLink(cast(void**)&graphene_euler_init_from_radians, "graphene_euler_init_from_radians", libs);
  gidLink(cast(void**)&graphene_euler_init_from_vec3, "graphene_euler_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_euler_init_with_order, "graphene_euler_init_with_order", libs);
  gidLink(cast(void**)&graphene_euler_reorder, "graphene_euler_reorder", libs);
  gidLink(cast(void**)&graphene_euler_to_matrix, "graphene_euler_to_matrix", libs);
  gidLink(cast(void**)&graphene_euler_to_quaternion, "graphene_euler_to_quaternion", libs);
  gidLink(cast(void**)&graphene_euler_to_vec3, "graphene_euler_to_vec3", libs);

  // Frustum
  gidLink(cast(void**)&graphene_frustum_get_type, "graphene_frustum_get_type", libs);
  gidLink(cast(void**)&graphene_frustum_alloc, "graphene_frustum_alloc", libs);
  gidLink(cast(void**)&graphene_frustum_contains_point, "graphene_frustum_contains_point", libs);
  gidLink(cast(void**)&graphene_frustum_equal, "graphene_frustum_equal", libs);
  gidLink(cast(void**)&graphene_frustum_free, "graphene_frustum_free", libs);
  gidLink(cast(void**)&graphene_frustum_get_planes, "graphene_frustum_get_planes", libs);
  gidLink(cast(void**)&graphene_frustum_init, "graphene_frustum_init", libs);
  gidLink(cast(void**)&graphene_frustum_init_from_frustum, "graphene_frustum_init_from_frustum", libs);
  gidLink(cast(void**)&graphene_frustum_init_from_matrix, "graphene_frustum_init_from_matrix", libs);
  gidLink(cast(void**)&graphene_frustum_intersects_box, "graphene_frustum_intersects_box", libs);
  gidLink(cast(void**)&graphene_frustum_intersects_sphere, "graphene_frustum_intersects_sphere", libs);

  // Matrix
  gidLink(cast(void**)&graphene_matrix_get_type, "graphene_matrix_get_type", libs);
  gidLink(cast(void**)&graphene_matrix_alloc, "graphene_matrix_alloc", libs);
  gidLink(cast(void**)&graphene_matrix_decompose, "graphene_matrix_decompose", libs);
  gidLink(cast(void**)&graphene_matrix_determinant, "graphene_matrix_determinant", libs);
  gidLink(cast(void**)&graphene_matrix_equal, "graphene_matrix_equal", libs);
  gidLink(cast(void**)&graphene_matrix_equal_fast, "graphene_matrix_equal_fast", libs);
  gidLink(cast(void**)&graphene_matrix_free, "graphene_matrix_free", libs);
  gidLink(cast(void**)&graphene_matrix_get_row, "graphene_matrix_get_row", libs);
  gidLink(cast(void**)&graphene_matrix_get_value, "graphene_matrix_get_value", libs);
  gidLink(cast(void**)&graphene_matrix_get_x_scale, "graphene_matrix_get_x_scale", libs);
  gidLink(cast(void**)&graphene_matrix_get_x_translation, "graphene_matrix_get_x_translation", libs);
  gidLink(cast(void**)&graphene_matrix_get_y_scale, "graphene_matrix_get_y_scale", libs);
  gidLink(cast(void**)&graphene_matrix_get_y_translation, "graphene_matrix_get_y_translation", libs);
  gidLink(cast(void**)&graphene_matrix_get_z_scale, "graphene_matrix_get_z_scale", libs);
  gidLink(cast(void**)&graphene_matrix_get_z_translation, "graphene_matrix_get_z_translation", libs);
  gidLink(cast(void**)&graphene_matrix_init_from_2d, "graphene_matrix_init_from_2d", libs);
  gidLink(cast(void**)&graphene_matrix_init_from_float, "graphene_matrix_init_from_float", libs);
  gidLink(cast(void**)&graphene_matrix_init_from_matrix, "graphene_matrix_init_from_matrix", libs);
  gidLink(cast(void**)&graphene_matrix_init_from_vec4, "graphene_matrix_init_from_vec4", libs);
  gidLink(cast(void**)&graphene_matrix_init_frustum, "graphene_matrix_init_frustum", libs);
  gidLink(cast(void**)&graphene_matrix_init_identity, "graphene_matrix_init_identity", libs);
  gidLink(cast(void**)&graphene_matrix_init_look_at, "graphene_matrix_init_look_at", libs);
  gidLink(cast(void**)&graphene_matrix_init_ortho, "graphene_matrix_init_ortho", libs);
  gidLink(cast(void**)&graphene_matrix_init_perspective, "graphene_matrix_init_perspective", libs);
  gidLink(cast(void**)&graphene_matrix_init_rotate, "graphene_matrix_init_rotate", libs);
  gidLink(cast(void**)&graphene_matrix_init_scale, "graphene_matrix_init_scale", libs);
  gidLink(cast(void**)&graphene_matrix_init_skew, "graphene_matrix_init_skew", libs);
  gidLink(cast(void**)&graphene_matrix_init_translate, "graphene_matrix_init_translate", libs);
  gidLink(cast(void**)&graphene_matrix_interpolate, "graphene_matrix_interpolate", libs);
  gidLink(cast(void**)&graphene_matrix_inverse, "graphene_matrix_inverse", libs);
  gidLink(cast(void**)&graphene_matrix_is_2d, "graphene_matrix_is_2d", libs);
  gidLink(cast(void**)&graphene_matrix_is_backface_visible, "graphene_matrix_is_backface_visible", libs);
  gidLink(cast(void**)&graphene_matrix_is_identity, "graphene_matrix_is_identity", libs);
  gidLink(cast(void**)&graphene_matrix_is_singular, "graphene_matrix_is_singular", libs);
  gidLink(cast(void**)&graphene_matrix_multiply, "graphene_matrix_multiply", libs);
  gidLink(cast(void**)&graphene_matrix_near, "graphene_matrix_near", libs);
  gidLink(cast(void**)&graphene_matrix_normalize, "graphene_matrix_normalize", libs);
  gidLink(cast(void**)&graphene_matrix_perspective, "graphene_matrix_perspective", libs);
  gidLink(cast(void**)&graphene_matrix_print, "graphene_matrix_print", libs);
  gidLink(cast(void**)&graphene_matrix_project_point, "graphene_matrix_project_point", libs);
  gidLink(cast(void**)&graphene_matrix_project_rect, "graphene_matrix_project_rect", libs);
  gidLink(cast(void**)&graphene_matrix_project_rect_bounds, "graphene_matrix_project_rect_bounds", libs);
  gidLink(cast(void**)&graphene_matrix_rotate, "graphene_matrix_rotate", libs);
  gidLink(cast(void**)&graphene_matrix_rotate_euler, "graphene_matrix_rotate_euler", libs);
  gidLink(cast(void**)&graphene_matrix_rotate_quaternion, "graphene_matrix_rotate_quaternion", libs);
  gidLink(cast(void**)&graphene_matrix_rotate_x, "graphene_matrix_rotate_x", libs);
  gidLink(cast(void**)&graphene_matrix_rotate_y, "graphene_matrix_rotate_y", libs);
  gidLink(cast(void**)&graphene_matrix_rotate_z, "graphene_matrix_rotate_z", libs);
  gidLink(cast(void**)&graphene_matrix_scale, "graphene_matrix_scale", libs);
  gidLink(cast(void**)&graphene_matrix_skew_xy, "graphene_matrix_skew_xy", libs);
  gidLink(cast(void**)&graphene_matrix_skew_xz, "graphene_matrix_skew_xz", libs);
  gidLink(cast(void**)&graphene_matrix_skew_yz, "graphene_matrix_skew_yz", libs);
  gidLink(cast(void**)&graphene_matrix_to_2d, "graphene_matrix_to_2d", libs);
  gidLink(cast(void**)&graphene_matrix_to_float, "graphene_matrix_to_float", libs);
  gidLink(cast(void**)&graphene_matrix_transform_bounds, "graphene_matrix_transform_bounds", libs);
  gidLink(cast(void**)&graphene_matrix_transform_box, "graphene_matrix_transform_box", libs);
  gidLink(cast(void**)&graphene_matrix_transform_point, "graphene_matrix_transform_point", libs);
  gidLink(cast(void**)&graphene_matrix_transform_point3d, "graphene_matrix_transform_point3d", libs);
  gidLink(cast(void**)&graphene_matrix_transform_ray, "graphene_matrix_transform_ray", libs);
  gidLink(cast(void**)&graphene_matrix_transform_rect, "graphene_matrix_transform_rect", libs);
  gidLink(cast(void**)&graphene_matrix_transform_sphere, "graphene_matrix_transform_sphere", libs);
  gidLink(cast(void**)&graphene_matrix_transform_vec3, "graphene_matrix_transform_vec3", libs);
  gidLink(cast(void**)&graphene_matrix_transform_vec4, "graphene_matrix_transform_vec4", libs);
  gidLink(cast(void**)&graphene_matrix_translate, "graphene_matrix_translate", libs);
  gidLink(cast(void**)&graphene_matrix_transpose, "graphene_matrix_transpose", libs);
  gidLink(cast(void**)&graphene_matrix_unproject_point3d, "graphene_matrix_unproject_point3d", libs);
  gidLink(cast(void**)&graphene_matrix_untransform_bounds, "graphene_matrix_untransform_bounds", libs);
  gidLink(cast(void**)&graphene_matrix_untransform_point, "graphene_matrix_untransform_point", libs);

  // Plane
  gidLink(cast(void**)&graphene_plane_get_type, "graphene_plane_get_type", libs);
  gidLink(cast(void**)&graphene_plane_alloc, "graphene_plane_alloc", libs);
  gidLink(cast(void**)&graphene_plane_distance, "graphene_plane_distance", libs);
  gidLink(cast(void**)&graphene_plane_equal, "graphene_plane_equal", libs);
  gidLink(cast(void**)&graphene_plane_free, "graphene_plane_free", libs);
  gidLink(cast(void**)&graphene_plane_get_constant, "graphene_plane_get_constant", libs);
  gidLink(cast(void**)&graphene_plane_get_normal, "graphene_plane_get_normal", libs);
  gidLink(cast(void**)&graphene_plane_init, "graphene_plane_init", libs);
  gidLink(cast(void**)&graphene_plane_init_from_plane, "graphene_plane_init_from_plane", libs);
  gidLink(cast(void**)&graphene_plane_init_from_point, "graphene_plane_init_from_point", libs);
  gidLink(cast(void**)&graphene_plane_init_from_points, "graphene_plane_init_from_points", libs);
  gidLink(cast(void**)&graphene_plane_init_from_vec4, "graphene_plane_init_from_vec4", libs);
  gidLink(cast(void**)&graphene_plane_negate, "graphene_plane_negate", libs);
  gidLink(cast(void**)&graphene_plane_normalize, "graphene_plane_normalize", libs);
  gidLink(cast(void**)&graphene_plane_transform, "graphene_plane_transform", libs);

  // Point
  gidLink(cast(void**)&graphene_point_get_type, "graphene_point_get_type", libs);
  gidLink(cast(void**)&graphene_point_alloc, "graphene_point_alloc", libs);
  gidLink(cast(void**)&graphene_point_distance, "graphene_point_distance", libs);
  gidLink(cast(void**)&graphene_point_equal, "graphene_point_equal", libs);
  gidLink(cast(void**)&graphene_point_free, "graphene_point_free", libs);
  gidLink(cast(void**)&graphene_point_init, "graphene_point_init", libs);
  gidLink(cast(void**)&graphene_point_init_from_point, "graphene_point_init_from_point", libs);
  gidLink(cast(void**)&graphene_point_init_from_vec2, "graphene_point_init_from_vec2", libs);
  gidLink(cast(void**)&graphene_point_interpolate, "graphene_point_interpolate", libs);
  gidLink(cast(void**)&graphene_point_near, "graphene_point_near", libs);
  gidLink(cast(void**)&graphene_point_to_vec2, "graphene_point_to_vec2", libs);
  gidLink(cast(void**)&graphene_point_zero, "graphene_point_zero", libs);

  // Point3D
  gidLink(cast(void**)&graphene_point3d_get_type, "graphene_point3d_get_type", libs);
  gidLink(cast(void**)&graphene_point3d_alloc, "graphene_point3d_alloc", libs);
  gidLink(cast(void**)&graphene_point3d_cross, "graphene_point3d_cross", libs);
  gidLink(cast(void**)&graphene_point3d_distance, "graphene_point3d_distance", libs);
  gidLink(cast(void**)&graphene_point3d_dot, "graphene_point3d_dot", libs);
  gidLink(cast(void**)&graphene_point3d_equal, "graphene_point3d_equal", libs);
  gidLink(cast(void**)&graphene_point3d_free, "graphene_point3d_free", libs);
  gidLink(cast(void**)&graphene_point3d_init, "graphene_point3d_init", libs);
  gidLink(cast(void**)&graphene_point3d_init_from_point, "graphene_point3d_init_from_point", libs);
  gidLink(cast(void**)&graphene_point3d_init_from_vec3, "graphene_point3d_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_point3d_interpolate, "graphene_point3d_interpolate", libs);
  gidLink(cast(void**)&graphene_point3d_length, "graphene_point3d_length", libs);
  gidLink(cast(void**)&graphene_point3d_near, "graphene_point3d_near", libs);
  gidLink(cast(void**)&graphene_point3d_normalize, "graphene_point3d_normalize", libs);
  gidLink(cast(void**)&graphene_point3d_normalize_viewport, "graphene_point3d_normalize_viewport", libs);
  gidLink(cast(void**)&graphene_point3d_scale, "graphene_point3d_scale", libs);
  gidLink(cast(void**)&graphene_point3d_to_vec3, "graphene_point3d_to_vec3", libs);
  gidLink(cast(void**)&graphene_point3d_zero, "graphene_point3d_zero", libs);

  // Quad
  gidLink(cast(void**)&graphene_quad_get_type, "graphene_quad_get_type", libs);
  gidLink(cast(void**)&graphene_quad_alloc, "graphene_quad_alloc", libs);
  gidLink(cast(void**)&graphene_quad_bounds, "graphene_quad_bounds", libs);
  gidLink(cast(void**)&graphene_quad_contains, "graphene_quad_contains", libs);
  gidLink(cast(void**)&graphene_quad_free, "graphene_quad_free", libs);
  gidLink(cast(void**)&graphene_quad_get_point, "graphene_quad_get_point", libs);
  gidLink(cast(void**)&graphene_quad_init, "graphene_quad_init", libs);
  gidLink(cast(void**)&graphene_quad_init_from_points, "graphene_quad_init_from_points", libs);
  gidLink(cast(void**)&graphene_quad_init_from_rect, "graphene_quad_init_from_rect", libs);

  // Quaternion
  gidLink(cast(void**)&graphene_quaternion_get_type, "graphene_quaternion_get_type", libs);
  gidLink(cast(void**)&graphene_quaternion_alloc, "graphene_quaternion_alloc", libs);
  gidLink(cast(void**)&graphene_quaternion_add, "graphene_quaternion_add", libs);
  gidLink(cast(void**)&graphene_quaternion_dot, "graphene_quaternion_dot", libs);
  gidLink(cast(void**)&graphene_quaternion_equal, "graphene_quaternion_equal", libs);
  gidLink(cast(void**)&graphene_quaternion_free, "graphene_quaternion_free", libs);
  gidLink(cast(void**)&graphene_quaternion_init, "graphene_quaternion_init", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_angle_vec3, "graphene_quaternion_init_from_angle_vec3", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_angles, "graphene_quaternion_init_from_angles", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_euler, "graphene_quaternion_init_from_euler", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_matrix, "graphene_quaternion_init_from_matrix", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_quaternion, "graphene_quaternion_init_from_quaternion", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_radians, "graphene_quaternion_init_from_radians", libs);
  gidLink(cast(void**)&graphene_quaternion_init_from_vec4, "graphene_quaternion_init_from_vec4", libs);
  gidLink(cast(void**)&graphene_quaternion_init_identity, "graphene_quaternion_init_identity", libs);
  gidLink(cast(void**)&graphene_quaternion_invert, "graphene_quaternion_invert", libs);
  gidLink(cast(void**)&graphene_quaternion_multiply, "graphene_quaternion_multiply", libs);
  gidLink(cast(void**)&graphene_quaternion_normalize, "graphene_quaternion_normalize", libs);
  gidLink(cast(void**)&graphene_quaternion_scale, "graphene_quaternion_scale", libs);
  gidLink(cast(void**)&graphene_quaternion_slerp, "graphene_quaternion_slerp", libs);
  gidLink(cast(void**)&graphene_quaternion_to_angle_vec3, "graphene_quaternion_to_angle_vec3", libs);
  gidLink(cast(void**)&graphene_quaternion_to_angles, "graphene_quaternion_to_angles", libs);
  gidLink(cast(void**)&graphene_quaternion_to_matrix, "graphene_quaternion_to_matrix", libs);
  gidLink(cast(void**)&graphene_quaternion_to_radians, "graphene_quaternion_to_radians", libs);
  gidLink(cast(void**)&graphene_quaternion_to_vec4, "graphene_quaternion_to_vec4", libs);

  // Ray
  gidLink(cast(void**)&graphene_ray_get_type, "graphene_ray_get_type", libs);
  gidLink(cast(void**)&graphene_ray_alloc, "graphene_ray_alloc", libs);
  gidLink(cast(void**)&graphene_ray_equal, "graphene_ray_equal", libs);
  gidLink(cast(void**)&graphene_ray_free, "graphene_ray_free", libs);
  gidLink(cast(void**)&graphene_ray_get_closest_point_to_point, "graphene_ray_get_closest_point_to_point", libs);
  gidLink(cast(void**)&graphene_ray_get_direction, "graphene_ray_get_direction", libs);
  gidLink(cast(void**)&graphene_ray_get_distance_to_plane, "graphene_ray_get_distance_to_plane", libs);
  gidLink(cast(void**)&graphene_ray_get_distance_to_point, "graphene_ray_get_distance_to_point", libs);
  gidLink(cast(void**)&graphene_ray_get_origin, "graphene_ray_get_origin", libs);
  gidLink(cast(void**)&graphene_ray_get_position_at, "graphene_ray_get_position_at", libs);
  gidLink(cast(void**)&graphene_ray_init, "graphene_ray_init", libs);
  gidLink(cast(void**)&graphene_ray_init_from_ray, "graphene_ray_init_from_ray", libs);
  gidLink(cast(void**)&graphene_ray_init_from_vec3, "graphene_ray_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_ray_intersect_box, "graphene_ray_intersect_box", libs);
  gidLink(cast(void**)&graphene_ray_intersect_sphere, "graphene_ray_intersect_sphere", libs);
  gidLink(cast(void**)&graphene_ray_intersect_triangle, "graphene_ray_intersect_triangle", libs);
  gidLink(cast(void**)&graphene_ray_intersects_box, "graphene_ray_intersects_box", libs);
  gidLink(cast(void**)&graphene_ray_intersects_sphere, "graphene_ray_intersects_sphere", libs);
  gidLink(cast(void**)&graphene_ray_intersects_triangle, "graphene_ray_intersects_triangle", libs);

  // Rect
  gidLink(cast(void**)&graphene_rect_get_type, "graphene_rect_get_type", libs);
  gidLink(cast(void**)&graphene_rect_contains_point, "graphene_rect_contains_point", libs);
  gidLink(cast(void**)&graphene_rect_contains_rect, "graphene_rect_contains_rect", libs);
  gidLink(cast(void**)&graphene_rect_equal, "graphene_rect_equal", libs);
  gidLink(cast(void**)&graphene_rect_expand, "graphene_rect_expand", libs);
  gidLink(cast(void**)&graphene_rect_free, "graphene_rect_free", libs);
  gidLink(cast(void**)&graphene_rect_get_area, "graphene_rect_get_area", libs);
  gidLink(cast(void**)&graphene_rect_get_bottom_left, "graphene_rect_get_bottom_left", libs);
  gidLink(cast(void**)&graphene_rect_get_bottom_right, "graphene_rect_get_bottom_right", libs);
  gidLink(cast(void**)&graphene_rect_get_center, "graphene_rect_get_center", libs);
  gidLink(cast(void**)&graphene_rect_get_height, "graphene_rect_get_height", libs);
  gidLink(cast(void**)&graphene_rect_get_top_left, "graphene_rect_get_top_left", libs);
  gidLink(cast(void**)&graphene_rect_get_top_right, "graphene_rect_get_top_right", libs);
  gidLink(cast(void**)&graphene_rect_get_vertices, "graphene_rect_get_vertices", libs);
  gidLink(cast(void**)&graphene_rect_get_width, "graphene_rect_get_width", libs);
  gidLink(cast(void**)&graphene_rect_get_x, "graphene_rect_get_x", libs);
  gidLink(cast(void**)&graphene_rect_get_y, "graphene_rect_get_y", libs);
  gidLink(cast(void**)&graphene_rect_init, "graphene_rect_init", libs);
  gidLink(cast(void**)&graphene_rect_init_from_rect, "graphene_rect_init_from_rect", libs);
  gidLink(cast(void**)&graphene_rect_inset, "graphene_rect_inset", libs);
  gidLink(cast(void**)&graphene_rect_inset_r, "graphene_rect_inset_r", libs);
  gidLink(cast(void**)&graphene_rect_interpolate, "graphene_rect_interpolate", libs);
  gidLink(cast(void**)&graphene_rect_intersection, "graphene_rect_intersection", libs);
  gidLink(cast(void**)&graphene_rect_normalize, "graphene_rect_normalize", libs);
  gidLink(cast(void**)&graphene_rect_normalize_r, "graphene_rect_normalize_r", libs);
  gidLink(cast(void**)&graphene_rect_offset, "graphene_rect_offset", libs);
  gidLink(cast(void**)&graphene_rect_offset_r, "graphene_rect_offset_r", libs);
  gidLink(cast(void**)&graphene_rect_round, "graphene_rect_round", libs);
  gidLink(cast(void**)&graphene_rect_round_extents, "graphene_rect_round_extents", libs);
  gidLink(cast(void**)&graphene_rect_round_to_pixel, "graphene_rect_round_to_pixel", libs);
  gidLink(cast(void**)&graphene_rect_scale, "graphene_rect_scale", libs);
  gidLink(cast(void**)&graphene_rect_union, "graphene_rect_union", libs);
  gidLink(cast(void**)&graphene_rect_alloc, "graphene_rect_alloc", libs);
  gidLink(cast(void**)&graphene_rect_zero, "graphene_rect_zero", libs);

  // Size
  gidLink(cast(void**)&graphene_size_get_type, "graphene_size_get_type", libs);
  gidLink(cast(void**)&graphene_size_alloc, "graphene_size_alloc", libs);
  gidLink(cast(void**)&graphene_size_equal, "graphene_size_equal", libs);
  gidLink(cast(void**)&graphene_size_free, "graphene_size_free", libs);
  gidLink(cast(void**)&graphene_size_init, "graphene_size_init", libs);
  gidLink(cast(void**)&graphene_size_init_from_size, "graphene_size_init_from_size", libs);
  gidLink(cast(void**)&graphene_size_interpolate, "graphene_size_interpolate", libs);
  gidLink(cast(void**)&graphene_size_scale, "graphene_size_scale", libs);
  gidLink(cast(void**)&graphene_size_zero, "graphene_size_zero", libs);

  // Sphere
  gidLink(cast(void**)&graphene_sphere_get_type, "graphene_sphere_get_type", libs);
  gidLink(cast(void**)&graphene_sphere_alloc, "graphene_sphere_alloc", libs);
  gidLink(cast(void**)&graphene_sphere_contains_point, "graphene_sphere_contains_point", libs);
  gidLink(cast(void**)&graphene_sphere_distance, "graphene_sphere_distance", libs);
  gidLink(cast(void**)&graphene_sphere_equal, "graphene_sphere_equal", libs);
  gidLink(cast(void**)&graphene_sphere_free, "graphene_sphere_free", libs);
  gidLink(cast(void**)&graphene_sphere_get_bounding_box, "graphene_sphere_get_bounding_box", libs);
  gidLink(cast(void**)&graphene_sphere_get_center, "graphene_sphere_get_center", libs);
  gidLink(cast(void**)&graphene_sphere_get_radius, "graphene_sphere_get_radius", libs);
  gidLink(cast(void**)&graphene_sphere_init, "graphene_sphere_init", libs);
  gidLink(cast(void**)&graphene_sphere_init_from_points, "graphene_sphere_init_from_points", libs);
  gidLink(cast(void**)&graphene_sphere_init_from_vectors, "graphene_sphere_init_from_vectors", libs);
  gidLink(cast(void**)&graphene_sphere_is_empty, "graphene_sphere_is_empty", libs);
  gidLink(cast(void**)&graphene_sphere_translate, "graphene_sphere_translate", libs);

  // Triangle
  gidLink(cast(void**)&graphene_triangle_get_type, "graphene_triangle_get_type", libs);
  gidLink(cast(void**)&graphene_triangle_alloc, "graphene_triangle_alloc", libs);
  gidLink(cast(void**)&graphene_triangle_contains_point, "graphene_triangle_contains_point", libs);
  gidLink(cast(void**)&graphene_triangle_equal, "graphene_triangle_equal", libs);
  gidLink(cast(void**)&graphene_triangle_free, "graphene_triangle_free", libs);
  gidLink(cast(void**)&graphene_triangle_get_area, "graphene_triangle_get_area", libs);
  gidLink(cast(void**)&graphene_triangle_get_barycoords, "graphene_triangle_get_barycoords", libs);
  gidLink(cast(void**)&graphene_triangle_get_bounding_box, "graphene_triangle_get_bounding_box", libs);
  gidLink(cast(void**)&graphene_triangle_get_midpoint, "graphene_triangle_get_midpoint", libs);
  gidLink(cast(void**)&graphene_triangle_get_normal, "graphene_triangle_get_normal", libs);
  gidLink(cast(void**)&graphene_triangle_get_plane, "graphene_triangle_get_plane", libs);
  gidLink(cast(void**)&graphene_triangle_get_points, "graphene_triangle_get_points", libs);
  gidLink(cast(void**)&graphene_triangle_get_uv, "graphene_triangle_get_uv", libs);
  gidLink(cast(void**)&graphene_triangle_get_vertices, "graphene_triangle_get_vertices", libs);
  gidLink(cast(void**)&graphene_triangle_init_from_float, "graphene_triangle_init_from_float", libs);
  gidLink(cast(void**)&graphene_triangle_init_from_point3d, "graphene_triangle_init_from_point3d", libs);
  gidLink(cast(void**)&graphene_triangle_init_from_vec3, "graphene_triangle_init_from_vec3", libs);

  // Vec2
  gidLink(cast(void**)&graphene_vec2_get_type, "graphene_vec2_get_type", libs);
  gidLink(cast(void**)&graphene_vec2_alloc, "graphene_vec2_alloc", libs);
  gidLink(cast(void**)&graphene_vec2_add, "graphene_vec2_add", libs);
  gidLink(cast(void**)&graphene_vec2_divide, "graphene_vec2_divide", libs);
  gidLink(cast(void**)&graphene_vec2_dot, "graphene_vec2_dot", libs);
  gidLink(cast(void**)&graphene_vec2_equal, "graphene_vec2_equal", libs);
  gidLink(cast(void**)&graphene_vec2_free, "graphene_vec2_free", libs);
  gidLink(cast(void**)&graphene_vec2_get_x, "graphene_vec2_get_x", libs);
  gidLink(cast(void**)&graphene_vec2_get_y, "graphene_vec2_get_y", libs);
  gidLink(cast(void**)&graphene_vec2_init, "graphene_vec2_init", libs);
  gidLink(cast(void**)&graphene_vec2_init_from_float, "graphene_vec2_init_from_float", libs);
  gidLink(cast(void**)&graphene_vec2_init_from_vec2, "graphene_vec2_init_from_vec2", libs);
  gidLink(cast(void**)&graphene_vec2_interpolate, "graphene_vec2_interpolate", libs);
  gidLink(cast(void**)&graphene_vec2_length, "graphene_vec2_length", libs);
  gidLink(cast(void**)&graphene_vec2_max, "graphene_vec2_max", libs);
  gidLink(cast(void**)&graphene_vec2_min, "graphene_vec2_min", libs);
  gidLink(cast(void**)&graphene_vec2_multiply, "graphene_vec2_multiply", libs);
  gidLink(cast(void**)&graphene_vec2_near, "graphene_vec2_near", libs);
  gidLink(cast(void**)&graphene_vec2_negate, "graphene_vec2_negate", libs);
  gidLink(cast(void**)&graphene_vec2_normalize, "graphene_vec2_normalize", libs);
  gidLink(cast(void**)&graphene_vec2_scale, "graphene_vec2_scale", libs);
  gidLink(cast(void**)&graphene_vec2_subtract, "graphene_vec2_subtract", libs);
  gidLink(cast(void**)&graphene_vec2_to_float, "graphene_vec2_to_float", libs);
  gidLink(cast(void**)&graphene_vec2_one, "graphene_vec2_one", libs);
  gidLink(cast(void**)&graphene_vec2_x_axis, "graphene_vec2_x_axis", libs);
  gidLink(cast(void**)&graphene_vec2_y_axis, "graphene_vec2_y_axis", libs);
  gidLink(cast(void**)&graphene_vec2_zero, "graphene_vec2_zero", libs);

  // Vec3
  gidLink(cast(void**)&graphene_vec3_get_type, "graphene_vec3_get_type", libs);
  gidLink(cast(void**)&graphene_vec3_alloc, "graphene_vec3_alloc", libs);
  gidLink(cast(void**)&graphene_vec3_add, "graphene_vec3_add", libs);
  gidLink(cast(void**)&graphene_vec3_cross, "graphene_vec3_cross", libs);
  gidLink(cast(void**)&graphene_vec3_divide, "graphene_vec3_divide", libs);
  gidLink(cast(void**)&graphene_vec3_dot, "graphene_vec3_dot", libs);
  gidLink(cast(void**)&graphene_vec3_equal, "graphene_vec3_equal", libs);
  gidLink(cast(void**)&graphene_vec3_free, "graphene_vec3_free", libs);
  gidLink(cast(void**)&graphene_vec3_get_x, "graphene_vec3_get_x", libs);
  gidLink(cast(void**)&graphene_vec3_get_xy, "graphene_vec3_get_xy", libs);
  gidLink(cast(void**)&graphene_vec3_get_xy0, "graphene_vec3_get_xy0", libs);
  gidLink(cast(void**)&graphene_vec3_get_xyz0, "graphene_vec3_get_xyz0", libs);
  gidLink(cast(void**)&graphene_vec3_get_xyz1, "graphene_vec3_get_xyz1", libs);
  gidLink(cast(void**)&graphene_vec3_get_xyzw, "graphene_vec3_get_xyzw", libs);
  gidLink(cast(void**)&graphene_vec3_get_y, "graphene_vec3_get_y", libs);
  gidLink(cast(void**)&graphene_vec3_get_z, "graphene_vec3_get_z", libs);
  gidLink(cast(void**)&graphene_vec3_init, "graphene_vec3_init", libs);
  gidLink(cast(void**)&graphene_vec3_init_from_float, "graphene_vec3_init_from_float", libs);
  gidLink(cast(void**)&graphene_vec3_init_from_vec3, "graphene_vec3_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_vec3_interpolate, "graphene_vec3_interpolate", libs);
  gidLink(cast(void**)&graphene_vec3_length, "graphene_vec3_length", libs);
  gidLink(cast(void**)&graphene_vec3_max, "graphene_vec3_max", libs);
  gidLink(cast(void**)&graphene_vec3_min, "graphene_vec3_min", libs);
  gidLink(cast(void**)&graphene_vec3_multiply, "graphene_vec3_multiply", libs);
  gidLink(cast(void**)&graphene_vec3_near, "graphene_vec3_near", libs);
  gidLink(cast(void**)&graphene_vec3_negate, "graphene_vec3_negate", libs);
  gidLink(cast(void**)&graphene_vec3_normalize, "graphene_vec3_normalize", libs);
  gidLink(cast(void**)&graphene_vec3_scale, "graphene_vec3_scale", libs);
  gidLink(cast(void**)&graphene_vec3_subtract, "graphene_vec3_subtract", libs);
  gidLink(cast(void**)&graphene_vec3_to_float, "graphene_vec3_to_float", libs);
  gidLink(cast(void**)&graphene_vec3_one, "graphene_vec3_one", libs);
  gidLink(cast(void**)&graphene_vec3_x_axis, "graphene_vec3_x_axis", libs);
  gidLink(cast(void**)&graphene_vec3_y_axis, "graphene_vec3_y_axis", libs);
  gidLink(cast(void**)&graphene_vec3_z_axis, "graphene_vec3_z_axis", libs);
  gidLink(cast(void**)&graphene_vec3_zero, "graphene_vec3_zero", libs);

  // Vec4
  gidLink(cast(void**)&graphene_vec4_get_type, "graphene_vec4_get_type", libs);
  gidLink(cast(void**)&graphene_vec4_alloc, "graphene_vec4_alloc", libs);
  gidLink(cast(void**)&graphene_vec4_add, "graphene_vec4_add", libs);
  gidLink(cast(void**)&graphene_vec4_divide, "graphene_vec4_divide", libs);
  gidLink(cast(void**)&graphene_vec4_dot, "graphene_vec4_dot", libs);
  gidLink(cast(void**)&graphene_vec4_equal, "graphene_vec4_equal", libs);
  gidLink(cast(void**)&graphene_vec4_free, "graphene_vec4_free", libs);
  gidLink(cast(void**)&graphene_vec4_get_w, "graphene_vec4_get_w", libs);
  gidLink(cast(void**)&graphene_vec4_get_x, "graphene_vec4_get_x", libs);
  gidLink(cast(void**)&graphene_vec4_get_xy, "graphene_vec4_get_xy", libs);
  gidLink(cast(void**)&graphene_vec4_get_xyz, "graphene_vec4_get_xyz", libs);
  gidLink(cast(void**)&graphene_vec4_get_y, "graphene_vec4_get_y", libs);
  gidLink(cast(void**)&graphene_vec4_get_z, "graphene_vec4_get_z", libs);
  gidLink(cast(void**)&graphene_vec4_init, "graphene_vec4_init", libs);
  gidLink(cast(void**)&graphene_vec4_init_from_float, "graphene_vec4_init_from_float", libs);
  gidLink(cast(void**)&graphene_vec4_init_from_vec2, "graphene_vec4_init_from_vec2", libs);
  gidLink(cast(void**)&graphene_vec4_init_from_vec3, "graphene_vec4_init_from_vec3", libs);
  gidLink(cast(void**)&graphene_vec4_init_from_vec4, "graphene_vec4_init_from_vec4", libs);
  gidLink(cast(void**)&graphene_vec4_interpolate, "graphene_vec4_interpolate", libs);
  gidLink(cast(void**)&graphene_vec4_length, "graphene_vec4_length", libs);
  gidLink(cast(void**)&graphene_vec4_max, "graphene_vec4_max", libs);
  gidLink(cast(void**)&graphene_vec4_min, "graphene_vec4_min", libs);
  gidLink(cast(void**)&graphene_vec4_multiply, "graphene_vec4_multiply", libs);
  gidLink(cast(void**)&graphene_vec4_near, "graphene_vec4_near", libs);
  gidLink(cast(void**)&graphene_vec4_negate, "graphene_vec4_negate", libs);
  gidLink(cast(void**)&graphene_vec4_normalize, "graphene_vec4_normalize", libs);
  gidLink(cast(void**)&graphene_vec4_scale, "graphene_vec4_scale", libs);
  gidLink(cast(void**)&graphene_vec4_subtract, "graphene_vec4_subtract", libs);
  gidLink(cast(void**)&graphene_vec4_to_float, "graphene_vec4_to_float", libs);
  gidLink(cast(void**)&graphene_vec4_one, "graphene_vec4_one", libs);
  gidLink(cast(void**)&graphene_vec4_w_axis, "graphene_vec4_w_axis", libs);
  gidLink(cast(void**)&graphene_vec4_x_axis, "graphene_vec4_x_axis", libs);
  gidLink(cast(void**)&graphene_vec4_y_axis, "graphene_vec4_y_axis", libs);
  gidLink(cast(void**)&graphene_vec4_z_axis, "graphene_vec4_z_axis", libs);
  gidLink(cast(void**)&graphene_vec4_zero, "graphene_vec4_zero", libs);
}
