/// C functions for gsk4 library
module gid.gsk4.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gsk4.c.types;
public import gid.gdk4.c.types;
public import gid.graphene1.c.types;

private immutable LIBS = ["gtk-4_1"];

// BlendNode
private alias c_gsk_blend_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_blend_node_get_typeFn c_gsk_blend_node_get_type; ///
private alias c_gsk_blend_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* bottom, GskRenderNode* top, GskBlendMode blendMode) nothrow;
__gshared c_gsk_blend_node_newFn c_gsk_blend_node_new; ///
private alias c_gsk_blend_node_get_blend_modeFn = extern(C) GskBlendMode function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_blend_node_get_blend_modeFn c_gsk_blend_node_get_blend_mode; ///
private alias c_gsk_blend_node_get_bottom_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_blend_node_get_bottom_childFn c_gsk_blend_node_get_bottom_child; ///
private alias c_gsk_blend_node_get_top_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_blend_node_get_top_childFn c_gsk_blend_node_get_top_child; ///

// BlurNode
private alias c_gsk_blur_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_blur_node_get_typeFn c_gsk_blur_node_get_type; ///
private alias c_gsk_blur_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, float radius) nothrow;
__gshared c_gsk_blur_node_newFn c_gsk_blur_node_new; ///
private alias c_gsk_blur_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_blur_node_get_childFn c_gsk_blur_node_get_child; ///
private alias c_gsk_blur_node_get_radiusFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_blur_node_get_radiusFn c_gsk_blur_node_get_radius; ///

// BorderNode
private alias c_gsk_border_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_border_node_get_typeFn c_gsk_border_node_get_type; ///
private alias c_gsk_border_node_newFn = extern(C) GskRenderNode* function(const(GskRoundedRect)* outline, const(float)* borderWidth, const(GdkRGBA)* borderColor) nothrow;
__gshared c_gsk_border_node_newFn c_gsk_border_node_new; ///
private alias c_gsk_border_node_get_colorsFn = extern(C) const(GdkRGBA)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_border_node_get_colorsFn c_gsk_border_node_get_colors; ///
private alias c_gsk_border_node_get_outlineFn = extern(C) const(GskRoundedRect)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_border_node_get_outlineFn c_gsk_border_node_get_outline; ///
private alias c_gsk_border_node_get_widthsFn = extern(C) const(float)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_border_node_get_widthsFn c_gsk_border_node_get_widths; ///

// BroadwayRenderer
private alias c_gsk_broadway_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_broadway_renderer_get_typeFn c_gsk_broadway_renderer_get_type; ///
private alias c_gsk_broadway_renderer_newFn = extern(C) GskRenderer* function() nothrow;
__gshared c_gsk_broadway_renderer_newFn c_gsk_broadway_renderer_new; ///

// CairoNode
private alias c_gsk_cairo_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_cairo_node_get_typeFn c_gsk_cairo_node_get_type; ///
private alias c_gsk_cairo_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds) nothrow;
__gshared c_gsk_cairo_node_newFn c_gsk_cairo_node_new; ///
private alias c_gsk_cairo_node_get_draw_contextFn = extern(C) cairo_t* function(GskRenderNode* node) nothrow;
__gshared c_gsk_cairo_node_get_draw_contextFn c_gsk_cairo_node_get_draw_context; ///
private alias c_gsk_cairo_node_get_surfaceFn = extern(C) cairo_surface_t* function(GskRenderNode* node) nothrow;
__gshared c_gsk_cairo_node_get_surfaceFn c_gsk_cairo_node_get_surface; ///

// CairoRenderer
private alias c_gsk_cairo_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_cairo_renderer_get_typeFn c_gsk_cairo_renderer_get_type; ///
private alias c_gsk_cairo_renderer_newFn = extern(C) GskRenderer* function() nothrow;
__gshared c_gsk_cairo_renderer_newFn c_gsk_cairo_renderer_new; ///

// ClipNode
private alias c_gsk_clip_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_clip_node_get_typeFn c_gsk_clip_node_get_type; ///
private alias c_gsk_clip_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, const(graphene_rect_t)* clip) nothrow;
__gshared c_gsk_clip_node_newFn c_gsk_clip_node_new; ///
private alias c_gsk_clip_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_clip_node_get_childFn c_gsk_clip_node_get_child; ///
private alias c_gsk_clip_node_get_clipFn = extern(C) const(graphene_rect_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_clip_node_get_clipFn c_gsk_clip_node_get_clip; ///

// ColorMatrixNode
private alias c_gsk_color_matrix_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_color_matrix_node_get_typeFn c_gsk_color_matrix_node_get_type; ///
private alias c_gsk_color_matrix_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, const(graphene_matrix_t)* colorMatrix, const(graphene_vec4_t)* colorOffset) nothrow;
__gshared c_gsk_color_matrix_node_newFn c_gsk_color_matrix_node_new; ///
private alias c_gsk_color_matrix_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_color_matrix_node_get_childFn c_gsk_color_matrix_node_get_child; ///
private alias c_gsk_color_matrix_node_get_color_matrixFn = extern(C) const(graphene_matrix_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_color_matrix_node_get_color_matrixFn c_gsk_color_matrix_node_get_color_matrix; ///
private alias c_gsk_color_matrix_node_get_color_offsetFn = extern(C) const(graphene_vec4_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_color_matrix_node_get_color_offsetFn c_gsk_color_matrix_node_get_color_offset; ///

// ColorNode
private alias c_gsk_color_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_color_node_get_typeFn c_gsk_color_node_get_type; ///
private alias c_gsk_color_node_newFn = extern(C) GskRenderNode* function(const(GdkRGBA)* rgba, const(graphene_rect_t)* bounds) nothrow;
__gshared c_gsk_color_node_newFn c_gsk_color_node_new; ///
private alias c_gsk_color_node_get_colorFn = extern(C) const(GdkRGBA)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_color_node_get_colorFn c_gsk_color_node_get_color; ///

// ComponentTransfer
private alias c_gsk_component_transfer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_component_transfer_get_typeFn c_gsk_component_transfer_get_type; ///
private alias c_gsk_component_transfer_new_discreteFn = extern(C) GskComponentTransfer* function(uint n, float* values) nothrow;
__gshared c_gsk_component_transfer_new_discreteFn c_gsk_component_transfer_new_discrete; ///
private alias c_gsk_component_transfer_new_gammaFn = extern(C) GskComponentTransfer* function(float amp, float exp, float ofs) nothrow;
__gshared c_gsk_component_transfer_new_gammaFn c_gsk_component_transfer_new_gamma; ///
private alias c_gsk_component_transfer_new_identityFn = extern(C) GskComponentTransfer* function() nothrow;
__gshared c_gsk_component_transfer_new_identityFn c_gsk_component_transfer_new_identity; ///
private alias c_gsk_component_transfer_new_levelsFn = extern(C) GskComponentTransfer* function(float n) nothrow;
__gshared c_gsk_component_transfer_new_levelsFn c_gsk_component_transfer_new_levels; ///
private alias c_gsk_component_transfer_new_linearFn = extern(C) GskComponentTransfer* function(float m, float b) nothrow;
__gshared c_gsk_component_transfer_new_linearFn c_gsk_component_transfer_new_linear; ///
private alias c_gsk_component_transfer_new_tableFn = extern(C) GskComponentTransfer* function(uint n, float* values) nothrow;
__gshared c_gsk_component_transfer_new_tableFn c_gsk_component_transfer_new_table; ///
private alias c_gsk_component_transfer_copyFn = extern(C) GskComponentTransfer* function(const(GskComponentTransfer)* other) nothrow;
__gshared c_gsk_component_transfer_copyFn c_gsk_component_transfer_copy; ///
private alias c_gsk_component_transfer_freeFn = extern(C) void function(GskComponentTransfer* self) nothrow;
__gshared c_gsk_component_transfer_freeFn c_gsk_component_transfer_free; ///
private alias c_gsk_component_transfer_equalFn = extern(C) gboolean function(const(void)* self, const(void)* other) nothrow;
__gshared c_gsk_component_transfer_equalFn c_gsk_component_transfer_equal; ///

// ComponentTransferNode
private alias c_gsk_component_transfer_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_component_transfer_node_get_typeFn c_gsk_component_transfer_node_get_type; ///
private alias c_gsk_component_transfer_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, const(GskComponentTransfer)* r, const(GskComponentTransfer)* g, const(GskComponentTransfer)* b, const(GskComponentTransfer)* a) nothrow;
__gshared c_gsk_component_transfer_node_newFn c_gsk_component_transfer_node_new; ///
private alias c_gsk_component_transfer_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_component_transfer_node_get_childFn c_gsk_component_transfer_node_get_child; ///
private alias c_gsk_component_transfer_node_get_transferFn = extern(C) const(GskComponentTransfer)* function(const(GskRenderNode)* node, GdkColorChannel component) nothrow;
__gshared c_gsk_component_transfer_node_get_transferFn c_gsk_component_transfer_node_get_transfer; ///

// CompositeNode
private alias c_gsk_composite_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_composite_node_get_typeFn c_gsk_composite_node_get_type; ///
private alias c_gsk_composite_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, GskRenderNode* mask, GskPorterDuff op) nothrow;
__gshared c_gsk_composite_node_newFn c_gsk_composite_node_new; ///
private alias c_gsk_composite_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_composite_node_get_childFn c_gsk_composite_node_get_child; ///
private alias c_gsk_composite_node_get_maskFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_composite_node_get_maskFn c_gsk_composite_node_get_mask; ///
private alias c_gsk_composite_node_get_operatorFn = extern(C) GskPorterDuff function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_composite_node_get_operatorFn c_gsk_composite_node_get_operator; ///

// ConicGradientNode
private alias c_gsk_conic_gradient_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_conic_gradient_node_get_typeFn c_gsk_conic_gradient_node_get_type; ///
private alias c_gsk_conic_gradient_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float rotation, const(GskColorStop)* colorStops, size_t nColorStops) nothrow;
__gshared c_gsk_conic_gradient_node_newFn c_gsk_conic_gradient_node_new; ///
private alias c_gsk_conic_gradient_node_get_angleFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_conic_gradient_node_get_angleFn c_gsk_conic_gradient_node_get_angle; ///
private alias c_gsk_conic_gradient_node_get_centerFn = extern(C) const(graphene_point_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_conic_gradient_node_get_centerFn c_gsk_conic_gradient_node_get_center; ///
private alias c_gsk_conic_gradient_node_get_color_stopsFn = extern(C) const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) nothrow;
__gshared c_gsk_conic_gradient_node_get_color_stopsFn c_gsk_conic_gradient_node_get_color_stops; ///
private alias c_gsk_conic_gradient_node_get_n_color_stopsFn = extern(C) size_t function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_conic_gradient_node_get_n_color_stopsFn c_gsk_conic_gradient_node_get_n_color_stops; ///
private alias c_gsk_conic_gradient_node_get_rotationFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_conic_gradient_node_get_rotationFn c_gsk_conic_gradient_node_get_rotation; ///

