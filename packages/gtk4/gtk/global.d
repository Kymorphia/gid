/// Global functions for gtk4 library
module gtk.global;

import cairo.context;
import gdk.content_provider;
import gdk.display;
import gdk.texture;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import glib.types;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.page_setup;
import gtk.print_settings;
import gtk.printer;
import gtk.style_context;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;
import gtk.widget;
import gtk.window;
import pango.language;
import pango.layout;


/**
    Gets the modifier mask.
    
    The modifier mask determines which modifiers are considered significant
    for keyboard accelerators. This includes all keyboard modifiers except
    for [gdk.types.ModifierType.LockMask].
    Returns: the modifier mask for accelerators
*/
gdk.types.ModifierType acceleratorGetDefaultModMask()
{
  GdkModifierType _cretval;
  _cretval = gtk_accelerator_get_default_mod_mask();
  gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask into a string
    which can be used to represent the accelerator to the user.

    Params:
      acceleratorKey = accelerator keyval
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated string representing the accelerator
*/
string acceleratorGetLabel(uint acceleratorKey, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_get_label(acceleratorKey, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask
    into a string that can be displayed to the user.
    
    The string may be translated.
    
    This function is similar to `funcGtk.accelerator_get_label`,
    but handling keycodes. This is only useful for system-level
    components, applications should use `funcGtk.accelerator_get_label`
    instead.

    Params:
      display = a [gdk.display.Display] or null to use the default display
      acceleratorKey = accelerator keyval
      keycode = accelerator keycode
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated string representing the accelerator
*/
string acceleratorGetLabelWithKeycode(gdk.display.Display display, uint acceleratorKey, uint keycode, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_get_label_with_keycode(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, acceleratorKey, keycode, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask into a string
    parseable by [gtk.global.acceleratorParse].
    
    For example, if you pass in `GDK_KEY_q` and [gdk.types.ModifierType.ControlMask],
    this function returns `<Control>q`.
    
    If you need to display accelerators in the user interface,
    see `funcGtk.accelerator_get_label`.

    Params:
      acceleratorKey = accelerator keyval
      acceleratorMods = accelerator modifier mask
    Returns: a newly-allocated accelerator name
*/
string acceleratorName(uint acceleratorKey, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_name(acceleratorKey, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an accelerator keyval and modifier mask
    into a string parseable by [gtk.global.acceleratorParseWithKeycode].
    
    This is similar to `funcGtk.accelerator_name` but handling keycodes.
    This is only useful for system-level components, applications
    should use `funcGtk.accelerator_name` instead.

    Params:
      display = a [gdk.display.Display] or null to use the default display
      acceleratorKey = accelerator keyval
      keycode = accelerator keycode
      acceleratorMods = accelerator modifier mask
    Returns: a newly allocated accelerator name.
*/
string acceleratorNameWithKeycode(gdk.display.Display display, uint acceleratorKey, uint keycode, gdk.types.ModifierType acceleratorMods)
{
  char* _cretval;
  _cretval = gtk_accelerator_name_with_keycode(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, acceleratorKey, keycode, acceleratorMods);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Parses a string representing an accelerator.
    
    The format looks like “`<Control>a`” or “`<Shift><Alt>F1`”.
    
    The parser is fairly liberal and allows lower or upper case, and also
    abbreviations such as “`<Ctl>`” and “`<Ctrl>`”.
    
    Key names are parsed using `funcGdk.keyval_from_name`. For character keys
    the name is not the symbol, but the lowercase name, e.g. one would use
    “`<Ctrl>minus`” instead of “`<Ctrl>-`”.
    
    Modifiers are enclosed in angular brackets `<>`, and match the
    [gdk.types.ModifierType] mask:
    
    $(LIST
      * `<Shift>` for [gdk.types.ModifierType.ShiftMask]
      * `<Ctrl>` for [gdk.types.ModifierType.ControlMask]
      * `<Alt>` for [gdk.types.ModifierType.AltMask]
      * `<Meta>` for [gdk.types.ModifierType.MetaMask]
      * `<Super>` for [gdk.types.ModifierType.SuperMask]
      * `<Hyper>` for [gdk.types.ModifierType.HyperMask]
    )
      
    If the parse operation fails, accelerator_key and accelerator_mods will
    be set to 0 (zero).

    Params:
      accelerator = string representing an accelerator
      acceleratorKey = return location for accelerator keyval
      acceleratorMods = return location for accelerator
          modifier mask
    Returns: 
*/
bool acceleratorParse(string accelerator, out uint acceleratorKey, out gdk.types.ModifierType acceleratorMods)
{
  bool _retval;
  const(char)* _accelerator = accelerator.toCString(No.Alloc);
  _retval = cast(bool)gtk_accelerator_parse(_accelerator, cast(uint*)&acceleratorKey, &acceleratorMods);
  return _retval;
}

/**
    Parses a string representing an accelerator.
    
    This is similar to `funcGtk.accelerator_parse` but handles keycodes as
    well. This is only useful for system-level components, applications should
    use `funcGtk.accelerator_parse` instead.
    
    If accelerator_codes is given and the result stored in it is non-null,
    the result must be freed with [glib.global.gfree].
    
    If a keycode is present in the accelerator and no accelerator_codes
    is given, the parse will fail.
    
    If the parse fails, accelerator_key, accelerator_mods and
    accelerator_codes will be set to 0 (zero).

    Params:
      accelerator = string representing an accelerator
      display = the [gdk.display.Display] to look up accelerator_codes in
      acceleratorKey = return location for accelerator keyval
      acceleratorCodes = return location for accelerator keycodes
      acceleratorMods = return location for accelerator
          modifier mask
    Returns: true if parsing succeeded
*/
bool acceleratorParseWithKeycode(string accelerator, gdk.display.Display display, out uint acceleratorKey, out uint[] acceleratorCodes, out gdk.types.ModifierType acceleratorMods)
{
  bool _retval;
  const(char)* _accelerator = accelerator.toCString(No.Alloc);
  uint* _acceleratorCodes;
  _retval = cast(bool)gtk_accelerator_parse_with_keycode(_accelerator, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, cast(uint*)&acceleratorKey, &_acceleratorCodes, &acceleratorMods);
  uint _lenacceleratorCodes;
  if (_acceleratorCodes)
  {
    for (; _acceleratorCodes[_lenacceleratorCodes] != 0; _lenacceleratorCodes++)
    {
    }
  }
  acceleratorCodes.length = _lenacceleratorCodes;
  acceleratorCodes[0 .. $] = (cast(uint*)_acceleratorCodes)[0 .. _lenacceleratorCodes];
  gFree(cast(void*)_acceleratorCodes);
  return _retval;
}

/**
    Determines whether a given keyval and modifier mask constitute
    a valid keyboard accelerator.
    
    For example, the `GDK_KEY_a` keyval plus [gdk.types.ModifierType.ControlMask] mark is valid,
    and matches the “Ctrl+a” accelerator. But, you can't, for instance, use
    the `GDK_KEY_Control_L` keyval as an accelerator.

    Params:
      keyval = a GDK keyval
      modifiers = modifier mask
    Returns: true if the accelerator is valid
*/
bool acceleratorValid(uint keyval, gdk.types.ModifierType modifiers)
{
  bool _retval;
  _retval = cast(bool)gtk_accelerator_valid(keyval, modifiers);
  return _retval;
}

/**
    Checks that the GTK library in use is compatible with the
    given version.
    
    Generally you would pass in the constants `GTK_MAJOR_VERSION`,
    `GTK_MINOR_VERSION`, `GTK_MICRO_VERSION` as the three arguments
    to this function; that produces a check that the library in
    use is compatible with the version of GTK the application or
    module was compiled against.
    
    Compatibility is defined by two things: first the version
    of the running library is newer than the version
    required_major.required_minor.required_micro. Second
    the running library must be binary compatible with the
    version required_major.required_minor.required_micro
    (same major version.)
    
    This function is primarily for GTK modules; the module
    can call this function to check that it wasn’t loaded
    into an incompatible version of GTK. However, such a
    check isn’t completely reliable, since the module may be
    linked against an old version of GTK and calling the
    old version of [gtk.global.checkVersion], but still get loaded
    into an application using a newer version of GTK.

    Params:
      requiredMajor = the required major version
      requiredMinor = the required minor version
      requiredMicro = the required micro version
    Returns: null if the GTK library is compatible with the
        given version, or a string describing the version mismatch.
        The returned string is owned by GTK and should not be modified
        or freed.
*/
string checkVersion(uint requiredMajor, uint requiredMinor, uint requiredMicro)
{
  const(char)* _cretval;
  _cretval = gtk_check_version(requiredMajor, requiredMinor, requiredMicro);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/** */
glib.types.Quark cssParserErrorQuark()
{
  glib.types.Quark _retval;
  _retval = gtk_css_parser_error_quark();
  return _retval;
}

/** */
glib.types.Quark cssParserWarningQuark()
{
  glib.types.Quark _retval;
  _retval = gtk_css_parser_warning_quark();
  return _retval;
}

/**
    Prevents `funcGtk.init` and `funcGtk.init_check` from automatically calling
    `setlocale (LC_ALL, "")`.
    
    You would want to use this function if you wanted to set the locale for
    your program to something other than the user’s locale, or if
    you wanted to set different values for different locale categories.
    
    Most programs should not need to call this function.
*/
void disableSetlocale()
{
  gtk_disable_setlocale();
}

/**
    Distributes extra_space to child sizes by bringing smaller
    children up to natural size first.
    
    The remaining space will be added to the minimum_size member of the
    [gtk.types.RequestedSize] struct. If all sizes reach their natural size then
    the remaining space is returned.

    Params:
      extraSpace = Extra space to redistribute among children after subtracting
          minimum sizes and any child padding from the overall allocation
      sizes = An array of structs with a client pointer and a minimum/natural size
         in the orientation of the allocation.
    Returns: The remainder of extra_space after redistributing space
      to sizes.
*/
int distributeNaturalAllocation(int extraSpace, gtk.types.RequestedSize[] sizes)
{
  int _retval;
  uint _nRequestedSizes;
  if (sizes)
    _nRequestedSizes = cast(uint)sizes.length;

  auto _sizes = cast(GtkRequestedSize*)sizes.ptr;
  _retval = gtk_distribute_natural_allocation(extraSpace, _nRequestedSizes, _sizes);
  return _retval;
}

/**
    Calls a function for all [gtk.printer.Printer]s.
    
    If func returns true, the enumeration is stopped.

    Params:
      func = a function to call for each printer
      wait = if true, wait in a recursive mainloop until
           all printers are enumerated; otherwise return early
*/
void enumeratePrinters(gtk.types.PrinterFunc func, bool wait)
{
  extern(C) gboolean _funcCallback(GtkPrinter* printer, void* data)
  {
    auto _dlg = cast(gtk.types.PrinterFunc*)data;

    gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.printer.Printer)(cast(void*)printer, No.Take));
    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;

  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  gtk_enumerate_printers(_funcCB, _func, _funcDestroyCB, wait);
}

/**
    Returns the binary age as passed to `libtool`.
    
    If `libtool` means nothing to you, don't worry about it.
    Returns: the binary age of the GTK library
*/
uint getBinaryAge()
{
  uint _retval;
  _retval = gtk_get_binary_age();
  return _retval;
}

/**
    Returns the GTK debug flags that are currently active.
    
    This function is intended for GTK modules that want
    to adjust their debug output based on GTK debug flags.
    Returns: the GTK debug flags.
*/
gtk.types.DebugFlags getDebugFlags()
{
  GtkDebugFlags _cretval;
  _cretval = gtk_get_debug_flags();
  gtk.types.DebugFlags _retval = cast(gtk.types.DebugFlags)_cretval;
  return _retval;
}

/**
    Returns the [pango.language.Language] for the default language
    currently in effect.
    
    Note that this can change over the life of an
    application.
    
    The default language is derived from the current
    locale. It determines, for example, whether GTK uses
    the right-to-left or left-to-right text direction.
    
    This function is equivalent to [pango.language.Language.getDefault].
    See that function for details.
    Returns: the default language
*/
pango.language.Language getDefaultLanguage()
{
  PangoLanguage* _cretval;
  _cretval = gtk_get_default_language();
  auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Returns the interface age as passed to `libtool`.
    
    If `libtool` means nothing to you, don't worry about it.
    Returns: the interface age of the GTK library
*/
uint getInterfaceAge()
{
  uint _retval;
  _retval = gtk_get_interface_age();
  return _retval;
}

/**
    Get the direction of the current locale. This is the expected
    reading direction for text and UI.
    
    This function depends on the current locale being set with
    setlocale() and will default to setting the [gtk.types.TextDirection.Ltr]
    direction otherwise. [gtk.types.TextDirection.None] will never be returned.
    
    GTK sets the default text direction according to the locale
    during [gtk.global.init_], and you should normally use
    [gtk.widget.Widget.getDirection] or [gtk.widget.Widget.getDefaultDirection]
    to obtain the current direction.
    
    This function is only needed rare cases when the locale is
    changed after GTK has already been initialized. In this case,
    you can use it to update the default text direction as follows:
    
    ```c
    #include <locale.h>
    
    static void
    update_locale (const char *new_locale)
    {
      setlocale (LC_ALL, new_locale);
      gtk_widget_set_default_direction (gtk_get_locale_direction ());
    }
    ```
    Returns: the direction of the current locale
*/
gtk.types.TextDirection getLocaleDirection()
{
  GtkTextDirection _cretval;
  _cretval = gtk_get_locale_direction();
  gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
  return _retval;
}

/**
    Returns the major version number of the GTK library.
    
    For example, in GTK version 3.1.5 this is 3.
    
    This function is in the library, so it represents the GTK library
    your code is running against. Contrast with the `GTK_MAJOR_VERSION`
    macro, which represents the major version of the GTK headers you
    have included when compiling your code.
    Returns: the major version number of the GTK library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = gtk_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the GTK library.
    
    For example, in GTK version 3.1.5 this is 5.
    
    This function is in the library, so it represents the GTK library
    your code is are running against. Contrast with the
    `GTK_MICRO_VERSION` macro, which represents the micro version of the
    GTK headers you have included when compiling your code.
    Returns: the micro version number of the GTK library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = gtk_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the GTK library.
    
    For example, in GTK version 3.1.5 this is 1.
    
    This function is in the library, so it represents the GTK library
    your code is are running against. Contrast with the
    `GTK_MINOR_VERSION` macro, which represents the minor version of the
    GTK headers you have included when compiling your code.
    Returns: the minor version number of the GTK library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = gtk_get_minor_version();
  return _retval;
}

/**
    Converts a color from HSV space to RGB.
    
    Input values must be in the [0.0, 1.0] range;
    output values will be in the same range.

    Params:
      h = Hue
      s = Saturation
      v = Value
      r = Return value for the red component
      g = Return value for the green component
      b = Return value for the blue component
*/
void hsvToRgb(float h, float s, float v, out float r, out float g, out float b)
{
  gtk_hsv_to_rgb(h, s, v, cast(float*)&r, cast(float*)&g, cast(float*)&b);
}

/**
    Call this function before using any other GTK functions in your GUI
    applications. It will initialize everything needed to operate the
    toolkit.
    
    If you are using [gtk.application.Application], you usually don't have to call this
    function; the `GApplication::startup` handler does it for you. Though,
    if you are using GApplication methods that will be invoked before `startup`,
    such as `local_command_line`, you may need to initialize stuff explicitly.
    
    This function will terminate your program if it was unable to
    initialize the windowing system for some reason. If you want
    your program to fall back to a textual interface, call
    `funcGtk.init_check` instead.
    
    GTK calls `signal (SIGPIPE, SIG_IGN)` during initialization, to ignore
    SIGPIPE signals, since these are almost never wanted in graphical
    applications. If you do need to handle SIGPIPE for some reason, reset
    the handler after [gtk.global.init_], but notice that other libraries (e.g.
    libdbus or gvfs) might do similar things.
*/
void init_()
{
  gtk_init();
}

/**
    This function does the same work as [gtk.global.init_] with only a single
    change: It does not terminate the program if the windowing system
    can’t be initialized. Instead it returns false on failure.
    
    This way the application can fall back to some other means of
    communication with the user - for example a curses or command line
    interface.
    Returns: true if the windowing system has been successfully
        initialized, false otherwise
*/
bool initCheck()
{
  bool _retval;
  _retval = cast(bool)gtk_init_check();
  return _retval;
}

/**
    Use this function to check if GTK has been initialized.
    
    See `funcGtk.init`.
    Returns: the initialization status
*/
bool isInitialized()
{
  bool _retval;
  _retval = cast(bool)gtk_is_initialized();
  return _retval;
}

/**
    Creates a new [gobject.param_spec.ParamSpec] instance for a property holding a [gtk.expression.Expression].
    
    See `[gobject.param_spec.ParamSpec.internal]` for details on the property strings.

    Params:
      name = canonical name of the property
      nick = a user-readable name for the property
      blurb = a user-readable description of the property
      flags = flags for the property
    Returns: a newly created property specification
*/
gobject.param_spec.ParamSpec paramSpecExpression(string name, string nick, string blurb, gobject.types.ParamFlags flags)
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _nick = nick.toCString(No.Alloc);
  const(char)* _blurb = blurb.toCString(No.Alloc);
  _cretval = gtk_param_spec_expression(_name, _nick, _blurb, flags);
  auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Runs a page setup dialog, letting the user modify the values from
    page_setup. If the user cancels the dialog, the returned [gtk.page_setup.PageSetup]
    is identical to the passed in page_setup, otherwise it contains the
    modifications done in the dialog.
    
    Note that this function may use a recursive mainloop to show the page
    setup dialog. See [gtk.global.printRunPageSetupDialogAsync] if this is
    a problem.

    Params:
      parent = transient parent
      pageSetup = an existing [gtk.page_setup.PageSetup]
      settings = a [gtk.print_settings.PrintSettings]
    Returns: a new [gtk.page_setup.PageSetup]
*/
gtk.page_setup.PageSetup printRunPageSetupDialog(gtk.window.Window parent, gtk.page_setup.PageSetup pageSetup, gtk.print_settings.PrintSettings settings)
{
  GtkPageSetup* _cretval;
  _cretval = gtk_print_run_page_setup_dialog(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, Yes.Take);
  return _retval;
}

/**
    Runs a page setup dialog, letting the user modify the values from page_setup.
    
    In contrast to [gtk.global.printRunPageSetupDialog], this function  returns after
    showing the page setup dialog on platforms that support this, and calls done_cb
    from a signal handler for the ::response signal of the dialog.

    Params:
      parent = transient parent
      pageSetup = an existing [gtk.page_setup.PageSetup]
      settings = a [gtk.print_settings.PrintSettings]
      doneCb = a function to call when the user saves
           the modified page setup
*/
void printRunPageSetupDialogAsync(gtk.window.Window parent, gtk.page_setup.PageSetup pageSetup, gtk.print_settings.PrintSettings settings, gtk.types.PageSetupDoneFunc doneCb)
{
  extern(C) void _doneCbCallback(GtkPageSetup* pageSetup, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gtk.types.PageSetupDoneFunc*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(void*)pageSetup, No.Take));
  }
  auto _doneCbCB = doneCb ? &_doneCbCallback : null;

  auto _doneCb = doneCb ? freezeDelegate(cast(void*)&doneCb) : null;
  gtk_print_run_page_setup_dialog_async(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, pageSetup ? cast(GtkPageSetup*)pageSetup._cPtr(No.Dup) : null, settings ? cast(GtkPrintSettings*)settings._cPtr(No.Dup) : null, _doneCbCB, _doneCb);
}

/**
    Renders an activity indicator (such as in [gtk.spinner.Spinner]).
    The state [gtk.types.StateFlags.Checked] determines whether there is
    activity going on.

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderActivity(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_activity(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders an arrow pointing to angle.
    
    Typical arrow rendering at 0, 1⁄2 π;, π; and 3⁄2 π:
    
    ![](arrows.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      angle = arrow angle from 0 to 2 * `G_PI`, being 0 the arrow pointing to the north
      x = X origin of the render area
      y = Y origin of the render area
      size = square side for render area
*/
void renderArrow(gtk.style_context.StyleContext context, cairo.context.Context cr, double angle, double x, double y, double size)
{
  gtk_render_arrow(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, angle, x, y, size);
}

/**
    Renders the background of an element.
    
    Typical background rendering, showing the effect of
    `background-image`, `border-width` and `border-radius`:
    
    ![](background.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderBackground(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_background(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a checkmark (as in a [gtk.check_button.CheckButton]).
    
    The [gtk.types.StateFlags.Checked] state determines whether the check is
    on or off, and [gtk.types.StateFlags.Inconsistent] determines whether it
    should be marked as undefined.
    
    Typical checkmark rendering:
    
    ![](checks.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderCheck(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_check(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders an expander (as used in [gtk.tree_view.TreeView] and [gtk.expander.Expander]) in the area
    defined by `x`, `y`, width, height. The state [gtk.types.StateFlags.Checked]
    determines whether the expander is collapsed or expanded.
    
    Typical expander rendering:
    
    ![](expanders.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderExpander(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_expander(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a focus indicator on the rectangle determined by `x`, `y`, width, height.
    
    Typical focus rendering:
    
    ![](focus.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderFocus(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_focus(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a frame around the rectangle defined by `x`, `y`, width, height.
    
    Examples of frame rendering, showing the effect of `border-image`,
    `border-color`, `border-width`, `border-radius` and junctions:
    
    ![](frames.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderFrame(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_frame(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders a handle (as in [gtk.paned.Paned] and [gtk.window.Window]’s resize grip),
    in the rectangle determined by `x`, `y`, width, height.
    
    Handles rendered for the paned and grip classes:
    
    ![](handles.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderHandle(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_handle(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Renders the icon in texture at the specified `x` and `y` coordinates.
    
    This function will render the icon in texture at exactly its size,
    regardless of scaling factors, which may not be appropriate when
    drawing on displays with high pixel densities.

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      texture = a [gdk.texture.Texture] containing the icon to draw
      x = X position for the texture
      y = Y position for the texture
*/
void renderIcon(gtk.style_context.StyleContext context, cairo.context.Context cr, gdk.texture.Texture texture, double x, double y)
{
  gtk_render_icon(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, x, y);
}

/**
    Renders layout on the coordinates `x`, `y`

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin
      y = Y origin
      layout = the [pango.layout.Layout] to render
*/
void renderLayout(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, pango.layout.Layout layout)
{
  gtk_render_layout(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}

/**
    Renders a line from (x0, y0) to (x1, y1).

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x0 = X coordinate for the origin of the line
      y0 = Y coordinate for the origin of the line
      x1 = X coordinate for the end of the line
      y1 = Y coordinate for the end of the line
*/
void renderLine(gtk.style_context.StyleContext context, cairo.context.Context cr, double x0, double y0, double x1, double y1)
{
  gtk_render_line(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x0, y0, x1, y1);
}

/**
    Renders an option mark (as in a radio button), the [gtk.types.StateFlags.Checked]
    state will determine whether the option is on or off, and
    [gtk.types.StateFlags.Inconsistent] whether it should be marked as undefined.
    
    Typical option mark rendering:
    
    ![](options.png)

    Params:
      context = a [gtk.style_context.StyleContext]
      cr = a [cairo.context.Context]
      x = X origin of the rectangle
      y = Y origin of the rectangle
      width = rectangle width
      height = rectangle height
*/
void renderOption(gtk.style_context.StyleContext context, cairo.context.Context cr, double x, double y, double width, double height)
{
  gtk_render_option(context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Converts a color from RGB space to HSV.
    
    Input values must be in the [0.0, 1.0] range;
    output values will be in the same range.

    Params:
      r = Red
      g = Green
      b = Blue
      h = Return value for the hue component
      s = Return value for the saturation component
      v = Return value for the value component
*/
void rgbToHsv(float r, float g, float b, out float h, out float s, out float v)
{
  gtk_rgb_to_hsv(r, g, b, cast(float*)&h, cast(float*)&s, cast(float*)&v);
}

/**
    Sets the GTK debug flags.

    Params:
      flags = the debug flags to set
*/
void setDebugFlags(gtk.types.DebugFlags flags)
{
  gtk_set_debug_flags(flags);
}

/**
    This function launches the default application for showing
    a given uri, or shows an error dialog if that fails.

    Params:
      parent = parent window
      uri = the uri to show
      timestamp = timestamp from the event that triggered this call, or `GDK_CURRENT_TIME`

    Deprecated: Use [gtk.file_launcher.FileLauncher.launch] or
        [gtk.uri_launcher.UriLauncher.launch] instead
*/
void showUri(gtk.window.Window parent, string uri, uint timestamp)
{
  const(char)* _uri = uri.toCString(No.Alloc);
  gtk_show_uri(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, _uri, timestamp);
}

/**
    This function launches the default application for showing
    a given uri.
    
    The callback will be called when the launch is completed.
    It should call [gtk.global.showUriFullFinish] to obtain the result.
    
    This is the recommended call to be used as it passes information
    necessary for sandbox helpers to parent their dialogs properly.

    Params:
      parent = parent window
      uri = the uri to show
      timestamp = timestamp from the event that triggered this call, or `GDK_CURRENT_TIME`
      cancellable = a [gio.cancellable.Cancellable] to cancel the launch
      callback = a callback to call when the action is complete

    Deprecated: Use [gtk.file_launcher.FileLauncher.launch] or
        [gtk.uri_launcher.UriLauncher.launch] instead
*/
void showUriFull(gtk.window.Window parent, string uri, uint timestamp, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  const(char)* _uri = uri.toCString(No.Alloc);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  gtk_show_uri_full(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, _uri, timestamp, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Finishes the [gtk.global.showUri] call and returns the result
    of the operation.

    Params:
      parent = the [gtk.window.Window] passed to [gtk.global.showUri]
      result = [gio.async_result.AsyncResult] that was passed to callback
    Returns: true if the URI was shown successfully.
        Otherwise, false is returned and error is set
    Throws: [ErrorWrap]

    Deprecated: Use [gtk.file_launcher.FileLauncher.launchFinish] or
        [gtk.uri_launcher.UriLauncher.launchFinish] instead
*/
bool showUriFullFinish(gtk.window.Window parent, gio.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)gtk_show_uri_full_finish(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/** */
void testAccessibleAssertionMessageRole(string domain, string file, int line, string func, string expr, gtk.accessible.Accessible accessible, gtk.types.AccessibleRole expectedRole, gtk.types.AccessibleRole actualRole)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _expr = expr.toCString(No.Alloc);
  gtk_test_accessible_assertion_message_role(_domain, _file, line, _func, _expr, accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, expectedRole, actualRole);
}

/**
    Checks whether the [gtk.accessible.Accessible] has property set.

    Params:
      accessible = a [gtk.accessible.Accessible]
      property = a [gtk.types.AccessibleProperty]
    Returns: true if the property is set in the accessible
*/
bool testAccessibleHasProperty(gtk.accessible.Accessible accessible, gtk.types.AccessibleProperty property)
{
  bool _retval;
  _retval = cast(bool)gtk_test_accessible_has_property(accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, property);
  return _retval;
}

/**
    Checks whether the [gtk.accessible.Accessible] has relation set.

    Params:
      accessible = a [gtk.accessible.Accessible]
      relation = a [gtk.types.AccessibleRelation]
    Returns: true if the relation is set in the accessible
*/
bool testAccessibleHasRelation(gtk.accessible.Accessible accessible, gtk.types.AccessibleRelation relation)
{
  bool _retval;
  _retval = cast(bool)gtk_test_accessible_has_relation(accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, relation);
  return _retval;
}

/**
    Checks whether the `GtkAccessible:accessible-role` of the accessible
    is role.

    Params:
      accessible = a [gtk.accessible.Accessible]
      role = a [gtk.types.AccessibleRole]
    Returns: true if the role matches
*/
bool testAccessibleHasRole(gtk.accessible.Accessible accessible, gtk.types.AccessibleRole role)
{
  bool _retval;
  _retval = cast(bool)gtk_test_accessible_has_role(accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, role);
  return _retval;
}

/**
    Checks whether the [gtk.accessible.Accessible] has state set.

    Params:
      accessible = a [gtk.accessible.Accessible]
      state = a [gtk.types.AccessibleState]
    Returns: true if the state is set in the accessible
*/
bool testAccessibleHasState(gtk.accessible.Accessible accessible, gtk.types.AccessibleState state)
{
  bool _retval;
  _retval = cast(bool)gtk_test_accessible_has_state(accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, state);
  return _retval;
}

/**
    Return the type ids that have been registered after
    calling [gtk.global.testRegisterAllTypes].
    Returns: 0-terminated array of type ids
*/
gobject.types.GType[] testListAllTypes()
{
  const(GType)* _cretval;
  uint _cretlength;
  _cretval = gtk_test_list_all_types(&_cretlength);
  gobject.types.GType[] _retval;

  if (_cretval)
  {
    _retval = cast(gobject.types.GType[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Force registration of all core GTK object types.
    
    This allows to refer to any of those object types via
    [gobject.global.typeFromName] after calling this function.
*/
void testRegisterAllTypes()
{
  gtk_test_register_all_types();
}

/**
    Enters the main loop and waits for widget to be “drawn”.
    
    In this context that means it waits for the frame clock of
    widget to have run a full styling, layout and drawing cycle.
    
    This function is intended to be used for syncing with actions that
    depend on widget relayouting or on interaction with the display
    server.

    Params:
      widget = the widget to wait for
*/
void testWidgetWaitForDraw(gtk.widget.Widget widget)
{
  gtk_test_widget_wait_for_draw(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
}

/**
    Creates a content provider for dragging path from tree_model.

    Params:
      treeModel = a [gtk.tree_model.TreeModel]
      path = a row in tree_model
    Returns: a new [gdk.content_provider.ContentProvider]

    Deprecated: Use list models instead
*/
gdk.content_provider.ContentProvider treeCreateRowDragContent(gtk.tree_model.TreeModel treeModel, gtk.tree_path.TreePath path)
{
  GdkContentProvider* _cretval;
  _cretval = gtk_tree_create_row_drag_content(treeModel ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
  return _retval;
}

/**
    Obtains a tree_model and path from value of target type
    `GTK_TYPE_TREE_ROW_DATA`.
    
    The returned path must be freed with [gtk.tree_path.TreePath.free].

    Params:
      value = a [gobject.value.Value]
      treeModel = a [gtk.tree_model.TreeModel]
      path = row in tree_model
    Returns: true if selection_data had target type `GTK_TYPE_TREE_ROW_DATA`
       is otherwise valid

    Deprecated: Use list models instead
*/
bool treeGetRowDragData(gobject.value.Value value, out gtk.tree_model.TreeModel treeModel, out gtk.tree_path.TreePath path)
{
  bool _retval;
  GtkTreeModel* _treeModel;
  GtkTreePath* _path;
  _retval = cast(bool)gtk_tree_get_row_drag_data(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, &_treeModel, &_path);
  treeModel = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(_treeModel, No.Take);
  path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
  return _retval;
}

/**
    Retrieves the [gtk.expression.Expression] stored inside the given `value`, and acquires
    a reference to it.

    Params:
      value = a [gobject.value.Value] initialized with type `GTK_TYPE_EXPRESSION`
    Returns: a [gtk.expression.Expression]
*/
gtk.expression.Expression valueDupExpression(gobject.value.Value value)
{
  GtkExpression* _cretval;
  _cretval = gtk_value_dup_expression(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Retrieves the [gtk.expression.Expression] stored inside the given `value`.

    Params:
      value = a [gobject.value.Value] initialized with type `GTK_TYPE_EXPRESSION`
    Returns: a [gtk.expression.Expression]
*/
gtk.expression.Expression valueGetExpression(gobject.value.Value value)
{
  GtkExpression* _cretval;
  _cretval = gtk_value_get_expression(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gtk.expression.Expression(cast(GtkExpression*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Stores the given [gtk.expression.Expression] inside `value`.
    
    The [gobject.value.Value] will acquire a reference to the `expression`.

    Params:
      value = a [gobject.value.Value] initialized with type `GTK_TYPE_EXPRESSION`
      expression = a [gtk.expression.Expression]
*/
void valueSetExpression(gobject.value.Value value, gtk.expression.Expression expression)
{
  gtk_value_set_expression(value ? cast(GValue*)value._cPtr(No.Dup) : null, expression ? cast(GtkExpression*)expression._cPtr(No.Dup) : null);
}

/**
    Stores the given [gtk.expression.Expression] inside `value`.
    
    This function transfers the ownership of the `expression` to the [gobject.value.Value].

    Params:
      value = a [gobject.value.Value] initialized with type `GTK_TYPE_EXPRESSION`
      expression = a [gtk.expression.Expression]
*/
void valueTakeExpression(gobject.value.Value value, gtk.expression.Expression expression = null)
{
  gtk_value_take_expression(value ? cast(GValue*)value._cPtr(No.Dup) : null, expression ? cast(GtkExpression*)expression._cPtr(Yes.Dup) : null);
}
