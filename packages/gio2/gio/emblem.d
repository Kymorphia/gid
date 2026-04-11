/// Module for [Emblem] class
module gio.emblem;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.icon_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.emblem.Emblem] is an implementation of [gio.icon.Icon] that supports
    having an emblem, which is an icon with additional properties.
    It can than be added to a [gio.emblemed_icon.EmblemedIcon].
    
    Currently, only metainformation about the emblem's origin is
    supported. More may be added in the future.
*/
class Emblem : gobject.object.ObjectWrap, gio.icon.Icon
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
    return cast(void function())g_emblem_get_type != &gidSymbolNotFound ? g_emblem_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Emblem self()
  {
    return this;
  }

  /**
      Get builder for [gio.emblem.Emblem]
      Returns: New builder object
  */
  static EmblemGidBuilder builder()
  {
    return new EmblemGidBuilder;
  }

  /**
      Get `icon` property.
      Returns: The actual icon of the emblem.
  */
  @property gobject.object.ObjectWrap icon()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.object.ObjectWrap)("icon");
  }

  /**
      Get `origin` property.
      Returns: The origin the emblem is derived from.
  */
  @property gio.types.EmblemOrigin origin()
  {
    return getOrigin();
  }

  mixin IconT!();

  /**
      Creates a new emblem for icon.
  
      Params:
        icon = a GIcon containing the icon.
      Returns: a new #GEmblem.
  */
  this(gio.icon.Icon icon)
  {
    GEmblem* _cretval;
    _cretval = g_emblem_new(icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new emblem for icon.
  
      Params:
        icon = a GIcon containing the icon.
        origin = a GEmblemOrigin enum defining the emblem's origin
      Returns: a new #GEmblem.
  */
  static gio.emblem.Emblem newWithOrigin(gio.icon.Icon icon, gio.types.EmblemOrigin origin)
  {
    GEmblem* _cretval;
    _cretval = g_emblem_new_with_origin(icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, origin);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.emblem.Emblem)(cast(GEmblem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gives back the icon from emblem.
      Returns: a #GIcon. The returned object belongs to
                 the emblem and should not be modified or freed.
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_emblem_get_icon(cast(GEmblem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the origin of the emblem.
      Returns: the origin of the emblem
  */
  gio.types.EmblemOrigin getOrigin()
  {
    GEmblemOrigin _cretval;
    _cretval = g_emblem_get_origin(cast(GEmblem*)this._cPtr);
    gio.types.EmblemOrigin _retval = cast(gio.types.EmblemOrigin)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.emblem.Emblem]
class EmblemGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.icon.IconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();

  /**
      Set `icon` property.
      Params:
        propval = The actual icon of the emblem.
      Returns: Builder instance for fluent chaining
  */
  T icon(gobject.object.ObjectWrap propval)
  {
    return setProperty("icon", propval);
  }

  /**
      Set `origin` property.
      Params:
        propval = The origin the emblem is derived from.
      Returns: Builder instance for fluent chaining
  */
  T origin(gio.types.EmblemOrigin propval)
  {
    return setProperty("origin", propval);
  }
}

/// Fluent builder for [gio.emblem.Emblem]
final class EmblemGidBuilder : EmblemGidBuilderImpl!EmblemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Emblem build()
  {
    return new Emblem(cast(void*)createGObject(Emblem._getGType), Yes.Take);
  }
}
