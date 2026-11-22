/// Module for [Map] class
module gid.gtksource4.map;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;
import gid.gtksource4.view;
import gid.pango1.font_description;

/** */
class Map : gid.gtksource4.view.View
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
    return cast(void function())gtk_source_map_get_type != &gidSymbolNotFound ? gtk_source_map_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceMap";
  }

  /** Returns `this`, for use in `with` statements. */
  override Map self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.map.Map]
      Returns: New builder object
  */
  static MapGidBuilder builder() nothrow
  {
    return new MapGidBuilder;
  }

  /** */
  @property gid.pango1.font_description.FontDescription fontDesc() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.font_description.FontDescription)("font-desc");
  }

  /** */
  @property void fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.font_description.FontDescription)("font-desc", propval);
  }

  /** */
  @property gid.gtksource4.view.View view() nothrow
  {
    return getView();
  }

  /** */
  @property void view(gid.gtksource4.view.View propval) nothrow
  {
    setView(propval);
  }

  /**
      Creates a new #GtkSourceMap.
      Returns: a new #GtkSourceMap.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_map_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkSourceMap:view property, which is the view this widget is mapping.
      Returns: a #GtkSourceView or null.
  */
  gid.gtksource4.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_map_get_view(cast(GtkSourceMap*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the view that map will be doing the mapping to.
  
      Params:
        view = a #GtkSourceView
  */
  void setView(gid.gtksource4.view.View view) nothrow
  {
    gtk_source_map_set_view(cast(GtkSourceMap*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.map.Map]
class MapGidBuilderImpl(T) : gid.gtksource4.view.ViewGidBuilderImpl!T
{


  /** */
  T fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /** */
  T view(gid.gtksource4.view.View propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.gtksource4.map.Map]
final class MapGidBuilder : MapGidBuilderImpl!MapGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Map build() nothrow
  {
    return new Map(cast(void*)createGObject(Map._getGType), Yes.Take);
  }
}