// ContainerNode
private alias c_gsk_container_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_container_node_get_typeFn c_gsk_container_node_get_type; ///
private alias c_gsk_container_node_newFn = extern(C) GskRenderNode* function(GskRenderNode** children, uint nChildren) nothrow;
__gshared c_gsk_container_node_newFn c_gsk_container_node_new; ///
private alias c_gsk_container_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node, uint idx) nothrow;
__gshared c_gsk_container_node_get_childFn c_gsk_container_node_get_child; ///
private alias c_gsk_container_node_get_n_childrenFn = extern(C) uint function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_container_node_get_n_childrenFn c_gsk_container_node_get_n_children; ///

// CopyNode
private alias c_gsk_copy_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_copy_node_get_typeFn c_gsk_copy_node_get_type; ///
private alias c_gsk_copy_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child) nothrow;
__gshared c_gsk_copy_node_newFn c_gsk_copy_node_new; ///
private alias c_gsk_copy_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_copy_node_get_childFn c_gsk_copy_node_get_child; ///

// CrossFadeNode
private alias c_gsk_cross_fade_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_cross_fade_node_get_typeFn c_gsk_cross_fade_node_get_type; ///
private alias c_gsk_cross_fade_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* start, GskRenderNode* end, float progress) nothrow;
__gshared c_gsk_cross_fade_node_newFn c_gsk_cross_fade_node_new; ///
private alias c_gsk_cross_fade_node_get_end_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_cross_fade_node_get_end_childFn c_gsk_cross_fade_node_get_end_child; ///
private alias c_gsk_cross_fade_node_get_progressFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_cross_fade_node_get_progressFn c_gsk_cross_fade_node_get_progress; ///
private alias c_gsk_cross_fade_node_get_start_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_cross_fade_node_get_start_childFn c_gsk_cross_fade_node_get_start_child; ///

// DebugNode
private alias c_gsk_debug_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_debug_node_get_typeFn c_gsk_debug_node_get_type; ///
private alias c_gsk_debug_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, char* message) nothrow;
__gshared c_gsk_debug_node_newFn c_gsk_debug_node_new; ///
private alias c_gsk_debug_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_debug_node_get_childFn c_gsk_debug_node_get_child; ///
private alias c_gsk_debug_node_get_messageFn = extern(C) const(char)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_debug_node_get_messageFn c_gsk_debug_node_get_message; ///

// FillNode
private alias c_gsk_fill_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_fill_node_get_typeFn c_gsk_fill_node_get_type; ///
private alias c_gsk_fill_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, GskPath* path, GskFillRule fillRule) nothrow;
__gshared c_gsk_fill_node_newFn c_gsk_fill_node_new; ///
private alias c_gsk_fill_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_fill_node_get_childFn c_gsk_fill_node_get_child; ///
private alias c_gsk_fill_node_get_fill_ruleFn = extern(C) GskFillRule function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_fill_node_get_fill_ruleFn c_gsk_fill_node_get_fill_rule; ///
private alias c_gsk_fill_node_get_pathFn = extern(C) GskPath* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_fill_node_get_pathFn c_gsk_fill_node_get_path; ///

// GLRenderer
private alias c_gsk_gl_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_gl_renderer_get_typeFn c_gsk_gl_renderer_get_type; ///
private alias c_gsk_gl_renderer_newFn = extern(C) GskRenderer* function() nothrow;
__gshared c_gsk_gl_renderer_newFn c_gsk_gl_renderer_new; ///

// GLShader
private alias c_gsk_gl_shader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_gl_shader_get_typeFn c_gsk_gl_shader_get_type; ///
private alias c_gsk_gl_shader_new_from_bytesFn = extern(C) GskGLShader* function(GBytes* sourcecode) nothrow;
__gshared c_gsk_gl_shader_new_from_bytesFn c_gsk_gl_shader_new_from_bytes; ///
private alias c_gsk_gl_shader_new_from_resourceFn = extern(C) GskGLShader* function(const(char)* resourcePath) nothrow;
__gshared c_gsk_gl_shader_new_from_resourceFn c_gsk_gl_shader_new_from_resource; ///
private alias c_gsk_gl_shader_compileFn = extern(C) gboolean function(GskGLShader* shader, GskRenderer* renderer, GError** _err) nothrow;
__gshared c_gsk_gl_shader_compileFn c_gsk_gl_shader_compile; ///
private alias c_gsk_gl_shader_find_uniform_by_nameFn = extern(C) int function(GskGLShader* shader, const(char)* name) nothrow;
__gshared c_gsk_gl_shader_find_uniform_by_nameFn c_gsk_gl_shader_find_uniform_by_name; ///
private alias c_gsk_gl_shader_format_argsFn = extern(C) GBytes* function(GskGLShader* shader,  ...) nothrow;
__gshared c_gsk_gl_shader_format_argsFn c_gsk_gl_shader_format_args; ///
private alias c_gsk_gl_shader_format_args_vaFn = extern(C) GBytes* function(GskGLShader* shader, void* uniforms) nothrow;
__gshared c_gsk_gl_shader_format_args_vaFn c_gsk_gl_shader_format_args_va; ///
private alias c_gsk_gl_shader_get_arg_boolFn = extern(C) gboolean function(GskGLShader* shader, GBytes* args, int idx) nothrow;
__gshared c_gsk_gl_shader_get_arg_boolFn c_gsk_gl_shader_get_arg_bool; ///
private alias c_gsk_gl_shader_get_arg_floatFn = extern(C) float function(GskGLShader* shader, GBytes* args, int idx) nothrow;
__gshared c_gsk_gl_shader_get_arg_floatFn c_gsk_gl_shader_get_arg_float; ///
private alias c_gsk_gl_shader_get_arg_intFn = extern(C) int function(GskGLShader* shader, GBytes* args, int idx) nothrow;
__gshared c_gsk_gl_shader_get_arg_intFn c_gsk_gl_shader_get_arg_int; ///
private alias c_gsk_gl_shader_get_arg_uintFn = extern(C) uint function(GskGLShader* shader, GBytes* args, int idx) nothrow;
__gshared c_gsk_gl_shader_get_arg_uintFn c_gsk_gl_shader_get_arg_uint; ///
private alias c_gsk_gl_shader_get_arg_vec2Fn = extern(C) void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec2_t* outValue) nothrow;
__gshared c_gsk_gl_shader_get_arg_vec2Fn c_gsk_gl_shader_get_arg_vec2; ///
private alias c_gsk_gl_shader_get_arg_vec3Fn = extern(C) void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec3_t* outValue) nothrow;
__gshared c_gsk_gl_shader_get_arg_vec3Fn c_gsk_gl_shader_get_arg_vec3; ///
private alias c_gsk_gl_shader_get_arg_vec4Fn = extern(C) void function(GskGLShader* shader, GBytes* args, int idx, graphene_vec4_t* outValue) nothrow;
__gshared c_gsk_gl_shader_get_arg_vec4Fn c_gsk_gl_shader_get_arg_vec4; ///
private alias c_gsk_gl_shader_get_args_sizeFn = extern(C) size_t function(GskGLShader* shader) nothrow;
__gshared c_gsk_gl_shader_get_args_sizeFn c_gsk_gl_shader_get_args_size; ///
private alias c_gsk_gl_shader_get_n_texturesFn = extern(C) int function(GskGLShader* shader) nothrow;
__gshared c_gsk_gl_shader_get_n_texturesFn c_gsk_gl_shader_get_n_textures; ///
private alias c_gsk_gl_shader_get_n_uniformsFn = extern(C) int function(GskGLShader* shader) nothrow;
__gshared c_gsk_gl_shader_get_n_uniformsFn c_gsk_gl_shader_get_n_uniforms; ///
private alias c_gsk_gl_shader_get_resourceFn = extern(C) const(char)* function(GskGLShader* shader) nothrow;
__gshared c_gsk_gl_shader_get_resourceFn c_gsk_gl_shader_get_resource; ///
private alias c_gsk_gl_shader_get_sourceFn = extern(C) GBytes* function(GskGLShader* shader) nothrow;
__gshared c_gsk_gl_shader_get_sourceFn c_gsk_gl_shader_get_source; ///
private alias c_gsk_gl_shader_get_uniform_nameFn = extern(C) const(char)* function(GskGLShader* shader, int idx) nothrow;
__gshared c_gsk_gl_shader_get_uniform_nameFn c_gsk_gl_shader_get_uniform_name; ///
private alias c_gsk_gl_shader_get_uniform_offsetFn = extern(C) int function(GskGLShader* shader, int idx) nothrow;
__gshared c_gsk_gl_shader_get_uniform_offsetFn c_gsk_gl_shader_get_uniform_offset; ///
private alias c_gsk_gl_shader_get_uniform_typeFn = extern(C) GskGLUniformType function(GskGLShader* shader, int idx) nothrow;
__gshared c_gsk_gl_shader_get_uniform_typeFn c_gsk_gl_shader_get_uniform_type; ///

// GLShaderNode
private alias c_gsk_gl_shader_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_gl_shader_node_get_typeFn c_gsk_gl_shader_node_get_type; ///
private alias c_gsk_gl_shader_node_newFn = extern(C) GskRenderNode* function(GskGLShader* shader, const(graphene_rect_t)* bounds, GBytes* args, GskRenderNode** children, uint nChildren) nothrow;
__gshared c_gsk_gl_shader_node_newFn c_gsk_gl_shader_node_new; ///
private alias c_gsk_gl_shader_node_get_argsFn = extern(C) GBytes* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_gl_shader_node_get_argsFn c_gsk_gl_shader_node_get_args; ///
private alias c_gsk_gl_shader_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node, uint idx) nothrow;
__gshared c_gsk_gl_shader_node_get_childFn c_gsk_gl_shader_node_get_child; ///
private alias c_gsk_gl_shader_node_get_n_childrenFn = extern(C) uint function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_gl_shader_node_get_n_childrenFn c_gsk_gl_shader_node_get_n_children; ///
private alias c_gsk_gl_shader_node_get_shaderFn = extern(C) GskGLShader* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_gl_shader_node_get_shaderFn c_gsk_gl_shader_node_get_shader; ///

// InsetShadowNode
private alias c_gsk_inset_shadow_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_inset_shadow_node_get_typeFn c_gsk_inset_shadow_node_get_type; ///
private alias c_gsk_inset_shadow_node_newFn = extern(C) GskRenderNode* function(const(GskRoundedRect)* outline, const(GdkRGBA)* color, float dx, float dy, float spread, float blurRadius) nothrow;
__gshared c_gsk_inset_shadow_node_newFn c_gsk_inset_shadow_node_new; ///
private alias c_gsk_inset_shadow_node_get_blur_radiusFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_blur_radiusFn c_gsk_inset_shadow_node_get_blur_radius; ///
private alias c_gsk_inset_shadow_node_get_colorFn = extern(C) const(GdkRGBA)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_colorFn c_gsk_inset_shadow_node_get_color; ///
private alias c_gsk_inset_shadow_node_get_dxFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_dxFn c_gsk_inset_shadow_node_get_dx; ///
private alias c_gsk_inset_shadow_node_get_dyFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_dyFn c_gsk_inset_shadow_node_get_dy; ///
private alias c_gsk_inset_shadow_node_get_outlineFn = extern(C) const(GskRoundedRect)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_outlineFn c_gsk_inset_shadow_node_get_outline; ///
private alias c_gsk_inset_shadow_node_get_spreadFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_inset_shadow_node_get_spreadFn c_gsk_inset_shadow_node_get_spread; ///

