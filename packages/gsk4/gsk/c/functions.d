/// C functions for gsk4 library
module gsk.c.functions;

public import gid.basictypes;
import gid.loader;
import gsk.c.types;
public import gdk.c.types;
public import graphene.c.types;

version(Windows)
  private immutable LIBS = ["libgtk-4-1.dll;gtk-4-1.dll;gtk-4.dll"];
else version(OSX)
  private immutable LIBS = ["libgtk-4.1.dylib"];
else
  private immutable LIBS = ["libgtk-4.so.1"];

__gshared extern(C)
{
  // BlendNode
  GType function() c_gsk_blend_node_get_type; ///
  GskRenderNode* function(GskRenderNode* bottom, GskRenderNode* top, GskBlendMode blendMode) c_gsk_blend_node_new; ///
  GskBlendMode function(const(GskRenderNode)* node) c_gsk_blend_node_get_blend_mode; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_blend_node_get_bottom_child; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_blend_node_get_top_child; ///

  // BlurNode
  GType function() c_gsk_blur_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, float radius) c_gsk_blur_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_blur_node_get_child; ///
  float function(const(GskRenderNode)* node) c_gsk_blur_node_get_radius; ///

  // BorderNode
  GType function() c_gsk_border_node_get_type; ///
  GskRenderNode* function(const(GskRoundedRect)* outline, const(float)* borderWidth, const(GdkRGBA)* borderColor) c_gsk_border_node_new; ///
  const(GdkRGBA)* function(const(GskRenderNode)* node) c_gsk_border_node_get_colors; ///
  const(GskRoundedRect)* function(const(GskRenderNode)* node) c_gsk_border_node_get_outline; ///
  const(float)* function(const(GskRenderNode)* node) c_gsk_border_node_get_widths; ///

  // BroadwayRenderer
  GType function() c_gsk_broadway_renderer_get_type; ///
  GskRenderer* function() c_gsk_broadway_renderer_new; ///

  // CairoNode
  GType function() c_gsk_cairo_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds) c_gsk_cairo_node_new; ///
  cairo_t* function(GskRenderNode* node) c_gsk_cairo_node_get_draw_context; ///
  cairo_surface_t* function(GskRenderNode* node) c_gsk_cairo_node_get_surface; ///

  // CairoRenderer
  GType function() c_gsk_cairo_renderer_get_type; ///
  GskRenderer* function() c_gsk_cairo_renderer_new; ///

  // ClipNode
  GType function() c_gsk_clip_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, const(graphene_rect_t)* clip) c_gsk_clip_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_clip_node_get_child; ///
  const(graphene_rect_t)* function(const(GskRenderNode)* node) c_gsk_clip_node_get_clip; ///

  // ColorMatrixNode
  GType function() c_gsk_color_matrix_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, const(graphene_matrix_t)* colorMatrix, const(graphene_vec4_t)* colorOffset) c_gsk_color_matrix_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_color_matrix_node_get_child; ///
  const(graphene_matrix_t)* function(const(GskRenderNode)* node) c_gsk_color_matrix_node_get_color_matrix; ///
  const(graphene_vec4_t)* function(const(GskRenderNode)* node) c_gsk_color_matrix_node_get_color_offset; ///

  // ColorNode
  GType function() c_gsk_color_node_get_type; ///
  GskRenderNode* function(const(GdkRGBA)* rgba, const(graphene_rect_t)* bounds) c_gsk_color_node_new; ///
  const(GdkRGBA)* function(const(GskRenderNode)* node) c_gsk_color_node_get_color; ///

  // ConicGradientNode
  GType function() c_gsk_conic_gradient_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float rotation, const(GskColorStop)* colorStops, size_t nColorStops) c_gsk_conic_gradient_node_new; ///
  float function(const(GskRenderNode)* node) c_gsk_conic_gradient_node_get_angle; ///
  const(graphene_point_t)* function(const(GskRenderNode)* node) c_gsk_conic_gradient_node_get_center; ///
  const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) c_gsk_conic_gradient_node_get_color_stops; ///
  size_t function(const(GskRenderNode)* node) c_gsk_conic_gradient_node_get_n_color_stops; ///
  float function(const(GskRenderNode)* node) c_gsk_conic_gradient_node_get_rotation; ///

  // ContainerNode
  GType function() c_gsk_container_node_get_type; ///
  GskRenderNode* function(GskRenderNode** children, uint nChildren) c_gsk_container_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node, uint idx) c_gsk_container_node_get_child; ///
  uint function(const(GskRenderNode)* node) c_gsk_container_node_get_n_children; ///

  // CrossFadeNode
  GType function() c_gsk_cross_fade_node_get_type; ///
  GskRenderNode* function(GskRenderNode* start, GskRenderNode* end, float progress) c_gsk_cross_fade_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_cross_fade_node_get_end_child; ///
  float function(const(GskRenderNode)* node) c_gsk_cross_fade_node_get_progress; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_cross_fade_node_get_start_child; ///

  // DebugNode
  GType function() c_gsk_debug_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, char* message) c_gsk_debug_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_debug_node_get_child; ///
  const(char)* function(const(GskRenderNode)* node) c_gsk_debug_node_get_message; ///

  // FillNode
  GType function() c_gsk_fill_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, GskPath* path, GskFillRule fillRule) c_gsk_fill_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_fill_node_get_child; ///
  GskFillRule function(const(GskRenderNode)* node) c_gsk_fill_node_get_fill_rule; ///
  GskPath* function(const(GskRenderNode)* node) c_gsk_fill_node_get_path; ///

  // GLRenderer
  GType function() c_gsk_gl_renderer_get_type; ///
  GskRenderer* function() c_gsk_gl_renderer_new; ///

  // GLShader
  GType function() c_gsk_gl_shader_get_type; ///
  GskGLShader* function(GBytes* sourcecode) c_gsk_gl_shader_new_from_bytes; ///
  GskGLShader* function(const(char)* resourcePath) c_gsk_gl_shader_new_from_resource; ///
  gboolean function(GskGLShader* shader, GskRenderer* renderer, GError** _err) c_gsk_gl_shader_compile; ///
  int function(GskGLShader* shader, const(char)* name) c_gsk_gl_shader_find_uniform_by_name; ///
  GBytes* function(GskGLShader* shader,  ...) c_gsk_gl_shader_format_args; ///
  GBytes* function(GskGLShader* shader, void* uniforms) c_gsk_gl_shader_format_args_va; ///
  gboolean function(GskGLShader* shader, GBytes* args, int idx) c_gsk_gl_shader_get_arg_bool; ///
  float function(GskGLShader* shader, GBytes* args, int idx) c_gsk_gl_shader_get_arg_float; ///
  int function(GskGLShader* shader, GBytes* args, int idx) c_gsk_gl_shader_get_arg_int; ///
  uint function(GskGLShader* shader, GBytes* args, int idx) c_gsk_gl_shader_get_arg_uint; ///
  void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec2_t* outValue) c_gsk_gl_shader_get_arg_vec2; ///
  void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec3_t* outValue) c_gsk_gl_shader_get_arg_vec3; ///
  void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec4_t* outValue) c_gsk_gl_shader_get_arg_vec4; ///
  size_t function(GskGLShader* shader) c_gsk_gl_shader_get_args_size; ///
  int function(GskGLShader* shader) c_gsk_gl_shader_get_n_textures; ///
  int function(GskGLShader* shader) c_gsk_gl_shader_get_n_uniforms; ///
  const(char)* function(GskGLShader* shader) c_gsk_gl_shader_get_resource; ///
  GBytes* function(GskGLShader* shader) c_gsk_gl_shader_get_source; ///
  const(char)* function(GskGLShader* shader, int idx) c_gsk_gl_shader_get_uniform_name; ///
  int function(GskGLShader* shader, int idx) c_gsk_gl_shader_get_uniform_offset; ///
  GskGLUniformType function(GskGLShader* shader, int idx) c_gsk_gl_shader_get_uniform_type; ///

  // GLShaderNode
  GType function() c_gsk_gl_shader_node_get_type; ///
  GskRenderNode* function(GskGLShader* shader, const(graphene_rect_t)* bounds, GBytes* args, GskRenderNode** children, uint nChildren) c_gsk_gl_shader_node_new; ///
  GBytes* function(const(GskRenderNode)* node) c_gsk_gl_shader_node_get_args; ///
  GskRenderNode* function(const(GskRenderNode)* node, uint idx) c_gsk_gl_shader_node_get_child; ///
  uint function(const(GskRenderNode)* node) c_gsk_gl_shader_node_get_n_children; ///
  GskGLShader* function(const(GskRenderNode)* node) c_gsk_gl_shader_node_get_shader; ///

  // InsetShadowNode
  GType function() c_gsk_inset_shadow_node_get_type; ///
  GskRenderNode* function(const(GskRoundedRect)* outline, const(GdkRGBA)* color, float dx, float dy, float spread, float blurRadius) c_gsk_inset_shadow_node_new; ///
  float function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_blur_radius; ///
  const(GdkRGBA)* function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_color; ///
  float function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_dx; ///
  float function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_dy; ///
  const(GskRoundedRect)* function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_outline; ///
  float function(const(GskRenderNode)* node) c_gsk_inset_shadow_node_get_spread; ///

  // LinearGradientNode
  GType function() c_gsk_linear_gradient_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* start, const(graphene_point_t)* end, const(GskColorStop)* colorStops, size_t nColorStops) c_gsk_linear_gradient_node_new; ///
  const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) c_gsk_linear_gradient_node_get_color_stops; ///
  const(graphene_point_t)* function(const(GskRenderNode)* node) c_gsk_linear_gradient_node_get_end; ///
  size_t function(const(GskRenderNode)* node) c_gsk_linear_gradient_node_get_n_color_stops; ///
  const(graphene_point_t)* function(const(GskRenderNode)* node) c_gsk_linear_gradient_node_get_start; ///

  // MaskNode
  GType function() c_gsk_mask_node_get_type; ///
  GskRenderNode* function(GskRenderNode* source, GskRenderNode* mask, GskMaskMode maskMode) c_gsk_mask_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_mask_node_get_mask; ///
  GskMaskMode function(const(GskRenderNode)* node) c_gsk_mask_node_get_mask_mode; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_mask_node_get_source; ///

  // NglRenderer
  GType function() c_gsk_ngl_renderer_get_type; ///
  GskRenderer* function() c_gsk_ngl_renderer_new; ///

  // OpacityNode
  GType function() c_gsk_opacity_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, float opacity) c_gsk_opacity_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_opacity_node_get_child; ///
  float function(const(GskRenderNode)* node) c_gsk_opacity_node_get_opacity; ///

  // OutsetShadowNode
  GType function() c_gsk_outset_shadow_node_get_type; ///
  GskRenderNode* function(const(GskRoundedRect)* outline, const(GdkRGBA)* color, float dx, float dy, float spread, float blurRadius) c_gsk_outset_shadow_node_new; ///
  float function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_blur_radius; ///
  const(GdkRGBA)* function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_color; ///
  float function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_dx; ///
  float function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_dy; ///
  const(GskRoundedRect)* function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_outline; ///
  float function(const(GskRenderNode)* node) c_gsk_outset_shadow_node_get_spread; ///

  // Path
  GType function() c_gsk_path_get_type; ///
  gboolean function(GskPath* self, GskPathForeachFlags flags, GskPathForeachFunc func, void* userData) c_gsk_path_foreach; ///
  gboolean function(GskPath* self, graphene_rect_t* bounds) c_gsk_path_get_bounds; ///
  gboolean function(GskPath* self, const(graphene_point_t)* point, float threshold, GskPathPoint* result, float* distance) c_gsk_path_get_closest_point; ///
  gboolean function(GskPath* self, GskPathPoint* result) c_gsk_path_get_end_point; ///
  gboolean function(GskPath* self, GskPathPoint* result) c_gsk_path_get_start_point; ///
  gboolean function(GskPath* self, const(GskStroke)* stroke, graphene_rect_t* bounds) c_gsk_path_get_stroke_bounds; ///
  gboolean function(GskPath* self, const(graphene_point_t)* point, GskFillRule fillRule) c_gsk_path_in_fill; ///
  gboolean function(GskPath* self) c_gsk_path_is_closed; ///
  gboolean function(GskPath* self) c_gsk_path_is_empty; ///
  void function(GskPath* self, GString* string_) c_gsk_path_print; ///
  GskPath* function(GskPath* self) c_gsk_path_ref; ///
  void function(GskPath* self, cairo_t* cr) c_gsk_path_to_cairo; ///
  char* function(GskPath* self) c_gsk_path_to_string; ///
  void function(GskPath* self) c_gsk_path_unref; ///
  GskPath* function(const(char)* string_) c_gsk_path_parse; ///

  // PathBuilder
  GType function() c_gsk_path_builder_get_type; ///
  GskPathBuilder* function() c_gsk_path_builder_new; ///
  void function(GskPathBuilder* self, const(cairo_path_t)* path) c_gsk_path_builder_add_cairo_path; ///
  void function(GskPathBuilder* self, const(graphene_point_t)* center, float radius) c_gsk_path_builder_add_circle; ///
  void function(GskPathBuilder* self, PangoLayout* layout) c_gsk_path_builder_add_layout; ///
  void function(GskPathBuilder* self, GskPath* path) c_gsk_path_builder_add_path; ///
  void function(GskPathBuilder* self, const(graphene_rect_t)* rect) c_gsk_path_builder_add_rect; ///
  void function(GskPathBuilder* self, GskPath* path) c_gsk_path_builder_add_reverse_path; ///
  void function(GskPathBuilder* self, const(GskRoundedRect)* rect) c_gsk_path_builder_add_rounded_rect; ///
  void function(GskPathBuilder* self, GskPath* path, const(GskPathPoint)* start, const(GskPathPoint)* end) c_gsk_path_builder_add_segment; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) c_gsk_path_builder_arc_to; ///
  void function(GskPathBuilder* self) c_gsk_path_builder_close; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float weight) c_gsk_path_builder_conic_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float x3, float y3) c_gsk_path_builder_cubic_to; ///
  GskPath* function(GskPathBuilder* self) c_gsk_path_builder_free_to_path; ///
  const(graphene_point_t)* function(GskPathBuilder* self) c_gsk_path_builder_get_current_point; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float radius) c_gsk_path_builder_html_arc_to; ///
  void function(GskPathBuilder* self, float x, float y) c_gsk_path_builder_line_to; ///
  void function(GskPathBuilder* self, float x, float y) c_gsk_path_builder_move_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) c_gsk_path_builder_quad_to; ///
  GskPathBuilder* function(GskPathBuilder* self) c_gsk_path_builder_ref; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) c_gsk_path_builder_rel_arc_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float weight) c_gsk_path_builder_rel_conic_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float x3, float y3) c_gsk_path_builder_rel_cubic_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float radius) c_gsk_path_builder_rel_html_arc_to; ///
  void function(GskPathBuilder* self, float x, float y) c_gsk_path_builder_rel_line_to; ///
  void function(GskPathBuilder* self, float x, float y) c_gsk_path_builder_rel_move_to; ///
  void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) c_gsk_path_builder_rel_quad_to; ///
  void function(GskPathBuilder* self, float rx, float ry, float xAxisRotation, gboolean largeArc, gboolean positiveSweep, float x, float y) c_gsk_path_builder_rel_svg_arc_to; ///
  void function(GskPathBuilder* self, float rx, float ry, float xAxisRotation, gboolean largeArc, gboolean positiveSweep, float x, float y) c_gsk_path_builder_svg_arc_to; ///
  GskPath* function(GskPathBuilder* self) c_gsk_path_builder_to_path; ///
  void function(GskPathBuilder* self) c_gsk_path_builder_unref; ///

  // PathMeasure
  GType function() c_gsk_path_measure_get_type; ///
  GskPathMeasure* function(GskPath* path) c_gsk_path_measure_new; ///
  GskPathMeasure* function(GskPath* path, float tolerance) c_gsk_path_measure_new_with_tolerance; ///
  float function(GskPathMeasure* self) c_gsk_path_measure_get_length; ///
  GskPath* function(GskPathMeasure* self) c_gsk_path_measure_get_path; ///
  gboolean function(GskPathMeasure* self, float distance, GskPathPoint* result) c_gsk_path_measure_get_point; ///
  float function(GskPathMeasure* self) c_gsk_path_measure_get_tolerance; ///
  GskPathMeasure* function(GskPathMeasure* self) c_gsk_path_measure_ref; ///
  void function(GskPathMeasure* self) c_gsk_path_measure_unref; ///

  // PathPoint
  GType function() c_gsk_path_point_get_type; ///
  int function(const(GskPathPoint)* point1, const(GskPathPoint)* point2) c_gsk_path_point_compare; ///
  GskPathPoint* function(GskPathPoint* point) c_gsk_path_point_copy; ///
  gboolean function(const(GskPathPoint)* point1, const(GskPathPoint)* point2) c_gsk_path_point_equal; ///
  void function(GskPathPoint* point) c_gsk_path_point_free; ///
  float function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction, graphene_point_t* center) c_gsk_path_point_get_curvature; ///
  float function(const(GskPathPoint)* point, GskPathMeasure* measure) c_gsk_path_point_get_distance; ///
  void function(const(GskPathPoint)* point, GskPath* path, graphene_point_t* position) c_gsk_path_point_get_position; ///
  float function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction) c_gsk_path_point_get_rotation; ///
  void function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction, graphene_vec2_t* tangent) c_gsk_path_point_get_tangent; ///

  // RadialGradientNode
  GType function() c_gsk_radial_gradient_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float hradius, float vradius, float start, float end, const(GskColorStop)* colorStops, size_t nColorStops) c_gsk_radial_gradient_node_new; ///
  const(graphene_point_t)* function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_center; ///
  const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) c_gsk_radial_gradient_node_get_color_stops; ///
  float function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_end; ///
  float function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_hradius; ///
  size_t function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_n_color_stops; ///
  float function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_start; ///
  float function(const(GskRenderNode)* node) c_gsk_radial_gradient_node_get_vradius; ///

  // RenderNode
  GType function() c_gsk_render_node_get_type; ///
  GskRenderNode* function(GBytes* bytes, GskParseErrorFunc errorFunc, void* userData) c_gsk_render_node_deserialize; ///
  void function(GskRenderNode* node, cairo_t* cr) c_gsk_render_node_draw; ///
  void function(GskRenderNode* node, graphene_rect_t* bounds) c_gsk_render_node_get_bounds; ///
  GskRenderNodeType function(const(GskRenderNode)* node) c_gsk_render_node_get_node_type; ///
  GskRenderNode* function(GskRenderNode* node) c_gsk_render_node_ref; ///
  GBytes* function(GskRenderNode* node) c_gsk_render_node_serialize; ///
  void function(GskRenderNode* node) c_gsk_render_node_unref; ///
  gboolean function(GskRenderNode* node, const(char)* filename, GError** _err) c_gsk_render_node_write_to_file; ///

  // Renderer
  GType function() c_gsk_renderer_get_type; ///
  GskRenderer* function(GdkSurface* surface) c_gsk_renderer_new_for_surface; ///
  GdkSurface* function(GskRenderer* renderer) c_gsk_renderer_get_surface; ///
  gboolean function(GskRenderer* renderer) c_gsk_renderer_is_realized; ///
  gboolean function(GskRenderer* renderer, GdkSurface* surface, GError** _err) c_gsk_renderer_realize; ///
  gboolean function(GskRenderer* renderer, GdkDisplay* display, GError** _err) c_gsk_renderer_realize_for_display; ///
  void function(GskRenderer* renderer, GskRenderNode* root, const(cairo_region_t)* region) c_gsk_renderer_render; ///
  GdkTexture* function(GskRenderer* renderer, GskRenderNode* root, const(graphene_rect_t)* viewport) c_gsk_renderer_render_texture; ///
  void function(GskRenderer* renderer) c_gsk_renderer_unrealize; ///

  // RepeatNode
  GType function() c_gsk_repeat_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, GskRenderNode* child, const(graphene_rect_t)* childBounds) c_gsk_repeat_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_repeat_node_get_child; ///
  const(graphene_rect_t)* function(const(GskRenderNode)* node) c_gsk_repeat_node_get_child_bounds; ///

  // RepeatingLinearGradientNode
  GType function() c_gsk_repeating_linear_gradient_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* start, const(graphene_point_t)* end, const(GskColorStop)* colorStops, size_t nColorStops) c_gsk_repeating_linear_gradient_node_new; ///

  // RepeatingRadialGradientNode
  GType function() c_gsk_repeating_radial_gradient_node_get_type; ///
  GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float hradius, float vradius, float start, float end, const(GskColorStop)* colorStops, size_t nColorStops) c_gsk_repeating_radial_gradient_node_new; ///

  // RoundedClipNode
  GType function() c_gsk_rounded_clip_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, const(GskRoundedRect)* clip) c_gsk_rounded_clip_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_rounded_clip_node_get_child; ///
  const(GskRoundedRect)* function(const(GskRenderNode)* node) c_gsk_rounded_clip_node_get_clip; ///

  // RoundedRect
  gboolean function(const(GskRoundedRect)* self, const(graphene_point_t)* point) c_gsk_rounded_rect_contains_point; ///
  gboolean function(const(GskRoundedRect)* self, const(graphene_rect_t)* rect) c_gsk_rounded_rect_contains_rect; ///
  GskRoundedRect* function(GskRoundedRect* self, const(graphene_rect_t)* bounds, const(graphene_size_t)* topLeft, const(graphene_size_t)* topRight, const(graphene_size_t)* bottomRight, const(graphene_size_t)* bottomLeft) c_gsk_rounded_rect_init; ///
  GskRoundedRect* function(GskRoundedRect* self, const(GskRoundedRect)* src) c_gsk_rounded_rect_init_copy; ///
  GskRoundedRect* function(GskRoundedRect* self, const(graphene_rect_t)* bounds, float radius) c_gsk_rounded_rect_init_from_rect; ///
  gboolean function(const(GskRoundedRect)* self, const(graphene_rect_t)* rect) c_gsk_rounded_rect_intersects_rect; ///
  gboolean function(const(GskRoundedRect)* self) c_gsk_rounded_rect_is_rectilinear; ///
  GskRoundedRect* function(GskRoundedRect* self) c_gsk_rounded_rect_normalize; ///
  GskRoundedRect* function(GskRoundedRect* self, float dx, float dy) c_gsk_rounded_rect_offset; ///
  GskRoundedRect* function(GskRoundedRect* self, float top, float right, float bottom, float left) c_gsk_rounded_rect_shrink; ///

  // ShaderArgsBuilder
  GType function() c_gsk_shader_args_builder_get_type; ///
  GskShaderArgsBuilder* function(GskGLShader* shader, GBytes* initialValues) c_gsk_shader_args_builder_new; ///
  GBytes* function(GskShaderArgsBuilder* builder) c_gsk_shader_args_builder_free_to_args; ///
  GskShaderArgsBuilder* function(GskShaderArgsBuilder* builder) c_gsk_shader_args_builder_ref; ///
  void function(GskShaderArgsBuilder* builder, int idx, gboolean value) c_gsk_shader_args_builder_set_bool; ///
  void function(GskShaderArgsBuilder* builder, int idx, float value) c_gsk_shader_args_builder_set_float; ///
  void function(GskShaderArgsBuilder* builder, int idx, int value) c_gsk_shader_args_builder_set_int; ///
  void function(GskShaderArgsBuilder* builder, int idx, uint value) c_gsk_shader_args_builder_set_uint; ///
  void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec2_t)* value) c_gsk_shader_args_builder_set_vec2; ///
  void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec3_t)* value) c_gsk_shader_args_builder_set_vec3; ///
  void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec4_t)* value) c_gsk_shader_args_builder_set_vec4; ///
  GBytes* function(GskShaderArgsBuilder* builder) c_gsk_shader_args_builder_to_args; ///
  void function(GskShaderArgsBuilder* builder) c_gsk_shader_args_builder_unref; ///

  // ShadowNode
  GType function() c_gsk_shadow_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, const(GskShadow)* shadows, size_t nShadows) c_gsk_shadow_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_shadow_node_get_child; ///
  size_t function(const(GskRenderNode)* node) c_gsk_shadow_node_get_n_shadows; ///
  const(GskShadow)* function(const(GskRenderNode)* node, size_t i) c_gsk_shadow_node_get_shadow; ///

  // Stroke
  GType function() c_gsk_stroke_get_type; ///
  GskStroke* function(float lineWidth) c_gsk_stroke_new; ///
  GskStroke* function(const(GskStroke)* other) c_gsk_stroke_copy; ///
  void function(GskStroke* self) c_gsk_stroke_free; ///
  const(float)* function(const(GskStroke)* self, size_t* nDash) c_gsk_stroke_get_dash; ///
  float function(const(GskStroke)* self) c_gsk_stroke_get_dash_offset; ///
  GskLineCap function(const(GskStroke)* self) c_gsk_stroke_get_line_cap; ///
  GskLineJoin function(const(GskStroke)* self) c_gsk_stroke_get_line_join; ///
  float function(const(GskStroke)* self) c_gsk_stroke_get_line_width; ///
  float function(const(GskStroke)* self) c_gsk_stroke_get_miter_limit; ///
  void function(GskStroke* self, const(float)* dash, size_t nDash) c_gsk_stroke_set_dash; ///
  void function(GskStroke* self, float offset) c_gsk_stroke_set_dash_offset; ///
  void function(GskStroke* self, GskLineCap lineCap) c_gsk_stroke_set_line_cap; ///
  void function(GskStroke* self, GskLineJoin lineJoin) c_gsk_stroke_set_line_join; ///
  void function(GskStroke* self, float lineWidth) c_gsk_stroke_set_line_width; ///
  void function(GskStroke* self, float limit) c_gsk_stroke_set_miter_limit; ///
  void function(const(GskStroke)* self, cairo_t* cr) c_gsk_stroke_to_cairo; ///
  gboolean function(const(void)* stroke1, const(void)* stroke2) c_gsk_stroke_equal; ///

  // StrokeNode
  GType function() c_gsk_stroke_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, GskPath* path, const(GskStroke)* stroke) c_gsk_stroke_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_stroke_node_get_child; ///
  GskPath* function(const(GskRenderNode)* node) c_gsk_stroke_node_get_path; ///
  const(GskStroke)* function(const(GskRenderNode)* node) c_gsk_stroke_node_get_stroke; ///

  // SubsurfaceNode
  GType function() c_gsk_subsurface_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, void* subsurface) c_gsk_subsurface_node_new; ///
  void* function(const(GskRenderNode)* node) c_gsk_subsurface_node_get_subsurface; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_subsurface_node_get_child; ///

  // TextNode
  GType function() c_gsk_text_node_get_type; ///
  GskRenderNode* function(PangoFont* font, PangoGlyphString* glyphs, const(GdkRGBA)* color, const(graphene_point_t)* offset) c_gsk_text_node_new; ///
  const(GdkRGBA)* function(const(GskRenderNode)* node) c_gsk_text_node_get_color; ///
  PangoFont* function(const(GskRenderNode)* node) c_gsk_text_node_get_font; ///
  const(PangoGlyphInfo)* function(const(GskRenderNode)* node, uint* nGlyphs) c_gsk_text_node_get_glyphs; ///
  uint function(const(GskRenderNode)* node) c_gsk_text_node_get_num_glyphs; ///
  const(graphene_point_t)* function(const(GskRenderNode)* node) c_gsk_text_node_get_offset; ///
  gboolean function(const(GskRenderNode)* node) c_gsk_text_node_has_color_glyphs; ///

  // TextureNode
  GType function() c_gsk_texture_node_get_type; ///
  GskRenderNode* function(GdkTexture* texture, const(graphene_rect_t)* bounds) c_gsk_texture_node_new; ///
  GdkTexture* function(const(GskRenderNode)* node) c_gsk_texture_node_get_texture; ///

  // TextureScaleNode
  GType function() c_gsk_texture_scale_node_get_type; ///
  GskRenderNode* function(GdkTexture* texture, const(graphene_rect_t)* bounds, GskScalingFilter filter) c_gsk_texture_scale_node_new; ///
  GskScalingFilter function(const(GskRenderNode)* node) c_gsk_texture_scale_node_get_filter; ///
  GdkTexture* function(const(GskRenderNode)* node) c_gsk_texture_scale_node_get_texture; ///

  // Transform
  GType function() c_gsk_transform_get_type; ///
  GskTransform* function() c_gsk_transform_new; ///
  gboolean function(GskTransform* first, GskTransform* second) c_gsk_transform_equal; ///
  GskTransformCategory function(GskTransform* self) c_gsk_transform_get_category; ///
  GskTransform* function(GskTransform* self) c_gsk_transform_invert; ///
  GskTransform* function(GskTransform* next, const(graphene_matrix_t)* matrix) c_gsk_transform_matrix; ///
  GskTransform* function(GskTransform* next, float depth) c_gsk_transform_perspective; ///
  void function(GskTransform* self, GString* string_) c_gsk_transform_print; ///
  GskTransform* function(GskTransform* self) c_gsk_transform_ref; ///
  GskTransform* function(GskTransform* next, float angle) c_gsk_transform_rotate; ///
  GskTransform* function(GskTransform* next, float angle, const(graphene_vec3_t)* axis) c_gsk_transform_rotate_3d; ///
  GskTransform* function(GskTransform* next, float factorX, float factorY) c_gsk_transform_scale; ///
  GskTransform* function(GskTransform* next, float factorX, float factorY, float factorZ) c_gsk_transform_scale_3d; ///
  GskTransform* function(GskTransform* next, float skewX, float skewY) c_gsk_transform_skew; ///
  void function(GskTransform* self, float* outXx, float* outYx, float* outXy, float* outYy, float* outDx, float* outDy) c_gsk_transform_to_2d; ///
  void function(GskTransform* self, float* outSkewX, float* outSkewY, float* outScaleX, float* outScaleY, float* outAngle, float* outDx, float* outDy) c_gsk_transform_to_2d_components; ///
  void function(GskTransform* self, float* outScaleX, float* outScaleY, float* outDx, float* outDy) c_gsk_transform_to_affine; ///
  void function(GskTransform* self, graphene_matrix_t* outMatrix) c_gsk_transform_to_matrix; ///
  char* function(GskTransform* self) c_gsk_transform_to_string; ///
  void function(GskTransform* self, float* outDx, float* outDy) c_gsk_transform_to_translate; ///
  GskTransform* function(GskTransform* next, GskTransform* other) c_gsk_transform_transform; ///
  void function(GskTransform* self, const(graphene_rect_t)* rect, graphene_rect_t* outRect) c_gsk_transform_transform_bounds; ///
  void function(GskTransform* self, const(graphene_point_t)* point, graphene_point_t* outPoint) c_gsk_transform_transform_point; ///
  GskTransform* function(GskTransform* next, const(graphene_point_t)* point) c_gsk_transform_translate; ///
  GskTransform* function(GskTransform* next, const(graphene_point3d_t)* point) c_gsk_transform_translate_3d; ///
  void function(GskTransform* self) c_gsk_transform_unref; ///
  gboolean function(const(char)* string_, GskTransform** outTransform) c_gsk_transform_parse; ///

  // TransformNode
  GType function() c_gsk_transform_node_get_type; ///
  GskRenderNode* function(GskRenderNode* child, GskTransform* transform) c_gsk_transform_node_new; ///
  GskRenderNode* function(const(GskRenderNode)* node) c_gsk_transform_node_get_child; ///
  GskTransform* function(const(GskRenderNode)* node) c_gsk_transform_node_get_transform; ///

  // VulkanRenderer
  GType function() c_gsk_vulkan_renderer_get_type; ///
  GskRenderer* function() c_gsk_vulkan_renderer_new; ///

  // global
  GskRenderNode* function(const(GValue)* value) c_gsk_value_dup_render_node; ///
  GskRenderNode* function(const(GValue)* value) c_gsk_value_get_render_node; ///
  void function(GValue* value, GskRenderNode* node) c_gsk_value_set_render_node; ///
  void function(GValue* value, GskRenderNode* node) c_gsk_value_take_render_node; ///

  // SerializationError
  GQuark function() c_gsk_serialization_error_quark; ///
}

