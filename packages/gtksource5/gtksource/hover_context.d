/// Module for [HoverContext] class
module gtksource.hover_context;

import gid.gid;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
    Context for populating `class@HoverDisplay` contents.
    
    [gtksource.hover_context.HoverContext] contains information about the request to populate
    contents for a `class@HoverDisplay`.
    
    It can be used to retrieve the `class@View`, `class@Buffer`, and
    [gtk.text_iter.TextIter] for the regions of text which are being displayed.
    
    Use [gtksource.hover_context.HoverContext.getBounds] to get the word that was
    requested. [gtksource.hover_context.HoverContext.getIter] will get you the location
    of the pointer when the request was made.
*/
class HoverContext : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_context_get_type != &gidSymbolNotFound ? gtk_source_hover_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HoverContext self()
  {
    return this;
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
  bool getBounds(out gtk.text_iter.TextIter begin, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    GtkTextIter _begin;
    GtkTextIter _end;
    _retval = gtk_source_hover_context_get_bounds(cast(GtkSourceHoverContext*)cPtr, &_begin, &_end);
    begin = new gtk.text_iter.TextIter(cast(void*)&_begin, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
      A convenience function to get the buffer.
      Returns: The #GtkSourceBuffer for the view
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_hover_context_get_buffer(cast(GtkSourceHoverContext*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getIter(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_source_hover_context_get_iter(cast(GtkSourceHoverContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_hover_context_get_view(cast(GtkSourceHoverContext*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }
}