// IsolationNode
private alias c_gsk_isolation_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_isolation_node_get_typeFn c_gsk_isolation_node_get_type; ///
private alias c_gsk_isolation_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, GskIsolation isolations) nothrow;
__gshared c_gsk_isolation_node_newFn c_gsk_isolation_node_new; ///
private alias c_gsk_isolation_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_isolation_node_get_childFn c_gsk_isolation_node_get_child; ///
private alias c_gsk_isolation_node_get_isolationsFn = extern(C) GskIsolation function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_isolation_node_get_isolationsFn c_gsk_isolation_node_get_isolations; ///

// LinearGradientNode
private alias c_gsk_linear_gradient_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_linear_gradient_node_get_typeFn c_gsk_linear_gradient_node_get_type; ///
private alias c_gsk_linear_gradient_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* start, const(graphene_point_t)* end, const(GskColorStop)* colorStops, size_t nColorStops) nothrow;
__gshared c_gsk_linear_gradient_node_newFn c_gsk_linear_gradient_node_new; ///
private alias c_gsk_linear_gradient_node_get_color_stopsFn = extern(C) const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) nothrow;
__gshared c_gsk_linear_gradient_node_get_color_stopsFn c_gsk_linear_gradient_node_get_color_stops; ///
private alias c_gsk_linear_gradient_node_get_endFn = extern(C) const(graphene_point_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_linear_gradient_node_get_endFn c_gsk_linear_gradient_node_get_end; ///
private alias c_gsk_linear_gradient_node_get_n_color_stopsFn = extern(C) size_t function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_linear_gradient_node_get_n_color_stopsFn c_gsk_linear_gradient_node_get_n_color_stops; ///
private alias c_gsk_linear_gradient_node_get_startFn = extern(C) const(graphene_point_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_linear_gradient_node_get_startFn c_gsk_linear_gradient_node_get_start; ///

// MaskNode
private alias c_gsk_mask_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_mask_node_get_typeFn c_gsk_mask_node_get_type; ///
private alias c_gsk_mask_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* source, GskRenderNode* mask, GskMaskMode maskMode) nothrow;
__gshared c_gsk_mask_node_newFn c_gsk_mask_node_new; ///
private alias c_gsk_mask_node_get_maskFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_mask_node_get_maskFn c_gsk_mask_node_get_mask; ///
private alias c_gsk_mask_node_get_mask_modeFn = extern(C) GskMaskMode function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_mask_node_get_mask_modeFn c_gsk_mask_node_get_mask_mode; ///
private alias c_gsk_mask_node_get_sourceFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_mask_node_get_sourceFn c_gsk_mask_node_get_source; ///

// NglRenderer
private alias c_gsk_ngl_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_ngl_renderer_get_typeFn c_gsk_ngl_renderer_get_type; ///
private alias c_gsk_ngl_renderer_newFn = extern(C) GskRenderer* function() nothrow;
__gshared c_gsk_ngl_renderer_newFn c_gsk_ngl_renderer_new; ///

// OpacityNode
private alias c_gsk_opacity_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_opacity_node_get_typeFn c_gsk_opacity_node_get_type; ///
private alias c_gsk_opacity_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, float opacity) nothrow;
__gshared c_gsk_opacity_node_newFn c_gsk_opacity_node_new; ///
private alias c_gsk_opacity_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_opacity_node_get_childFn c_gsk_opacity_node_get_child; ///
private alias c_gsk_opacity_node_get_opacityFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_opacity_node_get_opacityFn c_gsk_opacity_node_get_opacity; ///

// OutsetShadowNode
private alias c_gsk_outset_shadow_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_outset_shadow_node_get_typeFn c_gsk_outset_shadow_node_get_type; ///
private alias c_gsk_outset_shadow_node_newFn = extern(C) GskRenderNode* function(const(GskRoundedRect)* outline, const(GdkRGBA)* color, float dx, float dy, float spread, float blurRadius) nothrow;
__gshared c_gsk_outset_shadow_node_newFn c_gsk_outset_shadow_node_new; ///
private alias c_gsk_outset_shadow_node_get_blur_radiusFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_blur_radiusFn c_gsk_outset_shadow_node_get_blur_radius; ///
private alias c_gsk_outset_shadow_node_get_colorFn = extern(C) const(GdkRGBA)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_colorFn c_gsk_outset_shadow_node_get_color; ///
private alias c_gsk_outset_shadow_node_get_dxFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_dxFn c_gsk_outset_shadow_node_get_dx; ///
private alias c_gsk_outset_shadow_node_get_dyFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_dyFn c_gsk_outset_shadow_node_get_dy; ///
private alias c_gsk_outset_shadow_node_get_outlineFn = extern(C) const(GskRoundedRect)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_outlineFn c_gsk_outset_shadow_node_get_outline; ///
private alias c_gsk_outset_shadow_node_get_spreadFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_outset_shadow_node_get_spreadFn c_gsk_outset_shadow_node_get_spread; ///

// PasteNode
private alias c_gsk_paste_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_paste_node_get_typeFn c_gsk_paste_node_get_type; ///
private alias c_gsk_paste_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, size_t depth) nothrow;
__gshared c_gsk_paste_node_newFn c_gsk_paste_node_new; ///
private alias c_gsk_paste_node_get_depthFn = extern(C) size_t function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_paste_node_get_depthFn c_gsk_paste_node_get_depth; ///

// Path
private alias c_gsk_path_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_path_get_typeFn c_gsk_path_get_type; ///
private alias c_gsk_path_equalFn = extern(C) gboolean function(const(GskPath)* path1, const(GskPath)* path2) nothrow;
__gshared c_gsk_path_equalFn c_gsk_path_equal; ///
private alias c_gsk_path_foreachFn = extern(C) gboolean function(GskPath* self, GskPathForeachFlags flags, GskPathForeachFunc func, void* userData) nothrow;
__gshared c_gsk_path_foreachFn c_gsk_path_foreach; ///
private alias c_gsk_path_foreach_intersectionFn = extern(C) gboolean function(GskPath* path1, GskPath* path2, GskPathIntersectionFunc func, void* userData) nothrow;
__gshared c_gsk_path_foreach_intersectionFn c_gsk_path_foreach_intersection; ///
private alias c_gsk_path_get_boundsFn = extern(C) gboolean function(GskPath* self, graphene_rect_t* bounds) nothrow;
__gshared c_gsk_path_get_boundsFn c_gsk_path_get_bounds; ///
private alias c_gsk_path_get_closest_pointFn = extern(C) gboolean function(GskPath* self, const(graphene_point_t)* point, float threshold, GskPathPoint* result, float* distance) nothrow;
__gshared c_gsk_path_get_closest_pointFn c_gsk_path_get_closest_point; ///
private alias c_gsk_path_get_end_pointFn = extern(C) gboolean function(GskPath* self, GskPathPoint* result) nothrow;
__gshared c_gsk_path_get_end_pointFn c_gsk_path_get_end_point; ///
private alias c_gsk_path_get_nextFn = extern(C) gboolean function(GskPath* self, GskPathPoint* point) nothrow;
__gshared c_gsk_path_get_nextFn c_gsk_path_get_next; ///
private alias c_gsk_path_get_previousFn = extern(C) gboolean function(GskPath* self, GskPathPoint* point) nothrow;
__gshared c_gsk_path_get_previousFn c_gsk_path_get_previous; ///
private alias c_gsk_path_get_start_pointFn = extern(C) gboolean function(GskPath* self, GskPathPoint* result) nothrow;
__gshared c_gsk_path_get_start_pointFn c_gsk_path_get_start_point; ///
private alias c_gsk_path_get_stroke_boundsFn = extern(C) gboolean function(GskPath* self, const(GskStroke)* stroke, graphene_rect_t* bounds) nothrow;
__gshared c_gsk_path_get_stroke_boundsFn c_gsk_path_get_stroke_bounds; ///
private alias c_gsk_path_get_tight_boundsFn = extern(C) gboolean function(GskPath* self, graphene_rect_t* bounds) nothrow;
__gshared c_gsk_path_get_tight_boundsFn c_gsk_path_get_tight_bounds; ///
private alias c_gsk_path_in_fillFn = extern(C) gboolean function(GskPath* self, const(graphene_point_t)* point, GskFillRule fillRule) nothrow;
__gshared c_gsk_path_in_fillFn c_gsk_path_in_fill; ///
private alias c_gsk_path_is_closedFn = extern(C) gboolean function(GskPath* self) nothrow;
__gshared c_gsk_path_is_closedFn c_gsk_path_is_closed; ///
private alias c_gsk_path_is_emptyFn = extern(C) gboolean function(GskPath* self) nothrow;
__gshared c_gsk_path_is_emptyFn c_gsk_path_is_empty; ///
private alias c_gsk_path_printFn = extern(C) void function(GskPath* self, GString* string_) nothrow;
__gshared c_gsk_path_printFn c_gsk_path_print; ///
private alias c_gsk_path_refFn = extern(C) GskPath* function(GskPath* self) nothrow;
__gshared c_gsk_path_refFn c_gsk_path_ref; ///
private alias c_gsk_path_to_cairoFn = extern(C) void function(GskPath* self, cairo_t* cr) nothrow;
__gshared c_gsk_path_to_cairoFn c_gsk_path_to_cairo; ///
private alias c_gsk_path_to_stringFn = extern(C) char* function(GskPath* self) nothrow;
__gshared c_gsk_path_to_stringFn c_gsk_path_to_string; ///
private alias c_gsk_path_unrefFn = extern(C) void function(GskPath* self) nothrow;
__gshared c_gsk_path_unrefFn c_gsk_path_unref; ///
private alias c_gsk_path_parseFn = extern(C) GskPath* function(const(char)* string_) nothrow;
__gshared c_gsk_path_parseFn c_gsk_path_parse; ///

