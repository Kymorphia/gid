/// Module for [Plug] class
module atk.plug;

import atk.c.functions;
import atk.c.types;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.types;
import gid.gid;
import gobject.gid_builder;

/**
    Toplevel for embedding into other processes
    
    See `class@AtkSocket`
*/
class Plug : atk.object.ObjectWrap, atk.component.Component
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
    return cast(void function())atk_plug_get_type != &gidSymbolNotFound ? atk_plug_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Plug self()
  {
    return this;
  }

  /**
      Get builder for [atk.plug.Plug]
      Returns: New builder object
  */
  static PlugGidBuilder builder()
  {
    return new PlugGidBuilder;
  }

  mixin ComponentT!();

  /**
      Creates a new #AtkPlug instance.
      Returns: the newly created #AtkPlug
  */
  this()
  {
    AtkObject* _cretval;
    _cretval = atk_plug_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the unique ID of an #AtkPlug object, which can be used to
      embed inside of an #AtkSocket using [atk.socket.Socket.embed].
      
      Internally, this calls a class function that should be registered
      by the IPC layer (usually at-spi2-atk). The implementor of an
      #AtkPlug object should call this function (after atk-bridge is
      loaded) and pass the value to the process implementing the
      #AtkSocket, so it could embed the plug.
      Returns: the unique ID for the plug
  */
  string getId()
  {
    char* _cretval;
    _cretval = atk_plug_get_id(cast(AtkPlug*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
      former the child of the latter by calling [atk.plug.Plug.setChild].
  
      Params:
        child = an #AtkObject to be set as accessible child of plug.
  */
  void setChild(atk.object.ObjectWrap child)
  {
    atk_plug_set_child(cast(AtkPlug*)this._cPtr, child ? cast(AtkObject*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [atk.plug.Plug]
class PlugGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T, atk.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [atk.plug.Plug]
final class PlugGidBuilder : PlugGidBuilderImpl!PlugGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Plug build()
  {
    return new Plug(cast(void*)createGObject(Plug._getGType), Yes.Take);
  }
}