// BlendNode

/** */
alias gsk_blend_node_get_type = c_gsk_blend_node_get_type;

/** */
alias gsk_blend_node_new = c_gsk_blend_node_new;

/** */
alias gsk_blend_node_get_blend_mode = c_gsk_blend_node_get_blend_mode;

/** */
alias gsk_blend_node_get_bottom_child = c_gsk_blend_node_get_bottom_child;

/** */
alias gsk_blend_node_get_top_child = c_gsk_blend_node_get_top_child;

// BlurNode

/** */
alias gsk_blur_node_get_type = c_gsk_blur_node_get_type;

/** */
alias gsk_blur_node_new = c_gsk_blur_node_new;

/** */
alias gsk_blur_node_get_child = c_gsk_blur_node_get_child;

/** */
alias gsk_blur_node_get_radius = c_gsk_blur_node_get_radius;

// BorderNode

/** */
alias gsk_border_node_get_type = c_gsk_border_node_get_type;

/** */
alias gsk_border_node_new = c_gsk_border_node_new;

/** */
alias gsk_border_node_get_colors = c_gsk_border_node_get_colors;

/** */
alias gsk_border_node_get_outline = c_gsk_border_node_get_outline;

/** */
alias gsk_border_node_get_widths = c_gsk_border_node_get_widths;

