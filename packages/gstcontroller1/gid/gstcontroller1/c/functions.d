/// C functions for gstcontroller1 library
module gid.gstcontroller1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstcontroller1.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstcontroller-1.0_0"];

// ARGBControlBinding
private alias c_gst_argb_control_binding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_argb_control_binding_get_typeFn c_gst_argb_control_binding_get_type; ///
private alias c_gst_argb_control_binding_newFn = extern(C) GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* csA, GstControlSource* csR, GstControlSource* csG, GstControlSource* csB) nothrow;
__gshared c_gst_argb_control_binding_newFn c_gst_argb_control_binding_new; ///

// ControlPoint
private alias c_gst_control_point_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_control_point_get_typeFn c_gst_control_point_get_type; ///
private alias c_gst_control_point_copyFn = extern(C) GstControlPoint* function(GstControlPoint* cp) nothrow;
__gshared c_gst_control_point_copyFn c_gst_control_point_copy; ///
private alias c_gst_control_point_freeFn = extern(C) void function(GstControlPoint* cp) nothrow;
__gshared c_gst_control_point_freeFn c_gst_control_point_free; ///

// DirectControlBinding
private alias c_gst_direct_control_binding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_direct_control_binding_get_typeFn c_gst_direct_control_binding_get_type; ///
private alias c_gst_direct_control_binding_newFn = extern(C) GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* cs) nothrow;
__gshared c_gst_direct_control_binding_newFn c_gst_direct_control_binding_new; ///
private alias c_gst_direct_control_binding_new_absoluteFn = extern(C) GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* cs) nothrow;
__gshared c_gst_direct_control_binding_new_absoluteFn c_gst_direct_control_binding_new_absolute; ///

// InterpolationControlSource
private alias c_gst_interpolation_control_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_interpolation_control_source_get_typeFn c_gst_interpolation_control_source_get_type; ///
private alias c_gst_interpolation_control_source_newFn = extern(C) GstControlSource* function() nothrow;
__gshared c_gst_interpolation_control_source_newFn c_gst_interpolation_control_source_new; ///

// LFOControlSource
private alias c_gst_lfo_control_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_lfo_control_source_get_typeFn c_gst_lfo_control_source_get_type; ///
private alias c_gst_lfo_control_source_newFn = extern(C) GstControlSource* function() nothrow;
__gshared c_gst_lfo_control_source_newFn c_gst_lfo_control_source_new; ///

// ProxyControlBinding
private alias c_gst_proxy_control_binding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_proxy_control_binding_get_typeFn c_gst_proxy_control_binding_get_type; ///
private alias c_gst_proxy_control_binding_newFn = extern(C) GstControlBinding* function(GstObject* object, const(char)* propertyName, GstObject* refObject, const(char)* refPropertyName) nothrow;
__gshared c_gst_proxy_control_binding_newFn c_gst_proxy_control_binding_new; ///

// TimedValueControlSource
private alias c_gst_timed_value_control_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_timed_value_control_source_get_typeFn c_gst_timed_value_control_source_get_type; ///
private alias c_gst_timed_value_control_source_find_control_point_iterFn = extern(C) GSequenceIter* function(GstTimedValueControlSource* self, GstClockTime timestamp) nothrow;
__gshared c_gst_timed_value_control_source_find_control_point_iterFn c_gst_timed_value_control_source_find_control_point_iter; ///
private alias c_gst_timed_value_control_source_get_allFn = extern(C) GList* function(GstTimedValueControlSource* self) nothrow;
__gshared c_gst_timed_value_control_source_get_allFn c_gst_timed_value_control_source_get_all; ///
private alias c_gst_timed_value_control_source_get_countFn = extern(C) int function(GstTimedValueControlSource* self) nothrow;
__gshared c_gst_timed_value_control_source_get_countFn c_gst_timed_value_control_source_get_count; ///
private alias c_gst_timed_value_control_source_list_control_pointsFn = extern(C) GstTimedValue* function(GstTimedValueControlSource* self, size_t* nControlPoints) nothrow;
__gshared c_gst_timed_value_control_source_list_control_pointsFn c_gst_timed_value_control_source_list_control_points; ///
private alias c_gst_timed_value_control_source_setFn = extern(C) gboolean function(GstTimedValueControlSource* self, GstClockTime timestamp, double value) nothrow;
__gshared c_gst_timed_value_control_source_setFn c_gst_timed_value_control_source_set; ///
private alias c_gst_timed_value_control_source_set_from_listFn = extern(C) gboolean function(GstTimedValueControlSource* self, const(GSList)* timedvalues) nothrow;
__gshared c_gst_timed_value_control_source_set_from_listFn c_gst_timed_value_control_source_set_from_list; ///
private alias c_gst_timed_value_control_source_unsetFn = extern(C) gboolean function(GstTimedValueControlSource* self, GstClockTime timestamp) nothrow;
__gshared c_gst_timed_value_control_source_unsetFn c_gst_timed_value_control_source_unset; ///
private alias c_gst_timed_value_control_source_unset_allFn = extern(C) void function(GstTimedValueControlSource* self) nothrow;
__gshared c_gst_timed_value_control_source_unset_allFn c_gst_timed_value_control_source_unset_all; ///

// TriggerControlSource
private alias c_gst_trigger_control_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_trigger_control_source_get_typeFn c_gst_trigger_control_source_get_type; ///
private alias c_gst_trigger_control_source_newFn = extern(C) GstControlSource* function() nothrow;
__gshared c_gst_trigger_control_source_newFn c_gst_trigger_control_source_new; ///

// global
private alias c_gst_timed_value_control_invalidate_cacheFn = extern(C) void function(GstTimedValueControlSource* self) nothrow;
__gshared c_gst_timed_value_control_invalidate_cacheFn c_gst_timed_value_control_invalidate_cache; ///

