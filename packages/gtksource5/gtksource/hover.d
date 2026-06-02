/// Module for [Hover] class
module gtksource.hover;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.hover_provider;
import gtksource.types;

/**
    Interactive tooltips.
    
    [gtksource.hover.Hover] allows a [gtksource.view.View] to provide contextual information.
    When enabled, if the user hovers over a word in the text editor, a series
    of registered [gtksource.hover_provider.HoverProvider] can populate a [gtksource.hover_display.HoverDisplay]
    with useful information.
    
    To enable call [gtksource.view.View.getHover] and add [gtksource.hover_provider.HoverProvider]
    using [gtksource.hover.Hover.addProvider]. To disable, remove all registered
    providers with [gtksource.hover.Hover.removeProvider].
    
    You can change how long to wait to display the interactive tooltip by
    setting the [gtksource.hover.Hover.hoverDelay] property in milliseconds.
*/
class Hover : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_get_type != &gidSymbolNotFound ? gtk_source_hover_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Hover self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.hover.Hover]
      Returns: New builder object
  */
  static HoverGidBuilder builder() nothrow
  {
    return new HoverGidBuilder;
  }

  /**
      Get `hoverDelay` property.
      Returns: Contains the number of milliseconds to delay before showing the hover assistant.
  */
  @property uint hoverDelay() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("hover-delay");
  }

  /**
      Set `hoverDelay` property.
      Params:
        propval = Contains the number of milliseconds to delay before showing the hover assistant.
  */
  @property void hoverDelay(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("hover-delay", propval);
  }

  /** */
  void addProvider(gtksource.hover_provider.HoverProvider provider) nothrow
  {
    gtk_source_hover_add_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /** */
  void removeProvider(gtksource.hover_provider.HoverProvider provider) nothrow
  {
    gtk_source_hover_remove_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtksource.hover.Hover]
class HoverGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `hoverDelay` property.
      Params:
        propval = Contains the number of milliseconds to delay before showing the hover assistant.
      Returns: Builder instance for fluent chaining
  */
  T hoverDelay(uint propval) nothrow
  {
    return setProperty("hover-delay", propval);
  }
}

/// Fluent builder for [gtksource.hover.Hover]
final class HoverGidBuilder : HoverGidBuilderImpl!HoverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Hover build() nothrow
  {
    return new Hover(cast(void*)createGObject(Hover._getGType), No.Take);
  }
}
