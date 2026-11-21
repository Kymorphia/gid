/// C functions for gobject2 library
module gid.gobject2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gobject2.c.types;
public import gid.glib2.c.types;

private immutable LIBS = ["gobject-2.0_0"];

// Binding
private alias c_g_binding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_binding_get_typeFn c_g_binding_get_type; ///
private alias c_g_binding_dup_sourceFn = extern(C) GObject* function(GBinding* binding) nothrow;
__gshared c_g_binding_dup_sourceFn c_g_binding_dup_source; ///
private alias c_g_binding_dup_targetFn = extern(C) GObject* function(GBinding* binding) nothrow;
__gshared c_g_binding_dup_targetFn c_g_binding_dup_target; ///
private alias c_g_binding_get_flagsFn = extern(C) GBindingFlags function(GBinding* binding) nothrow;
__gshared c_g_binding_get_flagsFn c_g_binding_get_flags; ///
private alias c_g_binding_get_sourceFn = extern(C) GObject* function(GBinding* binding) nothrow;
__gshared c_g_binding_get_sourceFn c_g_binding_get_source; ///
private alias c_g_binding_get_source_propertyFn = extern(C) const(char)* function(GBinding* binding) nothrow;
__gshared c_g_binding_get_source_propertyFn c_g_binding_get_source_property; ///
private alias c_g_binding_get_targetFn = extern(C) GObject* function(GBinding* binding) nothrow;
__gshared c_g_binding_get_targetFn c_g_binding_get_target; ///
private alias c_g_binding_get_target_propertyFn = extern(C) const(char)* function(GBinding* binding) nothrow;
__gshared c_g_binding_get_target_propertyFn c_g_binding_get_target_property; ///
private alias c_g_binding_unbindFn = extern(C) void function(GBinding* binding) nothrow;
__gshared c_g_binding_unbindFn c_g_binding_unbind; ///

// BindingGroup
private alias c_g_binding_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_binding_group_get_typeFn c_g_binding_group_get_type; ///
private alias c_g_binding_group_newFn = extern(C) GBindingGroup* function() nothrow;
__gshared c_g_binding_group_newFn c_g_binding_group_new; ///
private alias c_g_binding_group_bindFn = extern(C) void function(GBindingGroup* self, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags) nothrow;
__gshared c_g_binding_group_bindFn c_g_binding_group_bind; ///
private alias c_g_binding_group_bind_fullFn = extern(C) void function(GBindingGroup* self, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags, GBindingTransformFunc transformTo, GBindingTransformFunc transformFrom, void* userData, GDestroyNotify userDataDestroy) nothrow;
__gshared c_g_binding_group_bind_fullFn c_g_binding_group_bind_full; ///
private alias c_g_binding_group_bind_with_closuresFn = extern(C) void function(GBindingGroup* self, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags, GClosure* transformTo, GClosure* transformFrom) nothrow;
__gshared c_g_binding_group_bind_with_closuresFn c_g_binding_group_bind_with_closures; ///
private alias c_g_binding_group_dup_sourceFn = extern(C) GObject* function(GBindingGroup* self) nothrow;
__gshared c_g_binding_group_dup_sourceFn c_g_binding_group_dup_source; ///
private alias c_g_binding_group_set_sourceFn = extern(C) void function(GBindingGroup* self, GObject* source) nothrow;
__gshared c_g_binding_group_set_sourceFn c_g_binding_group_set_source; ///

