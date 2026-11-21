/// C functions for javascriptcore6 library
module gid.javascriptcore6.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.javascriptcore6.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["javascriptcoregtk-6.0_1"];

// Class
private alias c_jsc_class_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_class_get_typeFn c_jsc_class_get_type; ///
private alias c_jsc_class_add_constructorFn = extern(C) JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) nothrow;
__gshared c_jsc_class_add_constructorFn c_jsc_class_add_constructor; ///
private alias c_jsc_class_add_constructor_variadicFn = extern(C) JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) nothrow;
__gshared c_jsc_class_add_constructor_variadicFn c_jsc_class_add_constructor_variadic; ///
private alias c_jsc_class_add_constructorvFn = extern(C) JSCValue* function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) nothrow;
__gshared c_jsc_class_add_constructorvFn c_jsc_class_add_constructorv; ///
private alias c_jsc_class_add_methodFn = extern(C) void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) nothrow;
__gshared c_jsc_class_add_methodFn c_jsc_class_add_method; ///
private alias c_jsc_class_add_method_variadicFn = extern(C) void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) nothrow;
__gshared c_jsc_class_add_method_variadicFn c_jsc_class_add_method_variadic; ///
private alias c_jsc_class_add_methodvFn = extern(C) void function(JSCClass* jscClass, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) nothrow;
__gshared c_jsc_class_add_methodvFn c_jsc_class_add_methodv; ///
private alias c_jsc_class_add_propertyFn = extern(C) void function(JSCClass* jscClass, const(char)* name, GType propertyType, GCallback getter, GCallback setter, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_jsc_class_add_propertyFn c_jsc_class_add_property; ///
private alias c_jsc_class_get_nameFn = extern(C) const(char)* function(JSCClass* jscClass) nothrow;
__gshared c_jsc_class_get_nameFn c_jsc_class_get_name; ///
private alias c_jsc_class_get_parentFn = extern(C) JSCClass* function(JSCClass* jscClass) nothrow;
__gshared c_jsc_class_get_parentFn c_jsc_class_get_parent; ///

// Context
private alias c_jsc_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_context_get_typeFn c_jsc_context_get_type; ///
private alias c_jsc_context_newFn = extern(C) JSCContext* function() nothrow;
__gshared c_jsc_context_newFn c_jsc_context_new; ///
private alias c_jsc_context_new_with_virtual_machineFn = extern(C) JSCContext* function(JSCVirtualMachine* vm) nothrow;
__gshared c_jsc_context_new_with_virtual_machineFn c_jsc_context_new_with_virtual_machine; ///
private alias c_jsc_context_get_currentFn = extern(C) JSCContext* function() nothrow;
__gshared c_jsc_context_get_currentFn c_jsc_context_get_current; ///
private alias c_jsc_context_check_syntaxFn = extern(C) JSCCheckSyntaxResult function(JSCContext* context, const(char)* code, ptrdiff_t length, JSCCheckSyntaxMode mode, const(char)* uri, uint lineNumber, JSCException** exception) nothrow;
__gshared c_jsc_context_check_syntaxFn c_jsc_context_check_syntax; ///
private alias c_jsc_context_clear_exceptionFn = extern(C) void function(JSCContext* context) nothrow;
__gshared c_jsc_context_clear_exceptionFn c_jsc_context_clear_exception; ///
private alias c_jsc_context_evaluateFn = extern(C) JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length) nothrow;
__gshared c_jsc_context_evaluateFn c_jsc_context_evaluate; ///
private alias c_jsc_context_evaluate_in_objectFn = extern(C) JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length, void* objectInstance, JSCClass* objectClass, const(char)* uri, uint lineNumber, JSCValue** object) nothrow;
__gshared c_jsc_context_evaluate_in_objectFn c_jsc_context_evaluate_in_object; ///
private alias c_jsc_context_evaluate_with_source_uriFn = extern(C) JSCValue* function(JSCContext* context, const(char)* code, ptrdiff_t length, const(char)* uri, uint lineNumber) nothrow;
__gshared c_jsc_context_evaluate_with_source_uriFn c_jsc_context_evaluate_with_source_uri; ///
private alias c_jsc_context_get_exceptionFn = extern(C) JSCException* function(JSCContext* context) nothrow;
__gshared c_jsc_context_get_exceptionFn c_jsc_context_get_exception; ///
private alias c_jsc_context_get_global_objectFn = extern(C) JSCValue* function(JSCContext* context) nothrow;
__gshared c_jsc_context_get_global_objectFn c_jsc_context_get_global_object; ///
private alias c_jsc_context_get_valueFn = extern(C) JSCValue* function(JSCContext* context, const(char)* name) nothrow;
__gshared c_jsc_context_get_valueFn c_jsc_context_get_value; ///
private alias c_jsc_context_get_virtual_machineFn = extern(C) JSCVirtualMachine* function(JSCContext* context) nothrow;
__gshared c_jsc_context_get_virtual_machineFn c_jsc_context_get_virtual_machine; ///
private alias c_jsc_context_pop_exception_handlerFn = extern(C) void function(JSCContext* context) nothrow;
__gshared c_jsc_context_pop_exception_handlerFn c_jsc_context_pop_exception_handler; ///
private alias c_jsc_context_push_exception_handlerFn = extern(C) void function(JSCContext* context, JSCExceptionHandler handler, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_jsc_context_push_exception_handlerFn c_jsc_context_push_exception_handler; ///
private alias c_jsc_context_register_classFn = extern(C) JSCClass* function(JSCContext* context, const(char)* name, JSCClass* parentClass, JSCClassVTable* vtable, GDestroyNotify destroyNotify) nothrow;
__gshared c_jsc_context_register_classFn c_jsc_context_register_class; ///
private alias c_jsc_context_set_valueFn = extern(C) void function(JSCContext* context, const(char)* name, JSCValue* value) nothrow;
__gshared c_jsc_context_set_valueFn c_jsc_context_set_value; ///
private alias c_jsc_context_throwFn = extern(C) void function(JSCContext* context, const(char)* errorMessage) nothrow;
__gshared c_jsc_context_throwFn c_jsc_context_throw; ///
private alias c_jsc_context_throw_exceptionFn = extern(C) void function(JSCContext* context, JSCException* exception) nothrow;
__gshared c_jsc_context_throw_exceptionFn c_jsc_context_throw_exception; ///
private alias c_jsc_context_throw_printfFn = extern(C) void function(JSCContext* context, const(char)* format,  ...) nothrow;
__gshared c_jsc_context_throw_printfFn c_jsc_context_throw_printf; ///
private alias c_jsc_context_throw_with_nameFn = extern(C) void function(JSCContext* context, const(char)* errorName, const(char)* errorMessage) nothrow;
__gshared c_jsc_context_throw_with_nameFn c_jsc_context_throw_with_name; ///
private alias c_jsc_context_throw_with_name_printfFn = extern(C) void function(JSCContext* context, const(char)* errorName, const(char)* format,  ...) nothrow;
__gshared c_jsc_context_throw_with_name_printfFn c_jsc_context_throw_with_name_printf; ///

// ExceptionWrap
private alias c_jsc_exception_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_exception_get_typeFn c_jsc_exception_get_type; ///
private alias c_jsc_exception_newFn = extern(C) JSCException* function(JSCContext* context, const(char)* message) nothrow;
__gshared c_jsc_exception_newFn c_jsc_exception_new; ///
private alias c_jsc_exception_new_printfFn = extern(C) JSCException* function(JSCContext* context, const(char)* format,  ...) nothrow;
__gshared c_jsc_exception_new_printfFn c_jsc_exception_new_printf; ///
private alias c_jsc_exception_new_vprintfFn = extern(C) JSCException* function(JSCContext* context, const(char)* format, void* args) nothrow;
__gshared c_jsc_exception_new_vprintfFn c_jsc_exception_new_vprintf; ///
private alias c_jsc_exception_new_with_nameFn = extern(C) JSCException* function(JSCContext* context, const(char)* name, const(char)* message) nothrow;
__gshared c_jsc_exception_new_with_nameFn c_jsc_exception_new_with_name; ///
private alias c_jsc_exception_new_with_name_printfFn = extern(C) JSCException* function(JSCContext* context, const(char)* name, const(char)* format,  ...) nothrow;
__gshared c_jsc_exception_new_with_name_printfFn c_jsc_exception_new_with_name_printf; ///
private alias c_jsc_exception_new_with_name_vprintfFn = extern(C) JSCException* function(JSCContext* context, const(char)* name, const(char)* format, void* args) nothrow;
__gshared c_jsc_exception_new_with_name_vprintfFn c_jsc_exception_new_with_name_vprintf; ///
private alias c_jsc_exception_get_backtrace_stringFn = extern(C) const(char)* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_backtrace_stringFn c_jsc_exception_get_backtrace_string; ///
private alias c_jsc_exception_get_column_numberFn = extern(C) uint function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_column_numberFn c_jsc_exception_get_column_number; ///
private alias c_jsc_exception_get_line_numberFn = extern(C) uint function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_line_numberFn c_jsc_exception_get_line_number; ///
private alias c_jsc_exception_get_messageFn = extern(C) const(char)* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_messageFn c_jsc_exception_get_message; ///
private alias c_jsc_exception_get_nameFn = extern(C) const(char)* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_nameFn c_jsc_exception_get_name; ///
private alias c_jsc_exception_get_source_uriFn = extern(C) const(char)* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_get_source_uriFn c_jsc_exception_get_source_uri; ///
private alias c_jsc_exception_reportFn = extern(C) char* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_reportFn c_jsc_exception_report; ///
private alias c_jsc_exception_to_stringFn = extern(C) char* function(JSCException* exception) nothrow;
__gshared c_jsc_exception_to_stringFn c_jsc_exception_to_string; ///

// Value
private alias c_jsc_value_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_value_get_typeFn c_jsc_value_get_type; ///
private alias c_jsc_value_new_arrayFn = extern(C) JSCValue* function(JSCContext* context, GType firstItemType,  ...) nothrow;
__gshared c_jsc_value_new_arrayFn c_jsc_value_new_array; ///
private alias c_jsc_value_new_array_bufferFn = extern(C) JSCValue* function(JSCContext* context, void* data, size_t size, GDestroyNotify destroyNotify, void* userData) nothrow;
__gshared c_jsc_value_new_array_bufferFn c_jsc_value_new_array_buffer; ///
private alias c_jsc_value_new_array_from_garrayFn = extern(C) JSCValue* function(JSCContext* context, GPtrArray* array) nothrow;
__gshared c_jsc_value_new_array_from_garrayFn c_jsc_value_new_array_from_garray; ///
private alias c_jsc_value_new_array_from_strvFn = extern(C) JSCValue* function(JSCContext* context, const(char*)* strv) nothrow;
__gshared c_jsc_value_new_array_from_strvFn c_jsc_value_new_array_from_strv; ///
private alias c_jsc_value_new_booleanFn = extern(C) JSCValue* function(JSCContext* context, gboolean value) nothrow;
__gshared c_jsc_value_new_booleanFn c_jsc_value_new_boolean; ///
private alias c_jsc_value_new_from_jsonFn = extern(C) JSCValue* function(JSCContext* context, const(char)* json) nothrow;
__gshared c_jsc_value_new_from_jsonFn c_jsc_value_new_from_json; ///
private alias c_jsc_value_new_functionFn = extern(C) JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParams,  ...) nothrow;
__gshared c_jsc_value_new_functionFn c_jsc_value_new_function; ///
private alias c_jsc_value_new_function_variadicFn = extern(C) JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType) nothrow;
__gshared c_jsc_value_new_function_variadicFn c_jsc_value_new_function_variadic; ///
private alias c_jsc_value_new_functionvFn = extern(C) JSCValue* function(JSCContext* context, const(char)* name, GCallback callback, void* userData, GDestroyNotify destroyNotify, GType returnType, uint nParameters, GType* parameterTypes) nothrow;
__gshared c_jsc_value_new_functionvFn c_jsc_value_new_functionv; ///
private alias c_jsc_value_new_nullFn = extern(C) JSCValue* function(JSCContext* context) nothrow;
__gshared c_jsc_value_new_nullFn c_jsc_value_new_null; ///
private alias c_jsc_value_new_numberFn = extern(C) JSCValue* function(JSCContext* context, double number) nothrow;
__gshared c_jsc_value_new_numberFn c_jsc_value_new_number; ///
private alias c_jsc_value_new_objectFn = extern(C) JSCValue* function(JSCContext* context, void* instance, JSCClass* jscClass) nothrow;
__gshared c_jsc_value_new_objectFn c_jsc_value_new_object; ///
private alias c_jsc_value_new_promiseFn = extern(C) JSCValue* function(JSCContext* context, JSCExecutor executor, void* userData) nothrow;
__gshared c_jsc_value_new_promiseFn c_jsc_value_new_promise; ///
private alias c_jsc_value_new_stringFn = extern(C) JSCValue* function(JSCContext* context, const(char)* string_) nothrow;
__gshared c_jsc_value_new_stringFn c_jsc_value_new_string; ///
private alias c_jsc_value_new_string_from_bytesFn = extern(C) JSCValue* function(JSCContext* context, GBytes* bytes) nothrow;
__gshared c_jsc_value_new_string_from_bytesFn c_jsc_value_new_string_from_bytes; ///
private alias c_jsc_value_new_typed_arrayFn = extern(C) JSCValue* function(JSCContext* context, JSCTypedArrayType type, size_t length) nothrow;
__gshared c_jsc_value_new_typed_arrayFn c_jsc_value_new_typed_array; ///
private alias c_jsc_value_new_undefinedFn = extern(C) JSCValue* function(JSCContext* context) nothrow;
__gshared c_jsc_value_new_undefinedFn c_jsc_value_new_undefined; ///
private alias c_jsc_value_array_buffer_get_dataFn = extern(C) void* function(JSCValue* value, size_t* size) nothrow;
__gshared c_jsc_value_array_buffer_get_dataFn c_jsc_value_array_buffer_get_data; ///
private alias c_jsc_value_array_buffer_get_sizeFn = extern(C) size_t function(JSCValue* value) nothrow;
__gshared c_jsc_value_array_buffer_get_sizeFn c_jsc_value_array_buffer_get_size; ///
private alias c_jsc_value_constructor_callFn = extern(C) JSCValue* function(JSCValue* value, GType firstParameterType,  ...) nothrow;
__gshared c_jsc_value_constructor_callFn c_jsc_value_constructor_call; ///
private alias c_jsc_value_constructor_callvFn = extern(C) JSCValue* function(JSCValue* value, uint nParameters, JSCValue** parameters) nothrow;
__gshared c_jsc_value_constructor_callvFn c_jsc_value_constructor_callv; ///
private alias c_jsc_value_function_callFn = extern(C) JSCValue* function(JSCValue* value, GType firstParameterType,  ...) nothrow;
__gshared c_jsc_value_function_callFn c_jsc_value_function_call; ///
private alias c_jsc_value_function_callvFn = extern(C) JSCValue* function(JSCValue* value, uint nParameters, JSCValue** parameters) nothrow;
__gshared c_jsc_value_function_callvFn c_jsc_value_function_callv; ///
private alias c_jsc_value_get_contextFn = extern(C) JSCContext* function(JSCValue* value) nothrow;
__gshared c_jsc_value_get_contextFn c_jsc_value_get_context; ///
private alias c_jsc_value_is_arrayFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_arrayFn c_jsc_value_is_array; ///
private alias c_jsc_value_is_array_bufferFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_array_bufferFn c_jsc_value_is_array_buffer; ///
private alias c_jsc_value_is_booleanFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_booleanFn c_jsc_value_is_boolean; ///
private alias c_jsc_value_is_constructorFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_constructorFn c_jsc_value_is_constructor; ///
private alias c_jsc_value_is_functionFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_functionFn c_jsc_value_is_function; ///
private alias c_jsc_value_is_nullFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_nullFn c_jsc_value_is_null; ///
private alias c_jsc_value_is_numberFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_numberFn c_jsc_value_is_number; ///
private alias c_jsc_value_is_objectFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_objectFn c_jsc_value_is_object; ///
private alias c_jsc_value_is_stringFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_stringFn c_jsc_value_is_string; ///
private alias c_jsc_value_is_typed_arrayFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_typed_arrayFn c_jsc_value_is_typed_array; ///
private alias c_jsc_value_is_undefinedFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_is_undefinedFn c_jsc_value_is_undefined; ///
private alias c_jsc_value_new_typed_array_with_bufferFn = extern(C) JSCValue* function(JSCValue* arrayBuffer, JSCTypedArrayType type, size_t offset, ptrdiff_t length) nothrow;
__gshared c_jsc_value_new_typed_array_with_bufferFn c_jsc_value_new_typed_array_with_buffer; ///
private alias c_jsc_value_object_define_property_accessorFn = extern(C) void function(JSCValue* value, const(char)* propertyName, JSCValuePropertyFlags flags, GType propertyType, GCallback getter, GCallback setter, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_jsc_value_object_define_property_accessorFn c_jsc_value_object_define_property_accessor; ///
private alias c_jsc_value_object_define_property_dataFn = extern(C) void function(JSCValue* value, const(char)* propertyName, JSCValuePropertyFlags flags, JSCValue* propertyValue) nothrow;
__gshared c_jsc_value_object_define_property_dataFn c_jsc_value_object_define_property_data; ///
private alias c_jsc_value_object_delete_propertyFn = extern(C) gboolean function(JSCValue* value, const(char)* name) nothrow;
__gshared c_jsc_value_object_delete_propertyFn c_jsc_value_object_delete_property; ///
private alias c_jsc_value_object_enumerate_propertiesFn = extern(C) char** function(JSCValue* value) nothrow;
__gshared c_jsc_value_object_enumerate_propertiesFn c_jsc_value_object_enumerate_properties; ///
private alias c_jsc_value_object_get_propertyFn = extern(C) JSCValue* function(JSCValue* value, const(char)* name) nothrow;
__gshared c_jsc_value_object_get_propertyFn c_jsc_value_object_get_property; ///
private alias c_jsc_value_object_get_property_at_indexFn = extern(C) JSCValue* function(JSCValue* value, uint index) nothrow;
__gshared c_jsc_value_object_get_property_at_indexFn c_jsc_value_object_get_property_at_index; ///
private alias c_jsc_value_object_has_propertyFn = extern(C) gboolean function(JSCValue* value, const(char)* name) nothrow;
__gshared c_jsc_value_object_has_propertyFn c_jsc_value_object_has_property; ///
private alias c_jsc_value_object_invoke_methodFn = extern(C) JSCValue* function(JSCValue* value, const(char)* name, GType firstParameterType,  ...) nothrow;
__gshared c_jsc_value_object_invoke_methodFn c_jsc_value_object_invoke_method; ///
private alias c_jsc_value_object_invoke_methodvFn = extern(C) JSCValue* function(JSCValue* value, const(char)* name, uint nParameters, JSCValue** parameters) nothrow;
__gshared c_jsc_value_object_invoke_methodvFn c_jsc_value_object_invoke_methodv; ///
private alias c_jsc_value_object_is_instance_ofFn = extern(C) gboolean function(JSCValue* value, const(char)* name) nothrow;
__gshared c_jsc_value_object_is_instance_ofFn c_jsc_value_object_is_instance_of; ///
private alias c_jsc_value_object_set_propertyFn = extern(C) void function(JSCValue* value, const(char)* name, JSCValue* property) nothrow;
__gshared c_jsc_value_object_set_propertyFn c_jsc_value_object_set_property; ///
private alias c_jsc_value_object_set_property_at_indexFn = extern(C) void function(JSCValue* value, uint index, JSCValue* property) nothrow;
__gshared c_jsc_value_object_set_property_at_indexFn c_jsc_value_object_set_property_at_index; ///
private alias c_jsc_value_to_booleanFn = extern(C) gboolean function(JSCValue* value) nothrow;
__gshared c_jsc_value_to_booleanFn c_jsc_value_to_boolean; ///
private alias c_jsc_value_to_doubleFn = extern(C) double function(JSCValue* value) nothrow;
__gshared c_jsc_value_to_doubleFn c_jsc_value_to_double; ///
private alias c_jsc_value_to_int32Fn = extern(C) int function(JSCValue* value) nothrow;
__gshared c_jsc_value_to_int32Fn c_jsc_value_to_int32; ///
private alias c_jsc_value_to_jsonFn = extern(C) char* function(JSCValue* value, uint indent) nothrow;
__gshared c_jsc_value_to_jsonFn c_jsc_value_to_json; ///
private alias c_jsc_value_to_stringFn = extern(C) char* function(JSCValue* value) nothrow;
__gshared c_jsc_value_to_stringFn c_jsc_value_to_string; ///
private alias c_jsc_value_to_string_as_bytesFn = extern(C) GBytes* function(JSCValue* value) nothrow;
__gshared c_jsc_value_to_string_as_bytesFn c_jsc_value_to_string_as_bytes; ///
private alias c_jsc_value_typed_array_get_bufferFn = extern(C) JSCValue* function(JSCValue* value) nothrow;
__gshared c_jsc_value_typed_array_get_bufferFn c_jsc_value_typed_array_get_buffer; ///
private alias c_jsc_value_typed_array_get_dataFn = extern(C) void* function(JSCValue* value, size_t* length) nothrow;
__gshared c_jsc_value_typed_array_get_dataFn c_jsc_value_typed_array_get_data; ///
private alias c_jsc_value_typed_array_get_lengthFn = extern(C) size_t function(JSCValue* value) nothrow;
__gshared c_jsc_value_typed_array_get_lengthFn c_jsc_value_typed_array_get_length; ///
private alias c_jsc_value_typed_array_get_offsetFn = extern(C) size_t function(JSCValue* value) nothrow;
__gshared c_jsc_value_typed_array_get_offsetFn c_jsc_value_typed_array_get_offset; ///
private alias c_jsc_value_typed_array_get_sizeFn = extern(C) size_t function(JSCValue* value) nothrow;
__gshared c_jsc_value_typed_array_get_sizeFn c_jsc_value_typed_array_get_size; ///
private alias c_jsc_value_typed_array_get_typeFn = extern(C) JSCTypedArrayType function(JSCValue* value) nothrow;
__gshared c_jsc_value_typed_array_get_typeFn c_jsc_value_typed_array_get_type; ///

// VirtualMachine
private alias c_jsc_virtual_machine_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_virtual_machine_get_typeFn c_jsc_virtual_machine_get_type; ///
private alias c_jsc_virtual_machine_newFn = extern(C) JSCVirtualMachine* function() nothrow;
__gshared c_jsc_virtual_machine_newFn c_jsc_virtual_machine_new; ///

// WeakValue
private alias c_jsc_weak_value_get_typeFn = extern(C) GType function() nothrow;
__gshared c_jsc_weak_value_get_typeFn c_jsc_weak_value_get_type; ///
private alias c_jsc_weak_value_newFn = extern(C) JSCWeakValue* function(JSCValue* value) nothrow;
__gshared c_jsc_weak_value_newFn c_jsc_weak_value_new; ///
private alias c_jsc_weak_value_get_valueFn = extern(C) JSCValue* function(JSCWeakValue* weakValue) nothrow;
__gshared c_jsc_weak_value_get_valueFn c_jsc_weak_value_get_value; ///

// global
private alias c_jsc_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_jsc_get_major_versionFn c_jsc_get_major_version; ///
private alias c_jsc_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_jsc_get_micro_versionFn c_jsc_get_micro_version; ///
private alias c_jsc_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_jsc_get_minor_versionFn c_jsc_get_minor_version; ///
private alias c_jsc_options_foreachFn = extern(C) void function(JSCOptionsFunc function_, void* userData) nothrow;
__gshared c_jsc_options_foreachFn c_jsc_options_foreach; ///
private alias c_jsc_options_get_booleanFn = extern(C) gboolean function(const(char)* option, gboolean* value) nothrow;
__gshared c_jsc_options_get_booleanFn c_jsc_options_get_boolean; ///
private alias c_jsc_options_get_doubleFn = extern(C) gboolean function(const(char)* option, double* value) nothrow;
__gshared c_jsc_options_get_doubleFn c_jsc_options_get_double; ///
private alias c_jsc_options_get_intFn = extern(C) gboolean function(const(char)* option, int* value) nothrow;
__gshared c_jsc_options_get_intFn c_jsc_options_get_int; ///
private alias c_jsc_options_get_option_groupFn = extern(C) GOptionGroup* function() nothrow;
__gshared c_jsc_options_get_option_groupFn c_jsc_options_get_option_group; ///
private alias c_jsc_options_get_range_stringFn = extern(C) gboolean function(const(char)* option, char** value) nothrow;
__gshared c_jsc_options_get_range_stringFn c_jsc_options_get_range_string; ///
private alias c_jsc_options_get_sizeFn = extern(C) gboolean function(const(char)* option, size_t* value) nothrow;
__gshared c_jsc_options_get_sizeFn c_jsc_options_get_size; ///
private alias c_jsc_options_get_stringFn = extern(C) gboolean function(const(char)* option, char** value) nothrow;
__gshared c_jsc_options_get_stringFn c_jsc_options_get_string; ///
private alias c_jsc_options_get_uintFn = extern(C) gboolean function(const(char)* option, uint* value) nothrow;
__gshared c_jsc_options_get_uintFn c_jsc_options_get_uint; ///
private alias c_jsc_options_set_booleanFn = extern(C) gboolean function(const(char)* option, gboolean value) nothrow;
__gshared c_jsc_options_set_booleanFn c_jsc_options_set_boolean; ///
private alias c_jsc_options_set_doubleFn = extern(C) gboolean function(const(char)* option, double value) nothrow;
__gshared c_jsc_options_set_doubleFn c_jsc_options_set_double; ///
private alias c_jsc_options_set_intFn = extern(C) gboolean function(const(char)* option, int value) nothrow;
__gshared c_jsc_options_set_intFn c_jsc_options_set_int; ///
private alias c_jsc_options_set_range_stringFn = extern(C) gboolean function(const(char)* option, const(char)* value) nothrow;
__gshared c_jsc_options_set_range_stringFn c_jsc_options_set_range_string; ///
private alias c_jsc_options_set_sizeFn = extern(C) gboolean function(const(char)* option, size_t value) nothrow;
__gshared c_jsc_options_set_sizeFn c_jsc_options_set_size; ///
private alias c_jsc_options_set_stringFn = extern(C) gboolean function(const(char)* option, const(char)* value) nothrow;
__gshared c_jsc_options_set_stringFn c_jsc_options_set_string; ///
private alias c_jsc_options_set_uintFn = extern(C) gboolean function(const(char)* option, uint value) nothrow;
__gshared c_jsc_options_set_uintFn c_jsc_options_set_uint; ///

// Class

/** */
alias jsc_class_get_type = c_jsc_class_get_type;

/** */
alias jsc_class_add_constructor = c_jsc_class_add_constructor;

/** */
alias jsc_class_add_constructor_variadic = c_jsc_class_add_constructor_variadic;

/** */
alias jsc_class_add_constructorv = c_jsc_class_add_constructorv;

/** */
alias jsc_class_add_method = c_jsc_class_add_method;

/** */
alias jsc_class_add_method_variadic = c_jsc_class_add_method_variadic;

/** */
alias jsc_class_add_methodv = c_jsc_class_add_methodv;

/** */
alias jsc_class_add_property = c_jsc_class_add_property;

/** */
alias jsc_class_get_name = c_jsc_class_get_name;

/** */
alias jsc_class_get_parent = c_jsc_class_get_parent;

// Context

/** */
alias jsc_context_get_type = c_jsc_context_get_type;

/** */
alias jsc_context_new = c_jsc_context_new;

/** */
alias jsc_context_new_with_virtual_machine = c_jsc_context_new_with_virtual_machine;

/** */
alias jsc_context_get_current = c_jsc_context_get_current;

/** */
alias jsc_context_check_syntax = c_jsc_context_check_syntax;

/** */
alias jsc_context_clear_exception = c_jsc_context_clear_exception;

/** */
alias jsc_context_evaluate = c_jsc_context_evaluate;

/** */
alias jsc_context_evaluate_in_object = c_jsc_context_evaluate_in_object;

/** */
alias jsc_context_evaluate_with_source_uri = c_jsc_context_evaluate_with_source_uri;

/** */
alias jsc_context_get_exception = c_jsc_context_get_exception;

/** */
alias jsc_context_get_global_object = c_jsc_context_get_global_object;

/** */
alias jsc_context_get_value = c_jsc_context_get_value;

/** */
alias jsc_context_get_virtual_machine = c_jsc_context_get_virtual_machine;

/** */
alias jsc_context_pop_exception_handler = c_jsc_context_pop_exception_handler;

/** */
alias jsc_context_push_exception_handler = c_jsc_context_push_exception_handler;

/** */
alias jsc_context_register_class = c_jsc_context_register_class;

/** */
alias jsc_context_set_value = c_jsc_context_set_value;

/** */
alias jsc_context_throw = c_jsc_context_throw;

/** */
alias jsc_context_throw_exception = c_jsc_context_throw_exception;

/** */
alias jsc_context_throw_printf = c_jsc_context_throw_printf;

/** */
alias jsc_context_throw_with_name = c_jsc_context_throw_with_name;

/** */
alias jsc_context_throw_with_name_printf = c_jsc_context_throw_with_name_printf;

// ExceptionWrap

/** */
alias jsc_exception_get_type = c_jsc_exception_get_type;

/** */
alias jsc_exception_new = c_jsc_exception_new;

/** */
alias jsc_exception_new_printf = c_jsc_exception_new_printf;

/** */
alias jsc_exception_new_vprintf = c_jsc_exception_new_vprintf;

/** */
alias jsc_exception_new_with_name = c_jsc_exception_new_with_name;

/** */
alias jsc_exception_new_with_name_printf = c_jsc_exception_new_with_name_printf;

/** */
alias jsc_exception_new_with_name_vprintf = c_jsc_exception_new_with_name_vprintf;

/** */
alias jsc_exception_get_backtrace_string = c_jsc_exception_get_backtrace_string;

/** */
alias jsc_exception_get_column_number = c_jsc_exception_get_column_number;

/** */
alias jsc_exception_get_line_number = c_jsc_exception_get_line_number;

/** */
alias jsc_exception_get_message = c_jsc_exception_get_message;

/** */
alias jsc_exception_get_name = c_jsc_exception_get_name;

/** */
alias jsc_exception_get_source_uri = c_jsc_exception_get_source_uri;

/** */
alias jsc_exception_report = c_jsc_exception_report;

/** */
alias jsc_exception_to_string = c_jsc_exception_to_string;

// Value

/** */
alias jsc_value_get_type = c_jsc_value_get_type;

/** */
alias jsc_value_new_array = c_jsc_value_new_array;

/** */
alias jsc_value_new_array_buffer = c_jsc_value_new_array_buffer;

/** */
alias jsc_value_new_array_from_garray = c_jsc_value_new_array_from_garray;

/** */
alias jsc_value_new_array_from_strv = c_jsc_value_new_array_from_strv;

/** */
alias jsc_value_new_boolean = c_jsc_value_new_boolean;

/** */
alias jsc_value_new_from_json = c_jsc_value_new_from_json;

/** */
alias jsc_value_new_function = c_jsc_value_new_function;

/** */
alias jsc_value_new_function_variadic = c_jsc_value_new_function_variadic;

/** */
alias jsc_value_new_functionv = c_jsc_value_new_functionv;

/** */
alias jsc_value_new_null = c_jsc_value_new_null;

/** */
alias jsc_value_new_number = c_jsc_value_new_number;

/** */
alias jsc_value_new_object = c_jsc_value_new_object;

/** */
alias jsc_value_new_promise = c_jsc_value_new_promise;

/** */
alias jsc_value_new_string = c_jsc_value_new_string;

/** */
alias jsc_value_new_string_from_bytes = c_jsc_value_new_string_from_bytes;

/** */
alias jsc_value_new_typed_array = c_jsc_value_new_typed_array;

/** */
alias jsc_value_new_undefined = c_jsc_value_new_undefined;

/** */
alias jsc_value_array_buffer_get_data = c_jsc_value_array_buffer_get_data;

/** */
alias jsc_value_array_buffer_get_size = c_jsc_value_array_buffer_get_size;

/** */
alias jsc_value_constructor_call = c_jsc_value_constructor_call;

/** */
alias jsc_value_constructor_callv = c_jsc_value_constructor_callv;

/** */
alias jsc_value_function_call = c_jsc_value_function_call;

/** */
alias jsc_value_function_callv = c_jsc_value_function_callv;

/** */
alias jsc_value_get_context = c_jsc_value_get_context;

/** */
alias jsc_value_is_array = c_jsc_value_is_array;

/** */
alias jsc_value_is_array_buffer = c_jsc_value_is_array_buffer;

/** */
alias jsc_value_is_boolean = c_jsc_value_is_boolean;

/** */
alias jsc_value_is_constructor = c_jsc_value_is_constructor;

/** */
alias jsc_value_is_function = c_jsc_value_is_function;

/** */
alias jsc_value_is_null = c_jsc_value_is_null;

/** */
alias jsc_value_is_number = c_jsc_value_is_number;

/** */
alias jsc_value_is_object = c_jsc_value_is_object;

/** */
alias jsc_value_is_string = c_jsc_value_is_string;

/** */
alias jsc_value_is_typed_array = c_jsc_value_is_typed_array;

/** */
alias jsc_value_is_undefined = c_jsc_value_is_undefined;

/** */
alias jsc_value_new_typed_array_with_buffer = c_jsc_value_new_typed_array_with_buffer;

/** */
alias jsc_value_object_define_property_accessor = c_jsc_value_object_define_property_accessor;

/** */
alias jsc_value_object_define_property_data = c_jsc_value_object_define_property_data;

/** */
alias jsc_value_object_delete_property = c_jsc_value_object_delete_property;

/** */
alias jsc_value_object_enumerate_properties = c_jsc_value_object_enumerate_properties;

/** */
alias jsc_value_object_get_property = c_jsc_value_object_get_property;

/** */
alias jsc_value_object_get_property_at_index = c_jsc_value_object_get_property_at_index;

/** */
alias jsc_value_object_has_property = c_jsc_value_object_has_property;

/** */
alias jsc_value_object_invoke_method = c_jsc_value_object_invoke_method;

/** */
alias jsc_value_object_invoke_methodv = c_jsc_value_object_invoke_methodv;

/** */
alias jsc_value_object_is_instance_of = c_jsc_value_object_is_instance_of;

/** */
alias jsc_value_object_set_property = c_jsc_value_object_set_property;

/** */
alias jsc_value_object_set_property_at_index = c_jsc_value_object_set_property_at_index;

/** */
alias jsc_value_to_boolean = c_jsc_value_to_boolean;

/** */
alias jsc_value_to_double = c_jsc_value_to_double;

/** */
alias jsc_value_to_int32 = c_jsc_value_to_int32;

/** */
alias jsc_value_to_json = c_jsc_value_to_json;

/** */
alias jsc_value_to_string = c_jsc_value_to_string;

/** */
alias jsc_value_to_string_as_bytes = c_jsc_value_to_string_as_bytes;

/** */
alias jsc_value_typed_array_get_buffer = c_jsc_value_typed_array_get_buffer;

/** */
alias jsc_value_typed_array_get_data = c_jsc_value_typed_array_get_data;

/** */
alias jsc_value_typed_array_get_length = c_jsc_value_typed_array_get_length;

/** */
alias jsc_value_typed_array_get_offset = c_jsc_value_typed_array_get_offset;

/** */
alias jsc_value_typed_array_get_size = c_jsc_value_typed_array_get_size;

/** */
alias jsc_value_typed_array_get_type = c_jsc_value_typed_array_get_type;

// VirtualMachine

/** */
alias jsc_virtual_machine_get_type = c_jsc_virtual_machine_get_type;

/** */
alias jsc_virtual_machine_new = c_jsc_virtual_machine_new;

// WeakValue

/** */
alias jsc_weak_value_get_type = c_jsc_weak_value_get_type;

/** */
alias jsc_weak_value_new = c_jsc_weak_value_new;

/** */
alias jsc_weak_value_get_value = c_jsc_weak_value_get_value;

// global

/** */
alias jsc_get_major_version = c_jsc_get_major_version;

/** */
alias jsc_get_micro_version = c_jsc_get_micro_version;

/** */
alias jsc_get_minor_version = c_jsc_get_minor_version;

/** */
alias jsc_options_foreach = c_jsc_options_foreach;

/** */
alias jsc_options_get_boolean = c_jsc_options_get_boolean;

/** */
alias jsc_options_get_double = c_jsc_options_get_double;

/** */
alias jsc_options_get_int = c_jsc_options_get_int;

/** */
alias jsc_options_get_option_group = c_jsc_options_get_option_group;

/** */
alias jsc_options_get_range_string = c_jsc_options_get_range_string;

/** */
alias jsc_options_get_size = c_jsc_options_get_size;

/** */
alias jsc_options_get_string = c_jsc_options_get_string;

/** */
alias jsc_options_get_uint = c_jsc_options_get_uint;

/** */
alias jsc_options_set_boolean = c_jsc_options_set_boolean;

/** */
alias jsc_options_set_double = c_jsc_options_set_double;

/** */
alias jsc_options_set_int = c_jsc_options_set_int;

/** */
alias jsc_options_set_range_string = c_jsc_options_set_range_string;

/** */
alias jsc_options_set_size = c_jsc_options_set_size;

/** */
alias jsc_options_set_string = c_jsc_options_set_string;

/** */
alias jsc_options_set_uint = c_jsc_options_set_uint;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Class
  gidLink(cast(void**)&jsc_class_get_type, "jsc_class_get_type", libs);
  gidLink(cast(void**)&jsc_class_add_constructor, "jsc_class_add_constructor", libs);
  gidLink(cast(void**)&jsc_class_add_constructor_variadic, "jsc_class_add_constructor_variadic", libs);
  gidLink(cast(void**)&jsc_class_add_constructorv, "jsc_class_add_constructorv", libs);
  gidLink(cast(void**)&jsc_class_add_method, "jsc_class_add_method", libs);
  gidLink(cast(void**)&jsc_class_add_method_variadic, "jsc_class_add_method_variadic", libs);
  gidLink(cast(void**)&jsc_class_add_methodv, "jsc_class_add_methodv", libs);
  gidLink(cast(void**)&jsc_class_add_property, "jsc_class_add_property", libs);
  gidLink(cast(void**)&jsc_class_get_name, "jsc_class_get_name", libs);
  gidLink(cast(void**)&jsc_class_get_parent, "jsc_class_get_parent", libs);

  // Context
  gidLink(cast(void**)&jsc_context_get_type, "jsc_context_get_type", libs);
  gidLink(cast(void**)&jsc_context_new, "jsc_context_new", libs);
  gidLink(cast(void**)&jsc_context_new_with_virtual_machine, "jsc_context_new_with_virtual_machine", libs);
  gidLink(cast(void**)&jsc_context_get_current, "jsc_context_get_current", libs);
  gidLink(cast(void**)&jsc_context_check_syntax, "jsc_context_check_syntax", libs);
  gidLink(cast(void**)&jsc_context_clear_exception, "jsc_context_clear_exception", libs);
  gidLink(cast(void**)&jsc_context_evaluate, "jsc_context_evaluate", libs);
  gidLink(cast(void**)&jsc_context_evaluate_in_object, "jsc_context_evaluate_in_object", libs);
  gidLink(cast(void**)&jsc_context_evaluate_with_source_uri, "jsc_context_evaluate_with_source_uri", libs);
  gidLink(cast(void**)&jsc_context_get_exception, "jsc_context_get_exception", libs);
  gidLink(cast(void**)&jsc_context_get_global_object, "jsc_context_get_global_object", libs);
  gidLink(cast(void**)&jsc_context_get_value, "jsc_context_get_value", libs);
  gidLink(cast(void**)&jsc_context_get_virtual_machine, "jsc_context_get_virtual_machine", libs);
  gidLink(cast(void**)&jsc_context_pop_exception_handler, "jsc_context_pop_exception_handler", libs);
  gidLink(cast(void**)&jsc_context_push_exception_handler, "jsc_context_push_exception_handler", libs);
  gidLink(cast(void**)&jsc_context_register_class, "jsc_context_register_class", libs);
  gidLink(cast(void**)&jsc_context_set_value, "jsc_context_set_value", libs);
  gidLink(cast(void**)&jsc_context_throw, "jsc_context_throw", libs);
  gidLink(cast(void**)&jsc_context_throw_exception, "jsc_context_throw_exception", libs);
  gidLink(cast(void**)&jsc_context_throw_printf, "jsc_context_throw_printf", libs);
  gidLink(cast(void**)&jsc_context_throw_with_name, "jsc_context_throw_with_name", libs);
  gidLink(cast(void**)&jsc_context_throw_with_name_printf, "jsc_context_throw_with_name_printf", libs);

  // ExceptionWrap
  gidLink(cast(void**)&jsc_exception_get_type, "jsc_exception_get_type", libs);
  gidLink(cast(void**)&jsc_exception_new, "jsc_exception_new", libs);
  gidLink(cast(void**)&jsc_exception_new_printf, "jsc_exception_new_printf", libs);
  gidLink(cast(void**)&jsc_exception_new_vprintf, "jsc_exception_new_vprintf", libs);
  gidLink(cast(void**)&jsc_exception_new_with_name, "jsc_exception_new_with_name", libs);
  gidLink(cast(void**)&jsc_exception_new_with_name_printf, "jsc_exception_new_with_name_printf", libs);
  gidLink(cast(void**)&jsc_exception_new_with_name_vprintf, "jsc_exception_new_with_name_vprintf", libs);
  gidLink(cast(void**)&jsc_exception_get_backtrace_string, "jsc_exception_get_backtrace_string", libs);
  gidLink(cast(void**)&jsc_exception_get_column_number, "jsc_exception_get_column_number", libs);
  gidLink(cast(void**)&jsc_exception_get_line_number, "jsc_exception_get_line_number", libs);
  gidLink(cast(void**)&jsc_exception_get_message, "jsc_exception_get_message", libs);
  gidLink(cast(void**)&jsc_exception_get_name, "jsc_exception_get_name", libs);
  gidLink(cast(void**)&jsc_exception_get_source_uri, "jsc_exception_get_source_uri", libs);
  gidLink(cast(void**)&jsc_exception_report, "jsc_exception_report", libs);
  gidLink(cast(void**)&jsc_exception_to_string, "jsc_exception_to_string", libs);

  // Value
  gidLink(cast(void**)&jsc_value_get_type, "jsc_value_get_type", libs);
  gidLink(cast(void**)&jsc_value_new_array, "jsc_value_new_array", libs);
  gidLink(cast(void**)&jsc_value_new_array_buffer, "jsc_value_new_array_buffer", libs);
  gidLink(cast(void**)&jsc_value_new_array_from_garray, "jsc_value_new_array_from_garray", libs);
  gidLink(cast(void**)&jsc_value_new_array_from_strv, "jsc_value_new_array_from_strv", libs);
  gidLink(cast(void**)&jsc_value_new_boolean, "jsc_value_new_boolean", libs);
  gidLink(cast(void**)&jsc_value_new_from_json, "jsc_value_new_from_json", libs);
  gidLink(cast(void**)&jsc_value_new_function, "jsc_value_new_function", libs);
  gidLink(cast(void**)&jsc_value_new_function_variadic, "jsc_value_new_function_variadic", libs);
  gidLink(cast(void**)&jsc_value_new_functionv, "jsc_value_new_functionv", libs);
  gidLink(cast(void**)&jsc_value_new_null, "jsc_value_new_null", libs);
  gidLink(cast(void**)&jsc_value_new_number, "jsc_value_new_number", libs);
  gidLink(cast(void**)&jsc_value_new_object, "jsc_value_new_object", libs);
  gidLink(cast(void**)&jsc_value_new_promise, "jsc_value_new_promise", libs);
  gidLink(cast(void**)&jsc_value_new_string, "jsc_value_new_string", libs);
  gidLink(cast(void**)&jsc_value_new_string_from_bytes, "jsc_value_new_string_from_bytes", libs);
  gidLink(cast(void**)&jsc_value_new_typed_array, "jsc_value_new_typed_array", libs);
  gidLink(cast(void**)&jsc_value_new_undefined, "jsc_value_new_undefined", libs);
  gidLink(cast(void**)&jsc_value_array_buffer_get_data, "jsc_value_array_buffer_get_data", libs);
  gidLink(cast(void**)&jsc_value_array_buffer_get_size, "jsc_value_array_buffer_get_size", libs);
  gidLink(cast(void**)&jsc_value_constructor_call, "jsc_value_constructor_call", libs);
  gidLink(cast(void**)&jsc_value_constructor_callv, "jsc_value_constructor_callv", libs);
  gidLink(cast(void**)&jsc_value_function_call, "jsc_value_function_call", libs);
  gidLink(cast(void**)&jsc_value_function_callv, "jsc_value_function_callv", libs);
  gidLink(cast(void**)&jsc_value_get_context, "jsc_value_get_context", libs);
  gidLink(cast(void**)&jsc_value_is_array, "jsc_value_is_array", libs);
  gidLink(cast(void**)&jsc_value_is_array_buffer, "jsc_value_is_array_buffer", libs);
  gidLink(cast(void**)&jsc_value_is_boolean, "jsc_value_is_boolean", libs);
  gidLink(cast(void**)&jsc_value_is_constructor, "jsc_value_is_constructor", libs);
  gidLink(cast(void**)&jsc_value_is_function, "jsc_value_is_function", libs);
  gidLink(cast(void**)&jsc_value_is_null, "jsc_value_is_null", libs);
  gidLink(cast(void**)&jsc_value_is_number, "jsc_value_is_number", libs);
  gidLink(cast(void**)&jsc_value_is_object, "jsc_value_is_object", libs);
  gidLink(cast(void**)&jsc_value_is_string, "jsc_value_is_string", libs);
  gidLink(cast(void**)&jsc_value_is_typed_array, "jsc_value_is_typed_array", libs);
  gidLink(cast(void**)&jsc_value_is_undefined, "jsc_value_is_undefined", libs);
  gidLink(cast(void**)&jsc_value_new_typed_array_with_buffer, "jsc_value_new_typed_array_with_buffer", libs);
  gidLink(cast(void**)&jsc_value_object_define_property_accessor, "jsc_value_object_define_property_accessor", libs);
  gidLink(cast(void**)&jsc_value_object_define_property_data, "jsc_value_object_define_property_data", libs);
  gidLink(cast(void**)&jsc_value_object_delete_property, "jsc_value_object_delete_property", libs);
  gidLink(cast(void**)&jsc_value_object_enumerate_properties, "jsc_value_object_enumerate_properties", libs);
  gidLink(cast(void**)&jsc_value_object_get_property, "jsc_value_object_get_property", libs);
  gidLink(cast(void**)&jsc_value_object_get_property_at_index, "jsc_value_object_get_property_at_index", libs);
  gidLink(cast(void**)&jsc_value_object_has_property, "jsc_value_object_has_property", libs);
  gidLink(cast(void**)&jsc_value_object_invoke_method, "jsc_value_object_invoke_method", libs);
  gidLink(cast(void**)&jsc_value_object_invoke_methodv, "jsc_value_object_invoke_methodv", libs);
  gidLink(cast(void**)&jsc_value_object_is_instance_of, "jsc_value_object_is_instance_of", libs);
  gidLink(cast(void**)&jsc_value_object_set_property, "jsc_value_object_set_property", libs);
  gidLink(cast(void**)&jsc_value_object_set_property_at_index, "jsc_value_object_set_property_at_index", libs);
  gidLink(cast(void**)&jsc_value_to_boolean, "jsc_value_to_boolean", libs);
  gidLink(cast(void**)&jsc_value_to_double, "jsc_value_to_double", libs);
  gidLink(cast(void**)&jsc_value_to_int32, "jsc_value_to_int32", libs);
  gidLink(cast(void**)&jsc_value_to_json, "jsc_value_to_json", libs);
  gidLink(cast(void**)&jsc_value_to_string, "jsc_value_to_string", libs);
  gidLink(cast(void**)&jsc_value_to_string_as_bytes, "jsc_value_to_string_as_bytes", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_buffer, "jsc_value_typed_array_get_buffer", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_data, "jsc_value_typed_array_get_data", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_length, "jsc_value_typed_array_get_length", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_offset, "jsc_value_typed_array_get_offset", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_size, "jsc_value_typed_array_get_size", libs);
  gidLink(cast(void**)&jsc_value_typed_array_get_type, "jsc_value_typed_array_get_type", libs);

  // VirtualMachine
  gidLink(cast(void**)&jsc_virtual_machine_get_type, "jsc_virtual_machine_get_type", libs);
  gidLink(cast(void**)&jsc_virtual_machine_new, "jsc_virtual_machine_new", libs);

  // WeakValue
  gidLink(cast(void**)&jsc_weak_value_get_type, "jsc_weak_value_get_type", libs);
  gidLink(cast(void**)&jsc_weak_value_new, "jsc_weak_value_new", libs);
  gidLink(cast(void**)&jsc_weak_value_get_value, "jsc_weak_value_get_value", libs);

  // global
  gidLink(cast(void**)&jsc_get_major_version, "jsc_get_major_version", libs);
  gidLink(cast(void**)&jsc_get_micro_version, "jsc_get_micro_version", libs);
  gidLink(cast(void**)&jsc_get_minor_version, "jsc_get_minor_version", libs);
  gidLink(cast(void**)&jsc_options_foreach, "jsc_options_foreach", libs);
  gidLink(cast(void**)&jsc_options_get_boolean, "jsc_options_get_boolean", libs);
  gidLink(cast(void**)&jsc_options_get_double, "jsc_options_get_double", libs);
  gidLink(cast(void**)&jsc_options_get_int, "jsc_options_get_int", libs);
  gidLink(cast(void**)&jsc_options_get_option_group, "jsc_options_get_option_group", libs);
  gidLink(cast(void**)&jsc_options_get_range_string, "jsc_options_get_range_string", libs);
  gidLink(cast(void**)&jsc_options_get_size, "jsc_options_get_size", libs);
  gidLink(cast(void**)&jsc_options_get_string, "jsc_options_get_string", libs);
  gidLink(cast(void**)&jsc_options_get_uint, "jsc_options_get_uint", libs);
  gidLink(cast(void**)&jsc_options_set_boolean, "jsc_options_set_boolean", libs);
  gidLink(cast(void**)&jsc_options_set_double, "jsc_options_set_double", libs);
  gidLink(cast(void**)&jsc_options_set_int, "jsc_options_set_int", libs);
  gidLink(cast(void**)&jsc_options_set_range_string, "jsc_options_set_range_string", libs);
  gidLink(cast(void**)&jsc_options_set_size, "jsc_options_set_size", libs);
  gidLink(cast(void**)&jsc_options_set_string, "jsc_options_set_string", libs);
  gidLink(cast(void**)&jsc_options_set_uint, "jsc_options_set_uint", libs);
}