// PathBuilder
private alias c_gsk_path_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_path_builder_get_typeFn c_gsk_path_builder_get_type; ///
private alias c_gsk_path_builder_newFn = extern(C) GskPathBuilder* function() nothrow;
__gshared c_gsk_path_builder_newFn c_gsk_path_builder_new; ///
private alias c_gsk_path_builder_add_cairo_pathFn = extern(C) void function(GskPathBuilder* self, const(cairo_path_t)* path) nothrow;
__gshared c_gsk_path_builder_add_cairo_pathFn c_gsk_path_builder_add_cairo_path; ///
private alias c_gsk_path_builder_add_circleFn = extern(C) void function(GskPathBuilder* self, const(graphene_point_t)* center, float radius) nothrow;
__gshared c_gsk_path_builder_add_circleFn c_gsk_path_builder_add_circle; ///
private alias c_gsk_path_builder_add_layoutFn = extern(C) void function(GskPathBuilder* self, PangoLayout* layout) nothrow;
__gshared c_gsk_path_builder_add_layoutFn c_gsk_path_builder_add_layout; ///
private alias c_gsk_path_builder_add_pathFn = extern(C) void function(GskPathBuilder* self, GskPath* path) nothrow;
__gshared c_gsk_path_builder_add_pathFn c_gsk_path_builder_add_path; ///
private alias c_gsk_path_builder_add_rectFn = extern(C) void function(GskPathBuilder* self, const(graphene_rect_t)* rect) nothrow;
__gshared c_gsk_path_builder_add_rectFn c_gsk_path_builder_add_rect; ///
private alias c_gsk_path_builder_add_reverse_pathFn = extern(C) void function(GskPathBuilder* self, GskPath* path) nothrow;
__gshared c_gsk_path_builder_add_reverse_pathFn c_gsk_path_builder_add_reverse_path; ///
private alias c_gsk_path_builder_add_rounded_rectFn = extern(C) void function(GskPathBuilder* self, const(GskRoundedRect)* rect) nothrow;
__gshared c_gsk_path_builder_add_rounded_rectFn c_gsk_path_builder_add_rounded_rect; ///
private alias c_gsk_path_builder_add_segmentFn = extern(C) void function(GskPathBuilder* self, GskPath* path, const(GskPathPoint)* start, const(GskPathPoint)* end) nothrow;
__gshared c_gsk_path_builder_add_segmentFn c_gsk_path_builder_add_segment; ///
private alias c_gsk_path_builder_arc_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) nothrow;
__gshared c_gsk_path_builder_arc_toFn c_gsk_path_builder_arc_to; ///
private alias c_gsk_path_builder_closeFn = extern(C) void function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_closeFn c_gsk_path_builder_close; ///
private alias c_gsk_path_builder_conic_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float weight) nothrow;
__gshared c_gsk_path_builder_conic_toFn c_gsk_path_builder_conic_to; ///
private alias c_gsk_path_builder_cubic_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float x3, float y3) nothrow;
__gshared c_gsk_path_builder_cubic_toFn c_gsk_path_builder_cubic_to; ///
private alias c_gsk_path_builder_free_to_pathFn = extern(C) GskPath* function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_free_to_pathFn c_gsk_path_builder_free_to_path; ///
private alias c_gsk_path_builder_get_current_pointFn = extern(C) const(graphene_point_t)* function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_get_current_pointFn c_gsk_path_builder_get_current_point; ///
private alias c_gsk_path_builder_html_arc_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float radius) nothrow;
__gshared c_gsk_path_builder_html_arc_toFn c_gsk_path_builder_html_arc_to; ///
private alias c_gsk_path_builder_line_toFn = extern(C) void function(GskPathBuilder* self, float x, float y) nothrow;
__gshared c_gsk_path_builder_line_toFn c_gsk_path_builder_line_to; ///
private alias c_gsk_path_builder_move_toFn = extern(C) void function(GskPathBuilder* self, float x, float y) nothrow;
__gshared c_gsk_path_builder_move_toFn c_gsk_path_builder_move_to; ///
private alias c_gsk_path_builder_quad_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) nothrow;
__gshared c_gsk_path_builder_quad_toFn c_gsk_path_builder_quad_to; ///
private alias c_gsk_path_builder_refFn = extern(C) GskPathBuilder* function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_refFn c_gsk_path_builder_ref; ///
private alias c_gsk_path_builder_rel_arc_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) nothrow;
__gshared c_gsk_path_builder_rel_arc_toFn c_gsk_path_builder_rel_arc_to; ///
private alias c_gsk_path_builder_rel_conic_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float weight) nothrow;
__gshared c_gsk_path_builder_rel_conic_toFn c_gsk_path_builder_rel_conic_to; ///
private alias c_gsk_path_builder_rel_cubic_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float x3, float y3) nothrow;
__gshared c_gsk_path_builder_rel_cubic_toFn c_gsk_path_builder_rel_cubic_to; ///
private alias c_gsk_path_builder_rel_html_arc_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2, float radius) nothrow;
__gshared c_gsk_path_builder_rel_html_arc_toFn c_gsk_path_builder_rel_html_arc_to; ///
private alias c_gsk_path_builder_rel_line_toFn = extern(C) void function(GskPathBuilder* self, float x, float y) nothrow;
__gshared c_gsk_path_builder_rel_line_toFn c_gsk_path_builder_rel_line_to; ///
private alias c_gsk_path_builder_rel_move_toFn = extern(C) void function(GskPathBuilder* self, float x, float y) nothrow;
__gshared c_gsk_path_builder_rel_move_toFn c_gsk_path_builder_rel_move_to; ///
private alias c_gsk_path_builder_rel_quad_toFn = extern(C) void function(GskPathBuilder* self, float x1, float y1, float x2, float y2) nothrow;
__gshared c_gsk_path_builder_rel_quad_toFn c_gsk_path_builder_rel_quad_to; ///
private alias c_gsk_path_builder_rel_svg_arc_toFn = extern(C) void function(GskPathBuilder* self, float rx, float ry, float xAxisRotation, gboolean largeArc, gboolean positiveSweep, float x, float y) nothrow;
__gshared c_gsk_path_builder_rel_svg_arc_toFn c_gsk_path_builder_rel_svg_arc_to; ///
private alias c_gsk_path_builder_svg_arc_toFn = extern(C) void function(GskPathBuilder* self, float rx, float ry, float xAxisRotation, gboolean largeArc, gboolean positiveSweep, float x, float y) nothrow;
__gshared c_gsk_path_builder_svg_arc_toFn c_gsk_path_builder_svg_arc_to; ///
private alias c_gsk_path_builder_to_pathFn = extern(C) GskPath* function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_to_pathFn c_gsk_path_builder_to_path; ///
private alias c_gsk_path_builder_unrefFn = extern(C) void function(GskPathBuilder* self) nothrow;
__gshared c_gsk_path_builder_unrefFn c_gsk_path_builder_unref; ///

// PathMeasure
private alias c_gsk_path_measure_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_path_measure_get_typeFn c_gsk_path_measure_get_type; ///
private alias c_gsk_path_measure_newFn = extern(C) GskPathMeasure* function(GskPath* path) nothrow;
__gshared c_gsk_path_measure_newFn c_gsk_path_measure_new; ///
private alias c_gsk_path_measure_new_with_toleranceFn = extern(C) GskPathMeasure* function(GskPath* path, float tolerance) nothrow;
__gshared c_gsk_path_measure_new_with_toleranceFn c_gsk_path_measure_new_with_tolerance; ///
private alias c_gsk_path_measure_get_lengthFn = extern(C) float function(GskPathMeasure* self) nothrow;
__gshared c_gsk_path_measure_get_lengthFn c_gsk_path_measure_get_length; ///
private alias c_gsk_path_measure_get_pathFn = extern(C) GskPath* function(GskPathMeasure* self) nothrow;
__gshared c_gsk_path_measure_get_pathFn c_gsk_path_measure_get_path; ///
private alias c_gsk_path_measure_get_pointFn = extern(C) gboolean function(GskPathMeasure* self, float distance, GskPathPoint* result) nothrow;
__gshared c_gsk_path_measure_get_pointFn c_gsk_path_measure_get_point; ///
private alias c_gsk_path_measure_get_toleranceFn = extern(C) float function(GskPathMeasure* self) nothrow;
__gshared c_gsk_path_measure_get_toleranceFn c_gsk_path_measure_get_tolerance; ///
private alias c_gsk_path_measure_refFn = extern(C) GskPathMeasure* function(GskPathMeasure* self) nothrow;
__gshared c_gsk_path_measure_refFn c_gsk_path_measure_ref; ///
private alias c_gsk_path_measure_unrefFn = extern(C) void function(GskPathMeasure* self) nothrow;
__gshared c_gsk_path_measure_unrefFn c_gsk_path_measure_unref; ///

// PathPoint
private alias c_gsk_path_point_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_path_point_get_typeFn c_gsk_path_point_get_type; ///
private alias c_gsk_path_point_compareFn = extern(C) int function(const(GskPathPoint)* point1, const(GskPathPoint)* point2) nothrow;
__gshared c_gsk_path_point_compareFn c_gsk_path_point_compare; ///
private alias c_gsk_path_point_copyFn = extern(C) GskPathPoint* function(GskPathPoint* point) nothrow;
__gshared c_gsk_path_point_copyFn c_gsk_path_point_copy; ///
private alias c_gsk_path_point_equalFn = extern(C) gboolean function(const(GskPathPoint)* point1, const(GskPathPoint)* point2) nothrow;
__gshared c_gsk_path_point_equalFn c_gsk_path_point_equal; ///
private alias c_gsk_path_point_freeFn = extern(C) void function(GskPathPoint* point) nothrow;
__gshared c_gsk_path_point_freeFn c_gsk_path_point_free; ///
private alias c_gsk_path_point_get_curvatureFn = extern(C) float function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction, graphene_point_t* center) nothrow;
__gshared c_gsk_path_point_get_curvatureFn c_gsk_path_point_get_curvature; ///
private alias c_gsk_path_point_get_distanceFn = extern(C) float function(const(GskPathPoint)* point, GskPathMeasure* measure) nothrow;
__gshared c_gsk_path_point_get_distanceFn c_gsk_path_point_get_distance; ///
private alias c_gsk_path_point_get_positionFn = extern(C) void function(const(GskPathPoint)* point, GskPath* path, graphene_point_t* position) nothrow;
__gshared c_gsk_path_point_get_positionFn c_gsk_path_point_get_position; ///
private alias c_gsk_path_point_get_rotationFn = extern(C) float function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction) nothrow;
__gshared c_gsk_path_point_get_rotationFn c_gsk_path_point_get_rotation; ///
private alias c_gsk_path_point_get_tangentFn = extern(C) void function(const(GskPathPoint)* point, GskPath* path, GskPathDirection direction, graphene_vec2_t* tangent) nothrow;
__gshared c_gsk_path_point_get_tangentFn c_gsk_path_point_get_tangent; ///

