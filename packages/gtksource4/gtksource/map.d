/// Module for [Map] class
module gtksource.map;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;
import pango.font_description;

/** */
class Map : gtksource.view.View
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
    return cast(void function())gtk_source_map_get_type != &gidSymbolNotFound ? gtk_source_map_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Map self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.map.Map]
  Returns: New builder object
  */
  static MapGidBuilder builder()
  {
    return new MapGidBuilder;
  }

  /** */
  @property pango.font_description.FontDescription fontDesc()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /** */
  @property void fontDesc(pango.font_description.FontDescription propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.font_description.FontDescription)("font-desc", propval);
  }

  /** */
  @property gtksource.view.View view()
  {
    return getView();
  }

  /** */
  @property void view(gtksource.view.View propval)
  {
    setView(propval);
  }

  /**
      Creates a new #GtkSourceMap.
      Returns: a new #GtkSourceMap.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_map_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkSourceMap:view property, which is the view this widget is mapping.
      Returns: a #GtkSourceView or null.
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_map_get_view(cast(GtkSourceMap*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the view that map will be doing the mapping to.
  
      Params:
        view = a #GtkSourceView
  */
  void setView(gtksource.view.View view)
  {
    gtk_source_map_set_view(cast(GtkSourceMap*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null);
  }
}

class MapGidBuilderImpl(T) : gtksource.view.ViewGidBuilderImpl!T
{


  /** */
  T fontDesc(pango.font_description.FontDescription propval)
  {
    return setProperty("font-desc", propval);
  }

  /** */
  T view(gtksource.view.View propval)
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gtksource.map.Map]
final class MapGidBuilder : MapGidBuilderImpl!MapGidBuilder
{
  Map build()
  {
    return new Map(cast(void*)createGObject(Map._getGType), No.Take);
  }
}
