/// Module for [Hover] class
module gid.gtksource5.hover;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.hover_provider;
import gid.gtksource5.types;

/**
    Interactive tooltips.
    
    [gid.gtksource5.hover.Hover] allows a [gid.gtksource5.view.View] to provide contextual information.
    When enabled, if the user hovers over a word in the text editor, a series
    of registered [gid.gtksource5.hover_provider.HoverProvider] can populate a [gid.gtksource5.hover_display.HoverDisplay]
    with useful information.
    
    To enable call [gid.gtksource5.view.View.getHover] and add [gid.gtksource5.hover_provider.HoverProvider]
    using [gid.gtksource5.hover.Hover.addProvider]. To disable, remove all registered
    providers with [gid.gtksource5.hover.Hover.removeProvider].
    
    You can change how long to wait to display the interactive tooltip by
    setting the [gid.gtksource5.hover.Hover.hoverDelay] property in milliseconds.
*/
class Hover : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_hover_get_type != &gidSymbolNotFound ? gtk_source_hover_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceHover";
  }

  /** Returns `this`, for use in `with` statements. */
  override Hover self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.hover.Hover]
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
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("hover-delay");
  }

  /**
      Set `hoverDelay` property.
      Params:
        propval = Contains the number of milliseconds to delay before showing the hover assistant.
  */
  @property void hoverDelay(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("hover-delay", propval);
  }

  /** */
  void addProvider(gid.gtksource5.hover_provider.HoverProvider provider) nothrow
  {
    gtk_source_hover_add_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /** */
  void removeProvider(gid.gtksource5.hover_provider.HoverProvider provider) nothrow
  {
    gtk_source_hover_remove_provider(cast(GtkSourceHover*)this._cPtr, provider ? cast(GtkSourceHoverProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.hover.Hover]
class HoverGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
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

/// Fluent builder for [gid.gtksource5.hover.Hover]
final class HoverGidBuilder : HoverGidBuilderImpl!HoverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Hover build() nothrow
  {
    return new Hover(cast(void*)createGObject(Hover._getGType), Yes.Take);
  }
}
