/// Module for [Layout] class
module adw.layout;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.widget;

/**
    An individual layout in [adw.multi_layout_view.MultiLayoutView].
*/
class Layout : gobject.object.ObjectWrap, gtk.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_layout_get_type != &gidSymbolNotFound ? adw_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Layout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.layout.Layout]
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
  @property gtk.widget.Widget content() nothrow
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
      Creates a new [adw.layout.Layout] that contains content.
  
      Params:
        content = the content widget to use
      Returns: a new [adw.layout.Layout]
  */
  this(gtk.widget.Widget content) nothrow
  {
    AdwLayout* _cretval;
    _cretval = adw_layout_new(content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the content widget.
      Returns: The content
  */
  gtk.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_layout_get_content(cast(AdwLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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

/// Fluent builder implementation template for [adw.layout.Layout]
class LayoutGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `content` property.
      Params:
        propval = The content widget.
      Returns: Builder instance for fluent chaining
  */
  T content(gtk.widget.Widget propval) nothrow
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

/// Fluent builder for [adw.layout.Layout]
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