// RadialGradientNode
private alias c_gsk_radial_gradient_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_radial_gradient_node_get_typeFn c_gsk_radial_gradient_node_get_type; ///
private alias c_gsk_radial_gradient_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float hradius, float vradius, float start, float end, const(GskColorStop)* colorStops, size_t nColorStops) nothrow;
__gshared c_gsk_radial_gradient_node_newFn c_gsk_radial_gradient_node_new; ///
private alias c_gsk_radial_gradient_node_get_centerFn = extern(C) const(graphene_point_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_centerFn c_gsk_radial_gradient_node_get_center; ///
private alias c_gsk_radial_gradient_node_get_color_stopsFn = extern(C) const(GskColorStop)* function(const(GskRenderNode)* node, size_t* nStops) nothrow;
__gshared c_gsk_radial_gradient_node_get_color_stopsFn c_gsk_radial_gradient_node_get_color_stops; ///
private alias c_gsk_radial_gradient_node_get_endFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_endFn c_gsk_radial_gradient_node_get_end; ///
private alias c_gsk_radial_gradient_node_get_hradiusFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_hradiusFn c_gsk_radial_gradient_node_get_hradius; ///
private alias c_gsk_radial_gradient_node_get_n_color_stopsFn = extern(C) size_t function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_n_color_stopsFn c_gsk_radial_gradient_node_get_n_color_stops; ///
private alias c_gsk_radial_gradient_node_get_startFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_startFn c_gsk_radial_gradient_node_get_start; ///
private alias c_gsk_radial_gradient_node_get_vradiusFn = extern(C) float function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_radial_gradient_node_get_vradiusFn c_gsk_radial_gradient_node_get_vradius; ///

// RenderNode
private alias c_gsk_render_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_render_node_get_typeFn c_gsk_render_node_get_type; ///
private alias c_gsk_render_node_deserializeFn = extern(C) GskRenderNode* function(GBytes* bytes, GskParseErrorFunc errorFunc, void* userData) nothrow;
__gshared c_gsk_render_node_deserializeFn c_gsk_render_node_deserialize; ///
private alias c_gsk_render_node_drawFn = extern(C) void function(GskRenderNode* node, cairo_t* cr) nothrow;
__gshared c_gsk_render_node_drawFn c_gsk_render_node_draw; ///
private alias c_gsk_render_node_get_boundsFn = extern(C) void function(GskRenderNode* node, graphene_rect_t* bounds) nothrow;
__gshared c_gsk_render_node_get_boundsFn c_gsk_render_node_get_bounds; ///
private alias c_gsk_render_node_get_childrenFn = extern(C) GskRenderNode** function(GskRenderNode* self, size_t* nChildren) nothrow;
__gshared c_gsk_render_node_get_childrenFn c_gsk_render_node_get_children; ///
private alias c_gsk_render_node_get_node_typeFn = extern(C) GskRenderNodeType function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_render_node_get_node_typeFn c_gsk_render_node_get_node_type; ///
private alias c_gsk_render_node_get_opaque_rectFn = extern(C) gboolean function(GskRenderNode* self, graphene_rect_t* outOpaque) nothrow;
__gshared c_gsk_render_node_get_opaque_rectFn c_gsk_render_node_get_opaque_rect; ///
private alias c_gsk_render_node_refFn = extern(C) GskRenderNode* function(GskRenderNode* node) nothrow;
__gshared c_gsk_render_node_refFn c_gsk_render_node_ref; ///
private alias c_gsk_render_node_serializeFn = extern(C) GBytes* function(GskRenderNode* node) nothrow;
__gshared c_gsk_render_node_serializeFn c_gsk_render_node_serialize; ///
private alias c_gsk_render_node_unrefFn = extern(C) void function(GskRenderNode* node) nothrow;
__gshared c_gsk_render_node_unrefFn c_gsk_render_node_unref; ///
private alias c_gsk_render_node_write_to_fileFn = extern(C) gboolean function(GskRenderNode* node, const(char)* filename, GError** _err) nothrow;
__gshared c_gsk_render_node_write_to_fileFn c_gsk_render_node_write_to_file; ///

// RenderReplay
private alias c_gsk_render_replay_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_render_replay_get_typeFn c_gsk_render_replay_get_type; ///
private alias c_gsk_render_replay_newFn = extern(C) GskRenderReplay* function() nothrow;
__gshared c_gsk_render_replay_newFn c_gsk_render_replay_new; ///
private alias c_gsk_render_replay_defaultFn = extern(C) GskRenderNode* function(GskRenderReplay* self, GskRenderNode* node) nothrow;
__gshared c_gsk_render_replay_defaultFn c_gsk_render_replay_default; ///
private alias c_gsk_render_replay_filter_fontFn = extern(C) PangoFont* function(GskRenderReplay* self, PangoFont* font) nothrow;
__gshared c_gsk_render_replay_filter_fontFn c_gsk_render_replay_filter_font; ///
private alias c_gsk_render_replay_filter_nodeFn = extern(C) GskRenderNode* function(GskRenderReplay* self, GskRenderNode* node) nothrow;
__gshared c_gsk_render_replay_filter_nodeFn c_gsk_render_replay_filter_node; ///
private alias c_gsk_render_replay_filter_textureFn = extern(C) GdkTexture* function(GskRenderReplay* self, GdkTexture* texture) nothrow;
__gshared c_gsk_render_replay_filter_textureFn c_gsk_render_replay_filter_texture; ///
private alias c_gsk_render_replay_freeFn = extern(C) void function(GskRenderReplay* self) nothrow;
__gshared c_gsk_render_replay_freeFn c_gsk_render_replay_free; ///
private alias c_gsk_render_replay_set_font_filterFn = extern(C) void function(GskRenderReplay* self, GskRenderReplayFontFilter filter, void* userData, GDestroyNotify userDestroy) nothrow;
__gshared c_gsk_render_replay_set_font_filterFn c_gsk_render_replay_set_font_filter; ///
private alias c_gsk_render_replay_set_node_filterFn = extern(C) void function(GskRenderReplay* self, GskRenderReplayNodeFilter filter, void* userData, GDestroyNotify userDestroy) nothrow;
__gshared c_gsk_render_replay_set_node_filterFn c_gsk_render_replay_set_node_filter; ///
private alias c_gsk_render_replay_set_texture_filterFn = extern(C) void function(GskRenderReplay* self, GskRenderReplayTextureFilter filter, void* userData, GDestroyNotify userDestroy) nothrow;
__gshared c_gsk_render_replay_set_texture_filterFn c_gsk_render_replay_set_texture_filter; ///

// Renderer
private alias c_gsk_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_renderer_get_typeFn c_gsk_renderer_get_type; ///
private alias c_gsk_renderer_new_for_surfaceFn = extern(C) GskRenderer* function(GdkSurface* surface) nothrow;
__gshared c_gsk_renderer_new_for_surfaceFn c_gsk_renderer_new_for_surface; ///
private alias c_gsk_renderer_get_surfaceFn = extern(C) GdkSurface* function(GskRenderer* renderer) nothrow;
__gshared c_gsk_renderer_get_surfaceFn c_gsk_renderer_get_surface; ///
private alias c_gsk_renderer_is_realizedFn = extern(C) gboolean function(GskRenderer* renderer) nothrow;
__gshared c_gsk_renderer_is_realizedFn c_gsk_renderer_is_realized; ///
private alias c_gsk_renderer_realizeFn = extern(C) gboolean function(GskRenderer* renderer, GdkSurface* surface, GError** _err) nothrow;
__gshared c_gsk_renderer_realizeFn c_gsk_renderer_realize; ///
private alias c_gsk_renderer_realize_for_displayFn = extern(C) gboolean function(GskRenderer* renderer, GdkDisplay* display, GError** _err) nothrow;
__gshared c_gsk_renderer_realize_for_displayFn c_gsk_renderer_realize_for_display; ///
private alias c_gsk_renderer_renderFn = extern(C) void function(GskRenderer* renderer, GskRenderNode* root, const(cairo_region_t)* region) nothrow;
__gshared c_gsk_renderer_renderFn c_gsk_renderer_render; ///
private alias c_gsk_renderer_render_textureFn = extern(C) GdkTexture* function(GskRenderer* renderer, GskRenderNode* root, const(graphene_rect_t)* viewport) nothrow;
__gshared c_gsk_renderer_render_textureFn c_gsk_renderer_render_texture; ///
private alias c_gsk_renderer_unrealizeFn = extern(C) void function(GskRenderer* renderer) nothrow;
__gshared c_gsk_renderer_unrealizeFn c_gsk_renderer_unrealize; ///

// RepeatNode
private alias c_gsk_repeat_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_repeat_node_get_typeFn c_gsk_repeat_node_get_type; ///
private alias c_gsk_repeat_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, GskRenderNode* child, const(graphene_rect_t)* childBounds) nothrow;
__gshared c_gsk_repeat_node_newFn c_gsk_repeat_node_new; ///
private alias c_gsk_repeat_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_repeat_node_get_childFn c_gsk_repeat_node_get_child; ///
private alias c_gsk_repeat_node_get_child_boundsFn = extern(C) const(graphene_rect_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_repeat_node_get_child_boundsFn c_gsk_repeat_node_get_child_bounds; ///

// RepeatingLinearGradientNode
private alias c_gsk_repeating_linear_gradient_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_repeating_linear_gradient_node_get_typeFn c_gsk_repeating_linear_gradient_node_get_type; ///
private alias c_gsk_repeating_linear_gradient_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* start, const(graphene_point_t)* end, const(GskColorStop)* colorStops, size_t nColorStops) nothrow;
__gshared c_gsk_repeating_linear_gradient_node_newFn c_gsk_repeating_linear_gradient_node_new; ///

// RepeatingRadialGradientNode
private alias c_gsk_repeating_radial_gradient_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_repeating_radial_gradient_node_get_typeFn c_gsk_repeating_radial_gradient_node_get_type; ///
private alias c_gsk_repeating_radial_gradient_node_newFn = extern(C) GskRenderNode* function(const(graphene_rect_t)* bounds, const(graphene_point_t)* center, float hradius, float vradius, float start, float end, const(GskColorStop)* colorStops, size_t nColorStops) nothrow;
__gshared c_gsk_repeating_radial_gradient_node_newFn c_gsk_repeating_radial_gradient_node_new; ///

// RoundedClipNode
private alias c_gsk_rounded_clip_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_rounded_clip_node_get_typeFn c_gsk_rounded_clip_node_get_type; ///
private alias c_gsk_rounded_clip_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, const(GskRoundedRect)* clip) nothrow;
__gshared c_gsk_rounded_clip_node_newFn c_gsk_rounded_clip_node_new; ///
private alias c_gsk_rounded_clip_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_rounded_clip_node_get_childFn c_gsk_rounded_clip_node_get_child; ///
private alias c_gsk_rounded_clip_node_get_clipFn = extern(C) const(GskRoundedRect)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_rounded_clip_node_get_clipFn c_gsk_rounded_clip_node_get_clip; ///

// RoundedRect
private alias c_gsk_rounded_rect_contains_pointFn = extern(C) gboolean function(const(GskRoundedRect)* self, const(graphene_point_t)* point) nothrow;
__gshared c_gsk_rounded_rect_contains_pointFn c_gsk_rounded_rect_contains_point; ///
private alias c_gsk_rounded_rect_contains_rectFn = extern(C) gboolean function(const(GskRoundedRect)* self, const(graphene_rect_t)* rect) nothrow;
__gshared c_gsk_rounded_rect_contains_rectFn c_gsk_rounded_rect_contains_rect; ///
private alias c_gsk_rounded_rect_initFn = extern(C) GskRoundedRect* function(GskRoundedRect* self, const(graphene_rect_t)* bounds, const(graphene_size_t)* topLeft, const(graphene_size_t)* topRight, const(graphene_size_t)* bottomRight, const(graphene_size_t)* bottomLeft) nothrow;
__gshared c_gsk_rounded_rect_initFn c_gsk_rounded_rect_init; ///
private alias c_gsk_rounded_rect_init_copyFn = extern(C) GskRoundedRect* function(GskRoundedRect* self, const(GskRoundedRect)* src) nothrow;
__gshared c_gsk_rounded_rect_init_copyFn c_gsk_rounded_rect_init_copy; ///
private alias c_gsk_rounded_rect_init_from_rectFn = extern(C) GskRoundedRect* function(GskRoundedRect* self, const(graphene_rect_t)* bounds, float radius) nothrow;
__gshared c_gsk_rounded_rect_init_from_rectFn c_gsk_rounded_rect_init_from_rect; ///
private alias c_gsk_rounded_rect_intersects_rectFn = extern(C) gboolean function(const(GskRoundedRect)* self, const(graphene_rect_t)* rect) nothrow;
__gshared c_gsk_rounded_rect_intersects_rectFn c_gsk_rounded_rect_intersects_rect; ///
private alias c_gsk_rounded_rect_is_rectilinearFn = extern(C) gboolean function(const(GskRoundedRect)* self) nothrow;
__gshared c_gsk_rounded_rect_is_rectilinearFn c_gsk_rounded_rect_is_rectilinear; ///
private alias c_gsk_rounded_rect_normalizeFn = extern(C) GskRoundedRect* function(GskRoundedRect* self) nothrow;
__gshared c_gsk_rounded_rect_normalizeFn c_gsk_rounded_rect_normalize; ///
private alias c_gsk_rounded_rect_offsetFn = extern(C) GskRoundedRect* function(GskRoundedRect* self, float dx, float dy) nothrow;
__gshared c_gsk_rounded_rect_offsetFn c_gsk_rounded_rect_offset; ///
private alias c_gsk_rounded_rect_shrinkFn = extern(C) GskRoundedRect* function(GskRoundedRect* self, float top, float right, float bottom, float left) nothrow;
__gshared c_gsk_rounded_rect_shrinkFn c_gsk_rounded_rect_shrink; ///