// ARGBControlBinding

/** */
alias gst_argb_control_binding_get_type = c_gst_argb_control_binding_get_type;

/** */
alias gst_argb_control_binding_new = c_gst_argb_control_binding_new;

// ControlPoint

/** */
alias gst_control_point_get_type = c_gst_control_point_get_type;

/** */
alias gst_control_point_copy = c_gst_control_point_copy;

/** */
alias gst_control_point_free = c_gst_control_point_free;

// DirectControlBinding

/** */
alias gst_direct_control_binding_get_type = c_gst_direct_control_binding_get_type;

/** */
alias gst_direct_control_binding_new = c_gst_direct_control_binding_new;

/** */
alias gst_direct_control_binding_new_absolute = c_gst_direct_control_binding_new_absolute;

// InterpolationControlSource

/** */
alias gst_interpolation_control_source_get_type = c_gst_interpolation_control_source_get_type;

/** */
alias gst_interpolation_control_source_new = c_gst_interpolation_control_source_new;

// LFOControlSource

/** */
alias gst_lfo_control_source_get_type = c_gst_lfo_control_source_get_type;

/** */
alias gst_lfo_control_source_new = c_gst_lfo_control_source_new;

// ProxyControlBinding

/** */
alias gst_proxy_control_binding_get_type = c_gst_proxy_control_binding_get_type;

/** */
alias gst_proxy_control_binding_new = c_gst_proxy_control_binding_new;

// TimedValueControlSource

/** */
alias gst_timed_value_control_source_get_type = c_gst_timed_value_control_source_get_type;

/** */
alias gst_timed_value_control_source_find_control_point_iter = c_gst_timed_value_control_source_find_control_point_iter;

/** */
alias gst_timed_value_control_source_get_all = c_gst_timed_value_control_source_get_all;

/** */
alias gst_timed_value_control_source_get_count = c_gst_timed_value_control_source_get_count;

/** */
alias gst_timed_value_control_source_list_control_points = c_gst_timed_value_control_source_list_control_points;

/** */
alias gst_timed_value_control_source_set = c_gst_timed_value_control_source_set;

/** */
alias gst_timed_value_control_source_set_from_list = c_gst_timed_value_control_source_set_from_list;

/** */
alias gst_timed_value_control_source_unset = c_gst_timed_value_control_source_unset;

/** */
alias gst_timed_value_control_source_unset_all = c_gst_timed_value_control_source_unset_all;

// TriggerControlSource

/** */
alias gst_trigger_control_source_get_type = c_gst_trigger_control_source_get_type;

/** */
alias gst_trigger_control_source_new = c_gst_trigger_control_source_new;

// global

/** */
alias gst_timed_value_control_invalidate_cache = c_gst_timed_value_control_invalidate_cache;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // ARGBControlBinding
  gidLink(cast(void**)&gst_argb_control_binding_get_type, "gst_argb_control_binding_get_type", libs);
  gidLink(cast(void**)&gst_argb_control_binding_new, "gst_argb_control_binding_new", libs);

  // ControlPoint
  gidLink(cast(void**)&gst_control_point_get_type, "gst_control_point_get_type", libs);
  gidLink(cast(void**)&gst_control_point_copy, "gst_control_point_copy", libs);
  gidLink(cast(void**)&gst_control_point_free, "gst_control_point_free", libs);

  // DirectControlBinding
  gidLink(cast(void**)&gst_direct_control_binding_get_type, "gst_direct_control_binding_get_type", libs);
  gidLink(cast(void**)&gst_direct_control_binding_new, "gst_direct_control_binding_new", libs);
  gidLink(cast(void**)&gst_direct_control_binding_new_absolute, "gst_direct_control_binding_new_absolute", libs);

  // InterpolationControlSource
  gidLink(cast(void**)&gst_interpolation_control_source_get_type, "gst_interpolation_control_source_get_type", libs);
  gidLink(cast(void**)&gst_interpolation_control_source_new, "gst_interpolation_control_source_new", libs);

  // LFOControlSource
  gidLink(cast(void**)&gst_lfo_control_source_get_type, "gst_lfo_control_source_get_type", libs);
  gidLink(cast(void**)&gst_lfo_control_source_new, "gst_lfo_control_source_new", libs);

  // ProxyControlBinding
  gidLink(cast(void**)&gst_proxy_control_binding_get_type, "gst_proxy_control_binding_get_type", libs);
  gidLink(cast(void**)&gst_proxy_control_binding_new, "gst_proxy_control_binding_new", libs);

  // TimedValueControlSource
  gidLink(cast(void**)&gst_timed_value_control_source_get_type, "gst_timed_value_control_source_get_type", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_find_control_point_iter, "gst_timed_value_control_source_find_control_point_iter", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_get_all, "gst_timed_value_control_source_get_all", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_get_count, "gst_timed_value_control_source_get_count", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_list_control_points, "gst_timed_value_control_source_list_control_points", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_set, "gst_timed_value_control_source_set", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_set_from_list, "gst_timed_value_control_source_set_from_list", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_unset, "gst_timed_value_control_source_unset", libs);
  gidLink(cast(void**)&gst_timed_value_control_source_unset_all, "gst_timed_value_control_source_unset_all", libs);

  // TriggerControlSource
  gidLink(cast(void**)&gst_trigger_control_source_get_type, "gst_trigger_control_source_get_type", libs);
  gidLink(cast(void**)&gst_trigger_control_source_new, "gst_trigger_control_source_new", libs);

  // global
  gidLink(cast(void**)&gst_timed_value_control_invalidate_cache, "gst_timed_value_control_invalidate_cache", libs);
}
