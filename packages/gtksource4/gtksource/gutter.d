/// Module for [Gutter] class
module gtksource.gutter;

import gid.gid;
import gobject.object;
import gtk.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;
import gtksource.view;

/** */
class Gutter : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_gutter_get_type != &gidSymbolNotFound ? gtk_source_gutter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Gutter self()
  {
    return this;
  }

  /**
      Finds the #GtkSourceGutterRenderer at (x, y).
  
      Params:
        x = The x position to get identified.
        y = The y position to get identified.
      Returns: the renderer at (x, y) or null.
  */
  gtksource.gutter_renderer.GutterRenderer getRendererAtPos(int x, int y)
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_get_renderer_at_pos(cast(GtkSourceGutter*)this._cPtr, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.gutter_renderer.GutterRenderer)(cast(GtkSourceGutterRenderer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_get_view(cast(GtkSourceGutter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtk.types.TextWindowType getWindowType()
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_source_gutter_get_window_type(cast(GtkSourceGutter*)this._cPtr);
    gtk.types.TextWindowType _retval = cast(gtk.types.TextWindowType)_cretval;
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
  bool insert(gtksource.gutter_renderer.GutterRenderer renderer, int position)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_insert(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Invalidates the drawable area of the gutter. You can use this to force a
      redraw of the gutter if something has changed and needs to be redrawn.
  */
  void queueDraw()
  {
    gtk_source_gutter_queue_draw(cast(GtkSourceGutter*)this._cPtr);
  }

  /**
      Removes renderer from gutter.
  
      Params:
        renderer = a #GtkSourceGutterRenderer.
  */
  void remove(gtksource.gutter_renderer.GutterRenderer renderer)
  {
    gtk_source_gutter_remove(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Reorders renderer in gutter to new position.
  
      Params:
        renderer = a #GtkCellRenderer.
        position = the new renderer position.
  */
  void reorder(gtksource.gutter_renderer.GutterRenderer renderer, int position)
  {
    gtk_source_gutter_reorder(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
  }
}
