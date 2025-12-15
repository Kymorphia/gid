/// C functions for gstcontroller1 library
module gstcontroller.c.functions;

public import gid.basictypes;
import gid.loader;
import gstcontroller.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstcontroller-1.0-0.dll;gstcontroller-1.0-0.dll;gstcontroller-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstcontroller-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstcontroller-1.0.so.0"];

__gshared extern(C)
{
  // ARGBControlBinding
  GType function() c_gst_argb_control_binding_get_type; ///
  GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* csA, GstControlSource* csR, GstControlSource* csG, GstControlSource* csB) c_gst_argb_control_binding_new; ///

  // ControlPoint
  GType function() c_gst_control_point_get_type; ///
  GstControlPoint* function(GstControlPoint* cp) c_gst_control_point_copy; ///
  void function(GstControlPoint* cp) c_gst_control_point_free; ///

  // DirectControlBinding
  GType function() c_gst_direct_control_binding_get_type; ///
  GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* cs) c_gst_direct_control_binding_new; ///
  GstControlBinding* function(GstObject* object, const(char)* propertyName, GstControlSource* cs) c_gst_direct_control_binding_new_absolute; ///

  // InterpolationControlSource
  GType function() c_gst_interpolation_control_source_get_type; ///
  GstControlSource* function() c_gst_interpolation_control_source_new; ///

  // LFOControlSource
  GType function() c_gst_lfo_control_source_get_type; ///
  GstControlSource* function() c_gst_lfo_control_source_new; ///

  // ProxyControlBinding
  GType function() c_gst_proxy_control_binding_get_type; ///
  GstControlBinding* function(GstObject* object, const(char)* propertyName, GstObject* refObject, const(char)* refPropertyName) c_gst_proxy_control_binding_new; ///

  // TimedValueControlSource
  GType function() c_gst_timed_value_control_source_get_type; ///
  GSequenceIter* function(GstTimedValueControlSource* self, GstClockTime timestamp) c_gst_timed_value_control_source_find_control_point_iter; ///
  GList* function(GstTimedValueControlSource* self) c_gst_timed_value_control_source_get_all; ///
  int function(GstTimedValueControlSource* self) c_gst_timed_value_control_source_get_count; ///
  gboolean function(GstTimedValueControlSource* self, GstClockTime timestamp, double value) c_gst_timed_value_control_source_set; ///
  gboolean function(GstTimedValueControlSource* self, const(GSList)* timedvalues) c_gst_timed_value_control_source_set_from_list; ///
  gboolean function(GstTimedValueControlSource* self, GstClockTime timestamp) c_gst_timed_value_control_source_unset; ///
  void function(GstTimedValueControlSource* self) c_gst_timed_value_control_source_unset_all; ///

  // TriggerControlSource
  GType function() c_gst_trigger_control_source_get_type; ///
  GstControlSource* function() c_gst_trigger_control_source_new; ///

  // global
  void function(GstTimedValueControlSource* self) c_gst_timed_value_control_invalidate_cache; ///
}

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
