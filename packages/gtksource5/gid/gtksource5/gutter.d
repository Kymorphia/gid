/// Module for [Gutter] class
module gid.gtksource5.gutter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.gutter_renderer;
import gid.gtksource5.types;
import gid.gtksource5.view;

/**
    Gutter object for [gid.gtksource5.view.View].
    
    The [gid.gtksource5.gutter.Gutter] object represents the left or right gutter of the text
    view. It is used by [gid.gtksource5.view.View] to draw the line numbers and
    [gid.gtksource5.mark.Mark]s that might be present on a line. By packing
    additional [gid.gtksource5.gutter_renderer.GutterRenderer] objects in the gutter, you can extend the
    gutter with your own custom drawings.
    
    To get a [gid.gtksource5.gutter.Gutter], use the [gid.gtksource5.view.View.getGutter] function.
    
    The gutter works very much the same way as cells rendered in a [gid.gtk4.tree_view.TreeView].
    The concept is similar, with the exception that the gutter does not have an
    underlying [gid.gtk4.tree_model.TreeModel]. The builtin line number renderer is at position
    [gid.gtksource5.types.ViewGutterPosition.Lines] (-30) and the marks renderer is at
    [gid.gtksource5.types.ViewGutterPosition.Marks] (-20). The gutter sorts the renderers
    in ascending order, from left to right. So the marks are displayed on the
    right of the line numbers.
*/
@gidGir("Gutter", "GutterClass")
class Gutter : gid.gtk4.widget.Widget
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
      Get builder for [gid.gtksource5.gutter.Gutter]
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
  @property gid.gtksource5.view.View view() nothrow
  {
    return getView();
  }

  /**
      Get `windowType` property.
      Returns: The text window type on which the window is placed.
  */
  @property gid.gtk4.types.TextWindowType windowType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.TextWindowType)("window-type");
  }

  /** */
  gid.gtksource5.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_get_view(cast(GtkSourceGutter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkSourceView*)_cretval, No.Take);
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
  bool insert(gid.gtksource5.gutter_renderer.GutterRenderer renderer, int position) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_insert(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /** */
  void remove(gid.gtksource5.gutter_renderer.GutterRenderer renderer) nothrow
  {
    gtk_source_gutter_remove(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Reorders renderer in gutter to new position.
  
      Params:
        renderer = a #GtkCellRenderer.
        position = the new renderer position.
  */
  void reorder(gid.gtksource5.gutter_renderer.GutterRenderer renderer, int position) nothrow
  {
    gtk_source_gutter_reorder(cast(GtkSourceGutter*)this._cPtr, renderer ? cast(GtkSourceGutterRenderer*)renderer._cPtr(No.Dup) : null, position);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.gutter.Gutter]
class GutterGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `view` property.
      Params:
        propval = The #GtkSourceView of the gutter.
      Returns: Builder instance for fluent chaining
  */
  T view(gid.gtksource5.view.View propval) nothrow
  {
    return setProperty("view", propval);
  }

  /**
      Set `windowType` property.
      Params:
        propval = The text window type on which the window is placed.
      Returns: Builder instance for fluent chaining
  */
  T windowType(gid.gtk4.types.TextWindowType propval) nothrow
  {
    return setProperty("window-type", propval);
  }
}

/// Fluent builder for [gid.gtksource5.gutter.Gutter]
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
