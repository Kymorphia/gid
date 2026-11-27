/// Module for [Buildable] interface mixin
module gid.gtk3.buildable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.buildable;
public import gid.gtk3.buildable_iface_proxy;
public import gid.core.utils;
public import gid.glib2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.value;
public import gid.gtk3.builder;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

/**
    GtkBuildable allows objects to extend and customize their deserialization
    from [GtkBuilder UI descriptions][BUILDER-UI].
    The interface includes methods for setting names and properties of objects,
    parsing custom tags and constructing child objects.
    
    The GtkBuildable interface is implemented by all widgets and
    many of the non-widget objects that are provided by GTK+. The
    main user of this interface is #GtkBuilder. There should be
    very little need for applications to call any of these functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    #GtkBuilder format or run any extra routines at deserialization time.
*/
template BuildableT()
{

  /**
      Adds a child to buildable. type is an optional string
      describing how the child should be added.
  
      Params:
        builder = a #GtkBuilder
        child = child to add
        type = kind of child or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddChild(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string type = null)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.addChild)
      return;

    const(char)* _type = type.toCString!(No.Malloc, Yes.Nullable);
    _klass.addChild(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _type);
  }

  /**
      Constructs a child of buildable with the name name.
      
      #GtkBuilder calls this function if a “constructor” has been
      specified in the UI definition.
  
      Params:
        builder = #GtkBuilder used to construct this object
        name = name of child to construct
      Returns: the constructed child
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConstructChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncConstructChild(gid.gtk3.builder.Builder builder, string name)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.constructChild)
      return typeof(return).init;

    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.constructChild(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is similar to [gid.gtk3.buildable.Buildable.parserFinished] but is
      called once for each custom tag handled by the buildable.
  
      Params:
        builder = a #GtkBuilder
        child = child object or null for non-child tags
        tagname = the name of the tag
        data = user data created in custom_tag_start
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCustomFinished`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCustomFinished(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, void* data = null)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.customFinished)
      return;

    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _klass.customFinished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, data);
  }

  /**
      This is called for each unknown element under `<child>`.
  
      Params:
        builder = a #GtkBuilder used to construct this object
        child = child object or null for non-child tags
        tagname = name of tag
        parser = a #GMarkupParser to fill in
        data = return location for user data that will be passed in
            to parser functions
      Returns: true if a object has a custom implementation, false
                 if it doesn't.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCustomTagStart`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCustomTagStart(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, out gid.glib2.types.MarkupParser parser, out void* data)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.customTagStart)
      return typeof(return).init;

    bool _retval;
    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.customTagStart(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, cast(GMarkupParser*)&parser, cast(void**)&data);
    return _retval;
  }

  /**
      Get the internal child called childname of the buildable object.
  
      Params:
        builder = a #GtkBuilder
        childname = name of child
      Returns: the internal child of the buildable object
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInternalChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetInternalChild(gid.gtk3.builder.Builder builder, string childname)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.getInternalChild)
      return typeof(return).init;

    GObject* _cretval;
    const(char)* _childname = childname.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getInternalChild(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _childname);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the buildable object.
      
      #GtkBuilder sets the name based on the
      [GtkBuilder UI definition][BUILDER-UI]
      used to construct the buildable.
      Returns: the name set with [gid.gtk3.buildable.Buildable.setName]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getName(cast(GtkBuildable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Called when the builder finishes the parsing of a
      [GtkBuilder UI definition][BUILDER-UI].
      Note that this will be called once for each time
      [gid.gtk4.builder.Builder.addFromFile] or [gid.gtk4.builder.Builder.addFromString]
      is called on a builder.
  
      Params:
        builder = a #GtkBuilder
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncParserFinished`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncParserFinished(gid.gtk3.builder.Builder builder)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.parserFinished)
      return;

    _klass.parserFinished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null);
  }

  /**
      Sets the property name name to value on the buildable object.
  
      Params:
        builder = a #GtkBuilder
        name = name of property
        value = value of property
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetBuildableProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetBuildableProperty(gid.gtk3.builder.Builder builder, string name, gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.setBuildableProperty)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.setBuildableProperty(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the buildable object.
  
      Params:
        name = name to set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetName(string name)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.buildable.Buildable._getGType);
    if (!_klass || !_klass.setName)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.setName(cast(GtkBuildable*)this._cPtr, _name);
  }

  /**
      Adds a child to buildable. type is an optional string
      describing how the child should be added.
  
      Params:
        builder = a #GtkBuilder
        child = child to add
        type = kind of child or null
  */
  override void addChild(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string type = null) nothrow
  {
    const(char)* _type = type.toCString!(No.Malloc, Yes.Nullable);
    gtk_buildable_add_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _type);
  }

  /**
      Constructs a child of buildable with the name name.
      
      #GtkBuilder calls this function if a “constructor” has been
      specified in the UI definition.
  
      Params:
        builder = #GtkBuilder used to construct this object
        name = name of child to construct
      Returns: the constructed child
  */
  override gid.gobject2.object.ObjectWrap constructChild(gid.gtk3.builder.Builder builder, string name) nothrow
  {
    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_buildable_construct_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is similar to [gid.gtk3.buildable.Buildable.parserFinished] but is
      called once for each custom tag handled by the buildable.
  
      Params:
        builder = a #GtkBuilder
        child = child object or null for non-child tags
        tagname = the name of the tag
        data = user data created in custom_tag_start
  */
  override void customFinished(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, void* data = null) nothrow
  {
    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    gtk_buildable_custom_finished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, data);
  }

  /**
      This is called for each unknown element under `<child>`.
  
      Params:
        builder = a #GtkBuilder used to construct this object
        child = child object or null for non-child tags
        tagname = name of tag
        parser = a #GMarkupParser to fill in
        data = return location for user data that will be passed in
            to parser functions
      Returns: true if a object has a custom implementation, false
                 if it doesn't.
  */
  override bool customTagStart(gid.gtk3.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, out gid.glib2.types.MarkupParser parser, out void* data) nothrow
  {
    bool _retval;
    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_buildable_custom_tag_start(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, cast(GMarkupParser*)&parser, cast(void**)&data);
    return _retval;
  }

  /**
      Get the internal child called childname of the buildable object.
  
      Params:
        builder = a #GtkBuilder
        childname = name of child
      Returns: the internal child of the buildable object
  */
  override gid.gobject2.object.ObjectWrap getInternalChild(gid.gtk3.builder.Builder builder, string childname) nothrow
  {
    GObject* _cretval;
    const(char)* _childname = childname.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_buildable_get_internal_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _childname);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the buildable object.
      
      #GtkBuilder sets the name based on the
      [GtkBuilder UI definition][BUILDER-UI]
      used to construct the buildable.
      Returns: the name set with [gid.gtk3.buildable.Buildable.setName]
  */
  override string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_buildable_get_name(cast(GtkBuildable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Called when the builder finishes the parsing of a
      [GtkBuilder UI definition][BUILDER-UI].
      Note that this will be called once for each time
      [gid.gtk4.builder.Builder.addFromFile] or [gid.gtk4.builder.Builder.addFromString]
      is called on a builder.
  
      Params:
        builder = a #GtkBuilder
  */
  override void parserFinished(gid.gtk3.builder.Builder builder) nothrow
  {
    gtk_buildable_parser_finished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null);
  }

  /**
      Sets the property name name to value on the buildable object.
  
      Params:
        builder = a #GtkBuilder
        name = name of property
        value = value of property
  */
  override void setBuildableProperty(gid.gtk3.builder.Builder builder, string name, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_buildable_set_buildable_property(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the buildable object.
  
      Params:
        name = name to set
  */
  override void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_buildable_set_name(cast(GtkBuildable*)this._cPtr, _name);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.buildable.Buildable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_buildable_Buildable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConstructChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomFinished", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagStart", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInternalChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParserFinished", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetBuildableProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetName", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.buildable.Buildable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_buildable_Buildable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "add_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConstructChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "construct_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomFinished", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "custom_finished");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagStart", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "custom_tag_start");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInternalChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "get_internal_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.buildable.Buildable.vfuncGetName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParserFinished", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "parser_finished");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetBuildableProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "set_buildable_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_buildable_Buildable(iface, "set_name");
  }

  private static void _installIfaceVfunc_gid_gtk3_buildable_Buildable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkBuildableIface*)iface;

    switch (vfunc)
    {
      case "add_child":
      {
        static extern(C) void _vfuncAddChildTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* type) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.addChild)
              return (cast(typeof(&_vfuncAddChildTramp))_klass.addChild)(buildable, builder, child, type);
            return;
          }

          string _type = type.fromCString!(No.Free);

          try
          {
            _obj.vfuncAddChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncAddChild");
          }
        }

        _klass.addChild = cast(typeof(_klass.addChild))&_vfuncAddChildTramp;
        break;
      }
      case "construct_child":
      {
        static extern(C) GObject* _vfuncConstructChildTramp(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.constructChild)
              return (cast(typeof(&_vfuncConstructChildTramp))_klass.constructChild)(buildable, builder, name);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncConstructChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), _name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncConstructChild");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.constructChild = cast(typeof(_klass.constructChild))&_vfuncConstructChildTramp;
        break;
      }
      case "custom_finished":
      {
        static extern(C) void _vfuncCustomFinishedTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.customFinished)
              return (cast(typeof(&_vfuncCustomFinishedTramp))_klass.customFinished)(buildable, builder, child, tagname, data);
            return;
          }

          string _tagname = tagname.fromCString!(No.Free);

          try
          {
            _obj.vfuncCustomFinished(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _tagname, data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncCustomFinished");
          }
        }

        _klass.customFinished = cast(typeof(_klass.customFinished))&_vfuncCustomFinishedTramp;
        break;
      }
      case "custom_tag_start":
      {
        static extern(C) gboolean _vfuncCustomTagStartTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, GMarkupParser* parser, void** data) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.customTagStart)
              return (cast(typeof(&_vfuncCustomTagStartTramp))_klass.customTagStart)(buildable, builder, child, tagname, parser, data);
            return typeof(return).init;
          }

          typeof(*data) _dataNull;
          if (!data)
            data = &_dataNull;

          bool _dretval;
          string _tagname = tagname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncCustomTagStart(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _tagname, *cast(gid.glib2.types.MarkupParser*)parser, *data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncCustomTagStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.customTagStart = cast(typeof(_klass.customTagStart))&_vfuncCustomTagStartTramp;
        break;
      }
      case "get_internal_child":
      {
        static extern(C) GObject* _vfuncGetInternalChildTramp(GtkBuildable* buildable, GtkBuilder* builder, const(char)* childname) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.getInternalChild)
              return (cast(typeof(&_vfuncGetInternalChildTramp))_klass.getInternalChild)(buildable, builder, childname);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;
          string _childname = childname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetInternalChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), _childname);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncGetInternalChild");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getInternalChild = cast(typeof(_klass.getInternalChild))&_vfuncGetInternalChildTramp;
        break;
      }
      case "parser_finished":
      {
        static extern(C) void _vfuncParserFinishedTramp(GtkBuildable* buildable, GtkBuilder* builder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.parserFinished)
              return (cast(typeof(&_vfuncParserFinishedTramp))_klass.parserFinished)(buildable, builder);
            return;
          }

          try
          {
            _obj.vfuncParserFinished(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncParserFinished");
          }
        }

        _klass.parserFinished = cast(typeof(_klass.parserFinished))&_vfuncParserFinishedTramp;
        break;
      }
      case "set_buildable_property":
      {
        static extern(C) void _vfuncSetBuildablePropertyTramp(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name, const(GValue)* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.setBuildableProperty)
              return (cast(typeof(&_vfuncSetBuildablePropertyTramp))_klass.setBuildableProperty)(buildable, builder, name, value);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetBuildableProperty(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.builder.Builder)(cast(void*)builder, No.Take), _name, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncSetBuildableProperty");
          }
        }

        _klass.setBuildableProperty = cast(typeof(_klass.setBuildableProperty))&_vfuncSetBuildablePropertyTramp;
        break;
      }
      case "set_name":
      {
        static extern(C) void _vfuncSetNameTramp(GtkBuildable* buildable, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk3.buildable.Buildable._getGType);
            if (_klass && _klass.setName)
              return (cast(typeof(&_vfuncSetNameTramp))_klass.setName)(buildable, name);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetName(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.buildable.Buildable.vfuncSetName");
          }
        }

        _klass.setName = cast(typeof(_klass.setName))&_vfuncSetNameTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.buildable.Buildable]
template BuildableGidBuilderT()
{
}