// ShaderArgsBuilder
private alias c_gsk_shader_args_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_shader_args_builder_get_typeFn c_gsk_shader_args_builder_get_type; ///
private alias c_gsk_shader_args_builder_newFn = extern(C) GskShaderArgsBuilder* function(GskGLShader* shader, GBytes* initialValues) nothrow;
__gshared c_gsk_shader_args_builder_newFn c_gsk_shader_args_builder_new; ///
private alias c_gsk_shader_args_builder_free_to_argsFn = extern(C) GBytes* function(GskShaderArgsBuilder* builder) nothrow;
__gshared c_gsk_shader_args_builder_free_to_argsFn c_gsk_shader_args_builder_free_to_args; ///
private alias c_gsk_shader_args_builder_refFn = extern(C) GskShaderArgsBuilder* function(GskShaderArgsBuilder* builder) nothrow;
__gshared c_gsk_shader_args_builder_refFn c_gsk_shader_args_builder_ref; ///
private alias c_gsk_shader_args_builder_set_boolFn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, gboolean value) nothrow;
__gshared c_gsk_shader_args_builder_set_boolFn c_gsk_shader_args_builder_set_bool; ///
private alias c_gsk_shader_args_builder_set_floatFn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, float value) nothrow;
__gshared c_gsk_shader_args_builder_set_floatFn c_gsk_shader_args_builder_set_float; ///
private alias c_gsk_shader_args_builder_set_intFn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, int value) nothrow;
__gshared c_gsk_shader_args_builder_set_intFn c_gsk_shader_args_builder_set_int; ///
private alias c_gsk_shader_args_builder_set_uintFn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, uint value) nothrow;
__gshared c_gsk_shader_args_builder_set_uintFn c_gsk_shader_args_builder_set_uint; ///
private alias c_gsk_shader_args_builder_set_vec2Fn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec2_t)* value) nothrow;
__gshared c_gsk_shader_args_builder_set_vec2Fn c_gsk_shader_args_builder_set_vec2; ///
private alias c_gsk_shader_args_builder_set_vec3Fn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec3_t)* value) nothrow;
__gshared c_gsk_shader_args_builder_set_vec3Fn c_gsk_shader_args_builder_set_vec3; ///
private alias c_gsk_shader_args_builder_set_vec4Fn = extern(C) void function(GskShaderArgsBuilder* builder, int idx, const(graphene_vec4_t)* value) nothrow;
__gshared c_gsk_shader_args_builder_set_vec4Fn c_gsk_shader_args_builder_set_vec4; ///
private alias c_gsk_shader_args_builder_to_argsFn = extern(C) GBytes* function(GskShaderArgsBuilder* builder) nothrow;
__gshared c_gsk_shader_args_builder_to_argsFn c_gsk_shader_args_builder_to_args; ///
private alias c_gsk_shader_args_builder_unrefFn = extern(C) void function(GskShaderArgsBuilder* builder) nothrow;
__gshared c_gsk_shader_args_builder_unrefFn c_gsk_shader_args_builder_unref; ///

// ShadowNode
private alias c_gsk_shadow_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_shadow_node_get_typeFn c_gsk_shadow_node_get_type; ///
private alias c_gsk_shadow_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, const(GskShadow)* shadows, size_t nShadows) nothrow;
__gshared c_gsk_shadow_node_newFn c_gsk_shadow_node_new; ///
private alias c_gsk_shadow_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_shadow_node_get_childFn c_gsk_shadow_node_get_child; ///
private alias c_gsk_shadow_node_get_n_shadowsFn = extern(C) size_t function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_shadow_node_get_n_shadowsFn c_gsk_shadow_node_get_n_shadows; ///
private alias c_gsk_shadow_node_get_shadowFn = extern(C) const(GskShadow)* function(const(GskRenderNode)* node, size_t i) nothrow;
__gshared c_gsk_shadow_node_get_shadowFn c_gsk_shadow_node_get_shadow; ///

// Stroke
private alias c_gsk_stroke_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_stroke_get_typeFn c_gsk_stroke_get_type; ///
private alias c_gsk_stroke_newFn = extern(C) GskStroke* function(float lineWidth) nothrow;
__gshared c_gsk_stroke_newFn c_gsk_stroke_new; ///
private alias c_gsk_stroke_copyFn = extern(C) GskStroke* function(const(GskStroke)* other) nothrow;
__gshared c_gsk_stroke_copyFn c_gsk_stroke_copy; ///
private alias c_gsk_stroke_freeFn = extern(C) void function(GskStroke* self) nothrow;
__gshared c_gsk_stroke_freeFn c_gsk_stroke_free; ///
private alias c_gsk_stroke_get_dashFn = extern(C) const(float)* function(const(GskStroke)* self, size_t* nDash) nothrow;
__gshared c_gsk_stroke_get_dashFn c_gsk_stroke_get_dash; ///
private alias c_gsk_stroke_get_dash_offsetFn = extern(C) float function(const(GskStroke)* self) nothrow;
__gshared c_gsk_stroke_get_dash_offsetFn c_gsk_stroke_get_dash_offset; ///
private alias c_gsk_stroke_get_line_capFn = extern(C) GskLineCap function(const(GskStroke)* self) nothrow;
__gshared c_gsk_stroke_get_line_capFn c_gsk_stroke_get_line_cap; ///
private alias c_gsk_stroke_get_line_joinFn = extern(C) GskLineJoin function(const(GskStroke)* self) nothrow;
__gshared c_gsk_stroke_get_line_joinFn c_gsk_stroke_get_line_join; ///
private alias c_gsk_stroke_get_line_widthFn = extern(C) float function(const(GskStroke)* self) nothrow;
__gshared c_gsk_stroke_get_line_widthFn c_gsk_stroke_get_line_width; ///
private alias c_gsk_stroke_get_miter_limitFn = extern(C) float function(const(GskStroke)* self) nothrow;
__gshared c_gsk_stroke_get_miter_limitFn c_gsk_stroke_get_miter_limit; ///
private alias c_gsk_stroke_set_dashFn = extern(C) void function(GskStroke* self, const(float)* dash, size_t nDash) nothrow;
__gshared c_gsk_stroke_set_dashFn c_gsk_stroke_set_dash; ///
private alias c_gsk_stroke_set_dash_offsetFn = extern(C) void function(GskStroke* self, float offset) nothrow;
__gshared c_gsk_stroke_set_dash_offsetFn c_gsk_stroke_set_dash_offset; ///
private alias c_gsk_stroke_set_line_capFn = extern(C) void function(GskStroke* self, GskLineCap lineCap) nothrow;
__gshared c_gsk_stroke_set_line_capFn c_gsk_stroke_set_line_cap; ///
private alias c_gsk_stroke_set_line_joinFn = extern(C) void function(GskStroke* self, GskLineJoin lineJoin) nothrow;
__gshared c_gsk_stroke_set_line_joinFn c_gsk_stroke_set_line_join; ///
private alias c_gsk_stroke_set_line_widthFn = extern(C) void function(GskStroke* self, float lineWidth) nothrow;
__gshared c_gsk_stroke_set_line_widthFn c_gsk_stroke_set_line_width; ///
private alias c_gsk_stroke_set_miter_limitFn = extern(C) void function(GskStroke* self, float limit) nothrow;
__gshared c_gsk_stroke_set_miter_limitFn c_gsk_stroke_set_miter_limit; ///
private alias c_gsk_stroke_to_cairoFn = extern(C) void function(const(GskStroke)* self, cairo_t* cr) nothrow;
__gshared c_gsk_stroke_to_cairoFn c_gsk_stroke_to_cairo; ///
private alias c_gsk_stroke_equalFn = extern(C) gboolean function(const(void)* stroke1, const(void)* stroke2) nothrow;
__gshared c_gsk_stroke_equalFn c_gsk_stroke_equal; ///

// StrokeNode
private alias c_gsk_stroke_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_stroke_node_get_typeFn c_gsk_stroke_node_get_type; ///
private alias c_gsk_stroke_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, GskPath* path, const(GskStroke)* stroke) nothrow;
__gshared c_gsk_stroke_node_newFn c_gsk_stroke_node_new; ///
private alias c_gsk_stroke_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_stroke_node_get_childFn c_gsk_stroke_node_get_child; ///
private alias c_gsk_stroke_node_get_pathFn = extern(C) GskPath* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_stroke_node_get_pathFn c_gsk_stroke_node_get_path; ///
private alias c_gsk_stroke_node_get_strokeFn = extern(C) const(GskStroke)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_stroke_node_get_strokeFn c_gsk_stroke_node_get_stroke; ///

// SubsurfaceNode
private alias c_gsk_subsurface_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_subsurface_node_get_typeFn c_gsk_subsurface_node_get_type; ///
private alias c_gsk_subsurface_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, void* subsurface) nothrow;
__gshared c_gsk_subsurface_node_newFn c_gsk_subsurface_node_new; ///
private alias c_gsk_subsurface_node_get_subsurfaceFn = extern(C) void* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_subsurface_node_get_subsurfaceFn c_gsk_subsurface_node_get_subsurface; ///
private alias c_gsk_subsurface_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_subsurface_node_get_childFn c_gsk_subsurface_node_get_child; ///

