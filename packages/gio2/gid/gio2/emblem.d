/// Module for [Emblem] class
module gid.gio2.emblem;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.emblem.Emblem] is an implementation of [gid.gio2.icon.Icon] that supports
    having an emblem, which is an icon with additional properties.
    It can than be added to a [gid.gio2.emblemed_icon.EmblemedIcon].
    
    Currently, only metainformation about the emblem's origin is
    supported. More may be added in the future.
*/
class Emblem : gid.gobject2.object.ObjectWrap, gid.gio2.icon.Icon
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_emblem_get_type != &gidSymbolNotFound ? g_emblem_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GEmblem";
  }

  /** Returns `this`, for use in `with` statements. */
  override Emblem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.emblem.Emblem]
      Returns: New builder object
  */
  static EmblemGidBuilder builder() nothrow
  {
    return new EmblemGidBuilder;
  }

  /**
      Get `icon` property.
      Returns: The actual icon of the emblem.
  */
  @property gid.gobject2.object.ObjectWrap icon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.object.ObjectWrap)("icon");
  }

  /**
      Get `origin` property.
      Returns: The origin the emblem is derived from.
  */
  @property gid.gio2.types.EmblemOrigin origin() nothrow
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
  this(gid.gio2.icon.Icon icon) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GEmblem* _cretval;
      _cretval = g_emblem_new(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new emblem for icon.
  
      Params:
        icon = a GIcon containing the icon.
        origin = a GEmblemOrigin enum defining the emblem's origin
      Returns: a new #GEmblem.
  */
  static gid.gio2.emblem.Emblem newWithOrigin(gid.gio2.icon.Icon icon, gid.gio2.types.EmblemOrigin origin) nothrow
  {
    GEmblem* _cretval;
    _cretval = g_emblem_new_with_origin(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null, origin);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.emblem.Emblem)(cast(GEmblem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gives back the icon from emblem.
      Returns: a #GIcon. The returned object belongs to
                 the emblem and should not be modified or freed.
  */
  gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_emblem_get_icon(cast(GEmblem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the origin of the emblem.
      Returns: the origin of the emblem
  */
  gid.gio2.types.EmblemOrigin getOrigin() nothrow
  {
    GEmblemOrigin _cretval;
    _cretval = g_emblem_get_origin(cast(GEmblem*)this._cPtr);
    gid.gio2.types.EmblemOrigin _retval = cast(gid.gio2.types.EmblemOrigin)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.emblem.Emblem]
class EmblemGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();

  /**
      Set `icon` property.
      Params:
        propval = The actual icon of the emblem.
      Returns: Builder instance for fluent chaining
  */
  T icon(gid.gobject2.object.ObjectWrap propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /**
      Set `origin` property.
      Params:
        propval = The origin the emblem is derived from.
      Returns: Builder instance for fluent chaining
  */
  T origin(gid.gio2.types.EmblemOrigin propval) nothrow
  {
    return setProperty("origin", propval);
  }
}

/// Fluent builder for [gid.gio2.emblem.Emblem]
final class EmblemGidBuilder : EmblemGidBuilderImpl!EmblemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Emblem build() nothrow
  {
    return new Emblem(cast(void*)createGObject(Emblem._getGType), Yes.Take);
  }
}
