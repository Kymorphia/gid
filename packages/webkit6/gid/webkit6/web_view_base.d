/// Module for [WebViewBase] class
module gid.webkit6.web_view_base;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/** */
class WebViewBase : gid.gtk4.widget.Widget
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
    return cast(void function())webkit_web_view_base_get_type != &gidSymbolNotFound ? webkit_web_view_base_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebViewBase";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebViewBase self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.web_view_base.WebViewBase]
      Returns: New builder object
  */
  static WebViewBaseGidBuilder builder() nothrow
  {
    return new WebViewBaseGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.webkit6.web_view_base.WebViewBase]
class WebViewBaseGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.webkit6.web_view_base.WebViewBase]
final class WebViewBaseGidBuilder : WebViewBaseGidBuilderImpl!WebViewBaseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebViewBase build() nothrow
  {
    return new WebViewBase(cast(void*)createGObject(WebViewBase._getGType), Yes.Take);
  }
}