// CClosure
private alias c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDFn c_g_cclosure_marshal_BOOLEAN__BOXED_BOXED; ///
private alias c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDvFn c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv; ///
private alias c_g_cclosure_marshal_BOOLEAN__FLAGSFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_BOOLEAN__FLAGSFn c_g_cclosure_marshal_BOOLEAN__FLAGS; ///
private alias c_g_cclosure_marshal_BOOLEAN__FLAGSvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_BOOLEAN__FLAGSvFn c_g_cclosure_marshal_BOOLEAN__FLAGSv; ///
private alias c_g_cclosure_marshal_STRING__OBJECT_POINTERFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_STRING__OBJECT_POINTERFn c_g_cclosure_marshal_STRING__OBJECT_POINTER; ///
private alias c_g_cclosure_marshal_STRING__OBJECT_POINTERvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_STRING__OBJECT_POINTERvFn c_g_cclosure_marshal_STRING__OBJECT_POINTERv; ///
private alias c_g_cclosure_marshal_VOID__BOOLEANFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__BOOLEANFn c_g_cclosure_marshal_VOID__BOOLEAN; ///
private alias c_g_cclosure_marshal_VOID__BOOLEANvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__BOOLEANvFn c_g_cclosure_marshal_VOID__BOOLEANv; ///
private alias c_g_cclosure_marshal_VOID__BOXEDFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__BOXEDFn c_g_cclosure_marshal_VOID__BOXED; ///
private alias c_g_cclosure_marshal_VOID__BOXEDvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__BOXEDvFn c_g_cclosure_marshal_VOID__BOXEDv; ///
private alias c_g_cclosure_marshal_VOID__CHARFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__CHARFn c_g_cclosure_marshal_VOID__CHAR; ///
private alias c_g_cclosure_marshal_VOID__CHARvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__CHARvFn c_g_cclosure_marshal_VOID__CHARv; ///
private alias c_g_cclosure_marshal_VOID__DOUBLEFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__DOUBLEFn c_g_cclosure_marshal_VOID__DOUBLE; ///
private alias c_g_cclosure_marshal_VOID__DOUBLEvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__DOUBLEvFn c_g_cclosure_marshal_VOID__DOUBLEv; ///
private alias c_g_cclosure_marshal_VOID__ENUMFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__ENUMFn c_g_cclosure_marshal_VOID__ENUM; ///
private alias c_g_cclosure_marshal_VOID__ENUMvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__ENUMvFn c_g_cclosure_marshal_VOID__ENUMv; ///
private alias c_g_cclosure_marshal_VOID__FLAGSFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__FLAGSFn c_g_cclosure_marshal_VOID__FLAGS; ///
private alias c_g_cclosure_marshal_VOID__FLAGSvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__FLAGSvFn c_g_cclosure_marshal_VOID__FLAGSv; ///
private alias c_g_cclosure_marshal_VOID__FLOATFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__FLOATFn c_g_cclosure_marshal_VOID__FLOAT; ///
private alias c_g_cclosure_marshal_VOID__FLOATvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__FLOATvFn c_g_cclosure_marshal_VOID__FLOATv; ///
private alias c_g_cclosure_marshal_VOID__INTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__INTFn c_g_cclosure_marshal_VOID__INT; ///
private alias c_g_cclosure_marshal_VOID__INTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__INTvFn c_g_cclosure_marshal_VOID__INTv; ///
private alias c_g_cclosure_marshal_VOID__LONGFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__LONGFn c_g_cclosure_marshal_VOID__LONG; ///
private alias c_g_cclosure_marshal_VOID__LONGvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__LONGvFn c_g_cclosure_marshal_VOID__LONGv; ///
private alias c_g_cclosure_marshal_VOID__OBJECTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__OBJECTFn c_g_cclosure_marshal_VOID__OBJECT; ///
private alias c_g_cclosure_marshal_VOID__OBJECTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__OBJECTvFn c_g_cclosure_marshal_VOID__OBJECTv; ///
private alias c_g_cclosure_marshal_VOID__PARAMFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__PARAMFn c_g_cclosure_marshal_VOID__PARAM; ///
private alias c_g_cclosure_marshal_VOID__PARAMvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__PARAMvFn c_g_cclosure_marshal_VOID__PARAMv; ///
private alias c_g_cclosure_marshal_VOID__POINTERFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__POINTERFn c_g_cclosure_marshal_VOID__POINTER; ///
private alias c_g_cclosure_marshal_VOID__POINTERvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__POINTERvFn c_g_cclosure_marshal_VOID__POINTERv; ///
private alias c_g_cclosure_marshal_VOID__STRINGFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__STRINGFn c_g_cclosure_marshal_VOID__STRING; ///
private alias c_g_cclosure_marshal_VOID__STRINGvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__STRINGvFn c_g_cclosure_marshal_VOID__STRINGv; ///
private alias c_g_cclosure_marshal_VOID__UCHARFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__UCHARFn c_g_cclosure_marshal_VOID__UCHAR; ///
private alias c_g_cclosure_marshal_VOID__UCHARvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__UCHARvFn c_g_cclosure_marshal_VOID__UCHARv; ///
private alias c_g_cclosure_marshal_VOID__UINTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__UINTFn c_g_cclosure_marshal_VOID__UINT; ///
private alias c_g_cclosure_marshal_VOID__UINT_POINTERFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__UINT_POINTERFn c_g_cclosure_marshal_VOID__UINT_POINTER; ///
private alias c_g_cclosure_marshal_VOID__UINT_POINTERvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__UINT_POINTERvFn c_g_cclosure_marshal_VOID__UINT_POINTERv; ///
private alias c_g_cclosure_marshal_VOID__UINTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__UINTvFn c_g_cclosure_marshal_VOID__UINTv; ///
private alias c_g_cclosure_marshal_VOID__ULONGFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__ULONGFn c_g_cclosure_marshal_VOID__ULONG; ///
private alias c_g_cclosure_marshal_VOID__ULONGvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__ULONGvFn c_g_cclosure_marshal_VOID__ULONGv; ///
private alias c_g_cclosure_marshal_VOID__VARIANTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__VARIANTFn c_g_cclosure_marshal_VOID__VARIANT; ///
private alias c_g_cclosure_marshal_VOID__VARIANTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__VARIANTvFn c_g_cclosure_marshal_VOID__VARIANTv; ///
private alias c_g_cclosure_marshal_VOID__VOIDFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_VOID__VOIDFn c_g_cclosure_marshal_VOID__VOID; ///
private alias c_g_cclosure_marshal_VOID__VOIDvFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_VOID__VOIDvFn c_g_cclosure_marshal_VOID__VOIDv; ///
private alias c_g_cclosure_marshal_genericFn = extern(C) void function(GClosure* closure, GValue* returnGvalue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_g_cclosure_marshal_genericFn c_g_cclosure_marshal_generic; ///
private alias c_g_cclosure_marshal_generic_vaFn = extern(C) void function(GClosure* closure, GValue* returnValue, GTypeInstance* instance, void* argsList, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_g_cclosure_marshal_generic_vaFn c_g_cclosure_marshal_generic_va; ///
private alias c_g_cclosure_newFn = extern(C) GClosure* function(GCallback callbackFunc, void* userData, GClosureNotify destroyData) nothrow;
__gshared c_g_cclosure_newFn c_g_cclosure_new; ///
private alias c_g_cclosure_new_objectFn = extern(C) GClosure* function(GCallback callbackFunc, GObject* object) nothrow;
__gshared c_g_cclosure_new_objectFn c_g_cclosure_new_object; ///
private alias c_g_cclosure_new_object_swapFn = extern(C) GClosure* function(GCallback callbackFunc, GObject* object) nothrow;
__gshared c_g_cclosure_new_object_swapFn c_g_cclosure_new_object_swap; ///
private alias c_g_cclosure_new_swapFn = extern(C) GClosure* function(GCallback callbackFunc, void* userData, GClosureNotify destroyData) nothrow;
__gshared c_g_cclosure_new_swapFn c_g_cclosure_new_swap; ///

// Closure
private alias c_g_closure_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_closure_get_typeFn c_g_closure_get_type; ///
private alias c_g_closure_new_objectFn = extern(C) GClosure* function(uint sizeofClosure, GObject* object) nothrow;
__gshared c_g_closure_new_objectFn c_g_closure_new_object; ///
private alias c_g_closure_new_simpleFn = extern(C) GClosure* function(uint sizeofClosure, void* data) nothrow;
__gshared c_g_closure_new_simpleFn c_g_closure_new_simple; ///
private alias c_g_closure_add_finalize_notifierFn = extern(C) void function(GClosure* closure, void* notifyData, GClosureNotify notifyFunc) nothrow;
__gshared c_g_closure_add_finalize_notifierFn c_g_closure_add_finalize_notifier; ///
private alias c_g_closure_add_invalidate_notifierFn = extern(C) void function(GClosure* closure, void* notifyData, GClosureNotify notifyFunc) nothrow;
__gshared c_g_closure_add_invalidate_notifierFn c_g_closure_add_invalidate_notifier; ///
private alias c_g_closure_add_marshal_guardsFn = extern(C) void function(GClosure* closure, void* preMarshalData, GClosureNotify preMarshalNotify, void* postMarshalData, GClosureNotify postMarshalNotify) nothrow;
__gshared c_g_closure_add_marshal_guardsFn c_g_closure_add_marshal_guards; ///
private alias c_g_closure_invalidateFn = extern(C) void function(GClosure* closure) nothrow;
__gshared c_g_closure_invalidateFn c_g_closure_invalidate; ///
private alias c_g_closure_invokeFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint) nothrow;
__gshared c_g_closure_invokeFn c_g_closure_invoke; ///
private alias c_g_closure_refFn = extern(C) GClosure* function(GClosure* closure) nothrow;
__gshared c_g_closure_refFn c_g_closure_ref; ///
private alias c_g_closure_remove_finalize_notifierFn = extern(C) void function(GClosure* closure, void* notifyData, GClosureNotify notifyFunc) nothrow;
__gshared c_g_closure_remove_finalize_notifierFn c_g_closure_remove_finalize_notifier; ///
private alias c_g_closure_remove_invalidate_notifierFn = extern(C) void function(GClosure* closure, void* notifyData, GClosureNotify notifyFunc) nothrow;
__gshared c_g_closure_remove_invalidate_notifierFn c_g_closure_remove_invalidate_notifier; ///
private alias c_g_closure_set_marshalFn = extern(C) void function(GClosure* closure, GClosureMarshal marshal) nothrow;
__gshared c_g_closure_set_marshalFn c_g_closure_set_marshal; ///
private alias c_g_closure_set_meta_marshalFn = extern(C) void function(GClosure* closure, void* marshalData, GClosureMarshal metaMarshal) nothrow;
__gshared c_g_closure_set_meta_marshalFn c_g_closure_set_meta_marshal; ///
private alias c_g_closure_sinkFn = extern(C) void function(GClosure* closure) nothrow;
__gshared c_g_closure_sinkFn c_g_closure_sink; ///
private alias c_g_closure_unrefFn = extern(C) void function(GClosure* closure) nothrow;
__gshared c_g_closure_unrefFn c_g_closure_unref; ///

// InitiallyUnowned
private alias c_g_initially_unowned_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_initially_unowned_get_typeFn c_g_initially_unowned_get_type; ///

// ObjectClass
private alias c_g_object_class_find_propertyFn = extern(C) GParamSpec* function(GObjectClass* oclass, const(char)* propertyName) nothrow;
__gshared c_g_object_class_find_propertyFn c_g_object_class_find_property; ///
private alias c_g_object_class_install_propertiesFn = extern(C) void function(GObjectClass* oclass, uint nPspecs, GParamSpec** pspecs) nothrow;
__gshared c_g_object_class_install_propertiesFn c_g_object_class_install_properties; ///
private alias c_g_object_class_install_propertyFn = extern(C) void function(GObjectClass* oclass, uint propertyId, GParamSpec* pspec) nothrow;
__gshared c_g_object_class_install_propertyFn c_g_object_class_install_property; ///
private alias c_g_object_class_list_propertiesFn = extern(C) GParamSpec** function(GObjectClass* oclass, uint* nProperties) nothrow;
__gshared c_g_object_class_list_propertiesFn c_g_object_class_list_properties; ///
private alias c_g_object_class_override_propertyFn = extern(C) void function(GObjectClass* oclass, uint propertyId, const(char)* name) nothrow;
__gshared c_g_object_class_override_propertyFn c_g_object_class_override_property; ///

// ObjectWrap
private alias c_g_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_object_get_typeFn c_g_object_get_type; ///
private alias c_g_object_newFn = extern(C) GObject* function(GType objectType, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_g_object_newFn c_g_object_new; ///
private alias c_g_object_new_valistFn = extern(C) GObject* function(GType objectType, const(char)* firstPropertyName, void* varArgs) nothrow;
__gshared c_g_object_new_valistFn c_g_object_new_valist; ///
private alias c_g_object_new_with_propertiesFn = extern(C) GObject* function(GType objectType, uint nProperties, const(char*)* names, const(GValue)* values) nothrow;
__gshared c_g_object_new_with_propertiesFn c_g_object_new_with_properties; ///
private alias c_g_object_newvFn = extern(C) GObject* function(GType objectType, uint nParameters, GParameter* parameters) nothrow;
__gshared c_g_object_newvFn c_g_object_newv; ///
private alias c_g_object_compat_controlFn = extern(C) size_t function(size_t what, void* data) nothrow;
__gshared c_g_object_compat_controlFn c_g_object_compat_control; ///
private alias c_g_object_interface_find_propertyFn = extern(C) GParamSpec* function(GTypeInterface* gIface, const(char)* propertyName) nothrow;
__gshared c_g_object_interface_find_propertyFn c_g_object_interface_find_property; ///
private alias c_g_object_interface_install_propertyFn = extern(C) void function(GTypeInterface* gIface, GParamSpec* pspec) nothrow;
__gshared c_g_object_interface_install_propertyFn c_g_object_interface_install_property; ///
private alias c_g_object_interface_list_propertiesFn = extern(C) GParamSpec** function(GTypeInterface* gIface, uint* nPropertiesP) nothrow;
__gshared c_g_object_interface_list_propertiesFn c_g_object_interface_list_properties; ///
private alias c_g_object_add_toggle_refFn = extern(C) void function(GObject* object, GToggleNotify notify, void* data) nothrow;
__gshared c_g_object_add_toggle_refFn c_g_object_add_toggle_ref; ///
private alias c_g_object_add_weak_pointerFn = extern(C) void function(GObject* object, void** weakPointerLocation) nothrow;
__gshared c_g_object_add_weak_pointerFn c_g_object_add_weak_pointer; ///
private alias c_g_object_bind_propertyFn = extern(C) GBinding* function(GObject* source, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags) nothrow;
__gshared c_g_object_bind_propertyFn c_g_object_bind_property; ///
private alias c_g_object_bind_property_fullFn = extern(C) GBinding* function(GObject* source, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags, GBindingTransformFunc transformTo, GBindingTransformFunc transformFrom, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_object_bind_property_fullFn c_g_object_bind_property_full; ///
private alias c_g_object_bind_property_with_closuresFn = extern(C) GBinding* function(GObject* source, const(char)* sourceProperty, GObject* target, const(char)* targetProperty, GBindingFlags flags, GClosure* transformTo, GClosure* transformFrom) nothrow;
__gshared c_g_object_bind_property_with_closuresFn c_g_object_bind_property_with_closures; ///
private alias c_g_object_connectFn = extern(C) GObject* function(GObject* object, const(char)* signalSpec,  ...) nothrow;
__gshared c_g_object_connectFn c_g_object_connect; ///
private alias c_g_object_disconnectFn = extern(C) void function(GObject* object, const(char)* signalSpec,  ...) nothrow;
__gshared c_g_object_disconnectFn c_g_object_disconnect; ///
private alias c_g_object_dup_dataFn = extern(C) void* function(GObject* object, const(char)* key, GDuplicateFunc dupFunc, void* userData) nothrow;
__gshared c_g_object_dup_dataFn c_g_object_dup_data; ///
private alias c_g_object_dup_qdataFn = extern(C) void* function(GObject* object, GQuark quark, GDuplicateFunc dupFunc, void* userData) nothrow;
__gshared c_g_object_dup_qdataFn c_g_object_dup_qdata; ///
private alias c_g_object_force_floatingFn = extern(C) void function(GObject* object) nothrow;
__gshared c_g_object_force_floatingFn c_g_object_force_floating; ///
private alias c_g_object_freeze_notifyFn = extern(C) void function(GObject* object) nothrow;
__gshared c_g_object_freeze_notifyFn c_g_object_freeze_notify; ///
private alias c_g_object_getFn = extern(C) void function(GObject* object, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_g_object_getFn c_g_object_get; ///
private alias c_g_object_get_dataFn = extern(C) void* function(GObject* object, const(char)* key) nothrow;
__gshared c_g_object_get_dataFn c_g_object_get_data; ///
private alias c_g_object_get_propertyFn = extern(C) void function(GObject* object, const(char)* propertyName, GValue* value) nothrow;
__gshared c_g_object_get_propertyFn c_g_object_get_property; ///
private alias c_g_object_get_qdataFn = extern(C) void* function(GObject* object, GQuark quark) nothrow;
__gshared c_g_object_get_qdataFn c_g_object_get_qdata; ///
private alias c_g_object_get_valistFn = extern(C) void function(GObject* object, const(char)* firstPropertyName, void* varArgs) nothrow;
__gshared c_g_object_get_valistFn c_g_object_get_valist; ///
private alias c_g_object_getvFn = extern(C) void function(GObject* object, uint nProperties, const(char*)* names, GValue* values) nothrow;
__gshared c_g_object_getvFn c_g_object_getv; ///
private alias c_g_object_is_floatingFn = extern(C) gboolean function(GObject* object) nothrow;
__gshared c_g_object_is_floatingFn c_g_object_is_floating; ///
private alias c_g_object_notifyFn = extern(C) void function(GObject* object, const(char)* propertyName) nothrow;
__gshared c_g_object_notifyFn c_g_object_notify; ///
private alias c_g_object_notify_by_pspecFn = extern(C) void function(GObject* object, GParamSpec* pspec) nothrow;
__gshared c_g_object_notify_by_pspecFn c_g_object_notify_by_pspec; ///
private alias c_g_object_refFn = extern(C) GObject* function(GObject* object) nothrow;
__gshared c_g_object_refFn c_g_object_ref; ///
private alias c_g_object_ref_sinkFn = extern(C) GObject* function(GObject* object) nothrow;
__gshared c_g_object_ref_sinkFn c_g_object_ref_sink; ///
private alias c_g_object_remove_toggle_refFn = extern(C) void function(GObject* object, GToggleNotify notify, void* data) nothrow;
__gshared c_g_object_remove_toggle_refFn c_g_object_remove_toggle_ref; ///
private alias c_g_object_remove_weak_pointerFn = extern(C) void function(GObject* object, void** weakPointerLocation) nothrow;
__gshared c_g_object_remove_weak_pointerFn c_g_object_remove_weak_pointer; ///
private alias c_g_object_replace_dataFn = extern(C) gboolean function(GObject* object, const(char)* key, void* oldval, void* newval, GDestroyNotify destroy, GDestroyNotify* oldDestroy) nothrow;
__gshared c_g_object_replace_dataFn c_g_object_replace_data; ///
private alias c_g_object_replace_qdataFn = extern(C) gboolean function(GObject* object, GQuark quark, void* oldval, void* newval, GDestroyNotify destroy, GDestroyNotify* oldDestroy) nothrow;
__gshared c_g_object_replace_qdataFn c_g_object_replace_qdata; ///
private alias c_g_object_run_disposeFn = extern(C) void function(GObject* object) nothrow;
__gshared c_g_object_run_disposeFn c_g_object_run_dispose; ///
private alias c_g_object_setFn = extern(C) void function(GObject* object, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_g_object_setFn c_g_object_set; ///
private alias c_g_object_set_dataFn = extern(C) void function(GObject* object, const(char)* key, void* data) nothrow;
__gshared c_g_object_set_dataFn c_g_object_set_data; ///
private alias c_g_object_set_data_fullFn = extern(C) void function(GObject* object, const(char)* key, void* data, GDestroyNotify destroy) nothrow;
__gshared c_g_object_set_data_fullFn c_g_object_set_data_full; ///
private alias c_g_object_set_propertyFn = extern(C) void function(GObject* object, const(char)* propertyName, const(GValue)* value) nothrow;
__gshared c_g_object_set_propertyFn c_g_object_set_property; ///
private alias c_g_object_set_qdataFn = extern(C) void function(GObject* object, GQuark quark, void* data) nothrow;
__gshared c_g_object_set_qdataFn c_g_object_set_qdata; ///
private alias c_g_object_set_qdata_fullFn = extern(C) void function(GObject* object, GQuark quark, void* data, GDestroyNotify destroy) nothrow;
__gshared c_g_object_set_qdata_fullFn c_g_object_set_qdata_full; ///
private alias c_g_object_set_valistFn = extern(C) void function(GObject* object, const(char)* firstPropertyName, void* varArgs) nothrow;
__gshared c_g_object_set_valistFn c_g_object_set_valist; ///
private alias c_g_object_setvFn = extern(C) void function(GObject* object, uint nProperties, const(char*)* names, const(GValue)* values) nothrow;
__gshared c_g_object_setvFn c_g_object_setv; ///
private alias c_g_object_steal_dataFn = extern(C) void* function(GObject* object, const(char)* key) nothrow;
__gshared c_g_object_steal_dataFn c_g_object_steal_data; ///
private alias c_g_object_steal_qdataFn = extern(C) void* function(GObject* object, GQuark quark) nothrow;
__gshared c_g_object_steal_qdataFn c_g_object_steal_qdata; ///
private alias c_g_object_take_refFn = extern(C) GObject* function(GObject* object) nothrow;
__gshared c_g_object_take_refFn c_g_object_take_ref; ///
private alias c_g_object_thaw_notifyFn = extern(C) void function(GObject* object) nothrow;
__gshared c_g_object_thaw_notifyFn c_g_object_thaw_notify; ///
private alias c_g_object_unrefFn = extern(C) void function(GObject* object) nothrow;
__gshared c_g_object_unrefFn c_g_object_unref; ///
private alias c_g_object_watch_closureFn = extern(C) void function(GObject* object, GClosure* closure) nothrow;
__gshared c_g_object_watch_closureFn c_g_object_watch_closure; ///
private alias c_g_object_weak_refFn = extern(C) void function(GObject* object, GWeakNotify notify, void* data) nothrow;
__gshared c_g_object_weak_refFn c_g_object_weak_ref; ///
private alias c_g_object_weak_unrefFn = extern(C) void function(GObject* object, GWeakNotify notify, void* data) nothrow;
__gshared c_g_object_weak_unrefFn c_g_object_weak_unref; ///

// ParamSpec
private alias c_g_param_spec_internalFn = extern(C) GParamSpec* function(GType paramType, const(char)* name, const(char)* nick, const(char)* blurb, GParamFlags flags) nothrow;
__gshared c_g_param_spec_internalFn c_g_param_spec_internal; ///
private alias c_g_param_spec_is_valid_nameFn = extern(C) gboolean function(const(char)* name) nothrow;
__gshared c_g_param_spec_is_valid_nameFn c_g_param_spec_is_valid_name; ///
private alias c_g_param_spec_get_blurbFn = extern(C) const(char)* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_blurbFn c_g_param_spec_get_blurb; ///
private alias c_g_param_spec_get_default_valueFn = extern(C) const(GValue)* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_default_valueFn c_g_param_spec_get_default_value; ///
private alias c_g_param_spec_get_nameFn = extern(C) const(char)* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_nameFn c_g_param_spec_get_name; ///
private alias c_g_param_spec_get_name_quarkFn = extern(C) GQuark function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_name_quarkFn c_g_param_spec_get_name_quark; ///
private alias c_g_param_spec_get_nickFn = extern(C) const(char)* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_nickFn c_g_param_spec_get_nick; ///
private alias c_g_param_spec_get_qdataFn = extern(C) void* function(GParamSpec* pspec, GQuark quark) nothrow;
__gshared c_g_param_spec_get_qdataFn c_g_param_spec_get_qdata; ///
private alias c_g_param_spec_get_redirect_targetFn = extern(C) GParamSpec* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_get_redirect_targetFn c_g_param_spec_get_redirect_target; ///
private alias c_g_param_spec_refFn = extern(C) GParamSpec* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_refFn c_g_param_spec_ref; ///
private alias c_g_param_spec_ref_sinkFn = extern(C) GParamSpec* function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_ref_sinkFn c_g_param_spec_ref_sink; ///
private alias c_g_param_spec_set_qdataFn = extern(C) void function(GParamSpec* pspec, GQuark quark, void* data) nothrow;
__gshared c_g_param_spec_set_qdataFn c_g_param_spec_set_qdata; ///
private alias c_g_param_spec_set_qdata_fullFn = extern(C) void function(GParamSpec* pspec, GQuark quark, void* data, GDestroyNotify destroy) nothrow;
__gshared c_g_param_spec_set_qdata_fullFn c_g_param_spec_set_qdata_full; ///
private alias c_g_param_spec_sinkFn = extern(C) void function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_sinkFn c_g_param_spec_sink; ///
private alias c_g_param_spec_steal_qdataFn = extern(C) void* function(GParamSpec* pspec, GQuark quark) nothrow;
__gshared c_g_param_spec_steal_qdataFn c_g_param_spec_steal_qdata; ///
private alias c_g_param_spec_unrefFn = extern(C) void function(GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_unrefFn c_g_param_spec_unref; ///

// ParamSpecPool
private alias c_g_param_spec_pool_freeFn = extern(C) void function(GParamSpecPool* pool) nothrow;
__gshared c_g_param_spec_pool_freeFn c_g_param_spec_pool_free; ///
private alias c_g_param_spec_pool_insertFn = extern(C) void function(GParamSpecPool* pool, GParamSpec* pspec, GType ownerType) nothrow;
__gshared c_g_param_spec_pool_insertFn c_g_param_spec_pool_insert; ///
private alias c_g_param_spec_pool_listFn = extern(C) GParamSpec** function(GParamSpecPool* pool, GType ownerType, uint* nPspecsP) nothrow;
__gshared c_g_param_spec_pool_listFn c_g_param_spec_pool_list; ///
private alias c_g_param_spec_pool_list_ownedFn = extern(C) GList* function(GParamSpecPool* pool, GType ownerType) nothrow;
__gshared c_g_param_spec_pool_list_ownedFn c_g_param_spec_pool_list_owned; ///
private alias c_g_param_spec_pool_lookupFn = extern(C) GParamSpec* function(GParamSpecPool* pool, const(char)* paramName, GType ownerType, gboolean walkAncestors) nothrow;
__gshared c_g_param_spec_pool_lookupFn c_g_param_spec_pool_lookup; ///
private alias c_g_param_spec_pool_removeFn = extern(C) void function(GParamSpecPool* pool, GParamSpec* pspec) nothrow;
__gshared c_g_param_spec_pool_removeFn c_g_param_spec_pool_remove; ///
private alias c_g_param_spec_pool_newFn = extern(C) GParamSpecPool* function(gboolean typePrefixing) nothrow;
__gshared c_g_param_spec_pool_newFn c_g_param_spec_pool_new; ///

// SignalGroup
private alias c_g_signal_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_signal_group_get_typeFn c_g_signal_group_get_type; ///
private alias c_g_signal_group_newFn = extern(C) GSignalGroup* function(GType targetType) nothrow;
__gshared c_g_signal_group_newFn c_g_signal_group_new; ///
private alias c_g_signal_group_blockFn = extern(C) void function(GSignalGroup* self) nothrow;
__gshared c_g_signal_group_blockFn c_g_signal_group_block; ///
private alias c_g_signal_group_connectFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) nothrow;
__gshared c_g_signal_group_connectFn c_g_signal_group_connect; ///
private alias c_g_signal_group_connect_afterFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) nothrow;
__gshared c_g_signal_group_connect_afterFn c_g_signal_group_connect_after; ///
private alias c_g_signal_group_connect_closureFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GClosure* closure, gboolean after) nothrow;
__gshared c_g_signal_group_connect_closureFn c_g_signal_group_connect_closure; ///
private alias c_g_signal_group_connect_dataFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data, GClosureNotify notify, GConnectFlags flags) nothrow;
__gshared c_g_signal_group_connect_dataFn c_g_signal_group_connect_data; ///
private alias c_g_signal_group_connect_objectFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* object, GConnectFlags flags) nothrow;
__gshared c_g_signal_group_connect_objectFn c_g_signal_group_connect_object; ///
private alias c_g_signal_group_connect_swappedFn = extern(C) void function(GSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) nothrow;
__gshared c_g_signal_group_connect_swappedFn c_g_signal_group_connect_swapped; ///
private alias c_g_signal_group_dup_targetFn = extern(C) GObject* function(GSignalGroup* self) nothrow;
__gshared c_g_signal_group_dup_targetFn c_g_signal_group_dup_target; ///
private alias c_g_signal_group_set_targetFn = extern(C) void function(GSignalGroup* self, GObject* target) nothrow;
__gshared c_g_signal_group_set_targetFn c_g_signal_group_set_target; ///
private alias c_g_signal_group_unblockFn = extern(C) void function(GSignalGroup* self) nothrow;
__gshared c_g_signal_group_unblockFn c_g_signal_group_unblock; ///

// TypeClass
private alias c_g_type_class_add_privateFn = extern(C) void function(GTypeClass* gClass, size_t privateSize) nothrow;
__gshared c_g_type_class_add_privateFn c_g_type_class_add_private; ///
private alias c_g_type_class_get_instance_private_offsetFn = extern(C) int function(GTypeClass* gClass) nothrow;
__gshared c_g_type_class_get_instance_private_offsetFn c_g_type_class_get_instance_private_offset; ///
private alias c_g_type_class_get_privateFn = extern(C) void* function(GTypeClass* klass, GType privateType) nothrow;
__gshared c_g_type_class_get_privateFn c_g_type_class_get_private; ///
private alias c_g_type_class_peek_parentFn = extern(C) GTypeClass* function(GTypeClass* gClass) nothrow;
__gshared c_g_type_class_peek_parentFn c_g_type_class_peek_parent; ///
private alias c_g_type_class_unrefFn = extern(C) void function(GTypeClass* gClass) nothrow;
__gshared c_g_type_class_unrefFn c_g_type_class_unref; ///
private alias c_g_type_class_unref_uncachedFn = extern(C) void function(GTypeClass* gClass) nothrow;
__gshared c_g_type_class_unref_uncachedFn c_g_type_class_unref_uncached; ///
private alias c_g_type_class_adjust_private_offsetFn = extern(C) void function(void* gClass, int* privateSizeOrOffset) nothrow;
__gshared c_g_type_class_adjust_private_offsetFn c_g_type_class_adjust_private_offset; ///
private alias c_g_type_class_getFn = extern(C) GTypeClass* function(GType type) nothrow;
__gshared c_g_type_class_getFn c_g_type_class_get; ///
private alias c_g_type_class_peekFn = extern(C) GTypeClass* function(GType type) nothrow;
__gshared c_g_type_class_peekFn c_g_type_class_peek; ///
private alias c_g_type_class_peek_staticFn = extern(C) GTypeClass* function(GType type) nothrow;
__gshared c_g_type_class_peek_staticFn c_g_type_class_peek_static; ///
private alias c_g_type_class_refFn = extern(C) GTypeClass* function(GType type) nothrow;
__gshared c_g_type_class_refFn c_g_type_class_ref; ///

// TypeInstance
private alias c_g_type_instance_get_privateFn = extern(C) void* function(GTypeInstance* instance, GType privateType) nothrow;
__gshared c_g_type_instance_get_privateFn c_g_type_instance_get_private; ///

// TypeInterface
private alias c_g_type_interface_peek_parentFn = extern(C) GTypeInterface* function(GTypeInterface* gIface) nothrow;
__gshared c_g_type_interface_peek_parentFn c_g_type_interface_peek_parent; ///
private alias c_g_type_interface_add_prerequisiteFn = extern(C) void function(GType interfaceType, GType prerequisiteType) nothrow;
__gshared c_g_type_interface_add_prerequisiteFn c_g_type_interface_add_prerequisite; ///
private alias c_g_type_interface_get_pluginFn = extern(C) GTypePlugin* function(GType instanceType, GType interfaceType) nothrow;
__gshared c_g_type_interface_get_pluginFn c_g_type_interface_get_plugin; ///
private alias c_g_type_interface_instantiatable_prerequisiteFn = extern(C) GType function(GType interfaceType) nothrow;
__gshared c_g_type_interface_instantiatable_prerequisiteFn c_g_type_interface_instantiatable_prerequisite; ///
private alias c_g_type_interface_peekFn = extern(C) GTypeInterface* function(GTypeClass* instanceClass, GType ifaceType) nothrow;
__gshared c_g_type_interface_peekFn c_g_type_interface_peek; ///
private alias c_g_type_interface_prerequisitesFn = extern(C) GType* function(GType interfaceType, uint* nPrerequisites) nothrow;
__gshared c_g_type_interface_prerequisitesFn c_g_type_interface_prerequisites; ///

// TypeModule
private alias c_g_type_module_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_type_module_get_typeFn c_g_type_module_get_type; ///
private alias c_g_type_module_add_interfaceFn = extern(C) void function(GTypeModule* module_, GType instanceType, GType interfaceType, const(GInterfaceInfo)* interfaceInfo) nothrow;
__gshared c_g_type_module_add_interfaceFn c_g_type_module_add_interface; ///
private alias c_g_type_module_register_enumFn = extern(C) GType function(GTypeModule* module_, const(char)* name, const(GEnumValue)* constStaticValues) nothrow;
__gshared c_g_type_module_register_enumFn c_g_type_module_register_enum; ///
private alias c_g_type_module_register_flagsFn = extern(C) GType function(GTypeModule* module_, const(char)* name, const(GFlagsValue)* constStaticValues) nothrow;
__gshared c_g_type_module_register_flagsFn c_g_type_module_register_flags; ///
private alias c_g_type_module_register_typeFn = extern(C) GType function(GTypeModule* module_, GType parentType, const(char)* typeName, const(GTypeInfo)* typeInfo, GTypeFlags flags) nothrow;
__gshared c_g_type_module_register_typeFn c_g_type_module_register_type; ///
private alias c_g_type_module_set_nameFn = extern(C) void function(GTypeModule* module_, const(char)* name) nothrow;
__gshared c_g_type_module_set_nameFn c_g_type_module_set_name; ///
private alias c_g_type_module_unuseFn = extern(C) void function(GTypeModule* module_) nothrow;
__gshared c_g_type_module_unuseFn c_g_type_module_unuse; ///
private alias c_g_type_module_useFn = extern(C) gboolean function(GTypeModule* module_) nothrow;
__gshared c_g_type_module_useFn c_g_type_module_use; ///

// TypePlugin
private alias c_g_type_plugin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_type_plugin_get_typeFn c_g_type_plugin_get_type; ///
private alias c_g_type_plugin_complete_interface_infoFn = extern(C) void function(GTypePlugin* plugin, GType instanceType, GType interfaceType, GInterfaceInfo* info) nothrow;
__gshared c_g_type_plugin_complete_interface_infoFn c_g_type_plugin_complete_interface_info; ///
private alias c_g_type_plugin_complete_type_infoFn = extern(C) void function(GTypePlugin* plugin, GType gType, GTypeInfo* info, GTypeValueTable* valueTable) nothrow;
__gshared c_g_type_plugin_complete_type_infoFn c_g_type_plugin_complete_type_info; ///
private alias c_g_type_plugin_unuseFn = extern(C) void function(GTypePlugin* plugin) nothrow;
__gshared c_g_type_plugin_unuseFn c_g_type_plugin_unuse; ///
private alias c_g_type_plugin_useFn = extern(C) void function(GTypePlugin* plugin) nothrow;
__gshared c_g_type_plugin_useFn c_g_type_plugin_use; ///

// TypeValueTable
private alias c_g_type_value_table_peekFn = extern(C) GTypeValueTable* function(GType type) nothrow;
__gshared c_g_type_value_table_peekFn c_g_type_value_table_peek; ///

// Value
private alias c_g_value_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_value_get_typeFn c_g_value_get_type; ///
private alias c_g_value_copyFn = extern(C) void function(const(GValue)* srcValue, GValue* destValue) nothrow;
__gshared c_g_value_copyFn c_g_value_copy; ///
private alias c_g_value_dup_boxedFn = extern(C) void* function(const(GValue)* value) nothrow;
__gshared c_g_value_dup_boxedFn c_g_value_dup_boxed; ///
private alias c_g_value_dup_objectFn = extern(C) GObject* function(const(GValue)* value) nothrow;
__gshared c_g_value_dup_objectFn c_g_value_dup_object; ///
private alias c_g_value_dup_paramFn = extern(C) GParamSpec* function(const(GValue)* value) nothrow;
__gshared c_g_value_dup_paramFn c_g_value_dup_param; ///
private alias c_g_value_dup_stringFn = extern(C) char* function(const(GValue)* value) nothrow;
__gshared c_g_value_dup_stringFn c_g_value_dup_string; ///
private alias c_g_value_dup_variantFn = extern(C) GVariant* function(const(GValue)* value) nothrow;
__gshared c_g_value_dup_variantFn c_g_value_dup_variant; ///
private alias c_g_value_fits_pointerFn = extern(C) gboolean function(const(GValue)* value) nothrow;
__gshared c_g_value_fits_pointerFn c_g_value_fits_pointer; ///
private alias c_g_value_get_booleanFn = extern(C) gboolean function(const(GValue)* value) nothrow;
__gshared c_g_value_get_booleanFn c_g_value_get_boolean; ///
private alias c_g_value_get_boxedFn = extern(C) void* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_boxedFn c_g_value_get_boxed; ///
private alias c_g_value_get_charFn = extern(C) char function(const(GValue)* value) nothrow;
__gshared c_g_value_get_charFn c_g_value_get_char; ///
private alias c_g_value_get_doubleFn = extern(C) double function(const(GValue)* value) nothrow;
__gshared c_g_value_get_doubleFn c_g_value_get_double; ///
private alias c_g_value_get_enumFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_g_value_get_enumFn c_g_value_get_enum; ///
private alias c_g_value_get_flagsFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_g_value_get_flagsFn c_g_value_get_flags; ///
private alias c_g_value_get_floatFn = extern(C) float function(const(GValue)* value) nothrow;
__gshared c_g_value_get_floatFn c_g_value_get_float; ///
private alias c_g_value_get_gtypeFn = extern(C) GType function(const(GValue)* value) nothrow;
__gshared c_g_value_get_gtypeFn c_g_value_get_gtype; ///
private alias c_g_value_get_intFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_g_value_get_intFn c_g_value_get_int; ///
private alias c_g_value_get_int64Fn = extern(C) long function(const(GValue)* value) nothrow;
__gshared c_g_value_get_int64Fn c_g_value_get_int64; ///
private alias c_g_value_get_longFn = extern(C) glong function(const(GValue)* value) nothrow;
__gshared c_g_value_get_longFn c_g_value_get_long; ///
private alias c_g_value_get_objectFn = extern(C) GObject* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_objectFn c_g_value_get_object; ///
private alias c_g_value_get_paramFn = extern(C) GParamSpec* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_paramFn c_g_value_get_param; ///
private alias c_g_value_get_pointerFn = extern(C) void* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_pointerFn c_g_value_get_pointer; ///
private alias c_g_value_get_scharFn = extern(C) byte function(const(GValue)* value) nothrow;
__gshared c_g_value_get_scharFn c_g_value_get_schar; ///
private alias c_g_value_get_stringFn = extern(C) const(char)* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_stringFn c_g_value_get_string; ///
private alias c_g_value_get_ucharFn = extern(C) ubyte function(const(GValue)* value) nothrow;
__gshared c_g_value_get_ucharFn c_g_value_get_uchar; ///
private alias c_g_value_get_uintFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_g_value_get_uintFn c_g_value_get_uint; ///
private alias c_g_value_get_uint64Fn = extern(C) ulong function(const(GValue)* value) nothrow;
__gshared c_g_value_get_uint64Fn c_g_value_get_uint64; ///
private alias c_g_value_get_ulongFn = extern(C) gulong function(const(GValue)* value) nothrow;
__gshared c_g_value_get_ulongFn c_g_value_get_ulong; ///
private alias c_g_value_get_variantFn = extern(C) GVariant* function(const(GValue)* value) nothrow;
__gshared c_g_value_get_variantFn c_g_value_get_variant; ///
private alias c_g_value_initFn = extern(C) GValue* function(GValue* value, GType gType) nothrow;
__gshared c_g_value_initFn c_g_value_init; ///
private alias c_g_value_init_from_instanceFn = extern(C) void function(GValue* value, GTypeInstance* instance) nothrow;
__gshared c_g_value_init_from_instanceFn c_g_value_init_from_instance; ///
private alias c_g_value_peek_pointerFn = extern(C) void* function(const(GValue)* value) nothrow;
__gshared c_g_value_peek_pointerFn c_g_value_peek_pointer; ///
private alias c_g_value_resetFn = extern(C) GValue* function(GValue* value) nothrow;
__gshared c_g_value_resetFn c_g_value_reset; ///
private alias c_g_value_set_booleanFn = extern(C) void function(GValue* value, gboolean vBoolean) nothrow;
__gshared c_g_value_set_booleanFn c_g_value_set_boolean; ///
private alias c_g_value_set_boxedFn = extern(C) void function(GValue* value, const(void)* vBoxed) nothrow;
__gshared c_g_value_set_boxedFn c_g_value_set_boxed; ///
private alias c_g_value_set_boxed_take_ownershipFn = extern(C) void function(GValue* value, const(void)* vBoxed) nothrow;
__gshared c_g_value_set_boxed_take_ownershipFn c_g_value_set_boxed_take_ownership; ///
private alias c_g_value_set_charFn = extern(C) void function(GValue* value, char vChar) nothrow;
__gshared c_g_value_set_charFn c_g_value_set_char; ///
private alias c_g_value_set_doubleFn = extern(C) void function(GValue* value, double vDouble) nothrow;
__gshared c_g_value_set_doubleFn c_g_value_set_double; ///
private alias c_g_value_set_enumFn = extern(C) void function(GValue* value, int vEnum) nothrow;
__gshared c_g_value_set_enumFn c_g_value_set_enum; ///
private alias c_g_value_set_flagsFn = extern(C) void function(GValue* value, uint vFlags) nothrow;
__gshared c_g_value_set_flagsFn c_g_value_set_flags; ///
private alias c_g_value_set_floatFn = extern(C) void function(GValue* value, float vFloat) nothrow;
__gshared c_g_value_set_floatFn c_g_value_set_float; ///
private alias c_g_value_set_gtypeFn = extern(C) void function(GValue* value, GType vGtype) nothrow;
__gshared c_g_value_set_gtypeFn c_g_value_set_gtype; ///
private alias c_g_value_set_instanceFn = extern(C) void function(GValue* value, void* instance) nothrow;
__gshared c_g_value_set_instanceFn c_g_value_set_instance; ///
private alias c_g_value_set_intFn = extern(C) void function(GValue* value, int vInt) nothrow;
__gshared c_g_value_set_intFn c_g_value_set_int; ///
private alias c_g_value_set_int64Fn = extern(C) void function(GValue* value, long vInt64) nothrow;
__gshared c_g_value_set_int64Fn c_g_value_set_int64; ///
private alias c_g_value_set_interned_stringFn = extern(C) void function(GValue* value, const(char)* vString) nothrow;
__gshared c_g_value_set_interned_stringFn c_g_value_set_interned_string; ///
private alias c_g_value_set_longFn = extern(C) void function(GValue* value, glong vLong) nothrow;
__gshared c_g_value_set_longFn c_g_value_set_long; ///
private alias c_g_value_set_objectFn = extern(C) void function(GValue* value, GObject* vObject) nothrow;
__gshared c_g_value_set_objectFn c_g_value_set_object; ///
private alias c_g_value_set_object_take_ownershipFn = extern(C) void function(GValue* value, void* vObject) nothrow;
__gshared c_g_value_set_object_take_ownershipFn c_g_value_set_object_take_ownership; ///
private alias c_g_value_set_paramFn = extern(C) void function(GValue* value, GParamSpec* param) nothrow;
__gshared c_g_value_set_paramFn c_g_value_set_param; ///
private alias c_g_value_set_param_take_ownershipFn = extern(C) void function(GValue* value, GParamSpec* param) nothrow;
__gshared c_g_value_set_param_take_ownershipFn c_g_value_set_param_take_ownership; ///
private alias c_g_value_set_pointerFn = extern(C) void function(GValue* value, void* vPointer) nothrow;
__gshared c_g_value_set_pointerFn c_g_value_set_pointer; ///
private alias c_g_value_set_scharFn = extern(C) void function(GValue* value, byte vChar) nothrow;
__gshared c_g_value_set_scharFn c_g_value_set_schar; ///
private alias c_g_value_set_static_boxedFn = extern(C) void function(GValue* value, const(void)* vBoxed) nothrow;
__gshared c_g_value_set_static_boxedFn c_g_value_set_static_boxed; ///
private alias c_g_value_set_static_stringFn = extern(C) void function(GValue* value, const(char)* vString) nothrow;
__gshared c_g_value_set_static_stringFn c_g_value_set_static_string; ///
private alias c_g_value_set_stringFn = extern(C) void function(GValue* value, const(char)* vString) nothrow;
__gshared c_g_value_set_stringFn c_g_value_set_string; ///
private alias c_g_value_set_string_take_ownershipFn = extern(C) void function(GValue* value, char* vString) nothrow;
__gshared c_g_value_set_string_take_ownershipFn c_g_value_set_string_take_ownership; ///
private alias c_g_value_set_ucharFn = extern(C) void function(GValue* value, ubyte vUchar) nothrow;
__gshared c_g_value_set_ucharFn c_g_value_set_uchar; ///
private alias c_g_value_set_uintFn = extern(C) void function(GValue* value, uint vUint) nothrow;
__gshared c_g_value_set_uintFn c_g_value_set_uint; ///
private alias c_g_value_set_uint64Fn = extern(C) void function(GValue* value, ulong vUint64) nothrow;
__gshared c_g_value_set_uint64Fn c_g_value_set_uint64; ///
private alias c_g_value_set_ulongFn = extern(C) void function(GValue* value, gulong vUlong) nothrow;
__gshared c_g_value_set_ulongFn c_g_value_set_ulong; ///
private alias c_g_value_set_variantFn = extern(C) void function(GValue* value, GVariant* variant) nothrow;
__gshared c_g_value_set_variantFn c_g_value_set_variant; ///
private alias c_g_value_steal_stringFn = extern(C) char* function(GValue* value) nothrow;
__gshared c_g_value_steal_stringFn c_g_value_steal_string; ///
private alias c_g_value_take_boxedFn = extern(C) void function(GValue* value, const(void)* vBoxed) nothrow;
__gshared c_g_value_take_boxedFn c_g_value_take_boxed; ///
private alias c_g_value_take_objectFn = extern(C) void function(GValue* value, void* vObject) nothrow;
__gshared c_g_value_take_objectFn c_g_value_take_object; ///
private alias c_g_value_take_paramFn = extern(C) void function(GValue* value, GParamSpec* param) nothrow;
__gshared c_g_value_take_paramFn c_g_value_take_param; ///
private alias c_g_value_take_stringFn = extern(C) void function(GValue* value, char* vString) nothrow;
__gshared c_g_value_take_stringFn c_g_value_take_string; ///
private alias c_g_value_take_variantFn = extern(C) void function(GValue* value, GVariant* variant) nothrow;
__gshared c_g_value_take_variantFn c_g_value_take_variant; ///
private alias c_g_value_transformFn = extern(C) gboolean function(const(GValue)* srcValue, GValue* destValue) nothrow;
__gshared c_g_value_transformFn c_g_value_transform; ///
private alias c_g_value_unsetFn = extern(C) void function(GValue* value) nothrow;
__gshared c_g_value_unsetFn c_g_value_unset; ///
private alias c_g_value_register_transform_funcFn = extern(C) void function(GType srcType, GType destType, GValueTransform transformFunc) nothrow;
__gshared c_g_value_register_transform_funcFn c_g_value_register_transform_func; ///
private alias c_g_value_type_compatibleFn = extern(C) gboolean function(GType srcType, GType destType) nothrow;
__gshared c_g_value_type_compatibleFn c_g_value_type_compatible; ///
private alias c_g_value_type_transformableFn = extern(C) gboolean function(GType srcType, GType destType) nothrow;
__gshared c_g_value_type_transformableFn c_g_value_type_transformable; ///

// ValueArray
private alias c_g_value_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_value_array_get_typeFn c_g_value_array_get_type; ///
private alias c_g_value_array_newFn = extern(C) GValueArray* function(uint nPrealloced) nothrow;
__gshared c_g_value_array_newFn c_g_value_array_new; ///
private alias c_g_value_array_appendFn = extern(C) GValueArray* function(GValueArray* valueArray, const(GValue)* value) nothrow;
__gshared c_g_value_array_appendFn c_g_value_array_append; ///
private alias c_g_value_array_copyFn = extern(C) GValueArray* function(const(GValueArray)* valueArray) nothrow;
__gshared c_g_value_array_copyFn c_g_value_array_copy; ///
private alias c_g_value_array_freeFn = extern(C) void function(GValueArray* valueArray) nothrow;
__gshared c_g_value_array_freeFn c_g_value_array_free; ///
private alias c_g_value_array_get_nthFn = extern(C) GValue* function(GValueArray* valueArray, uint index) nothrow;
__gshared c_g_value_array_get_nthFn c_g_value_array_get_nth; ///
private alias c_g_value_array_insertFn = extern(C) GValueArray* function(GValueArray* valueArray, uint index, const(GValue)* value) nothrow;
__gshared c_g_value_array_insertFn c_g_value_array_insert; ///
private alias c_g_value_array_prependFn = extern(C) GValueArray* function(GValueArray* valueArray, const(GValue)* value) nothrow;
__gshared c_g_value_array_prependFn c_g_value_array_prepend; ///
private alias c_g_value_array_removeFn = extern(C) GValueArray* function(GValueArray* valueArray, uint index) nothrow;
__gshared c_g_value_array_removeFn c_g_value_array_remove; ///
private alias c_g_value_array_sortFn = extern(C) GValueArray* function(GValueArray* valueArray, GCompareFunc compareFunc) nothrow;
__gshared c_g_value_array_sortFn c_g_value_array_sort; ///
private alias c_g_value_array_sort_with_dataFn = extern(C) GValueArray* function(GValueArray* valueArray, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_value_array_sort_with_dataFn c_g_value_array_sort_with_data; ///

// WeakRef
private alias c_g_weak_ref_clearFn = extern(C) void function(GWeakRef* weakRef) nothrow;
__gshared c_g_weak_ref_clearFn c_g_weak_ref_clear; ///
private alias c_g_weak_ref_getFn = extern(C) GObject* function(GWeakRef* weakRef) nothrow;
__gshared c_g_weak_ref_getFn c_g_weak_ref_get; ///
private alias c_g_weak_ref_initFn = extern(C) void function(GWeakRef* weakRef, GObject* object) nothrow;
__gshared c_g_weak_ref_initFn c_g_weak_ref_init; ///
private alias c_g_weak_ref_setFn = extern(C) void function(GWeakRef* weakRef, GObject* object) nothrow;
__gshared c_g_weak_ref_setFn c_g_weak_ref_set; ///

// global
private alias c_g_source_set_closureFn = extern(C) void function(GSource* source, GClosure* closure) nothrow;
__gshared c_g_source_set_closureFn c_g_source_set_closure; ///
private alias c_g_source_set_dummy_callbackFn = extern(C) void function(GSource* source) nothrow;
__gshared c_g_source_set_dummy_callbackFn c_g_source_set_dummy_callback; ///
private alias c_g_boxed_copyFn = extern(C) void* function(GType boxedType, const(void)* srcBoxed) nothrow;
__gshared c_g_boxed_copyFn c_g_boxed_copy; ///
private alias c_g_boxed_freeFn = extern(C) void function(GType boxedType, void* boxed) nothrow;
__gshared c_g_boxed_freeFn c_g_boxed_free; ///
private alias c_g_boxed_type_register_staticFn = extern(C) GType function(const(char)* name, GBoxedCopyFunc boxedCopy, GBoxedFreeFunc boxedFree) nothrow;
__gshared c_g_boxed_type_register_staticFn c_g_boxed_type_register_static; ///
private alias c_g_clear_objectFn = extern(C) void function(GObject** objectPtr) nothrow;
__gshared c_g_clear_objectFn c_g_clear_object; ///
private alias c_g_clear_signal_handlerFn = extern(C) void function(gulong* handlerIdPtr, GObject* instance) nothrow;
__gshared c_g_clear_signal_handlerFn c_g_clear_signal_handler; ///
private alias c_g_enum_complete_type_infoFn = extern(C) void function(GType gEnumType, GTypeInfo* info, const(GEnumValue)* constValues) nothrow;
__gshared c_g_enum_complete_type_infoFn c_g_enum_complete_type_info; ///
private alias c_g_enum_get_valueFn = extern(C) GEnumValue* function(GEnumClass* enumClass, int value) nothrow;
__gshared c_g_enum_get_valueFn c_g_enum_get_value; ///
private alias c_g_enum_get_value_by_nameFn = extern(C) GEnumValue* function(GEnumClass* enumClass, const(char)* name) nothrow;
__gshared c_g_enum_get_value_by_nameFn c_g_enum_get_value_by_name; ///
private alias c_g_enum_get_value_by_nickFn = extern(C) GEnumValue* function(GEnumClass* enumClass, const(char)* nick) nothrow;
__gshared c_g_enum_get_value_by_nickFn c_g_enum_get_value_by_nick; ///
private alias c_g_enum_register_staticFn = extern(C) GType function(const(char)* name, const(GEnumValue)* constStaticValues) nothrow;
__gshared c_g_enum_register_staticFn c_g_enum_register_static; ///
private alias c_g_enum_to_stringFn = extern(C) char* function(GType gEnumType, int value) nothrow;
__gshared c_g_enum_to_stringFn c_g_enum_to_string; ///
private alias c_g_flags_complete_type_infoFn = extern(C) void function(GType gFlagsType, GTypeInfo* info, const(GFlagsValue)* constValues) nothrow;
__gshared c_g_flags_complete_type_infoFn c_g_flags_complete_type_info; ///
private alias c_g_flags_get_first_valueFn = extern(C) GFlagsValue* function(GFlagsClass* flagsClass, uint value) nothrow;
__gshared c_g_flags_get_first_valueFn c_g_flags_get_first_value; ///
private alias c_g_flags_get_value_by_nameFn = extern(C) GFlagsValue* function(GFlagsClass* flagsClass, const(char)* name) nothrow;
__gshared c_g_flags_get_value_by_nameFn c_g_flags_get_value_by_name; ///
private alias c_g_flags_get_value_by_nickFn = extern(C) GFlagsValue* function(GFlagsClass* flagsClass, const(char)* nick) nothrow;
__gshared c_g_flags_get_value_by_nickFn c_g_flags_get_value_by_nick; ///
private alias c_g_flags_register_staticFn = extern(C) GType function(const(char)* name, const(GFlagsValue)* constStaticValues) nothrow;
__gshared c_g_flags_register_staticFn c_g_flags_register_static; ///
private alias c_g_flags_to_stringFn = extern(C) char* function(GType flagsType, uint value) nothrow;
__gshared c_g_flags_to_stringFn c_g_flags_to_string; ///
private alias c_g_gtype_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_gtype_get_typeFn c_g_gtype_get_type; ///
private alias c_g_param_spec_booleanFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, gboolean defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_booleanFn c_g_param_spec_boolean; ///
private alias c_g_param_spec_boxedFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType boxedType, GParamFlags flags) nothrow;
__gshared c_g_param_spec_boxedFn c_g_param_spec_boxed; ///
private alias c_g_param_spec_charFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, byte minimum, byte maximum, byte defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_charFn c_g_param_spec_char; ///
private alias c_g_param_spec_doubleFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, double minimum, double maximum, double defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_doubleFn c_g_param_spec_double; ///
private alias c_g_param_spec_enumFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType enumType, int defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_enumFn c_g_param_spec_enum; ///
private alias c_g_param_spec_flagsFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType flagsType, uint defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_flagsFn c_g_param_spec_flags; ///
private alias c_g_param_spec_floatFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, float minimum, float maximum, float defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_floatFn c_g_param_spec_float; ///
private alias c_g_param_spec_gtypeFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType isAType, GParamFlags flags) nothrow;
__gshared c_g_param_spec_gtypeFn c_g_param_spec_gtype; ///
private alias c_g_param_spec_intFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, int minimum, int maximum, int defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_intFn c_g_param_spec_int; ///
private alias c_g_param_spec_int64Fn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, long minimum, long maximum, long defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_int64Fn c_g_param_spec_int64; ///
private alias c_g_param_spec_longFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, glong minimum, glong maximum, glong defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_longFn c_g_param_spec_long; ///
private alias c_g_param_spec_objectFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType objectType, GParamFlags flags) nothrow;
__gshared c_g_param_spec_objectFn c_g_param_spec_object; ///
private alias c_g_param_spec_overrideFn = extern(C) GParamSpec* function(const(char)* name, GParamSpec* overridden) nothrow;
__gshared c_g_param_spec_overrideFn c_g_param_spec_override; ///
private alias c_g_param_spec_paramFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GType paramType, GParamFlags flags) nothrow;
__gshared c_g_param_spec_paramFn c_g_param_spec_param; ///
private alias c_g_param_spec_pointerFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GParamFlags flags) nothrow;
__gshared c_g_param_spec_pointerFn c_g_param_spec_pointer; ///
private alias c_g_param_spec_stringFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, const(char)* defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_stringFn c_g_param_spec_string; ///
private alias c_g_param_spec_ucharFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, ubyte minimum, ubyte maximum, ubyte defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_ucharFn c_g_param_spec_uchar; ///
private alias c_g_param_spec_uintFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, uint minimum, uint maximum, uint defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_uintFn c_g_param_spec_uint; ///
private alias c_g_param_spec_uint64Fn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, ulong minimum, ulong maximum, ulong defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_uint64Fn c_g_param_spec_uint64; ///
private alias c_g_param_spec_ulongFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, gulong minimum, gulong maximum, gulong defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_ulongFn c_g_param_spec_ulong; ///
private alias c_g_param_spec_unicharFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, dchar defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_unicharFn c_g_param_spec_unichar; ///
private alias c_g_param_spec_value_arrayFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GParamSpec* elementSpec, GParamFlags flags) nothrow;
__gshared c_g_param_spec_value_arrayFn c_g_param_spec_value_array; ///
private alias c_g_param_spec_variantFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, const(GVariantType)* type, GVariant* defaultValue, GParamFlags flags) nothrow;
__gshared c_g_param_spec_variantFn c_g_param_spec_variant; ///
private alias c_g_param_type_register_staticFn = extern(C) GType function(const(char)* name, const(GParamSpecTypeInfo)* pspecInfo) nothrow;
__gshared c_g_param_type_register_staticFn c_g_param_type_register_static; ///
private alias c_g_param_value_convertFn = extern(C) gboolean function(GParamSpec* pspec, const(GValue)* srcValue, GValue* destValue, gboolean strictValidation) nothrow;
__gshared c_g_param_value_convertFn c_g_param_value_convert; ///
private alias c_g_param_value_defaultsFn = extern(C) gboolean function(GParamSpec* pspec, const(GValue)* value) nothrow;
__gshared c_g_param_value_defaultsFn c_g_param_value_defaults; ///
private alias c_g_param_value_is_validFn = extern(C) gboolean function(GParamSpec* pspec, const(GValue)* value) nothrow;
__gshared c_g_param_value_is_validFn c_g_param_value_is_valid; ///
private alias c_g_param_value_set_defaultFn = extern(C) void function(GParamSpec* pspec, GValue* value) nothrow;
__gshared c_g_param_value_set_defaultFn c_g_param_value_set_default; ///
private alias c_g_param_value_validateFn = extern(C) gboolean function(GParamSpec* pspec, GValue* value) nothrow;
__gshared c_g_param_value_validateFn c_g_param_value_validate; ///
private alias c_g_param_values_cmpFn = extern(C) int function(GParamSpec* pspec, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_g_param_values_cmpFn c_g_param_values_cmp; ///
private alias c_g_pointer_type_register_staticFn = extern(C) GType function(const(char)* name) nothrow;
__gshared c_g_pointer_type_register_staticFn c_g_pointer_type_register_static; ///
private alias c_g_signal_accumulator_first_winsFn = extern(C) gboolean function(GSignalInvocationHint* ihint, GValue* returnAccu, const(GValue)* handlerReturn, void* dummy) nothrow;
__gshared c_g_signal_accumulator_first_winsFn c_g_signal_accumulator_first_wins; ///
private alias c_g_signal_accumulator_true_handledFn = extern(C) gboolean function(GSignalInvocationHint* ihint, GValue* returnAccu, const(GValue)* handlerReturn, void* dummy) nothrow;
__gshared c_g_signal_accumulator_true_handledFn c_g_signal_accumulator_true_handled; ///
private alias c_g_signal_add_emission_hookFn = extern(C) gulong function(uint signalId, GQuark detail, GSignalEmissionHook hookFunc, void* hookData, GDestroyNotify dataDestroy) nothrow;
__gshared c_g_signal_add_emission_hookFn c_g_signal_add_emission_hook; ///
private alias c_g_signal_chain_from_overriddenFn = extern(C) void function(const(GValue)* instanceAndParams, GValue* returnValue) nothrow;
__gshared c_g_signal_chain_from_overriddenFn c_g_signal_chain_from_overridden; ///
private alias c_g_signal_chain_from_overridden_handlerFn = extern(C) void function(GTypeInstance* instance,  ...) nothrow;
__gshared c_g_signal_chain_from_overridden_handlerFn c_g_signal_chain_from_overridden_handler; ///
private alias c_g_signal_connect_closureFn = extern(C) gulong function(GObject* instance, const(char)* detailedSignal, GClosure* closure, gboolean after) nothrow;
__gshared c_g_signal_connect_closureFn c_g_signal_connect_closure; ///
private alias c_g_signal_connect_closure_by_idFn = extern(C) gulong function(GObject* instance, uint signalId, GQuark detail, GClosure* closure, gboolean after) nothrow;
__gshared c_g_signal_connect_closure_by_idFn c_g_signal_connect_closure_by_id; ///
private alias c_g_signal_connect_dataFn = extern(C) gulong function(GObject* instance, const(char)* detailedSignal, GCallback cHandler, void* data, GClosureNotify destroyData, GConnectFlags connectFlags) nothrow;
__gshared c_g_signal_connect_dataFn c_g_signal_connect_data; ///
private alias c_g_signal_connect_objectFn = extern(C) gulong function(GTypeInstance* instance, const(char)* detailedSignal, GCallback cHandler, GObject* gobject, GConnectFlags connectFlags) nothrow;
__gshared c_g_signal_connect_objectFn c_g_signal_connect_object; ///
private alias c_g_signal_emitFn = extern(C) void function(GObject* instance, uint signalId, GQuark detail,  ...) nothrow;
__gshared c_g_signal_emitFn c_g_signal_emit; ///
private alias c_g_signal_emit_by_nameFn = extern(C) void function(GObject* instance, const(char)* detailedSignal,  ...) nothrow;
__gshared c_g_signal_emit_by_nameFn c_g_signal_emit_by_name; ///
private alias c_g_signal_emit_valistFn = extern(C) void function(GTypeInstance* instance, uint signalId, GQuark detail, void* varArgs) nothrow;
__gshared c_g_signal_emit_valistFn c_g_signal_emit_valist; ///
private alias c_g_signal_emitvFn = extern(C) void function(const(GValue)* instanceAndParams, uint signalId, GQuark detail, GValue* returnValue) nothrow;
__gshared c_g_signal_emitvFn c_g_signal_emitv; ///
private alias c_g_signal_get_invocation_hintFn = extern(C) GSignalInvocationHint* function(GObject* instance) nothrow;
__gshared c_g_signal_get_invocation_hintFn c_g_signal_get_invocation_hint; ///
private alias c_g_signal_handler_blockFn = extern(C) void function(GObject* instance, gulong handlerId) nothrow;
__gshared c_g_signal_handler_blockFn c_g_signal_handler_block; ///
private alias c_g_signal_handler_disconnectFn = extern(C) void function(GObject* instance, gulong handlerId) nothrow;
__gshared c_g_signal_handler_disconnectFn c_g_signal_handler_disconnect; ///
private alias c_g_signal_handler_findFn = extern(C) gulong function(GObject* instance, GSignalMatchType mask, uint signalId, GQuark detail, GClosure* closure, void* func, void* data) nothrow;
__gshared c_g_signal_handler_findFn c_g_signal_handler_find; ///
private alias c_g_signal_handler_is_connectedFn = extern(C) gboolean function(GObject* instance, gulong handlerId) nothrow;
__gshared c_g_signal_handler_is_connectedFn c_g_signal_handler_is_connected; ///
private alias c_g_signal_handler_unblockFn = extern(C) void function(GObject* instance, gulong handlerId) nothrow;
__gshared c_g_signal_handler_unblockFn c_g_signal_handler_unblock; ///
private alias c_g_signal_handlers_block_matchedFn = extern(C) uint function(GObject* instance, GSignalMatchType mask, uint signalId, GQuark detail, GClosure* closure, void* func, void* data) nothrow;
__gshared c_g_signal_handlers_block_matchedFn c_g_signal_handlers_block_matched; ///
private alias c_g_signal_handlers_destroyFn = extern(C) void function(GObject* instance) nothrow;
__gshared c_g_signal_handlers_destroyFn c_g_signal_handlers_destroy; ///
private alias c_g_signal_handlers_disconnect_matchedFn = extern(C) uint function(GObject* instance, GSignalMatchType mask, uint signalId, GQuark detail, GClosure* closure, void* func, void* data) nothrow;
__gshared c_g_signal_handlers_disconnect_matchedFn c_g_signal_handlers_disconnect_matched; ///
private alias c_g_signal_handlers_unblock_matchedFn = extern(C) uint function(GObject* instance, GSignalMatchType mask, uint signalId, GQuark detail, GClosure* closure, void* func, void* data) nothrow;
__gshared c_g_signal_handlers_unblock_matchedFn c_g_signal_handlers_unblock_matched; ///
private alias c_g_signal_has_handler_pendingFn = extern(C) gboolean function(GObject* instance, uint signalId, GQuark detail, gboolean mayBeBlocked) nothrow;
__gshared c_g_signal_has_handler_pendingFn c_g_signal_has_handler_pending; ///
private alias c_g_signal_is_valid_nameFn = extern(C) gboolean function(const(char)* name) nothrow;
__gshared c_g_signal_is_valid_nameFn c_g_signal_is_valid_name; ///
private alias c_g_signal_list_idsFn = extern(C) uint* function(GType itype, uint* nIds) nothrow;
__gshared c_g_signal_list_idsFn c_g_signal_list_ids; ///
private alias c_g_signal_lookupFn = extern(C) uint function(const(char)* name, GType itype) nothrow;
__gshared c_g_signal_lookupFn c_g_signal_lookup; ///
private alias c_g_signal_nameFn = extern(C) const(char)* function(uint signalId) nothrow;
__gshared c_g_signal_nameFn c_g_signal_name; ///
private alias c_g_signal_newFn = extern(C) uint function(const(char)* signalName, GType itype, GSignalFlags signalFlags, uint classOffset, GSignalAccumulator accumulator, void* accuData, GSignalCMarshaller cMarshaller, GType returnType, uint nParams,  ...) nothrow;
__gshared c_g_signal_newFn c_g_signal_new; ///
private alias c_g_signal_new_class_handlerFn = extern(C) uint function(const(char)* signalName, GType itype, GSignalFlags signalFlags, GCallback classHandler, GSignalAccumulator accumulator, void* accuData, GSignalCMarshaller cMarshaller, GType returnType, uint nParams,  ...) nothrow;
__gshared c_g_signal_new_class_handlerFn c_g_signal_new_class_handler; ///
private alias c_g_signal_new_valistFn = extern(C) uint function(const(char)* signalName, GType itype, GSignalFlags signalFlags, GClosure* classClosure, GSignalAccumulator accumulator, void* accuData, GSignalCMarshaller cMarshaller, GType returnType, uint nParams, void* args) nothrow;
__gshared c_g_signal_new_valistFn c_g_signal_new_valist; ///
private alias c_g_signal_newvFn = extern(C) uint function(const(char)* signalName, GType itype, GSignalFlags signalFlags, GClosure* classClosure, GSignalAccumulator accumulator, void* accuData, GSignalCMarshaller cMarshaller, GType returnType, uint nParams, GType* paramTypes) nothrow;
__gshared c_g_signal_newvFn c_g_signal_newv; ///
private alias c_g_signal_override_class_closureFn = extern(C) void function(uint signalId, GType instanceType, GClosure* classClosure) nothrow;
__gshared c_g_signal_override_class_closureFn c_g_signal_override_class_closure; ///
private alias c_g_signal_override_class_handlerFn = extern(C) void function(const(char)* signalName, GType instanceType, GCallback classHandler) nothrow;
__gshared c_g_signal_override_class_handlerFn c_g_signal_override_class_handler; ///
private alias c_g_signal_parse_nameFn = extern(C) gboolean function(const(char)* detailedSignal, GType itype, uint* signalIdP, GQuark* detailP, gboolean forceDetailQuark) nothrow;
__gshared c_g_signal_parse_nameFn c_g_signal_parse_name; ///
private alias c_g_signal_queryFn = extern(C) void function(uint signalId, GSignalQuery* query) nothrow;
__gshared c_g_signal_queryFn c_g_signal_query; ///
private alias c_g_signal_remove_emission_hookFn = extern(C) void function(uint signalId, gulong hookId) nothrow;
__gshared c_g_signal_remove_emission_hookFn c_g_signal_remove_emission_hook; ///
private alias c_g_signal_set_va_marshallerFn = extern(C) void function(uint signalId, GType instanceType, GSignalCVaMarshaller vaMarshaller) nothrow;
__gshared c_g_signal_set_va_marshallerFn c_g_signal_set_va_marshaller; ///
private alias c_g_signal_stop_emissionFn = extern(C) void function(GObject* instance, uint signalId, GQuark detail) nothrow;
__gshared c_g_signal_stop_emissionFn c_g_signal_stop_emission; ///
private alias c_g_signal_stop_emission_by_nameFn = extern(C) void function(GObject* instance, const(char)* detailedSignal) nothrow;
__gshared c_g_signal_stop_emission_by_nameFn c_g_signal_stop_emission_by_name; ///
private alias c_g_signal_type_cclosure_newFn = extern(C) GClosure* function(GType itype, uint structOffset) nothrow;
__gshared c_g_signal_type_cclosure_newFn c_g_signal_type_cclosure_new; ///
private alias c_g_strdup_value_contentsFn = extern(C) char* function(const(GValue)* value) nothrow;
__gshared c_g_strdup_value_contentsFn c_g_strdup_value_contents; ///
private alias c_g_type_add_class_cache_funcFn = extern(C) void function(void* cacheData, GTypeClassCacheFunc cacheFunc) nothrow;
__gshared c_g_type_add_class_cache_funcFn c_g_type_add_class_cache_func; ///
private alias c_g_type_add_class_privateFn = extern(C) void function(GType classType, size_t privateSize) nothrow;
__gshared c_g_type_add_class_privateFn c_g_type_add_class_private; ///
private alias c_g_type_add_instance_privateFn = extern(C) int function(GType classType, size_t privateSize) nothrow;
__gshared c_g_type_add_instance_privateFn c_g_type_add_instance_private; ///
private alias c_g_type_add_interface_checkFn = extern(C) void function(void* checkData, GTypeInterfaceCheckFunc checkFunc) nothrow;
__gshared c_g_type_add_interface_checkFn c_g_type_add_interface_check; ///
private alias c_g_type_add_interface_dynamicFn = extern(C) void function(GType instanceType, GType interfaceType, GTypePlugin* plugin) nothrow;
__gshared c_g_type_add_interface_dynamicFn c_g_type_add_interface_dynamic; ///
private alias c_g_type_add_interface_staticFn = extern(C) void function(GType instanceType, GType interfaceType, const(GInterfaceInfo)* info) nothrow;
__gshared c_g_type_add_interface_staticFn c_g_type_add_interface_static; ///
private alias c_g_type_check_class_castFn = extern(C) GTypeClass* function(GTypeClass* gClass, GType isAType) nothrow;
__gshared c_g_type_check_class_castFn c_g_type_check_class_cast; ///
private alias c_g_type_check_class_is_aFn = extern(C) gboolean function(GTypeClass* gClass, GType isAType) nothrow;
__gshared c_g_type_check_class_is_aFn c_g_type_check_class_is_a; ///
private alias c_g_type_check_instanceFn = extern(C) gboolean function(GTypeInstance* instance) nothrow;
__gshared c_g_type_check_instanceFn c_g_type_check_instance; ///
private alias c_g_type_check_instance_castFn = extern(C) GTypeInstance* function(GTypeInstance* instance, GType ifaceType) nothrow;
__gshared c_g_type_check_instance_castFn c_g_type_check_instance_cast; ///
private alias c_g_type_check_instance_is_aFn = extern(C) gboolean function(GTypeInstance* instance, GType ifaceType) nothrow;
__gshared c_g_type_check_instance_is_aFn c_g_type_check_instance_is_a; ///
private alias c_g_type_check_instance_is_fundamentally_aFn = extern(C) gboolean function(GTypeInstance* instance, GType fundamentalType) nothrow;
__gshared c_g_type_check_instance_is_fundamentally_aFn c_g_type_check_instance_is_fundamentally_a; ///
private alias c_g_type_check_is_value_typeFn = extern(C) gboolean function(GType type) nothrow;
__gshared c_g_type_check_is_value_typeFn c_g_type_check_is_value_type; ///
private alias c_g_type_check_valueFn = extern(C) gboolean function(const(GValue)* value) nothrow;
__gshared c_g_type_check_valueFn c_g_type_check_value; ///
private alias c_g_type_check_value_holdsFn = extern(C) gboolean function(const(GValue)* value, GType type) nothrow;
__gshared c_g_type_check_value_holdsFn c_g_type_check_value_holds; ///
private alias c_g_type_childrenFn = extern(C) GType* function(GType type, uint* nChildren) nothrow;
__gshared c_g_type_childrenFn c_g_type_children; ///
private alias c_g_type_create_instanceFn = extern(C) GTypeInstance* function(GType type) nothrow;
__gshared c_g_type_create_instanceFn c_g_type_create_instance; ///
private alias c_g_type_default_interface_getFn = extern(C) GTypeInterface* function(GType gType) nothrow;
__gshared c_g_type_default_interface_getFn c_g_type_default_interface_get; ///
private alias c_g_type_default_interface_peekFn = extern(C) GTypeInterface* function(GType gType) nothrow;
__gshared c_g_type_default_interface_peekFn c_g_type_default_interface_peek; ///
private alias c_g_type_default_interface_refFn = extern(C) GTypeInterface* function(GType gType) nothrow;
__gshared c_g_type_default_interface_refFn c_g_type_default_interface_ref; ///
private alias c_g_type_default_interface_unrefFn = extern(C) void function(GTypeInterface* gIface) nothrow;
__gshared c_g_type_default_interface_unrefFn c_g_type_default_interface_unref; ///
private alias c_g_type_depthFn = extern(C) uint function(GType type) nothrow;
__gshared c_g_type_depthFn c_g_type_depth; ///
private alias c_g_type_ensureFn = extern(C) void function(GType type) nothrow;
__gshared c_g_type_ensureFn c_g_type_ensure; ///
private alias c_g_type_free_instanceFn = extern(C) void function(GTypeInstance* instance) nothrow;
__gshared c_g_type_free_instanceFn c_g_type_free_instance; ///
private alias c_g_type_from_nameFn = extern(C) GType function(const(char)* name) nothrow;
__gshared c_g_type_from_nameFn c_g_type_from_name; ///
private alias c_g_type_fundamentalFn = extern(C) GType function(GType typeId) nothrow;
__gshared c_g_type_fundamentalFn c_g_type_fundamental; ///
private alias c_g_type_fundamental_nextFn = extern(C) GType function() nothrow;
__gshared c_g_type_fundamental_nextFn c_g_type_fundamental_next; ///
private alias c_g_type_get_instance_countFn = extern(C) int function(GType type) nothrow;
__gshared c_g_type_get_instance_countFn c_g_type_get_instance_count; ///
private alias c_g_type_get_pluginFn = extern(C) GTypePlugin* function(GType type) nothrow;
__gshared c_g_type_get_pluginFn c_g_type_get_plugin; ///
private alias c_g_type_get_qdataFn = extern(C) void* function(GType type, GQuark quark) nothrow;
__gshared c_g_type_get_qdataFn c_g_type_get_qdata; ///
private alias c_g_type_get_type_registration_serialFn = extern(C) uint function() nothrow;
__gshared c_g_type_get_type_registration_serialFn c_g_type_get_type_registration_serial; ///
private alias c_g_type_initFn = extern(C) void function() nothrow;
__gshared c_g_type_initFn c_g_type_init; ///
private alias c_g_type_init_with_debug_flagsFn = extern(C) void function(GTypeDebugFlags debugFlags) nothrow;
__gshared c_g_type_init_with_debug_flagsFn c_g_type_init_with_debug_flags; ///
private alias c_g_type_interfacesFn = extern(C) GType* function(GType type, uint* nInterfaces) nothrow;
__gshared c_g_type_interfacesFn c_g_type_interfaces; ///
private alias c_g_type_is_aFn = extern(C) gboolean function(GType type, GType isAType) nothrow;
__gshared c_g_type_is_aFn c_g_type_is_a; ///
private alias c_g_type_nameFn = extern(C) const(char)* function(GType type) nothrow;
__gshared c_g_type_nameFn c_g_type_name; ///
private alias c_g_type_name_from_classFn = extern(C) const(char)* function(GTypeClass* gClass) nothrow;
__gshared c_g_type_name_from_classFn c_g_type_name_from_class; ///
private alias c_g_type_name_from_instanceFn = extern(C) const(char)* function(GTypeInstance* instance) nothrow;
__gshared c_g_type_name_from_instanceFn c_g_type_name_from_instance; ///
private alias c_g_type_next_baseFn = extern(C) GType function(GType leafType, GType rootType) nothrow;
__gshared c_g_type_next_baseFn c_g_type_next_base; ///
private alias c_g_type_parentFn = extern(C) GType function(GType type) nothrow;
__gshared c_g_type_parentFn c_g_type_parent; ///
private alias c_g_type_qnameFn = extern(C) GQuark function(GType type) nothrow;
__gshared c_g_type_qnameFn c_g_type_qname; ///
private alias c_g_type_queryFn = extern(C) void function(GType type, GTypeQuery* query) nothrow;
__gshared c_g_type_queryFn c_g_type_query; ///
private alias c_g_type_register_dynamicFn = extern(C) GType function(GType parentType, const(char)* typeName, GTypePlugin* plugin, GTypeFlags flags) nothrow;
__gshared c_g_type_register_dynamicFn c_g_type_register_dynamic; ///
private alias c_g_type_register_fundamentalFn = extern(C) GType function(GType typeId, const(char)* typeName, const(GTypeInfo)* info, const(GTypeFundamentalInfo)* finfo, GTypeFlags flags) nothrow;
__gshared c_g_type_register_fundamentalFn c_g_type_register_fundamental; ///
private alias c_g_type_register_staticFn = extern(C) GType function(GType parentType, const(char)* typeName, const(GTypeInfo)* info, GTypeFlags flags) nothrow;
__gshared c_g_type_register_staticFn c_g_type_register_static; ///
private alias c_g_type_register_static_simpleFn = extern(C) GType function(GType parentType, const(char)* typeName, uint classSize, GClassInitFunc classInit, uint instanceSize, GInstanceInitFunc instanceInit, GTypeFlags flags) nothrow;
__gshared c_g_type_register_static_simpleFn c_g_type_register_static_simple; ///
private alias c_g_type_remove_class_cache_funcFn = extern(C) void function(void* cacheData, GTypeClassCacheFunc cacheFunc) nothrow;
__gshared c_g_type_remove_class_cache_funcFn c_g_type_remove_class_cache_func; ///
private alias c_g_type_remove_interface_checkFn = extern(C) void function(void* checkData, GTypeInterfaceCheckFunc checkFunc) nothrow;
__gshared c_g_type_remove_interface_checkFn c_g_type_remove_interface_check; ///
private alias c_g_type_set_qdataFn = extern(C) void function(GType type, GQuark quark, void* data) nothrow;
__gshared c_g_type_set_qdataFn c_g_type_set_qdata; ///
private alias c_g_type_test_flagsFn = extern(C) gboolean function(GType type, uint flags) nothrow;
__gshared c_g_type_test_flagsFn c_g_type_test_flags; ///

// Binding

/** */
alias g_binding_get_type = c_g_binding_get_type;

/** */
alias g_binding_dup_source = c_g_binding_dup_source;

/** */
alias g_binding_dup_target = c_g_binding_dup_target;

/** */
alias g_binding_get_flags = c_g_binding_get_flags;

/** */
alias g_binding_get_source = c_g_binding_get_source;

/** */
alias g_binding_get_source_property = c_g_binding_get_source_property;

/** */
alias g_binding_get_target = c_g_binding_get_target;

/** */
alias g_binding_get_target_property = c_g_binding_get_target_property;

/** */
alias g_binding_unbind = c_g_binding_unbind;

// BindingGroup

/** */
alias g_binding_group_get_type = c_g_binding_group_get_type;

/** */
alias g_binding_group_new = c_g_binding_group_new;

/** */
alias g_binding_group_bind = c_g_binding_group_bind;

/** */
alias g_binding_group_bind_full = c_g_binding_group_bind_full;

/** */
alias g_binding_group_bind_with_closures = c_g_binding_group_bind_with_closures;

/** */
alias g_binding_group_dup_source = c_g_binding_group_dup_source;

/** */
alias g_binding_group_set_source = c_g_binding_group_set_source;

// CClosure

/** */
alias g_cclosure_marshal_BOOLEAN__BOXED_BOXED = c_g_cclosure_marshal_BOOLEAN__BOXED_BOXED;

/** */
alias g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv = c_g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv;

/** */
alias g_cclosure_marshal_BOOLEAN__FLAGS = c_g_cclosure_marshal_BOOLEAN__FLAGS;

/** */
alias g_cclosure_marshal_BOOLEAN__FLAGSv = c_g_cclosure_marshal_BOOLEAN__FLAGSv;

/** */
alias g_cclosure_marshal_STRING__OBJECT_POINTER = c_g_cclosure_marshal_STRING__OBJECT_POINTER;

/** */
alias g_cclosure_marshal_STRING__OBJECT_POINTERv = c_g_cclosure_marshal_STRING__OBJECT_POINTERv;

/** */
alias g_cclosure_marshal_VOID__BOOLEAN = c_g_cclosure_marshal_VOID__BOOLEAN;

/** */
alias g_cclosure_marshal_VOID__BOOLEANv = c_g_cclosure_marshal_VOID__BOOLEANv;

/** */
alias g_cclosure_marshal_VOID__BOXED = c_g_cclosure_marshal_VOID__BOXED;

/** */
alias g_cclosure_marshal_VOID__BOXEDv = c_g_cclosure_marshal_VOID__BOXEDv;

/** */
alias g_cclosure_marshal_VOID__CHAR = c_g_cclosure_marshal_VOID__CHAR;

/** */
alias g_cclosure_marshal_VOID__CHARv = c_g_cclosure_marshal_VOID__CHARv;

/** */
alias g_cclosure_marshal_VOID__DOUBLE = c_g_cclosure_marshal_VOID__DOUBLE;

/** */
alias g_cclosure_marshal_VOID__DOUBLEv = c_g_cclosure_marshal_VOID__DOUBLEv;

/** */
alias g_cclosure_marshal_VOID__ENUM = c_g_cclosure_marshal_VOID__ENUM;

/** */
alias g_cclosure_marshal_VOID__ENUMv = c_g_cclosure_marshal_VOID__ENUMv;

/** */
alias g_cclosure_marshal_VOID__FLAGS = c_g_cclosure_marshal_VOID__FLAGS;

/** */
alias g_cclosure_marshal_VOID__FLAGSv = c_g_cclosure_marshal_VOID__FLAGSv;

/** */
alias g_cclosure_marshal_VOID__FLOAT = c_g_cclosure_marshal_VOID__FLOAT;

/** */
alias g_cclosure_marshal_VOID__FLOATv = c_g_cclosure_marshal_VOID__FLOATv;

/** */
alias g_cclosure_marshal_VOID__INT = c_g_cclosure_marshal_VOID__INT;

/** */
alias g_cclosure_marshal_VOID__INTv = c_g_cclosure_marshal_VOID__INTv;

/** */
alias g_cclosure_marshal_VOID__LONG = c_g_cclosure_marshal_VOID__LONG;

/** */
alias g_cclosure_marshal_VOID__LONGv = c_g_cclosure_marshal_VOID__LONGv;

/** */
alias g_cclosure_marshal_VOID__OBJECT = c_g_cclosure_marshal_VOID__OBJECT;

/** */
alias g_cclosure_marshal_VOID__OBJECTv = c_g_cclosure_marshal_VOID__OBJECTv;

/** */
alias g_cclosure_marshal_VOID__PARAM = c_g_cclosure_marshal_VOID__PARAM;

/** */
alias g_cclosure_marshal_VOID__PARAMv = c_g_cclosure_marshal_VOID__PARAMv;

/** */
alias g_cclosure_marshal_VOID__POINTER = c_g_cclosure_marshal_VOID__POINTER;

/** */
alias g_cclosure_marshal_VOID__POINTERv = c_g_cclosure_marshal_VOID__POINTERv;

/** */
alias g_cclosure_marshal_VOID__STRING = c_g_cclosure_marshal_VOID__STRING;

/** */
alias g_cclosure_marshal_VOID__STRINGv = c_g_cclosure_marshal_VOID__STRINGv;

/** */
alias g_cclosure_marshal_VOID__UCHAR = c_g_cclosure_marshal_VOID__UCHAR;

/** */
alias g_cclosure_marshal_VOID__UCHARv = c_g_cclosure_marshal_VOID__UCHARv;

/** */
alias g_cclosure_marshal_VOID__UINT = c_g_cclosure_marshal_VOID__UINT;

/** */
alias g_cclosure_marshal_VOID__UINT_POINTER = c_g_cclosure_marshal_VOID__UINT_POINTER;

/** */
alias g_cclosure_marshal_VOID__UINT_POINTERv = c_g_cclosure_marshal_VOID__UINT_POINTERv;

/** */
alias g_cclosure_marshal_VOID__UINTv = c_g_cclosure_marshal_VOID__UINTv;

/** */
alias g_cclosure_marshal_VOID__ULONG = c_g_cclosure_marshal_VOID__ULONG;

/** */
alias g_cclosure_marshal_VOID__ULONGv = c_g_cclosure_marshal_VOID__ULONGv;

/** */
alias g_cclosure_marshal_VOID__VARIANT = c_g_cclosure_marshal_VOID__VARIANT;

/** */
alias g_cclosure_marshal_VOID__VARIANTv = c_g_cclosure_marshal_VOID__VARIANTv;

/** */
alias g_cclosure_marshal_VOID__VOID = c_g_cclosure_marshal_VOID__VOID;

/** */
alias g_cclosure_marshal_VOID__VOIDv = c_g_cclosure_marshal_VOID__VOIDv;

/** */
alias g_cclosure_marshal_generic = c_g_cclosure_marshal_generic;

/** */
alias g_cclosure_marshal_generic_va = c_g_cclosure_marshal_generic_va;

/** */
alias g_cclosure_new = c_g_cclosure_new;

/** */
alias g_cclosure_new_object = c_g_cclosure_new_object;

/** */
alias g_cclosure_new_object_swap = c_g_cclosure_new_object_swap;

/** */
alias g_cclosure_new_swap = c_g_cclosure_new_swap;

// Closure

/** */
alias g_closure_get_type = c_g_closure_get_type;

/** */
alias g_closure_new_object = c_g_closure_new_object;

/** */
alias g_closure_new_simple = c_g_closure_new_simple;

/** */
alias g_closure_add_finalize_notifier = c_g_closure_add_finalize_notifier;

/** */
alias g_closure_add_invalidate_notifier = c_g_closure_add_invalidate_notifier;

/** */
alias g_closure_add_marshal_guards = c_g_closure_add_marshal_guards;

/** */
alias g_closure_invalidate = c_g_closure_invalidate;

/** */
alias g_closure_invoke = c_g_closure_invoke;

/** */
alias g_closure_ref = c_g_closure_ref;

/** */
alias g_closure_remove_finalize_notifier = c_g_closure_remove_finalize_notifier;

/** */
alias g_closure_remove_invalidate_notifier = c_g_closure_remove_invalidate_notifier;

/** */
alias g_closure_set_marshal = c_g_closure_set_marshal;

/** */
alias g_closure_set_meta_marshal = c_g_closure_set_meta_marshal;

/** */
alias g_closure_sink = c_g_closure_sink;

/** */
alias g_closure_unref = c_g_closure_unref;

// InitiallyUnowned

/** */
alias g_initially_unowned_get_type = c_g_initially_unowned_get_type;

// ObjectClass

/** */
alias g_object_class_find_property = c_g_object_class_find_property;

/** */
alias g_object_class_install_properties = c_g_object_class_install_properties;

/** */
alias g_object_class_install_property = c_g_object_class_install_property;

/** */
alias g_object_class_list_properties = c_g_object_class_list_properties;

/** */
alias g_object_class_override_property = c_g_object_class_override_property;

// ObjectWrap

/** */
alias g_object_get_type = c_g_object_get_type;

/** */
alias g_object_new = c_g_object_new;

/** */
alias g_object_new_valist = c_g_object_new_valist;

/** */
alias g_object_new_with_properties = c_g_object_new_with_properties;

/** */
alias g_object_newv = c_g_object_newv;

/** */
alias g_object_compat_control = c_g_object_compat_control;

/** */
alias g_object_interface_find_property = c_g_object_interface_find_property;

/** */
alias g_object_interface_install_property = c_g_object_interface_install_property;

/** */
alias g_object_interface_list_properties = c_g_object_interface_list_properties;

/** */
alias g_object_add_toggle_ref = c_g_object_add_toggle_ref;

/** */
alias g_object_add_weak_pointer = c_g_object_add_weak_pointer;

/** */
alias g_object_bind_property = c_g_object_bind_property;

/** */
alias g_object_bind_property_full = c_g_object_bind_property_full;

/** */
alias g_object_bind_property_with_closures = c_g_object_bind_property_with_closures;

/** */
alias g_object_connect = c_g_object_connect;

/** */
alias g_object_disconnect = c_g_object_disconnect;

/** */
alias g_object_dup_data = c_g_object_dup_data;

/** */
alias g_object_dup_qdata = c_g_object_dup_qdata;

/** */
alias g_object_force_floating = c_g_object_force_floating;

/** */
alias g_object_freeze_notify = c_g_object_freeze_notify;

/** */
alias g_object_get = c_g_object_get;

/** */
alias g_object_get_data = c_g_object_get_data;

/** */
alias g_object_get_property = c_g_object_get_property;

/** */
alias g_object_get_qdata = c_g_object_get_qdata;

/** */
alias g_object_get_valist = c_g_object_get_valist;

/** */
alias g_object_getv = c_g_object_getv;

/** */
alias g_object_is_floating = c_g_object_is_floating;

/** */
alias g_object_notify = c_g_object_notify;

/** */
alias g_object_notify_by_pspec = c_g_object_notify_by_pspec;

/** */
alias g_object_ref = c_g_object_ref;

/** */
alias g_object_ref_sink = c_g_object_ref_sink;

/** */
alias g_object_remove_toggle_ref = c_g_object_remove_toggle_ref;

/** */
alias g_object_remove_weak_pointer = c_g_object_remove_weak_pointer;

/** */
alias g_object_replace_data = c_g_object_replace_data;

/** */
alias g_object_replace_qdata = c_g_object_replace_qdata;

/** */
alias g_object_run_dispose = c_g_object_run_dispose;

/** */
alias g_object_set = c_g_object_set;

/** */
alias g_object_set_data = c_g_object_set_data;

/** */
alias g_object_set_data_full = c_g_object_set_data_full;

/** */
alias g_object_set_property = c_g_object_set_property;

/** */
alias g_object_set_qdata = c_g_object_set_qdata;

/** */
alias g_object_set_qdata_full = c_g_object_set_qdata_full;

/** */
alias g_object_set_valist = c_g_object_set_valist;

/** */
alias g_object_setv = c_g_object_setv;

/** */
alias g_object_steal_data = c_g_object_steal_data;

/** */
alias g_object_steal_qdata = c_g_object_steal_qdata;

/** */
alias g_object_take_ref = c_g_object_take_ref;

/** */
alias g_object_thaw_notify = c_g_object_thaw_notify;

/** */
alias g_object_unref = c_g_object_unref;

/** */
alias g_object_watch_closure = c_g_object_watch_closure;

/** */
alias g_object_weak_ref = c_g_object_weak_ref;

/** */
alias g_object_weak_unref = c_g_object_weak_unref;

// ParamSpec

/** */
alias g_param_spec_internal = c_g_param_spec_internal;

/** */
alias g_param_spec_is_valid_name = c_g_param_spec_is_valid_name;

/** */
alias g_param_spec_get_blurb = c_g_param_spec_get_blurb;

/** */
alias g_param_spec_get_default_value = c_g_param_spec_get_default_value;

/** */
alias g_param_spec_get_name = c_g_param_spec_get_name;

/** */
alias g_param_spec_get_name_quark = c_g_param_spec_get_name_quark;

/** */
alias g_param_spec_get_nick = c_g_param_spec_get_nick;

/** */
alias g_param_spec_get_qdata = c_g_param_spec_get_qdata;

/** */
alias g_param_spec_get_redirect_target = c_g_param_spec_get_redirect_target;

/** */
alias g_param_spec_ref = c_g_param_spec_ref;

/** */
alias g_param_spec_ref_sink = c_g_param_spec_ref_sink;

/** */
alias g_param_spec_set_qdata = c_g_param_spec_set_qdata;

/** */
alias g_param_spec_set_qdata_full = c_g_param_spec_set_qdata_full;

/** */
alias g_param_spec_sink = c_g_param_spec_sink;

/** */
alias g_param_spec_steal_qdata = c_g_param_spec_steal_qdata;

/** */
alias g_param_spec_unref = c_g_param_spec_unref;

// ParamSpecPool

/** */
alias g_param_spec_pool_free = c_g_param_spec_pool_free;

/** */
alias g_param_spec_pool_insert = c_g_param_spec_pool_insert;

/** */
alias g_param_spec_pool_list = c_g_param_spec_pool_list;

/** */
alias g_param_spec_pool_list_owned = c_g_param_spec_pool_list_owned;

/** */
alias g_param_spec_pool_lookup = c_g_param_spec_pool_lookup;

/** */
alias g_param_spec_pool_remove = c_g_param_spec_pool_remove;

/** */
alias g_param_spec_pool_new = c_g_param_spec_pool_new;

// SignalGroup

/** */
alias g_signal_group_get_type = c_g_signal_group_get_type;

/** */
alias g_signal_group_new = c_g_signal_group_new;

/** */
alias g_signal_group_block = c_g_signal_group_block;

/** */
alias g_signal_group_connect = c_g_signal_group_connect;

/** */
alias g_signal_group_connect_after = c_g_signal_group_connect_after;

/** */
alias g_signal_group_connect_closure = c_g_signal_group_connect_closure;

/** */
alias g_signal_group_connect_data = c_g_signal_group_connect_data;

/** */
alias g_signal_group_connect_object = c_g_signal_group_connect_object;

/** */
alias g_signal_group_connect_swapped = c_g_signal_group_connect_swapped;

/** */
alias g_signal_group_dup_target = c_g_signal_group_dup_target;

/** */
alias g_signal_group_set_target = c_g_signal_group_set_target;

/** */
alias g_signal_group_unblock = c_g_signal_group_unblock;

// TypeClass

/** */
alias g_type_class_add_private = c_g_type_class_add_private;

/** */
alias g_type_class_get_instance_private_offset = c_g_type_class_get_instance_private_offset;

/** */
alias g_type_class_get_private = c_g_type_class_get_private;

/** */
alias g_type_class_peek_parent = c_g_type_class_peek_parent;

/** */
alias g_type_class_unref = c_g_type_class_unref;

/** */
alias g_type_class_unref_uncached = c_g_type_class_unref_uncached;

/** */
alias g_type_class_adjust_private_offset = c_g_type_class_adjust_private_offset;

/** */
alias g_type_class_get = c_g_type_class_get;

/** */
alias g_type_class_peek = c_g_type_class_peek;

/** */
alias g_type_class_peek_static = c_g_type_class_peek_static;

/** */
alias g_type_class_ref = c_g_type_class_ref;

// TypeInstance

/** */
alias g_type_instance_get_private = c_g_type_instance_get_private;

// TypeInterface

/** */
alias g_type_interface_peek_parent = c_g_type_interface_peek_parent;

/** */
alias g_type_interface_add_prerequisite = c_g_type_interface_add_prerequisite;

/** */
alias g_type_interface_get_plugin = c_g_type_interface_get_plugin;

/** */
alias g_type_interface_instantiatable_prerequisite = c_g_type_interface_instantiatable_prerequisite;

/** */
alias g_type_interface_peek = c_g_type_interface_peek;

/** */
alias g_type_interface_prerequisites = c_g_type_interface_prerequisites;

// TypeModule

/** */
alias g_type_module_get_type = c_g_type_module_get_type;

/** */
alias g_type_module_add_interface = c_g_type_module_add_interface;

/** */
alias g_type_module_register_enum = c_g_type_module_register_enum;

/** */
alias g_type_module_register_flags = c_g_type_module_register_flags;

/** */
alias g_type_module_register_type = c_g_type_module_register_type;

/** */
alias g_type_module_set_name = c_g_type_module_set_name;

/** */
alias g_type_module_unuse = c_g_type_module_unuse;

/** */
alias g_type_module_use = c_g_type_module_use;

// TypePlugin

/** */
alias g_type_plugin_get_type = c_g_type_plugin_get_type;

/** */
alias g_type_plugin_complete_interface_info = c_g_type_plugin_complete_interface_info;

/** */
alias g_type_plugin_complete_type_info = c_g_type_plugin_complete_type_info;

/** */
alias g_type_plugin_unuse = c_g_type_plugin_unuse;

/** */
alias g_type_plugin_use = c_g_type_plugin_use;

// TypeValueTable

/** */
alias g_type_value_table_peek = c_g_type_value_table_peek;

// Value

/** */
alias g_value_get_type = c_g_value_get_type;

/** */
alias g_value_copy = c_g_value_copy;

/** */
alias g_value_dup_boxed = c_g_value_dup_boxed;

/** */
alias g_value_dup_object = c_g_value_dup_object;

/** */
alias g_value_dup_param = c_g_value_dup_param;

/** */
alias g_value_dup_string = c_g_value_dup_string;

/** */
alias g_value_dup_variant = c_g_value_dup_variant;

/** */
alias g_value_fits_pointer = c_g_value_fits_pointer;

/** */
alias g_value_get_boolean = c_g_value_get_boolean;

/** */
alias g_value_get_boxed = c_g_value_get_boxed;

/** */
alias g_value_get_char = c_g_value_get_char;

/** */
alias g_value_get_double = c_g_value_get_double;

/** */
alias g_value_get_enum = c_g_value_get_enum;

/** */
alias g_value_get_flags = c_g_value_get_flags;

/** */
alias g_value_get_float = c_g_value_get_float;

/** */
alias g_value_get_gtype = c_g_value_get_gtype;

/** */
alias g_value_get_int = c_g_value_get_int;

/** */
alias g_value_get_int64 = c_g_value_get_int64;

/** */
alias g_value_get_long = c_g_value_get_long;

/** */
alias g_value_get_object = c_g_value_get_object;

/** */
alias g_value_get_param = c_g_value_get_param;

/** */
alias g_value_get_pointer = c_g_value_get_pointer;

/** */
alias g_value_get_schar = c_g_value_get_schar;

/** */
alias g_value_get_string = c_g_value_get_string;

/** */
alias g_value_get_uchar = c_g_value_get_uchar;

/** */
alias g_value_get_uint = c_g_value_get_uint;

/** */
alias g_value_get_uint64 = c_g_value_get_uint64;

/** */
alias g_value_get_ulong = c_g_value_get_ulong;

/** */
alias g_value_get_variant = c_g_value_get_variant;

/** */
alias g_value_init = c_g_value_init;

/** */
alias g_value_init_from_instance = c_g_value_init_from_instance;

/** */
alias g_value_peek_pointer = c_g_value_peek_pointer;

/** */
alias g_value_reset = c_g_value_reset;

/** */
alias g_value_set_boolean = c_g_value_set_boolean;

/** */
alias g_value_set_boxed = c_g_value_set_boxed;

/** */
alias g_value_set_boxed_take_ownership = c_g_value_set_boxed_take_ownership;

/** */
alias g_value_set_char = c_g_value_set_char;

/** */
alias g_value_set_double = c_g_value_set_double;

/** */
alias g_value_set_enum = c_g_value_set_enum;

/** */
alias g_value_set_flags = c_g_value_set_flags;

/** */
alias g_value_set_float = c_g_value_set_float;

/** */
alias g_value_set_gtype = c_g_value_set_gtype;

/** */
alias g_value_set_instance = c_g_value_set_instance;

/** */
alias g_value_set_int = c_g_value_set_int;

/** */
alias g_value_set_int64 = c_g_value_set_int64;

/** */
alias g_value_set_interned_string = c_g_value_set_interned_string;

/** */
alias g_value_set_long = c_g_value_set_long;

/** */
alias g_value_set_object = c_g_value_set_object;

/** */
alias g_value_set_object_take_ownership = c_g_value_set_object_take_ownership;

/** */
alias g_value_set_param = c_g_value_set_param;

/** */
alias g_value_set_param_take_ownership = c_g_value_set_param_take_ownership;

/** */
alias g_value_set_pointer = c_g_value_set_pointer;

/** */
alias g_value_set_schar = c_g_value_set_schar;

/** */
alias g_value_set_static_boxed = c_g_value_set_static_boxed;

/** */
alias g_value_set_static_string = c_g_value_set_static_string;

/** */
alias g_value_set_string = c_g_value_set_string;

/** */
alias g_value_set_string_take_ownership = c_g_value_set_string_take_ownership;

/** */
alias g_value_set_uchar = c_g_value_set_uchar;

/** */
alias g_value_set_uint = c_g_value_set_uint;

/** */
alias g_value_set_uint64 = c_g_value_set_uint64;

/** */
alias g_value_set_ulong = c_g_value_set_ulong;

/** */
alias g_value_set_variant = c_g_value_set_variant;

/** */
alias g_value_steal_string = c_g_value_steal_string;

/** */
alias g_value_take_boxed = c_g_value_take_boxed;

/** */
alias g_value_take_object = c_g_value_take_object;

/** */
alias g_value_take_param = c_g_value_take_param;

/** */
alias g_value_take_string = c_g_value_take_string;

/** */
alias g_value_take_variant = c_g_value_take_variant;

/** */
alias g_value_transform = c_g_value_transform;

/** */
alias g_value_unset = c_g_value_unset;

/** */
alias g_value_register_transform_func = c_g_value_register_transform_func;

/** */
alias g_value_type_compatible = c_g_value_type_compatible;

/** */
alias g_value_type_transformable = c_g_value_type_transformable;

// ValueArray

/** */
alias g_value_array_get_type = c_g_value_array_get_type;

/** */
alias g_value_array_new = c_g_value_array_new;

/** */
alias g_value_array_append = c_g_value_array_append;

/** */
alias g_value_array_copy = c_g_value_array_copy;

/** */
alias g_value_array_free = c_g_value_array_free;

/** */
alias g_value_array_get_nth = c_g_value_array_get_nth;

/** */
alias g_value_array_insert = c_g_value_array_insert;

/** */
alias g_value_array_prepend = c_g_value_array_prepend;

/** */
alias g_value_array_remove = c_g_value_array_remove;

/** */
alias g_value_array_sort = c_g_value_array_sort;

/** */
alias g_value_array_sort_with_data = c_g_value_array_sort_with_data;

// WeakRef

/** */
alias g_weak_ref_clear = c_g_weak_ref_clear;

/** */
alias g_weak_ref_get = c_g_weak_ref_get;

/** */
alias g_weak_ref_init = c_g_weak_ref_init;

/** */
alias g_weak_ref_set = c_g_weak_ref_set;

// global

/** */
alias g_source_set_closure = c_g_source_set_closure;

/** */
alias g_source_set_dummy_callback = c_g_source_set_dummy_callback;

/** */
alias g_boxed_copy = c_g_boxed_copy;

/** */
alias g_boxed_free = c_g_boxed_free;

/** */
alias g_boxed_type_register_static = c_g_boxed_type_register_static;

/** */
alias g_clear_object = c_g_clear_object;

/** */
alias g_clear_signal_handler = c_g_clear_signal_handler;

/** */
alias g_enum_complete_type_info = c_g_enum_complete_type_info;

/** */
alias g_enum_get_value = c_g_enum_get_value;

/** */
alias g_enum_get_value_by_name = c_g_enum_get_value_by_name;

/** */
alias g_enum_get_value_by_nick = c_g_enum_get_value_by_nick;

/** */
alias g_enum_register_static = c_g_enum_register_static;

/** */
alias g_enum_to_string = c_g_enum_to_string;

/** */
alias g_flags_complete_type_info = c_g_flags_complete_type_info;

/** */
alias g_flags_get_first_value = c_g_flags_get_first_value;

/** */
alias g_flags_get_value_by_name = c_g_flags_get_value_by_name;

/** */
alias g_flags_get_value_by_nick = c_g_flags_get_value_by_nick;

/** */
alias g_flags_register_static = c_g_flags_register_static;

/** */
alias g_flags_to_string = c_g_flags_to_string;

/** */
alias g_gtype_get_type = c_g_gtype_get_type;

/** */
alias g_param_spec_boolean = c_g_param_spec_boolean;

/** */
alias g_param_spec_boxed = c_g_param_spec_boxed;

/** */
alias g_param_spec_char = c_g_param_spec_char;

/** */
alias g_param_spec_double = c_g_param_spec_double;

/** */
alias g_param_spec_enum = c_g_param_spec_enum;

/** */
alias g_param_spec_flags = c_g_param_spec_flags;

/** */
alias g_param_spec_float = c_g_param_spec_float;

/** */
alias g_param_spec_gtype = c_g_param_spec_gtype;

/** */
alias g_param_spec_int = c_g_param_spec_int;

/** */
alias g_param_spec_int64 = c_g_param_spec_int64;

/** */
alias g_param_spec_long = c_g_param_spec_long;

/** */
alias g_param_spec_object = c_g_param_spec_object;

/** */
alias g_param_spec_override = c_g_param_spec_override;

/** */
alias g_param_spec_param = c_g_param_spec_param;

/** */
alias g_param_spec_pointer = c_g_param_spec_pointer;

/** */
alias g_param_spec_string = c_g_param_spec_string;

/** */
alias g_param_spec_uchar = c_g_param_spec_uchar;

/** */
alias g_param_spec_uint = c_g_param_spec_uint;

/** */
alias g_param_spec_uint64 = c_g_param_spec_uint64;

/** */
alias g_param_spec_ulong = c_g_param_spec_ulong;

/** */
alias g_param_spec_unichar = c_g_param_spec_unichar;

/** */
alias g_param_spec_value_array = c_g_param_spec_value_array;

/** */
alias g_param_spec_variant = c_g_param_spec_variant;

/** */
alias g_param_type_register_static = c_g_param_type_register_static;

/** */
alias g_param_value_convert = c_g_param_value_convert;

/** */
alias g_param_value_defaults = c_g_param_value_defaults;

/** */
alias g_param_value_is_valid = c_g_param_value_is_valid;

/** */
alias g_param_value_set_default = c_g_param_value_set_default;

/** */
alias g_param_value_validate = c_g_param_value_validate;

/** */
alias g_param_values_cmp = c_g_param_values_cmp;

/** */
alias g_pointer_type_register_static = c_g_pointer_type_register_static;

/** */
alias g_signal_accumulator_first_wins = c_g_signal_accumulator_first_wins;

/** */
alias g_signal_accumulator_true_handled = c_g_signal_accumulator_true_handled;

/** */
alias g_signal_add_emission_hook = c_g_signal_add_emission_hook;

/** */
alias g_signal_chain_from_overridden = c_g_signal_chain_from_overridden;

/** */
alias g_signal_chain_from_overridden_handler = c_g_signal_chain_from_overridden_handler;

/** */
alias g_signal_connect_closure = c_g_signal_connect_closure;

/** */
alias g_signal_connect_closure_by_id = c_g_signal_connect_closure_by_id;

/** */
alias g_signal_connect_data = c_g_signal_connect_data;

/** */
alias g_signal_connect_object = c_g_signal_connect_object;

/** */
alias g_signal_emit = c_g_signal_emit;

/** */
alias g_signal_emit_by_name = c_g_signal_emit_by_name;

/** */
alias g_signal_emit_valist = c_g_signal_emit_valist;

/** */
alias g_signal_emitv = c_g_signal_emitv;

/** */
alias g_signal_get_invocation_hint = c_g_signal_get_invocation_hint;

/** */
alias g_signal_handler_block = c_g_signal_handler_block;

/** */
alias g_signal_handler_disconnect = c_g_signal_handler_disconnect;

/** */
alias g_signal_handler_find = c_g_signal_handler_find;

/** */
alias g_signal_handler_is_connected = c_g_signal_handler_is_connected;

/** */
alias g_signal_handler_unblock = c_g_signal_handler_unblock;

/** */
alias g_signal_handlers_block_matched = c_g_signal_handlers_block_matched;

/** */
alias g_signal_handlers_destroy = c_g_signal_handlers_destroy;

/** */
alias g_signal_handlers_disconnect_matched = c_g_signal_handlers_disconnect_matched;

/** */
alias g_signal_handlers_unblock_matched = c_g_signal_handlers_unblock_matched;

/** */
alias g_signal_has_handler_pending = c_g_signal_has_handler_pending;

/** */
alias g_signal_is_valid_name = c_g_signal_is_valid_name;

/** */
alias g_signal_list_ids = c_g_signal_list_ids;

/** */
alias g_signal_lookup = c_g_signal_lookup;

/** */
alias g_signal_name = c_g_signal_name;

/** */
alias g_signal_new = c_g_signal_new;

/** */
alias g_signal_new_class_handler = c_g_signal_new_class_handler;

/** */
alias g_signal_new_valist = c_g_signal_new_valist;

/** */
alias g_signal_newv = c_g_signal_newv;

/** */
alias g_signal_override_class_closure = c_g_signal_override_class_closure;

/** */
alias g_signal_override_class_handler = c_g_signal_override_class_handler;

/** */
alias g_signal_parse_name = c_g_signal_parse_name;

/** */
alias g_signal_query = c_g_signal_query;

/** */
alias g_signal_remove_emission_hook = c_g_signal_remove_emission_hook;

/** */
alias g_signal_set_va_marshaller = c_g_signal_set_va_marshaller;

/** */
alias g_signal_stop_emission = c_g_signal_stop_emission;

/** */
alias g_signal_stop_emission_by_name = c_g_signal_stop_emission_by_name;

/** */
alias g_signal_type_cclosure_new = c_g_signal_type_cclosure_new;

/** */
alias g_strdup_value_contents = c_g_strdup_value_contents;

/** */
alias g_type_add_class_cache_func = c_g_type_add_class_cache_func;

/** */
alias g_type_add_class_private = c_g_type_add_class_private;

/** */
alias g_type_add_instance_private = c_g_type_add_instance_private;

/** */
alias g_type_add_interface_check = c_g_type_add_interface_check;

/** */
alias g_type_add_interface_dynamic = c_g_type_add_interface_dynamic;

/** */
alias g_type_add_interface_static = c_g_type_add_interface_static;

/** */
alias g_type_check_class_cast = c_g_type_check_class_cast;

/** */
alias g_type_check_class_is_a = c_g_type_check_class_is_a;

/** */
alias g_type_check_instance = c_g_type_check_instance;

/** */
alias g_type_check_instance_cast = c_g_type_check_instance_cast;

/** */
alias g_type_check_instance_is_a = c_g_type_check_instance_is_a;

/** */
alias g_type_check_instance_is_fundamentally_a = c_g_type_check_instance_is_fundamentally_a;

/** */
alias g_type_check_is_value_type = c_g_type_check_is_value_type;

/** */
alias g_type_check_value = c_g_type_check_value;

/** */
alias g_type_check_value_holds = c_g_type_check_value_holds;

/** */
alias g_type_children = c_g_type_children;

/** */
alias g_type_create_instance = c_g_type_create_instance;

/** */
alias g_type_default_interface_get = c_g_type_default_interface_get;

/** */
alias g_type_default_interface_peek = c_g_type_default_interface_peek;

/** */
alias g_type_default_interface_ref = c_g_type_default_interface_ref;

/** */
alias g_type_default_interface_unref = c_g_type_default_interface_unref;

/** */
alias g_type_depth = c_g_type_depth;

/** */
alias g_type_ensure = c_g_type_ensure;

/** */
alias g_type_free_instance = c_g_type_free_instance;

/** */
alias g_type_from_name = c_g_type_from_name;

/** */
alias g_type_fundamental = c_g_type_fundamental;

/** */
alias g_type_fundamental_next = c_g_type_fundamental_next;

/** */
alias g_type_get_instance_count = c_g_type_get_instance_count;

/** */
alias g_type_get_plugin = c_g_type_get_plugin;

/** */
alias g_type_get_qdata = c_g_type_get_qdata;

/** */
alias g_type_get_type_registration_serial = c_g_type_get_type_registration_serial;

/** */
alias g_type_init = c_g_type_init;

/** */
alias g_type_init_with_debug_flags = c_g_type_init_with_debug_flags;

/** */
alias g_type_interfaces = c_g_type_interfaces;

/** */
alias g_type_is_a = c_g_type_is_a;

/** */
alias g_type_name = c_g_type_name;

/** */
alias g_type_name_from_class = c_g_type_name_from_class;

/** */
alias g_type_name_from_instance = c_g_type_name_from_instance;

/** */
alias g_type_next_base = c_g_type_next_base;

/** */
alias g_type_parent = c_g_type_parent;

/** */
alias g_type_qname = c_g_type_qname;

/** */
alias g_type_query = c_g_type_query;

/** */
alias g_type_register_dynamic = c_g_type_register_dynamic;

/** */
alias g_type_register_fundamental = c_g_type_register_fundamental;

/** */
alias g_type_register_static = c_g_type_register_static;

/** */
alias g_type_register_static_simple = c_g_type_register_static_simple;

/** */
alias g_type_remove_class_cache_func = c_g_type_remove_class_cache_func;

/** */
alias g_type_remove_interface_check = c_g_type_remove_interface_check;

/** */
alias g_type_set_qdata = c_g_type_set_qdata;

/** */
alias g_type_test_flags = c_g_type_test_flags;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Binding
  gidLink(cast(void**)&g_binding_get_type, "g_binding_get_type", libs);
  gidLink(cast(void**)&g_binding_dup_source, "g_binding_dup_source", libs);
  gidLink(cast(void**)&g_binding_dup_target, "g_binding_dup_target", libs);
  gidLink(cast(void**)&g_binding_get_flags, "g_binding_get_flags", libs);
  gidLink(cast(void**)&g_binding_get_source, "g_binding_get_source", libs);
  gidLink(cast(void**)&g_binding_get_source_property, "g_binding_get_source_property", libs);
  gidLink(cast(void**)&g_binding_get_target, "g_binding_get_target", libs);
  gidLink(cast(void**)&g_binding_get_target_property, "g_binding_get_target_property", libs);
  gidLink(cast(void**)&g_binding_unbind, "g_binding_unbind", libs);

  // BindingGroup
  gidLink(cast(void**)&g_binding_group_get_type, "g_binding_group_get_type", libs);
  gidLink(cast(void**)&g_binding_group_new, "g_binding_group_new", libs);
  gidLink(cast(void**)&g_binding_group_bind, "g_binding_group_bind", libs);
  gidLink(cast(void**)&g_binding_group_bind_full, "g_binding_group_bind_full", libs);
  gidLink(cast(void**)&g_binding_group_bind_with_closures, "g_binding_group_bind_with_closures", libs);
  gidLink(cast(void**)&g_binding_group_dup_source, "g_binding_group_dup_source", libs);
  gidLink(cast(void**)&g_binding_group_set_source, "g_binding_group_set_source", libs);

  // CClosure
  gidLink(cast(void**)&g_cclosure_marshal_BOOLEAN__BOXED_BOXED, "g_cclosure_marshal_BOOLEAN__BOXED_BOXED", libs);
  gidLink(cast(void**)&g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv, "g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_BOOLEAN__FLAGS, "g_cclosure_marshal_BOOLEAN__FLAGS", libs);
  gidLink(cast(void**)&g_cclosure_marshal_BOOLEAN__FLAGSv, "g_cclosure_marshal_BOOLEAN__FLAGSv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_STRING__OBJECT_POINTER, "g_cclosure_marshal_STRING__OBJECT_POINTER", libs);
  gidLink(cast(void**)&g_cclosure_marshal_STRING__OBJECT_POINTERv, "g_cclosure_marshal_STRING__OBJECT_POINTERv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__BOOLEAN, "g_cclosure_marshal_VOID__BOOLEAN", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__BOOLEANv, "g_cclosure_marshal_VOID__BOOLEANv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__BOXED, "g_cclosure_marshal_VOID__BOXED", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__BOXEDv, "g_cclosure_marshal_VOID__BOXEDv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__CHAR, "g_cclosure_marshal_VOID__CHAR", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__CHARv, "g_cclosure_marshal_VOID__CHARv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__DOUBLE, "g_cclosure_marshal_VOID__DOUBLE", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__DOUBLEv, "g_cclosure_marshal_VOID__DOUBLEv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__ENUM, "g_cclosure_marshal_VOID__ENUM", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__ENUMv, "g_cclosure_marshal_VOID__ENUMv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__FLAGS, "g_cclosure_marshal_VOID__FLAGS", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__FLAGSv, "g_cclosure_marshal_VOID__FLAGSv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__FLOAT, "g_cclosure_marshal_VOID__FLOAT", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__FLOATv, "g_cclosure_marshal_VOID__FLOATv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__INT, "g_cclosure_marshal_VOID__INT", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__INTv, "g_cclosure_marshal_VOID__INTv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__LONG, "g_cclosure_marshal_VOID__LONG", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__LONGv, "g_cclosure_marshal_VOID__LONGv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__OBJECT, "g_cclosure_marshal_VOID__OBJECT", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__OBJECTv, "g_cclosure_marshal_VOID__OBJECTv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__PARAM, "g_cclosure_marshal_VOID__PARAM", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__PARAMv, "g_cclosure_marshal_VOID__PARAMv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__POINTER, "g_cclosure_marshal_VOID__POINTER", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__POINTERv, "g_cclosure_marshal_VOID__POINTERv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__STRING, "g_cclosure_marshal_VOID__STRING", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__STRINGv, "g_cclosure_marshal_VOID__STRINGv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UCHAR, "g_cclosure_marshal_VOID__UCHAR", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UCHARv, "g_cclosure_marshal_VOID__UCHARv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UINT, "g_cclosure_marshal_VOID__UINT", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UINT_POINTER, "g_cclosure_marshal_VOID__UINT_POINTER", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UINT_POINTERv, "g_cclosure_marshal_VOID__UINT_POINTERv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__UINTv, "g_cclosure_marshal_VOID__UINTv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__ULONG, "g_cclosure_marshal_VOID__ULONG", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__ULONGv, "g_cclosure_marshal_VOID__ULONGv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__VARIANT, "g_cclosure_marshal_VOID__VARIANT", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__VARIANTv, "g_cclosure_marshal_VOID__VARIANTv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__VOID, "g_cclosure_marshal_VOID__VOID", libs);
  gidLink(cast(void**)&g_cclosure_marshal_VOID__VOIDv, "g_cclosure_marshal_VOID__VOIDv", libs);
  gidLink(cast(void**)&g_cclosure_marshal_generic, "g_cclosure_marshal_generic", libs);
  gidLink(cast(void**)&g_cclosure_marshal_generic_va, "g_cclosure_marshal_generic_va", libs);
  gidLink(cast(void**)&g_cclosure_new, "g_cclosure_new", libs);
  gidLink(cast(void**)&g_cclosure_new_object, "g_cclosure_new_object", libs);
  gidLink(cast(void**)&g_cclosure_new_object_swap, "g_cclosure_new_object_swap", libs);
  gidLink(cast(void**)&g_cclosure_new_swap, "g_cclosure_new_swap", libs);

  // Closure
  gidLink(cast(void**)&g_closure_get_type, "g_closure_get_type", libs);
  gidLink(cast(void**)&g_closure_new_object, "g_closure_new_object", libs);
  gidLink(cast(void**)&g_closure_new_simple, "g_closure_new_simple", libs);
  gidLink(cast(void**)&g_closure_add_finalize_notifier, "g_closure_add_finalize_notifier", libs);
  gidLink(cast(void**)&g_closure_add_invalidate_notifier, "g_closure_add_invalidate_notifier", libs);
  gidLink(cast(void**)&g_closure_add_marshal_guards, "g_closure_add_marshal_guards", libs);
  gidLink(cast(void**)&g_closure_invalidate, "g_closure_invalidate", libs);
  gidLink(cast(void**)&g_closure_invoke, "g_closure_invoke", libs);
  gidLink(cast(void**)&g_closure_ref, "g_closure_ref", libs);
  gidLink(cast(void**)&g_closure_remove_finalize_notifier, "g_closure_remove_finalize_notifier", libs);
  gidLink(cast(void**)&g_closure_remove_invalidate_notifier, "g_closure_remove_invalidate_notifier", libs);
  gidLink(cast(void**)&g_closure_set_marshal, "g_closure_set_marshal", libs);
  gidLink(cast(void**)&g_closure_set_meta_marshal, "g_closure_set_meta_marshal", libs);
  gidLink(cast(void**)&g_closure_sink, "g_closure_sink", libs);
  gidLink(cast(void**)&g_closure_unref, "g_closure_unref", libs);

  // InitiallyUnowned
  gidLink(cast(void**)&g_initially_unowned_get_type, "g_initially_unowned_get_type", libs);

  // ObjectClass
  gidLink(cast(void**)&g_object_class_find_property, "g_object_class_find_property", libs);
  gidLink(cast(void**)&g_object_class_install_properties, "g_object_class_install_properties", libs);
  gidLink(cast(void**)&g_object_class_install_property, "g_object_class_install_property", libs);
  gidLink(cast(void**)&g_object_class_list_properties, "g_object_class_list_properties", libs);
  gidLink(cast(void**)&g_object_class_override_property, "g_object_class_override_property", libs);

  // ObjectWrap
  gidLink(cast(void**)&g_object_get_type, "g_object_get_type", libs);
  gidLink(cast(void**)&g_object_new, "g_object_new", libs);
  gidLink(cast(void**)&g_object_new_valist, "g_object_new_valist", libs);
  gidLink(cast(void**)&g_object_new_with_properties, "g_object_new_with_properties", libs);
  gidLink(cast(void**)&g_object_newv, "g_object_newv", libs);
  gidLink(cast(void**)&g_object_compat_control, "g_object_compat_control", libs);
  gidLink(cast(void**)&g_object_interface_find_property, "g_object_interface_find_property", libs);
  gidLink(cast(void**)&g_object_interface_install_property, "g_object_interface_install_property", libs);
  gidLink(cast(void**)&g_object_interface_list_properties, "g_object_interface_list_properties", libs);
  gidLink(cast(void**)&g_object_add_toggle_ref, "g_object_add_toggle_ref", libs);
  gidLink(cast(void**)&g_object_add_weak_pointer, "g_object_add_weak_pointer", libs);
  gidLink(cast(void**)&g_object_bind_property, "g_object_bind_property", libs);
  gidLink(cast(void**)&g_object_bind_property_full, "g_object_bind_property_full", libs);
  gidLink(cast(void**)&g_object_bind_property_with_closures, "g_object_bind_property_with_closures", libs);
  gidLink(cast(void**)&g_object_connect, "g_object_connect", libs);
  gidLink(cast(void**)&g_object_disconnect, "g_object_disconnect", libs);
  gidLink(cast(void**)&g_object_dup_data, "g_object_dup_data", libs);
  gidLink(cast(void**)&g_object_dup_qdata, "g_object_dup_qdata", libs);
  gidLink(cast(void**)&g_object_force_floating, "g_object_force_floating", libs);
  gidLink(cast(void**)&g_object_freeze_notify, "g_object_freeze_notify", libs);
  gidLink(cast(void**)&g_object_get, "g_object_get", libs);
  gidLink(cast(void**)&g_object_get_data, "g_object_get_data", libs);
  gidLink(cast(void**)&g_object_get_property, "g_object_get_property", libs);
  gidLink(cast(void**)&g_object_get_qdata, "g_object_get_qdata", libs);
  gidLink(cast(void**)&g_object_get_valist, "g_object_get_valist", libs);
  gidLink(cast(void**)&g_object_getv, "g_object_getv", libs);
  gidLink(cast(void**)&g_object_is_floating, "g_object_is_floating", libs);
  gidLink(cast(void**)&g_object_notify, "g_object_notify", libs);
  gidLink(cast(void**)&g_object_notify_by_pspec, "g_object_notify_by_pspec", libs);
  gidLink(cast(void**)&g_object_ref, "g_object_ref", libs);
  gidLink(cast(void**)&g_object_ref_sink, "g_object_ref_sink", libs);
  gidLink(cast(void**)&g_object_remove_toggle_ref, "g_object_remove_toggle_ref", libs);
  gidLink(cast(void**)&g_object_remove_weak_pointer, "g_object_remove_weak_pointer", libs);
  gidLink(cast(void**)&g_object_replace_data, "g_object_replace_data", libs);
  gidLink(cast(void**)&g_object_replace_qdata, "g_object_replace_qdata", libs);
  gidLink(cast(void**)&g_object_run_dispose, "g_object_run_dispose", libs);
  gidLink(cast(void**)&g_object_set, "g_object_set", libs);
  gidLink(cast(void**)&g_object_set_data, "g_object_set_data", libs);
  gidLink(cast(void**)&g_object_set_data_full, "g_object_set_data_full", libs);
  gidLink(cast(void**)&g_object_set_property, "g_object_set_property", libs);
  gidLink(cast(void**)&g_object_set_qdata, "g_object_set_qdata", libs);
  gidLink(cast(void**)&g_object_set_qdata_full, "g_object_set_qdata_full", libs);
  gidLink(cast(void**)&g_object_set_valist, "g_object_set_valist", libs);
  gidLink(cast(void**)&g_object_setv, "g_object_setv", libs);
  gidLink(cast(void**)&g_object_steal_data, "g_object_steal_data", libs);
  gidLink(cast(void**)&g_object_steal_qdata, "g_object_steal_qdata", libs);
  gidLink(cast(void**)&g_object_take_ref, "g_object_take_ref", libs);
  gidLink(cast(void**)&g_object_thaw_notify, "g_object_thaw_notify", libs);
  gidLink(cast(void**)&g_object_unref, "g_object_unref", libs);
  gidLink(cast(void**)&g_object_watch_closure, "g_object_watch_closure", libs);
  gidLink(cast(void**)&g_object_weak_ref, "g_object_weak_ref", libs);
  gidLink(cast(void**)&g_object_weak_unref, "g_object_weak_unref", libs);

  // ParamSpec
  gidLink(cast(void**)&g_param_spec_internal, "g_param_spec_internal", libs);
  gidLink(cast(void**)&g_param_spec_is_valid_name, "g_param_spec_is_valid_name", libs);
  gidLink(cast(void**)&g_param_spec_get_blurb, "g_param_spec_get_blurb", libs);
  gidLink(cast(void**)&g_param_spec_get_default_value, "g_param_spec_get_default_value", libs);
  gidLink(cast(void**)&g_param_spec_get_name, "g_param_spec_get_name", libs);
  gidLink(cast(void**)&g_param_spec_get_name_quark, "g_param_spec_get_name_quark", libs);
  gidLink(cast(void**)&g_param_spec_get_nick, "g_param_spec_get_nick", libs);
  gidLink(cast(void**)&g_param_spec_get_qdata, "g_param_spec_get_qdata", libs);
  gidLink(cast(void**)&g_param_spec_get_redirect_target, "g_param_spec_get_redirect_target", libs);
  gidLink(cast(void**)&g_param_spec_ref, "g_param_spec_ref", libs);
  gidLink(cast(void**)&g_param_spec_ref_sink, "g_param_spec_ref_sink", libs);
  gidLink(cast(void**)&g_param_spec_set_qdata, "g_param_spec_set_qdata", libs);
  gidLink(cast(void**)&g_param_spec_set_qdata_full, "g_param_spec_set_qdata_full", libs);
  gidLink(cast(void**)&g_param_spec_sink, "g_param_spec_sink", libs);
  gidLink(cast(void**)&g_param_spec_steal_qdata, "g_param_spec_steal_qdata", libs);
  gidLink(cast(void**)&g_param_spec_unref, "g_param_spec_unref", libs);

  // ParamSpecPool
  gidLink(cast(void**)&g_param_spec_pool_free, "g_param_spec_pool_free", libs);
  gidLink(cast(void**)&g_param_spec_pool_insert, "g_param_spec_pool_insert", libs);
  gidLink(cast(void**)&g_param_spec_pool_list, "g_param_spec_pool_list", libs);
  gidLink(cast(void**)&g_param_spec_pool_list_owned, "g_param_spec_pool_list_owned", libs);
  gidLink(cast(void**)&g_param_spec_pool_lookup, "g_param_spec_pool_lookup", libs);
  gidLink(cast(void**)&g_param_spec_pool_remove, "g_param_spec_pool_remove", libs);
  gidLink(cast(void**)&g_param_spec_pool_new, "g_param_spec_pool_new", libs);

  // SignalGroup
  gidLink(cast(void**)&g_signal_group_get_type, "g_signal_group_get_type", libs);
  gidLink(cast(void**)&g_signal_group_new, "g_signal_group_new", libs);
  gidLink(cast(void**)&g_signal_group_block, "g_signal_group_block", libs);
  gidLink(cast(void**)&g_signal_group_connect, "g_signal_group_connect", libs);
  gidLink(cast(void**)&g_signal_group_connect_after, "g_signal_group_connect_after", libs);
  gidLink(cast(void**)&g_signal_group_connect_closure, "g_signal_group_connect_closure", libs);
  gidLink(cast(void**)&g_signal_group_connect_data, "g_signal_group_connect_data", libs);
  gidLink(cast(void**)&g_signal_group_connect_object, "g_signal_group_connect_object", libs);
  gidLink(cast(void**)&g_signal_group_connect_swapped, "g_signal_group_connect_swapped", libs);
  gidLink(cast(void**)&g_signal_group_dup_target, "g_signal_group_dup_target", libs);
  gidLink(cast(void**)&g_signal_group_set_target, "g_signal_group_set_target", libs);
  gidLink(cast(void**)&g_signal_group_unblock, "g_signal_group_unblock", libs);

  // TypeClass
  gidLink(cast(void**)&g_type_class_add_private, "g_type_class_add_private", libs);
  gidLink(cast(void**)&g_type_class_get_instance_private_offset, "g_type_class_get_instance_private_offset", libs);
  gidLink(cast(void**)&g_type_class_get_private, "g_type_class_get_private", libs);
  gidLink(cast(void**)&g_type_class_peek_parent, "g_type_class_peek_parent", libs);
  gidLink(cast(void**)&g_type_class_unref, "g_type_class_unref", libs);
  gidLink(cast(void**)&g_type_class_unref_uncached, "g_type_class_unref_uncached", libs);
  gidLink(cast(void**)&g_type_class_adjust_private_offset, "g_type_class_adjust_private_offset", libs);
  gidLink(cast(void**)&g_type_class_get, "g_type_class_get", libs);
  gidLink(cast(void**)&g_type_class_peek, "g_type_class_peek", libs);
  gidLink(cast(void**)&g_type_class_peek_static, "g_type_class_peek_static", libs);
  gidLink(cast(void**)&g_type_class_ref, "g_type_class_ref", libs);

  // TypeInstance
  gidLink(cast(void**)&g_type_instance_get_private, "g_type_instance_get_private", libs);

  // TypeInterface
  gidLink(cast(void**)&g_type_interface_peek_parent, "g_type_interface_peek_parent", libs);
  gidLink(cast(void**)&g_type_interface_add_prerequisite, "g_type_interface_add_prerequisite", libs);
  gidLink(cast(void**)&g_type_interface_get_plugin, "g_type_interface_get_plugin", libs);
  gidLink(cast(void**)&g_type_interface_instantiatable_prerequisite, "g_type_interface_instantiatable_prerequisite", libs);
  gidLink(cast(void**)&g_type_interface_peek, "g_type_interface_peek", libs);
  gidLink(cast(void**)&g_type_interface_prerequisites, "g_type_interface_prerequisites", libs);

  // TypeModule
  gidLink(cast(void**)&g_type_module_get_type, "g_type_module_get_type", libs);
  gidLink(cast(void**)&g_type_module_add_interface, "g_type_module_add_interface", libs);
  gidLink(cast(void**)&g_type_module_register_enum, "g_type_module_register_enum", libs);
  gidLink(cast(void**)&g_type_module_register_flags, "g_type_module_register_flags", libs);
  gidLink(cast(void**)&g_type_module_register_type, "g_type_module_register_type", libs);
  gidLink(cast(void**)&g_type_module_set_name, "g_type_module_set_name", libs);
  gidLink(cast(void**)&g_type_module_unuse, "g_type_module_unuse", libs);
  gidLink(cast(void**)&g_type_module_use, "g_type_module_use", libs);

  // TypePlugin
  gidLink(cast(void**)&g_type_plugin_get_type, "g_type_plugin_get_type", libs);
  gidLink(cast(void**)&g_type_plugin_complete_interface_info, "g_type_plugin_complete_interface_info", libs);
  gidLink(cast(void**)&g_type_plugin_complete_type_info, "g_type_plugin_complete_type_info", libs);
  gidLink(cast(void**)&g_type_plugin_unuse, "g_type_plugin_unuse", libs);
  gidLink(cast(void**)&g_type_plugin_use, "g_type_plugin_use", libs);

  // TypeValueTable
  gidLink(cast(void**)&g_type_value_table_peek, "g_type_value_table_peek", libs);

  // Value
  gidLink(cast(void**)&g_value_get_type, "g_value_get_type", libs);
  gidLink(cast(void**)&g_value_copy, "g_value_copy", libs);
  gidLink(cast(void**)&g_value_dup_boxed, "g_value_dup_boxed", libs);
  gidLink(cast(void**)&g_value_dup_object, "g_value_dup_object", libs);
  gidLink(cast(void**)&g_value_dup_param, "g_value_dup_param", libs);
  gidLink(cast(void**)&g_value_dup_string, "g_value_dup_string", libs);
  gidLink(cast(void**)&g_value_dup_variant, "g_value_dup_variant", libs);
  gidLink(cast(void**)&g_value_fits_pointer, "g_value_fits_pointer", libs);
  gidLink(cast(void**)&g_value_get_boolean, "g_value_get_boolean", libs);
  gidLink(cast(void**)&g_value_get_boxed, "g_value_get_boxed", libs);
  gidLink(cast(void**)&g_value_get_char, "g_value_get_char", libs);
  gidLink(cast(void**)&g_value_get_double, "g_value_get_double", libs);
  gidLink(cast(void**)&g_value_get_enum, "g_value_get_enum", libs);
  gidLink(cast(void**)&g_value_get_flags, "g_value_get_flags", libs);
  gidLink(cast(void**)&g_value_get_float, "g_value_get_float", libs);
  gidLink(cast(void**)&g_value_get_gtype, "g_value_get_gtype", libs);
  gidLink(cast(void**)&g_value_get_int, "g_value_get_int", libs);
  gidLink(cast(void**)&g_value_get_int64, "g_value_get_int64", libs);
  gidLink(cast(void**)&g_value_get_long, "g_value_get_long", libs);
  gidLink(cast(void**)&g_value_get_object, "g_value_get_object", libs);
  gidLink(cast(void**)&g_value_get_param, "g_value_get_param", libs);
  gidLink(cast(void**)&g_value_get_pointer, "g_value_get_pointer", libs);
  gidLink(cast(void**)&g_value_get_schar, "g_value_get_schar", libs);
  gidLink(cast(void**)&g_value_get_string, "g_value_get_string", libs);
  gidLink(cast(void**)&g_value_get_uchar, "g_value_get_uchar", libs);
  gidLink(cast(void**)&g_value_get_uint, "g_value_get_uint", libs);
  gidLink(cast(void**)&g_value_get_uint64, "g_value_get_uint64", libs);
  gidLink(cast(void**)&g_value_get_ulong, "g_value_get_ulong", libs);
  gidLink(cast(void**)&g_value_get_variant, "g_value_get_variant", libs);
  gidLink(cast(void**)&g_value_init, "g_value_init", libs);
  gidLink(cast(void**)&g_value_init_from_instance, "g_value_init_from_instance", libs);
  gidLink(cast(void**)&g_value_peek_pointer, "g_value_peek_pointer", libs);
  gidLink(cast(void**)&g_value_reset, "g_value_reset", libs);
  gidLink(cast(void**)&g_value_set_boolean, "g_value_set_boolean", libs);
  gidLink(cast(void**)&g_value_set_boxed, "g_value_set_boxed", libs);
  gidLink(cast(void**)&g_value_set_boxed_take_ownership, "g_value_set_boxed_take_ownership", libs);
  gidLink(cast(void**)&g_value_set_char, "g_value_set_char", libs);
  gidLink(cast(void**)&g_value_set_double, "g_value_set_double", libs);
  gidLink(cast(void**)&g_value_set_enum, "g_value_set_enum", libs);
  gidLink(cast(void**)&g_value_set_flags, "g_value_set_flags", libs);
  gidLink(cast(void**)&g_value_set_float, "g_value_set_float", libs);
  gidLink(cast(void**)&g_value_set_gtype, "g_value_set_gtype", libs);
  gidLink(cast(void**)&g_value_set_instance, "g_value_set_instance", libs);
  gidLink(cast(void**)&g_value_set_int, "g_value_set_int", libs);
  gidLink(cast(void**)&g_value_set_int64, "g_value_set_int64", libs);
  gidLink(cast(void**)&g_value_set_interned_string, "g_value_set_interned_string", libs);
  gidLink(cast(void**)&g_value_set_long, "g_value_set_long", libs);
  gidLink(cast(void**)&g_value_set_object, "g_value_set_object", libs);
  gidLink(cast(void**)&g_value_set_object_take_ownership, "g_value_set_object_take_ownership", libs);
  gidLink(cast(void**)&g_value_set_param, "g_value_set_param", libs);
  gidLink(cast(void**)&g_value_set_param_take_ownership, "g_value_set_param_take_ownership", libs);
  gidLink(cast(void**)&g_value_set_pointer, "g_value_set_pointer", libs);
  gidLink(cast(void**)&g_value_set_schar, "g_value_set_schar", libs);
  gidLink(cast(void**)&g_value_set_static_boxed, "g_value_set_static_boxed", libs);
  gidLink(cast(void**)&g_value_set_static_string, "g_value_set_static_string", libs);
  gidLink(cast(void**)&g_value_set_string, "g_value_set_string", libs);
  gidLink(cast(void**)&g_value_set_string_take_ownership, "g_value_set_string_take_ownership", libs);
  gidLink(cast(void**)&g_value_set_uchar, "g_value_set_uchar", libs);
  gidLink(cast(void**)&g_value_set_uint, "g_value_set_uint", libs);
  gidLink(cast(void**)&g_value_set_uint64, "g_value_set_uint64", libs);
  gidLink(cast(void**)&g_value_set_ulong, "g_value_set_ulong", libs);
  gidLink(cast(void**)&g_value_set_variant, "g_value_set_variant", libs);
  gidLink(cast(void**)&g_value_steal_string, "g_value_steal_string", libs);
  gidLink(cast(void**)&g_value_take_boxed, "g_value_take_boxed", libs);
  gidLink(cast(void**)&g_value_take_object, "g_value_take_object", libs);
  gidLink(cast(void**)&g_value_take_param, "g_value_take_param", libs);
  gidLink(cast(void**)&g_value_take_string, "g_value_take_string", libs);
  gidLink(cast(void**)&g_value_take_variant, "g_value_take_variant", libs);
  gidLink(cast(void**)&g_value_transform, "g_value_transform", libs);
  gidLink(cast(void**)&g_value_unset, "g_value_unset", libs);
  gidLink(cast(void**)&g_value_register_transform_func, "g_value_register_transform_func", libs);
  gidLink(cast(void**)&g_value_type_compatible, "g_value_type_compatible", libs);
  gidLink(cast(void**)&g_value_type_transformable, "g_value_type_transformable", libs);

  // ValueArray
  gidLink(cast(void**)&g_value_array_get_type, "g_value_array_get_type", libs);
  gidLink(cast(void**)&g_value_array_new, "g_value_array_new", libs);
  gidLink(cast(void**)&g_value_array_append, "g_value_array_append", libs);
  gidLink(cast(void**)&g_value_array_copy, "g_value_array_copy", libs);
  gidLink(cast(void**)&g_value_array_free, "g_value_array_free", libs);
  gidLink(cast(void**)&g_value_array_get_nth, "g_value_array_get_nth", libs);
  gidLink(cast(void**)&g_value_array_insert, "g_value_array_insert", libs);
  gidLink(cast(void**)&g_value_array_prepend, "g_value_array_prepend", libs);
  gidLink(cast(void**)&g_value_array_remove, "g_value_array_remove", libs);
  gidLink(cast(void**)&g_value_array_sort, "g_value_array_sort", libs);
  gidLink(cast(void**)&g_value_array_sort_with_data, "g_value_array_sort_with_data", libs);

  // WeakRef
  gidLink(cast(void**)&g_weak_ref_clear, "g_weak_ref_clear", libs);
  gidLink(cast(void**)&g_weak_ref_get, "g_weak_ref_get", libs);
  gidLink(cast(void**)&g_weak_ref_init, "g_weak_ref_init", libs);
  gidLink(cast(void**)&g_weak_ref_set, "g_weak_ref_set", libs);

  // global
  gidLink(cast(void**)&g_source_set_closure, "g_source_set_closure", libs);
  gidLink(cast(void**)&g_source_set_dummy_callback, "g_source_set_dummy_callback", libs);
  gidLink(cast(void**)&g_boxed_copy, "g_boxed_copy", libs);
  gidLink(cast(void**)&g_boxed_free, "g_boxed_free", libs);
  gidLink(cast(void**)&g_boxed_type_register_static, "g_boxed_type_register_static", libs);
  gidLink(cast(void**)&g_clear_object, "g_clear_object", libs);
  gidLink(cast(void**)&g_clear_signal_handler, "g_clear_signal_handler", libs);
  gidLink(cast(void**)&g_enum_complete_type_info, "g_enum_complete_type_info", libs);
  gidLink(cast(void**)&g_enum_get_value, "g_enum_get_value", libs);
  gidLink(cast(void**)&g_enum_get_value_by_name, "g_enum_get_value_by_name", libs);
  gidLink(cast(void**)&g_enum_get_value_by_nick, "g_enum_get_value_by_nick", libs);
  gidLink(cast(void**)&g_enum_register_static, "g_enum_register_static", libs);
  gidLink(cast(void**)&g_enum_to_string, "g_enum_to_string", libs);
  gidLink(cast(void**)&g_flags_complete_type_info, "g_flags_complete_type_info", libs);
  gidLink(cast(void**)&g_flags_get_first_value, "g_flags_get_first_value", libs);
  gidLink(cast(void**)&g_flags_get_value_by_name, "g_flags_get_value_by_name", libs);
  gidLink(cast(void**)&g_flags_get_value_by_nick, "g_flags_get_value_by_nick", libs);
  gidLink(cast(void**)&g_flags_register_static, "g_flags_register_static", libs);
  gidLink(cast(void**)&g_flags_to_string, "g_flags_to_string", libs);
  gidLink(cast(void**)&g_gtype_get_type, "g_gtype_get_type", libs);
  gidLink(cast(void**)&g_param_spec_boolean, "g_param_spec_boolean", libs);
  gidLink(cast(void**)&g_param_spec_boxed, "g_param_spec_boxed", libs);
  gidLink(cast(void**)&g_param_spec_char, "g_param_spec_char", libs);
  gidLink(cast(void**)&g_param_spec_double, "g_param_spec_double", libs);
  gidLink(cast(void**)&g_param_spec_enum, "g_param_spec_enum", libs);
  gidLink(cast(void**)&g_param_spec_flags, "g_param_spec_flags", libs);
  gidLink(cast(void**)&g_param_spec_float, "g_param_spec_float", libs);
  gidLink(cast(void**)&g_param_spec_gtype, "g_param_spec_gtype", libs);
  gidLink(cast(void**)&g_param_spec_int, "g_param_spec_int", libs);
  gidLink(cast(void**)&g_param_spec_int64, "g_param_spec_int64", libs);
  gidLink(cast(void**)&g_param_spec_long, "g_param_spec_long", libs);
  gidLink(cast(void**)&g_param_spec_object, "g_param_spec_object", libs);
  gidLink(cast(void**)&g_param_spec_override, "g_param_spec_override", libs);
  gidLink(cast(void**)&g_param_spec_param, "g_param_spec_param", libs);
  gidLink(cast(void**)&g_param_spec_pointer, "g_param_spec_pointer", libs);
  gidLink(cast(void**)&g_param_spec_string, "g_param_spec_string", libs);
  gidLink(cast(void**)&g_param_spec_uchar, "g_param_spec_uchar", libs);
  gidLink(cast(void**)&g_param_spec_uint, "g_param_spec_uint", libs);
  gidLink(cast(void**)&g_param_spec_uint64, "g_param_spec_uint64", libs);
  gidLink(cast(void**)&g_param_spec_ulong, "g_param_spec_ulong", libs);
  gidLink(cast(void**)&g_param_spec_unichar, "g_param_spec_unichar", libs);
  gidLink(cast(void**)&g_param_spec_value_array, "g_param_spec_value_array", libs);
  gidLink(cast(void**)&g_param_spec_variant, "g_param_spec_variant", libs);
  gidLink(cast(void**)&g_param_type_register_static, "g_param_type_register_static", libs);
  gidLink(cast(void**)&g_param_value_convert, "g_param_value_convert", libs);
  gidLink(cast(void**)&g_param_value_defaults, "g_param_value_defaults", libs);
  gidLink(cast(void**)&g_param_value_is_valid, "g_param_value_is_valid", libs);
  gidLink(cast(void**)&g_param_value_set_default, "g_param_value_set_default", libs);
  gidLink(cast(void**)&g_param_value_validate, "g_param_value_validate", libs);
  gidLink(cast(void**)&g_param_values_cmp, "g_param_values_cmp", libs);
  gidLink(cast(void**)&g_pointer_type_register_static, "g_pointer_type_register_static", libs);
  gidLink(cast(void**)&g_signal_accumulator_first_wins, "g_signal_accumulator_first_wins", libs);
  gidLink(cast(void**)&g_signal_accumulator_true_handled, "g_signal_accumulator_true_handled", libs);
  gidLink(cast(void**)&g_signal_add_emission_hook, "g_signal_add_emission_hook", libs);
  gidLink(cast(void**)&g_signal_chain_from_overridden, "g_signal_chain_from_overridden", libs);
  gidLink(cast(void**)&g_signal_chain_from_overridden_handler, "g_signal_chain_from_overridden_handler", libs);
  gidLink(cast(void**)&g_signal_connect_closure, "g_signal_connect_closure", libs);
  gidLink(cast(void**)&g_signal_connect_closure_by_id, "g_signal_connect_closure_by_id", libs);
  gidLink(cast(void**)&g_signal_connect_data, "g_signal_connect_data", libs);
  gidLink(cast(void**)&g_signal_connect_object, "g_signal_connect_object", libs);
  gidLink(cast(void**)&g_signal_emit, "g_signal_emit", libs);
  gidLink(cast(void**)&g_signal_emit_by_name, "g_signal_emit_by_name", libs);
  gidLink(cast(void**)&g_signal_emit_valist, "g_signal_emit_valist", libs);
  gidLink(cast(void**)&g_signal_emitv, "g_signal_emitv", libs);
  gidLink(cast(void**)&g_signal_get_invocation_hint, "g_signal_get_invocation_hint", libs);
  gidLink(cast(void**)&g_signal_handler_block, "g_signal_handler_block", libs);
  gidLink(cast(void**)&g_signal_handler_disconnect, "g_signal_handler_disconnect", libs);
  gidLink(cast(void**)&g_signal_handler_find, "g_signal_handler_find", libs);
  gidLink(cast(void**)&g_signal_handler_is_connected, "g_signal_handler_is_connected", libs);
  gidLink(cast(void**)&g_signal_handler_unblock, "g_signal_handler_unblock", libs);
  gidLink(cast(void**)&g_signal_handlers_block_matched, "g_signal_handlers_block_matched", libs);
  gidLink(cast(void**)&g_signal_handlers_destroy, "g_signal_handlers_destroy", libs);
  gidLink(cast(void**)&g_signal_handlers_disconnect_matched, "g_signal_handlers_disconnect_matched", libs);
  gidLink(cast(void**)&g_signal_handlers_unblock_matched, "g_signal_handlers_unblock_matched", libs);
  gidLink(cast(void**)&g_signal_has_handler_pending, "g_signal_has_handler_pending", libs);
  gidLink(cast(void**)&g_signal_is_valid_name, "g_signal_is_valid_name", libs);
  gidLink(cast(void**)&g_signal_list_ids, "g_signal_list_ids", libs);
  gidLink(cast(void**)&g_signal_lookup, "g_signal_lookup", libs);
  gidLink(cast(void**)&g_signal_name, "g_signal_name", libs);
  gidLink(cast(void**)&g_signal_new, "g_signal_new", libs);
  gidLink(cast(void**)&g_signal_new_class_handler, "g_signal_new_class_handler", libs);
  gidLink(cast(void**)&g_signal_new_valist, "g_signal_new_valist", libs);
  gidLink(cast(void**)&g_signal_newv, "g_signal_newv", libs);
  gidLink(cast(void**)&g_signal_override_class_closure, "g_signal_override_class_closure", libs);
  gidLink(cast(void**)&g_signal_override_class_handler, "g_signal_override_class_handler", libs);
  gidLink(cast(void**)&g_signal_parse_name, "g_signal_parse_name", libs);
  gidLink(cast(void**)&g_signal_query, "g_signal_query", libs);
  gidLink(cast(void**)&g_signal_remove_emission_hook, "g_signal_remove_emission_hook", libs);
  gidLink(cast(void**)&g_signal_set_va_marshaller, "g_signal_set_va_marshaller", libs);
  gidLink(cast(void**)&g_signal_stop_emission, "g_signal_stop_emission", libs);
  gidLink(cast(void**)&g_signal_stop_emission_by_name, "g_signal_stop_emission_by_name", libs);
  gidLink(cast(void**)&g_signal_type_cclosure_new, "g_signal_type_cclosure_new", libs);
  gidLink(cast(void**)&g_strdup_value_contents, "g_strdup_value_contents", libs);
  gidLink(cast(void**)&g_type_add_class_cache_func, "g_type_add_class_cache_func", libs);
  gidLink(cast(void**)&g_type_add_class_private, "g_type_add_class_private", libs);
  gidLink(cast(void**)&g_type_add_instance_private, "g_type_add_instance_private", libs);
  gidLink(cast(void**)&g_type_add_interface_check, "g_type_add_interface_check", libs);
  gidLink(cast(void**)&g_type_add_interface_dynamic, "g_type_add_interface_dynamic", libs);
  gidLink(cast(void**)&g_type_add_interface_static, "g_type_add_interface_static", libs);
  gidLink(cast(void**)&g_type_check_class_cast, "g_type_check_class_cast", libs);
  gidLink(cast(void**)&g_type_check_class_is_a, "g_type_check_class_is_a", libs);
  gidLink(cast(void**)&g_type_check_instance, "g_type_check_instance", libs);
  gidLink(cast(void**)&g_type_check_instance_cast, "g_type_check_instance_cast", libs);
  gidLink(cast(void**)&g_type_check_instance_is_a, "g_type_check_instance_is_a", libs);
  gidLink(cast(void**)&g_type_check_instance_is_fundamentally_a, "g_type_check_instance_is_fundamentally_a", libs);
  gidLink(cast(void**)&g_type_check_is_value_type, "g_type_check_is_value_type", libs);
  gidLink(cast(void**)&g_type_check_value, "g_type_check_value", libs);
  gidLink(cast(void**)&g_type_check_value_holds, "g_type_check_value_holds", libs);
  gidLink(cast(void**)&g_type_children, "g_type_children", libs);
  gidLink(cast(void**)&g_type_create_instance, "g_type_create_instance", libs);
  gidLink(cast(void**)&g_type_default_interface_get, "g_type_default_interface_get", libs);
  gidLink(cast(void**)&g_type_default_interface_peek, "g_type_default_interface_peek", libs);
  gidLink(cast(void**)&g_type_default_interface_ref, "g_type_default_interface_ref", libs);
  gidLink(cast(void**)&g_type_default_interface_unref, "g_type_default_interface_unref", libs);
  gidLink(cast(void**)&g_type_depth, "g_type_depth", libs);
  gidLink(cast(void**)&g_type_ensure, "g_type_ensure", libs);
  gidLink(cast(void**)&g_type_free_instance, "g_type_free_instance", libs);
  gidLink(cast(void**)&g_type_from_name, "g_type_from_name", libs);
  gidLink(cast(void**)&g_type_fundamental, "g_type_fundamental", libs);
  gidLink(cast(void**)&g_type_fundamental_next, "g_type_fundamental_next", libs);
  gidLink(cast(void**)&g_type_get_instance_count, "g_type_get_instance_count", libs);
  gidLink(cast(void**)&g_type_get_plugin, "g_type_get_plugin", libs);
  gidLink(cast(void**)&g_type_get_qdata, "g_type_get_qdata", libs);
  gidLink(cast(void**)&g_type_get_type_registration_serial, "g_type_get_type_registration_serial", libs);
  gidLink(cast(void**)&g_type_init, "g_type_init", libs);
  gidLink(cast(void**)&g_type_init_with_debug_flags, "g_type_init_with_debug_flags", libs);
  gidLink(cast(void**)&g_type_interfaces, "g_type_interfaces", libs);
  gidLink(cast(void**)&g_type_is_a, "g_type_is_a", libs);
  gidLink(cast(void**)&g_type_name, "g_type_name", libs);
  gidLink(cast(void**)&g_type_name_from_class, "g_type_name_from_class", libs);
  gidLink(cast(void**)&g_type_name_from_instance, "g_type_name_from_instance", libs);
  gidLink(cast(void**)&g_type_next_base, "g_type_next_base", libs);
  gidLink(cast(void**)&g_type_parent, "g_type_parent", libs);
  gidLink(cast(void**)&g_type_qname, "g_type_qname", libs);
  gidLink(cast(void**)&g_type_query, "g_type_query", libs);
  gidLink(cast(void**)&g_type_register_dynamic, "g_type_register_dynamic", libs);
  gidLink(cast(void**)&g_type_register_fundamental, "g_type_register_fundamental", libs);
  gidLink(cast(void**)&g_type_register_static, "g_type_register_static", libs);
  gidLink(cast(void**)&g_type_register_static_simple, "g_type_register_static_simple", libs);
  gidLink(cast(void**)&g_type_remove_class_cache_func, "g_type_remove_class_cache_func", libs);
  gidLink(cast(void**)&g_type_remove_interface_check, "g_type_remove_interface_check", libs);
  gidLink(cast(void**)&g_type_set_qdata, "g_type_set_qdata", libs);
  gidLink(cast(void**)&g_type_test_flags, "g_type_test_flags", libs);
}
