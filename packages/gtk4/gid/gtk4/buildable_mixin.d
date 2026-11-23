/// Module for [Buildable] interface mixin
module gid.gtk4.buildable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.buildable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.value;
public import gid.gtk4.builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    Allows objects to extend and customize deserialization from ui files.
    
    The [gid.gtk4.buildable.Buildable] interface includes methods for setting names and
    properties of objects, parsing custom tags and constructing child objects.
    
    It is implemented by all widgets and many of the non-widget objects that are
    provided by GTK. The main user of this interface is [gid.gtk4.builder.Builder].
    There should be very little need for applications to call any of these
    functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    [gid.gtk4.builder.Builder] XML format or run any extra routines at deserialization time.
*/
template BuildableT()
{

  /**
      Adds a child to buildable. type is an optional string
      describing how the child should be added.
  
      Params:
        builder = a [gid.gtk4.builder.Builder]
        child = child to add
        type = kind of child or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddChild(gid.gtk4.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string type = null)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.addChild)
      return;

    const(char)* _type = type.toCString!(No.Malloc, Yes.Nullable);
    _klass.addChild(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _type);
  }

  /**
      Similar to [gid.gtk3.buildable.Buildable.parserFinished] but is
      called once for each custom tag handled by the buildable.
  
      Params:
        builder = a [gid.gtk4.builder.Builder]
        child = child object or null for non-child tags
        tagname = the name of the tag
        data = user data created in custom_tag_start
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCustomFinished`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCustomFinished(gid.gtk4.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, void* data = null)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.customFinished)
      return;

    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _klass.customFinished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, data);
  }

  /**
      Called at the end of each custom element handled by
      the buildable.
  
      Params:
        builder = [gid.gtk4.builder.Builder] used to construct this object
        child = child object or null for non-child tags
        tagname = name of tag
        data = user data that will be passed in to parser functions
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCustomTagEnd`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCustomTagEnd(gid.gtk4.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, void* data = null)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.customTagEnd)
      return;

    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _klass.customTagEnd(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, data);
  }

  /**
      Called for each unknown element under `<child>`.
  
      Params:
        builder = a [gid.gtk4.builder.Builder] used to construct this object
        child = child object or null for non-child tags
        tagname = name of tag
        parser = a [gid.gtk4.types.BuildableParser] to fill in
        data = return location for user data that will be passed in
            to parser functions
      Returns: true if an object has a custom implementation, false
          if it doesn't.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCustomTagStart`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCustomTagStart(gid.gtk4.builder.Builder builder, gid.gobject2.object.ObjectWrap child, string tagname, out gid.gtk4.types.BuildableParser parser, out void* data)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.customTagStart)
      return typeof(return).init;

    bool _retval;
    const(char)* _tagname = tagname.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.customTagStart(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, cast(GtkBuildableParser*)&parser, cast(void**)&data);
    return _retval;
  }

  /**
      The getter corresponding to set_id. Implement this
        if you implement set_id.
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetId`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetId()
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.getId)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getId(cast(GtkBuildable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the internal child called childname of the buildable object.
  
      Params:
        builder = a [gid.gtk4.builder.Builder]
        childname = name of child
      Returns: the internal child of the buildable object
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInternalChild`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetInternalChild(gid.gtk4.builder.Builder builder, string childname)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.getInternalChild)
      return typeof(return).init;

    GObject* _cretval;
    const(char)* _childname = childname.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getInternalChild(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _childname);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Called when a builder finishes the parsing
       of a UI definition. It is normally not necessary to implement this,
       unless you need to perform special cleanup actions. [gid.gtk4.window.Window] sets
       the `GtkWidget:visible` property here.
  
      Params:
        builder = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncParserFinished`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncParserFinished(gid.gtk4.builder.Builder builder)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.parserFinished)
      return;

    _klass.parserFinished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null);
  }

  /**
      Sets a property of a buildable object.
       It is normally not necessary to implement this, [gid.gobject2.object.ObjectWrap.setProperty]
       is used by default. [gid.gtk4.window.Window] implements this to delay showing itself
       (i.e. setting the [gid.gtk4.widget.Widget.visible] property) until the whole
       interface is created.
  
      Params:
        builder = 
        name = 
        value = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetBuildableProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetBuildableProperty(gid.gtk4.builder.Builder builder, string name, gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.setBuildableProperty)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.setBuildableProperty(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Stores the id attribute given in the [gid.gtk4.builder.Builder] UI definition.
        [gid.gtk4.widget.Widget] stores the name as object data. Implement this method if your
        object has some notion of “ID” and it makes sense to map the XML id
        attribute to it.
  
      Params:
        id = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetId`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetId(string id)
  {
    auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.buildable.Buildable._getGType);
    if (!_klass || !_klass.setId)
      return;

    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _klass.setId(cast(GtkBuildable*)this._cPtr, _id);
  }

  /**
      Gets the ID of the buildable object.
      
      [gid.gtk4.builder.Builder] sets the name based on the ID attribute
      of the `<object>` tag used to construct the buildable.
      Returns: the ID of the buildable object
  */
  override string getBuildableId() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_buildable_get_buildable_id(cast(GtkBuildable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.buildable.Buildable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_buildable_Buildable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomFinished", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagEnd", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagStart", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetId", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInternalChild", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParserFinished", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetBuildableProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetId", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.buildable.Buildable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_buildable_Buildable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "add_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomFinished", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "custom_finished");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagEnd", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "custom_tag_end");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCustomTagStart", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "custom_tag_start");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk4.buildable.Buildable.vfuncGetId is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInternalChild", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "get_internal_child");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncParserFinished", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "parser_finished");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetBuildableProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "set_buildable_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_buildable_Buildable(iface, "set_id");
  }

  private static void _installIfaceVfunc_gid_gtk4_buildable_Buildable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkBuildableIface*)iface;

    switch (vfunc)
    {
      case "add_child":
      {
        static extern(C) void _vfuncAddChildTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* type) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.addChild)
              return (cast(typeof(&_vfuncAddChildTramp))_klass.addChild)(buildable, builder, child, type);
            return;
          }

          string _type = type.fromCString!(No.Free);

          try
          {
            _obj.vfuncAddChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncAddChild");
          }
        }

        _klass.addChild = cast(typeof(_klass.addChild))&_vfuncAddChildTramp;
        break;
      }
      case "custom_finished":
      {
        static extern(C) void _vfuncCustomFinishedTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.customFinished)
              return (cast(typeof(&_vfuncCustomFinishedTramp))_klass.customFinished)(buildable, builder, child, tagname, data);
            return;
          }

          string _tagname = tagname.fromCString!(No.Free);

          try
          {
            _obj.vfuncCustomFinished(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _tagname, data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncCustomFinished");
          }
        }

        _klass.customFinished = cast(typeof(_klass.customFinished))&_vfuncCustomFinishedTramp;
        break;
      }
      case "custom_tag_end":
      {
        static extern(C) void _vfuncCustomTagEndTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.customTagEnd)
              return (cast(typeof(&_vfuncCustomTagEndTramp))_klass.customTagEnd)(buildable, builder, child, tagname, data);
            return;
          }

          string _tagname = tagname.fromCString!(No.Free);

          try
          {
            _obj.vfuncCustomTagEnd(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _tagname, data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncCustomTagEnd");
          }
        }

        _klass.customTagEnd = cast(typeof(_klass.customTagEnd))&_vfuncCustomTagEndTramp;
        break;
      }
      case "custom_tag_start":
      {
        static extern(C) gboolean _vfuncCustomTagStartTramp(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, GtkBuildableParser* parser, void** data) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
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
            _dretval = _obj.vfuncCustomTagStart(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)child, No.Take), _tagname, *cast(gid.gtk4.types.BuildableParser*)parser, *data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncCustomTagStart");
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
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.getInternalChild)
              return (cast(typeof(&_vfuncGetInternalChildTramp))_klass.getInternalChild)(buildable, builder, childname);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;
          string _childname = childname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetInternalChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), _childname);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncGetInternalChild");
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
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.parserFinished)
              return (cast(typeof(&_vfuncParserFinishedTramp))_klass.parserFinished)(buildable, builder);
            return;
          }

          try
          {
            _obj.vfuncParserFinished(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncParserFinished");
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
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.setBuildableProperty)
              return (cast(typeof(&_vfuncSetBuildablePropertyTramp))_klass.setBuildableProperty)(buildable, builder, name, value);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetBuildableProperty(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), _name, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncSetBuildableProperty");
          }
        }

        _klass.setBuildableProperty = cast(typeof(_klass.setBuildableProperty))&_vfuncSetBuildablePropertyTramp;
        break;
      }
      case "set_id":
      {
        static extern(C) void _vfuncSetIdTramp(GtkBuildable* buildable, const(char)* id) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buildable);
          if (!_obj)
          {
            auto _klass = cast(GtkBuildableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buildable), gid.gtk4.buildable.Buildable._getGType);
            if (_klass && _klass.setId)
              return (cast(typeof(&_vfuncSetIdTramp))_klass.setId)(buildable, id);
            return;
          }

          string _id = id.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetId(_id);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.buildable.Buildable.vfuncSetId");
          }
        }

        _klass.setId = cast(typeof(_klass.setId))&_vfuncSetIdTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.buildable.Buildable]
template BuildableGidBuilderT()
{
}
