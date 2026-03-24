/// Module for [Hover] class
module gtksource.hover;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.hover_provider;
import gtksource.types;

/**
    Interactive tooltips.
    
    [gtksource.hover.Hover] allows a `class@View` to provide contextual information.
    When enabled, if the user hovers over a word in the text editor, a series
    of registered `iface@HoverProvider` can populate a `class@HoverDisplay`
    with useful information.
    
    To enable call [gtksource.view.View.getHover] and add `iface@HoverProvider`
    using [gtksource.hover.Hover.addProvider]. To disable, remove all registered
    providers with [gtksource.hover.Hover.removeProvider].
    
    You can change how long to wait to display the interactive tooltip by
    setting the `property@Hover:hover-delay` property in milliseconds.
*/
class Hover : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_hover_get_type != &gidSymbolNotFound ? gtk_source_hover_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Hover self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.hover.Hover]
  Returns: New builder object
  */
  static HoverGidBuilder builder()
  {
    return new HoverGidBuilder;
  }

  /**
      Get `hoverDelay` property.
      Returns: Contains the number of milliseconds to delay before showing the hover assistant.
  */
  @property uint hoverDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("hover-delay");
  }

  /**
      Set `hoverDelay` property.
      Params:
        propval = Contains the number of milliseconds to delay before showing the hover assistant.
  */
  @property void hoverDelay(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("hover-delay", propval);
  }

  /** */
  void addProvider(gtksource.hover_provider.HoverProvider provider)
  {
    gtk_source_hover_add_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /** */
  void removeProvider(gtksource.hover_provider.HoverProvider provider)
  {
    gtk_source_hover_remove_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }
}

class HoverGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `hoverDelay` property.
      Params:
        propval = Contains the number of milliseconds to delay before showing the hover assistant.
      Returns: Builder instance for fluent chaining
  */
  T hoverDelay(uint propval)
  {
    return setProperty("hover-delay", propval);
  }
}

/// Fluent builder for [gtksource.hover.Hover]
final class HoverGidBuilder : HoverGidBuilderImpl!HoverGidBuilder
{
  Hover build()
  {
    return new Hover(cast(void*)createGObject(Hover._getGType), No.Take);
  }
}
