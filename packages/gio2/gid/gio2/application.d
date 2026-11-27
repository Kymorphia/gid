/// Module for [Application] class
module gid.gio2.application;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.application_command_line;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.dbus_connection;
import gid.gio2.file;
import gid.gio2.notification;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.option_group;
import gid.glib2.types;
import gid.glib2.variant;
import gid.glib2.variant_builder;
import gid.glib2.variant_dict;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.application.Application] is the core class for application support.
    
    A [gid.gio2.application.Application] is the foundation of an application. It wraps some
    low-level platform-specific services and is intended to act as the
    foundation for higher-level application classes such as
    [gid.gtk4.application.Application] or `MxApplication`. In general, you should not use
    this class outside of a higher level framework.
    
    [gid.gio2.application.Application] provides convenient life-cycle management by maintaining
    a "use count" for the primary application instance. The use count can
    be changed using [gid.gio2.application.Application.hold] and
    [gid.gio2.application.Application.release]. If it drops to zero, the application
    exits. Higher-level classes such as [gid.gtk4.application.Application] employ the use count
    to ensure that the application stays alive as long as it has any opened
    windows.
    
    Another feature that [gid.gio2.application.Application] (optionally) provides is process
    uniqueness. Applications can make use of this functionality by
    providing a unique application ID. If given, only one application
    with this ID can be running at a time per session. The session
    concept is platform-dependent, but corresponds roughly to a graphical
    desktop login. When your application is launched again, its
    arguments are passed through platform communication to the already
    running program. The already running instance of the program is
    called the "primary instance"; for non-unique applications this is
    always the current instance. On Linux, the D-Bus session bus
    is used for communication.
    
    The use of [gid.gio2.application.Application] differs from some other commonly-used
    uniqueness libraries (such as libunique) in important ways. The
    application is not expected to manually register itself and check
    if it is the primary instance. Instead, the main() function of a
    [gid.gio2.application.Application] should do very little more than instantiating the
    application instance, possibly connecting signal handlers, then
    calling [gid.gio2.application.Application.run]. All checks for uniqueness are done
    internally. If the application is the primary instance then the
    startup signal is emitted and the mainloop runs. If the application
    is not the primary instance then a signal is sent to the primary
    instance and [gid.gio2.application.Application.run] promptly returns. See the code
    examples below.
    
    If used, the expected form of an application identifier is the
    same as that of a
    [D-Bus well-known bus name](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
    Examples include: `com.example.MyApp`, `org.example.internal_apps.Calculator`,
    `org._7_zip.Archiver`.
    For details on valid application identifiers, see [gid.gio2.application.Application.idIsValid].
    
    On Linux, the application identifier is claimed as a well-known bus name
    on the user's session bus. This means that the uniqueness of your
    application is scoped to the current session. It also means that your
    application may provide additional services (through registration of other
    object paths) at that bus name. The registration of these object paths
    should be done with the shared GDBus session bus. Note that due to the
    internal architecture of GDBus, method calls can be dispatched at any time
    (even if a main loop is not running). For this reason, you must ensure that
    any object paths that you wish to register are registered before #GApplication
    attempts to acquire the bus name of your application (which happens in
    [gid.gio2.application.Application.register]). Unfortunately, this means that you cannot
    use [gid.gio2.application.Application.isRemote] to decide if you want to register
    object paths.
    
    [gid.gio2.application.Application] also implements the [gid.gio2.action_group.ActionGroup] and [gid.gio2.action_map.ActionMap]
    interfaces and lets you easily export actions by adding them with
    [gid.gio2.action_map.ActionMap.addAction]. When invoking an action by calling
    [gid.gio2.action_group.ActionGroup.activateAction] on the application, it is always
    invoked in the primary instance. The actions are also exported on
    the session bus, and GIO provides the [gid.gio2.dbus_action_group.DBusActionGroup] wrapper to
    conveniently access them remotely. GIO provides a [gid.gio2.dbus_menu_model.DBusMenuModel] wrapper
    for remote access to exported [gid.gio2.menu_model.MenuModel]s.
    
    Note: Due to the fact that actions are exported on the session bus,
    using `maybe` parameters is not supported, since D-Bus does not support
    `maybe` types.
    
    There is a number of different entry points into a [gid.gio2.application.Application]:
    
    - via 'Activate' (i.e. just starting the application)
    
    - via 'Open' (i.e. opening some files)
    
    - by handling a command-line
    
    - via activating an action
    
    The [gid.gio2.application.Application.startup] signal lets you handle the application
    initialization for all of these in a single place.
    
    Regardless of which of these entry points is used to start the
    application, [gid.gio2.application.Application] passes some ‘platform data’ from the
    launching instance to the primary instance, in the form of a
    [gid.glib2.variant.Variant] dictionary mapping strings to variants. To use platform
    data, override the `vfunc@Gio.Application.before_emit` or
    `vfunc@Gio.Application.after_emit` virtual functions
    in your [gid.gio2.application.Application] subclass. When dealing with
    [gid.gio2.application_command_line.ApplicationCommandLine] objects, the platform data is
    directly available via [gid.gio2.application_command_line.ApplicationCommandLine.getCwd],
    [gid.gio2.application_command_line.ApplicationCommandLine.getEnviron] and
    [gid.gio2.application_command_line.ApplicationCommandLine.getPlatformData].
    
    As the name indicates, the platform data may vary depending on the
    operating system, but it always includes the current directory (key
    `cwd`), and optionally the environment (ie the set of environment
    variables and their values) of the calling process (key `environ`).
    The environment is only added to the platform data if the
    [gid.gio2.types.ApplicationFlags.SendEnvironment] flag is set. [gid.gio2.application.Application] subclasses
    can add their own platform data by overriding the
    `vfunc@Gio.Application.add_platform_data` virtual function. For instance,
    [gid.gtk4.application.Application] adds startup notification data in this way.
    
    To parse commandline arguments you may handle the
    [gid.gio2.application.Application.commandLine] signal or override the
    `vfunc@Gio.Application.local_command_line` virtual function, to parse them in
    either the primary instance or the local instance, respectively.
    
    For an example of opening files with a [gid.gio2.application.Application], see
    [gapplication-example-open.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-open.c).
    
    For an example of using actions with [gid.gio2.application.Application], see
    [gapplication-example-actions.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-actions.c).
    
    For an example of using extra D-Bus hooks with [gid.gio2.application.Application], see
    [gapplication-example-dbushooks.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c).
*/
@gidGir("Application", "ApplicationClass")
class Application : gid.gobject2.object.ObjectWrap, gid.gio2.action_group.ActionGroup, gid.gio2.action_map.ActionMap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_application_get_type != &gidSymbolNotFound ? g_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GApplication";
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /**
      Set `actionGroup` property.
      Params:
        propval = The group of actions that the application exports.
  
      Deprecated: Use the [gid.gio2.action_map.ActionMap] interface instead.
          Never ever mix use of this API with use of [gid.gio2.action_map.ActionMap] on the
          same @application or things will go very badly wrong.
  */
  @property void actionGroup(gid.gio2.action_group.ActionGroup propval) nothrow
  {
    setActionGroup(propval);
  }

  /**
      Get `applicationId` property.
      Returns: The unique identifier for the application.
  */
  @property string applicationId() nothrow
  {
    return getApplicationId();
  }

  /**
      Set `applicationId` property.
      Params:
        propval = The unique identifier for the application.
  */
  @property void applicationId(string propval) nothrow
  {
    setApplicationId(propval);
  }

  /**
      Get `flags` property.
      Returns: Flags specifying the behaviour of the application.
  */
  @property gid.gio2.types.ApplicationFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = Flags specifying the behaviour of the application.
  */
  @property void flags(gid.gio2.types.ApplicationFlags propval) nothrow
  {
    setFlags(propval);
  }

  /**
      Get `inactivityTimeout` property.
      Returns: Time (in milliseconds) to stay alive after becoming idle.
  */
  @property uint inactivityTimeout() nothrow
  {
    return getInactivityTimeout();
  }

  /**
      Set `inactivityTimeout` property.
      Params:
        propval = Time (in milliseconds) to stay alive after becoming idle.
  */
  @property void inactivityTimeout(uint propval) nothrow
  {
    setInactivityTimeout(propval);
  }

  /**
      Get `isBusy` property.
      Returns: Whether the application is currently marked as busy through
        [gid.gio2.application.Application.markBusy] or [gid.gio2.application.Application.bindBusyProperty].
  */
  @property bool isBusy() nothrow
  {
    return getIsBusy();
  }

  /**
      Get `isRegistered` property.
      Returns: Whether [gid.gio2.application.Application.register] has been called.
  */
  @property bool isRegistered() nothrow
  {
    return getIsRegistered();
  }

  /**
      Get `isRemote` property.
      Returns: Whether this application instance is remote.
  */
  @property bool isRemote() nothrow
  {
    return getIsRemote();
  }

  /**
      Get `resourceBasePath` property.
      Returns: The base resource path for the application.
  */
  @property string resourceBasePath() nothrow
  {
    return getResourceBasePath();
  }

  /**
      Set `resourceBasePath` property.
      Params:
        propval = The base resource path for the application.
  */
  @property void resourceBasePath(string propval) nothrow
  {
    setResourceBasePath(propval);
  }

  /**
      Get `version_` property.
      Returns: The human-readable version number of the application.
  */
  @property string version_() nothrow
  {
    return getVersion();
  }

  /**
      Set `version_` property.
      Params:
        propval = The human-readable version number of the application.
  */
  @property void version_(string propval) nothrow
  {
    setVersion(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new #GApplication instance.
      
      If non-null, the application id must be valid.  See
      [gid.gio2.application.Application.idIsValid].
      
      If no application ID is given then some features of #GApplication
      (most notably application uniqueness) will be disabled.
  
      Params:
        applicationId = the application id
        flags = the application flags
      Returns: a new #GApplication instance
  */
  this(string applicationId, gid.gio2.types.ApplicationFlags flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GApplication* _cretval;
      const(char)* _applicationId = applicationId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = g_application_new(_applicationId, flags);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the default #GApplication instance for this process.
      
      Normally there is only one #GApplication per process and it becomes
      the default when it is created.  You can exercise more control over
      this by using [gid.gio2.application.Application.setDefault].
      
      If there is no default application then null is returned.
      Returns: the default application for this process, or null
  */
  static gid.gio2.application.Application getDefault() nothrow
  {
    GApplication* _cretval;
    _cretval = g_application_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.application.Application)(cast(GApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if application_id is a valid application identifier.
      
      A valid ID is required for calls to [gid.gio2.application.Application.new_] and
      [gid.gio2.application.Application.setApplicationId].
      
      Application identifiers follow the same format as
      [D-Bus well-known bus names](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
      For convenience, the restrictions on application identifiers are
      reproduced here:
      
      - Application identifiers are composed of 1 or more elements separated by a
        period (`.`) character. All elements must contain at least one character.
      
      - Each element must only contain the ASCII characters `[A-Z][a-z][0-9]_-`,
        with `-` discouraged in new application identifiers. Each element must not
        begin with a digit.
      
      - Application identifiers must contain at least one `.` (period) character
        (and thus at least two elements).
      
      - Application identifiers must not begin with a `.` (period) character.
      
      - Application identifiers must not exceed 255 characters.
      
      Note that the hyphen (`-`) character is allowed in application identifiers,
      but is problematic or not allowed in various specifications and APIs that
      refer to D-Bus, such as
      [Flatpak application IDs](http://docs.flatpak.org/en/latest/introduction.html#identifiers),
      the
      [`DBusActivatable` interface in the Desktop Entry Specification](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#dbus),
      and the convention that an application's "main" interface and object path
      resemble its application identifier and bus name. To avoid situations that
      require special-case handling, it is recommended that new application
      identifiers consistently replace hyphens with underscores.
      
      Like D-Bus interface names, application identifiers should start with the
      reversed DNS domain name of the author of the interface (in lower-case), and
      it is conventional for the rest of the application identifier to consist of
      words run together, with initial capital letters.
      
      As with D-Bus interface names, if the author's DNS domain name contains
      hyphen/minus characters they should be replaced by underscores, and if it
      contains leading digits they should be escaped by prepending an underscore.
      For example, if the owner of 7-zip.org used an application identifier for an
      archiving application, it might be named `org._7_zip.Archiver`.
  
      Params:
        applicationId = a potential application identifier
      Returns: true if application_id is valid
  */
  static bool idIsValid(string applicationId) nothrow
  {
    bool _retval;
    const(char)* _applicationId = applicationId.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_application_id_is_valid(_applicationId);
    return _retval;
  }

  /**
      Activates the application.
      
      In essence, this results in the #GApplication::activate signal being
      emitted in the primary instance.
      
      The application must be registered before calling this function.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GApplication*)this._cPtr);
  }

  /**
      invoked (locally) to add 'platform data' to be sent to
          the primary instance when activating, opening or invoking actions. Must chain up
  
      Params:
        builder =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAddPlatformData` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAddPlatformData(gid.glib2.variant_builder.VariantBuilder builder)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.addPlatformData)
      return;

    _klass.addPlatformData(cast(GApplication*)this._cPtr, builder ? cast(GVariantBuilder*)builder._cPtr(No.Dup) : null);
  }

  /**
      invoked on the primary instance after 'activate', 'open',
          'command-line' or any action invocation, gets the 'platform data' from
          the calling instance. Must chain up
  
      Params:
        platformData = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAfterEmit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAfterEmit(gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.afterEmit)
      return;

    _klass.afterEmit(cast(GApplication*)this._cPtr, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }

  /**
      invoked on the primary instance before 'activate', 'open',
          'command-line' or any action invocation, gets the 'platform data' from
          the calling instance. Must chain up
  
      Params:
        platformData = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBeforeEmit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncBeforeEmit(gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.beforeEmit)
      return;

    _klass.beforeEmit(cast(GApplication*)this._cPtr, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }

  /**
      invoked on the primary instance when a command-line is
        not handled locally
  
      Params:
        commandLine = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCommandLine` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncCommandLine(gid.gio2.application_command_line.ApplicationCommandLine commandLine)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.commandLine)
      return typeof(return).init;

    int _retval;
    _retval = _klass.commandLine(cast(GApplication*)this._cPtr, commandLine ? cast(GApplicationCommandLine*)commandLine._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      invoked locally during registration, if the application is
          using its D-Bus backend. You can use this to export extra objects on the
          bus, that need to exist before the application tries to own the bus name.
          The function is passed the #GDBusConnection to to session bus, and the
          object path that #GApplication will use to export its D-Bus API.
          If this function returns true, registration will proceed; otherwise
          registration will abort. Since: 2.34
  
      Params:
        connection = 
        objectPath = 
      Returns: 
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDbusRegister` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDbusRegister(gid.gio2.dbus_connection.DBusConnection connection, string objectPath)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.dbusRegister)
      return typeof(return).init;

    bool _retval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.dbusRegister(cast(GApplication*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      invoked locally during unregistration, if the application
          is using its D-Bus backend. Use this to undo anything done by
          the dbus_register vfunc. Since: 2.34
  
      Params:
        connection = 
        objectPath = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDbusUnregister` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDbusUnregister(gid.gio2.dbus_connection.DBusConnection connection, string objectPath)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.dbusUnregister)
      return;

    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _klass.dbusUnregister(cast(GApplication*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath);
  }

  /**
      invoked locally after the parsing of the commandline
       options has occurred. Since: 2.40
  
      Params:
        options =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleLocalOptions` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncHandleLocalOptions(gid.glib2.variant_dict.VariantDict options)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.handleLocalOptions)
      return typeof(return).init;

    int _retval;
    _retval = _klass.handleLocalOptions(cast(GApplication*)this._cPtr, options ? cast(GVariantDict*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This virtual function is always invoked in the local instance. It
      gets passed a pointer to a null-terminated copy of argv and is
      expected to remove arguments that it handled (shifting up remaining
      arguments).
      
      The last argument to local_command_line() is a pointer to the status
      variable which can used to set the exit status that is returned from
      [gid.gio2.application.Application.run].
      
      See [gid.gio2.application.Application.run] for more details on #GApplication startup.
  
      Params:
        arguments = array of command line arguments
        exitStatus = exit status to fill after processing the command line.
      Returns: true if the commandline has been completely handled
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLocalCommandLine` to chain up from an override.
      Overriding it from D is not supported (InOut array parameter 'arguments' in callback with ownership 'Full' is not supported).
  */
  protected bool vfuncLocalCommandLine(ref string[] arguments, out int exitStatus)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.localCommandLine)
      return typeof(return).init;

    bool _retval;
    auto _arguments = cast(char**)gMalloc((arguments.length + 1) * (char*).sizeof);
    foreach (i, s; arguments) _arguments[i] = s.toCString!(Yes.Malloc);
    _retval = cast(bool)_klass.localCommandLine(cast(GApplication*)this._cPtr, &_arguments, cast(int*)&exitStatus);
    uint _lenarguments;
    if (_arguments)
    {
      for (; _arguments[_lenarguments] !is null; _lenarguments++)
      {
      }
    }

    arguments.length = _lenarguments;
    foreach (i; 0 .. _lenarguments)
      arguments[i] = _arguments[i].fromCString!(Yes.Free);
    gFree(cast(void*)_arguments);
    return _retval;
  }

  /**
      invoked when another instance is taking over the name. Since: 2.60
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNameLost` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncNameLost()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.nameLost)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.nameLost(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Opens the given files.
      
      In essence, this results in the #GApplication::open signal being emitted
      in the primary instance.
      
      n_files must be greater than zero.
      
      hint is simply passed through to the ::open signal.  It is
      intended to be used by applications that have multiple modes for
      opening files (eg: "view" vs "edit", etc).  Unless you have a need
      for this functionality, you should use "".
      
      The application must be registered before calling this function
      and it must have the [gid.gio2.types.ApplicationFlags.HandlesOpen] flag set.
  
      Params:
        files = an array of #GFiles to open
        hint = a hint (or ""), but never null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncOpen(gid.gio2.file.File[] files, string hint)
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.open)
      return;

    int _nFiles;
    if (files)
      _nFiles = cast(int)files.length;

    auto _files_arr = new GFile*[](files.length);
    auto _files = _files_arr.ptr;
    foreach (i, obj; files) _files[i] = obj ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)obj)._cPtr(No.Dup): null;
    const(char)* _hint = hint.toCString!(No.Malloc, No.Nullable);
    _klass.open(cast(GApplication*)this._cPtr, _files, _nFiles, _hint);
  }

  /**
      Used to be invoked on the primary instance when the use
          count of the application drops to zero (and after any inactivity
          timeout, if requested). Not used anymore since 2.32
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuitMainloop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQuitMainloop()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.quitMainloop)
      return;

    _klass.quitMainloop(cast(GApplication*)this._cPtr);
  }

  /**
      Used to be invoked on the primary instance from
          [gid.gio2.application.Application.run] if the use-count is non-zero. Since 2.32,
          GApplication is iterating the main context directly and is not
          using run_mainloop anymore
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRunMainloop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRunMainloop()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.runMainloop)
      return;

    _klass.runMainloop(cast(GApplication*)this._cPtr);
  }

  /**
      invoked only on the registered primary instance immediately
           after the main loop terminates
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShutdown` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShutdown()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.shutdown)
      return;

    _klass.shutdown(cast(GApplication*)this._cPtr);
  }

  /**
      invoked on the primary instance immediately after registration
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStartup` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStartup()
  {
    auto _klass = cast(GApplicationClass*)_vfuncClass;
    if (!_klass.startup)
      return;

    _klass.startup(cast(GApplication*)this._cPtr);
  }

  /**
      Activates the application.
      
      In essence, this results in the #GApplication::activate signal being
      emitted in the primary instance.
      
      The application must be registered before calling this function.
  */
  void activate() nothrow
  {
    g_application_activate(cast(GApplication*)this._cPtr);
  }

  /**
      Add an option to be handled by application.
      
      Calling this function is the equivalent of calling
      [gid.gio2.application.Application.addMainOptionEntries] with a single #GOptionEntry
      that has its arg_data member set to null.
      
      The parsed arguments will be packed into a #GVariantDict which
      is passed to #GApplication::handle-local-options. If
      [gid.gio2.types.ApplicationFlags.HandlesCommandLine] is set, then it will also
      be sent to the primary instance. See
      [gid.gio2.application.Application.addMainOptionEntries] for more details.
      
      See #GOptionEntry for more documentation of the arguments.
  
      Params:
        longName = the long name of an option used to specify it in a commandline
        shortName = the short name of an option
        flags = flags from #GOptionFlags
        arg = the type of the option, as a #GOptionArg
        description = the description for the option in `--help` output
        argDescription = the placeholder to use for the extra argument
             parsed by the option in `--help` output
  */
  void addMainOption(string longName, char shortName, gid.glib2.types.OptionFlags flags, gid.glib2.types.OptionArg arg, string description, string argDescription = null) nothrow
  {
    const(char)* _longName = longName.toCString!(No.Malloc, No.Nullable);
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    const(char)* _argDescription = argDescription.toCString!(No.Malloc, Yes.Nullable);
    g_application_add_main_option(cast(GApplication*)this._cPtr, _longName, shortName, flags, arg, _description, _argDescription);
  }

  /**
      Adds main option entries to be handled by application.
      
      This function is comparable to [gid.glib2.option_context.OptionContext.addMainEntries].
      
      After the commandline arguments are parsed, the
      #GApplication::handle-local-options signal will be emitted.  At this
      point, the application can inspect the values pointed to by arg_data
      in the given #GOptionEntrys.
      
      Unlike #GOptionContext, #GApplication supports giving a null
      arg_data for a non-callback #GOptionEntry.  This results in the
      argument in question being packed into a #GVariantDict which is also
      passed to #GApplication::handle-local-options, where it can be
      inspected and modified.  If [gid.gio2.types.ApplicationFlags.HandlesCommandLine] is
      set, then the resulting dictionary is sent to the primary instance,
      where [gid.gio2.application_command_line.ApplicationCommandLine.getOptionsDict] will return it.
      As it has been passed outside the process at this point, the types of all
      values in the options dict must be checked before being used.
      This "packing" is done according to the type of the argument --
      booleans for normal flags, strings for strings, bytestrings for
      filenames, etc.  The packing only occurs if the flag is given (ie: we
      do not pack a "false" #GVariant in the case that a flag is missing).
      
      In general, it is recommended that all commandline arguments are
      parsed locally.  The options dictionary should then be used to
      transmit the result of the parsing to the primary instance, where
      [gid.glib2.variant_dict.VariantDict.lookup] can be used.  For local options, it is
      possible to either use arg_data in the usual way, or to consult (and
      potentially remove) the option from the options dictionary.
      
      This function is new in GLib 2.40.  Before then, the only real choice
      was to send all of the commandline arguments (options and all) to the
      primary instance for handling.  #GApplication ignored them completely
      on the local side.  Calling this function "opts in" to the new
      behaviour, and in particular, means that unrecognized options will be
      treated as errors.  Unrecognized options have never been ignored when
      [gid.gio2.types.ApplicationFlags.HandlesCommandLine] is unset.
      
      If #GApplication::handle-local-options needs to see the list of
      filenames, then the use of [gid.glib2.types.OPTION_REMAINING] is recommended.  If
      arg_data is null then [gid.glib2.types.OPTION_REMAINING] can be used as a key into
      the options dictionary.  If you do use [gid.glib2.types.OPTION_REMAINING] then you
      need to handle these arguments for yourself because once they are
      consumed, they will no longer be visible to the default handling
      (which treats them as filenames to be opened).
      
      It is important to use the proper GVariant format when retrieving
      the options with [gid.glib2.variant_dict.VariantDict.lookup]:
      - for [gid.glib2.types.OptionArg.None], use `b`
      - for [gid.glib2.types.OptionArg.String], use `&s`
      - for [gid.glib2.types.OptionArg.Int], use `i`
      - for [gid.glib2.types.OptionArg.Int64], use `x`
      - for [gid.glib2.types.OptionArg.Double], use `d`
      - for [gid.glib2.types.OptionArg.Filename], use `^&ay`
      - for [gid.glib2.types.OptionArg.StringArray], use `^a&s`
      - for [gid.glib2.types.OptionArg.FilenameArray], use `^a&ay`
  
      Params:
        entries = the
            main options for the application
  */
  void addMainOptionEntries(gid.glib2.types.OptionEntry[] entries) nothrow
  {
    auto _entries_arr = entries ~ GOptionEntry.init;
    auto _entries = _entries_arr.ptr;
    g_application_add_main_option_entries(cast(GApplication*)this._cPtr, _entries);
  }

  /**
      Adds a #GOptionGroup to the commandline handling of application.
      
      This function is comparable to [gid.glib2.option_context.OptionContext.addGroup].
      
      Unlike [gid.gio2.application.Application.addMainOptionEntries], this function does
      not deal with null arg_data and never transmits options to the
      primary instance.
      
      The reason for that is because, by the time the options arrive at the
      primary instance, it is typically too late to do anything with them.
      Taking the GTK option group as an example: GTK will already have been
      initialised by the time the #GApplication::command-line handler runs.
      In the case that this is not the first-running instance of the
      application, the existing instance may already have been running for
      a very long time.
      
      This means that the options from #GOptionGroup are only really usable
      in the case that the instance of the application being run is the
      first instance.  Passing options like `--display=` or `--gdk-debug=`
      on future runs will have no effect on the existing primary instance.
      
      Calling this function will cause the options in the supplied option
      group to be parsed, but it does not cause you to be "opted in" to the
      new functionality whereby unrecognized options are rejected even if
      [gid.gio2.types.ApplicationFlags.HandlesCommandLine] was given.
  
      Params:
        group = a #GOptionGroup
  */
  void addOptionGroup(gid.glib2.option_group.OptionGroup group) nothrow
  {
    g_application_add_option_group(cast(GApplication*)this._cPtr, group ? cast(GOptionGroup*)group._cPtr(Yes.Dup) : null);
  }

  /**
      Marks application as busy (see [gid.gio2.application.Application.markBusy]) while
      property on object is true.
      
      The binding holds a reference to application while it is active, but
      not to object. Instead, the binding is destroyed when object is
      finalized.
  
      Params:
        object = a #GObject
        property = the name of a boolean property of object
  */
  void bindBusyProperty(gid.gobject2.object.ObjectWrap object, string property) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    g_application_bind_busy_property(cast(GApplication*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property);
  }

  /**
      Gets the unique identifier for application.
      Returns: the identifier for application, owned by application
  */
  string getApplicationId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_application_get_application_id(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #GDBusConnection being used by the application, or null.
      
      If #GApplication is using its D-Bus backend then this function will
      return the #GDBusConnection being used for uniqueness and
      communication with the desktop environment and other instances of the
      application.
      
      If #GApplication is not using D-Bus then this function will return
      null.  This includes the situation where the D-Bus backend would
      normally be in use but we were unable to connect to the bus.
      
      This function must not be called before the application has been
      registered.  See [gid.gio2.application.Application.getIsRegistered].
      Returns: a #GDBusConnection, or null
  */
  gid.gio2.dbus_connection.DBusConnection getDbusConnection() nothrow
  {
    GDBusConnection* _cretval;
    _cretval = g_application_get_dbus_connection(cast(GApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the D-Bus object path being used by the application, or null.
      
      If #GApplication is using its D-Bus backend then this function will
      return the D-Bus object path that #GApplication is using.  If the
      application is the primary instance then there is an object published
      at this path.  If the application is not the primary instance then
      the result of this function is undefined.
      
      If #GApplication is not using D-Bus then this function will return
      null.  This includes the situation where the D-Bus backend would
      normally be in use but we were unable to connect to the bus.
      
      This function must not be called before the application has been
      registered.  See [gid.gio2.application.Application.getIsRegistered].
      Returns: the object path, or null
  */
  string getDbusObjectPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_application_get_dbus_object_path(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the flags for application.
      
      See #GApplicationFlags.
      Returns: the flags for application
  */
  gid.gio2.types.ApplicationFlags getFlags() nothrow
  {
    GApplicationFlags _cretval;
    _cretval = g_application_get_flags(cast(GApplication*)this._cPtr);
    gid.gio2.types.ApplicationFlags _retval = cast(gid.gio2.types.ApplicationFlags)_cretval;
    return _retval;
  }

  /**
      Gets the current inactivity timeout for the application.
      
      This is the amount of time (in milliseconds) after the last call to
      [gid.gio2.application.Application.release] before the application stops running.
      Returns: the timeout, in milliseconds
  */
  uint getInactivityTimeout() nothrow
  {
    uint _retval;
    _retval = g_application_get_inactivity_timeout(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Gets the application's current busy state, as set through
      [gid.gio2.application.Application.markBusy] or [gid.gio2.application.Application.bindBusyProperty].
      Returns: true if application is currently marked as busy
  */
  bool getIsBusy() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_application_get_is_busy(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Checks if application is registered.
      
      An application is registered if [gid.gio2.application.Application.register] has been
      successfully called.
      Returns: true if application is registered
  */
  bool getIsRegistered() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_application_get_is_registered(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Checks if application is remote.
      
      If application is remote then it means that another instance of
      application already exists (the 'primary' instance).  Calls to
      perform actions on application will result in the actions being
      performed by the primary instance.
      
      The value of this property cannot be accessed before
      [gid.gio2.application.Application.register] has been called.  See
      [gid.gio2.application.Application.getIsRegistered].
      Returns: true if application is remote
  */
  bool getIsRemote() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_application_get_is_remote(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Gets the resource base path of application.
      
      See [gid.gio2.application.Application.setResourceBasePath] for more information.
      Returns: the base resource path, if one is set
  */
  string getResourceBasePath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_application_get_resource_base_path(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the version of application.
      Returns: the version of application
  */
  string getVersion() nothrow
  {
    const(char)* _cretval;
    _cretval = g_application_get_version(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Increases the use count of application.
      
      Use this function to indicate that the application has a reason to
      continue to run.  For example, [gid.gio2.application.Application.hold] is called by GTK
      when a toplevel window is on the screen.
      
      To cancel the hold, call [gid.gio2.application.Application.release].
  */
  void hold() nothrow
  {
    g_application_hold(cast(GApplication*)this._cPtr);
  }

  /**
      Increases the busy count of application.
      
      Use this function to indicate that the application is busy, for instance
      while a long running operation is pending.
      
      The busy state will be exposed to other processes, so a session shell will
      use that information to indicate the state to the user (e.g. with a
      spinner).
      
      To cancel the busy indication, use [gid.gio2.application.Application.unmarkBusy].
      
      The application must be registered before calling this function.
  */
  void markBusy() nothrow
  {
    g_application_mark_busy(cast(GApplication*)this._cPtr);
  }

  /**
      Opens the given files.
      
      In essence, this results in the #GApplication::open signal being emitted
      in the primary instance.
      
      n_files must be greater than zero.
      
      hint is simply passed through to the ::open signal.  It is
      intended to be used by applications that have multiple modes for
      opening files (eg: "view" vs "edit", etc).  Unless you have a need
      for this functionality, you should use "".
      
      The application must be registered before calling this function
      and it must have the [gid.gio2.types.ApplicationFlags.HandlesOpen] flag set.
  
      Params:
        files = an array of #GFiles to open
        hint = a hint (or ""), but never null
  */
  void open(gid.gio2.file.File[] files, string hint) nothrow
  {
    int _nFiles;
    if (files)
      _nFiles = cast(int)files.length;

    auto _files_arr = new GFile*[](files.length);
    auto _files = _files_arr.ptr;
    foreach (i, obj; files) _files[i] = obj ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)obj)._cPtr(No.Dup): null;
    const(char)* _hint = hint.toCString!(No.Malloc, No.Nullable);
    g_application_open(cast(GApplication*)this._cPtr, _files, _nFiles, _hint);
  }

  /**
      Immediately quits the application.
      
      Upon return to the mainloop, [gid.gio2.application.Application.run] will return,
      calling only the 'shutdown' function before doing so.
      
      The hold count is ignored.
      Take care if your code has called [gid.gio2.application.Application.hold] on the application and
      is therefore still expecting it to exist.
      (Note that you may have called [gid.gio2.application.Application.hold] indirectly, for example
      through [gid.gtk4.application.Application.addWindow].)
      
      The result of calling [gid.gio2.application.Application.run] again after it returns is
      unspecified.
  */
  void quit() nothrow
  {
    g_application_quit(cast(GApplication*)this._cPtr);
  }

  /**
      Attempts registration of the application.
      
      This is the point at which the application discovers if it is the
      primary instance or merely acting as a remote for an already-existing
      primary instance.  This is implemented by attempting to acquire the
      application identifier as a unique bus name on the session bus using
      GDBus.
      
      If there is no application ID or if [gid.gio2.types.ApplicationFlags.NonUnique] was
      given, then this process will always become the primary instance.
      
      Due to the internal architecture of GDBus, method calls can be
      dispatched at any time (even if a main loop is not running).  For
      this reason, you must ensure that any object paths that you wish to
      register are registered before calling this function.
      
      If the application has already been registered then true is
      returned with no work performed.
      
      The #GApplication::startup signal is emitted if registration succeeds
      and application is the primary instance (including the non-unique
      case).
      
      In the event of an error (such as cancellable being cancelled, or a
      failure to connect to the session bus), false is returned and error
      is set appropriately.
      
      Note: the return value of this function is not an indicator that this
      instance is or is not the primary instance of the application.  See
      [gid.gio2.application.Application.getIsRemote] for that.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if registration succeeded
      Throws: [ErrorWrap]
  */
  bool register(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_application_register(cast(GApplication*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Decrease the use count of application.
      
      When the use count reaches zero, the application will stop running.
      
      Never call this function except to cancel the effect of a previous
      call to [gid.gio2.application.Application.hold].
  */
  void release() nothrow
  {
    g_application_release(cast(GApplication*)this._cPtr);
  }

  /**
      Runs the application.
      
      This function is intended to be run from main() and its return value
      is intended to be returned by main(). Although you are expected to pass
      the argc, argv parameters from main() to this function, it is possible
      to pass null if argv is not available or commandline handling is not
      required.  Note that on Windows, argc and argv are ignored, and
      g_win32_get_command_line() is called internally (for proper support
      of Unicode commandline arguments).
      
      #GApplication will attempt to parse the commandline arguments.  You
      can add commandline flags to the list of recognised options by way of
      [gid.gio2.application.Application.addMainOptionEntries].  After this, the
      #GApplication::handle-local-options signal is emitted, from which the
      application can inspect the values of its #GOptionEntrys.
      
      #GApplication::handle-local-options is a good place to handle options
      such as `--version`, where an immediate reply from the local process is
      desired (instead of communicating with an already-running instance).
      A #GApplication::handle-local-options handler can stop further processing
      by returning a non-negative value, which then becomes the exit status of
      the process.
      
      What happens next depends on the flags: if
      [gid.gio2.types.ApplicationFlags.HandlesCommandLine] was specified then the remaining
      commandline arguments are sent to the primary instance, where a
      #GApplication::command-line signal is emitted.  Otherwise, the
      remaining commandline arguments are assumed to be a list of files.
      If there are no files listed, the application is activated via the
      #GApplication::activate signal.  If there are one or more files, and
      [gid.gio2.types.ApplicationFlags.HandlesOpen] was specified then the files are opened
      via the #GApplication::open signal.
      
      If you are interested in doing more complicated local handling of the
      commandline then you should implement your own #GApplication subclass
      and override local_command_line(). In this case, you most likely want
      to return true from your local_command_line() implementation to
      suppress the default handling. See
      [gapplication-example-cmdline2.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c)
      for an example.
      
      If, after the above is done, the use count of the application is zero
      then the exit status is returned immediately.  If the use count is
      non-zero then the default main context is iterated until the use count
      falls to zero, at which point 0 is returned.
      
      If the [gid.gio2.types.ApplicationFlags.IsService] flag is set, then the service will
      run for as much as 10 seconds with a use count of zero while waiting
      for the message that caused the activation to arrive.  After that,
      if the use count falls to zero the application will exit immediately,
      except in the case that [gid.gio2.application.Application.setInactivityTimeout] is in
      use.
      
      This function sets the prgname ([gid.glib2.global.setPrgname]), if not already set,
      to the basename of argv[0].
      
      Much like [gid.glib2.main_loop.MainLoop.run], this function will acquire the main context
      for the duration that the application is running.
      
      Since 2.40, applications that are not explicitly flagged as services
      or launchers (ie: neither [gid.gio2.types.ApplicationFlags.IsService] or
      [gid.gio2.types.ApplicationFlags.IsLauncher] are given as flags) will check (from the
      default handler for local_command_line) if "--gapplication-service"
      was given in the command line.  If this flag is present then normal
      commandline processing is interrupted and the
      [gid.gio2.types.ApplicationFlags.IsService] flag is set.  This provides a "compromise"
      solution whereby running an application directly from the commandline
      will invoke it in the normal way (which can be useful for debugging)
      while still allowing applications to be D-Bus activated in service
      mode.  The D-Bus service file should invoke the executable with
      "--gapplication-service" as the sole commandline argument.  This
      approach is suitable for use by most graphical applications but
      should not be used from applications like editors that need precise
      control over when processes invoked via the commandline will exit and
      what their exit status will be.
  
      Params:
        argv = the argv from main(), or null
      Returns: the exit status
  */
  int run(string[] argv = null) nothrow
  {
    int _retval;
    int _argc;
    if (argv)
      _argc = cast(int)argv.length;

    auto _argv_arr = new char*[](argv.length);
    auto _argv = cast(char**)_argv_arr.ptr;
    foreach (i, s; argv) _argv[i] = s.toCString!(No.Malloc);
    _retval = g_application_run(cast(GApplication*)this._cPtr, _argc, _argv);
    return _retval;
  }

  /**
      Sends a notification on behalf of application to the desktop shell.
      There is no guarantee that the notification is displayed immediately,
      or even at all.
      
      Notifications may persist after the application exits. It will be
      D-Bus-activated when the notification or one of its actions is
      activated.
      
      Modifying notification after this call has no effect. However, the
      object can be reused for a later call to this function.
      
      id may be any string that uniquely identifies the event for the
      application. It does not need to be in any special format. For
      example, "new-message" might be appropriate for a notification about
      new messages.
      
      If a previous notification was sent with the same id, it will be
      replaced with notification and shown again as if it was a new
      notification. This works even for notifications sent from a previous
      execution of the application, as long as id is the same string.
      
      id may be `NULL`, but it is impossible to replace or withdraw
      notifications without an id.
      
      If notification is no longer relevant, it can be withdrawn with
      [gid.gio2.application.Application.withdrawNotification].
      
      It is an error to call this function if application has no
      application ID.
  
      Params:
        id = id of the notification, or null
        notification = the #GNotification to send
  */
  void sendNotification(string id, gid.gio2.notification.Notification notification) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, Yes.Nullable);
    g_application_send_notification(cast(GApplication*)this._cPtr, _id, notification ? cast(GNotification*)notification._cPtr(No.Dup) : null);
  }

  /**
      This used to be how actions were associated with a #GApplication.
      Now there is #GActionMap for that.
  
      Params:
        actionGroup = a #GActionGroup, or null
  
      Deprecated: Use the #GActionMap interface instead.  Never ever
        mix use of this API with use of #GActionMap on the same application
        or things will go very badly wrong.  This function is known to
        introduce buggy behaviour (ie: signals not emitted on changes to the
        action group), so you should really use #GActionMap instead.
  */
  void setActionGroup(gid.gio2.action_group.ActionGroup actionGroup = null) nothrow
  {
    g_application_set_action_group(cast(GApplication*)this._cPtr, actionGroup ? cast(GActionGroup*)(cast(gid.gobject2.object.ObjectWrap)actionGroup)._cPtr(No.Dup) : null);
  }

  /**
      Sets the unique identifier for application.
      
      The application id can only be modified if application has not yet
      been registered.
      
      If non-null, the application id must be valid.  See
      [gid.gio2.application.Application.idIsValid].
  
      Params:
        applicationId = the identifier for application
  */
  void setApplicationId(string applicationId = null) nothrow
  {
    const(char)* _applicationId = applicationId.toCString!(No.Malloc, Yes.Nullable);
    g_application_set_application_id(cast(GApplication*)this._cPtr, _applicationId);
  }

  /**
      Sets or unsets the default application for the process, as returned
      by [gid.gio2.application.Application.getDefault].
      
      This function does not take its own reference on application.  If
      application is destroyed then the default application will revert
      back to null.
  */
  void setDefault() nothrow
  {
    g_application_set_default(cast(GApplication*)this._cPtr);
  }

  /**
      Sets the flags for application.
      
      The flags can only be modified if application has not yet been
      registered.
      
      See #GApplicationFlags.
  
      Params:
        flags = the flags for application
  */
  void setFlags(gid.gio2.types.ApplicationFlags flags) nothrow
  {
    g_application_set_flags(cast(GApplication*)this._cPtr, flags);
  }

  /**
      Sets the current inactivity timeout for the application.
      
      This is the amount of time (in milliseconds) after the last call to
      [gid.gio2.application.Application.release] before the application stops running.
      
      This call has no side effects of its own.  The value set here is only
      used for next time [gid.gio2.application.Application.release] drops the use count to
      zero.  Any timeouts currently in progress are not impacted.
  
      Params:
        inactivityTimeout = the timeout, in milliseconds
  */
  void setInactivityTimeout(uint inactivityTimeout) nothrow
  {
    g_application_set_inactivity_timeout(cast(GApplication*)this._cPtr, inactivityTimeout);
  }

  /**
      Adds a description to the application option context.
      
      See [gid.glib2.option_context.OptionContext.setDescription] for more information.
  
      Params:
        description = a string to be shown in `--help` output
           after the list of options, or null
  */
  void setOptionContextDescription(string description = null) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
    g_application_set_option_context_description(cast(GApplication*)this._cPtr, _description);
  }

  /**
      Sets the parameter string to be used by the commandline handling of application.
      
      This function registers the argument to be passed to [gid.glib2.option_context.OptionContext.new_]
      when the internal #GOptionContext of application is created.
      
      See [gid.glib2.option_context.OptionContext.new_] for more information about parameter_string.
  
      Params:
        parameterString = a string which is displayed
            in the first line of `--help` output, after the usage summary `programname [OPTION...]`.
  */
  void setOptionContextParameterString(string parameterString = null) nothrow
  {
    const(char)* _parameterString = parameterString.toCString!(No.Malloc, Yes.Nullable);
    g_application_set_option_context_parameter_string(cast(GApplication*)this._cPtr, _parameterString);
  }

  /**
      Adds a summary to the application option context.
      
      See [gid.glib2.option_context.OptionContext.setSummary] for more information.
  
      Params:
        summary = a string to be shown in `--help` output
           before the list of options, or null
  */
  void setOptionContextSummary(string summary = null) nothrow
  {
    const(char)* _summary = summary.toCString!(No.Malloc, Yes.Nullable);
    g_application_set_option_context_summary(cast(GApplication*)this._cPtr, _summary);
  }

  /**
      Sets (or unsets) the base resource path of application.
      
      The path is used to automatically load various
      [application resources][gid.gio2.resource.Resource] such as menu layouts and
      action descriptions. The various types of resources will be found at
      fixed names relative to the given base path.
      
      By default, the resource base path is determined from the application
      ID by prefixing '/' and replacing each '.' with '/'.  This is done at
      the time that the #GApplication object is constructed.  Changes to
      the application ID after that point will not have an impact on the
      resource base path.
      
      As an example, if the application has an ID of "org.example.app" then
      the default resource base path will be "/org/example/app".  If this
      is a #GtkApplication (and you have not manually changed the path)
      then Gtk will then search for the menus of the application at
      "/org/example/app/gtk/menus.ui".
      
      See #GResource for more information about adding resources to your
      application.
      
      You can disable automatic resource loading functionality by setting
      the path to null.
      
      Changing the resource base path once the application is running is
      not recommended.  The point at which the resource path is consulted
      for forming paths for various purposes is unspecified.  When writing
      a sub-class of #GApplication you should either set the
      #GApplication:resource-base-path property at construction time, or call
      this function during the instance initialization. Alternatively, you
      can call this function in the #GApplicationClass.startup virtual function,
      before chaining up to the parent implementation.
  
      Params:
        resourcePath = the resource path to use
  */
  void setResourceBasePath(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    g_application_set_resource_base_path(cast(GApplication*)this._cPtr, _resourcePath);
  }

  /**
      Sets the version number of application. This will be used to implement
      a `--version` command line argument
      
      The application version can only be modified if application has not yet
      been registered.
  
      Params:
        version_ = the version of application
  */
  void setVersion(string version_) nothrow
  {
    const(char)* _version_ = version_.toCString!(No.Malloc, No.Nullable);
    g_application_set_version(cast(GApplication*)this._cPtr, _version_);
  }

  /**
      Destroys a binding between property and the busy state of
      application that was previously created with
      [gid.gio2.application.Application.bindBusyProperty].
  
      Params:
        object = a #GObject
        property = the name of a boolean property of object
  */
  void unbindBusyProperty(gid.gobject2.object.ObjectWrap object, string property) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    g_application_unbind_busy_property(cast(GApplication*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property);
  }

  /**
      Decreases the busy count of application.
      
      When the busy count reaches zero, the new state will be propagated
      to other processes.
      
      This function must only be called to cancel the effect of a previous
      call to [gid.gio2.application.Application.markBusy].
  */
  void unmarkBusy() nothrow
  {
    g_application_unmark_busy(cast(GApplication*)this._cPtr);
  }

  /**
      Withdraws a notification that was sent with
      [gid.gio2.application.Application.sendNotification].
      
      This call does nothing if a notification with id doesn't exist or
      the notification was never sent.
      
      This function works even for notifications sent in previous
      executions of this application, as long id is the same as it was for
      the sent notification.
      
      Note that notifications are dismissed when the user clicks on one
      of the buttons in a notification or triggers its default action, so
      there is no need to explicitly withdraw the notification in that case.
  
      Params:
        id = id of a previously sent notification
  */
  void withdrawNotification(string id) nothrow
  {
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    g_application_withdraw_notification(cast(GApplication*)this._cPtr, _id);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal is emitted on the primary instance when an
        activation occurs. See [gid.gio2.application.Application.activate].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `CommandLine` signal.
  
      The ::command-line signal is emitted on the primary instance when
        a commandline is not handled locally. See [gid.gio2.application.Application.run] and
        the #GApplicationCommandLine documentation for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `int callback(gid.gio2.application_command_line.ApplicationCommandLine commandLine, gid.gio2.application.Application application)`
  
          `commandLine` a #GApplicationCommandLine representing the
                passed commandline (optional)
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` An integer that is set as the exit status for the calling
              process. See [gid.gio2.application_command_line.ApplicationCommandLine.setExitStatus].
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCommandLine(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application_command_line.ApplicationCommandLine)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      int _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.commandLine");
      }

      setVal!(int)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("command-line", closure, after);
  }

  /**
      Connect to `HandleLocalOptions` signal.
  
      The ::handle-local-options signal is emitted on the local instance
        after the parsing of the commandline options has occurred.
        
        You can add options to be recognised during commandline option
        parsing using [gid.gio2.application.Application.addMainOptionEntries] and
        [gid.gio2.application.Application.addOptionGroup].
        
        Signal handlers can inspect options (along with values pointed to
        from the arg_data of an installed #GOptionEntrys) in order to
        decide to perform certain actions, including direct local handling
        (which may be useful for options like --version).
        
        In the event that the application is marked
        [gid.gio2.types.ApplicationFlags.HandlesCommandLine] the "normal processing" will
        send the options dictionary to the primary instance where it can be
        read with [gid.gio2.application_command_line.ApplicationCommandLine.getOptionsDict].  The signal
        handler can modify the dictionary before returning, and the
        modified dictionary will be sent.
        
        In the event that [gid.gio2.types.ApplicationFlags.HandlesCommandLine] is not set,
        "normal processing" will treat the remaining uncollected command
        line arguments as filenames or URIs.  If there are no arguments,
        the application is activated by [gid.gio2.application.Application.activate].  One or
        more arguments results in a call to [gid.gio2.application.Application.open].
        
        If you want to handle the local commandline arguments for yourself
        by converting them to calls to [gid.gio2.application.Application.open] or
        [gid.gio2.action_group.ActionGroup.activateAction] then you must be sure to register
        the application first.  You should probably not call
        [gid.gio2.application.Application.activate] for yourself, however: just return -1 and
        allow the default handler to do it for you.  This will ensure that
        the `--gapplication-service` switch works properly (i.e. no activation
        in that case).
        
        Note that this signal is emitted from the default implementation of
        local_command_line().  If you override that function and don't
        chain up then this signal will never be emitted.
        
        You can override local_command_line() if you need more powerful
        capabilities than what is provided here, but this should not
        normally be required.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `int callback(gid.glib2.variant_dict.VariantDict options, gid.gio2.application.Application application)`
  
          `options` the options dictionary (optional)
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` an exit code. If you have handled your options and want
            to exit the process, return a non-negative option, 0 for success,
            and a positive value for failure. To continue, return -1 to let
            the default option processing continue.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHandleLocalOptions(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.glib2.variant_dict.VariantDict)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      int _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.handleLocalOptions");
      }

      setVal!(int)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("handle-local-options", closure, after);
  }

  /**
      Connect to `NameLost` signal.
  
      The ::name-lost signal is emitted only on the registered primary instance
        when a new instance has taken over. This can only happen if the application
        is using the [gid.gio2.types.ApplicationFlags.AllowReplacement] flag.
        
        The default handler for this signal calls [gid.gio2.application.Application.quit].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNameLost(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.nameLost");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("name-lost", closure, after);
  }

  /**
      Connect to `Open` signal.
  
      The ::open signal is emitted on the primary instance when there are
        files to open. See [gid.gio2.application.Application.open] for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.file.File[] files, string hint, gid.gio2.application.Application application)`
  
          `files` an array of #GFiles (optional)
  
          `hint` a hint provided by the calling instance (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectOpen(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.file.File[])))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.application.Application)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      auto nFiles = getVal!(int)(&_paramVals[2]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[3]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      static if (Parameters!T.length > 0)
      {
        auto _cArray = getVal!(GFile**)(&_paramVals[1]);
        gid.gio2.file.File[] _dArray;
        foreach (i; 0 .. nFiles)
          _dArray ~= gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(_cArray[i], No.Take);
        _paramTuple[0] = _dArray;
      }

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.open");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("open", closure, after);
  }

  /**
      Connect to `Shutdown` signal.
  
      The ::shutdown signal is emitted only on the registered primary instance
        immediately after the main loop terminates.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShutdown(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.shutdown");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("shutdown", closure, after);
  }

  /**
      Connect to `Startup` signal.
  
      The ::startup signal is emitted on the primary instance immediately
        after registration. See [gid.gio2.application.Application.register].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.application.Application application)`
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStartup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.startup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("startup", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Application
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.application.Application), T.stringof ~ " is not derived from gid.gio2.application.Application");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAddPlatformData", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "add_platform_data");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAfterEmit", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "after_emit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBeforeEmit", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "before_emit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCommandLine", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "command_line");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDbusRegister", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "dbus_register");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDbusUnregister", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "dbus_unregister");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleLocalOptions", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "handle_local_options");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLocalCommandLine", true)[0]) == gid.gio2.application.Application))
      static assert(0, "Overriding gid.gio2.application.Application.vfuncLocalCommandLine is not supported: InOut array parameter 'arguments' in callback with ownership 'Full' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNameLost", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "name_lost");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuitMainloop", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "quit_mainloop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRunMainloop", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "run_mainloop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShutdown", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "shutdown");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStartup", true)[0]) == gid.gio2.application.Application))
      _installVfunc(klass, "startup");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GApplicationClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(application);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "add_platform_data":
      {
        static extern(C) void _vfuncAddPlatformDataTramp(GApplication* application, GVariantBuilder* builder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.addPlatformData)
              return (cast(typeof(&_vfuncAddPlatformDataTramp))_klass.addPlatformData)(application, builder);
            return;
          }

          auto _builder = builder ? new gid.glib2.variant_builder.VariantBuilder(cast(void*)builder, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncAddPlatformData(_builder);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncAddPlatformData");
          }
          if (_builder)
            _builder._cUnborrow;

        }

        _klass.addPlatformData = cast(typeof(_klass.addPlatformData))&_vfuncAddPlatformDataTramp;
        break;
      }
      case "after_emit":
      {
        static extern(C) void _vfuncAfterEmitTramp(GApplication* application, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.afterEmit)
              return (cast(typeof(&_vfuncAfterEmitTramp))_klass.afterEmit)(application, platformData);
            return;
          }

          try
          {
            _obj.vfuncAfterEmit(platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncAfterEmit");
          }
        }

        _klass.afterEmit = cast(typeof(_klass.afterEmit))&_vfuncAfterEmitTramp;
        break;
      }
      case "before_emit":
      {
        static extern(C) void _vfuncBeforeEmitTramp(GApplication* application, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.beforeEmit)
              return (cast(typeof(&_vfuncBeforeEmitTramp))_klass.beforeEmit)(application, platformData);
            return;
          }

          try
          {
            _obj.vfuncBeforeEmit(platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncBeforeEmit");
          }
        }

        _klass.beforeEmit = cast(typeof(_klass.beforeEmit))&_vfuncBeforeEmitTramp;
        break;
      }
      case "command_line":
      {
        static extern(C) int _vfuncCommandLineTramp(GApplication* application, GApplicationCommandLine* commandLine) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.commandLine)
              return (cast(typeof(&_vfuncCommandLineTramp))_klass.commandLine)(application, commandLine);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncCommandLine(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.application_command_line.ApplicationCommandLine)(cast(void*)commandLine, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncCommandLine");
          }
          return _retval;
        }

        _klass.commandLine = cast(typeof(_klass.commandLine))&_vfuncCommandLineTramp;
        break;
      }
      case "dbus_register":
      {
        static extern(C) gboolean _vfuncDbusRegisterTramp(GApplication* application, GDBusConnection* connection, const(char)* objectPath, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.dbusRegister)
              return (cast(typeof(&_vfuncDbusRegisterTramp))_klass.dbusRegister)(application, connection, objectPath, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _objectPath = objectPath.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncDbusRegister(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(void*)connection, No.Take), _objectPath);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.dbusRegister = cast(typeof(_klass.dbusRegister))&_vfuncDbusRegisterTramp;
        break;
      }
      case "dbus_unregister":
      {
        static extern(C) void _vfuncDbusUnregisterTramp(GApplication* application, GDBusConnection* connection, const(char)* objectPath) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.dbusUnregister)
              return (cast(typeof(&_vfuncDbusUnregisterTramp))_klass.dbusUnregister)(application, connection, objectPath);
            return;
          }

          string _objectPath = objectPath.fromCString!(No.Free);

          try
          {
            _obj.vfuncDbusUnregister(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(void*)connection, No.Take), _objectPath);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncDbusUnregister");
          }
        }

        _klass.dbusUnregister = cast(typeof(_klass.dbusUnregister))&_vfuncDbusUnregisterTramp;
        break;
      }
      case "handle_local_options":
      {
        static extern(C) int _vfuncHandleLocalOptionsTramp(GApplication* application, GVariantDict* options) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.handleLocalOptions)
              return (cast(typeof(&_vfuncHandleLocalOptionsTramp))_klass.handleLocalOptions)(application, options);
            return typeof(return).init;
          }

          int _retval;
          auto _options = options ? new gid.glib2.variant_dict.VariantDict(cast(void*)options, Yes.Take)._cBorrow : null;

          try
          {
            _retval = _obj.vfuncHandleLocalOptions(_options);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncHandleLocalOptions");
          }
          if (_options)
            _options._cUnborrow;

          return _retval;
        }

        _klass.handleLocalOptions = cast(typeof(_klass.handleLocalOptions))&_vfuncHandleLocalOptionsTramp;
        break;
      }
      case "name_lost":
      {
        static extern(C) gboolean _vfuncNameLostTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.nameLost)
              return (cast(typeof(&_vfuncNameLostTramp))_klass.nameLost)(application);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNameLost();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncNameLost");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.nameLost = cast(typeof(_klass.nameLost))&_vfuncNameLostTramp;
        break;
      }
      case "open":
      {
        static extern(C) void _vfuncOpenTramp(GApplication* application, GFile** files, int nFiles, const(char)* hint) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(application, files, nFiles, hint);
            return;
          }

          gid.gio2.file.File[] _files;
          _files.length = nFiles;
          foreach (i; 0 .. nFiles)
            _files[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(files[i], No.Take);
          string _hint = hint.fromCString!(No.Free);

          try
          {
            _obj.vfuncOpen(_files, _hint);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncOpen");
          }
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "quit_mainloop":
      {
        static extern(C) void _vfuncQuitMainloopTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.quitMainloop)
              return (cast(typeof(&_vfuncQuitMainloopTramp))_klass.quitMainloop)(application);
            return;
          }

          try
          {
            _obj.vfuncQuitMainloop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncQuitMainloop");
          }
        }

        _klass.quitMainloop = cast(typeof(_klass.quitMainloop))&_vfuncQuitMainloopTramp;
        break;
      }
      case "run_mainloop":
      {
        static extern(C) void _vfuncRunMainloopTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.runMainloop)
              return (cast(typeof(&_vfuncRunMainloopTramp))_klass.runMainloop)(application);
            return;
          }

          try
          {
            _obj.vfuncRunMainloop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncRunMainloop");
          }
        }

        _klass.runMainloop = cast(typeof(_klass.runMainloop))&_vfuncRunMainloopTramp;
        break;
      }
      case "shutdown":
      {
        static extern(C) void _vfuncShutdownTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.shutdown)
              return (cast(typeof(&_vfuncShutdownTramp))_klass.shutdown)(application);
            return;
          }

          try
          {
            _obj.vfuncShutdown();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncShutdown");
          }
        }

        _klass.shutdown = cast(typeof(_klass.shutdown))&_vfuncShutdownTramp;
        break;
      }
      case "startup":
      {
        static extern(C) void _vfuncStartupTramp(GApplication* application) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.application.Application)(cast(void*)application);
          if (!_obj)
          {
            auto _klass = cast(GApplicationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)application);
            if (_klass.startup)
              return (cast(typeof(&_vfuncStartupTramp))_klass.startup)(application);
            return;
          }

          try
          {
            _obj.vfuncStartup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.application.Application.vfuncStartup");
          }
        }

        _klass.startup = cast(typeof(_klass.startup))&_vfuncStartupTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.application.Application]
class ApplicationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T, gid.gio2.action_map.ActionMapGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin ActionMapGidBuilderT!();

  /**
      Set `actionGroup` property.
      Params:
        propval = The group of actions that the application exports.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use the [gid.gio2.action_map.ActionMap] interface instead.
          Never ever mix use of this API with use of [gid.gio2.action_map.ActionMap] on the
          same @application or things will go very badly wrong.
  */
  T actionGroup(gid.gio2.action_group.ActionGroup propval) nothrow
  {
    return setProperty("action-group", propval);
  }

  /**
      Set `applicationId` property.
      Params:
        propval = The unique identifier for the application.
      Returns: Builder instance for fluent chaining
  */
  T applicationId(string propval) nothrow
  {
    return setProperty("application-id", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = Flags specifying the behaviour of the application.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gio2.types.ApplicationFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `inactivityTimeout` property.
      Params:
        propval = Time (in milliseconds) to stay alive after becoming idle.
      Returns: Builder instance for fluent chaining
  */
  T inactivityTimeout(uint propval) nothrow
  {
    return setProperty("inactivity-timeout", propval);
  }

  /**
      Set `resourceBasePath` property.
      Params:
        propval = The base resource path for the application.
      Returns: Builder instance for fluent chaining
  */
  T resourceBasePath(string propval) nothrow
  {
    return setProperty("resource-base-path", propval);
  }

  /**
      Set `version_` property.
      Params:
        propval = The human-readable version number of the application.
      Returns: Builder instance for fluent chaining
  */
  T version_(string propval) nothrow
  {
    return setProperty("version", propval);
  }
}

/// Fluent builder for [gid.gio2.application.Application]
final class ApplicationGidBuilder : ApplicationGidBuilderImpl!ApplicationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Application build() nothrow
  {
    return new Application(cast(void*)createGObject(Application._getGType), Yes.Take);
  }
}
