/// Module for [SqueezerPage] class
module adw.squeezer_page;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.widget;

/**
    An auxiliary class used by [adw.squeezer.Squeezer].

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
class SqueezerPage : gobject.object.ObjectWrap
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
    return cast(void function())adw_squeezer_page_get_type != &gidSymbolNotFound ? adw_squeezer_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqueezerPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.squeezer_page.SqueezerPage]
      Returns: New builder object
  */
  static SqueezerPageGidBuilder builder() nothrow
  {
    return new SqueezerPageGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The the squeezer child to which the page belongs.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Get `enabled` property.
      Returns: Whether the child is enabled.
        
        If a child is disabled, it will be ignored when looking for the child
        fitting the available size best.
        
        This allows to programmatically and prematurely hide a child even if it
        fits in the available space.
        
        This can be used e.g. to ensure a certain child is hidden below a certain
        window width, or any other constraint you find suitable.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property bool enabled() nothrow
  {
    return getEnabled();
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether the child is enabled.
          
          If a child is disabled, it will be ignored when looking for the child
          fitting the available size best.
          
          This allows to programmatically and prematurely hide a child even if it
          fits in the available space.
          
          This can be used e.g. to ensure a certain child is hidden below a certain
          window width, or any other constraint you find suitable.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void enabled(bool propval) nothrow
  {
    setEnabled(propval);
  }

  /**
      Returns the squeezer child to which self belongs.
      Returns: the child to which self belongs
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_squeezer_page_get_child(cast(AdwSqueezerPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self is enabled.
      Returns: whether self is enabled
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_squeezer_page_get_enabled(cast(AdwSqueezerPage*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self is enabled.
      
      If a child is disabled, it will be ignored when looking for the child
      fitting the available size best.
      
      This allows to programmatically and prematurely hide a child even if it fits
      in the available space.
      
      This can be used e.g. to ensure a certain child is hidden below a certain
      window width, or any other constraint you find suitable.
  
      Params:
        enabled = whether self is enabled
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setEnabled(bool enabled) nothrow
  {
    adw_squeezer_page_set_enabled(cast(AdwSqueezerPage*)this._cPtr, enabled);
  }
}

/// Fluent builder implementation template for [adw.squeezer_page.SqueezerPage]
class SqueezerPageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The the squeezer child to which the page belongs.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether the child is enabled.
          
          If a child is disabled, it will be ignored when looking for the child
          fitting the available size best.
          
          This allows to programmatically and prematurely hide a child even if it
          fits in the available space.
          
          This can be used e.g. to ensure a certain child is hidden below a certain
          window width, or any other constraint you find suitable.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T enabled(bool propval) nothrow
  {
    return setProperty("enabled", propval);
  }
}

/// Fluent builder for [adw.squeezer_page.SqueezerPage]
final class SqueezerPageGidBuilder : SqueezerPageGidBuilderImpl!SqueezerPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SqueezerPage build() nothrow
  {
    return new SqueezerPage(cast(void*)createGObject(SqueezerPage._getGType), No.Take);
  }
}
