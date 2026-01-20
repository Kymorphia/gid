/// Module for [LeafletPage] class
module adw.leaflet_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.widget;

/**
    An auxiliary class used by `class@Leaflet`.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
*/
class LeafletPage : gobject.object.ObjectWrap
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
    return cast(void function())adw_leaflet_page_get_type != &gidSymbolNotFound ? adw_leaflet_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LeafletPage self()
  {
    return this;
  }

  /**
      Get `name` property.
      Returns: The name of the child page.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property string name()
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the child page.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void name(string propval)
  {
    return setName(propval);
  }

  /**
      Get `navigatable` property.
      Returns: Whether the child can be navigated to when folded.
        
        If `FALSE`, the child will be ignored by
        [adw.leaflet.Leaflet.getAdjacentChild], [adw.leaflet.Leaflet.navigate], and swipe
        gestures.
        
        This can be used used to prevent switching to widgets like separators.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool navigatable()
  {
    return getNavigatable();
  }

  /**
      Set `navigatable` property.
      Params:
        propval = Whether the child can be navigated to when folded.
          
          If `FALSE`, the child will be ignored by
          [adw.leaflet.Leaflet.getAdjacentChild], [adw.leaflet.Leaflet.navigate], and swipe
          gestures.
          
          This can be used used to prevent switching to widgets like separators.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void navigatable(bool propval)
  {
    return setNavigatable(propval);
  }

  /**
      Gets the leaflet child to which self belongs.
      Returns: the child to which self belongs
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_leaflet_page_get_child(cast(AdwLeafletPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of self.
      Returns: the name of self.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = adw_leaflet_page_get_name(cast(AdwLeafletPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the child can be navigated to when folded.
      Returns: whether self can be navigated to when folded
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getNavigatable()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_page_get_navigatable(cast(AdwLeafletPage*)this._cPtr);
    return _retval;
  }

  /**
      Sets the name of the self.
  
      Params:
        name = the new value to set
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_leaflet_page_set_name(cast(AdwLeafletPage*)this._cPtr, _name);
  }

  /**
      Sets whether self can be navigated to when folded.
      
      If `FALSE`, the child will be ignored by [adw.leaflet.Leaflet.getAdjacentChild],
      [adw.leaflet.Leaflet.navigate], and swipe gestures.
      
      This can be used used to prevent switching to widgets like separators.
  
      Params:
        navigatable = whether self can be navigated to when folded
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setNavigatable(bool navigatable)
  {
    adw_leaflet_page_set_navigatable(cast(AdwLeafletPage*)this._cPtr, navigatable);
  }
}
