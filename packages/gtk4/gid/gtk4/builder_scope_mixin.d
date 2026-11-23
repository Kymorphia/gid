/// Module for [BuilderScope] interface mixin
module gid.gtk4.builder_scope_mixin;

public import gid.core.basictypes;
public import gid.gtk4.builder_scope_iface_proxy;
public import gid.core.utils;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.closure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.types;
public import gid.gtk4.builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    Provides language binding support to [gid.gtk4.builder.Builder].
    
    The goal of [gid.gtk4.builder_scope.BuilderScope] is to look up programming-language-specific
    values for strings that are given in a [gid.gtk4.builder.Builder] UI file.
    
    The primary intended audience is bindings that want to provide deeper
    integration of [gid.gtk4.builder.Builder] into the language.
    
    A [gid.gtk4.builder_scope.BuilderScope] instance may be used with multiple [gid.gtk4.builder.Builder] objects,
    even at once.
    
    By default, GTK will use its own implementation of [gid.gtk4.builder_scope.BuilderScope]
    for the C language which can be created via [gid.gtk4.builder_cscope.BuilderCScope.new_].
    
    If you implement [gid.gtk4.builder_scope.BuilderScope] for a language binding, you
    may want to (partially) derive from or fall back to a [gid.gtk4.builder_cscope.BuilderCScope],
    as that class implements support for automatic lookups from C symbols.
*/
template BuilderScopeT()
{

  /**
      Create a closure with the given arguments. See [gid.gtk4.builder.Builder.createClosure]
        for more details on those.
        The C implementation will try to use dlsym() to locate the function name and then
        [gid.gobject2.cclosure.CClosure.new_] to create a closure for the symbol.
        The default implementation just fails and returns null.
  
      Params:
        builder = 
        functionName = 
        flags = 
        object = 
      Returns: 
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateClosure`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.closure.Closure vfuncCreateClosure(gid.gtk4.builder.Builder builder, string functionName, gid.gtk4.types.BuilderClosureFlags flags, gid.gobject2.object.ObjectWrap object)
  {
    auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.builder_scope.BuilderScope._getGType);
    if (!_klass || !_klass.createClosure)
      return typeof(return).init;

    GClosure* _cretval;
    const(char)* _functionName = functionName.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.createClosure(cast(GtkBuilderScope*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _functionName, flags, object ? cast(GObject*)object._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gobject2.closure.Closure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Try to lookup a `GType` via the given function name, specified
        explicitly in a GtkBuilder file, like via the "type-func" attribute in the `<object>` tag.
        This function is very rarely used.
        The C implementation will use dlsym() and call the resulting function as a `GTypeFunc`.
        The default implementation will fail and just return `G_TYPE_INVALID`.
  
      Params:
        builder = 
        functionName = 
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTypeFromFunction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.types.GType vfuncGetTypeFromFunction(gid.gtk4.builder.Builder builder, string functionName)
  {
    auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.builder_scope.BuilderScope._getGType);
    if (!_klass || !_klass.getTypeFromFunction)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    const(char)* _functionName = functionName.toCString!(No.Malloc, No.Nullable);
    _retval = _klass.getTypeFromFunction(cast(GtkBuilderScope*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _functionName);
    return _retval;
  }

  /**
      Try to lookup a `GType` via the its name. See
        [gid.gtk4.builder.Builder.getTypeFromName] for more details.
        The C implementation will use [gid.gobject2.global.typeFromName] and if that fails try to guess the
        correct function name for registering the type and then use dlsym() to load it.
        The default implementation just tries [gid.gobject2.global.typeFromName] and otherwise fails.
  
      Params:
        builder = 
        typeName = 
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTypeFromName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.types.GType vfuncGetTypeFromName(gid.gtk4.builder.Builder builder, string typeName)
  {
    auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.builder_scope.BuilderScope._getGType);
    if (!_klass || !_klass.getTypeFromName)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    const(char)* _typeName = typeName.toCString!(No.Malloc, No.Nullable);
    _retval = _klass.getTypeFromName(cast(GtkBuilderScope*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _typeName);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.builder_scope.BuilderScope (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_builder_scope_BuilderScope(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateClosure", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypeFromFunction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypeFromName", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.builder_scope.BuilderScope vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_builder_scope_BuilderScope(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateClosure", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_builder_scope_BuilderScope(iface, "create_closure");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypeFromFunction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_builder_scope_BuilderScope(iface, "get_type_from_function");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTypeFromName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_builder_scope_BuilderScope(iface, "get_type_from_name");
  }

  private static void _installIfaceVfunc_gid_gtk4_builder_scope_BuilderScope(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkBuilderScopeInterface*)iface;

    switch (vfunc)
    {
      case "create_closure":
      {
        static extern(C) GClosure* _vfuncCreateClosureTramp(GtkBuilderScope* self, GtkBuilder* builder, const(char)* functionName, GtkBuilderClosureFlags flags, GObject* object, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.builder_scope.BuilderScope._getGType);
            if (_klass && _klass.createClosure)
              return (cast(typeof(&_vfuncCreateClosureTramp))_klass.createClosure)(self, builder, functionName, flags, object, _err);
            return typeof(return).init;
          }

          gid.gobject2.closure.Closure _dretval;
          string _functionName = functionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncCreateClosure(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), _functionName, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)object, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GClosure*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createClosure = cast(typeof(_klass.createClosure))&_vfuncCreateClosureTramp;
        break;
      }
      case "get_type_from_function":
      {
        static extern(C) GType _vfuncGetTypeFromFunctionTramp(GtkBuilderScope* self, GtkBuilder* builder, const(char)* functionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.builder_scope.BuilderScope._getGType);
            if (_klass && _klass.getTypeFromFunction)
              return (cast(typeof(&_vfuncGetTypeFromFunctionTramp))_klass.getTypeFromFunction)(self, builder, functionName);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;
          string _functionName = functionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetTypeFromFunction(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), _functionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.builder_scope.BuilderScope.vfuncGetTypeFromFunction");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getTypeFromFunction = cast(typeof(_klass.getTypeFromFunction))&_vfuncGetTypeFromFunctionTramp;
        break;
      }
      case "get_type_from_name":
      {
        static extern(C) GType _vfuncGetTypeFromNameTramp(GtkBuilderScope* self, GtkBuilder* builder, const(char)* typeName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkBuilderScopeInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.builder_scope.BuilderScope._getGType);
            if (_klass && _klass.getTypeFromName)
              return (cast(typeof(&_vfuncGetTypeFromNameTramp))_klass.getTypeFromName)(self, builder, typeName);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;
          string _typeName = typeName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetTypeFromName(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.builder.Builder)(cast(void*)builder, No.Take), _typeName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.builder_scope.BuilderScope.vfuncGetTypeFromName");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getTypeFromName = cast(typeof(_klass.getTypeFromName))&_vfuncGetTypeFromNameTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.builder_scope.BuilderScope]
template BuilderScopeGidBuilderT()
{
}
