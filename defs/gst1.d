//!gir Gst-1.0
//!info description "D binding for the Gst library - Core library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gst.html
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

//# Ignore methods which take a parent refcount, used for code implementing parent objects
//!set record[CapsFeatures].method[set_parent_refcount][ignore] 0
//!set record[Structure].method[set_parent_refcount][ignore] 0

//# Set arrays to be zero-terminated=1
//!set function[formats_contains].parameters.parameter[formats].array[][zero-terminated] 1

//# Set basic parameters to out
//!set callback[ControlSourceGetValue].parameters.parameter[value][direction] out
//!set callback[MemoryIsSpanFunction].parameters.parameter[offset][direction] out

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

//!set function[init][ignore] 1
//!set function[init_check][ignore] 1
//!class global pre

/**
 * Initializes the GStreamer library, setting up internal path lists,
 * registering built-in elements, and loading standard plugins.
 *
 * Unless the plugin registry is disabled at compile time, the registry will be
 * loaded. By default this will also check if the registry cache needs to be
 * updated and rescan all plugins if needed. See gst_update_registry() for
 * details and section
 * &lt;link linkend="gst-running"&gt;Running GStreamer Applications&lt;/link&gt;
 * for how to disable automatic registry updates.
 *
 * WARNING: This function will terminate your program if it was unable to
 * initialize GStreamer for some reason. If you want your program to fall back,
 * use gst_init_check() instead.
 *
 * Params:
 *   argv = Array of program arguments or null to not process them.
 */
void init_(ref string[] argv)
{
  int _argc = cast(int)argv.length;
  char** _argv = cast(char**)gMalloc(_argc * (char*).sizeof);
  scope(exit) gFree(_argv);

  foreach (i, a; argv)
    _argv[i] = toCString(a, No.Alloc);

  gst_init(&_argc, &_argv);

  argv.length = _argc;
  foreach (i; 0 .. _argc)
    argv[i] = fromCString(_argv[i], No.Free);
}

/**
 * Initializes the GStreamer library, setting up internal path lists,
 * registering built-in elements, and loading standard plugins.
 *
 * This function will return %FALSE if GStreamer could not be initialized
 * for some reason.  If you want your program to fail fatally,
 * use gst_init() instead.
 *
 * Params:
 *   argv = Array of program arguments or null to not process them.
 * Returns: true if GStreamer could be initialized.
 * Throws: [ErrorWrap]
 */
bool initCheck(ref string[] argv)
{
  int _argc = cast(int)argv.length;
  char** _argv = cast(char**)gMalloc(_argc * (char*).sizeof);
  scope(exit) gFree(_argv);

  foreach (i, a; argv)
    _argv[i] = toCString(a, No.Alloc);

  GError *_err;
  gboolean _retval = gst_init_check(&_argc, &_argv, &_err);

  if (_err)
    throw new ErrorWrap(_err);

  argv.length = _argc;
  foreach (i; 0 .. _argc)
    argv[i] = fromCString(_argv[i], No.Free);

  return cast(bool)_retval;
}

