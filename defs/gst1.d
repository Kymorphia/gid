//!gir Gst-1.0
//!info description "D binding for the Gst library - Core library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gst1/
//!info capi https://gstreamer.freedesktop.org/documentation/gstreamer/gi-index.html

//!subdtype Object ObjectWrap

//!kind Structure Boxed

//# These are all fundamental types with no obvious way to wrap them and minimal usage, ignore them
//!set class[Bitmask][ignore] 1
//!set class[DoubleRange][ignore] 1
//!set class[FlagSet][ignore] 1
//!set class[Fraction][ignore] 1
//!set class[FractionRange][ignore] 1
//!set class[Int64Range][ignore] 1
//!set class[IntRange][ignore] 1
//!set class[ValueArray][ignore] 1
//!set class[ValueList][ignore] 1

//# Ignore "protected/private" structure fields
//!set record[Iterator].*field[][ignore] 1

//# Rename callback fields in TypeFind which conflict with method names
//!set record[TypeFind].field[get_length].callback[get_length][name] get_length_func
//!set record[TypeFind].field[get_length][name] get_length_func
//!set record[TypeFind].field[peek].callback[peek][name] peek_func
//!set record[TypeFind].field[peek][name] peek_func
//!set record[TypeFind].field[suggest].callback[suggest][name] suggest_func
//!set record[TypeFind].field[suggest][name] suggest_func

//# Change ChildProxy.getProperty to getChildProxyProperty, conflicts with ObjectWrap.getProperty and could not get it to work with an alias
//!set interface[ChildProxy].method[get_property][name] getChildProxyProperty

//# Ignore list free functions which take ownership of a D array, pointless since D would copy the list just to free it
//!set class[Plugin].function[list_free][ignore] 1
//!set class[PluginFeature].function[list_free][ignore] 1

//# Ignore methods which take a parent refcount, used for code implementing parent objects
//!set record[CapsFeatures].method[set_parent_refcount][ignore] 0
//!set record[Structure].method[set_parent_refcount][ignore] 0

//# Set arrays to be zero-terminated=1
//!set function[formats_contains].parameters.parameter[formats].array[][zero-terminated] 1

//# Set basic parameters to out
//!set callback[ControlSourceGetValue].parameters.parameter[value][direction] out
//!set callback[MemoryIsSpanFunction].parameters.parameter[offset][direction] out

//# Fix arg direction and ownership for some callbacks
//!set callback[BufferListFunc].parameters.parameter[buffer][direction] inout
//!set callback[BufferForeachMetaFunc].parameters.parameter[meta][direction] inout
//!set callback[BufferForeachMetaFunc].parameters.parameter[meta][transfer-ownership] none

//# Set values parameter to be a caller-allocates output array
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][direction] out
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][caller-allocates] 1
//!set callback[ControlSourceGetValueArray].parameters.parameter[values].type '<array length="3" c:type="gdouble *"><type name="double" c:type="gdouble"/></array>'

//# Set MetaDeserializeFunction.data parameter to array with length
//!set callback[MetaDeserializeFunction].parameters.parameter[data].type '<array length="3" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# Set Meta.deserialize.data parameter to array with length
//!set record[Meta].function[deserialize].parameters.parameter[data].type '<array length="2" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# utilSimplifyFraction.direction/denominator are inout params
//!set function[util_simplify_fraction].parameters.parameter[numerator][direction] inout
//!set function[util_simplify_fraction].parameters.parameter[denominator][direction] inout

//# Disable unnecessary ByteArrayInterface functions (can use GArray versions instead)
//!set record[Meta].method[serialize][ignore] 1
//!set callback[MetaSerializeFunction][ignore] 1

//# Disable CustomMeta.structure field writing (struct pointer)
//!set record[CustomMeta].field[structure][writable] 0

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[Message].field[src][owned] 1
