/// Module for [Map] class
module gid.gtksource5.map;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_text;
import gid.gtk4.accessible_text_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;
import gid.gtksource5.view;
import gid.pango1.font_description;

/**
    Widget that displays a map for a specific [gid.gtksource5.view.View].
    
    [gid.gtksource5.map.Map] is a widget that maps the content of a [gid.gtksource5.view.View] into
    a smaller view so the user can have a quick overview of the whole document.
    
    This works by connecting a [gid.gtksource5.view.View] to to the [gid.gtksource5.map.Map] using
    the [gid.gtksource5.map.Map.view] property or [gid.gtksource5.map.Map.setView].
    
    [gid.gtksource5.map.Map] is a [gid.gtksource5.view.View] object. This means that you can add a
    [gid.gtksource5.gutter_renderer.GutterRenderer] to a gutter in the same way you would for a
    [gid.gtksource5.view.View]. One example might be a [gid.gtksource5.gutter_renderer.GutterRenderer] that shows
    which lines have changed in the document.
    
    Additionally, it is desirable to match the font of the [gid.gtksource5.map.Map] and
    the [gid.gtksource5.view.View] used for editing. Therefore, [gid.gtksource5.map.Map.fontDesc]
    should be used to set the target font. You will need to adjust this to the
    desired font size for the map. A 1pt font generally seems to be an
    appropriate font size. "Monospace 1" is the default. See
    [gid.pango1.font_description.FontDescription.setSize] for how to alter the size of an existing
    [gid.pango1.font_description.FontDescription].
    
    When FontConfig is available, [gid.gtksource5.map.Map] will try to use a bundled
    "block" font to make the map more legible.
*/
class Map : gid.gtksource5.view.View
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
      Get builder for [gid.gtksource5.map.Map]
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
  @property gid.gtksource5.view.View view() nothrow
  {
    return getView();
  }

  /** */
  @property void view(gid.gtksource5.view.View propval) nothrow
  {
    setView(propval);
  }

  /**
      Creates a new [gid.gtksource5.map.Map].
      Returns: a new #GtkSourceMap.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_source_map_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the [gid.gtksource5.map.Map.view] property, which is the view this widget is mapping.
      Returns: a #GtkSourceView or null.
  */
  gid.gtksource5.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_map_get_view(cast(GtkSourceMap*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the view that map will be doing the mapping to.
  
      Params:
        view = a #GtkSourceView
  */
  void setView(gid.gtksource5.view.View view) nothrow
  {
    gtk_source_map_set_view(cast(GtkSourceMap*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.map.Map]
class MapGidBuilderImpl(T) : gid.gtksource5.view.ViewGidBuilderImpl!T
{


  /** */
  T fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /** */
  T view(gid.gtksource5.view.View propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.gtksource5.map.Map]
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
