/// Module for [Builder] class
module gtk.builder;

import gid.gid;
import glib.error;
import gobject.closure;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.builder_scope;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A [gtk.builder.Builder] reads XML descriptions of a user interface and
    instantiates the described objects.
    
    To create a [gtk.builder.Builder] from a user interface description, call
    [gtk.builder.Builder.newFromFile], [gtk.builder.Builder.newFromResource]
    or [gtk.builder.Builder.newFromString].
    
    In the (unusual) case that you want to add user interface
    descriptions from multiple sources to the same [gtk.builder.Builder] you can
    call [gtk.builder.Builder.new_] to get an empty builder and populate it by
    (multiple) calls to [gtk.builder.Builder.addFromFile],
    [gtk.builder.Builder.addFromResource] or
    [gtk.builder.Builder.addFromString].
    
    A [gtk.builder.Builder] holds a reference to all objects that it has constructed
    and drops these references when it is finalized. This finalization can
    cause the destruction of non-widget objects or widgets which are not
    contained in a toplevel window. For toplevel windows constructed by a
    builder, it is the responsibility of the user to call
    [gtk.window.Window.destroy] to get rid of them and all the widgets
    they contain.
    
    The functions [gtk.builder.Builder.getObject] and
    [gtk.builder.Builder.getObjects] can be used to access the widgets in
    the interface by the names assigned to them inside the UI description.
    Toplevel windows returned by these functions will stay around until the
    user explicitly destroys them with [gtk.window.Window.destroy]. Other
    widgets will either be part of a larger hierarchy constructed by the
    builder (in which case you should not have to worry about their lifecycle),
    or without a parent, in which case they have to be added to some container
    to make use of them. Non-widget objects need to be reffed with
    [gobject.object.ObjectWrap.ref_] to keep them beyond the lifespan of the builder.
    
    ## GtkBuilder UI Definitions
    
    [gtk.builder.Builder] parses textual descriptions of user interfaces which are
    specified in XML format. We refer to these descriptions as “GtkBuilder
    UI definitions” or just “UI definitions” if the context is clear.
    
    ### Structure of UI definitions
    
    UI definition files are always encoded in UTF-8.
    
    The toplevel element is `<interface>`. It optionally takes a “domain”
    attribute, which will make the builder look for translated strings
    using `dgettext()` in the domain specified. This can also be done by
    calling [gtk.builder.Builder.setTranslationDomain] on the builder.
    For example:
    
    ```xml
    <?xml version="1.0" encoding="UTF-8">
    <interface domain="your-app">
      ...
    </interface>
    ```
    
    ### Requirements
    
    The target toolkit version(s) are described by `<requires>` elements,
    the “lib” attribute specifies the widget library in question (currently
    the only supported value is “gtk”) and the “version” attribute specifies
    the target version in the form “`<major>`.`<minor>`”. [gtk.builder.Builder] will
    error out if the version requirements are not met. For example:
    
    ```xml
    <?xml version="1.0" encoding="UTF-8">
    <interface domain="your-app">
      <requires lib="gtk" version="4.0" />
    </interface>
    ```
    
    ### Objects
    
    Objects are defined as children of the `<interface>` element.
    
    Objects are described by `<object>` elements, which can contain
    `<property>` elements to set properties, `<signal>` elements which
    connect signals to handlers, and `<child>` elements, which describe
    child objects.
    
    Typically, the specific kind of object represented by an `<object>`
    element is specified by the “class” attribute. If the type has not
    been loaded yet, GTK tries to find the `get_type()` function from the
    class name by applying heuristics. This works in most cases, but if
    necessary, it is possible to specify the name of the `get_type()`
    function explicitly with the "type-func" attribute. If your UI definition
    is referencing internal types, you should make sure to call
    `[gobject.global.typeEnsure]` for each object type before parsing the UI definition.
    
    Objects may be given a name with the “id” attribute, which allows the
    application to retrieve them from the builder with
    [gtk.builder.Builder.getObject]. An id is also necessary to use the
    object as property value in other parts of the UI definition. GTK
    reserves ids starting and ending with `___` (three consecutive
    underscores) for its own purposes.
    
    ### Properties
    
    Setting properties of objects is pretty straightforward with the
    `<property>` element: the “name” attribute specifies the name of the
    property, and the content of the element specifies the value:
    
    ```xml
    <object class="GtkButton">
      <property name="label">Hello, world</property>
    </object>
    ```
    
    If the “translatable” attribute is set to a true value, GTK uses
    `gettext()` (or `dgettext()` if the builder has a translation domain set)
    to find a translation for the value. This happens before the value
    is parsed, so it can be used for properties of any type, but it is
    probably most useful for string properties. It is also possible to
    specify a context to disambiguate short strings, and comments which
    may help the translators:
    
    ```xml
    <object class="GtkButton">
      <property name="label" translatable="yes" context="button">Hello, world</property>
    </object>
    ```
    
    [gtk.builder.Builder] can parse textual representations for the most common
    property types:
    
    $(LIST
      * characters
      * strings
      * integers
      * floating-point numbers
      * booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
        as true values, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
        as false values)
      * enumeration types (can be specified by their full C identifier their short
        name used when registering the enumeration type, or their integer value)
      * flag types (can be specified by their C identifier, short name, integer
        value, and optionally combined with “|” for bitwise OR, e.g.
        “GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE”, or “emoji|lowercase”)
      * colors (in a format understood by [gdk.rgba.RGBA.parse])
      * [glib.variant.Variant] (can be specified in the format understood by
         [glib.variant.Variant.parse])
      * pixbufs (can be specified as a filename of an image file to load)
    )
      
    Objects can be referred to by their name and by default refer to
    objects declared in the local XML fragment and objects exposed via
    [gtk.builder.Builder.exposeObject]. In general, [gtk.builder.Builder] allows
    forward references to objects declared in the local XML; an object
    doesn’t have to be constructed before it can be referred to. The
    exception to this rule is that an object has to be constructed before
    it can be used as the value of a construct-only property.
    
    ### Child objects
    
    Many widgets have properties for child widgets, such as
    [gtk.expander.Expander.child]. In this case, the preferred way to
    specify the child widget in a ui file is to simply set the property:
    
    ```xml
    <object class="GtkExpander">
      <property name="child">
        <object class="GtkLabel">
        ...
        </object>
      </property>
    </object>
    ```
    
    Generic containers that can contain an arbitrary number of children,
    such as [gtk.box.Box] instead use the `<child>` element. A `<child>`
    element contains an `<object>` element which describes the child object.
    Most often, child objects are widgets inside a container, but they can
    also be, e.g., actions in an action group, or columns in a tree model.
    
    Any object type that implements the [gtk.buildable.Buildable] interface can
    specify how children may be added to it. Since many objects and widgets that
    are included with GTK already implement the [gtk.buildable.Buildable] interface,
    typically child objects can be added using the `<child>` element without
    having to be concerned about the underlying implementation.
    
    See the [[gtk.widget.Widget] documentation](class.Widget.html#gtkwidget-as-gtkbuildable)
    for many examples of using [gtk.builder.Builder] with widgets, including setting
    child objects using the `<child>` element.
    
    A noteworthy special case to the general rule that only objects implementing
    [gtk.buildable.Buildable] may specify how to handle the `<child>` element is that
    [gtk.builder.Builder] provides special support for adding objects to a
    [gio.list_store.ListStore] by using the `<child>` element. For instance:
    
    ```xml
    <object class="GListStore">
      <property name="item-type">MyObject</property>
      <child>
        <object class="MyObject" />
      </child>
      ...
    </object>
    ```
    
    ### Property bindings
    
    It is also possible to bind a property value to another object's
    property value using the attributes "bind-source" to specify the
    source object of the binding, and optionally, "bind-property" and
    "bind-flags" to specify the source property and source binding flags
    respectively. Internally, [gtk.builder.Builder] implements this using
    [gobject.binding.Binding] objects.
    
    For instance, in the example below the “label” property of the
    `bottom_label` widget is bound to the “label” property of the
    `top_button` widget:
    
    ```xml
    <object class="GtkBox">
      <property name="orientation">vertical</property>
      <child>
        <object class="GtkButton" id="top_button">
          <property name="label">Hello, world</property>
        </object>
      </child>
      <child>
        <object class="GtkLabel" id="bottom_label">
          <property name="label"
                    bind-source="top_button"
                    bind-property="label"
                    bind-flags="sync-create" />
        </object>
      </child>
    </object>
    ```
    
    For more information, see the documentation of the
    [gobject.object.ObjectWrap.bindProperty] method.
    
    Please note that another way to set up bindings between objects in .ui files
    is to use the [gtk.expression.Expression] methodology. See the
    [[gtk.expression.Expression] documentation](class.Expression.html#gtkexpression-in-ui-files)
    for more information.
    
    ### Internal children
    
    Sometimes it is necessary to refer to widgets which have implicitly
    been constructed by GTK as part of a composite widget, to set
    properties on them or to add further children (e.g. the content area
    of a [gtk.dialog.Dialog]). This can be achieved by setting the “internal-child”
    property of the `<child>` element to a true value. Note that [gtk.builder.Builder]
    still requires an `<object>` element for the internal child, even if it
    has already been constructed.
    
    ### Specialized children
    
    A number of widgets have different places where a child can be added
    (e.g. tabs vs. page content in notebooks). This can be reflected in
    a UI definition by specifying the “type” attribute on a `<child>`
    The possible values for the “type” attribute are described in the
    sections describing the widget-specific portions of UI definitions.
    
    ### Signal handlers and function pointers
    
    Signal handlers are set up with the `<signal>` element. The “name”
    attribute specifies the name of the signal, and the “handler” attribute
    specifies the function to connect to the signal.
    
    ```xml
    <object class="GtkButton" id="hello_button">
      <signal name="clicked" handler="hello_button__clicked" />
    </object>
    ```
    
    The remaining attributes, “after”, “swapped” and “object”, have the
    same meaning as the corresponding parameters of the
    `func@GObject.signal_connect_object` or `func@GObject.signal_connect_data`
    functions:
    
    $(LIST
      * “after” matches the `G_CONNECT_AFTER` flag, and will ensure that the
        handler is called after the default class closure for the signal
      * “swapped” matches the `G_CONNECT_SWAPPED` flag, and will swap the
        instance and closure arguments when invoking the signal handler
      * “object” will bind the signal handler to the lifetime of the object
        referenced by the attribute
    )
      
    By default "swapped" will be set to "yes" if not specified otherwise, in
    the case where "object" is set, for convenience. A “last_modification_time”
    attribute is also allowed, but it does not have a meaning to the builder.
    
    When compiling applications for Windows, you must declare signal callbacks
    with the `G_MODULE_EXPORT` decorator, or they will not be put in the symbol
    table:
    
    ```c
    G_MODULE_EXPORT void
    hello_button__clicked (GtkButton *button,
                           gpointer data)
    {
      // ...
    }
    ```
    
    On Linux and Unix, this is not necessary; applications should instead
    be compiled with the `-Wl,--export-dynamic` argument inside their compiler
    flags, and linked against `gmodule-export-2.0`.
    
    ## Example UI Definition
    
    ```xml
    <interface>
      <object class="GtkDialog" id="dialog1">
        <child internal-child="content_area">
          <object class="GtkBox">
            <child internal-child="action_area">
              <object class="GtkBox">
                <child>
                  <object class="GtkButton" id="ok_button">
                    <property name="label" translatable="yes">_Ok</property>
                    <property name="use-underline">True</property>
                    <signal name="clicked" handler="ok_button_clicked"/>
                  </object>
                </child>
              </object>
            </child>
          </object>
        </child>
      </object>
    </interface>
    ```
    
    ## Using GtkBuildable for extending UI definitions
    
    Objects can implement the [gtk.buildable.Buildable] interface to add custom
    elements and attributes to the XML. Typically, any extension will be
    documented in each type that implements the interface.
    
    ## Templates
    
    When describing a [gtk.widget.Widget], you can use the `<template>` tag to
    describe a UI bound to a specific widget type. GTK will automatically load
    the UI definition when instantiating the type, and bind children and
    signal handlers to instance fields and function symbols.
    
    For more information, see the [[gtk.widget.Widget] documentation](class.Widget.html#building-composite-widgets-from-template-xml)
    for details.
*/
class Builder : gobject.object.ObjectWrap
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
    return cast(void function())gtk_builder_get_type != &gidSymbolNotFound ? gtk_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Builder self()
  {
    return this;
  }

  /**
      Get `currentObject` property.
      Returns: The object the builder is evaluating for.
  */
  @property gobject.object.ObjectWrap currentObject()
  {
    return getCurrentObject();
  }

  /**
      Set `currentObject` property.
      Params:
        propval = The object the builder is evaluating for.
  */
  @property void currentObject(gobject.object.ObjectWrap propval)
  {
    return setCurrentObject(propval);
  }

  /**
      Get `scope_` property.
      Returns: The scope the builder is operating in
  */
  @property gtk.builder_scope.BuilderScope scope_()
  {
    return getScope();
  }

  /**
      Set `scope_` property.
      Params:
        propval = The scope the builder is operating in
  */
  @property void scope_(gtk.builder_scope.BuilderScope propval)
  {
    return setScope(propval);
  }

  /**
      Get `translationDomain` property.
      Returns: The translation domain used when translating property values that
        have been marked as translatable.
        
        If the translation domain is null, [gtk.builder.Builder] uses gettext(),
        otherwise [glib.global.dgettext].
  */
  @property string translationDomain()
  {
    return getTranslationDomain();
  }

  /**
      Set `translationDomain` property.
      Params:
        propval = The translation domain used when translating property values that
          have been marked as translatable.
          
          If the translation domain is null, [gtk.builder.Builder] uses gettext(),
          otherwise [glib.global.dgettext].
  */
  @property void translationDomain(string propval)
  {
    return setTranslationDomain(propval);
  }

  /**
      Creates a new empty builder object.
      
      This function is only useful if you intend to make multiple calls
      to [gtk.builder.Builder.addFromFile], [gtk.builder.Builder.addFromResource]
      or [gtk.builder.Builder.addFromString] in order to merge multiple UI
      descriptions into a single builder.
      Returns: a new (empty) [gtk.builder.Builder] object
  */
  this()
  {
    GtkBuilder* _cretval;
    _cretval = gtk_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parses the UI definition in the file filename.
      
      If there is an error opening the file or parsing the description then
      the program will be aborted. You should only ever attempt to parse
      user interface descriptions that are shipped as part of your program.
  
      Params:
        filename = filename of user interface description file
      Returns: a [gtk.builder.Builder] containing the described interface
  */
  static gtk.builder.Builder newFromFile(string filename)
  {
    GtkBuilder* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_builder_new_from_file(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.builder.Builder)(cast(GtkBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses the UI definition at resource_path.
      
      If there is an error locating the resource or parsing the
      description, then the program will be aborted.
  
      Params:
        resourcePath = a [gio.resource.Resource] resource path
      Returns: a [gtk.builder.Builder] containing the described interface
  */
  static gtk.builder.Builder newFromResource(string resourcePath)
  {
    GtkBuilder* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_builder_new_from_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.builder.Builder)(cast(GtkBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses the UI definition in string.
      
      If string is null-terminated, then length should be -1.
      If length is not -1, then it is the length of string.
      
      If there is an error parsing string then the program will be
      aborted. You should not attempt to parse user interface description
      from untrusted sources.
  
      Params:
        string_ = a user interface (XML) description
      Returns: a [gtk.builder.Builder] containing the interface described by string
  */
  static gtk.builder.Builder newFromString(string string_)
  {
    GtkBuilder* _cretval;
    ptrdiff_t _length;
    if (string_)
      _length = cast(ptrdiff_t)string_.length;

    auto _string_ = cast(char*)string_.ptr;
    _cretval = gtk_builder_new_from_string(_string_, _length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.builder.Builder)(cast(GtkBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses a file containing a UI definition and merges it with
      the current contents of builder.
      
      This function is useful if you need to call
      [gtk.builder.Builder.setCurrentObject]) to add user data to
      callbacks before loading GtkBuilder UI. Otherwise, you probably
      want [gtk.builder.Builder.newFromFile] instead.
      
      If an error occurs, 0 will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_FILE_ERROR`
      domains.
      
      It’s not really reasonable to attempt to handle failures of this
      call. You should not use this function with untrusted files (ie:
      files that are not part of your application). Broken [gtk.builder.Builder]
      files can easily crash your program, and it’s possible that memory
      was leaked leading up to the reported failure. The only reasonable
      thing to do when an error is detected is to call `g_error()`.
  
      Params:
        filename = the name of the file to parse
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_builder_add_from_file(cast(GtkBuilder*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a resource file containing a UI definition
      and merges it with the current contents of builder.
      
      This function is useful if you need to call
      [gtk.builder.Builder.setCurrentObject] to add user data to
      callbacks before loading GtkBuilder UI. Otherwise, you probably
      want [gtk.builder.Builder.newFromResource] instead.
      
      If an error occurs, 0 will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_RESOURCE_ERROR`
      domain.
      
      It’s not really reasonable to attempt to handle failures of this
      call.  The only reasonable thing to do when an error is detected is
      to call g_error().
  
      Params:
        resourcePath = the path of the resource file to parse
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addFromResource(string resourcePath)
  {
    bool _retval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_builder_add_from_resource(cast(GtkBuilder*)this._cPtr, _resourcePath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a string containing a UI definition and merges it
      with the current contents of builder.
      
      This function is useful if you need to call
      [gtk.builder.Builder.setCurrentObject] to add user data to
      callbacks before loading [gtk.builder.Builder] UI. Otherwise, you probably
      want [gtk.builder.Builder.newFromString] instead.
      
      Upon errors false will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or
      `G_VARIANT_PARSE_ERROR` domain.
      
      It’s not really reasonable to attempt to handle failures of this
      call.  The only reasonable thing to do when an error is detected is
      to call g_error().
  
      Params:
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addFromString(string buffer, ptrdiff_t length)
  {
    bool _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_builder_add_from_string(cast(GtkBuilder*)this._cPtr, _buffer, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a file containing a UI definition building only the
      requested objects and merges them with the current contents
      of builder.
      
      Upon errors, 0 will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_FILE_ERROR`
      domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a [gtk.tree_view.TreeView] that depends on its
      [gtk.tree_model.TreeModel]), you have to explicitly list all of them in object_ids.
  
      Params:
        filename = the name of the file to parse
        objectIds = nul-terminated array of objects to build
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addObjectsFromFile(string filename, string[] objectIds)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    const(char*)* _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = cast(bool)gtk_builder_add_objects_from_file(cast(GtkBuilder*)this._cPtr, _filename, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a resource file containing a UI definition, building
      only the requested objects and merges them with the current
      contents of builder.
      
      Upon errors, 0 will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_RESOURCE_ERROR`
      domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a [gtk.tree_view.TreeView] that depends on its
      [gtk.tree_model.TreeModel]), you have to explicitly list all of them in object_ids.
  
      Params:
        resourcePath = the path of the resource file to parse
        objectIds = nul-terminated array of objects to build
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addObjectsFromResource(string resourcePath, string[] objectIds)
  {
    bool _retval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    const(char)*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    const(char*)* _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = cast(bool)gtk_builder_add_objects_from_resource(cast(GtkBuilder*)this._cPtr, _resourcePath, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a string containing a UI definition, building only the
      requested objects and merges them with the current contents of
      builder.
      
      Upon errors false will be returned and error will be assigned a
      [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR` or `G_MARKUP_ERROR` domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a [gtk.tree_view.TreeView] that depends on its
      [gtk.tree_model.TreeModel]), you have to explicitly list all of them in object_ids.
  
      Params:
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
        objectIds = nul-terminated array of objects to build
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool addObjectsFromString(string buffer, ptrdiff_t length, string[] objectIds)
  {
    bool _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    const(char)*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    const(char*)* _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = cast(bool)gtk_builder_add_objects_from_string(cast(GtkBuilder*)this._cPtr, _buffer, length, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a closure to invoke the function called function_name.
      
      This is using the create_closure() implementation of builder's
      [gtk.builder_scope.BuilderScope].
      
      If no closure could be created, null will be returned and error
      will be set.
  
      Params:
        functionName = name of the function to look up
        flags = closure creation flags
        object = Object to create the closure with
      Returns: A new closure for invoking function_name
      Throws: [ErrorWrap]
  */
  gobject.closure.Closure createClosure(string functionName, gtk.types.BuilderClosureFlags flags, gobject.object.ObjectWrap object = null)
  {
    GClosure* _cretval;
    const(char)* _functionName = functionName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_builder_create_closure(cast(GtkBuilder*)this._cPtr, _functionName, flags, object ? cast(GObject*)object._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gobject.closure.Closure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add object to the builder object pool so it can be
      referenced just like any other object built by builder.
      
      Only a single object may be added using name. However,
      it is not an error to expose the same object under multiple
      names. `[gtk.builder.Builder.getObject]` may be used to determine
      if an object has already been added with name.
  
      Params:
        name = the name of the object exposed to the builder
        object = the object to expose
  */
  void exposeObject(string name, gobject.object.ObjectWrap object)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_builder_expose_object(cast(GtkBuilder*)this._cPtr, _name, object ? cast(GObject*)object._cPtr(No.Dup) : null);
  }

  /**
      Main private entry point for building composite components
      from template XML.
      
      Most likely you do not need to call this function in applications as
      templates are handled by [gtk.widget.Widget].
  
      Params:
        object = the object that is being extended
        templateType = the type that the template is for
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  bool extendWithTemplate(gobject.object.ObjectWrap object, gobject.types.GType templateType, string buffer, ptrdiff_t length)
  {
    bool _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_builder_extend_with_template(cast(GtkBuilder*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, templateType, _buffer, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the current object set via [gtk.builder.Builder.setCurrentObject].
      Returns: the current object
  */
  gobject.object.ObjectWrap getCurrentObject()
  {
    GObject* _cretval;
    _cretval = gtk_builder_get_current_object(cast(GtkBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the object named name.
      
      Note that this function does not increment the reference count
      of the returned object.
  
      Params:
        name = name of object to get
      Returns: the object named name
  */
  gobject.object.ObjectWrap getObject(string name)
  {
    GObject* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_builder_get_object(cast(GtkBuilder*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets all objects that have been constructed by builder.
      
      Note that this function does not increment the reference
      counts of the returned objects.
      Returns: a
          newly-allocated [glib.slist.SList] containing all the objects
          constructed by the `GtkBuilder instance`. It should be
          freed by [glib.slist.SList.free]
  */
  gobject.object.ObjectWrap[] getObjects()
  {
    GSList* _cretval;
    _cretval = gtk_builder_get_objects(cast(GtkBuilder*)this._cPtr);
    auto _retval = gSListToD!(gobject.object.ObjectWrap, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the scope in use that was set via [gtk.builder.Builder.setScope].
      Returns: the current scope
  */
  gtk.builder_scope.BuilderScope getScope()
  {
    GtkBuilderScope* _cretval;
    _cretval = gtk_builder_get_scope(cast(GtkBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.builder_scope.BuilderScope)(cast(GtkBuilderScope*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the translation domain of builder.
      Returns: the translation domain
  */
  string getTranslationDomain()
  {
    const(char)* _cretval;
    _cretval = gtk_builder_get_translation_domain(cast(GtkBuilder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Looks up a type by name.
      
      This is using the virtual function that [gtk.builder.Builder] has
      for that purpose. This is mainly used when implementing
      the [gtk.buildable.Buildable] interface on a type.
  
      Params:
        typeName = type name to lookup
      Returns: the [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] found for type_name or `G_TYPE_INVALID`
          if no type was found
  */
  gobject.types.GType getTypeFromName(string typeName)
  {
    gobject.types.GType _retval;
    const(char)* _typeName = typeName.toCString(No.Alloc);
    _retval = gtk_builder_get_type_from_name(cast(GtkBuilder*)this._cPtr, _typeName);
    return _retval;
  }

  /**
      Sets the current object for the builder.
      
      The current object can be thought of as the `this` object that the
      builder is working for and will often be used as the default object
      when an object is optional.
      
      [gtk.widget.Widget.initTemplate] for example will set the current
      object to the widget the template is inited for. For functions like
      [gtk.builder.Builder.newFromResource], the current object will be null.
  
      Params:
        currentObject = the new current object
  */
  void setCurrentObject(gobject.object.ObjectWrap currentObject = null)
  {
    gtk_builder_set_current_object(cast(GtkBuilder*)this._cPtr, currentObject ? cast(GObject*)currentObject._cPtr(No.Dup) : null);
  }

  /**
      Sets the scope the builder should operate in.
      
      If scope is null, a new [gtk.builder_cscope.BuilderCScope] will be created.
  
      Params:
        scope_ = the scope to use
  */
  void setScope(gtk.builder_scope.BuilderScope scope_ = null)
  {
    gtk_builder_set_scope(cast(GtkBuilder*)this._cPtr, scope_ ? cast(GtkBuilderScope*)(cast(gobject.object.ObjectWrap)scope_)._cPtr(No.Dup) : null);
  }

  /**
      Sets the translation domain of builder.
  
      Params:
        domain = the translation domain
  */
  void setTranslationDomain(string domain = null)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    gtk_builder_set_translation_domain(cast(GtkBuilder*)this._cPtr, _domain);
  }

  /**
      Demarshals a value from a string.
      
      This function calls [gobject.value.Value.init_] on the value argument,
      so it need not be initialised beforehand.
      
      Can handle char, uchar, boolean, int, uint, long,
      ulong, enum, flags, float, double, string, [gdk.rgba.RGBA] and
      [gtk.adjustment.Adjustment] type values.
      
      Upon errors false will be returned and error will be
      assigned a [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR` domain.
  
      Params:
        pspec = the [gobject.param_spec.ParamSpec] for the property
        string_ = the string representation of the value
        value = the [gobject.value.Value] to store the result in
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool valueFromString(gobject.param_spec.ParamSpec pspec, string string_, out gobject.value.Value value)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    GValue _value;
    GError *_err;
    _retval = cast(bool)gtk_builder_value_from_string(cast(GtkBuilder*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _string_, &_value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }

  /**
      Demarshals a value from a string.
      
      Unlike [gtk.builder.Builder.valueFromString], this function
      takes a [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] instead of [gobject.param_spec.ParamSpec].
      
      Calls [gobject.value.Value.init_] on the value argument, so it
      need not be initialised beforehand.
      
      Upon errors false will be returned and error will be
      assigned a [glib.error.ErrorWrap] from the `GTK_BUILDER_ERROR` domain.
  
      Params:
        type = the [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] of the value
        string_ = the string representation of the value
        value = the [gobject.value.Value] to store the result in
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool valueFromStringType(gobject.types.GType type, string string_, out gobject.value.Value value)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    GValue _value;
    GError *_err;
    _retval = cast(bool)gtk_builder_value_from_string_type(cast(GtkBuilder*)this._cPtr, type, _string_, &_value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }
}
