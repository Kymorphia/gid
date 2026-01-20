/// Module for [StatusPage] class
module adw.status_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.paintable;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A page used for empty/error states and similar use-cases.
    
    <picture>
      <source srcset="status-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="status-page.png" alt="status-page">
    </picture>
    
    The [adw.status_page.StatusPage] widget can have an icon, a title, a description and a
    custom widget which is displayed below them.
    
    ## CSS nodes
    
    [adw.status_page.StatusPage] has a main CSS node with name `statuspage`.
    
    [adw.status_page.StatusPage] can use the
    [`.compact`](style-classes.html#compact-status-page) style class for when it
    needs to fit into a small space such a sidebar or a popover.
*/
class StatusPage : gtk.widget.Widget
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
    return cast(void function())adw_status_page_get_type != &gidSymbolNotFound ? adw_status_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusPage self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `description` property.
      Returns: The description markup to be displayed below the title.
  */
  @property string description()
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description markup to be displayed below the title.
  */
  @property void description(string propval)
  {
    return setDescription(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon to be used.
        
        Changing this will set `property@StatusPage:paintable` to `NULL`.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to be used.
          
          Changing this will set `property@StatusPage:paintable` to `NULL`.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `paintable` property.
      Returns: The paintable to be used.
        
        Changing this will set `property@StatusPage:icon-name` to `NULL`.
  */
  @property gdk.paintable.Paintable paintable()
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The paintable to be used.
          
          Changing this will set `property@StatusPage:icon-name` to `NULL`.
  */
  @property void paintable(gdk.paintable.Paintable propval)
  {
    return setPaintable(propval);
  }

  /**
      Get `title` property.
      Returns: The title to be displayed below the icon.
        
        It is not parsed as Pango markup.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title to be displayed below the icon.
          
          It is not parsed as Pango markup.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new [adw.status_page.StatusPage].
      Returns: the newly created [adw.status_page.StatusPage]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_status_page_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_status_page_get_child(cast(AdwStatusPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the description markup for self.
      Returns: the description
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = adw_status_page_get_description(cast(AdwStatusPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_status_page_get_icon_name(cast(AdwStatusPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the paintable for self.
      Returns: the paintable
  */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = adw_status_page_get_paintable(cast(AdwStatusPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title for self.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_status_page_get_title(cast(AdwStatusPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_status_page_set_child(cast(AdwStatusPage*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description markup for self.
      
      The description is displayed below the title. It is parsed as Pango markup.
  
      Params:
        description = the description
  */
  void setDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
    adw_status_page_set_description(cast(AdwStatusPage*)this._cPtr, _description);
  }

  /**
      Sets the icon name for self.
      
      Changing this will set `propertyStatusPage:paintable` to `NULL`.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_status_page_set_icon_name(cast(AdwStatusPage*)this._cPtr, _iconName);
  }

  /**
      Sets the paintable for self.
      
      Changing this will set `propertyStatusPage:icon-name` to `NULL`.
  
      Params:
        paintable = the paintable
  */
  void setPaintable(gdk.paintable.Paintable paintable = null)
  {
    adw_status_page_set_paintable(cast(AdwStatusPage*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the title for self.
      
      The title is displayed below the icon. It is not parsed as Pango markup.
  
      Params:
        title = the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_status_page_set_title(cast(AdwStatusPage*)this._cPtr, _title);
  }
}