// BroadwayRenderer

/** */
alias gsk_broadway_renderer_get_type = c_gsk_broadway_renderer_get_type;

/** */
alias gsk_broadway_renderer_new = c_gsk_broadway_renderer_new;

// CairoNode

/** */
alias gsk_cairo_node_get_type = c_gsk_cairo_node_get_type;

/** */
alias gsk_cairo_node_new = c_gsk_cairo_node_new;

/** */
alias gsk_cairo_node_get_draw_context = c_gsk_cairo_node_get_draw_context;

/** */
alias gsk_cairo_node_get_surface = c_gsk_cairo_node_get_surface;

// CairoRenderer

/** */
alias gsk_cairo_renderer_get_type = c_gsk_cairo_renderer_get_type;

/** */
alias gsk_cairo_renderer_new = c_gsk_cairo_renderer_new;

// ClipNode

/** */
alias gsk_clip_node_get_type = c_gsk_clip_node_get_type;

/** */
alias gsk_clip_node_new = c_gsk_clip_node_new;

/** */
alias gsk_clip_node_get_child = c_gsk_clip_node_get_child;

/** */
alias gsk_clip_node_get_clip = c_gsk_clip_node_get_clip;

// ColorMatrixNode

/** */
alias gsk_color_matrix_node_get_type = c_gsk_color_matrix_node_get_type;

/** */
alias gsk_color_matrix_node_new = c_gsk_color_matrix_node_new;

/** */
alias gsk_color_matrix_node_get_child = c_gsk_color_matrix_node_get_child;

/** */
alias gsk_color_matrix_node_get_color_matrix = c_gsk_color_matrix_node_get_color_matrix;

/** */
alias gsk_color_matrix_node_get_color_offset = c_gsk_color_matrix_node_get_color_offset;

// ColorNode

/** */
alias gsk_color_node_get_type = c_gsk_color_node_get_type;

/** */
alias gsk_color_node_new = c_gsk_color_node_new;

/** */
alias gsk_color_node_get_color = c_gsk_color_node_get_color;

// ConicGradientNode

/** */
alias gsk_conic_gradient_node_get_type = c_gsk_conic_gradient_node_get_type;

/** */
alias gsk_conic_gradient_node_new = c_gsk_conic_gradient_node_new;

/** */
alias gsk_conic_gradient_node_get_angle = c_gsk_conic_gradient_node_get_angle;

/** */
alias gsk_conic_gradient_node_get_center = c_gsk_conic_gradient_node_get_center;

/** */
alias gsk_conic_gradient_node_get_color_stops = c_gsk_conic_gradient_node_get_color_stops;

/** */
alias gsk_conic_gradient_node_get_n_color_stops = c_gsk_conic_gradient_node_get_n_color_stops;

/** */
alias gsk_conic_gradient_node_get_rotation = c_gsk_conic_gradient_node_get_rotation;

// ContainerNode

/** */
alias gsk_container_node_get_type = c_gsk_container_node_get_type;

/** */
alias gsk_container_node_new = c_gsk_container_node_new;

/** */
alias gsk_container_node_get_child = c_gsk_container_node_get_child;

/** */
alias gsk_container_node_get_n_children = c_gsk_container_node_get_n_children;

// CrossFadeNode

/** */
alias gsk_cross_fade_node_get_type = c_gsk_cross_fade_node_get_type;

/** */
alias gsk_cross_fade_node_new = c_gsk_cross_fade_node_new;

/** */
alias gsk_cross_fade_node_get_end_child = c_gsk_cross_fade_node_get_end_child;

/** */
alias gsk_cross_fade_node_get_progress = c_gsk_cross_fade_node_get_progress;

/** */
alias gsk_cross_fade_node_get_start_child = c_gsk_cross_fade_node_get_start_child;

// DebugNode

/** */
alias gsk_debug_node_get_type = c_gsk_debug_node_get_type;

/** */
alias gsk_debug_node_new = c_gsk_debug_node_new;

