/// Module for [Builder] class
module gtk.builder;

import gid.gid;
import glib.error;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.application;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A GtkBuilder is an auxiliary object that reads textual descriptions
    of a user interface and instantiates the described objects. To create
    a GtkBuilder from a user interface description, call
    [gtk.builder.Builder.newFromFile], [gtk.builder.Builder.newFromResource] or
    [gtk.builder.Builder.newFromString].
    
    In the (unusual) case that you want to add user interface
    descriptions from multiple sources to the same GtkBuilder you can
    call [gtk.builder.Builder.new_] to get an empty builder and populate it by
    (multiple) calls to [gtk.builder.Builder.addFromFile],
    [gtk.builder.Builder.addFromResource] or [gtk.builder.Builder.addFromString].
    
    A GtkBuilder holds a reference to all objects that it has constructed
    and drops these references when it is finalized. This finalization can
    cause the destruction of non-widget objects or widgets which are not
    contained in a toplevel window. For toplevel windows constructed by a
    builder, it is the responsibility of the user to call [gtk.widget.Widget.destroy]
    to get rid of them and all the widgets they contain.
    
    The functions [gtk.builder.Builder.getObject] and [gtk.builder.Builder.getObjects]
    can be used to access the widgets in the interface by the names assigned
    to them inside the UI description. Toplevel windows returned by these
    functions will stay around until the user explicitly destroys them
    with [gtk.widget.Widget.destroy]. Other widgets will either be part of a
    larger hierarchy constructed by the builder (in which case you should
    not have to worry about their lifecycle), or without a parent, in which
    case they have to be added to some container to make use of them.
    Non-widget objects need to be reffed with [gobject.object.ObjectWrap.ref_] to keep them
    beyond the lifespan of the builder.
    
    The function [gtk.builder.Builder.connectSignals] and variants thereof can be
    used to connect handlers to the named signals in the description.
    
    # GtkBuilder UI Definitions # {#BUILDER-UI}
    
    GtkBuilder parses textual descriptions of user interfaces which are
    specified in an XML format which can be roughly described by the
    RELAX NG schema below. We refer to these descriptions as “GtkBuilder
    UI definitions” or just “UI definitions” if the context is clear.
    Do not confuse GtkBuilder UI Definitions with
    [GtkUIManager UI Definitions][XML-UI], which are more limited in scope.
    It is common to use `.ui` as the filename extension for files containing
    GtkBuilder UI definitions.
    
    [RELAX NG Compact Syntax](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkbuilder.rnc)
    
    The toplevel element is `<interface>`. It optionally takes a “domain”
    attribute, which will make the builder look for translated strings
    using dgettext() in the domain specified. This can also be done by
    calling [gtk.builder.Builder.setTranslationDomain] on the builder.
    Objects are described by `<object>` elements, which can contain
    `<property>` elements to set properties, `<signal>` elements which
    connect signals to handlers, and `<child>` elements, which describe
    child objects (most often widgets inside a container, but also e.g.
    actions in an action group, or columns in a tree model). A `<child>`
    element contains an `<object>` element which describes the child object.
    The target toolkit version(s) are described by `<requires>` elements,
    the “lib” attribute specifies the widget library in question (currently
    the only supported value is “gtk+”) and the “version” attribute specifies
    the target version in the form `<major>.<minor>`. The builder will error
    out if the version requirements are not met.
    
    Typically, the specific kind of object represented by an `<object>`
    element is specified by the “class” attribute. If the type has not
    been loaded yet, GTK+ tries to find the `get_type()` function from the
    class name by applying heuristics. This works in most cases, but if
    necessary, it is possible to specify the name of the get_type() function
    explictly with the "type-func" attribute. As a special case, GtkBuilder
    allows to use an object that has been constructed by a #GtkUIManager in
    another part of the UI definition by specifying the id of the #GtkUIManager
    in the “constructor” attribute and the name of the object in the “id”
    attribute.
    
    Objects may be given a name with the “id” attribute, which allows the
    application to retrieve them from the builder with [gtk.builder.Builder.getObject].
    An id is also necessary to use the object as property value in other
    parts of the UI definition. GTK+ reserves ids starting and ending
    with `___` (3 underscores) for its own purposes.
    
    Setting properties of objects is pretty straightforward with the
    `<property>` element: the “name” attribute specifies the name of the
    property, and the content of the element specifies the value.
    If the “translatable” attribute is set to a true value, GTK+ uses
    gettext() (or dgettext() if the builder has a translation domain set)
    to find a translation for the value. This happens before the value
    is parsed, so it can be used for properties of any type, but it is
    probably most useful for string properties. It is also possible to
    specify a context to disambiguate short strings, and comments which
    may help the translators.
    
    GtkBuilder can parse textual representations for the most common
    property types: characters, strings, integers, floating-point numbers,
    booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
    as true, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
    as false), enumerations (can be specified by their name, nick or
    integer value), flags (can be specified by their name, nick, integer
    value, optionally combined with “|”, e.g. “GTK_VISIBLE|GTK_REALIZED”)
    and colors (in a format understood by [gdk.rgba.RGBA.parse]).
    
    GVariants can be specified in the format understood by [glib.variant.Variant.parse],
    and pixbufs can be specified as a filename of an image file to load.
    
    Objects can be referred to by their name and by default refer to
    objects declared in the local xml fragment and objects exposed via
    [gtk.builder.Builder.exposeObject]. In general, GtkBuilder allows forward
    references to objects — declared in the local xml; an object doesn’t
    have to be constructed before it can be referred to. The exception
    to this rule is that an object has to be constructed before it can
    be used as the value of a construct-only property.
    
    It is also possible to bind a property value to another object's
    property value using the attributes
    "bind-source" to specify the source object of the binding,
    "bind-property" to specify the source property and optionally
    "bind-flags" to specify the binding flags.
    Internally builder implements this using GBinding objects.
    For more information see [gobject.object.ObjectWrap.bindProperty]
    
    Signal handlers are set up with the `<signal>` element. The “name”
    attribute specifies the name of the signal, and the “handler” attribute
    specifies the function to connect to the signal. By default, GTK+ tries
    to find the handler using [gmodule.module_.Module.symbol], but this can be changed by
    passing a custom #GtkBuilderConnectFunc to
    [gtk.builder.Builder.connectSignalsFull]. The remaining attributes, “after”,
    “swapped” and “object”, have the same meaning as the corresponding
    parameters of the [gobject.global.signalConnectObject] or
    [gobject.global.signalConnectData] functions. A “last_modification_time”
    attribute is also allowed, but it does not have a meaning to the
    builder.
    
    Sometimes it is necessary to refer to widgets which have implicitly
    been constructed by GTK+ as part of a composite widget, to set
    properties on them or to add further children (e.g. the @vbox of
    a #GtkDialog). This can be achieved by setting the “internal-child”
    property of the `<child>` element to a true value. Note that GtkBuilder
    still requires an `<object>` element for the internal child, even if it
    has already been constructed.
    
    A number of widgets have different places where a child can be added
    (e.g. tabs vs. page content in notebooks). This can be reflected in
    a UI definition by specifying the “type” attribute on a `<child>`
    The possible values for the “type” attribute are described in the
    sections describing the widget-specific portions of UI definitions.
    
    # A GtkBuilder UI Definition
    
    ```xml
    <interface>
      <object class="GtkDialog" id="dialog1">
        <child internal-child="vbox">
          <object class="GtkBox" id="vbox1">
            <property name="border-width">10</property>
            <child internal-child="action_area">
              <object class="GtkButtonBox" id="hbuttonbox1">
                <property name="border-width">20</property>
                <child>
                  <object class="GtkButton" id="ok_button">
                    <property name="label">gtk-ok</property>
                    <property name="use-stock">TRUE</property>
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
    
    Beyond this general structure, several object classes define their
    own XML DTD fragments for filling in the ANY placeholders in the DTD
    above. Note that a custom element in a `<child>` element gets parsed by
    the custom tag handler of the parent object, while a custom element in
    an `<object>` element gets parsed by the custom tag handler of the object.
    
    These XML fragments are explained in the documentation of the
    respective objects.
    
    Additionally, since 3.10 a special `<template>` tag has been added
    to the format allowing one to define a widget class’s components.
    See the [GtkWidget documentation][composite-templates] for details.
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
      Get `translationDomain` property.
      Returns: The translation domain used when translating property values that
      have been marked as translatable in interface descriptions.
      If the translation domain is null, #GtkBuilder uses gettext(),
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
        have been marked as translatable in interface descriptions.
        If the translation domain is null, #GtkBuilder uses gettext(),
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
      
      Most users will probably want to use [gtk.builder.Builder.newFromFile],
      [gtk.builder.Builder.newFromResource] or [gtk.builder.Builder.newFromString].
      Returns: a new (empty) #GtkBuilder object
  */
  this()
  {
    GtkBuilder* _cretval;
    _cretval = gtk_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Builds the [GtkBuilder UI definition][BUILDER-UI]
      in the file filename.
      
      If there is an error opening the file or parsing the description then
      the program will be aborted.  You should only ever attempt to parse
      user interface descriptions that are shipped as part of your program.
  
      Params:
        filename = filename of user interface description file
      Returns: a #GtkBuilder containing the described interface
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
      Builds the [GtkBuilder UI definition][BUILDER-UI]
      at resource_path.
      
      If there is an error locating the resource or parsing the
      description, then the program will be aborted.
  
      Params:
        resourcePath = a #GResource resource path
      Returns: a #GtkBuilder containing the described interface
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
      Builds the user interface described by string (in the
      [GtkBuilder UI definition][BUILDER-UI] format).
      
      If string is null-terminated, then length should be -1.
      If length is not -1, then it is the length of string.
      
      If there is an error parsing string then the program will be
      aborted. You should not attempt to parse user interface description
      from untrusted sources.
  
      Params:
        string_ = a user interface (XML) description
        length = the length of string, or -1
      Returns: a #GtkBuilder containing the interface described by string
  */
  static gtk.builder.Builder newFromString(string string_, ptrdiff_t length)
  {
    GtkBuilder* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_builder_new_from_string(_string_, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.builder.Builder)(cast(GtkBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses a file containing a [GtkBuilder UI definition][BUILDER-UI]
      and merges it with the current contents of builder.
      
      Most users will probably want to use [gtk.builder.Builder.newFromFile].
      
      If an error occurs, 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_FILE_ERROR
      domain.
      
      It’s not really reasonable to attempt to handle failures of this
      call. You should not use this function with untrusted files (ie:
      files that are not part of your application). Broken #GtkBuilder
      files can easily crash your program, and it’s possible that memory
      was leaked leading up to the reported failure. The only reasonable
      thing to do when an error is detected is to call g_error().
  
      Params:
        filename = the name of the file to parse
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addFromFile(string filename)
  {
    uint _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_builder_add_from_file(cast(GtkBuilder*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a resource file containing a [GtkBuilder UI definition][BUILDER-UI]
      and merges it with the current contents of builder.
      
      Most users will probably want to use [gtk.builder.Builder.newFromResource].
      
      If an error occurs, 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_RESOURCE_ERROR
      domain.
      
      It’s not really reasonable to attempt to handle failures of this
      call.  The only reasonable thing to do when an error is detected is
      to call g_error().
  
      Params:
        resourcePath = the path of the resource file to parse
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addFromResource(string resourcePath)
  {
    uint _retval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_builder_add_from_resource(cast(GtkBuilder*)this._cPtr, _resourcePath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a string containing a [GtkBuilder UI definition][BUILDER-UI]
      and merges it with the current contents of builder.
      
      Most users will probably want to use [gtk.builder.Builder.newFromString].
      
      Upon errors 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or
      #G_VARIANT_PARSE_ERROR domain.
      
      It’s not really reasonable to attempt to handle failures of this
      call.  The only reasonable thing to do when an error is detected is
      to call g_error().
  
      Params:
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addFromString(string buffer, size_t length)
  {
    uint _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_builder_add_from_string(cast(GtkBuilder*)this._cPtr, _buffer, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a file containing a [GtkBuilder UI definition][BUILDER-UI]
      building only the requested objects and merges
      them with the current contents of builder.
      
      Upon errors 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_FILE_ERROR
      domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a #GtkTreeView that depends on its
      #GtkTreeModel), you have to explicitly list all of them in object_ids.
  
      Params:
        filename = the name of the file to parse
        objectIds = nul-terminated array of objects to build
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addObjectsFromFile(string filename, string[] objectIds)
  {
    uint _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    char*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    char** _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = gtk_builder_add_objects_from_file(cast(GtkBuilder*)this._cPtr, _filename, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a resource file containing a [GtkBuilder UI definition][BUILDER-UI]
      building only the requested objects and merges
      them with the current contents of builder.
      
      Upon errors 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_RESOURCE_ERROR
      domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a #GtkTreeView that depends on its
      #GtkTreeModel), you have to explicitly list all of them in object_ids.
  
      Params:
        resourcePath = the path of the resource file to parse
        objectIds = nul-terminated array of objects to build
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addObjectsFromResource(string resourcePath, string[] objectIds)
  {
    uint _retval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    char*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    char** _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = gtk_builder_add_objects_from_resource(cast(GtkBuilder*)this._cPtr, _resourcePath, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses a string containing a [GtkBuilder UI definition][BUILDER-UI]
      building only the requested objects and merges
      them with the current contents of builder.
      
      Upon errors 0 will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR or #G_MARKUP_ERROR domain.
      
      If you are adding an object that depends on an object that is not
      its child (for instance a #GtkTreeView that depends on its
      #GtkTreeModel), you have to explicitly list all of them in object_ids.
  
      Params:
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
        objectIds = nul-terminated array of objects to build
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint addObjectsFromString(string buffer, size_t length, string[] objectIds)
  {
    uint _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    char*[] _tmpobjectIds;
    foreach (s; objectIds)
      _tmpobjectIds ~= s.toCString(No.Alloc);
    _tmpobjectIds ~= null;
    char** _objectIds = _tmpobjectIds.ptr;

    GError *_err;
    _retval = gtk_builder_add_objects_from_string(cast(GtkBuilder*)this._cPtr, _buffer, length, _objectIds, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This method is a simpler variation of [gtk.builder.Builder.connectSignalsFull].
      It uses symbols explicitly added to builder with prior calls to
      [gtk.builder.Builder.addCallbackSymbol]. In the case that symbols are not
      explicitly added; it uses #GModule’s introspective features (by opening the module null)
      to look at the application’s symbol table. From here it tries to match
      the signal handler names given in the interface description with
      symbols in the application and connects the signals. Note that this
      function can only be called once, subsequent calls will do nothing.
      
      Note that unless [gtk.builder.Builder.addCallbackSymbol] is called for
      all signal callbacks which are referenced by the loaded XML, this
      function will require that #GModule be supported on the platform.
      
      If you rely on #GModule support to lookup callbacks in the symbol table,
      the following details should be noted:
      
      When compiling applications for Windows, you must declare signal callbacks
      with #G_MODULE_EXPORT, or they will not be put in the symbol table.
      On Linux and Unices, this is not necessary; applications should instead
      be compiled with the -Wl,--export-dynamic CFLAGS, and linked against
      gmodule-export-2.0.
  
      Params:
        userData = user data to pass back with all signals
  */
  void connectSignals(void* userData = null)
  {
    gtk_builder_connect_signals(cast(GtkBuilder*)this._cPtr, userData);
  }

  /**
      This function can be thought of the interpreted language binding
      version of [gtk.builder.Builder.connectSignals], except that it does not
      require GModule to function correctly.
  
      Params:
        func = the function used to connect the signals
  */
  void connectSignalsFull(gtk.types.BuilderConnectFunc func)
  {
    extern(C) void _funcCallback(GtkBuilder* builder, GObject* object, const(char)* signalName, const(char)* handlerName, GObject* connectObject, GConnectFlags flags, void* userData)
    {
      auto _dlg = cast(gtk.types.BuilderConnectFunc*)userData;
      string _signalName = signalName.fromCString(No.Free);
      string _handlerName = handlerName.fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.builder.Builder)(cast(void*)builder, No.Take), gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)object, No.Take), _signalName, _handlerName, gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)connectObject, No.Take), flags);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_builder_connect_signals_full(cast(GtkBuilder*)this._cPtr, _funcCB, _func);
  }

  /**
      Add object to the builder object pool so it can be referenced just like any
      other object built by builder.
  
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
      Main private entry point for building composite container
      components from template XML.
      
      This is exported purely to let gtk-builder-tool validate
      templates, applications have no need to call this function.
  
      Params:
        widget = the widget that is being extended
        templateType = the type that the template is for
        buffer = the string to parse
        length = the length of buffer (may be -1 if buffer is nul-terminated)
      Returns: A positive value on success, 0 if an error occurred
      Throws: [ErrorWrap]
  */
  uint extendWithTemplate(gtk.widget.Widget widget, gobject.types.GType templateType, string buffer, size_t length)
  {
    uint _retval;
    const(char)* _buffer = buffer.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_builder_extend_with_template(cast(GtkBuilder*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, templateType, _buffer, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the #GtkApplication associated with the builder.
      
      The #GtkApplication is used for creating action proxies as requested
      from XML that the builder is loading.
      
      By default, the builder uses the default application: the one from
      [gio.application.Application.getDefault]. If you want to use another application
      for constructing proxies, use [gtk.builder.Builder.setApplication].
      Returns: the application being used by the builder,
            or null
  */
  gtk.application.Application getApplication()
  {
    GtkApplication* _cretval;
    _cretval = gtk_builder_get_application(cast(GtkBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.application.Application)(cast(GtkApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the object named name. Note that this function does not
      increment the reference count of the returned object.
  
      Params:
        name = name of object to get
      Returns: the object named name or null if
           it could not be found in the object tree.
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
      Gets all objects that have been constructed by builder. Note that
      this function does not increment the reference counts of the returned
      objects.
      Returns: a newly-allocated #GSList containing all the objects
          constructed by the #GtkBuilder instance. It should be freed by
          [glib.slist.SList.free]
  */
  gobject.object.ObjectWrap[] getObjects()
  {
    GSList* _cretval;
    _cretval = gtk_builder_get_objects(cast(GtkBuilder*)this._cPtr);
    auto _retval = gSListToD!(gobject.object.ObjectWrap, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the translation domain of builder.
      Returns: the translation domain. This string is owned
        by the builder object and must not be modified or freed.
  */
  string getTranslationDomain()
  {
    const(char)* _cretval;
    _cretval = gtk_builder_get_translation_domain(cast(GtkBuilder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Looks up a type by name, using the virtual function that
      #GtkBuilder has for that purpose. This is mainly used when
      implementing the #GtkBuildable interface on a type.
  
      Params:
        typeName = type name to lookup
      Returns: the #GType found for type_name or #G_TYPE_INVALID
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
      Sets the application associated with builder.
      
      You only need this function if there is more than one #GApplication
      in your process. application cannot be null.
  
      Params:
        application = a #GtkApplication
  */
  void setApplication(gtk.application.Application application)
  {
    gtk_builder_set_application(cast(GtkBuilder*)this._cPtr, application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
  }

  /**
      Sets the translation domain of builder.
      See #GtkBuilder:translation-domain.
  
      Params:
        domain = the translation domain or null
  */
  void setTranslationDomain(string domain = null)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    gtk_builder_set_translation_domain(cast(GtkBuilder*)this._cPtr, _domain);
  }

  /**
      This function demarshals a value from a string. This function
      calls [gobject.value.Value.init_] on the value argument, so it need not be
      initialised beforehand.
      
      This function can handle char, uchar, boolean, int, uint, long,
      ulong, enum, flags, float, double, string, #GdkColor, #GdkRGBA and
      #GtkAdjustment type values. Support for #GtkWidget type values is
      still to come.
      
      Upon errors false will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR domain.
  
      Params:
        pspec = the #GParamSpec for the property
        string_ = the string representation of the value
        value = the #GValue to store the result in
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
      Like [gtk.builder.Builder.valueFromString], this function demarshals
      a value from a string, but takes a #GType instead of #GParamSpec.
      This function calls [gobject.value.Value.init_] on the value argument, so it
      need not be initialised beforehand.
      
      Upon errors false will be returned and error will be assigned a
      #GError from the #GTK_BUILDER_ERROR domain.
  
      Params:
        type = the #GType of the value
        string_ = the string representation of the value
        value = the #GValue to store the result in
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