// TextNode
private alias c_gsk_text_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_text_node_get_typeFn c_gsk_text_node_get_type; ///
private alias c_gsk_text_node_newFn = extern(C) GskRenderNode* function(PangoFont* font, PangoGlyphString* glyphs, const(GdkRGBA)* color, const(graphene_point_t)* offset) nothrow;
__gshared c_gsk_text_node_newFn c_gsk_text_node_new; ///
private alias c_gsk_text_node_get_colorFn = extern(C) const(GdkRGBA)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_text_node_get_colorFn c_gsk_text_node_get_color; ///
private alias c_gsk_text_node_get_fontFn = extern(C) PangoFont* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_text_node_get_fontFn c_gsk_text_node_get_font; ///
private alias c_gsk_text_node_get_glyphsFn = extern(C) const(PangoGlyphInfo)* function(const(GskRenderNode)* node, uint* nGlyphs) nothrow;
__gshared c_gsk_text_node_get_glyphsFn c_gsk_text_node_get_glyphs; ///
private alias c_gsk_text_node_get_num_glyphsFn = extern(C) uint function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_text_node_get_num_glyphsFn c_gsk_text_node_get_num_glyphs; ///
private alias c_gsk_text_node_get_offsetFn = extern(C) const(graphene_point_t)* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_text_node_get_offsetFn c_gsk_text_node_get_offset; ///
private alias c_gsk_text_node_has_color_glyphsFn = extern(C) gboolean function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_text_node_has_color_glyphsFn c_gsk_text_node_has_color_glyphs; ///

// TextureNode
private alias c_gsk_texture_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_texture_node_get_typeFn c_gsk_texture_node_get_type; ///
private alias c_gsk_texture_node_newFn = extern(C) GskRenderNode* function(GdkTexture* texture, const(graphene_rect_t)* bounds) nothrow;
__gshared c_gsk_texture_node_newFn c_gsk_texture_node_new; ///
private alias c_gsk_texture_node_get_textureFn = extern(C) GdkTexture* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_texture_node_get_textureFn c_gsk_texture_node_get_texture; ///

// TextureScaleNode
private alias c_gsk_texture_scale_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_texture_scale_node_get_typeFn c_gsk_texture_scale_node_get_type; ///
private alias c_gsk_texture_scale_node_newFn = extern(C) GskRenderNode* function(GdkTexture* texture, const(graphene_rect_t)* bounds, GskScalingFilter filter) nothrow;
__gshared c_gsk_texture_scale_node_newFn c_gsk_texture_scale_node_new; ///
private alias c_gsk_texture_scale_node_get_filterFn = extern(C) GskScalingFilter function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_texture_scale_node_get_filterFn c_gsk_texture_scale_node_get_filter; ///
private alias c_gsk_texture_scale_node_get_textureFn = extern(C) GdkTexture* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_texture_scale_node_get_textureFn c_gsk_texture_scale_node_get_texture; ///

// Transform
private alias c_gsk_transform_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_transform_get_typeFn c_gsk_transform_get_type; ///
private alias c_gsk_transform_newFn = extern(C) GskTransform* function() nothrow;
__gshared c_gsk_transform_newFn c_gsk_transform_new; ///
private alias c_gsk_transform_equalFn = extern(C) gboolean function(GskTransform* first, GskTransform* second) nothrow;
__gshared c_gsk_transform_equalFn c_gsk_transform_equal; ///
private alias c_gsk_transform_get_categoryFn = extern(C) GskTransformCategory function(GskTransform* self) nothrow;
__gshared c_gsk_transform_get_categoryFn c_gsk_transform_get_category; ///
private alias c_gsk_transform_invertFn = extern(C) GskTransform* function(GskTransform* self) nothrow;
__gshared c_gsk_transform_invertFn c_gsk_transform_invert; ///
private alias c_gsk_transform_matrixFn = extern(C) GskTransform* function(GskTransform* next, const(graphene_matrix_t)* matrix) nothrow;
__gshared c_gsk_transform_matrixFn c_gsk_transform_matrix; ///
private alias c_gsk_transform_matrix_2dFn = extern(C) GskTransform* function(GskTransform* next, float xx, float yx, float xy, float yy, float dx, float dy) nothrow;
__gshared c_gsk_transform_matrix_2dFn c_gsk_transform_matrix_2d; ///
private alias c_gsk_transform_perspectiveFn = extern(C) GskTransform* function(GskTransform* next, float depth) nothrow;
__gshared c_gsk_transform_perspectiveFn c_gsk_transform_perspective; ///
private alias c_gsk_transform_printFn = extern(C) void function(GskTransform* self, GString* string_) nothrow;
__gshared c_gsk_transform_printFn c_gsk_transform_print; ///
private alias c_gsk_transform_refFn = extern(C) GskTransform* function(GskTransform* self) nothrow;
__gshared c_gsk_transform_refFn c_gsk_transform_ref; ///
private alias c_gsk_transform_rotateFn = extern(C) GskTransform* function(GskTransform* next, float angle) nothrow;
__gshared c_gsk_transform_rotateFn c_gsk_transform_rotate; ///
private alias c_gsk_transform_rotate_3dFn = extern(C) GskTransform* function(GskTransform* next, float angle, const(graphene_vec3_t)* axis) nothrow;
__gshared c_gsk_transform_rotate_3dFn c_gsk_transform_rotate_3d; ///
private alias c_gsk_transform_scaleFn = extern(C) GskTransform* function(GskTransform* next, float factorX, float factorY) nothrow;
__gshared c_gsk_transform_scaleFn c_gsk_transform_scale; ///
private alias c_gsk_transform_scale_3dFn = extern(C) GskTransform* function(GskTransform* next, float factorX, float factorY, float factorZ) nothrow;
__gshared c_gsk_transform_scale_3dFn c_gsk_transform_scale_3d; ///
private alias c_gsk_transform_skewFn = extern(C) GskTransform* function(GskTransform* next, float skewX, float skewY) nothrow;
__gshared c_gsk_transform_skewFn c_gsk_transform_skew; ///
private alias c_gsk_transform_to_2dFn = extern(C) void function(GskTransform* self, float* outXx, float* outYx, float* outXy, float* outYy, float* outDx, float* outDy) nothrow;
__gshared c_gsk_transform_to_2dFn c_gsk_transform_to_2d; ///
private alias c_gsk_transform_to_2d_componentsFn = extern(C) void function(GskTransform* self, float* outSkewX, float* outSkewY, float* outScaleX, float* outScaleY, float* outAngle, float* outDx, float* outDy) nothrow;
__gshared c_gsk_transform_to_2d_componentsFn c_gsk_transform_to_2d_components; ///
private alias c_gsk_transform_to_affineFn = extern(C) void function(GskTransform* self, float* outScaleX, float* outScaleY, float* outDx, float* outDy) nothrow;
__gshared c_gsk_transform_to_affineFn c_gsk_transform_to_affine; ///
private alias c_gsk_transform_to_matrixFn = extern(C) void function(GskTransform* self, graphene_matrix_t* outMatrix) nothrow;
__gshared c_gsk_transform_to_matrixFn c_gsk_transform_to_matrix; ///
private alias c_gsk_transform_to_stringFn = extern(C) char* function(GskTransform* self) nothrow;
__gshared c_gsk_transform_to_stringFn c_gsk_transform_to_string; ///
private alias c_gsk_transform_to_translateFn = extern(C) void function(GskTransform* self, float* outDx, float* outDy) nothrow;
__gshared c_gsk_transform_to_translateFn c_gsk_transform_to_translate; ///
private alias c_gsk_transform_transformFn = extern(C) GskTransform* function(GskTransform* next, GskTransform* other) nothrow;
__gshared c_gsk_transform_transformFn c_gsk_transform_transform; ///
private alias c_gsk_transform_transform_boundsFn = extern(C) void function(GskTransform* self, const(graphene_rect_t)* rect, graphene_rect_t* outRect) nothrow;
__gshared c_gsk_transform_transform_boundsFn c_gsk_transform_transform_bounds; ///
private alias c_gsk_transform_transform_pointFn = extern(C) void function(GskTransform* self, const(graphene_point_t)* point, graphene_point_t* outPoint) nothrow;
__gshared c_gsk_transform_transform_pointFn c_gsk_transform_transform_point; ///
private alias c_gsk_transform_translateFn = extern(C) GskTransform* function(GskTransform* next, const(graphene_point_t)* point) nothrow;
__gshared c_gsk_transform_translateFn c_gsk_transform_translate; ///
private alias c_gsk_transform_translate_3dFn = extern(C) GskTransform* function(GskTransform* next, const(graphene_point3d_t)* point) nothrow;
__gshared c_gsk_transform_translate_3dFn c_gsk_transform_translate_3d; ///
private alias c_gsk_transform_unrefFn = extern(C) void function(GskTransform* self) nothrow;
__gshared c_gsk_transform_unrefFn c_gsk_transform_unref; ///
private alias c_gsk_transform_parseFn = extern(C) gboolean function(const(char)* string_, GskTransform** outTransform) nothrow;
__gshared c_gsk_transform_parseFn c_gsk_transform_parse; ///

// TransformNode
private alias c_gsk_transform_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_transform_node_get_typeFn c_gsk_transform_node_get_type; ///
private alias c_gsk_transform_node_newFn = extern(C) GskRenderNode* function(GskRenderNode* child, GskTransform* transform) nothrow;
__gshared c_gsk_transform_node_newFn c_gsk_transform_node_new; ///
private alias c_gsk_transform_node_get_childFn = extern(C) GskRenderNode* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_transform_node_get_childFn c_gsk_transform_node_get_child; ///
private alias c_gsk_transform_node_get_transformFn = extern(C) GskTransform* function(const(GskRenderNode)* node) nothrow;
__gshared c_gsk_transform_node_get_transformFn c_gsk_transform_node_get_transform; ///

// VulkanRenderer
private alias c_gsk_vulkan_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gsk_vulkan_renderer_get_typeFn c_gsk_vulkan_renderer_get_type; ///
private alias c_gsk_vulkan_renderer_newFn = extern(C) GskRenderer* function() nothrow;
__gshared c_gsk_vulkan_renderer_newFn c_gsk_vulkan_renderer_new; ///

// global
private alias c_gsk_value_dup_render_nodeFn = extern(C) GskRenderNode* function(const(GValue)* value) nothrow;
__gshared c_gsk_value_dup_render_nodeFn c_gsk_value_dup_render_node; ///
private alias c_gsk_value_get_render_nodeFn = extern(C) GskRenderNode* function(const(GValue)* value) nothrow;
__gshared c_gsk_value_get_render_nodeFn c_gsk_value_get_render_node; ///
private alias c_gsk_value_set_render_nodeFn = extern(C) void function(GValue* value, GskRenderNode* node) nothrow;
__gshared c_gsk_value_set_render_nodeFn c_gsk_value_set_render_node; ///
private alias c_gsk_value_take_render_nodeFn = extern(C) void function(GValue* value, GskRenderNode* node) nothrow;
__gshared c_gsk_value_take_render_nodeFn c_gsk_value_take_render_node; ///

// SerializationError
private alias c_gsk_serialization_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gsk_serialization_error_quarkFn c_gsk_serialization_error_quark; ///

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

// ComponentTransfer

/** */
alias gsk_component_transfer_get_type = c_gsk_component_transfer_get_type;

/** */
alias gsk_component_transfer_new_discrete = c_gsk_component_transfer_new_discrete;

/** */
alias gsk_component_transfer_new_gamma = c_gsk_component_transfer_new_gamma;

/** */
alias gsk_component_transfer_new_identity = c_gsk_component_transfer_new_identity;

/** */
alias gsk_component_transfer_new_levels = c_gsk_component_transfer_new_levels;

/** */
alias gsk_component_transfer_new_linear = c_gsk_component_transfer_new_linear;

/** */
alias gsk_component_transfer_new_table = c_gsk_component_transfer_new_table;

