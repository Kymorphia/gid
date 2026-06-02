/// Module for [StatusPage] class
module adw.status_page;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.paintable;
import gid.gid;
import gobject.gid_builder;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_status_page_get_type != &gidSymbolNotFound ? adw_status_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.status_page.StatusPage]
      Returns: New builder object
  */
  static StatusPageGidBuilder builder() nothrow
  {
    return new StatusPageGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `description` property.
      Returns: The description markup to be displayed below the title.
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description markup to be displayed below the title.
  */
  @property void description(string propval) nothrow
  {
    setDescription(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon to be used.
        
        Changing this will set [adw.status_page.StatusPage.paintable] to `NULL`.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to be used.
          
          Changing this will set [adw.status_page.StatusPage.paintable] to `NULL`.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `paintable` property.
      Returns: The paintable to be used.
        
        Changing this will set [adw.status_page.StatusPage.iconName] to `NULL`.
  */
  @property gdk.paintable.Paintable paintable() nothrow
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The paintable to be used.
          
          Changing this will set [adw.status_page.StatusPage.iconName] to `NULL`.
  */
  @property void paintable(gdk.paintable.Paintable propval) nothrow
  {
    setPaintable(propval);
  }

  /**
      Get `title` property.
      Returns: The title to be displayed below the icon.
        
        It is not parsed as Pango markup.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title to be displayed below the icon.
          
          It is not parsed as Pango markup.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [adw.status_page.StatusPage].
      Returns: the newly created [adw.status_page.StatusPage]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_status_page_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild() nothrow
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
  string getDescription() nothrow
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
  string getIconName() nothrow
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
  gdk.paintable.Paintable getPaintable() nothrow
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
  string getTitle() nothrow
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
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    adw_status_page_set_child(cast(AdwStatusPage*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description markup for self.
      
      The description is displayed below the title. It is parsed as Pango markup.
  
      Params:
        description = the description
  */
  void setDescription(string description = null) nothrow
  {
    const(char)* _description = description.toCString(No.Alloc);
    adw_status_page_set_description(cast(AdwStatusPage*)this._cPtr, _description);
  }

  /**
      Sets the icon name for self.
      
      Changing this will set [adw.status_page.StatusPage.paintable] to `NULL`.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_status_page_set_icon_name(cast(AdwStatusPage*)this._cPtr, _iconName);
  }

  /**
      Sets the paintable for self.
      
      Changing this will set [adw.status_page.StatusPage.iconName] to `NULL`.
  
      Params:
        paintable = the paintable
  */
  void setPaintable(gdk.paintable.Paintable paintable = null) nothrow
  {
    adw_status_page_set_paintable(cast(AdwStatusPage*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the title for self.
      
      The title is displayed below the icon. It is not parsed as Pango markup.
  
      Params:
        title = the title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_status_page_set_title(cast(AdwStatusPage*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [adw.status_page.StatusPage]
class StatusPageGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `description` property.
      Params:
        propval = The description markup to be displayed below the title.
      Returns: Builder instance for fluent chaining
  */
  T description(string propval) nothrow
  {
    return setProperty("description", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to be used.
          
          Changing this will set [adw.status_page.StatusPage.paintable] to `NULL`.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `paintable` property.
      Params:
        propval = The paintable to be used.
          
          Changing this will set [adw.status_page.StatusPage.iconName] to `NULL`.
      Returns: Builder instance for fluent chaining
  */
  T paintable(gdk.paintable.Paintable propval) nothrow
  {
    return setProperty("paintable", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title to be displayed below the icon.
          
          It is not parsed as Pango markup.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [adw.status_page.StatusPage]
final class StatusPageGidBuilder : StatusPageGidBuilderImpl!StatusPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StatusPage build() nothrow
  {
    return new StatusPage(cast(void*)createGObject(StatusPage._getGType), No.Take);
  }
}