/** */
alias gsk_debug_node_get_child = c_gsk_debug_node_get_child;

/** */
alias gsk_debug_node_get_message = c_gsk_debug_node_get_message;

// FillNode

/** */
alias gsk_fill_node_get_type = c_gsk_fill_node_get_type;

/** */
alias gsk_fill_node_new = c_gsk_fill_node_new;

/** */
alias gsk_fill_node_get_child = c_gsk_fill_node_get_child;

/** */
alias gsk_fill_node_get_fill_rule = c_gsk_fill_node_get_fill_rule;

/** */
alias gsk_fill_node_get_path = c_gsk_fill_node_get_path;

// GLRenderer

/** */
alias gsk_gl_renderer_get_type = c_gsk_gl_renderer_get_type;

/** */
alias gsk_gl_renderer_new = c_gsk_gl_renderer_new;

// GLShader

/** */
alias gsk_gl_shader_get_type = c_gsk_gl_shader_get_type;

/** */
alias gsk_gl_shader_new_from_bytes = c_gsk_gl_shader_new_from_bytes;

/** */
alias gsk_gl_shader_new_from_resource = c_gsk_gl_shader_new_from_resource;

/** */
alias gsk_gl_shader_compile = c_gsk_gl_shader_compile;

/** */
alias gsk_gl_shader_find_uniform_by_name = c_gsk_gl_shader_find_uniform_by_name;

/** */
alias gsk_gl_shader_format_args = c_gsk_gl_shader_format_args;

/** */
alias gsk_gl_shader_format_args_va = c_gsk_gl_shader_format_args_va;

/** */
alias gsk_gl_shader_get_arg_bool = c_gsk_gl_shader_get_arg_bool;

/** */
alias gsk_gl_shader_get_arg_float = c_gsk_gl_shader_get_arg_float;

/** */
alias gsk_gl_shader_get_arg_int = c_gsk_gl_shader_get_arg_int;

/** */
alias gsk_gl_shader_get_arg_uint = c_gsk_gl_shader_get_arg_uint;

/** */
alias gsk_gl_shader_get_arg_vec2 = c_gsk_gl_shader_get_arg_vec2;

/** */
alias gsk_gl_shader_get_arg_vec3 = c_gsk_gl_shader_get_arg_vec3;

/** */
alias gsk_gl_shader_get_arg_vec4 = c_gsk_gl_shader_get_arg_vec4;

/** */
alias gsk_gl_shader_get_args_size = c_gsk_gl_shader_get_args_size;

/** */
alias gsk_gl_shader_get_n_textures = c_gsk_gl_shader_get_n_textures;

/** */
alias gsk_gl_shader_get_n_uniforms = c_gsk_gl_shader_get_n_uniforms;

/** */
alias gsk_gl_shader_get_resource = c_gsk_gl_shader_get_resource;

/** */
alias gsk_gl_shader_get_source = c_gsk_gl_shader_get_source;

/** */
alias gsk_gl_shader_get_uniform_name = c_gsk_gl_shader_get_uniform_name;

/** */
alias gsk_gl_shader_get_uniform_offset = c_gsk_gl_shader_get_uniform_offset;

/** */
alias gsk_gl_shader_get_uniform_type = c_gsk_gl_shader_get_uniform_type;

// GLShaderNode

/** */
alias gsk_gl_shader_node_get_type = c_gsk_gl_shader_node_get_type;

/** */
alias gsk_gl_shader_node_new = c_gsk_gl_shader_node_new;

/** */
alias gsk_gl_shader_node_get_args = c_gsk_gl_shader_node_get_args;

/** */
alias gsk_gl_shader_node_get_child = c_gsk_gl_shader_node_get_child;

/** */
alias gsk_gl_shader_node_get_n_children = c_gsk_gl_shader_node_get_n_children;

/** */
alias gsk_gl_shader_node_get_shader = c_gsk_gl_shader_node_get_shader;

// InsetShadowNode

/** */
alias gsk_inset_shadow_node_get_type = c_gsk_inset_shadow_node_get_type;

/** */
alias gsk_inset_shadow_node_new = c_gsk_inset_shadow_node_new;

/** */
alias gsk_inset_shadow_node_get_blur_radius = c_gsk_inset_shadow_node_get_blur_radius;

/** */
alias gsk_inset_shadow_node_get_color = c_gsk_inset_shadow_node_get_color;

/** */
alias gsk_inset_shadow_node_get_dx = c_gsk_inset_shadow_node_get_dx;

/** */
alias gsk_inset_shadow_node_get_dy = c_gsk_inset_shadow_node_get_dy;

/** */
alias gsk_inset_shadow_node_get_outline = c_gsk_inset_shadow_node_get_outline;

/** */
alias gsk_inset_shadow_node_get_spread = c_gsk_inset_shadow_node_get_spread;

// LinearGradientNode

/** */
alias gsk_linear_gradient_node_get_type = c_gsk_linear_gradient_node_get_type;

/** */
alias gsk_linear_gradient_node_new = c_gsk_linear_gradient_node_new;

/** */
alias gsk_linear_gradient_node_get_color_stops = c_gsk_linear_gradient_node_get_color_stops;

/** */
alias gsk_linear_gradient_node_get_end = c_gsk_linear_gradient_node_get_end;

/** */
alias gsk_linear_gradient_node_get_n_color_stops = c_gsk_linear_gradient_node_get_n_color_stops;

/** */
alias gsk_linear_gradient_node_get_start = c_gsk_linear_gradient_node_get_start;

// MaskNode

/** */
alias gsk_mask_node_get_type = c_gsk_mask_node_get_type;

/** */
alias gsk_mask_node_new = c_gsk_mask_node_new;

/** */
alias gsk_mask_node_get_mask = c_gsk_mask_node_get_mask;

/** */
alias gsk_mask_node_get_mask_mode = c_gsk_mask_node_get_mask_mode;

/** */
alias gsk_mask_node_get_source = c_gsk_mask_node_get_source;

// NglRenderer

/** */
alias gsk_ngl_renderer_get_type = c_gsk_ngl_renderer_get_type;

/** */
alias gsk_ngl_renderer_new = c_gsk_ngl_renderer_new;

// OpacityNode

/** */
alias gsk_opacity_node_get_type = c_gsk_opacity_node_get_type;

/** */
alias gsk_opacity_node_new = c_gsk_opacity_node_new;

/** */
alias gsk_opacity_node_get_child = c_gsk_opacity_node_get_child;

/** */
alias gsk_opacity_node_get_opacity = c_gsk_opacity_node_get_opacity;

// OutsetShadowNode

/** */
alias gsk_outset_shadow_node_get_type = c_gsk_outset_shadow_node_get_type;

/** */
alias gsk_outset_shadow_node_new = c_gsk_outset_shadow_node_new;

/** */
alias gsk_outset_shadow_node_get_blur_radius = c_gsk_outset_shadow_node_get_blur_radius;

/** */
alias gsk_outset_shadow_node_get_color = c_gsk_outset_shadow_node_get_color;

/** */
alias gsk_outset_shadow_node_get_dx = c_gsk_outset_shadow_node_get_dx;

/** */
alias gsk_outset_shadow_node_get_dy = c_gsk_outset_shadow_node_get_dy;

/** */
alias gsk_outset_shadow_node_get_outline = c_gsk_outset_shadow_node_get_outline;

/** */
alias gsk_outset_shadow_node_get_spread = c_gsk_outset_shadow_node_get_spread;

// Path

/** */
alias gsk_path_get_type = c_gsk_path_get_type;

/** */
alias gsk_path_foreach = c_gsk_path_foreach;

/** */
alias gsk_path_get_bounds = c_gsk_path_get_bounds;

/** */
alias gsk_path_get_closest_point = c_gsk_path_get_closest_point;

/** */
alias gsk_path_get_end_point = c_gsk_path_get_end_point;

/** */
alias gsk_path_get_start_point = c_gsk_path_get_start_point;

/** */
alias gsk_path_get_stroke_bounds = c_gsk_path_get_stroke_bounds;

/** */
alias gsk_path_in_fill = c_gsk_path_in_fill;

/** */
alias gsk_path_is_closed = c_gsk_path_is_closed;

/** */
alias gsk_path_is_empty = c_gsk_path_is_empty;

/** */
alias gsk_path_print = c_gsk_path_print;

/** */
alias gsk_path_ref = c_gsk_path_ref;

/** */
alias gsk_path_to_cairo = c_gsk_path_to_cairo;

/** */
alias gsk_path_to_string = c_gsk_path_to_string;

/** */
alias gsk_path_unref = c_gsk_path_unref;

/** */
alias gsk_path_parse = c_gsk_path_parse;

// PathBuilder

/** */
alias gsk_path_builder_get_type = c_gsk_path_builder_get_type;

/** */
alias gsk_path_builder_new = c_gsk_path_builder_new;

/** */
alias gsk_path_builder_add_cairo_path = c_gsk_path_builder_add_cairo_path;

/** */
alias gsk_path_builder_add_circle = c_gsk_path_builder_add_circle;

/** */
alias gsk_path_builder_add_layout = c_gsk_path_builder_add_layout;

/** */
alias gsk_path_builder_add_path = c_gsk_path_builder_add_path;

/** */
alias gsk_path_builder_add_rect = c_gsk_path_builder_add_rect;

/** */
alias gsk_path_builder_add_reverse_path = c_gsk_path_builder_add_reverse_path;

/** */
alias gsk_path_builder_add_rounded_rect = c_gsk_path_builder_add_rounded_rect;

/** */
alias gsk_path_builder_add_segment = c_gsk_path_builder_add_segment;

/** */
alias gsk_path_builder_arc_to = c_gsk_path_builder_arc_to;

/** */
alias gsk_path_builder_close = c_gsk_path_builder_close;

/** */
alias gsk_path_builder_conic_to = c_gsk_path_builder_conic_to;

/** */
alias gsk_path_builder_cubic_to = c_gsk_path_builder_cubic_to;

/** */
alias gsk_path_builder_free_to_path = c_gsk_path_builder_free_to_path;

/** */
alias gsk_path_builder_get_current_point = c_gsk_path_builder_get_current_point;

/** */
alias gsk_path_builder_html_arc_to = c_gsk_path_builder_html_arc_to;

/** */
alias gsk_path_builder_line_to = c_gsk_path_builder_line_to;

/** */
alias gsk_path_builder_move_to = c_gsk_path_builder_move_to;

/** */
alias gsk_path_builder_quad_to = c_gsk_path_builder_quad_to;

/** */
alias gsk_path_builder_ref = c_gsk_path_builder_ref;

/** */
alias gsk_path_builder_rel_arc_to = c_gsk_path_builder_rel_arc_to;

/** */
alias gsk_path_builder_rel_conic_to = c_gsk_path_builder_rel_conic_to;

/** */
alias gsk_path_builder_rel_cubic_to = c_gsk_path_builder_rel_cubic_to;

/** */
alias gsk_path_builder_rel_html_arc_to = c_gsk_path_builder_rel_html_arc_to;

/** */
alias gsk_path_builder_rel_line_to = c_gsk_path_builder_rel_line_to;

/** */
alias gsk_path_builder_rel_move_to = c_gsk_path_builder_rel_move_to;

/** */
alias gsk_path_builder_rel_quad_to = c_gsk_path_builder_rel_quad_to;

/** */
alias gsk_path_builder_rel_svg_arc_to = c_gsk_path_builder_rel_svg_arc_to;

/** */
alias gsk_path_builder_svg_arc_to = c_gsk_path_builder_svg_arc_to;

/** */
alias gsk_path_builder_to_path = c_gsk_path_builder_to_path;

/** */
alias gsk_path_builder_unref = c_gsk_path_builder_unref;

// PathMeasure

/** */
alias gsk_path_measure_get_type = c_gsk_path_measure_get_type;

/** */
alias gsk_path_measure_new = c_gsk_path_measure_new;

/** */
alias gsk_path_measure_new_with_tolerance = c_gsk_path_measure_new_with_tolerance;

/** */
alias gsk_path_measure_get_length = c_gsk_path_measure_get_length;

/** */
alias gsk_path_measure_get_path = c_gsk_path_measure_get_path;

/** */
alias gsk_path_measure_get_point = c_gsk_path_measure_get_point;

/** */
alias gsk_path_measure_get_tolerance = c_gsk_path_measure_get_tolerance;

/** */
alias gsk_path_measure_ref = c_gsk_path_measure_ref;

/** */
alias gsk_path_measure_unref = c_gsk_path_measure_unref;

// PathPoint

