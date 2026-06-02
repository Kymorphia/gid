/// Module for [WebViewBase] class
module webkit.web_view_base;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/** */
class WebViewBase : gtk.widget.Widget
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
    return cast(void function())webkit_web_view_base_get_type != &gidSymbolNotFound ? webkit_web_view_base_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebViewBase self() nothrow
  {
    return this;
  }

  /**
      Get builder for [webkit.web_view_base.WebViewBase]
      Returns: New builder object
  */
  static WebViewBaseGidBuilder builder() nothrow
  {
    return new WebViewBaseGidBuilder;
  }
}

/// Fluent builder implementation template for [webkit.web_view_base.WebViewBase]
class WebViewBaseGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [webkit.web_view_base.WebViewBase]
final class WebViewBaseGidBuilder : WebViewBaseGidBuilderImpl!WebViewBaseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebViewBase build() nothrow
  {
    return new WebViewBase(cast(void*)createGObject(WebViewBase._getGType), No.Take);
  }
}
