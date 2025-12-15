/// Module for [SqueezerPage] class
module adw.squeezer_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.widget;

/**
    An auxiliary class used by `class@Squeezer`.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
class SqueezerPage : gobject.object.ObjectWrap
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
    return cast(void function())adw_squeezer_page_get_type != &gidSymbolNotFound ? adw_squeezer_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqueezerPage self()
  {
    return this;
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
  @property bool enabled()
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
  @property void enabled(bool propval)
  {
    return setEnabled(propval);
  }

  /**
      Returns the squeezer child to which self belongs.
      Returns: the child to which self belongs
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gtk.widget.Widget getChild()
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
  bool getEnabled()
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
  void setEnabled(bool enabled)
  {
    adw_squeezer_page_set_enabled(cast(AdwSqueezerPage*)this._cPtr, enabled);
  }
}