/** */
alias gsk_path_point_get_type = c_gsk_path_point_get_type;

/** */
alias gsk_path_point_compare = c_gsk_path_point_compare;

/** */
alias gsk_path_point_copy = c_gsk_path_point_copy;

/** */
alias gsk_path_point_equal = c_gsk_path_point_equal;

/** */
alias gsk_path_point_free = c_gsk_path_point_free;

/** */
alias gsk_path_point_get_curvature = c_gsk_path_point_get_curvature;

/** */
alias gsk_path_point_get_distance = c_gsk_path_point_get_distance;

/** */
alias gsk_path_point_get_position = c_gsk_path_point_get_position;

/** */
alias gsk_path_point_get_rotation = c_gsk_path_point_get_rotation;

/** */
alias gsk_path_point_get_tangent = c_gsk_path_point_get_tangent;

// RadialGradientNode

/** */
alias gsk_radial_gradient_node_get_type = c_gsk_radial_gradient_node_get_type;

/** */
alias gsk_radial_gradient_node_new = c_gsk_radial_gradient_node_new;

/** */
alias gsk_radial_gradient_node_get_center = c_gsk_radial_gradient_node_get_center;

/** */
alias gsk_radial_gradient_node_get_color_stops = c_gsk_radial_gradient_node_get_color_stops;

/** */
alias gsk_radial_gradient_node_get_end = c_gsk_radial_gradient_node_get_end;

/** */
alias gsk_radial_gradient_node_get_hradius = c_gsk_radial_gradient_node_get_hradius;

/** */
alias gsk_radial_gradient_node_get_n_color_stops = c_gsk_radial_gradient_node_get_n_color_stops;

/** */
alias gsk_radial_gradient_node_get_start = c_gsk_radial_gradient_node_get_start;

/** */
alias gsk_radial_gradient_node_get_vradius = c_gsk_radial_gradient_node_get_vradius;

// RenderNode

/** */
alias gsk_render_node_get_type = c_gsk_render_node_get_type;

/** */
alias gsk_render_node_deserialize = c_gsk_render_node_deserialize;

/** */
alias gsk_render_node_draw = c_gsk_render_node_draw;

/** */
alias gsk_render_node_get_bounds = c_gsk_render_node_get_bounds;

/** */
alias gsk_render_node_get_node_type = c_gsk_render_node_get_node_type;

/** */
alias gsk_render_node_ref = c_gsk_render_node_ref;

/** */
alias gsk_render_node_serialize = c_gsk_render_node_serialize;

/** */
alias gsk_render_node_unref = c_gsk_render_node_unref;

/** */
alias gsk_render_node_write_to_file = c_gsk_render_node_write_to_file;

// Renderer

/** */
alias gsk_renderer_get_type = c_gsk_renderer_get_type;

/** */
alias gsk_renderer_new_for_surface = c_gsk_renderer_new_for_surface;

/** */
alias gsk_renderer_get_surface = c_gsk_renderer_get_surface;

/** */
alias gsk_renderer_is_realized = c_gsk_renderer_is_realized;

/** */
alias gsk_renderer_realize = c_gsk_renderer_realize;

/** */
alias gsk_renderer_realize_for_display = c_gsk_renderer_realize_for_display;

/** */
alias gsk_renderer_render = c_gsk_renderer_render;

/** */
alias gsk_renderer_render_texture = c_gsk_renderer_render_texture;

/** */
alias gsk_renderer_unrealize = c_gsk_renderer_unrealize;

// RepeatNode

/** */
alias gsk_repeat_node_get_type = c_gsk_repeat_node_get_type;

/** */
alias gsk_repeat_node_new = c_gsk_repeat_node_new;

/** */
alias gsk_repeat_node_get_child = c_gsk_repeat_node_get_child;

/** */
alias gsk_repeat_node_get_child_bounds = c_gsk_repeat_node_get_child_bounds;

// RepeatingLinearGradientNode

/** */
alias gsk_repeating_linear_gradient_node_get_type = c_gsk_repeating_linear_gradient_node_get_type;

/** */
alias gsk_repeating_linear_gradient_node_new = c_gsk_repeating_linear_gradient_node_new;

// RepeatingRadialGradientNode

/** */
alias gsk_repeating_radial_gradient_node_get_type = c_gsk_repeating_radial_gradient_node_get_type;

/** */
alias gsk_repeating_radial_gradient_node_new = c_gsk_repeating_radial_gradient_node_new;

// RoundedClipNode

/** */
alias gsk_rounded_clip_node_get_type = c_gsk_rounded_clip_node_get_type;

/** */
alias gsk_rounded_clip_node_new = c_gsk_rounded_clip_node_new;

/** */
alias gsk_rounded_clip_node_get_child = c_gsk_rounded_clip_node_get_child;

/** */
alias gsk_rounded_clip_node_get_clip = c_gsk_rounded_clip_node_get_clip;

// RoundedRect

/** */
alias gsk_rounded_rect_contains_point = c_gsk_rounded_rect_contains_point;

/** */
alias gsk_rounded_rect_contains_rect = c_gsk_rounded_rect_contains_rect;

/** */
alias gsk_rounded_rect_init = c_gsk_rounded_rect_init;

/** */
alias gsk_rounded_rect_init_copy = c_gsk_rounded_rect_init_copy;

/** */
alias gsk_rounded_rect_init_from_rect = c_gsk_rounded_rect_init_from_rect;

/** */
alias gsk_rounded_rect_intersects_rect = c_gsk_rounded_rect_intersects_rect;

/** */
alias gsk_rounded_rect_is_rectilinear = c_gsk_rounded_rect_is_rectilinear;

/** */
alias gsk_rounded_rect_normalize = c_gsk_rounded_rect_normalize;

/** */
alias gsk_rounded_rect_offset = c_gsk_rounded_rect_offset;

/** */
alias gsk_rounded_rect_shrink = c_gsk_rounded_rect_shrink;

// ShaderArgsBuilder

/** */
alias gsk_shader_args_builder_get_type = c_gsk_shader_args_builder_get_type;

/** */
alias gsk_shader_args_builder_new = c_gsk_shader_args_builder_new;

/** */
alias gsk_shader_args_builder_free_to_args = c_gsk_shader_args_builder_free_to_args;

/** */
alias gsk_shader_args_builder_ref = c_gsk_shader_args_builder_ref;

/** */
alias gsk_shader_args_builder_set_bool = c_gsk_shader_args_builder_set_bool;

/** */
alias gsk_shader_args_builder_set_float = c_gsk_shader_args_builder_set_float;

/** */
alias gsk_shader_args_builder_set_int = c_gsk_shader_args_builder_set_int;

/** */
alias gsk_shader_args_builder_set_uint = c_gsk_shader_args_builder_set_uint;

/** */
alias gsk_shader_args_builder_set_vec2 = c_gsk_shader_args_builder_set_vec2;

/** */
alias gsk_shader_args_builder_set_vec3 = c_gsk_shader_args_builder_set_vec3;

/** */
alias gsk_shader_args_builder_set_vec4 = c_gsk_shader_args_builder_set_vec4;

/** */
alias gsk_shader_args_builder_to_args = c_gsk_shader_args_builder_to_args;

/** */
alias gsk_shader_args_builder_unref = c_gsk_shader_args_builder_unref;

// ShadowNode

/** */
alias gsk_shadow_node_get_type = c_gsk_shadow_node_get_type;

/** */
alias gsk_shadow_node_new = c_gsk_shadow_node_new;

/** */
alias gsk_shadow_node_get_child = c_gsk_shadow_node_get_child;

/** */
alias gsk_shadow_node_get_n_shadows = c_gsk_shadow_node_get_n_shadows;

/** */
alias gsk_shadow_node_get_shadow = c_gsk_shadow_node_get_shadow;

// Stroke

/** */
alias gsk_stroke_get_type = c_gsk_stroke_get_type;

/** */
alias gsk_stroke_new = c_gsk_stroke_new;

/** */
alias gsk_stroke_copy = c_gsk_stroke_copy;

/** */
alias gsk_stroke_free = c_gsk_stroke_free;

/** */
alias gsk_stroke_get_dash = c_gsk_stroke_get_dash;

/** */
alias gsk_stroke_get_dash_offset = c_gsk_stroke_get_dash_offset;

/** */
alias gsk_stroke_get_line_cap = c_gsk_stroke_get_line_cap;

/** */
alias gsk_stroke_get_line_join = c_gsk_stroke_get_line_join;

/** */
alias gsk_stroke_get_line_width = c_gsk_stroke_get_line_width;

/** */
alias gsk_stroke_get_miter_limit = c_gsk_stroke_get_miter_limit;

/** */
alias gsk_stroke_set_dash = c_gsk_stroke_set_dash;

/** */
alias gsk_stroke_set_dash_offset = c_gsk_stroke_set_dash_offset;

/** */
alias gsk_stroke_set_line_cap = c_gsk_stroke_set_line_cap;

/** */
alias gsk_stroke_set_line_join = c_gsk_stroke_set_line_join;

/** */
alias gsk_stroke_set_line_width = c_gsk_stroke_set_line_width;

/** */
alias gsk_stroke_set_miter_limit = c_gsk_stroke_set_miter_limit;

/** */
alias gsk_stroke_to_cairo = c_gsk_stroke_to_cairo;

/** */
alias gsk_stroke_equal = c_gsk_stroke_equal;

// StrokeNode

/** */
alias gsk_stroke_node_get_type = c_gsk_stroke_node_get_type;

/** */
alias gsk_stroke_node_new = c_gsk_stroke_node_new;

/** */
alias gsk_stroke_node_get_child = c_gsk_stroke_node_get_child;

/** */
alias gsk_stroke_node_get_path = c_gsk_stroke_node_get_path;

/** */
alias gsk_stroke_node_get_stroke = c_gsk_stroke_node_get_stroke;

// SubsurfaceNode

/** */
alias gsk_subsurface_node_get_type = c_gsk_subsurface_node_get_type;

/** */
alias gsk_subsurface_node_new = c_gsk_subsurface_node_new;

/** */
alias gsk_subsurface_node_get_subsurface = c_gsk_subsurface_node_get_subsurface;

/** */
alias gsk_subsurface_node_get_child = c_gsk_subsurface_node_get_child;

// TextNode

/** */
alias gsk_text_node_get_type = c_gsk_text_node_get_type;

/** */
alias gsk_text_node_new = c_gsk_text_node_new;

/** */
alias gsk_text_node_get_color = c_gsk_text_node_get_color;

/** */
alias gsk_text_node_get_font = c_gsk_text_node_get_font;

/** */
alias gsk_text_node_get_glyphs = c_gsk_text_node_get_glyphs;

/** */
alias gsk_text_node_get_num_glyphs = c_gsk_text_node_get_num_glyphs;

/** */
alias gsk_text_node_get_offset = c_gsk_text_node_get_offset;

/** */
alias gsk_text_node_has_color_glyphs = c_gsk_text_node_has_color_glyphs;

// TextureNode

/** */
alias gsk_texture_node_get_type = c_gsk_texture_node_get_type;

/** */
alias gsk_texture_node_new = c_gsk_texture_node_new;

/** */
alias gsk_texture_node_get_texture = c_gsk_texture_node_get_texture;

// TextureScaleNode

/** */
alias gsk_texture_scale_node_get_type = c_gsk_texture_scale_node_get_type;

/** */
alias gsk_texture_scale_node_new = c_gsk_texture_scale_node_new;

/** */
alias gsk_texture_scale_node_get_filter = c_gsk_texture_scale_node_get_filter;

/** */
alias gsk_texture_scale_node_get_texture = c_gsk_texture_scale_node_get_texture;

// Transform

/** */
alias gsk_transform_get_type = c_gsk_transform_get_type;

/** */
alias gsk_transform_new = c_gsk_transform_new;

/** */
alias gsk_transform_equal = c_gsk_transform_equal;

/** */
alias gsk_transform_get_category = c_gsk_transform_get_category;

/** */
alias gsk_transform_invert = c_gsk_transform_invert;

/** */
alias gsk_transform_matrix = c_gsk_transform_matrix;

/** */
alias gsk_transform_perspective = c_gsk_transform_perspective;

/** */
alias gsk_transform_print = c_gsk_transform_print;

/** */
alias gsk_transform_ref = c_gsk_transform_ref;

/** */
alias gsk_transform_rotate = c_gsk_transform_rotate;

/** */
alias gsk_transform_rotate_3d = c_gsk_transform_rotate_3d;

/** */
alias gsk_transform_scale = c_gsk_transform_scale;

