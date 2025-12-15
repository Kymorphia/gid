/// Module for [Application] class
module gio.application;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.application_command_line;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.file;
import gio.notification;
import gio.types;
import glib.error;
import glib.option_group;
import glib.types;
import glib.variant_dict;
import gobject.dclosure;
import gobject.object;

/**
    [gio.application.Application] is the core class for application support.
    
    A [gio.application.Application] is the foundation of an application. It wraps some
    low-level platform-specific services and is intended to act as the
    foundation for higher-level application classes such as
    [gtk.application.Application] or `MxApplication`. In general, you should not use
    this class outside of a higher level framework.
    
    [gio.application.Application] provides convenient life-cycle management by maintaining
    a "use count" for the primary application instance. The use count can
    be changed using [gio.application.Application.hold] and
    [gio.application.Application.release]. If it drops to zero, the application
    exits. Higher-level classes such as [gtk.application.Application] employ the use count
    to ensure that the application stays alive as long as it has any opened
    windows.
    
    Another feature that [gio.application.Application] (optionally) provides is process
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
    
    The use of [gio.application.Application] differs from some other commonly-used
    uniqueness libraries (such as libunique) in important ways. The
    application is not expected to manually register itself and check
    if it is the primary instance. Instead, the main() function of a
    [gio.application.Application] should do very little more than instantiating the
    application instance, possibly connecting signal handlers, then
    calling [gio.application.Application.run]. All checks for uniqueness are done
    internally. If the application is the primary instance then the
    startup signal is emitted and the mainloop runs. If the application
    is not the primary instance then a signal is sent to the primary
    instance and [gio.application.Application.run] promptly returns. See the code
    examples below.
    
    If used, the expected form of an application identifier is the
    same as that of a
    [D-Bus well-known bus name](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
    Examples include: `com.example.MyApp`, `org.example.internal_apps.Calculator`,
    `org._7_zip.Archiver`.
    For details on valid application identifiers, see [gio.application.Application.idIsValid].
    
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
    [gio.application.Application.register]). Unfortunately, this means that you cannot
    use `property@Gio.Application:is-remote` to decide if you want to register
    object paths.
    
    [gio.application.Application] also implements the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap]
    interfaces and lets you easily export actions by adding them with
    [gio.action_map.ActionMap.addAction]. When invoking an action by calling
    [gio.action_group.ActionGroup.activateAction] on the application, it is always
    invoked in the primary instance. The actions are also exported on
    the session bus, and GIO provides the [gio.dbus_action_group.DBusActionGroup] wrapper to
    conveniently access them remotely. GIO provides a [gio.dbus_menu_model.DBusMenuModel] wrapper
    for remote access to exported [gio.menu_model.MenuModel]s.
    
    Note: Due to the fact that actions are exported on the session bus,
    using `maybe` parameters is not supported, since D-Bus does not support
    `maybe` types.
    
    There is a number of different entry points into a [gio.application.Application]:
    
    $(LIST
      * via 'Activate' (i.e. just starting the application)
      
      * via 'Open' (i.e. opening some files)
      
      * by handling a command-line
      
      * via activating an action
    )
      
    The [gio.application.Application.startup] signal lets you handle the application
    initialization for all of these in a single place.
    
    Regardless of which of these entry points is used to start the
    application, [gio.application.Application] passes some ‘platform data’ from the
    launching instance to the primary instance, in the form of a
    [glib.variant.Variant] dictionary mapping strings to variants. To use platform
    data, override the `vfunc@Gio.Application.before_emit` or
    `vfunc@Gio.Application.after_emit` virtual functions
    in your [gio.application.Application] subclass. When dealing with
    [gio.application_command_line.ApplicationCommandLine] objects, the platform data is
    directly available via [gio.application_command_line.ApplicationCommandLine.getCwd],
    [gio.application_command_line.ApplicationCommandLine.getEnviron] and
    [gio.application_command_line.ApplicationCommandLine.getPlatformData].
    
    As the name indicates, the platform data may vary depending on the
    operating system, but it always includes the current directory (key
    `cwd`), and optionally the environment (ie the set of environment
    variables and their values) of the calling process (key `environ`).
    The environment is only added to the platform data if the
    [gio.types.ApplicationFlags.SendEnvironment] flag is set. [gio.application.Application] subclasses
    can add their own platform data by overriding the
    `vfunc@Gio.Application.add_platform_data` virtual function. For instance,
    [gtk.application.Application] adds startup notification data in this way.
    
    To parse commandline arguments you may handle the
    `signal@Gio.Application::command-line` signal or override the
    `vfunc@Gio.Application.local_command_line` virtual funcion, to parse them in
    either the primary instance or the local instance, respectively.
    
    For an example of opening files with a [gio.application.Application], see
    [gapplication-example-open.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-open.c).
    
    For an example of using actions with [gio.application.Application], see
    [gapplication-example-actions.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-actions.c).
    
    For an example of using extra D-Bus hooks with [gio.application.Application], see
    [gapplication-example-dbushooks.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c).
*/
class Application : gobject.object.ObjectWrap, gio.action_group.ActionGroup, gio.action_map.ActionMap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_application_get_type != &gidSymbolNotFound ? g_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self()
  {
    return this;
  }

  /**
      Set `actionGroup` property.
      Params:
        propval = The group of actions that the application exports.
  */
  @property void actionGroup(gio.action_group.ActionGroup propval)
  {
    return setActionGroup(propval);
  }

  /**
      Get `applicationId` property.
      Returns: The unique identifier for the application.
  */
  @property string applicationId()
  {
    return getApplicationId();
  }

  /**
      Set `applicationId` property.
      Params:
        propval = The unique identifier for the application.
  */
  @property void applicationId(string propval)
  {
    return setApplicationId(propval);
  }

  /**
      Get `flags` property.
      Returns: Flags specifying the behaviour of the application.
  */
  @property gio.types.ApplicationFlags flags()
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = Flags specifying the behaviour of the application.
  */
  @property void flags(gio.types.ApplicationFlags propval)
  {
    return setFlags(propval);
  }

  /**
      Get `inactivityTimeout` property.
      Returns: Time (in milliseconds) to stay alive after becoming idle.
  */
  @property uint inactivityTimeout()
  {
    return getInactivityTimeout();
  }

  /**
      Set `inactivityTimeout` property.
      Params:
        propval = Time (in milliseconds) to stay alive after becoming idle.
  */
  @property void inactivityTimeout(uint propval)
  {
    return setInactivityTimeout(propval);
  }

  /**
      Get `isBusy` property.
      Returns: Whether the application is currently marked as busy through
      [gio.application.Application.markBusy] or [gio.application.Application.bindBusyProperty].
  */
  @property bool isBusy()
  {
    return getIsBusy();
  }

  /**
      Get `isRegistered` property.
      Returns: Whether [gio.application.Application.register] has been called.
  */
  @property bool isRegistered()
  {
    return getIsRegistered();
  }

  /**
      Get `isRemote` property.
      Returns: Whether this application instance is remote.
  */
  @property bool isRemote()
  {
    return getIsRemote();
  }

  /**
      Get `resourceBasePath` property.
      Returns: The base resource path for the application.
  */
  @property string resourceBasePath()
  {
    return getResourceBasePath();
  }

  /**
      Set `resourceBasePath` property.
      Params:
        propval = The base resource path for the application.
  */
  @property void resourceBasePath(string propval)
  {
    return setResourceBasePath(propval);
  }

  /**
      Get `version_` property.
      Returns: The human-readable version number of the application.
  */
  @property string version_()
  {
    return getVersion();
  }

  /**
      Set `version_` property.
      Params:
        propval = The human-readable version number of the application.
  */
  @property void version_(string propval)
  {
    return setVersion(propval);
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new #GApplication instance.
      
      If non-null, the application id must be valid.  See
      [gio.application.Application.idIsValid].
      
      If no application ID is given then some features of #GApplication
      (most notably application uniqueness) will be disabled.
  
      Params:
        applicationId = the application id
        flags = the application flags
      Returns: a new #GApplication instance
  */
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    GApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = g_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the default #GApplication instance for this process.
      
      Normally there is only one #GApplication per process and it becomes
      the default when it is created.  You can exercise more control over
      this by using [gio.application.Application.setDefault].
      
      If there is no default application then null is returned.
      Returns: the default application for this process, or null
  */
  static gio.application.Application getDefault()
  {
    GApplication* _cretval;
    _cretval = g_application_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.application.Application)(cast(GApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if application_id is a valid application identifier.
      
      A valid ID is required for calls to [gio.application.Application.new_] and
      [gio.application.Application.setApplicationId].
      
      Application identifiers follow the same format as
      [D-Bus well-known bus names](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
      For convenience, the restrictions on application identifiers are
      reproduced here:
      
      $(LIST
        * Application identifiers are composed of 1 or more elements separated by a
          period (`.`) character. All elements must contain at least one character.
        
        * Each element must only contain the ASCII characters `[A-Z][a-z][0-9]_-`,
          with `-` discouraged in new application identifiers. Each element must not
          begin with a digit.
        
        * Application identifiers must contain at least one `.` (period) character
          (and thus at least two elements).
        
        * Application identifiers must not begin with a `.` (period) character.
        
        * Application identifiers must not exceed 255 characters.
      )
        
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
  static bool idIsValid(string applicationId)
  {
    bool _retval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _retval = cast(bool)g_application_id_is_valid(_applicationId);
    return _retval;
  }

  /**
      Activates the application.
      
      In essence, this results in the #GApplication::activate signal being
      emitted in the primary instance.
      
      The application must be registered before calling this function.
  */
  void activate()
  {
    g_application_activate(cast(GApplication*)this._cPtr);
  }

  /**
      Add an option to be handled by application.
      
      Calling this function is the equivalent of calling
      [gio.application.Application.addMainOptionEntries] with a single #GOptionEntry
      that has its arg_data member set to null.
      
      The parsed arguments will be packed into a #GVariantDict which
      is passed to #GApplication::handle-local-options. If
      [gio.types.ApplicationFlags.HandlesCommandLine] is set, then it will also
      be sent to the primary instance. See
      [gio.application.Application.addMainOptionEntries] for more details.
      
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
  void addMainOption(string longName, char shortName, glib.types.OptionFlags flags, glib.types.OptionArg arg, string description, string argDescription = null)
  {
    const(char)* _longName = longName.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _argDescription = argDescription.toCString(No.Alloc);
    g_application_add_main_option(cast(GApplication*)this._cPtr, _longName, shortName, flags, arg, _description, _argDescription);
  }

  /**
      Adds main option entries to be handled by application.
      
      This function is comparable to [glib.option_context.OptionContext.addMainEntries].
      
      After the commandline arguments are parsed, the
      #GApplication::handle-local-options signal will be emitted.  At this
      point, the application can inspect the values pointed to by arg_data
      in the given #GOptionEntrys.
      
      Unlike #GOptionContext, #GApplication supports giving a null
      arg_data for a non-callback #GOptionEntry.  This results in the
      argument in question being packed into a #GVariantDict which is also
      passed to #GApplication::handle-local-options, where it can be
      inspected and modified.  If [gio.types.ApplicationFlags.HandlesCommandLine] is
      set, then the resulting dictionary is sent to the primary instance,
      where [gio.application_command_line.ApplicationCommandLine.getOptionsDict] will return it.
      As it has been passed outside the process at this point, the types of all
      values in the options dict must be checked before being used.
      This "packing" is done according to the type of the argument --
      booleans for normal flags, strings for strings, bytestrings for
      filenames, etc.  The packing only occurs if the flag is given (ie: we
      do not pack a "false" #GVariant in the case that a flag is missing).
      
      In general, it is recommended that all commandline arguments are
      parsed locally.  The options dictionary should then be used to
      transmit the result of the parsing to the primary instance, where
      [glib.variant_dict.VariantDict.lookup] can be used.  For local options, it is
      possible to either use arg_data in the usual way, or to consult (and
      potentially remove) the option from the options dictionary.
      
      This function is new in GLib 2.40.  Before then, the only real choice
      was to send all of the commandline arguments (options and all) to the
      primary instance for handling.  #GApplication ignored them completely
      on the local side.  Calling this function "opts in" to the new
      behaviour, and in particular, means that unrecognised options will be
      treated as errors.  Unrecognised options have never been ignored when
      [gio.types.ApplicationFlags.HandlesCommandLine] is unset.
      
      If #GApplication::handle-local-options needs to see the list of
      filenames, then the use of `G_OPTION_REMAINING` is recommended.  If
      arg_data is null then `G_OPTION_REMAINING` can be used as a key into
      the options dictionary.  If you do use `G_OPTION_REMAINING` then you
      need to handle these arguments for yourself because once they are
      consumed, they will no longer be visible to the default handling
      (which treats them as filenames to be opened).
      
      It is important to use the proper GVariant format when retrieving
      the options with [glib.variant_dict.VariantDict.lookup]:
      $(LIST
        * for `G_OPTION_ARG_NONE`, use `b`
        * for `G_OPTION_ARG_STRING`, use `&s`
        * for `G_OPTION_ARG_INT`, use `i`
        * for `G_OPTION_ARG_INT64`, use `x`
        * for `G_OPTION_ARG_DOUBLE`, use `d`
        * for `G_OPTION_ARG_FILENAME`, use `^&ay`
        * for `G_OPTION_ARG_STRING_ARRAY`, use `^a&s`
        * for `G_OPTION_ARG_FILENAME_ARRAY`, use `^a&ay`
      )
  
      Params:
        entries = the
            main options for the application
  */
  void addMainOptionEntries(glib.types.OptionEntry[] entries)
  {
    auto _entries = cast(const(GOptionEntry)*)(entries ~ GOptionEntry.init).ptr;
    g_application_add_main_option_entries(cast(GApplication*)this._cPtr, _entries);
  }

  /**
      Adds a #GOptionGroup to the commandline handling of application.
      
      This function is comparable to [glib.option_context.OptionContext.addGroup].
      
      Unlike [gio.application.Application.addMainOptionEntries], this function does
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
      new functionality whereby unrecognised options are rejected even if
      [gio.types.ApplicationFlags.HandlesCommandLine] was given.
  
      Params:
        group = a #GOptionGroup
  */
  void addOptionGroup(glib.option_group.OptionGroup group)
  {
    g_application_add_option_group(cast(GApplication*)this._cPtr, group ? cast(GOptionGroup*)group._cPtr(Yes.Dup) : null);
  }

  /**
      Marks application as busy (see [gio.application.Application.markBusy]) while
      property on object is true.
      
      The binding holds a reference to application while it is active, but
      not to object. Instead, the binding is destroyed when object is
      finalized.
  
      Params:
        object = a #GObject
        property = the name of a boolean property of object
  */
  void bindBusyProperty(gobject.object.ObjectWrap object, string property)
  {
    const(char)* _property = property.toCString(No.Alloc);
    g_application_bind_busy_property(cast(GApplication*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property);
  }

  /**
      Gets the unique identifier for application.
      Returns: the identifier for application, owned by application
  */
  string getApplicationId()
  {
    const(char)* _cretval;
    _cretval = g_application_get_application_id(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
      registered.  See [gio.application.Application.getIsRegistered].
      Returns: a #GDBusConnection, or null
  */
  gio.dbus_connection.DBusConnection getDbusConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_application_get_dbus_connection(cast(GApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
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
      registered.  See [gio.application.Application.getIsRegistered].
      Returns: the object path, or null
  */
  string getDbusObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_application_get_dbus_object_path(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the flags for application.
      
      See #GApplicationFlags.
      Returns: the flags for application
  */
  gio.types.ApplicationFlags getFlags()
  {
    GApplicationFlags _cretval;
    _cretval = g_application_get_flags(cast(GApplication*)this._cPtr);
    gio.types.ApplicationFlags _retval = cast(gio.types.ApplicationFlags)_cretval;
    return _retval;
  }

  /**
      Gets the current inactivity timeout for the application.
      
      This is the amount of time (in milliseconds) after the last call to
      [gio.application.Application.release] before the application stops running.
      Returns: the timeout, in milliseconds
  */
  uint getInactivityTimeout()
  {
    uint _retval;
    _retval = g_application_get_inactivity_timeout(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Gets the application's current busy state, as set through
      [gio.application.Application.markBusy] or [gio.application.Application.bindBusyProperty].
      Returns: true if application is currently marked as busy
  */
  bool getIsBusy()
  {
    bool _retval;
    _retval = cast(bool)g_application_get_is_busy(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Checks if application is registered.
      
      An application is registered if [gio.application.Application.register] has been
      successfully called.
      Returns: true if application is registered
  */
  bool getIsRegistered()
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
      [gio.application.Application.register] has been called.  See
      [gio.application.Application.getIsRegistered].
      Returns: true if application is remote
  */
  bool getIsRemote()
  {
    bool _retval;
    _retval = cast(bool)g_application_get_is_remote(cast(GApplication*)this._cPtr);
    return _retval;
  }

  /**
      Gets the resource base path of application.
      
      See [gio.application.Application.setResourceBasePath] for more information.
      Returns: the base resource path, if one is set
  */
  string getResourceBasePath()
  {
    const(char)* _cretval;
    _cretval = g_application_get_resource_base_path(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the version of application.
      Returns: the version of application
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = g_application_get_version(cast(GApplication*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Increases the use count of application.
      
      Use this function to indicate that the application has a reason to
      continue to run.  For example, [gio.application.Application.hold] is called by GTK
      when a toplevel window is on the screen.
      
      To cancel the hold, call [gio.application.Application.release].
  */
  void hold()
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
      
      To cancel the busy indication, use [gio.application.Application.unmarkBusy].
      
      The application must be registered before calling this function.
  */
  void markBusy()
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
      and it must have the [gio.types.ApplicationFlags.HandlesOpen] flag set.
  
      Params:
        files = an array of #GFiles to open
        hint = a hint (or ""), but never null
  */
  void open(gio.file.File[] files, string hint)
  {
    int _nFiles;
    if (files)
      _nFiles = cast(int)files.length;

    GFile*[] _tmpfiles;
    foreach (obj; files)
      _tmpfiles ~= obj ? cast(GFile*)(cast(gobject.object.ObjectWrap)obj)._cPtr : null;
    GFile** _files = _tmpfiles.ptr;

    const(char)* _hint = hint.toCString(No.Alloc);
    g_application_open(cast(GApplication*)this._cPtr, _files, _nFiles, _hint);
  }

  /**
      Immediately quits the application.
      
      Upon return to the mainloop, [gio.application.Application.run] will return,
      calling only the 'shutdown' function before doing so.
      
      The hold count is ignored.
      Take care if your code has called [gio.application.Application.hold] on the application and
      is therefore still expecting it to exist.
      (Note that you may have called [gio.application.Application.hold] indirectly, for example
      through [gtk.application.Application.addWindow].)
      
      The result of calling [gio.application.Application.run] again after it returns is
      unspecified.
  */
  void quit()
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
      
      If there is no application ID or if [gio.types.ApplicationFlags.NonUnique] was
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
      [gio.application.Application.getIsRemote] for that.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if registration succeeded
      Throws: [ErrorWrap]
  */
  bool register(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_application_register(cast(GApplication*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Decrease the use count of application.
      
      When the use count reaches zero, the application will stop running.
      
      Never call this function except to cancel the effect of a previous
      call to [gio.application.Application.hold].
  */
  void release()
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
      [gio.application.Application.addMainOptionEntries].  After this, the
      #GApplication::handle-local-options signal is emitted, from which the
      application can inspect the values of its #GOptionEntrys.
      
      #GApplication::handle-local-options is a good place to handle options
      such as `--version`, where an immediate reply from the local process is
      desired (instead of communicating with an already-running instance).
      A #GApplication::handle-local-options handler can stop further processing
      by returning a non-negative value, which then becomes the exit status of
      the process.
      
      What happens next depends on the flags: if
      [gio.types.ApplicationFlags.HandlesCommandLine] was specified then the remaining
      commandline arguments are sent to the primary instance, where a
      #GApplication::command-line signal is emitted.  Otherwise, the
      remaining commandline arguments are assumed to be a list of files.
      If there are no files listed, the application is activated via the
      #GApplication::activate signal.  If there are one or more files, and
      [gio.types.ApplicationFlags.HandlesOpen] was specified then the files are opened
      via the #GApplication::open signal.
      
      If you are interested in doing more complicated local handling of the
      commandline then you should implement your own #GApplication subclass
      and override local_command_line(). In this case, you most likely want
      to return true from your local_command_line() implementation to
      suppress the default handling. See
      [gapplication-example-cmdline2.c][https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c]
      for an example.
      
      If, after the above is done, the use count of the application is zero
      then the exit status is returned immediately.  If the use count is
      non-zero then the default main context is iterated until the use count
      falls to zero, at which point 0 is returned.
      
      If the [gio.types.ApplicationFlags.IsService] flag is set, then the service will
      run for as much as 10 seconds with a use count of zero while waiting
      for the message that caused the activation to arrive.  After that,
      if the use count falls to zero the application will exit immediately,
      except in the case that [gio.application.Application.setInactivityTimeout] is in
      use.
      
      This function sets the prgname ([glib.global.setPrgname]), if not already set,
      to the basename of argv[0].
      
      Much like [glib.main_loop.MainLoop.run], this function will acquire the main context
      for the duration that the application is running.
      
      Since 2.40, applications that are not explicitly flagged as services
      or launchers (ie: neither [gio.types.ApplicationFlags.IsService] or
      [gio.types.ApplicationFlags.IsLauncher] are given as flags) will check (from the
      default handler for local_command_line) if "--gapplication-service"
      was given in the command line.  If this flag is present then normal
      commandline processing is interrupted and the
      [gio.types.ApplicationFlags.IsService] flag is set.  This provides a "compromise"
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
  int run(string[] argv = null)
  {
    int _retval;
    int _argc;
    if (argv)
      _argc = cast(int)argv.length;

    char*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    char** _argv = _tmpargv.ptr;
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
      
      id may be null, but it is impossible to replace or withdraw
      notifications without an id.
      
      If notification is no longer relevant, it can be withdrawn with
      [gio.application.Application.withdrawNotification].
      
      It is an error to call this function if application has no
      application ID.
  
      Params:
        id = id of the notification, or null
        notification = the #GNotification to send
  */
  void sendNotification(string id, gio.notification.Notification notification)
  {
    const(char)* _id = id.toCString(No.Alloc);
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
  void setActionGroup(gio.action_group.ActionGroup actionGroup = null)
  {
    g_application_set_action_group(cast(GApplication*)this._cPtr, actionGroup ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)actionGroup)._cPtr(No.Dup) : null);
  }

  /**
      Sets the unique identifier for application.
      
      The application id can only be modified if application has not yet
      been registered.
      
      If non-null, the application id must be valid.  See
      [gio.application.Application.idIsValid].
  
      Params:
        applicationId = the identifier for application
  */
  void setApplicationId(string applicationId = null)
  {
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    g_application_set_application_id(cast(GApplication*)this._cPtr, _applicationId);
  }

  /**
      Sets or unsets the default application for the process, as returned
      by [gio.application.Application.getDefault].
      
      This function does not take its own reference on application.  If
      application is destroyed then the default application will revert
      back to null.
  */
  void setDefault()
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
  void setFlags(gio.types.ApplicationFlags flags)
  {
    g_application_set_flags(cast(GApplication*)this._cPtr, flags);
  }

  /**
      Sets the current inactivity timeout for the application.
      
      This is the amount of time (in milliseconds) after the last call to
      [gio.application.Application.release] before the application stops running.
      
      This call has no side effects of its own.  The value set here is only
      used for next time [gio.application.Application.release] drops the use count to
      zero.  Any timeouts currently in progress are not impacted.
  
      Params:
        inactivityTimeout = the timeout, in milliseconds
  */
  void setInactivityTimeout(uint inactivityTimeout)
  {
    g_application_set_inactivity_timeout(cast(GApplication*)this._cPtr, inactivityTimeout);
  }

  /**
      Adds a description to the application option context.
      
      See [glib.option_context.OptionContext.setDescription] for more information.
  
      Params:
        description = a string to be shown in `--help` output
           after the list of options, or null
  */
  void setOptionContextDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
    g_application_set_option_context_description(cast(GApplication*)this._cPtr, _description);
  }

  /**
      Sets the parameter string to be used by the commandline handling of application.
      
      This function registers the argument to be passed to [glib.option_context.OptionContext.new_]
      when the internal #GOptionContext of application is created.
      
      See [glib.option_context.OptionContext.new_] for more information about parameter_string.
  
      Params:
        parameterString = a string which is displayed
            in the first line of `--help` output, after the usage summary `programname [OPTION...]`.
  */
  void setOptionContextParameterString(string parameterString = null)
  {
    const(char)* _parameterString = parameterString.toCString(No.Alloc);
    g_application_set_option_context_parameter_string(cast(GApplication*)this._cPtr, _parameterString);
  }

  /**
      Adds a summary to the application option context.
      
      See [glib.option_context.OptionContext.setSummary] for more information.
  
      Params:
        summary = a string to be shown in `--help` output
           before the list of options, or null
  */
  void setOptionContextSummary(string summary = null)
  {
    const(char)* _summary = summary.toCString(No.Alloc);
    g_application_set_option_context_summary(cast(GApplication*)this._cPtr, _summary);
  }

  /**
      Sets (or unsets) the base resource path of application.
      
      The path is used to automatically load various [application
      resources][gresource] such as menu layouts and action descriptions.
      The various types of resources will be found at fixed names relative
      to the given base path.
      
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
  void setResourceBasePath(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
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
  void setVersion(string version_)
  {
    const(char)* _version_ = version_.toCString(No.Alloc);
    g_application_set_version(cast(GApplication*)this._cPtr, _version_);
  }

  /**
      Destroys a binding between property and the busy state of
      application that was previously created with
      [gio.application.Application.bindBusyProperty].
  
      Params:
        object = a #GObject
        property = the name of a boolean property of object
  */
  void unbindBusyProperty(gobject.object.ObjectWrap object, string property)
  {
    const(char)* _property = property.toCString(No.Alloc);
    g_application_unbind_busy_property(cast(GApplication*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property);
  }

  /**
      Decreases the busy count of application.
      
      When the busy count reaches zero, the new state will be propagated
      to other processes.
      
      This function must only be called to cancel the effect of a previous
      call to [gio.application.Application.markBusy].
  */
  void unmarkBusy()
  {
    g_application_unmark_busy(cast(GApplication*)this._cPtr);
  }

  /**
      Withdraws a notification that was sent with
      [gio.application.Application.sendNotification].
      
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
  void withdrawNotification(string id)
  {
    const(char)* _id = id.toCString(No.Alloc);
    g_application_withdraw_notification(cast(GApplication*)this._cPtr, _id);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal is emitted on the primary instance when an
      activation occurs. See [gio.application.Application.activate].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.application.Application application))
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `CommandLine` signal.
  
      The ::command-line signal is emitted on the primary instance when
      a commandline is not handled locally. See [gio.application.Application.run] and
      the #GApplicationCommandLine documentation for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D int callback(gio.application_command_line.ApplicationCommandLine commandLine, gio.application.Application application))
  
          `commandLine` a #GApplicationCommandLine representing the
              passed commandline (optional)
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` An integer that is set as the exit status for the calling
            process. See [gio.application_command_line.ApplicationCommandLine.setExitStatus].
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCommandLine(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application_command_line.ApplicationCommandLine)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
      parsing using [gio.application.Application.addMainOptionEntries] and
      [gio.application.Application.addOptionGroup].
      
      Signal handlers can inspect options (along with values pointed to
      from the arg_data of an installed #GOptionEntrys) in order to
      decide to perform certain actions, including direct local handling
      (which may be useful for options like --version).
      
      In the event that the application is marked
      [gio.types.ApplicationFlags.HandlesCommandLine] the "normal processing" will
      send the options dictionary to the primary instance where it can be
      read with [gio.application_command_line.ApplicationCommandLine.getOptionsDict].  The signal
      handler can modify the dictionary before returning, and the
      modified dictionary will be sent.
      
      In the event that [gio.types.ApplicationFlags.HandlesCommandLine] is not set,
      "normal processing" will treat the remaining uncollected command
      line arguments as filenames or URIs.  If there are no arguments,
      the application is activated by [gio.application.Application.activate].  One or
      more arguments results in a call to [gio.application.Application.open].
      
      If you want to handle the local commandline arguments for yourself
      by converting them to calls to [gio.application.Application.open] or
      [gio.action_group.ActionGroup.activateAction] then you must be sure to register
      the application first.  You should probably not call
      [gio.application.Application.activate] for yourself, however: just return -1 and
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
  
          $(D int callback(glib.variant_dict.VariantDict options, gio.application.Application application))
  
          `options` the options dictionary (optional)
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` an exit code. If you have handled your options and want
          to exit the process, return a non-negative option, 0 for success,
          and a positive value for failure. To continue, return -1 to let
          the default option processing continue.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHandleLocalOptions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.variant_dict.VariantDict)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.application.Application)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(int)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("handle-local-options", closure, after);
  }

  /**
      Connect to `NameLost` signal.
  
      The ::name-lost signal is emitted only on the registered primary instance
      when a new instance has taken over. This can only happen if the application
      is using the [gio.types.ApplicationFlags.AllowReplacement] flag.
      
      The default handler for this signal calls [gio.application.Application.quit].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.application.Application application))
  
          `application` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNameLost(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("name-lost", closure, after);
  }

  /**
      Connect to `Open` signal.
  
      The ::open signal is emitted on the primary instance when there are
      files to open. See [gio.application.Application.open] for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.file.File[] files, string hint, gio.application.Application application))
  
          `files` an array of #GFiles (optional)
  
          `hint` a hint provided by the calling instance (optional)
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOpen(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.file.File[])))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.application.Application)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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
        gio.file.File[] _dArray;
        foreach (i; 0 .. nFiles)
          _dArray ~= gobject.object.ObjectWrap._getDObject!(gio.file.File)(_cArray[i], No.Take);
        _paramTuple[0] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gio.application.Application application))
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShutdown(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("shutdown", closure, after);
  }

  /**
      Connect to `Startup` signal.
  
      The ::startup signal is emitted on the primary instance immediately
      after registration. See [gio.application.Application.register].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.application.Application application))
  
          `application` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStartup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.application.Application)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("startup", closure, after);
  }
}
