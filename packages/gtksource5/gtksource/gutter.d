/// Module for [Gutter] class
module gtksource.gutter;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;
import gtksource.view;

/**
    Gutter object for `class@View`.
    
    The [gtksource.gutter.Gutter] object represents the left or right gutter of the text
    view. It is used by `class@View` to draw the line numbers and
    `class@Mark`s that might be present on a line. By packing
    additional `class@GutterRenderer` objects in the gutter, you can extend the
    gutter with your own custom drawings.
    
    To get a [gtksource.gutter.Gutter], use the [gtksource.view.View.getGutter] function.
    
    The gutter works very much the same way as cells rendered in a [gtk.tree_view.TreeView].
    The concept is similar, with the exception that the gutter does not have an
    underlying [gtk.tree_model.TreeModel]. The builtin line number renderer is at position
    [gtksource.types.ViewGutterPosition.Lines] (-30) and the marks renderer is at
    [gtksource.types.ViewGutterPosition.Marks] (-20). The gutter sorts the renderers
    in ascending order, from left to right. So the marks are displayed on the
    right of the line numbers.
*/
class Gutter : gtk.widget.Widget
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
  Get builder for [gtksource.gutter.Gutter]
  Returns: New builder object
  */
  static GutterGidBuilder builder()
  {
    return new GutterGidBuilder;
  }

  /**
      Get `view` property.
      Returns: The #GtkSourceView of the gutter.
  */
  @property gtksource.view.View view()
  {
    return getView();
  }

  /**
      Get `windowType` property.
      Returns: The text window type on which the window is placed.
  */
  @property gtk.types.TextWindowType windowType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextWindowType)("window-type");
  }

  /** */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_get_view(cast(GtkSourceGutter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
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

  /** */
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

class GutterGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `view` property.
      Params:
        propval = The #GtkSourceView of the gutter.
      Returns: Builder instance for fluent chaining
  */
  T view(gtksource.view.View propval)
  {
    return setProperty("view", propval);
  }

  /**
      Set `windowType` property.
      Params:
        propval = The text window type on which the window is placed.
      Returns: Builder instance for fluent chaining
  */
  T windowType(gtk.types.TextWindowType propval)
  {
    return setProperty("window-type", propval);
  }
}

/// Fluent builder for [gtksource.gutter.Gutter]
final class GutterGidBuilder : GutterGidBuilderImpl!GutterGidBuilder
{
  Gutter build()
  {
    return new Gutter(cast(void*)createGObject(Gutter._getGType), No.Take);
  }
}