/** */
alias gsk_transform_scale_3d = c_gsk_transform_scale_3d;

/** */
alias gsk_transform_skew = c_gsk_transform_skew;

/** */
alias gsk_transform_to_2d = c_gsk_transform_to_2d;

/** */
alias gsk_transform_to_2d_components = c_gsk_transform_to_2d_components;

/** */
alias gsk_transform_to_affine = c_gsk_transform_to_affine;

/** */
alias gsk_transform_to_matrix = c_gsk_transform_to_matrix;

/** */
alias gsk_transform_to_string = c_gsk_transform_to_string;

/** */
alias gsk_transform_to_translate = c_gsk_transform_to_translate;

/** */
alias gsk_transform_transform = c_gsk_transform_transform;

/** */
alias gsk_transform_transform_bounds = c_gsk_transform_transform_bounds;

/** */
alias gsk_transform_transform_point = c_gsk_transform_transform_point;

/** */
alias gsk_transform_translate = c_gsk_transform_translate;

/** */
alias gsk_transform_translate_3d = c_gsk_transform_translate_3d;

/** */
alias gsk_transform_unref = c_gsk_transform_unref;

/** */
alias gsk_transform_parse = c_gsk_transform_parse;

// TransformNode

/** */
alias gsk_transform_node_get_type = c_gsk_transform_node_get_type;

/** */
alias gsk_transform_node_new = c_gsk_transform_node_new;

/** */
alias gsk_transform_node_get_child = c_gsk_transform_node_get_child;

/** */
alias gsk_transform_node_get_transform = c_gsk_transform_node_get_transform;

// VulkanRenderer

/** */
alias gsk_vulkan_renderer_get_type = c_gsk_vulkan_renderer_get_type;

/** */
alias gsk_vulkan_renderer_new = c_gsk_vulkan_renderer_new;

// global

/** */
alias gsk_value_dup_render_node = c_gsk_value_dup_render_node;

/** */
alias gsk_value_get_render_node = c_gsk_value_get_render_node;

/** */
alias gsk_value_set_render_node = c_gsk_value_set_render_node;

/** */
alias gsk_value_take_render_node = c_gsk_value_take_render_node;

// SerializationError

