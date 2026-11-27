/// Module for [Gutter] class
module gid.gtksource4.gutter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.gutter_renderer;
import gid.gtksource4.types;
import gid.gtksource4.view;

/** */
@gidGir("Gutter", "GutterClass")
class Gutter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_gutter_get_type != &gidSymbolNotFound ? gtk_source_gutter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceGutter";
  }

  /** Returns `this`, for use in `with` statements. */
  override Gutter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.gutter.Gutter]
      Returns: New builder object
  */
  static GutterGidBuilder builder() nothrow
  {
    return new GutterGidBuilder;
  }

  /**
      Get `view` property.
      Returns: The #GtkSourceView of the gutter.
  */
  @property gid.gtksource4.view.View view() nothrow
  {
    return getView();
  }

  /**
      Get `windowType` property.
      Returns: The text window type on which the window is placed.
  */
  @property gid.gtk3.types.TextWindowType windowType() nothrow
  {
    return getWindowType();
  }

  /**
      Finds the #GtkSourceGutterRenderer at (x, y).
  
      Params:
        x = The x position to get identified.
        y = The y position to get identified.
      Returns: the renderer at (x, y) or null.
  */
  gid.gtksource4.gutter_renderer.GutterRenderer getRendererAtPos(int x, int y) nothrow
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_get_renderer_at_pos(cast(GtkSourceGutter*)this._cPtr, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.gutter_renderer.GutterRenderer)(cast(GtkSourceGutterRenderer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource4.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_get_view(cast(GtkSourceGutter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtk3.types.TextWindowType getWindowType() nothrow
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_source_gutter_get_window_type(cast(GtkSourceGutter*)this._cPtr);
    gid.gtk3.types.TextWindowType _retval = cast(gid.gtk3.types.TextWindowType)_cretval;
    return _retval;
  }

  /**
      Insert renderer into the gutter. If renderer is yet unowned then gutter
      claims its ownership. Otherwise just increases renderer's reference count.
      renderer cannot be already inserted to another gutter.
  
      Params:
        renderer = a gutter renderer (must inherit from #GtkSourceGutterRenderer).
        position = the renderer position.
      Returns: true if operation succeeded. Otherwise false.
  */
  bool insert(gid.gtksource4.gutter_renderer.GutterRenderer renderer, int position) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_insert(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Invalidates the drawable area of the gutter. You can use this to force a
      redraw of the gutter if something has changed and needs to be redrawn.
  */
  void queueDraw() nothrow
  {
    gtk_source_gutter_queue_draw(cast(GtkSourceGutter*)this._cPtr);
  }

  /**
      Removes renderer from gutter.
  
      Params:
        renderer = a #GtkSourceGutterRenderer.
  */
  void remove(gid.gtksource4.gutter_renderer.GutterRenderer renderer) nothrow
  {
    gtk_source_gutter_remove(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Reorders renderer in gutter to new position.
  
      Params:
        renderer = a #GtkCellRenderer.
        position = the new renderer position.
  */
  void reorder(gid.gtksource4.gutter_renderer.GutterRenderer renderer, int position) nothrow
  {
    gtk_source_gutter_reorder(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.gutter.Gutter]
class GutterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `view` property.
      Params:
        propval = The #GtkSourceView of the gutter.
      Returns: Builder instance for fluent chaining
  */
  T view(gid.gtksource4.view.View propval) nothrow
  {
    return setProperty("view", propval);
  }

  /**
      Set `windowType` property.
      Params:
        propval = The text window type on which the window is placed.
      Returns: Builder instance for fluent chaining
  */
  T windowType(gid.gtk3.types.TextWindowType propval) nothrow
  {
    return setProperty("window-type", propval);
  }
}

/// Fluent builder for [gid.gtksource4.gutter.Gutter]
final class GutterGidBuilder : GutterGidBuilderImpl!GutterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Gutter build() nothrow
  {
    return new Gutter(cast(void*)createGObject(Gutter._getGType), Yes.Take);
  }
}
