/// Module for [Settings] class
module gio.settings;

import gid.gid;
import gio.action;
import gio.c.functions;
import gio.c.types;
import gio.settings_backend;
import gio.settings_schema;
import gio.types;
import glib.types;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
    The [gio.settings.Settings] class provides a convenient API for storing and retrieving
    application settings.
    
    Reads and writes can be considered to be non-blocking.  Reading
    settings with [gio.settings.Settings] is typically extremely fast: on
    approximately the same order of magnitude (but slower than) a
    [glib.hash_table.HashTable] lookup.  Writing settings is also extremely fast in
    terms of time to return to your application, but can be extremely expensive
    for other threads and other processes.  Many settings backends
    (including dconf) have lazy initialisation which means in the common
    case of the user using their computer without modifying any settings
    a lot of work can be avoided.  For dconf, the D-Bus service doesn’t
    even need to be started in this case.  For this reason, you should
    only ever modify [gio.settings.Settings] keys in response to explicit user action.
    Particular care should be paid to ensure that modifications are not
    made during startup — for example, when setting the initial value
    of preferences widgets.  The built-in [gio.settings.Settings.bind]
    functionality is careful not to write settings in response to notify signals
    as a result of modifications that it makes to widgets.
    
    When creating a [gio.settings.Settings] instance, you have to specify a schema
    that describes the keys in your settings and their types and default
    values, as well as some other information.
    
    Normally, a schema has a fixed path that determines where the settings
    are stored in the conceptual global tree of settings. However, schemas
    can also be ‘[relocatable](#relocatable-schemas)’, i.e. not equipped with
    a fixed path. This is
    useful e.g. when the schema describes an ‘account’, and you want to be
    able to store a arbitrary number of accounts.
    
    Paths must start with and end with a forward slash character (`/`)
    and must not contain two sequential slash characters.  Paths should
    be chosen based on a domain name associated with the program or
    library to which the settings belong.  Examples of paths are
    `/org/gtk/settings/file-chooser/` and `/ca/desrt/dconf-editor/`.
    Paths should not start with `/apps/`, `/desktop/` or `/system/` as
    they often did in GConf.
    
    Unlike other configuration systems (like GConf), GSettings does not
    restrict keys to basic types like strings and numbers. GSettings stores
    values as [glib.variant.Variant], and allows any [glib.variant_type.VariantType] for
    keys. Key names are restricted to lowercase characters, numbers and `-`.
    Furthermore, the names must begin with a lowercase character, must not end
    with a `-`, and must not contain consecutive dashes.
    
    Similar to GConf, the default values in GSettings schemas can be
    localized, but the localized values are stored in gettext catalogs
    and looked up with the domain that is specified in the
    `gettext-domain` attribute of the `<schemalist>` or `<schema>`
    elements and the category that is specified in the `l10n` attribute of
    the `<default>` element. The string which is translated includes all text in
    the `<default>` element, including any surrounding quotation marks.
    
    The `l10n` attribute must be set to `messages` or `time`, and sets the
    [locale category for
    translation](https://www.gnu.org/software/gettext/manual/html_node/Aspects.html#index-locale-categories-1).
    The `messages` category should be used by default; use `time` for
    translatable date or time formats. A translation comment can be added as an
    XML comment immediately above the `<default>` element — it is recommended to
    add these comments to aid translators understand the meaning and
    implications of the default value. An optional translation `context`
    attribute can be set on the `<default>` element to disambiguate multiple
    defaults which use the same string.
    
    For example:
    ```xml
     <!-- Translators: A list of words which are not allowed to be typed, in
          GVariant serialization syntax.
          See: https://developer.gnome.org/glib/stable/gvariant-text.html -->
     <default l10n='messages' context='Banned words'>['bad', 'words']</default>
    ```
    
    Translations of default values must remain syntactically valid serialized
    [glib.variant.Variant]s (e.g. retaining any surrounding quotation marks) or
    runtime errors will occur.
    
    GSettings uses schemas in a compact binary form that is created
    by the [`glib-compile-schemas`](glib-compile-schemas.html)
    utility. The input is a schema description in an XML format.
    
    A DTD for the gschema XML format can be found here:
    [gschema.dtd](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/gschema.dtd)
    
    The [`glib-compile-schemas`](glib-compile-schemas.html) tool expects schema
    files to have the extension `.gschema.xml`.
    
    At runtime, schemas are identified by their ID (as specified in the
    `id` attribute of the `<schema>` element). The convention for schema
    IDs is to use a dotted name, similar in style to a D-Bus bus name,
    e.g. `org.gnome.SessionManager`. In particular, if the settings are
    for a specific service that owns a D-Bus bus name, the D-Bus bus name
    and schema ID should match. For schemas which deal with settings not
    associated with one named application, the ID should not use
    StudlyCaps, e.g. `org.gnome.font-rendering`.
    
    In addition to [glib.variant.Variant] types, keys can have types that have
    enumerated types. These can be described by a `<choice>`,
    `<enum>` or `<flags>` element, as seen in the
    second example below. The underlying type of such a key
    is string, but you can use [gio.settings.Settings.getEnum],
    [gio.settings.Settings.setEnum], [gio.settings.Settings.getFlags],
    [gio.settings.Settings.setFlags] access the numeric values corresponding to
    the string value of enum and flags keys.
    
    An example for default value:
    ```xml
    <schemalist>
      <schema id="org.gtk.Test" path="/org/gtk/Test/" gettext-domain="test">
    
        <key name="greeting" type="s">
          <default l10n="messages">"Hello, earthlings"</default>
          <summary>A greeting</summary>
          <description>
            Greeting of the invading martians
          </description>
        </key>
    
        <key name="box" type="(ii)">
          <default>(20,30)</default>
        </key>
    
        <key name="empty-string" type="s">
          <default>""</default>
          <summary>Empty strings have to be provided in GVariant form</summary>
        </key>
    
      </schema>
    </schemalist>
    ```
    
    An example for ranges, choices and enumerated types:
    ```xml
    <schemalist>
    
      <enum id="org.gtk.Test.myenum">
        <value nick="first" value="1"/>
        <value nick="second" value="2"/>
      </enum>
    
      <flags id="org.gtk.Test.myflags">
        <value nick="flag1" value="1"/>
        <value nick="flag2" value="2"/>
        <value nick="flag3" value="4"/>
      </flags>
    
      <schema id="org.gtk.Test">
    
        <key name="key-with-range" type="i">
          <range min="1" max="100"/>
          <default>10</default>
        </key>
    
        <key name="key-with-choices" type="s">
          <choices>
            <choice value='Elisabeth'/>
            <choice value='Annabeth'/>
            <choice value='Joe'/>
          </choices>
          <aliases>
            <alias value='Anna' target='Annabeth'/>
            <alias value='Beth' target='Elisabeth'/>
          </aliases>
          <default>'Joe'</default>
        </key>
    
        <key name='enumerated-key' enum='org.gtk.Test.myenum'>
          <default>'first'</default>
        </key>
    
        <key name='flags-key' flags='org.gtk.Test.myflags'>
          <default>["flag1","flag2"]</default>
        </key>
      </schema>
    </schemalist>
    ```
    
    ## Vendor overrides
    
    Default values are defined in the schemas that get installed by
    an application. Sometimes, it is necessary for a vendor or distributor
    to adjust these defaults. Since patching the XML source for the schema
    is inconvenient and error-prone,
    [`glib-compile-schemas`](glib-compile-schemas.html) reads so-called ‘vendor
    override’ files. These are keyfiles in the same directory as the XML
    schema sources which can override default values. The schema ID serves
    as the group name in the key file, and the values are expected in
    serialized [glib.variant.Variant] form, as in the following example:
    ```
    [org.gtk.Example]
    key1='string'
    key2=1.5
    ```
    
    `glib-compile-schemas` expects schema files to have the extension
    `.gschema.override`.
    
    ## Binding
    
    A very convenient feature of GSettings lets you bind [gobject.object.ObjectWrap]
    properties directly to settings, using [gio.settings.Settings.bind]. Once a
    [gobject.object.ObjectWrap] property has been bound to a setting, changes on
    either side are automatically propagated to the other side. GSettings handles
    details like mapping between [gobject.object.ObjectWrap] and [glib.variant.Variant]
    types, and preventing infinite cycles.
    
    This makes it very easy to hook up a preferences dialog to the
    underlying settings. To make this even more convenient, GSettings
    looks for a boolean property with the name `sensitivity` and
    automatically binds it to the writability of the bound setting.
    If this ‘magic’ gets in the way, it can be suppressed with the
    [gio.types.SettingsBindFlags.NoSensitivity] flag.
    
    ## Relocatable schemas
    
    A relocatable schema is one with no `path` attribute specified on its
    `<schema>` element. By using [gio.settings.Settings.newWithPath], a [gio.settings.Settings]
    object can be instantiated for a relocatable schema, assigning a path to the
    instance. Paths passed to [gio.settings.Settings.newWithPath] will typically be
    constructed dynamically from a constant prefix plus some form of instance
    identifier; but they must still be valid GSettings paths. Paths could also
    be constant and used with a globally installed schema originating from a
    dependency library.
    
    For example, a relocatable schema could be used to store geometry information
    for different windows in an application. If the schema ID was
    `org.foo.MyApp.Window`, it could be instantiated for paths
    `/org/foo/MyApp/main/`, `/org/foo/MyApp/document-1/`,
    `/org/foo/MyApp/document-2/`, etc. If any of the paths are well-known
    they can be specified as `<child>` elements in the parent schema, e.g.:
    ```xml
    <schema id="org.foo.MyApp" path="/org/foo/MyApp/">
      <child name="main" schema="org.foo.MyApp.Window"/>
    </schema>
    ```
    
    ## Build system integration
    
    GSettings comes with autotools integration to simplify compiling and
    installing schemas. To add GSettings support to an application, add the
    following to your `configure.ac`:
    ```
    GLIB_GSETTINGS
    ```
    
    In the appropriate `Makefile.am`, use the following snippet to compile and
    install the named schema:
    ```
    gsettings_SCHEMAS = org.foo.MyApp.gschema.xml
    EXTRA_DIST = $(gsettings_SCHEMAS)
    
    @GSETTINGS_RULES@
    ```
    
    No changes are needed to the build system to mark a schema XML file for
    translation. Assuming it sets the `gettext-domain` attribute, a schema may
    be marked for translation by adding it to `POTFILES.in`, assuming gettext
    0.19 is in use (the preferred method for translation):
    ```
    data/org.foo.MyApp.gschema.xml
    ```
    
    Alternatively, if intltool 0.50.1 is in use:
    ```
    [type: gettext/gsettings]data/org.foo.MyApp.gschema.xml
    ```
    
    GSettings will use gettext to look up translations for the `<summary>` and
    `<description>` elements, and also any `<default>` elements which have a
    `l10n` attribute set. Translations must not be included in the `.gschema.xml`
    file by the build system, for example by using intltool XML rules with a
    `.gschema.xml.in` template.
    
    If an enumerated type defined in a C header file is to be used in a GSettings
    schema, it can either be defined manually using an `<enum>` element in the
    schema XML, or it can be extracted automatically from the C header. This
    approach is preferred, as it ensures the two representations are always
    synchronised. To do so, add the following to the relevant `Makefile.am`:
    ```
    gsettings_ENUM_NAMESPACE = org.foo.MyApp
    gsettings_ENUM_FILES = my-app-enums.h my-app-misc.h
    ```
    
    `gsettings_ENUM_NAMESPACE` specifies the schema namespace for the enum files,
    which are specified in `gsettings_ENUM_FILES`. This will generate a
    `org.foo.MyApp.enums.xml` file containing the extracted enums, which will be
    automatically included in the schema compilation, install and uninstall
    rules. It should not be committed to version control or included in
    `EXTRA_DIST`.
*/
class Settings : gobject.object.ObjectWrap
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
    return cast(void function())g_settings_get_type != &gidSymbolNotFound ? g_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self()
  {
    return this;
  }

  /**
      Get `delayApply` property.
      Returns: Whether the #GSettings object is in 'delay-apply' mode. See
        [gio.settings.Settings.delay] for details.
  */
  @property bool delayApply()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("delay-apply");
  }

  /**
      Get `hasUnapplied` property.
      Returns: If this property is true, the #GSettings object has outstanding
        changes that will be applied when [gio.settings.Settings.apply] is called.
  */
  @property bool hasUnapplied()
  {
    return getHasUnapplied();
  }

  /**
      Creates a new #GSettings object with the schema specified by
      schema_id.
      
      It is an error for the schema to not exist: schemas are an
      essential part of a program, as they provide type information.
      If schemas need to be dynamically loaded (for example, from an
      optional runtime dependency), [gio.settings_schema_source.SettingsSchemaSource.lookup]
      can be used to test for their existence before loading them.
      
      Signals on the newly created #GSettings object will be dispatched
      via the thread-default #GMainContext in effect at the time of the
      call to [gio.settings.Settings.new_].  The new #GSettings will hold a reference
      on the context.  See [glib.main_context.MainContext.pushThreadDefault].
  
      Params:
        schemaId = the id of the schema
      Returns: a new #GSettings object
  */
  this(string schemaId)
  {
    GSettings* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    _cretval = g_settings_new(_schemaId);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GSettings object with a given schema, backend and
      path.
      
      It should be extremely rare that you ever want to use this function.
      It is made available for advanced use-cases (such as plugin systems
      that want to provide access to schemas loaded from custom locations,
      etc).
      
      At the most basic level, a #GSettings object is a pure composition of
      4 things: a #GSettingsSchema, a #GSettingsBackend, a path within that
      backend, and a #GMainContext to which signals are dispatched.
      
      This constructor therefore gives you full control over constructing
      #GSettings instances.  The first 3 parameters are given directly as
      schema, backend and path, and the main context is taken from the
      thread-default (as per [gio.settings.Settings.new_]).
      
      If backend is null then the default backend is used.
      
      If path is null then the path from the schema is used.  It is an
      error if path is null and the schema has no path of its own or if
      path is non-null and not equal to the path that the schema does
      have.
  
      Params:
        schema = a #GSettingsSchema
        backend = a #GSettingsBackend
        path = the path to use
      Returns: a new #GSettings object
  */
  static gio.settings.Settings newFull(gio.settings_schema.SettingsSchema schema, gio.settings_backend.SettingsBackend backend = null, string path = null)
  {
    GSettings* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_settings_new_full(schema ? cast(GSettingsSchema*)schema._cPtr(No.Dup) : null, backend ? cast(GSettingsBackend*)backend._cPtr(No.Dup) : null, _path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings.Settings)(cast(GSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GSettings object with the schema specified by
      schema_id and a given #GSettingsBackend.
      
      Creating a #GSettings object with a different backend allows accessing
      settings from a database other than the usual one. For example, it may make
      sense to pass a backend corresponding to the "defaults" settings database on
      the system to get a settings object that modifies the system default
      settings instead of the settings for this user.
  
      Params:
        schemaId = the id of the schema
        backend = the #GSettingsBackend to use
      Returns: a new #GSettings object
  */
  static gio.settings.Settings newWithBackend(string schemaId, gio.settings_backend.SettingsBackend backend)
  {
    GSettings* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    _cretval = g_settings_new_with_backend(_schemaId, backend ? cast(GSettingsBackend*)backend._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings.Settings)(cast(GSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GSettings object with the schema specified by
      schema_id and a given #GSettingsBackend and path.
      
      This is a mix of [gio.settings.Settings.newWithBackend] and
      [gio.settings.Settings.newWithPath].
  
      Params:
        schemaId = the id of the schema
        backend = the #GSettingsBackend to use
        path = the path to use
      Returns: a new #GSettings object
  */
  static gio.settings.Settings newWithBackendAndPath(string schemaId, gio.settings_backend.SettingsBackend backend, string path)
  {
    GSettings* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_settings_new_with_backend_and_path(_schemaId, backend ? cast(GSettingsBackend*)backend._cPtr(No.Dup) : null, _path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings.Settings)(cast(GSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GSettings object with the relocatable schema specified
      by schema_id and a given path.
      
      You only need to do this if you want to directly create a settings
      object with a schema that doesn't have a specified path of its own.
      That's quite rare.
      
      It is a programmer error to call this function for a schema that
      has an explicitly specified path.
      
      It is a programmer error if path is not a valid path.  A valid path
      begins and ends with '/' and does not contain two consecutive '/'
      characters.
  
      Params:
        schemaId = the id of the schema
        path = the path to use
      Returns: a new #GSettings object
  */
  static gio.settings.Settings newWithPath(string schemaId, string path)
  {
    GSettings* _cretval;
    const(char)* _schemaId = schemaId.toCString(No.Alloc);
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_settings_new_with_path(_schemaId, _path);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings.Settings)(cast(GSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Deprecated.
      Returns: a list of
          relocatable #GSettings schemas that are available, in no defined order.
          The list must not be modified or freed.
  
      Deprecated: Use [gio.settings_schema_source.SettingsSchemaSource.listSchemas] instead
  */
  static string[] listRelocatableSchemas()
  {
    const(char*)* _cretval;
    _cretval = g_settings_list_relocatable_schemas();
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Deprecated.
      Returns: a list of
          #GSettings schemas that are available, in no defined order.  The list
          must not be modified or freed.
  
      Deprecated: Use [gio.settings_schema_source.SettingsSchemaSource.listSchemas] instead.
        If you used [gio.settings.Settings.listSchemas] to check for the presence of
        a particular schema, use [gio.settings_schema_source.SettingsSchemaSource.lookup] instead
        of your whole loop.
  */
  static string[] listSchemas()
  {
    const(char*)* _cretval;
    _cretval = g_settings_list_schemas();
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Ensures that all pending operations are complete for the default backend.
      
      Writes made to a #GSettings are handled asynchronously.  For this
      reason, it is very unlikely that the changes have it to disk by the
      time [gio.settings.Settings.set] returns.
      
      This call will block until all of the writes have made it to the
      backend.  Since the mainloop is not running, no change notifications
      will be dispatched during this call (but some may be queued by the
      time the call is done).
  */
  static void sync()
  {
    g_settings_sync();
  }

  /**
      Removes an existing binding for property on object.
      
      Note that bindings are automatically removed when the
      object is finalized, so it is rarely necessary to call this
      function.
  
      Params:
        object = the object
        property = the property whose binding is removed
  */
  static void unbind(gobject.object.ObjectWrap object, string property)
  {
    const(char)* _property = property.toCString(No.Alloc);
    g_settings_unbind(object ? cast(GObject*)object._cPtr(No.Dup) : null, _property);
  }

  /**
      Applies any changes that have been made to the settings.  This
      function does nothing unless settings is in 'delay-apply' mode;
      see [gio.settings.Settings.delay].  In the normal case settings are always
      applied immediately.
  */
  void apply()
  {
    g_settings_apply(cast(GSettings*)this._cPtr);
  }

  /**
      Create a binding between the key in the settings object
      and the property property of object.
      
      The binding uses the default GIO mapping functions to map
      between the settings and property values. These functions
      handle booleans, numeric types and string types in a
      straightforward way. Use [gio.settings.Settings.bindWithMapping] if
      you need a custom mapping, or map between types that are not
      supported by the default mapping functions.
      
      Unless the flags include [gio.types.SettingsBindFlags.NoSensitivity], this
      function also establishes a binding between the writability of
      key and the "sensitive" property of object (if object has
      a boolean property by that name). See [gio.settings.Settings.bindWritable]
      for more details about writable bindings.
      
      Note that the lifecycle of the binding is tied to object,
      and that you can have only one binding per object property.
      If you bind the same property twice on the same object, the second
      binding overrides the first one.
  
      Params:
        key = the key to bind
        object = a #GObject
        property = the name of the property to bind
        flags = flags for the binding
  */
  void bind(string key, gobject.object.ObjectWrap object, string property, gio.types.SettingsBindFlags flags)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _property = property.toCString(No.Alloc);
    g_settings_bind(cast(GSettings*)this._cPtr, _key, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, flags);
  }

  /**
      Create a binding between the writability of key in the
      settings object and the property property of object.
      The property must be boolean; "sensitive" or "visible"
      properties of widgets are the most likely candidates.
      
      Writable bindings are always uni-directional; changes of the
      writability of the setting will be propagated to the object
      property, not the other way.
      
      When the inverted argument is true, the binding inverts the
      value as it passes from the setting to the object, i.e. property
      will be set to true if the key is not writable.
      
      Note that the lifecycle of the binding is tied to object,
      and that you can have only one binding per object property.
      If you bind the same property twice on the same object, the second
      binding overrides the first one.
  
      Params:
        key = the key to bind
        object = a #GObject
        property = the name of a boolean property to bind
        inverted = whether to 'invert' the value
  */
  void bindWritable(string key, gobject.object.ObjectWrap object, string property, bool inverted)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _property = property.toCString(No.Alloc);
    g_settings_bind_writable(cast(GSettings*)this._cPtr, _key, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, inverted);
  }

  /**
      Creates a #GAction corresponding to a given #GSettings key.
      
      The action has the same name as the key.
      
      The value of the key becomes the state of the action and the action
      is enabled when the key is writable.  Changing the state of the
      action results in the key being written to.  Changes to the value or
      writability of the key cause appropriate change notifications to be
      emitted for the action.
      
      For boolean-valued keys, action activations take no parameter and
      result in the toggling of the value.  For all other types,
      activations take the new value for the key (which must have the
      correct type).
  
      Params:
        key = the name of a key in settings
      Returns: a new #GAction
  */
  gio.action.Action createAction(string key)
  {
    GAction* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_create_action(cast(GSettings*)this._cPtr, _key);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action.Action)(cast(GAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Changes the #GSettings object into 'delay-apply' mode. In this
      mode, changes to settings are not immediately propagated to the
      backend, but kept locally until [gio.settings.Settings.apply] is called.
  */
  void delay()
  {
    g_settings_delay(cast(GSettings*)this._cPtr);
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for booleans.
      
      It is a programmer error to give a key that isn't specified as
      having a boolean type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a boolean
  */
  bool getBoolean(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_get_boolean(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Creates a child settings object which has a base path of
      `base-path/name`, where `base-path` is the base path of
      settings.
      
      The schema for the child settings object must have been declared
      in the schema of settings using a `<child>` element.
      
      The created child settings object will inherit the #GSettings:delay-apply
      mode from settings.
  
      Params:
        name = the name of the child schema
      Returns: a 'child' settings object
  */
  gio.settings.Settings getChild(string name)
  {
    GSettings* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_settings_get_child(cast(GSettings*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings.Settings)(cast(GSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the "default value" of a key.
      
      This is the value that would be read if [gio.settings.Settings.reset] were to be
      called on the key.
      
      Note that this may be a different value than returned by
      [gio.settings_schema_key.SettingsSchemaKey.getDefaultValue] if the system administrator
      has provided a default value.
      
      Comparing the return values of [gio.settings.Settings.getDefaultValue] and
      [gio.settings.Settings.getValue] is not sufficient for determining if a value
      has been set because the user may have explicitly set the value to
      something that happens to be equal to the default.  The difference
      here is that if the default changes in the future, the user's key
      will still be set.
      
      This function may be useful for adding an indication to a UI of what
      the default value was before the user set it.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings.
  
      Params:
        key = the key to get the default value for
      Returns: the default value
  */
  glib.variant.Variant getDefaultValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_default_value(cast(GSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for doubles.
      
      It is a programmer error to give a key that isn't specified as
      having a 'double' type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a double
  */
  double getDouble(string key)
  {
    double _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_double(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the value that is stored in settings for key and converts it
      to the enum value that it represents.
      
      In order to use this function the type of the value must be a string
      and it must be marked in the schema file as an enumerated type.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings or is not marked as an enumerated type.
      
      If the value stored in the configuration database is not a valid
      value for the enumerated type then this function will return the
      default value.
  
      Params:
        key = the key to get the value for
      Returns: the enum value
  */
  int getEnum(string key)
  {
    int _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_enum(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the value that is stored in settings for key and converts it
      to the flags value that it represents.
      
      In order to use this function the type of the value must be an array
      of strings and it must be marked in the schema file as a flags type.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings or is not marked as a flags type.
      
      If the value stored in the configuration database is not a valid
      value for the flags type then this function will return the default
      value.
  
      Params:
        key = the key to get the value for
      Returns: the flags value
  */
  uint getFlags(string key)
  {
    uint _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_flags(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Returns whether the #GSettings object has any unapplied
      changes.  This can only be the case if it is in 'delayed-apply' mode.
      Returns: true if settings has unapplied changes
  */
  bool getHasUnapplied()
  {
    bool _retval;
    _retval = cast(bool)g_settings_get_has_unapplied(cast(GSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for 32-bit integers.
      
      It is a programmer error to give a key that isn't specified as
      having a int32 type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: an integer
  */
  int getInt(string key)
  {
    int _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_int(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for 64-bit integers.
      
      It is a programmer error to give a key that isn't specified as
      having a int64 type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a 64-bit integer
  */
  long getInt64(string key)
  {
    long _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_int64(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings, subject to
      application-level validation/mapping.
      
      You should use this function when the application needs to perform
      some processing on the value of the key (for example, parsing).  The
      mapping function performs that processing.  If the function
      indicates that the processing was unsuccessful (due to a parse error,
      for example) then the mapping is tried again with another value.
      
      This allows a robust 'fall back to defaults' behaviour to be
      implemented somewhat automatically.
      
      The first value that is tried is the user's setting for the key.  If
      the mapping function fails to map this value, other values may be
      tried in an unspecified order (system or site defaults, translated
      schema default values, untranslated schema default values, etc).
      
      If the mapping function fails for all possible values, one additional
      attempt is made: the mapping function is called with a null value.
      If the mapping function still indicates failure at this point then
      the application will be aborted.
      
      The result parameter for the mapping function is pointed to a
      #gpointer which is initially set to null.  The same pointer is given
      to each invocation of mapping.  The final value of that #gpointer is
      what is returned by this function.  null is valid; it is returned
      just as any other value would be.
  
      Params:
        key = the key to get the value for
        mapping = the function to map the value in the
                    settings database to the value used by the application
      Returns: the result, which may be null
  */
  void* getMapped(string key, gio.types.SettingsGetMapping mapping)
  {
    extern(C) gboolean _mappingCallback(GVariant* value, void** result, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gio.types.SettingsGetMapping*)userData;

      _dretval = (*_dlg)(value ? new glib.variant.Variant(cast(void*)value, No.Take) : null, *result);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _mappingCB = mapping ? &_mappingCallback : null;
    const(char)* _key = key.toCString(No.Alloc);
    auto _mapping = mapping ? cast(void*)&(mapping) : null;
    auto _retval = g_settings_get_mapped(cast(GSettings*)this._cPtr, _key, _mappingCB, _mapping);
    return _retval;
  }

  /**
      Queries the range of a key.
  
      Params:
        key = the key to query the range of
      Returns: 
  
      Deprecated: Use [gio.settings_schema_key.SettingsSchemaKey.getRange] instead.
  */
  glib.variant.Variant getRange(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_range(cast(GSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for strings.
      
      It is a programmer error to give a key that isn't specified as
      having a string type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a newly-allocated string
  */
  string getString(string key)
  {
    char* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_string(cast(GSettings*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      A convenience variant of [gio.settings.Settings.get] for string arrays.
      
      It is a programmer error to give a key that isn't specified as
      having an array of strings type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a
        newly-allocated, null-terminated array of strings, the value that
        is stored at key in settings.
  */
  string[] getStrv(string key)
  {
    char** _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_strv(cast(GSettings*)this._cPtr, _key);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for 32-bit unsigned
      integers.
      
      It is a programmer error to give a key that isn't specified as
      having a uint32 type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: an unsigned integer
  */
  uint getUint(string key)
  {
    uint _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_uint(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the value that is stored at key in settings.
      
      A convenience variant of [gio.settings.Settings.get] for 64-bit unsigned
      integers.
      
      It is a programmer error to give a key that isn't specified as
      having a uint64 type in the schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a 64-bit unsigned integer
  */
  ulong getUint64(string key)
  {
    ulong _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_settings_get_uint64(cast(GSettings*)this._cPtr, _key);
    return _retval;
  }

  /**
      Checks the "user value" of a key, if there is one.
      
      The user value of a key is the last value that was set by the user.
      
      After calling [gio.settings.Settings.reset] this function should always return
      null (assuming something is not wrong with the system
      configuration).
      
      It is possible that [gio.settings.Settings.getValue] will return a different
      value than this function.  This can happen in the case that the user
      set a value for a key that was subsequently locked down by the system
      administrator -- this function will return the user's old value.
      
      This function may be useful for adding a "reset" option to a UI or
      for providing indication that a particular value has been changed.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings.
  
      Params:
        key = the key to get the user value for
      Returns: the user's value, if set
  */
  glib.variant.Variant getUserValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_user_value(cast(GSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value that is stored in settings for key.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings.
  
      Params:
        key = the key to get the value for
      Returns: a new #GVariant
  */
  glib.variant.Variant getValue(string key)
  {
    GVariant* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_settings_get_value(cast(GSettings*)this._cPtr, _key);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Finds out if a key can be written or not
  
      Params:
        name = the name of a key
      Returns: true if the key name is writable
  */
  bool isWritable(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_settings_is_writable(cast(GSettings*)this._cPtr, _name);
    return _retval;
  }

  /**
      Gets the list of children on settings.
      
      The list is exactly the list of strings for which it is not an error
      to call [gio.settings.Settings.getChild].
      
      There is little reason to call this function from "normal" code, since
      you should already know what children are in your schema. This function
      may still be useful there for introspection reasons, however.
      
      You should free the return value with [glib.global.strfreev] when you are done
      with it.
      Returns: a list of the children
           on settings, in no defined order
  */
  string[] listChildren()
  {
    char** _cretval;
    _cretval = g_settings_list_children(cast(GSettings*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Introspects the list of keys on settings.
      
      You should probably not be calling this function from "normal" code
      (since you should already know what keys are in your schema).  This
      function is intended for introspection reasons.
      
      You should free the return value with [glib.global.strfreev] when you are done
      with it.
      Returns: a list
           of the keys on settings, in no defined order
  
      Deprecated: Use [gio.settings_schema.SettingsSchema.listKeys] instead.
  */
  string[] listKeys()
  {
    char** _cretval;
    _cretval = g_settings_list_keys(cast(GSettings*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Checks if the given value is of the correct type and within the
      permitted range for key.
  
      Params:
        key = the key to check
        value = the value to check
      Returns: true if value is valid for key
  
      Deprecated: Use [gio.settings_schema_key.SettingsSchemaKey.rangeCheck] instead.
  */
  bool rangeCheck(string key, glib.variant.Variant value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_range_check(cast(GSettings*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Resets key to its default value.
      
      This call resets the key, as much as possible, to its default value.
      That might be the value specified in the schema or the one set by the
      administrator.
  
      Params:
        key = the name of a key
  */
  void reset(string key)
  {
    const(char)* _key = key.toCString(No.Alloc);
    g_settings_reset(cast(GSettings*)this._cPtr, _key);
  }

  /**
      Reverts all non-applied changes to the settings.  This function
      does nothing unless settings is in 'delay-apply' mode; see
      [gio.settings.Settings.delay].  In the normal case settings are always applied
      immediately.
      
      Change notifications will be emitted for affected keys.
  */
  void revert()
  {
    g_settings_revert(cast(GSettings*)this._cPtr);
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for booleans.
      
      It is a programmer error to give a key that isn't specified as
      having a boolean type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setBoolean(string key, bool value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_boolean(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for doubles.
      
      It is a programmer error to give a key that isn't specified as
      having a 'double' type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setDouble(string key, double value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_double(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Looks up the enumerated type nick for value and writes it to key,
      within settings.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings or is not marked as an enumerated type, or for
      value not to be a valid value for the named type.
      
      After performing the write, accessing key directly with
      [gio.settings.Settings.getString] will return the 'nick' associated with
      value.
  
      Params:
        key = a key, within settings
        value = an enumerated value
      Returns: true, if the set succeeds
  */
  bool setEnum(string key, int value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_enum(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Looks up the flags type nicks for the bits specified by value, puts
      them in an array of strings and writes the array to key, within
      settings.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings or is not marked as a flags type, or for value
      to contain any bits that are not value for the named type.
      
      After performing the write, accessing key directly with
      [gio.settings.Settings.getStrv] will return an array of 'nicks'; one for each
      bit in value.
  
      Params:
        key = a key, within settings
        value = a flags value
      Returns: true, if the set succeeds
  */
  bool setFlags(string key, uint value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_flags(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for 32-bit integers.
      
      It is a programmer error to give a key that isn't specified as
      having a int32 type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setInt(string key, int value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_int(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for 64-bit integers.
      
      It is a programmer error to give a key that isn't specified as
      having a int64 type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setInt64(string key, long value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_int64(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for strings.
      
      It is a programmer error to give a key that isn't specified as
      having a string type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setString(string key, string value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_string(cast(GSettings*)this._cPtr, _key, _value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for string arrays.  If
      value is null, then key is set to be the empty array.
      
      It is a programmer error to give a key that isn't specified as
      having an array of strings type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to, or null
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setStrv(string key, string[] value = null)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    char*[] _tmpvalue;
    foreach (s; value)
      _tmpvalue ~= s.toCString(No.Alloc);
    _tmpvalue ~= null;
    const(char*)* _value = _tmpvalue.ptr;

    _retval = cast(bool)g_settings_set_strv(cast(GSettings*)this._cPtr, _key, _value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for 32-bit unsigned
      integers.
      
      It is a programmer error to give a key that isn't specified as
      having a uint32 type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setUint(string key, uint value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_uint(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      A convenience variant of [gio.settings.Settings.set] for 64-bit unsigned
      integers.
      
      It is a programmer error to give a key that isn't specified as
      having a uint64 type in the schema for settings.
  
      Params:
        key = the name of the key to set
        value = the value to set it to
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setUint64(string key, ulong value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_uint64(cast(GSettings*)this._cPtr, _key, value);
    return _retval;
  }

  /**
      Sets key in settings to value.
      
      It is a programmer error to give a key that isn't contained in the
      schema for settings or for value to have the incorrect type, per
      the schema.
      
      If value is floating then this function consumes the reference.
  
      Params:
        key = the name of the key to set
        value = a #GVariant of the correct type
      Returns: true if setting the key succeeded,
            false if the key was not writable
  */
  bool setValue(string key, glib.variant.Variant value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_settings_set_value(cast(GSettings*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `ChangeEvent` signal.
  
      The "change-event" signal is emitted once per change event that
        affects this settings object.  You should connect to this signal
        only if you are interested in viewing groups of changes before they
        are split out into multiple emissions of the "changed" signal.
        For most use cases it is more appropriate to use the "changed" signal.
        
        In the event that the change event applies to one or more specified
        keys, keys will be an array of #GQuark of length n_keys.  In the
        event that the change event applies to the #GSettings object as a
        whole (ie: potentially every key has been changed) then keys will
        be null and n_keys will be 0.
        
        The default handler for this signal invokes the "changed" signal
        for each affected key.  If any other connected handler returns
        true then this default functionality will be suppressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(glib.types.Quark[] keys, gio.settings.Settings settings))
  
          `keys` an array of #GQuarks for the changed keys, or null (optional)
  
          `settings` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
                     event. FALSE to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.types.Quark[])))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.settings.Settings)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      auto nKeys = getVal!(int)(&_paramVals[2]);
      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);


      static if (Parameters!T.length > 0)
      {
        auto _cArray = getVal!(uint**)(&_paramVals[1]);
        glib.types.Quark[] _dArray;
        _dArray = cast(glib.types.Quark[])_cArray[0 .. nKeys];
        _paramTuple[0] = _dArray;
      }
      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-event", closure, after);
  }

  /**
      Connect to `Changed` signal.
  
      The "changed" signal is emitted when a key has potentially changed.
        You should call one of the [gio.settings.Settings.get] calls to check the new
        value.
        
        This signal supports detailed connections.  You can connect to the
        detailed signal "changed::x" in order to only receive callbacks
        when key "x" changes.
        
        Note that settings only emits this signal if you have read key at
        least once while a signal handler was already connected for key.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string key, gio.settings.Settings settings))
  
          `key` the name of the key that changed (optional)
  
          `settings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.settings.Settings)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `WritableChangeEvent` signal.
  
      The "writable-change-event" signal is emitted once per writability
        change event that affects this settings object.  You should connect
        to this signal if you are interested in viewing groups of changes
        before they are split out into multiple emissions of the
        "writable-changed" signal.  For most use cases it is more
        appropriate to use the "writable-changed" signal.
        
        In the event that the writability change applies only to a single
        key, key will be set to the #GQuark for that key.  In the event
        that the writability change affects the entire settings object,
        key will be 0.
        
        The default handler for this signal invokes the "writable-changed"
        and "changed" signals for each affected key.  This is done because
        changes in writability might also imply changes in value (if for
        example, a new mandatory setting is introduced).  If any other
        connected handler returns true then this default functionality
        will be suppressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(uint key, gio.settings.Settings settings))
  
          `key` the quark of the key, or 0 (optional)
  
          `settings` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
                     event. FALSE to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWritableChangeEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.settings.Settings)))
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
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("writable-change-event", closure, after);
  }

  /**
      Connect to `WritableChanged` signal.
  
      The "writable-changed" signal is emitted when the writability of a
        key has potentially changed.  You should call
        [gio.settings.Settings.isWritable] in order to determine the new status.
        
        This signal supports detailed connections.  You can connect to the
        detailed signal "writable-changed::x" in order to only receive
        callbacks when the writability of "x" changes.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string key, gio.settings.Settings settings))
  
          `key` the key (optional)
  
          `settings` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWritableChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.settings.Settings)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("writable-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
