module gio.emblemed_icon;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.emblem;
import gio.icon;
import gio.icon_mixin;
import gio.types;
import gobject.object;

/**
    [gio.emblemed_icon.EmblemedIcon] is an implementation of [gio.icon.Icon] that supports
  adding an emblem to an icon. Adding multiple emblems to an
  icon is ensured via [gio.emblemed_icon.EmblemedIcon.addEmblem].
  
  Note that [gio.emblemed_icon.EmblemedIcon] allows no control over the position
  of the emblems. See also [gio.emblem.Emblem] for more information.
*/
class EmblemedIcon : gobject.object.ObjectG, gio.icon.Icon
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_emblemed_icon_get_type != &gidSymbolNotFound ? g_emblemed_icon_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override EmblemedIcon self()
  {
    return this;
  }

  mixin IconT!();

  /**
      Creates a new emblemed icon for icon with the emblem emblem.
    Params:
      icon =       a #GIcon
      emblem =       a #GEmblem, or null
    Returns:     a new #GIcon
  */
  this(gio.icon.Icon icon, gio.emblem.Emblem emblem = null)
  {
    GIcon* _cretval;
    _cretval = g_emblemed_icon_new(icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null, emblem ? cast(GEmblem*)emblem.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds emblem to the #GList of #GEmblems.
    Params:
      emblem =       a #GEmblem
  */
  void addEmblem(gio.emblem.Emblem emblem)
  {
    g_emblemed_icon_add_emblem(cast(GEmblemedIcon*)cPtr, emblem ? cast(GEmblem*)emblem.cPtr(No.Dup) : null);
  }

  /**
      Removes all the emblems from icon.
  */
  void clearEmblems()
  {
    g_emblemed_icon_clear_emblems(cast(GEmblemedIcon*)cPtr);
  }

  /**
      Gets the list of emblems for the icon.
    Returns:     a #GList of
          #GEmblems that is owned by emblemed
  */
  gio.emblem.Emblem[] getEmblems()
  {
    GList* _cretval;
    _cretval = g_emblemed_icon_get_emblems(cast(GEmblemedIcon*)cPtr);
    auto _retval = gListToD!(gio.emblem.Emblem, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the main icon for emblemed.
    Returns:     a #GIcon that is owned by emblemed
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_emblemed_icon_get_icon(cast(GEmblemedIcon*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }
}
