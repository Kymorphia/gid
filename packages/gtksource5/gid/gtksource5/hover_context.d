/// Module for [HoverContext] class
module gid.gtksource5.hover_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_iter;
import gid.gtksource5.buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;
import gid.gtksource5.view;

/**
    Context for populating [gid.gtksource5.hover_display.HoverDisplay] contents.
    
    [gid.gtksource5.hover_context.HoverContext] contains information about the request to populate
    contents for a [gid.gtksource5.hover_display.HoverDisplay].
    
    It can be used to retrieve the [gid.gtksource5.view.View], [gid.gtksource5.buffer.Buffer], and
    [gid.gtk4.text_iter.TextIter] for the regions of text which are being displayed.
    
    Use [gid.gtksource5.hover_context.HoverContext.getBounds] to get the word that was
    requested. [gid.gtksource5.hover_context.HoverContext.getIter] will get you the location
    of the pointer when the request was made.
*/
class HoverContext : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_context_get_type != &gidSymbolNotFound ? gtk_source_hover_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceHoverContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override HoverContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.hover_context.HoverContext]
      Returns: New builder object
  */
  static HoverContextGidBuilder builder() nothrow
  {
    return new HoverContextGidBuilder;
  }

  /**
      Gets the current word bounds of the hover.
      
      If begin is non-null, it will be set to the start position of the
      current word being hovered.
      
      If end is non-null, it will be set to the end position for the
      current word being hovered.
  
      Params:
        begin = a #GtkTextIter
        end = a #GtkTextIter
      Returns: true if the marks are still valid and begin or end was set.
  */
  bool getBounds(out gid.gtk4.text_iter.TextIter begin, out gid.gtk4.text_iter.TextIter end) nothrow
  {
    bool _retval;
    auto _begin = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_hover_context_get_bounds(cast(GtkSourceHoverContext*)this._cPtr, _begin, _end);
    begin = new gid.gtk4.text_iter.TextIter(cast(void*)_begin, Yes.Take);
    end = new gid.gtk4.text_iter.TextIter(cast(void*)_end, Yes.Take);
    return _retval;
  }

  /**
      A convenience function to get the buffer.
      Returns: The #GtkSourceBuffer for the view
  */
  gid.gtksource5.buffer.Buffer getBuffer() nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_hover_context_get_buffer(cast(GtkSourceHoverContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the location of the pointer where the request was made.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if the mark is still valid and iter was set.
  */
  bool getIter(out gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_hover_context_get_iter(cast(GtkSourceHoverContext*)this._cPtr, _iter);
    iter = new gid.gtk4.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /** */
  gid.gtksource5.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_hover_context_get_view(cast(GtkSourceHoverContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.hover_context.HoverContext]
class HoverContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.hover_context.HoverContext]
final class HoverContextGidBuilder : HoverContextGidBuilderImpl!HoverContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HoverContext build() nothrow
  {
    return new HoverContext(cast(void*)createGObject(HoverContext._getGType), Yes.Take);
  }
}
