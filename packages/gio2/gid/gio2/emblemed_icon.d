/// Module for [EmblemedIcon] class
module gid.gio2.emblemed_icon;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.emblem;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.emblemed_icon.EmblemedIcon] is an implementation of [gid.gio2.icon.Icon] that supports
    adding an emblem to an icon. Adding multiple emblems to an
    icon is ensured via [gid.gio2.emblemed_icon.EmblemedIcon.addEmblem].
    
    Note that [gid.gio2.emblemed_icon.EmblemedIcon] allows no control over the position
    of the emblems. See also [gid.gio2.emblem.Emblem] for more information.
*/
class EmblemedIcon : gid.gobject2.object.ObjectWrap, gid.gio2.icon.Icon
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
    return cast(void function())g_emblemed_icon_get_type != &gidSymbolNotFound ? g_emblemed_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GEmblemedIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override EmblemedIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.emblemed_icon.EmblemedIcon]
      Returns: New builder object
  */
  static EmblemedIconGidBuilder builder() nothrow
  {
    return new EmblemedIconGidBuilder;
  }

  /**
      Get `gicon` property.
      Returns: The [gid.gio2.icon.Icon] to attach emblems to.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("gicon");
  }

  mixin IconT!();

  /**
      Creates a new emblemed icon for icon with the emblem emblem.
  
      Params:
        icon = a #GIcon
        emblem = a #GEmblem, or null
      Returns: a new #GIcon
  */
  this(gid.gio2.icon.Icon icon, gid.gio2.emblem.Emblem emblem = null) nothrow
  {
    GIcon* _cretval;
    _cretval = g_emblemed_icon_new(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null, emblem ? cast(GEmblem*)emblem._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds emblem to the #GList of #GEmblems.
  
      Params:
        emblem = a #GEmblem
  */
  void addEmblem(gid.gio2.emblem.Emblem emblem) nothrow
  {
    g_emblemed_icon_add_emblem(cast(GEmblemedIcon*)this._cPtr, emblem ? cast(GEmblem*)emblem._cPtr(No.Dup) : null);
  }

  /**
      Removes all the emblems from icon.
  */
  void clearEmblems() nothrow
  {
    g_emblemed_icon_clear_emblems(cast(GEmblemedIcon*)this._cPtr);
  }

  /**
      Gets the list of emblems for the icon.
      Returns: a #GList of
            #GEmblems that is owned by emblemed
  */
  gid.gio2.emblem.Emblem[] getEmblems() nothrow
  {
    GList* _cretval;
    _cretval = g_emblemed_icon_get_emblems(cast(GEmblemedIcon*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.emblem.Emblem, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the main icon for emblemed.
      Returns: a #GIcon that is owned by emblemed
  */
  gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_emblemed_icon_get_icon(cast(GEmblemedIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.emblemed_icon.EmblemedIcon]
class EmblemedIconGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();

  /**
      Set `gicon` property.
      Params:
        propval = The [gid.gio2.icon.Icon] to attach emblems to.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }
}

/// Fluent builder for [gid.gio2.emblemed_icon.EmblemedIcon]
final class EmblemedIconGidBuilder : EmblemedIconGidBuilderImpl!EmblemedIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EmblemedIcon build() nothrow
  {
    return new EmblemedIcon(cast(void*)createGObject(EmblemedIcon._getGType), Yes.Take);
  }
}