/** */
alias gsk_component_transfer_copy = c_gsk_component_transfer_copy;

/** */
alias gsk_component_transfer_free = c_gsk_component_transfer_free;

/** */
alias gsk_component_transfer_equal = c_gsk_component_transfer_equal;

// ComponentTransferNode

/** */
alias gsk_component_transfer_node_get_type = c_gsk_component_transfer_node_get_type;

/** */
alias gsk_component_transfer_node_new = c_gsk_component_transfer_node_new;

/** */
alias gsk_component_transfer_node_get_child = c_gsk_component_transfer_node_get_child;

/** */
alias gsk_component_transfer_node_get_transfer = c_gsk_component_transfer_node_get_transfer;

// CompositeNode

/** */
alias gsk_composite_node_get_type = c_gsk_composite_node_get_type;

/** */
alias gsk_composite_node_new = c_gsk_composite_node_new;

/** */
alias gsk_composite_node_get_child = c_gsk_composite_node_get_child;

/** */
alias gsk_composite_node_get_mask = c_gsk_composite_node_get_mask;

/** */
alias gsk_composite_node_get_operator = c_gsk_composite_node_get_operator;

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

// CopyNode

/** */
alias gsk_copy_node_get_type = c_gsk_copy_node_get_type;

/** */
alias gsk_copy_node_new = c_gsk_copy_node_new;

/** */
alias gsk_copy_node_get_child = c_gsk_copy_node_get_child;

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

// IsolationNode

/** */
alias gsk_isolation_node_get_type = c_gsk_isolation_node_get_type;

/** */
alias gsk_isolation_node_new = c_gsk_isolation_node_new;

/** */
alias gsk_isolation_node_get_child = c_gsk_isolation_node_get_child;

/** */
alias gsk_isolation_node_get_isolations = c_gsk_isolation_node_get_isolations;

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

// PasteNode

/** */
alias gsk_paste_node_get_type = c_gsk_paste_node_get_type;

/** */
alias gsk_paste_node_new = c_gsk_paste_node_new;

/** */
alias gsk_paste_node_get_depth = c_gsk_paste_node_get_depth;

// Path

/** */
alias gsk_path_get_type = c_gsk_path_get_type;

/** */
alias gsk_path_equal = c_gsk_path_equal;

/** */
alias gsk_path_foreach = c_gsk_path_foreach;

/** */
alias gsk_path_foreach_intersection = c_gsk_path_foreach_intersection;

/** */
alias gsk_path_get_bounds = c_gsk_path_get_bounds;

/** */
alias gsk_path_get_closest_point = c_gsk_path_get_closest_point;

/** */
alias gsk_path_get_end_point = c_gsk_path_get_end_point;

/** */
alias gsk_path_get_next = c_gsk_path_get_next;

/** */
alias gsk_path_get_previous = c_gsk_path_get_previous;

/** */
alias gsk_path_get_start_point = c_gsk_path_get_start_point;

/** */
alias gsk_path_get_stroke_bounds = c_gsk_path_get_stroke_bounds;

/** */
alias gsk_path_get_tight_bounds = c_gsk_path_get_tight_bounds;

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
alias gsk_render_node_get_children = c_gsk_render_node_get_children;

/** */
alias gsk_render_node_get_node_type = c_gsk_render_node_get_node_type;

/** */
alias gsk_render_node_get_opaque_rect = c_gsk_render_node_get_opaque_rect;

/** */
alias gsk_render_node_ref = c_gsk_render_node_ref;

/** */
alias gsk_render_node_serialize = c_gsk_render_node_serialize;

/** */
alias gsk_render_node_unref = c_gsk_render_node_unref;

/** */
alias gsk_render_node_write_to_file = c_gsk_render_node_write_to_file;

// RenderReplay

/** */
alias gsk_render_replay_get_type = c_gsk_render_replay_get_type;

/** */
alias gsk_render_replay_new = c_gsk_render_replay_new;

/** */
alias gsk_render_replay_default = c_gsk_render_replay_default;

/** */
alias gsk_render_replay_filter_font = c_gsk_render_replay_filter_font;

/** */
alias gsk_render_replay_filter_node = c_gsk_render_replay_filter_node;

/** */
alias gsk_render_replay_filter_texture = c_gsk_render_replay_filter_texture;

/** */
alias gsk_render_replay_free = c_gsk_render_replay_free;

/** */
alias gsk_render_replay_set_font_filter = c_gsk_render_replay_set_font_filter;

/** */
alias gsk_render_replay_set_node_filter = c_gsk_render_replay_set_node_filter;

/** */
alias gsk_render_replay_set_texture_filter = c_gsk_render_replay_set_texture_filter;

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
alias gsk_transform_matrix_2d = c_gsk_transform_matrix_2d;

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
  auto libs = gidResolveLibs(LIBS, "gid.gsk4");

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

  // ComponentTransfer
  gidLink(cast(void**)&gsk_component_transfer_get_type, "gsk_component_transfer_get_type", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_discrete, "gsk_component_transfer_new_discrete", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_gamma, "gsk_component_transfer_new_gamma", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_identity, "gsk_component_transfer_new_identity", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_levels, "gsk_component_transfer_new_levels", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_linear, "gsk_component_transfer_new_linear", libs);
  gidLink(cast(void**)&gsk_component_transfer_new_table, "gsk_component_transfer_new_table", libs);
  gidLink(cast(void**)&gsk_component_transfer_copy, "gsk_component_transfer_copy", libs);
  gidLink(cast(void**)&gsk_component_transfer_free, "gsk_component_transfer_free", libs);
  gidLink(cast(void**)&gsk_component_transfer_equal, "gsk_component_transfer_equal", libs);

  // ComponentTransferNode
  gidLink(cast(void**)&gsk_component_transfer_node_get_type, "gsk_component_transfer_node_get_type", libs);
  gidLink(cast(void**)&gsk_component_transfer_node_new, "gsk_component_transfer_node_new", libs);
  gidLink(cast(void**)&gsk_component_transfer_node_get_child, "gsk_component_transfer_node_get_child", libs);
  gidLink(cast(void**)&gsk_component_transfer_node_get_transfer, "gsk_component_transfer_node_get_transfer", libs);

  // CompositeNode
  gidLink(cast(void**)&gsk_composite_node_get_type, "gsk_composite_node_get_type", libs);
  gidLink(cast(void**)&gsk_composite_node_new, "gsk_composite_node_new", libs);
  gidLink(cast(void**)&gsk_composite_node_get_child, "gsk_composite_node_get_child", libs);
  gidLink(cast(void**)&gsk_composite_node_get_mask, "gsk_composite_node_get_mask", libs);
  gidLink(cast(void**)&gsk_composite_node_get_operator, "gsk_composite_node_get_operator", libs);

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

  // CopyNode
  gidLink(cast(void**)&gsk_copy_node_get_type, "gsk_copy_node_get_type", libs);
  gidLink(cast(void**)&gsk_copy_node_new, "gsk_copy_node_new", libs);
  gidLink(cast(void**)&gsk_copy_node_get_child, "gsk_copy_node_get_child", libs);

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

  // IsolationNode
  gidLink(cast(void**)&gsk_isolation_node_get_type, "gsk_isolation_node_get_type", libs);
  gidLink(cast(void**)&gsk_isolation_node_new, "gsk_isolation_node_new", libs);
  gidLink(cast(void**)&gsk_isolation_node_get_child, "gsk_isolation_node_get_child", libs);
  gidLink(cast(void**)&gsk_isolation_node_get_isolations, "gsk_isolation_node_get_isolations", libs);

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

  // PasteNode
  gidLink(cast(void**)&gsk_paste_node_get_type, "gsk_paste_node_get_type", libs);
  gidLink(cast(void**)&gsk_paste_node_new, "gsk_paste_node_new", libs);
  gidLink(cast(void**)&gsk_paste_node_get_depth, "gsk_paste_node_get_depth", libs);

  // Path
  gidLink(cast(void**)&gsk_path_get_type, "gsk_path_get_type", libs);
  gidLink(cast(void**)&gsk_path_equal, "gsk_path_equal", libs);
  gidLink(cast(void**)&gsk_path_foreach, "gsk_path_foreach", libs);
  gidLink(cast(void**)&gsk_path_foreach_intersection, "gsk_path_foreach_intersection", libs);
  gidLink(cast(void**)&gsk_path_get_bounds, "gsk_path_get_bounds", libs);
  gidLink(cast(void**)&gsk_path_get_closest_point, "gsk_path_get_closest_point", libs);
  gidLink(cast(void**)&gsk_path_get_end_point, "gsk_path_get_end_point", libs);
  gidLink(cast(void**)&gsk_path_get_next, "gsk_path_get_next", libs);
  gidLink(cast(void**)&gsk_path_get_previous, "gsk_path_get_previous", libs);
  gidLink(cast(void**)&gsk_path_get_start_point, "gsk_path_get_start_point", libs);
  gidLink(cast(void**)&gsk_path_get_stroke_bounds, "gsk_path_get_stroke_bounds", libs);
  gidLink(cast(void**)&gsk_path_get_tight_bounds, "gsk_path_get_tight_bounds", libs);
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
  gidLink(cast(void**)&gsk_render_node_get_children, "gsk_render_node_get_children", libs);
  gidLink(cast(void**)&gsk_render_node_get_node_type, "gsk_render_node_get_node_type", libs);
  gidLink(cast(void**)&gsk_render_node_get_opaque_rect, "gsk_render_node_get_opaque_rect", libs);
  gidLink(cast(void**)&gsk_render_node_ref, "gsk_render_node_ref", libs);
  gidLink(cast(void**)&gsk_render_node_serialize, "gsk_render_node_serialize", libs);
  gidLink(cast(void**)&gsk_render_node_unref, "gsk_render_node_unref", libs);
  gidLink(cast(void**)&gsk_render_node_write_to_file, "gsk_render_node_write_to_file", libs);

  // RenderReplay
  gidLink(cast(void**)&gsk_render_replay_get_type, "gsk_render_replay_get_type", libs);
  gidLink(cast(void**)&gsk_render_replay_new, "gsk_render_replay_new", libs);
  gidLink(cast(void**)&gsk_render_replay_default, "gsk_render_replay_default", libs);
  gidLink(cast(void**)&gsk_render_replay_filter_font, "gsk_render_replay_filter_font", libs);
  gidLink(cast(void**)&gsk_render_replay_filter_node, "gsk_render_replay_filter_node", libs);
  gidLink(cast(void**)&gsk_render_replay_filter_texture, "gsk_render_replay_filter_texture", libs);
  gidLink(cast(void**)&gsk_render_replay_free, "gsk_render_replay_free", libs);
  gidLink(cast(void**)&gsk_render_replay_set_font_filter, "gsk_render_replay_set_font_filter", libs);
  gidLink(cast(void**)&gsk_render_replay_set_node_filter, "gsk_render_replay_set_node_filter", libs);
  gidLink(cast(void**)&gsk_render_replay_set_texture_filter, "gsk_render_replay_set_texture_filter", libs);

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
  gidLink(cast(void**)&gsk_transform_matrix_2d, "gsk_transform_matrix_2d", libs);
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
