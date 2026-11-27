/// Module for [Plug] class
module gid.atk1.plug;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Toplevel for embedding into other processes
    
    See `class@AtkSocket`
*/
@gidGir("Plug", "PlugClass")
class Plug : gid.atk1.object.ObjectWrap, gid.atk1.component.Component
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_plug_get_type != &gidSymbolNotFound ? atk_plug_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkPlug";
  }

  /** Returns `this`, for use in `with` statements. */
  override Plug self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.plug.Plug]
      Returns: New builder object
  */
  static PlugGidBuilder builder() nothrow
  {
    return new PlugGidBuilder;
  }

  mixin ComponentT!();

  /**
      Creates a new #AtkPlug instance.
      Returns: the newly created #AtkPlug
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      AtkObject* _cretval;
      _cretval = atk_plug_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected string vfuncGetObjectId()
  {
    auto _klass = cast(AtkPlugClass*)_vfuncClass;
    if (!_klass.getObjectId)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getObjectId(cast(AtkPlug*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the unique ID of an #AtkPlug object, which can be used to
      embed inside of an #AtkSocket using [gid.atk1.socket.Socket.embed].
      
      Internally, this calls a class function that should be registered
      by the IPC layer (usually at-spi2-atk). The implementor of an
      #AtkPlug object should call this function (after atk-bridge is
      loaded) and pass the value to the process implementing the
      #AtkSocket, so it could embed the plug.
      Returns: the unique ID for the plug
  */
  string getId() nothrow
  {
    char* _cretval;
    _cretval = atk_plug_get_id(cast(AtkPlug*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Sets child as accessible child of plug and plug as accessible parent of
      child. child can be NULL.
      
      In some cases, one can not use the AtkPlug type directly as accessible
      object for the toplevel widget of the application. For instance in the gtk
      case, GtkPlugAccessible can not inherit both from GtkWindowAccessible and
      from AtkPlug. In such a case, one can create, in addition to the standard
      accessible object for the toplevel widget, an AtkPlug object, and make the
      former the child of the latter by calling [gid.atk1.plug.Plug.setChild].
  
      Params:
        child = an #AtkObject to be set as accessible child of plug.
  */
  void setChild(gid.atk1.object.ObjectWrap child) nothrow
  {
    atk_plug_set_child(cast(AtkPlug*)this._cPtr, child ? cast(AtkObject*)child._cPtr(No.Dup) : null);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Plug
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.atk1.plug.Plug), T.stringof ~ " is not derived from gid.atk1.plug.Plug");

    gid.atk1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetObjectId", true)[0]) == gid.atk1.plug.Plug))
      _installVfunc(klass, "get_object_id");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AtkPlugClass*)klass;

    switch (vfunc)
    {
      case "get_object_id":
      {
        static extern(C) char* _vfuncGetObjectIdTramp(AtkPlug* obj) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.plug.Plug)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkPlugClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj);
            if (_klass.getObjectId)
              return (cast(typeof(&_vfuncGetObjectIdTramp))_klass.getObjectId)(obj);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetObjectId();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.plug.Plug.vfuncGetObjectId");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getObjectId = cast(typeof(_klass.getObjectId))&_vfuncGetObjectIdTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.plug.Plug]
class PlugGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gid.atk1.plug.Plug]
final class PlugGidBuilder : PlugGidBuilderImpl!PlugGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Plug build() nothrow
  {
    return new Plug(cast(void*)createGObject(Plug._getGType), Yes.Take);
  }
}
