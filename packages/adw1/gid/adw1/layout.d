/// Module for [Layout] class
module gid.adw1.layout;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.widget;

/**
    An individual layout in [gid.adw1.multi_layout_view.MultiLayoutView].
*/
class Layout : gid.gobject2.object.ObjectWrap, gid.gtk4.buildable.Buildable
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
    return cast(void function())adw_layout_get_type != &gidSymbolNotFound ? adw_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override Layout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.layout.Layout]
      Returns: New builder object
  */
  static LayoutGidBuilder builder() nothrow
  {
    return new LayoutGidBuilder;
  }

  /**
      Get `content` property.
      Returns: The content widget.
  */
  @property gid.gtk4.widget.Widget content() nothrow
  {
    return getContent();
  }

  /**
      Get `name` property.
      Returns: The name of the layout.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the layout.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new [gid.adw1.layout.Layout] that contains content.
  
      Params:
        content = the content widget to use
      Returns: a new [gid.adw1.layout.Layout]
  */
  this(gid.gtk4.widget.Widget content) nothrow
  {
    AdwLayout* _cretval;
    _cretval = adw_layout_new(content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the content widget.
      Returns: The content
  */
  gid.gtk4.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_layout_get_content(cast(AdwLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the layout.
      Returns: the name of the layout
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_layout_get_name(cast(AdwLayout*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the name of the layout.
  
      Params:
        name = the layout name
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    adw_layout_set_name(cast(AdwLayout*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.adw1.layout.Layout]
class LayoutGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `content` property.
      Params:
        propval = The content widget.
      Returns: Builder instance for fluent chaining
  */
  T content(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("content", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the layout.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }
}

/// Fluent builder for [gid.adw1.layout.Layout]
final class LayoutGidBuilder : LayoutGidBuilderImpl!LayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Layout build() nothrow
  {
    return new Layout(cast(void*)createGObject(Layout._getGType), Yes.Take);
  }
}