/** */
alias gsk_serialization_error_quark = c_gsk_serialization_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // BlendNode
  gidLink(cast(void**)&gsk_blend_node_get_type, "gsk_blend_node_get_type", libs);
  gidLink(cast(void**)&gsk_blend_node_new, "gsk_blend_node_new", libs);
  gidLink(cast(void**)&gsk_blend_node_get_blend_mode, "gsk_blend_node_get_blend_mode", libs);
  gidLink(cast(void**)&gsk_blend_node_get_bottom_child, "gsk_blend_node_get_bottom_child", libs);
  gidLink(cast(void**)&gsk_blend_node_get_top_child, "gsk_blend_node_get_top_child", libs);

  // BlurNode
  gidLink(cast(void**)&gsk_blur_node_get_type, "gsk_blur_node_get_type", libs);
  gidLink(cast(void**)&gsk_blur_node_new, "gsk_blur_node_new", libs);
  gidLink(cast(void**)&gsk_blur_node_get_child, "gsk_blur_node_get_child", libs);
  gidLink(cast(void**)&gsk_blur_node_get_radius, "gsk_blur_node_get_radius", libs);

  // BorderNode
  gidLink(cast(void**)&gsk_border_node_get_type, "gsk_border_node_get_type", libs);
  gidLink(cast(void**)&gsk_border_node_new, "gsk_border_node_new", libs);
  gidLink(cast(void**)&gsk_border_node_get_colors, "gsk_border_node_get_colors", libs);
  gidLink(cast(void**)&gsk_border_node_get_outline, "gsk_border_node_get_outline", libs);
  gidLink(cast(void**)&gsk_border_node_get_widths, "gsk_border_node_get_widths", libs);

  // BroadwayRenderer
  gidLink(cast(void**)&gsk_broadway_renderer_get_type, "gsk_broadway_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_broadway_renderer_new, "gsk_broadway_renderer_new", libs);

  // CairoNode
  gidLink(cast(void**)&gsk_cairo_node_get_type, "gsk_cairo_node_get_type", libs);
  gidLink(cast(void**)&gsk_cairo_node_new, "gsk_cairo_node_new", libs);
  gidLink(cast(void**)&gsk_cairo_node_get_draw_context, "gsk_cairo_node_get_draw_context", libs);
  gidLink(cast(void**)&gsk_cairo_node_get_surface, "gsk_cairo_node_get_surface", libs);

  // CairoRenderer
  gidLink(cast(void**)&gsk_cairo_renderer_get_type, "gsk_cairo_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_cairo_renderer_new, "gsk_cairo_renderer_new", libs);

  // ClipNode
  gidLink(cast(void**)&gsk_clip_node_get_type, "gsk_clip_node_get_type", libs);
  gidLink(cast(void**)&gsk_clip_node_new, "gsk_clip_node_new", libs);
  gidLink(cast(void**)&gsk_clip_node_get_child, "gsk_clip_node_get_child", libs);
  gidLink(cast(void**)&gsk_clip_node_get_clip, "gsk_clip_node_get_clip", libs);

  // ColorMatrixNode
  gidLink(cast(void**)&gsk_color_matrix_node_get_type, "gsk_color_matrix_node_get_type", libs);
  gidLink(cast(void**)&gsk_color_matrix_node_new, "gsk_color_matrix_node_new", libs);
  gidLink(cast(void**)&gsk_color_matrix_node_get_child, "gsk_color_matrix_node_get_child", libs);
  gidLink(cast(void**)&gsk_color_matrix_node_get_color_matrix, "gsk_color_matrix_node_get_color_matrix", libs);
  gidLink(cast(void**)&gsk_color_matrix_node_get_color_offset, "gsk_color_matrix_node_get_color_offset", libs);

  // ColorNode
  gidLink(cast(void**)&gsk_color_node_get_type, "gsk_color_node_get_type", libs);
  gidLink(cast(void**)&gsk_color_node_new, "gsk_color_node_new", libs);
  gidLink(cast(void**)&gsk_color_node_get_color, "gsk_color_node_get_color", libs);

  // ConicGradientNode
  gidLink(cast(void**)&gsk_conic_gradient_node_get_type, "gsk_conic_gradient_node_get_type", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_new, "gsk_conic_gradient_node_new", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_get_angle, "gsk_conic_gradient_node_get_angle", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_get_center, "gsk_conic_gradient_node_get_center", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_get_color_stops, "gsk_conic_gradient_node_get_color_stops", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_get_n_color_stops, "gsk_conic_gradient_node_get_n_color_stops", libs);
  gidLink(cast(void**)&gsk_conic_gradient_node_get_rotation, "gsk_conic_gradient_node_get_rotation", libs);

  // ContainerNode
  gidLink(cast(void**)&gsk_container_node_get_type, "gsk_container_node_get_type", libs);
  gidLink(cast(void**)&gsk_container_node_new, "gsk_container_node_new", libs);
  gidLink(cast(void**)&gsk_container_node_get_child, "gsk_container_node_get_child", libs);
  gidLink(cast(void**)&gsk_container_node_get_n_children, "gsk_container_node_get_n_children", libs);

  // CrossFadeNode
  gidLink(cast(void**)&gsk_cross_fade_node_get_type, "gsk_cross_fade_node_get_type", libs);
  gidLink(cast(void**)&gsk_cross_fade_node_new, "gsk_cross_fade_node_new", libs);
  gidLink(cast(void**)&gsk_cross_fade_node_get_end_child, "gsk_cross_fade_node_get_end_child", libs);
  gidLink(cast(void**)&gsk_cross_fade_node_get_progress, "gsk_cross_fade_node_get_progress", libs);
  gidLink(cast(void**)&gsk_cross_fade_node_get_start_child, "gsk_cross_fade_node_get_start_child", libs);

  // DebugNode
  gidLink(cast(void**)&gsk_debug_node_get_type, "gsk_debug_node_get_type", libs);
  gidLink(cast(void**)&gsk_debug_node_new, "gsk_debug_node_new", libs);
  gidLink(cast(void**)&gsk_debug_node_get_child, "gsk_debug_node_get_child", libs);
  gidLink(cast(void**)&gsk_debug_node_get_message, "gsk_debug_node_get_message", libs);

  // FillNode
  gidLink(cast(void**)&gsk_fill_node_get_type, "gsk_fill_node_get_type", libs);
  gidLink(cast(void**)&gsk_fill_node_new, "gsk_fill_node_new", libs);
  gidLink(cast(void**)&gsk_fill_node_get_child, "gsk_fill_node_get_child", libs);
  gidLink(cast(void**)&gsk_fill_node_get_fill_rule, "gsk_fill_node_get_fill_rule", libs);
  gidLink(cast(void**)&gsk_fill_node_get_path, "gsk_fill_node_get_path", libs);

  // GLRenderer
  gidLink(cast(void**)&gsk_gl_renderer_get_type, "gsk_gl_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_gl_renderer_new, "gsk_gl_renderer_new", libs);

  // GLShader
  gidLink(cast(void**)&gsk_gl_shader_get_type, "gsk_gl_shader_get_type", libs);
  gidLink(cast(void**)&gsk_gl_shader_new_from_bytes, "gsk_gl_shader_new_from_bytes", libs);
  gidLink(cast(void**)&gsk_gl_shader_new_from_resource, "gsk_gl_shader_new_from_resource", libs);
  gidLink(cast(void**)&gsk_gl_shader_compile, "gsk_gl_shader_compile", libs);
  gidLink(cast(void**)&gsk_gl_shader_find_uniform_by_name, "gsk_gl_shader_find_uniform_by_name", libs);
  gidLink(cast(void**)&gsk_gl_shader_format_args, "gsk_gl_shader_format_args", libs);
  gidLink(cast(void**)&gsk_gl_shader_format_args_va, "gsk_gl_shader_format_args_va", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_bool, "gsk_gl_shader_get_arg_bool", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_float, "gsk_gl_shader_get_arg_float", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_int, "gsk_gl_shader_get_arg_int", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_uint, "gsk_gl_shader_get_arg_uint", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_vec2, "gsk_gl_shader_get_arg_vec2", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_vec3, "gsk_gl_shader_get_arg_vec3", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_arg_vec4, "gsk_gl_shader_get_arg_vec4", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_args_size, "gsk_gl_shader_get_args_size", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_n_textures, "gsk_gl_shader_get_n_textures", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_n_uniforms, "gsk_gl_shader_get_n_uniforms", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_resource, "gsk_gl_shader_get_resource", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_source, "gsk_gl_shader_get_source", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_uniform_name, "gsk_gl_shader_get_uniform_name", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_uniform_offset, "gsk_gl_shader_get_uniform_offset", libs);
  gidLink(cast(void**)&gsk_gl_shader_get_uniform_type, "gsk_gl_shader_get_uniform_type", libs);

  // GLShaderNode
  gidLink(cast(void**)&gsk_gl_shader_node_get_type, "gsk_gl_shader_node_get_type", libs);
  gidLink(cast(void**)&gsk_gl_shader_node_new, "gsk_gl_shader_node_new", libs);
  gidLink(cast(void**)&gsk_gl_shader_node_get_args, "gsk_gl_shader_node_get_args", libs);
  gidLink(cast(void**)&gsk_gl_shader_node_get_child, "gsk_gl_shader_node_get_child", libs);
  gidLink(cast(void**)&gsk_gl_shader_node_get_n_children, "gsk_gl_shader_node_get_n_children", libs);
  gidLink(cast(void**)&gsk_gl_shader_node_get_shader, "gsk_gl_shader_node_get_shader", libs);

  // InsetShadowNode
  gidLink(cast(void**)&gsk_inset_shadow_node_get_type, "gsk_inset_shadow_node_get_type", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_new, "gsk_inset_shadow_node_new", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_blur_radius, "gsk_inset_shadow_node_get_blur_radius", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_color, "gsk_inset_shadow_node_get_color", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_dx, "gsk_inset_shadow_node_get_dx", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_dy, "gsk_inset_shadow_node_get_dy", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_outline, "gsk_inset_shadow_node_get_outline", libs);
  gidLink(cast(void**)&gsk_inset_shadow_node_get_spread, "gsk_inset_shadow_node_get_spread", libs);

  // LinearGradientNode
  gidLink(cast(void**)&gsk_linear_gradient_node_get_type, "gsk_linear_gradient_node_get_type", libs);
  gidLink(cast(void**)&gsk_linear_gradient_node_new, "gsk_linear_gradient_node_new", libs);
  gidLink(cast(void**)&gsk_linear_gradient_node_get_color_stops, "gsk_linear_gradient_node_get_color_stops", libs);
  gidLink(cast(void**)&gsk_linear_gradient_node_get_end, "gsk_linear_gradient_node_get_end", libs);
  gidLink(cast(void**)&gsk_linear_gradient_node_get_n_color_stops, "gsk_linear_gradient_node_get_n_color_stops", libs);
  gidLink(cast(void**)&gsk_linear_gradient_node_get_start, "gsk_linear_gradient_node_get_start", libs);

  // MaskNode
  gidLink(cast(void**)&gsk_mask_node_get_type, "gsk_mask_node_get_type", libs);
  gidLink(cast(void**)&gsk_mask_node_new, "gsk_mask_node_new", libs);
  gidLink(cast(void**)&gsk_mask_node_get_mask, "gsk_mask_node_get_mask", libs);
  gidLink(cast(void**)&gsk_mask_node_get_mask_mode, "gsk_mask_node_get_mask_mode", libs);
  gidLink(cast(void**)&gsk_mask_node_get_source, "gsk_mask_node_get_source", libs);

  // NglRenderer
  gidLink(cast(void**)&gsk_ngl_renderer_get_type, "gsk_ngl_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_ngl_renderer_new, "gsk_ngl_renderer_new", libs);

  // OpacityNode
  gidLink(cast(void**)&gsk_opacity_node_get_type, "gsk_opacity_node_get_type", libs);
  gidLink(cast(void**)&gsk_opacity_node_new, "gsk_opacity_node_new", libs);
  gidLink(cast(void**)&gsk_opacity_node_get_child, "gsk_opacity_node_get_child", libs);
  gidLink(cast(void**)&gsk_opacity_node_get_opacity, "gsk_opacity_node_get_opacity", libs);

  // OutsetShadowNode
  gidLink(cast(void**)&gsk_outset_shadow_node_get_type, "gsk_outset_shadow_node_get_type", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_new, "gsk_outset_shadow_node_new", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_blur_radius, "gsk_outset_shadow_node_get_blur_radius", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_color, "gsk_outset_shadow_node_get_color", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_dx, "gsk_outset_shadow_node_get_dx", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_dy, "gsk_outset_shadow_node_get_dy", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_outline, "gsk_outset_shadow_node_get_outline", libs);
  gidLink(cast(void**)&gsk_outset_shadow_node_get_spread, "gsk_outset_shadow_node_get_spread", libs);

  // Path
  gidLink(cast(void**)&gsk_path_get_type, "gsk_path_get_type", libs);
  gidLink(cast(void**)&gsk_path_foreach, "gsk_path_foreach", libs);
  gidLink(cast(void**)&gsk_path_get_bounds, "gsk_path_get_bounds", libs);
  gidLink(cast(void**)&gsk_path_get_closest_point, "gsk_path_get_closest_point", libs);
  gidLink(cast(void**)&gsk_path_get_end_point, "gsk_path_get_end_point", libs);
  gidLink(cast(void**)&gsk_path_get_start_point, "gsk_path_get_start_point", libs);
  gidLink(cast(void**)&gsk_path_get_stroke_bounds, "gsk_path_get_stroke_bounds", libs);
  gidLink(cast(void**)&gsk_path_in_fill, "gsk_path_in_fill", libs);
  gidLink(cast(void**)&gsk_path_is_closed, "gsk_path_is_closed", libs);
  gidLink(cast(void**)&gsk_path_is_empty, "gsk_path_is_empty", libs);
  gidLink(cast(void**)&gsk_path_print, "gsk_path_print", libs);
  gidLink(cast(void**)&gsk_path_ref, "gsk_path_ref", libs);
  gidLink(cast(void**)&gsk_path_to_cairo, "gsk_path_to_cairo", libs);
  gidLink(cast(void**)&gsk_path_to_string, "gsk_path_to_string", libs);
  gidLink(cast(void**)&gsk_path_unref, "gsk_path_unref", libs);
  gidLink(cast(void**)&gsk_path_parse, "gsk_path_parse", libs);

  // PathBuilder
  gidLink(cast(void**)&gsk_path_builder_get_type, "gsk_path_builder_get_type", libs);
  gidLink(cast(void**)&gsk_path_builder_new, "gsk_path_builder_new", libs);
  gidLink(cast(void**)&gsk_path_builder_add_cairo_path, "gsk_path_builder_add_cairo_path", libs);
  gidLink(cast(void**)&gsk_path_builder_add_circle, "gsk_path_builder_add_circle", libs);
  gidLink(cast(void**)&gsk_path_builder_add_layout, "gsk_path_builder_add_layout", libs);
  gidLink(cast(void**)&gsk_path_builder_add_path, "gsk_path_builder_add_path", libs);
  gidLink(cast(void**)&gsk_path_builder_add_rect, "gsk_path_builder_add_rect", libs);
  gidLink(cast(void**)&gsk_path_builder_add_reverse_path, "gsk_path_builder_add_reverse_path", libs);
  gidLink(cast(void**)&gsk_path_builder_add_rounded_rect, "gsk_path_builder_add_rounded_rect", libs);
  gidLink(cast(void**)&gsk_path_builder_add_segment, "gsk_path_builder_add_segment", libs);
  gidLink(cast(void**)&gsk_path_builder_arc_to, "gsk_path_builder_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_close, "gsk_path_builder_close", libs);
  gidLink(cast(void**)&gsk_path_builder_conic_to, "gsk_path_builder_conic_to", libs);
  gidLink(cast(void**)&gsk_path_builder_cubic_to, "gsk_path_builder_cubic_to", libs);
  gidLink(cast(void**)&gsk_path_builder_free_to_path, "gsk_path_builder_free_to_path", libs);
  gidLink(cast(void**)&gsk_path_builder_get_current_point, "gsk_path_builder_get_current_point", libs);
  gidLink(cast(void**)&gsk_path_builder_html_arc_to, "gsk_path_builder_html_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_line_to, "gsk_path_builder_line_to", libs);
  gidLink(cast(void**)&gsk_path_builder_move_to, "gsk_path_builder_move_to", libs);
  gidLink(cast(void**)&gsk_path_builder_quad_to, "gsk_path_builder_quad_to", libs);
  gidLink(cast(void**)&gsk_path_builder_ref, "gsk_path_builder_ref", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_arc_to, "gsk_path_builder_rel_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_conic_to, "gsk_path_builder_rel_conic_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_cubic_to, "gsk_path_builder_rel_cubic_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_html_arc_to, "gsk_path_builder_rel_html_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_line_to, "gsk_path_builder_rel_line_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_move_to, "gsk_path_builder_rel_move_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_quad_to, "gsk_path_builder_rel_quad_to", libs);
  gidLink(cast(void**)&gsk_path_builder_rel_svg_arc_to, "gsk_path_builder_rel_svg_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_svg_arc_to, "gsk_path_builder_svg_arc_to", libs);
  gidLink(cast(void**)&gsk_path_builder_to_path, "gsk_path_builder_to_path", libs);
  gidLink(cast(void**)&gsk_path_builder_unref, "gsk_path_builder_unref", libs);

  // PathMeasure
  gidLink(cast(void**)&gsk_path_measure_get_type, "gsk_path_measure_get_type", libs);
  gidLink(cast(void**)&gsk_path_measure_new, "gsk_path_measure_new", libs);
  gidLink(cast(void**)&gsk_path_measure_new_with_tolerance, "gsk_path_measure_new_with_tolerance", libs);
  gidLink(cast(void**)&gsk_path_measure_get_length, "gsk_path_measure_get_length", libs);
  gidLink(cast(void**)&gsk_path_measure_get_path, "gsk_path_measure_get_path", libs);
  gidLink(cast(void**)&gsk_path_measure_get_point, "gsk_path_measure_get_point", libs);
  gidLink(cast(void**)&gsk_path_measure_get_tolerance, "gsk_path_measure_get_tolerance", libs);
  gidLink(cast(void**)&gsk_path_measure_ref, "gsk_path_measure_ref", libs);
  gidLink(cast(void**)&gsk_path_measure_unref, "gsk_path_measure_unref", libs);

  // PathPoint
  gidLink(cast(void**)&gsk_path_point_get_type, "gsk_path_point_get_type", libs);
  gidLink(cast(void**)&gsk_path_point_compare, "gsk_path_point_compare", libs);
  gidLink(cast(void**)&gsk_path_point_copy, "gsk_path_point_copy", libs);
  gidLink(cast(void**)&gsk_path_point_equal, "gsk_path_point_equal", libs);
  gidLink(cast(void**)&gsk_path_point_free, "gsk_path_point_free", libs);
  gidLink(cast(void**)&gsk_path_point_get_curvature, "gsk_path_point_get_curvature", libs);
  gidLink(cast(void**)&gsk_path_point_get_distance, "gsk_path_point_get_distance", libs);
  gidLink(cast(void**)&gsk_path_point_get_position, "gsk_path_point_get_position", libs);
  gidLink(cast(void**)&gsk_path_point_get_rotation, "gsk_path_point_get_rotation", libs);
  gidLink(cast(void**)&gsk_path_point_get_tangent, "gsk_path_point_get_tangent", libs);

  // RadialGradientNode
  gidLink(cast(void**)&gsk_radial_gradient_node_get_type, "gsk_radial_gradient_node_get_type", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_new, "gsk_radial_gradient_node_new", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_center, "gsk_radial_gradient_node_get_center", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_color_stops, "gsk_radial_gradient_node_get_color_stops", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_end, "gsk_radial_gradient_node_get_end", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_hradius, "gsk_radial_gradient_node_get_hradius", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_n_color_stops, "gsk_radial_gradient_node_get_n_color_stops", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_start, "gsk_radial_gradient_node_get_start", libs);
  gidLink(cast(void**)&gsk_radial_gradient_node_get_vradius, "gsk_radial_gradient_node_get_vradius", libs);

  // RenderNode
  gidLink(cast(void**)&gsk_render_node_get_type, "gsk_render_node_get_type", libs);
  gidLink(cast(void**)&gsk_render_node_deserialize, "gsk_render_node_deserialize", libs);
  gidLink(cast(void**)&gsk_render_node_draw, "gsk_render_node_draw", libs);
  gidLink(cast(void**)&gsk_render_node_get_bounds, "gsk_render_node_get_bounds", libs);
  gidLink(cast(void**)&gsk_render_node_get_node_type, "gsk_render_node_get_node_type", libs);
  gidLink(cast(void**)&gsk_render_node_ref, "gsk_render_node_ref", libs);
  gidLink(cast(void**)&gsk_render_node_serialize, "gsk_render_node_serialize", libs);
  gidLink(cast(void**)&gsk_render_node_unref, "gsk_render_node_unref", libs);
  gidLink(cast(void**)&gsk_render_node_write_to_file, "gsk_render_node_write_to_file", libs);

  // Renderer
  gidLink(cast(void**)&gsk_renderer_get_type, "gsk_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_renderer_new_for_surface, "gsk_renderer_new_for_surface", libs);
  gidLink(cast(void**)&gsk_renderer_get_surface, "gsk_renderer_get_surface", libs);
  gidLink(cast(void**)&gsk_renderer_is_realized, "gsk_renderer_is_realized", libs);
  gidLink(cast(void**)&gsk_renderer_realize, "gsk_renderer_realize", libs);
  gidLink(cast(void**)&gsk_renderer_realize_for_display, "gsk_renderer_realize_for_display", libs);
  gidLink(cast(void**)&gsk_renderer_render, "gsk_renderer_render", libs);
  gidLink(cast(void**)&gsk_renderer_render_texture, "gsk_renderer_render_texture", libs);
  gidLink(cast(void**)&gsk_renderer_unrealize, "gsk_renderer_unrealize", libs);

  // RepeatNode
  gidLink(cast(void**)&gsk_repeat_node_get_type, "gsk_repeat_node_get_type", libs);
  gidLink(cast(void**)&gsk_repeat_node_new, "gsk_repeat_node_new", libs);
  gidLink(cast(void**)&gsk_repeat_node_get_child, "gsk_repeat_node_get_child", libs);
  gidLink(cast(void**)&gsk_repeat_node_get_child_bounds, "gsk_repeat_node_get_child_bounds", libs);

  // RepeatingLinearGradientNode
  gidLink(cast(void**)&gsk_repeating_linear_gradient_node_get_type, "gsk_repeating_linear_gradient_node_get_type", libs);
  gidLink(cast(void**)&gsk_repeating_linear_gradient_node_new, "gsk_repeating_linear_gradient_node_new", libs);

  // RepeatingRadialGradientNode
  gidLink(cast(void**)&gsk_repeating_radial_gradient_node_get_type, "gsk_repeating_radial_gradient_node_get_type", libs);
  gidLink(cast(void**)&gsk_repeating_radial_gradient_node_new, "gsk_repeating_radial_gradient_node_new", libs);

  // RoundedClipNode
  gidLink(cast(void**)&gsk_rounded_clip_node_get_type, "gsk_rounded_clip_node_get_type", libs);
  gidLink(cast(void**)&gsk_rounded_clip_node_new, "gsk_rounded_clip_node_new", libs);
  gidLink(cast(void**)&gsk_rounded_clip_node_get_child, "gsk_rounded_clip_node_get_child", libs);
  gidLink(cast(void**)&gsk_rounded_clip_node_get_clip, "gsk_rounded_clip_node_get_clip", libs);

  // RoundedRect
  gidLink(cast(void**)&gsk_rounded_rect_contains_point, "gsk_rounded_rect_contains_point", libs);
  gidLink(cast(void**)&gsk_rounded_rect_contains_rect, "gsk_rounded_rect_contains_rect", libs);
  gidLink(cast(void**)&gsk_rounded_rect_init, "gsk_rounded_rect_init", libs);
  gidLink(cast(void**)&gsk_rounded_rect_init_copy, "gsk_rounded_rect_init_copy", libs);
  gidLink(cast(void**)&gsk_rounded_rect_init_from_rect, "gsk_rounded_rect_init_from_rect", libs);
  gidLink(cast(void**)&gsk_rounded_rect_intersects_rect, "gsk_rounded_rect_intersects_rect", libs);
  gidLink(cast(void**)&gsk_rounded_rect_is_rectilinear, "gsk_rounded_rect_is_rectilinear", libs);
  gidLink(cast(void**)&gsk_rounded_rect_normalize, "gsk_rounded_rect_normalize", libs);
  gidLink(cast(void**)&gsk_rounded_rect_offset, "gsk_rounded_rect_offset", libs);
  gidLink(cast(void**)&gsk_rounded_rect_shrink, "gsk_rounded_rect_shrink", libs);

  // ShaderArgsBuilder
  gidLink(cast(void**)&gsk_shader_args_builder_get_type, "gsk_shader_args_builder_get_type", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_new, "gsk_shader_args_builder_new", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_free_to_args, "gsk_shader_args_builder_free_to_args", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_ref, "gsk_shader_args_builder_ref", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_bool, "gsk_shader_args_builder_set_bool", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_float, "gsk_shader_args_builder_set_float", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_int, "gsk_shader_args_builder_set_int", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_uint, "gsk_shader_args_builder_set_uint", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_vec2, "gsk_shader_args_builder_set_vec2", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_vec3, "gsk_shader_args_builder_set_vec3", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_set_vec4, "gsk_shader_args_builder_set_vec4", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_to_args, "gsk_shader_args_builder_to_args", libs);
  gidLink(cast(void**)&gsk_shader_args_builder_unref, "gsk_shader_args_builder_unref", libs);

  // ShadowNode
  gidLink(cast(void**)&gsk_shadow_node_get_type, "gsk_shadow_node_get_type", libs);
  gidLink(cast(void**)&gsk_shadow_node_new, "gsk_shadow_node_new", libs);
  gidLink(cast(void**)&gsk_shadow_node_get_child, "gsk_shadow_node_get_child", libs);
  gidLink(cast(void**)&gsk_shadow_node_get_n_shadows, "gsk_shadow_node_get_n_shadows", libs);
  gidLink(cast(void**)&gsk_shadow_node_get_shadow, "gsk_shadow_node_get_shadow", libs);

  // Stroke
  gidLink(cast(void**)&gsk_stroke_get_type, "gsk_stroke_get_type", libs);
  gidLink(cast(void**)&gsk_stroke_new, "gsk_stroke_new", libs);
  gidLink(cast(void**)&gsk_stroke_copy, "gsk_stroke_copy", libs);
  gidLink(cast(void**)&gsk_stroke_free, "gsk_stroke_free", libs);
  gidLink(cast(void**)&gsk_stroke_get_dash, "gsk_stroke_get_dash", libs);
  gidLink(cast(void**)&gsk_stroke_get_dash_offset, "gsk_stroke_get_dash_offset", libs);
  gidLink(cast(void**)&gsk_stroke_get_line_cap, "gsk_stroke_get_line_cap", libs);
  gidLink(cast(void**)&gsk_stroke_get_line_join, "gsk_stroke_get_line_join", libs);
  gidLink(cast(void**)&gsk_stroke_get_line_width, "gsk_stroke_get_line_width", libs);
  gidLink(cast(void**)&gsk_stroke_get_miter_limit, "gsk_stroke_get_miter_limit", libs);
  gidLink(cast(void**)&gsk_stroke_set_dash, "gsk_stroke_set_dash", libs);
  gidLink(cast(void**)&gsk_stroke_set_dash_offset, "gsk_stroke_set_dash_offset", libs);
  gidLink(cast(void**)&gsk_stroke_set_line_cap, "gsk_stroke_set_line_cap", libs);
  gidLink(cast(void**)&gsk_stroke_set_line_join, "gsk_stroke_set_line_join", libs);
  gidLink(cast(void**)&gsk_stroke_set_line_width, "gsk_stroke_set_line_width", libs);
  gidLink(cast(void**)&gsk_stroke_set_miter_limit, "gsk_stroke_set_miter_limit", libs);
  gidLink(cast(void**)&gsk_stroke_to_cairo, "gsk_stroke_to_cairo", libs);
  gidLink(cast(void**)&gsk_stroke_equal, "gsk_stroke_equal", libs);

  // StrokeNode
  gidLink(cast(void**)&gsk_stroke_node_get_type, "gsk_stroke_node_get_type", libs);
  gidLink(cast(void**)&gsk_stroke_node_new, "gsk_stroke_node_new", libs);
  gidLink(cast(void**)&gsk_stroke_node_get_child, "gsk_stroke_node_get_child", libs);
  gidLink(cast(void**)&gsk_stroke_node_get_path, "gsk_stroke_node_get_path", libs);
  gidLink(cast(void**)&gsk_stroke_node_get_stroke, "gsk_stroke_node_get_stroke", libs);

  // SubsurfaceNode
  gidLink(cast(void**)&gsk_subsurface_node_get_type, "gsk_subsurface_node_get_type", libs);
  gidLink(cast(void**)&gsk_subsurface_node_new, "gsk_subsurface_node_new", libs);
  gidLink(cast(void**)&gsk_subsurface_node_get_subsurface, "gsk_subsurface_node_get_subsurface", libs);
  gidLink(cast(void**)&gsk_subsurface_node_get_child, "gsk_subsurface_node_get_child", libs);

  // TextNode
  gidLink(cast(void**)&gsk_text_node_get_type, "gsk_text_node_get_type", libs);
  gidLink(cast(void**)&gsk_text_node_new, "gsk_text_node_new", libs);
  gidLink(cast(void**)&gsk_text_node_get_color, "gsk_text_node_get_color", libs);
  gidLink(cast(void**)&gsk_text_node_get_font, "gsk_text_node_get_font", libs);
  gidLink(cast(void**)&gsk_text_node_get_glyphs, "gsk_text_node_get_glyphs", libs);
  gidLink(cast(void**)&gsk_text_node_get_num_glyphs, "gsk_text_node_get_num_glyphs", libs);
  gidLink(cast(void**)&gsk_text_node_get_offset, "gsk_text_node_get_offset", libs);
  gidLink(cast(void**)&gsk_text_node_has_color_glyphs, "gsk_text_node_has_color_glyphs", libs);

  // TextureNode
  gidLink(cast(void**)&gsk_texture_node_get_type, "gsk_texture_node_get_type", libs);
  gidLink(cast(void**)&gsk_texture_node_new, "gsk_texture_node_new", libs);
  gidLink(cast(void**)&gsk_texture_node_get_texture, "gsk_texture_node_get_texture", libs);

  // TextureScaleNode
  gidLink(cast(void**)&gsk_texture_scale_node_get_type, "gsk_texture_scale_node_get_type", libs);
  gidLink(cast(void**)&gsk_texture_scale_node_new, "gsk_texture_scale_node_new", libs);
  gidLink(cast(void**)&gsk_texture_scale_node_get_filter, "gsk_texture_scale_node_get_filter", libs);
  gidLink(cast(void**)&gsk_texture_scale_node_get_texture, "gsk_texture_scale_node_get_texture", libs);

  // Transform
  gidLink(cast(void**)&gsk_transform_get_type, "gsk_transform_get_type", libs);
  gidLink(cast(void**)&gsk_transform_new, "gsk_transform_new", libs);
  gidLink(cast(void**)&gsk_transform_equal, "gsk_transform_equal", libs);
  gidLink(cast(void**)&gsk_transform_get_category, "gsk_transform_get_category", libs);
  gidLink(cast(void**)&gsk_transform_invert, "gsk_transform_invert", libs);
  gidLink(cast(void**)&gsk_transform_matrix, "gsk_transform_matrix", libs);
  gidLink(cast(void**)&gsk_transform_perspective, "gsk_transform_perspective", libs);
  gidLink(cast(void**)&gsk_transform_print, "gsk_transform_print", libs);
  gidLink(cast(void**)&gsk_transform_ref, "gsk_transform_ref", libs);
  gidLink(cast(void**)&gsk_transform_rotate, "gsk_transform_rotate", libs);
  gidLink(cast(void**)&gsk_transform_rotate_3d, "gsk_transform_rotate_3d", libs);
  gidLink(cast(void**)&gsk_transform_scale, "gsk_transform_scale", libs);
  gidLink(cast(void**)&gsk_transform_scale_3d, "gsk_transform_scale_3d", libs);
  gidLink(cast(void**)&gsk_transform_skew, "gsk_transform_skew", libs);
  gidLink(cast(void**)&gsk_transform_to_2d, "gsk_transform_to_2d", libs);
  gidLink(cast(void**)&gsk_transform_to_2d_components, "gsk_transform_to_2d_components", libs);
  gidLink(cast(void**)&gsk_transform_to_affine, "gsk_transform_to_affine", libs);
  gidLink(cast(void**)&gsk_transform_to_matrix, "gsk_transform_to_matrix", libs);
  gidLink(cast(void**)&gsk_transform_to_string, "gsk_transform_to_string", libs);
  gidLink(cast(void**)&gsk_transform_to_translate, "gsk_transform_to_translate", libs);
  gidLink(cast(void**)&gsk_transform_transform, "gsk_transform_transform", libs);
  gidLink(cast(void**)&gsk_transform_transform_bounds, "gsk_transform_transform_bounds", libs);
  gidLink(cast(void**)&gsk_transform_transform_point, "gsk_transform_transform_point", libs);
  gidLink(cast(void**)&gsk_transform_translate, "gsk_transform_translate", libs);
  gidLink(cast(void**)&gsk_transform_translate_3d, "gsk_transform_translate_3d", libs);
  gidLink(cast(void**)&gsk_transform_unref, "gsk_transform_unref", libs);
  gidLink(cast(void**)&gsk_transform_parse, "gsk_transform_parse", libs);

  // TransformNode
  gidLink(cast(void**)&gsk_transform_node_get_type, "gsk_transform_node_get_type", libs);
  gidLink(cast(void**)&gsk_transform_node_new, "gsk_transform_node_new", libs);
  gidLink(cast(void**)&gsk_transform_node_get_child, "gsk_transform_node_get_child", libs);
  gidLink(cast(void**)&gsk_transform_node_get_transform, "gsk_transform_node_get_transform", libs);

  // VulkanRenderer
  gidLink(cast(void**)&gsk_vulkan_renderer_get_type, "gsk_vulkan_renderer_get_type", libs);
  gidLink(cast(void**)&gsk_vulkan_renderer_new, "gsk_vulkan_renderer_new", libs);

  // global
  gidLink(cast(void**)&gsk_value_dup_render_node, "gsk_value_dup_render_node", libs);
  gidLink(cast(void**)&gsk_value_get_render_node, "gsk_value_get_render_node", libs);
  gidLink(cast(void**)&gsk_value_set_render_node, "gsk_value_set_render_node", libs);
  gidLink(cast(void**)&gsk_value_take_render_node, "gsk_value_take_render_node", libs);

  // SerializationError
  gidLink(cast(void**)&gsk_serialization_error_quark, "gsk_serialization_error_quark", libs);
}
